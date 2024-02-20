#!/usr/bin/python3
import argparse
from enum import Enum
from io import BufferedReader, BytesIO
import io
import os
from pathlib import Path
from common import auto_int, get_short, get_int, write_int
from map_common import getMapConfig, writeMapConfig
from unlz import extract
import json
from typing import List, Tuple


class MapType(Enum):
    BOUNDARY = 0
    ELEVATION = 1
    COVER = 2
    EVENT = 3


class WallSegment:
    def __init__(
        self, isAltSeg: bool = False, index: int = 0, param: int = 0, param2: int = 0
    ) -> None:
        self.gridIndex = f"0x{index:X}"
        if isAltSeg:
            self.param1 = param
            self.param2 = param2
        else:
            self.parameterIndex = param

    def toJson(self) -> str:
        return json.dumps(self, default=lambda o: o.__dict__, indent=4)


class WallParameter:
    def __init__(self, mapType: MapType, param: int, isOnline: bool = False) -> None:
        z = param & 0xFF
        attr = (param >> 8) & 0xFF
        rg = (param >> 16) & 0xFF
        sp = (param >> 24) & 0xFF
        self.z = z
        self.height = rg
        self.shape = sp
        if mapType == MapType.BOUNDARY:
            self.id = attr & 0x7F
            if attr & 0x80 != 0:
                self.canDisable = True
        elif mapType == MapType.EVENT:
            if attr == 0:
                self.ignore = True
            elif attr >= 0x1 and attr <= 0xF:
                self.exitIndex = attr - 1
            elif attr >= 0x10 and attr <= 0x2F:
                self.flagIndex = attr - 0x10
            elif attr >= 0x30 and attr <= 33:
                self.rushIndex = attr - 0x30
            elif attr == 0x3C:
                self.isShade = True
            elif attr >= 0x40 and attr <= 0x58:
                if isOnline:
                    if attr >= 0x48 and attr <= 0x4F:
                        self.roadIndex = attr - 0x48
                    else:
                        self.attribute = attr
                else:
                    self.jackInIndex = attr - 0x40
            elif attr >= 0x60 and attr <= 0xCF:
                if isOnline:
                    self.mapEventIndex = attr - 0x60
                else:
                    self.attribute = attr
            elif attr >= 0xD0 and attr <= 0xEF:
                if isOnline:
                    self.ghostIndex = attr - 0xD0
                else:
                    self.attribute = attr
            elif attr >= 0xF0:
                self.textIndex = attr - 0xF0
            else:
                self.attribute = attr
        else:
            self.attribute = attr

    def toJson(self) -> str:
        return json.dumps(self, default=lambda o: o.__dict__, indent=4)


class MapData:
    def __init__(self) -> None:
        pass

    def addSegmentSection(self):
        self.segments: List[WallSegment] = []

    def addParameterSection(self):
        self.parameters: List[WallParameter] = []

    def addMapType(self, mapType: int = 1):
        self.mapType: int = mapType

    def addSegment(self, wallSegment: WallSegment):
        if not hasattr(self, "segments"):
            self.addSegmentSection()
        self.segments.append(wallSegment)

    def addParameter(self, wallParameter: WallParameter):
        if not hasattr(self, "parameters"):
            self.addParameterSection()
        self.parameters.append(wallParameter)

    def toJson(self) -> str:
        return json.dumps(self, default=lambda o: o.__dict__, indent=4)


def readMapData(
    mapType: MapType, outBuffer: BytesIO, offset: int, assumedSize: int
) -> Tuple[int, MapData]:
    outBuffer.seek(offset)
    start = outBuffer.tell()
    segCount = get_int(outBuffer)
    assumedSize -= 4
    mapData: MapData = MapData()
    if assumedSize > 0:
        mapData.addSegmentSection()
        altSeg = False
        segStart = outBuffer.tell()
        outBuffer.seek(segCount * 4, os.SEEK_CUR)
        val1 = get_short(outBuffer)
        if val1 != 0xFFFF:
            outBuffer.seek(segCount * 2 - 2, os.SEEK_CUR)
            val1 = get_int(outBuffer)
            val2 = get_short(outBuffer)
            if val1 == 0xFFFFFFFF and val2 == 0xFFFF:
                altSeg = True
            else:
                exit("Unknown map format.")
        if altSeg:
            mapData.addMapType(2)
        outBuffer.seek(segStart)
        paramOff = (segCount + 1) * 2 * (3 if altSeg else 2)
        for _ in range(segCount):
            index = get_short(outBuffer)
            param1 = get_short(outBuffer)
            assumedSize -= 4
            if altSeg:
                param2 = get_short(outBuffer)
                assumedSize -= 2
                mapData.addSegment(WallSegment(altSeg, index, param1, param2))
            else:
                mapData.addSegment(WallSegment(altSeg, index, (param1 - paramOff) >> 2))
        get_short(outBuffer)  # null wall segment
        assumedSize -= 2
        if altSeg:
            get_int(outBuffer)  # continued null wall segment
            assumedSize -= 4
        else:
            get_short(outBuffer)  # pointer to param end
            assumedSize -= 2
        if assumedSize > 0:
            mapData.addParameterSection()
        while assumedSize > 0:
            param = get_int(outBuffer)
            assumedSize -= 4
            if param == 0xFFFFFFFF:
                break
            mapData.addParameter(WallParameter(mapType, param))
    end = outBuffer.tell()
    size = end - start
    if size == 4:
        size = 0
    return (size, mapData)


def unpackMap(
    inFile: BufferedReader, offset: int, dirName: Path, dumpRawMapData: bool = False
):
    outBound = dirName / "boundary.json"
    outElevation = dirName / "elevation.json"
    outCover = dirName / "cover.json"
    outEvent = dirName / "event.json"
    dirName.mkdir(exist_ok=True, parents=True)
    inFile.seek(offset)
    offsetBoundary = get_int(inFile)
    offsetElevation = get_int(inFile)
    offsetCover = get_int(inFile)
    offsetEvent = get_int(inFile)
    outBuffer = extract(inFile)
    cur = outBuffer.tell()
    outBuffer.seek(0, io.SEEK_END)
    offsetEnd = outBuffer.tell()
    outBuffer.seek(cur)
    if dumpRawMapData:
        outBin = dirName / "mapdata_extracted.scbin"
        with open(outBin, "wb") as outBin:
            write_int(outBin, offsetBoundary)
            write_int(outBin, offsetElevation)
            write_int(outBin, offsetCover)
            write_int(outBin, offsetEvent)
            outBin.write(outBuffer.getbuffer())
    sizeBoundary, boundaryData = readMapData(
        MapType.BOUNDARY, outBuffer, offsetBoundary, offsetElevation - offsetBoundary
    )
    sizeElevation, elevationData = readMapData(
        MapType.ELEVATION, outBuffer, offsetElevation, offsetCover - offsetElevation
    )
    sizeCover, coverData = readMapData(
        MapType.COVER, outBuffer, offsetCover, offsetEvent - offsetCover
    )
    sizeEvent, eventData = readMapData(
        MapType.EVENT, outBuffer, offsetEvent, offsetEnd - offsetEvent
    )
    files = [
        [sizeBoundary, outBound, boundaryData],
        [sizeElevation, outElevation, elevationData],
        [sizeCover, outCover, coverData],
        [sizeEvent, outEvent, eventData],
    ]
    config = getMapConfig(dirName)
    config["scb"] = {}
    for size, path, data in files:
        if size > 0:
            with open(path, "w") as outBF:
                outBF.write(data.toJson())
            config["scb"][path.stem] = path.name
    writeMapConfig(dirName, config)


def unpack_all(inPath):
    mapDict: dict[str, dict[str, List[int]]] = {
        "offline": {
            "ACDC_Elementary": [
                0x56A038,
                0x56AAD4,
                0x56B55C,
                0x56C38C,
                0x56C880,
                0x56D314,
                0x56DD8C,
                0x56E684,
                0x56E94C,
                0x56EEA0,
                0x56F084,
                0x56F604,
                0x5707EC,
            ],
            "ACDC_Town": [
                0x570A60,
                0x574080,
                0x574A2C,
                0x5751D0,
                0x5754A8,
                0x575C98,
                0x5761A8,
                0x57663C,
                0x576C60,
                0x577280,
                0x577770,
            ],
            "Govt_Complex": [
                0x57793C,
                0x578BB8,
                0x578FB0,
                0x57A3B0,
                0x57B814,
                0x57C4A0,
                0x57D2A8,
                0x57DAA8,
                0x57E6DC,
                0x57E994,
            ],
            "DenTown": [
                0x57F160,
                0x581924,
                0x581D30,
                0x583404,
                0x584CC0,
                0x5864D0,
                0x587ACC,
                0x587E00,
            ],
            "SciLab": [
                0x58853C,
                0x588C00,
                0x58A988,
                0x58AFF0,
                0x58B330,
                0x58BCB0,
            ],
            "WWW_Base": [
                0x58BFF8,
                0x58D42C,
                0x58DCA8,
                0x58E4D4,
                0x58EAA4,
                0x58F058,
            ],
        },
        "online": {
            "SchoolComp": [
                0x58F5C8,
                0x590FF8,
                0x593D9C,
                0x5949D8,
                0x595F10,
            ],
            "OvenComp": [
                0x596C9C,
                0x5985C4
            ],
            "WaterworksComp": [
                0x599A28,
                0x59BD44,
                0x59EBA0,
                0x5A427C,
                0x5A9F50,
                0x5B1478,
            ],
            "TrafficLight_Comp": [
                0x5B64D0,
                0x5B82F4,
                0x5BA740,
                0x5BE13C,
                0x5C05DC,
            ],
            "Power_Plant_Comp": [
                0x5C2A2C,
                0x5C7B08,
                0x5C9FF8,
                0x5CD228,
            ],
            "WWW_Comp": [
                0x5CFF6C,
                0x5D1B54,
                0x5D57A8,
                0x5D9F4C,
                0x5DB4A8,
                0x5DE704,
            ],
            "ACDC_HP": [
                0x5DED58,
                0x5DEFE4,
                0x5E0C24,
                0x5E1C18,
            ],
            "Govt_Complex_HP": [
                0x5E22A8,
                0x5E27D8
            ],
            "DenTown_HP": [
                0x5E2F20,
            ],
            "Govt_Complex_HP_2": [
                0x5E384C,
            ],
            "Other": [
                0x5E41F8,
            ],
            "Internet": [
                0x5E4604,
                0x5E774C,
                0x5ED608,
                0x5F1E54,
                0x5F5548,
                0x5F8100,
                0x5FA53C,
                0x5FCB14,
                0x5FFEE0,
                0x6017A8,
                0x604AB4,
                0x6074E0,
                0x609B64,
                0x60AD44,
                0x60DE5C,
                0x6109C0,
            ],
        },
    }
    sortList = []
    for loc in mapDict.keys():
        locationDir = Path.cwd() / loc
        for area in mapDict[loc].keys():
            outFolder = locationDir / area
            for offset in mapDict[loc][area]:
                if offset == 0x5E41F8:
                    dirBase = outFolder / "Generic"
                else:
                    dirBase = outFolder / f"map_{offset:X}"
                unpackMap(inPath, offset, dirBase)
                sortList.append([offset, dirBase.with_suffix(".scb")])
    sortList.sort(key=lambda x: x[0])
    with open("sortlist_scb.txt", "w") as outSort:
        for off, name in sortList:
            outSort.write(f'    .incbin "{name}" @ 0x{off:X}\n')


def main():
    parser = argparse.ArgumentParser(description="Extracts maps.")
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset to the map.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    with open(inPath, "rb") as inFile:
        unpack_all(inFile)
    # with open(inPath, 'rb') as inFile:
    #     unpackMap(inFile, args.offset, Path.cwd() / f"map_{args.offset:X}")


if __name__ == "__main__":
    main()
