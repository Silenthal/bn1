#!/usr/bin/python3
import argparse
import os
from pathlib import Path

import png


class PngData:
    def __init__(self, width, height, rows, info):
        self.width = width
        self.height = height
        self.rows = rows
        self.isGreyscale = info['greyscale']
        self.palette = info['palette']
        self.bitDepth = info['bitdepth']
        self.info = info


def make_out_path(inPath: Path, outName: Path) -> Path:
    return Path(os.path.join(os.path.dirname(inPath), os.path.basename(outName)))


def parse_png(pngPath: Path) -> PngData:
    pngImg = png.Reader(filename=pngPath)
    (width, height, rows, info) = pngImg.read_flat()
    if width == 0 or height == 0:
        exit(f"Image {pngPath} has a width or height of 0 and cannot be read.")
    if width % 8 != 0 or height % 8 != 0:
        exit(f"Image {pngPath} dimensions are not multiples of 8")
    bitDepth = info['bitdepth']
    if bitDepth not in [4, 8]:
        exit(f"Image bit depth must be 4 or 8.")
    return PngData(width, height, rows, info)

def parse_pal(palPath: Path):
    palList = []
    with open(palPath, "r") as pal:
        magic1 = pal.readline()
        magic2 = pal.readline()
        if magic1 == "JASC-PAL" and magic2 == "0100":
            palCt = int(pal.readline)
            for _ in range(palCt):
                triple = pal.readline().split()
                r = int(triple[0])
                g = int(triple[0])
                b = int(triple[0])
                palList.append((r, g, b, 255))
    return palList




def make_palette_bin(pal, depth, fill):
    palbin = []
    fillArr = []
    if fill:
        fillArr = [int(x) for x in fill]
    elif depth == 4:
        fillArr = [0 for _ in range(len(pal))]
    else:
        fillArr = [0 if x == 0 else 1 for x in range(len(pal))]
    for i in range(len(pal)):
        r, g, b, _ = pal[i]
        cr = (r >> 3) & 0x1F
        cg = (g >> 3) & 0x1F
        cb = (b >> 3) & 0x1F
        ca = fillArr[i % len(fillArr)]
        if not fill and depth == 8:
            ca = 0 if r == g == b == 0 else 1
        col = (ca << 15) | (cb << 10) | (cg << 5) | cr
        palbin.append(col & 0xFF)
        palbin.append((col >> 8) & 0xFF)
    return palbin


def make_tile_list(rows, bitdepth, width, height):
    tileCountX = width >> 3
    tileCountY = height >> 3
    tileList = []
    for tj in range(tileCountY):
        for ti in range(tileCountX):
            offset = (tj * 8 * tileCountX + ti) * 8
            tile = []
            for tileRowIndex in range(8):
                rowOffset = offset + (tileRowIndex * width)
                for t in range(bitdepth):
                    if bitdepth == 4:
                        ix = t * 2
                        lo = rows[rowOffset + ix + 0] & 0xF
                        hi = rows[rowOffset + ix + 1] & 0xF
                        tile.append(lo | (hi << 4))
                    else:
                        tile.append(rows[rowOffset + t])
            tileList.append(tile)
    return tileList


def make_meta_tile_list(tileList, metaWidth, metaHeight, tileCountX, tileCountY):
    reorderedTileList = []
    for mj in range(tileCountY // metaHeight):
        for mi in range(tileCountX // metaWidth):
            tileOffBase = (mj * metaHeight * tileCountX) + (mi * metaWidth)
            for my in range(metaHeight):
                tileRowOff = my * tileCountX
                for mx in range(metaWidth):
                    reorderedTileList.append(tileList[tileOffBase + tileRowOff + mx])
    return reorderedTileList


def PngToGbaPal(inPath: Path, outPath: Path, fill: str) -> None:
    pngData = parse_png(inPath)
    if pngData.isGreyscale:
        exit(f'Image {inPath} is greyscale, and doesn\'t have a palette.')
    else:
        palbin = make_palette_bin(pngData.info['palette'], pngData.bitDepth, fill)
        if outPath.exists():
            os.remove(outPath)
        with open(outPath, "wb") as oFile:
            oFile.write(bytearray(palbin))


def PngToBpp(inPath: Path, outPath: Path, mw: int, mh: int) -> None:
    pngData = parse_png(inPath)
    tileList = make_tile_list(pngData.rows, pngData.bitDepth, pngData.width, pngData.height)
    outTileList = make_meta_tile_list(tileList, mw, mh, pngData.width >> 3, pngData.height >> 3)
    with open(outPath, "wb") as oFile:
        for tile in outTileList:
            oFile.write(bytearray(tile))


def JascPalToGbaPal(inPath: Path, outPath: Path, fill: str) -> None:
    palData = parse_pal(inPath)
    palbin = make_palette_bin(palData, len(palData), fill)
    if outPath.exists():
        os.remove(outPath)
    with open(outPath, "wb") as oFile:
        oFile.write(bytearray(palbin))

def main():
    def auto_int(x):
        return int(x, 0)
    parser = argparse.ArgumentParser(description='Processes graphics files.')
    parser.add_argument('-mw', '--meta-tile-width', type=auto_int,
                    default=1,
                    help='The width of the meta tile, in tiles.')
    parser.add_argument('-mh', '--meta-tile-height', type=auto_int,
                    default=1,
                    help='The height of the meta tile, in tiles.')
    parser.add_argument('-fill', '--high-bit-fill', type=str, help='High bit fill pattern.')
    parser.add_argument('output', type=str, help='The output name.')
    parser.add_argument('input', type=str, help='The path to the input.')
    args = parser.parse_args()
    inPath = Path(args.input)
    if not inPath.exists():
        exit(f"Could not find file {inPath}")
    outPath = make_out_path(inPath, Path(args.output))
    # Check the conversion
    _, inEx = os.path.splitext(inPath)
    _, outEx = os.path.splitext(outPath)
    inEx = inEx.lower()
    outEx = outEx.lower()
    if inEx == ".png":
        if outEx == ".gbapal":
            return PngToGbaPal(inPath, outPath, args.high_bit_fill)
        elif outEx == ".8bpp" or outEx == ".4bpp":
            return PngToBpp(inPath, outPath, args.meta_tile_width, args.meta_tile_height)
        else:
            exit(f"Unsupported conversion from {inEx} to {outEx}")
    elif inEx == ".pal":
        if outEx == ".gbapal":
            return JascPalToGbaPal(inPath, outPath, args.high_bit_fill)
        else:
            exit(f"Unsupported conversion from {inEx} to {outEx}")
    else:
        exit(f"Unsupported conversion from {inEx} to {outEx}")


if __name__ == "__main__":
    main()
