#!/usr/bin/python3
import argparse
from enum import Enum
from io import BufferedReader, BytesIO
import io
import os
from pathlib import Path
from common import auto_int, get_short, get_int, write_int, exit_error
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
                    # if attr >= 0x48 and attr <= 0x4F:
                    #     self.roadIndex = attr - 0x48
                    # else:
                        self.attribute = f"0x{attr:X}" if attr != 0 else 0
                else:
                    self.jackInIndex = attr - 0x40
            elif attr >= 0x60 and attr <= 0xCF:
                # if isOnline:
                #     self.mapEventIndex = attr - 0x60
                # else:
                    self.attribute = f"0x{attr:X}" if attr != 0 else 0
            elif attr >= 0xD0 and attr <= 0xEF:
                if isOnline:
                    self.ghostIndex = attr - 0xD0
                else:
                    self.attribute = f"0x{attr:X}" if attr != 0 else 0
            elif attr >= 0xF0:
                self.textIndex = attr - 0xF0
            else:
                self.attribute = f"0x{attr:X}" if attr != 0 else 0
        else:
            self.attribute = f"0x{attr:X}" if attr != 0 else 0

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
    mapType: MapType, isOnline: bool, outBuffer: BytesIO, offset: int, assumedSize: int
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
                exit_error("Unknown map format.")
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
            mapData.addParameter(WallParameter(mapType, param, isOnline))
    end = outBuffer.tell()
    size = end - start
    if size == 4:
        size = 0
    return (size, mapData)


def unpackMap(
    inFile: BufferedReader, offset: int, dirName: Path, isOnline: bool = False, dumpRawMapData: bool = False
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
        MapType.BOUNDARY, isOnline, outBuffer, offsetBoundary, offsetElevation - offsetBoundary
    )
    sizeElevation, elevationData = readMapData(
        MapType.ELEVATION, isOnline, outBuffer, offsetElevation, offsetCover - offsetElevation
    )
    sizeCover, coverData = readMapData(
        MapType.COVER, isOnline, outBuffer, offsetCover, offsetEvent - offsetCover
    )
    sizeEvent, eventData = readMapData(
        MapType.EVENT, isOnline, outBuffer, offsetEvent, offsetEnd - offsetEvent
    )
    files: List[Tuple[int, Path, MapData]] = [
        (sizeBoundary, outBound, boundaryData),
        (sizeElevation, outElevation, elevationData),
        (sizeCover, outCover, coverData),
        (sizeEvent, outEvent, eventData),
    ]
    config = getMapConfig(dirName)
    config["scb"] = {}
    for size, path, data in files:
        if size > 0:
            if path.exists():
                with open(path, "r") as existing:
                    oldVal = ordered(json.load(existing))
                newVal = json.loads(data.toJson())
                if oldVal != newVal:
                    with open(path, "w") as outBF:
                        outBF.write(data.toJson())
            else:
                with open(path, "w") as outBF:
                    outBF.write(data.toJson())
            config["scb"][path.stem] = path.name
    writeMapConfig(dirName, config)


def ordered(obj):
    if isinstance(obj, dict):
        return sorted((k, ordered(v)) for k, v in obj.items())
    if isinstance(obj, list):
        return sorted(ordered(x) for x in obj)
    else:
        return obj

def unpack_all(inPath):
    mapDict: dict[str, dict[str, List[Tuple[str, int]]]] = {
        "offline": {
            "School": [
                ("School_Class_5A", 0x56A038),
                ("School_Class_5B", 0x56AAD4),
                ("School_Library", 0x56B55C),
                ("School_2F_Hallway", 0x56C38C),
                ("School_Class_1A", 0x56C880),
                ("School_Class_1B", 0x56D314),
                ("School_AV_Room", 0x56DD8C),
                ("School_Infirmary", 0x56E684),
                ("School_1F_Hallway", 0x56E94C),
                ("School_Cross_Hallway", 0x56EEA0),
                ("School_Storage", 0x56F084),
                ("School_Staff_Lounge", 0x56F604),
                ("School_Staff_Lounge_Hallway", 0x5707EC),
            ],
            "ACDC": [
                ("ACDC_Town", 0x570A60),
                ("ACDC_School_Gate", 0x574080),
                ("ACDC_Lan_Living_Room", 0x574A2C),
                ("ACDC_Lan_Room", 0x5751D0),
                ("ACDC_Mayl_Living_Room", 0x5754A8),
                ("ACDC_Mayl_Room", 0x575C98),
                ("ACDC_Dex_Room", 0x5761A8),
                ("ACDC_Yai_Room", 0x57663C),
                ("ACDC_Higsbys", 0x576C60),
                ("ACDC_Station", 0x577280),
                ("ACDC_Secret_Station", 0x577770),
            ],
            "Govt": [
                ("Govt_Complex_Front", 0x57793C),
                ("Govt_Complex_Station", 0x578BB8),
                ("Govt_Waterworks_Lobby", 0x578FB0),
                ("Govt_SciLab_Lobby", 0x57A3B0),
                ("Govt_Complex_Hallway", 0x57B814),
                ("Govt_Yuichiro_Lab", 0x57C4A0),
                ("Govt_Waterworks_Office", 0x57D2A8),
                ("Govt_Waterworks_Control_Room", 0x57DAA8),
                ("Govt_Waterworks_Pump_Room", 0x57E6DC),
                ("Govt_Waterworks_Purification_Room", 0x57E994),
            ],
            "DenTown": [
                ("DenTown_Center", 0x57F160),
                ("DenTown_Station", 0x581924),
                ("DenTown_Block_1", 0x581D30),
                ("DenTown_Block_2", 0x583404),
                ("DenTown_Block_3", 0x584CC0),
                ("DenTown_Block_4", 0x5864D0),
                ("DenTown_Miyu_Antiques", 0x587ACC),
                ("DenTown_Summer_School", 0x587E00),
            ],
            "SciLab": [
                ("SciLab_Restaurant_Hallway", 0x58853C),
                ("SciLab_Restaurant", 0x588C00),
                ("SciLab_Power_Plant_Hallway", 0x58A988),
                ("SciLab_Power_Plant", 0x58AFF0),
                ("SciLab_Power_Plant_Control_Room", 0x58B330),
                ("SciLab_Generator_Room", 0x58BCB0),
            ],
            "WWW": [
                ("WWW_Base", 0x58BFF8),
                ("WWW_Wily_Lab", 0x58D42C),
                ("WWW_Rocket_Hangar", 0x58DCA8),
                ("WWW_Passage_1", 0x58E4D4),
                ("WWW_Passage_2", 0x58EAA4),
                ("WWW_Passage_3", 0x58F058),
            ],
        },
        "online": {
            "School_Comp": [
                ("School_Comp_1", 0x58F5C8),
                ("School_Comp_2", 0x590FF8),
                ("School_Comp_3", 0x593D9C),
                ("School_Comp_4", 0x5949D8),
                ("School_Comp_5", 0x595F10),
            ],
            "Oven_Comp": [
                ("Oven_Comp_1", 0x596C9C),
                ("Oven_Comp_2", 0x5985C4)
            ],
            "Waterworks_Comp": [
                ("Waterworks_Comp_1", 0x599A28),
                ("Waterworks_Comp_2", 0x59BD44),
                ("Waterworks_Comp_3", 0x59EBA0),
                ("Waterworks_Comp_4", 0x5A427C),
                ("Waterworks_Comp_5", 0x5A9F50),
                ("Waterworks_Comp_6", 0x5B1478),
            ],
            "Traffic_Light_Comp": [
                ("Traffic_Light_Comp_1", 0x5B64D0),
                ("Traffic_Light_Comp_2", 0x5B82F4),
                ("Traffic_Light_Comp_3", 0x5BA740),
                ("Traffic_Light_Comp_4", 0x5BE13C),
                ("Traffic_Light_Comp_5", 0x5C05DC),
            ],
            "Power_Plant_Comp": [
                ("Power_Plant_Comp_1", 0x5C2A2C),
                ("Power_Plant_Comp_2", 0x5C7B08),
                ("Power_Plant_Comp_3", 0x5C9FF8),
                ("Power_Plant_Comp_4", 0x5CD228),
            ],
            "WWW_Comp": [
                ("WWW_Comp_1", 0x5CFF6C),
                ("WWW_Comp_2", 0x5D1B54),
                ("WWW_Comp_3", 0x5D57A8),
                ("WWW_Comp_4", 0x5D9F4C),
                ("WWW_Comp_5", 0x5DB4A8),
                ("Rocket_Comp", 0x5DE704),
            ],
            "ACDC_HP": [
                ("ACDC_Lan_PC", 0x5DED58),
                ("ACDC_Mayl_PC", 0x5DEFE4),
                ("ACDC_Yai_PC", 0x5E0C24),
                ("ACDC_Dex_PC", 0x5E1C18),
            ],
            "Govt_HP": [
                ("Govt_Yuichiro_PC", 0x5E22A8),
                ("Govt_Lunch_Cart_Comp", 0x5E27D8)
            ],
            "DenTown_HP": [
                ("DenTown_Antique_Comp", 0x5E2F20),
            ],
            "SciLab_HP": [
                ("SciLab_Fish_Stand_Comp", 0x5E384C),
            ],
            "Other_Comp": [
                ("Other_Generic_Comp", 0x5E41F8),
            ],
            "Internet": [
                ("Internet_1", 0x5E4604),
                ("Internet_2", 0x5E774C),
                ("Internet_3", 0x5ED608),
                ("Internet_4", 0x5F1E54),
                ("Undernet_1", 0x5F5548),
                ("Undernet_2", 0x5F8100),
                ("Undernet_3", 0x5FA53C),
                ("Undernet_4", 0x5FCB14),
                ("Undernet_5", 0x5FFEE0),
                ("Undernet_6", 0x6017A8),
                ("Undernet_7", 0x604AB4),
                ("Undernet_8", 0x6074E0),
                ("Undernet_9", 0x609B64),
                ("Undernet_10", 0x60AD44),
                ("Undernet_11", 0x60DE5C),
                ("Undernet_12", 0x6109C0),
            ],
        },
    }
    sortList = []
    for loc in mapDict.keys():
        locationDir = Path.cwd() / ".." / "assets" / "data" / "maps" / loc
        for area in mapDict[loc].keys():
            outFolder = locationDir
            for name, offset in mapDict[loc][area]:
                dirBase = outFolder / name
                unpackMap(inPath, offset, dirBase, loc == "online")
                sortList.append([offset, dirBase.with_suffix(".scb")])
    sortList.sort(key=lambda x: x[0])
    with open("sortlist_scb.txt", "w") as outSort:
        for off, name in sortList:
            outSort.write(f'    .incbin "{name}" @ 0x{off:X}\n')


def main():
    parser = argparse.ArgumentParser(description="Extracts maps.")
    parser.add_argument(
        "-o", "--offset", type=auto_int, help="The offset to the map."
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    with open(inPath, "rb") as inFile:
        if args.offset:
            unpackMap(inFile, args.offset, Path.cwd() / f"map_{args.offset:X}")
        else:
            unpack_all(inFile)


if __name__ == "__main__":
    main()
