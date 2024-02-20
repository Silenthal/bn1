#!/usr/bin/python3
import argparse
import io
from pathlib import Path
from typing import List, Optional, Tuple
from common import auto_int, write_byte, write_int, write_short
from lz import compress
import json
from make_tiles import (
    make_meta_tile_list,
    make_tile_list,
    parse_png,
    parse_rgbx,
    parse_pal,
    make_palette_bin,
)
from common_archive import TilemapHeader, TilesetHeader
from map_common import getMapConfig


def writeMapData(outputBuffer: io.BytesIO, mapFile: Optional[Path]):
    start = outputBuffer.tell()
    if mapFile and mapFile.exists():
        with open(mapFile, "r") as inFile:
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
                    "textIndex": 0xF0,
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


def packScb(outPath: Path):
    # Within a map folder, there should be a config file
    config = getMapConfig(outPath)
    if "scb" not in config:
        return
    sizeList: List[int] = []
    outputBuffer = io.BytesIO()
    for key in ["boundary", "elevation", "cover", "event"]:
        path: Optional[Path] = None
        if key in config["scb"]:
            path = Path(outPath / config["scb"][key])
        sizeList.append(writeMapData(outputBuffer, path))
    sz = outputBuffer.tell()
    outputBuffer.seek(0)
    comp = compress(list(outputBuffer.read()), sz)
    outputBuffer.seek(0)
    off0 = 0
    off1 = sizeList[0]
    off2 = sizeList[0] + sizeList[1]
    off3 = sizeList[0] + sizeList[1] + sizeList[2]
    with open(outPath.with_suffix(".scb"), "wb") as outFile:
        write_int(outFile, off0)
        write_int(outFile, off1)
        write_int(outFile, off2)
        write_int(outFile, off3)
        outFile.write(bytes(comp))


def packTilemap(outPath: Path):
    config = getMapConfig(outPath)
    if "tilemap" not in config:
        return
    if "width" not in config:
        exit("Map layout doesn't have a width")
    if "height" not in config:
        exit("Map layout doesn't have a height")
    if (not isinstance(config["tilemap"], list)) or len(config["tilemap"]) != 3:
        exit("Tilemap property in map must be a list with 3 entries.")
    mapX = int(config["width"])
    mapY = int(config["height"])
    tmBuffer = io.BytesIO()
    header: TilemapHeader = TilemapHeader()
    header.setMapSize(mapX, mapY)
    targetTilemapSizeBytes = mapX * mapY * 2
    for ts in config["tilemap"]:
        tilemap: Path = outPath / ts["file"]
        if not tilemap.exists():
            exit(f"Couldn't find tilemap file {tilemap}")
        if tilemap.stat().st_size != targetTilemapSizeBytes:
            exit(
                f"Filesize of tilemap {tilemap} doesn't match map target size {targetTilemapSizeBytes}"
            )
        with open(tilemap, "rb") as inTM:
            tmBuffer.write(inTM.read())
    tmBuffer.seek(0)
    comp = compress(list(tmBuffer.read()), targetTilemapSizeBytes * 3)
    outputBuffer = io.BytesIO()
    header.write(outputBuffer)
    outputBuffer.write(bytes(comp))
    with open(outPath.with_suffix(".tilemapz"), "wb") as outTM:
        outTM.write(outputBuffer.getbuffer())


def packTileset(outPath: Path):
    config = getMapConfig(outPath)
    if "tileset" not in config:
        return
    if (not isinstance(config["tileset"], list)) or len(config["tileset"]) != 3:
        exit("Tileset property in map must be a list with 3 entries.")
    compBuffer = io.BytesIO()
    outBuffer = io.BytesIO()
    header = TilesetHeader()
    header.lzOffset = 0x24
    header.vramOff = 0
    for ts in config["tileset"]:
        inPath = outPath / ts["file"]
        if not inPath.exists():
            exit(f"Could not find file {inPath}")
        mw = int(ts["metaWidth"] if "metaWidth" in ts else "1")
        mh = int(ts["metaHeight"] if "metaHeight" in ts else "1")
        n = int(ts["tileCount"] if "tileCount" in ts else "0")
        if "offset" in ts:
            header.vramOff = int(ts["offset"])
        pngData = parse_png(inPath)
        tileList = make_tile_list(
            pngData.rows, pngData.bitDepth, pngData.width, pngData.height
        )
        outTileList = make_meta_tile_list(
            tileList, mw, mh, pngData.width >> 3, pngData.height >> 3
        )
        tilecap = n * mw * mh
        tileCount = len(outTileList)
        if tilecap > 0 and tilecap < tileCount:
            outTileList = outTileList[0:tilecap]
        flatTileBuffer = io.BytesIO()
        for tile in outTileList:
            flatTileBuffer.write(bytearray(tile))
        flatTileBuffer.seek(0)
        flatTiles = list(flatTileBuffer.read())
        rawSize = len(flatTiles)
        header.wordCount = rawSize // 4
        comp = compress(flatTiles, rawSize)
        compSize = len(comp)
        compBuffer.write(bytes(comp))
        remainder = (4 - (compSize % 4)) % 4
        for _ in range(remainder):
            write_byte(compBuffer, 0)
        header.write(outBuffer)
        header.lzOffset += compSize + remainder
        header.vramOff += rawSize
    compBuffer.seek(0)
    outBuffer.write(compBuffer.getbuffer())
    with open(outPath.with_suffix(".tilesetz"), "wb") as outTS:
        outTS.write(outBuffer.getbuffer())


def packPalette(outPath: Path):
    config = getMapConfig(outPath)
    if "palette" not in config:
        return
    file: Path = outPath / config["palette"]
    if not file.exists():
        exit("Couldn't find palette file")
    pal: List[Tuple[int, int, int, int]] = []
    bin: List[int] = []
    if file.suffix == ".pal":
        pal = parse_pal(file)
    else:
        pal = parse_rgbx(file)
    bin = make_palette_bin(pal)
    outputBuffer = io.BytesIO()
    write_int(outputBuffer, len(pal) * 2)
    outputBuffer.write(bytes(bin))
    with open(outPath.with_suffix(".palettez"), "wb") as outTM:
        outTM.write(outputBuffer.getbuffer())


def main():
    parser = argparse.ArgumentParser(description="Pack map data.")
    parser.add_argument("path", type=str, help="The path to the binary.")
    args = parser.parse_args()
    outPath = Path(args.path)
    outEx = outPath.suffix
    base = outPath.with_suffix("")
    if outEx == ".scb":
        packScb(base)
    elif outEx == ".tilemapz":
        packTilemap(base)
    elif outEx == ".palettez":
        packPalette(base)
    elif outEx == ".tilesetz":
        packTileset(base)


if __name__ == "__main__":
    main()
