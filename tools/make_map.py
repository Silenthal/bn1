#!/usr/bin/python3
import argparse
from enum import Enum
import io
import os
from pathlib import Path
from common import auto_int, write_byte, write_int, write_short
from lz import compress
import json


class MapType(Enum):
    BOUNDARY = 0
    ELEVATION = 1
    COVER = 2
    EVENT = 3

def writeMapData(outputBuffer: io.BytesIO, mapFile: Path):
    start = outputBuffer.tell()
    if mapFile.exists():
        with open(mapFile, 'r') as inFile:
            mp = json.load(inFile)
            szSeg = len(mp["segments"]) if "segments" in mp else 0
            szPm = len(mp["parameters"]) if "parameters" in mp else 0
            mapType = int(mp["mapType"]) if "mapType" in mp else 1
            segSize = 3 if mapType == 2 else 2
            write_int(outputBuffer, szSeg)
            if "segments" in mp:
                paramOff = (szSeg + 1) * 2 * segSize
                for i in range(szSeg):
                    gi = auto_int(mp["segments"][i]["gridIndex"])
                    write_short(outputBuffer, gi)
                    if mapType == 2:
                        p1 = int(mp["segments"][i]["param1"])
                        p2 = int(mp["segments"][i]["param2"])
                        write_short(outputBuffer, p1)
                        write_short(outputBuffer, p2)
                    else:
                        pi = int(mp["segments"][i]["parameterIndex"])
                        write_short(outputBuffer, pi * 4 + paramOff)
                write_short(outputBuffer, -1)
                if mapType == 2:
                    write_int(outputBuffer, -1) 
                else:
                    lastpi = paramOff + (szPm) * 4
                    write_short(outputBuffer, lastpi)
            if "parameters" in mp:
                attrOff = {
                    "attribute": 0,
                    "exitIndex": 1,
                    "flagIndex": 0x10,
                    "rushIndex": 0x30,
                    "roadIndex": 0x48,
                    "jackInIndex": 0x40,
                    "mapEventIndex": 0x60,
                    "ghostIndex": 0xD0,
                    "textIndex": 0xF0
                }
                for j in range(szPm):
                    z = int(mp["parameters"][j]["z"])
                    height = int(mp["parameters"][j]["height"])
                    shape = int(mp["parameters"][j]["shape"])
                    attr = 0
                    if "id" in mp["parameters"][j]:
                        attr = int(mp["parameters"][j]["id"])
                    if "canDisable" in mp["parameters"][j]:
                        if bool(mp["parameters"][j]["canDisable"]):
                            attr |= 0x80
                    if "ignore" in mp["parameters"][j]:
                        attr = 0
                    elif "isShade" in mp["parameters"][j]:
                        attr = 0x3C
                    else:
                        for key in attrOff.keys():
                            if key in mp["parameters"][j]:
                                attr = int(mp["parameters"][j][key]) + attrOff[key]
                    write_byte(outputBuffer, z)
                    write_byte(outputBuffer, attr)
                    write_byte(outputBuffer, height)
                    write_byte(outputBuffer, shape)
                write_int(outputBuffer, -1)
    end = outputBuffer.tell()
    size = end - start
    if size == 0:
        write_int(outputBuffer, 0)
        size = 4
    return size


def packMap(outPath: Path, dumpRawMapData: bool = False):
    print(f"Packing {outPath}")
    base, _ = os.path.splitext(outPath)
    fileBoundary = (Path(base) / "boundary.json").resolve()
    fileElevation = (Path(base) / "elevation.json").resolve()
    fileCover = (Path(base) / "cover.json").resolve()
    fileEvent = (Path(base) / "event.json").resolve()
    outputBuffer = io.BytesIO()
    bound = writeMapData(outputBuffer, fileBoundary)
    eleva = writeMapData(outputBuffer, fileElevation)
    cover = writeMapData(outputBuffer, fileCover)
    _ = writeMapData(outputBuffer, fileEvent)
    sz = outputBuffer.tell()
    outputBuffer.seek(0)
    comp = compress(list(outputBuffer.read()), sz)
    outputBuffer.seek(0)
    if dumpRawMapData:
        with open(base + "_precomp.scbin", 'wb') as outBin:
            write_int(outBin, 0)
            write_int(outBin, bound)
            write_int(outBin, bound + eleva)
            write_int(outBin, bound + eleva + cover)
            outBin.write(outputBuffer.getbuffer())
    with open(base + ".scb", 'wb') as outFile:
        write_int(outFile, 0)
        write_int(outFile, bound)
        write_int(outFile, bound + eleva)
        write_int(outFile, bound + eleva + cover)
        outFile.write(bytes(comp))


def main():
    parser = argparse.ArgumentParser(description='Pack map data.')
    parser.add_argument('path', type=str, help='The path to the binary.')
    args = parser.parse_args()
    outPath = Path(args.path)
    base, outEx = os.path.splitext(outPath)
    if outEx == ".scb":
        packMap(Path(base))


if __name__=="__main__":
    main()
