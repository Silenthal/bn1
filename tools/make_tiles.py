#!/usr/bin/python3
import argparse
import os
import png
from pathlib import Path


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
        magic1 = pal.readline().strip()
        magic2 = pal.readline().strip()
        if magic1 == "JASC-PAL" and magic2 == "0100":
            palCt = int(pal.readline())
            for _ in range(palCt):
                triple = pal.readline().split()
                r = int(triple[0])
                g = int(triple[1])
                b = int(triple[2])
                palList.append((r, g, b, 0))
    return palList


def parse_rgbx(palPath: Path):
    palList = []
    with open(palPath, "r") as pal:
        magic1 = pal.readline().strip().split()
        if len(magic1) == 2 and magic1[0] == "RGBX":
            palCt = int(magic1[1])
            for _ in range(palCt):
                group = pal.readline().split()
                r = int(group[0])
                g = int(group[1])
                b = int(group[2])
                x = int(group[3])
                palList.append((r, g, b, x))
    return palList


def make_palette_bin(pal, depth):
    palbin = []
    for i in range(len(pal)):
        r, g, b, x = pal[i]
        cr = (r >> 3) & 0x1F
        cg = (g >> 3) & 0x1F
        cb = (b >> 3) & 0x1F
        cx = 0 if x > 1 else x
        col = (cx << 15) | (cb << 10) | (cg << 5) | cr
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


def PngToGbaPal(inPath: Path, outPath: Path) -> None:
    pngData = parse_png(inPath)
    if pngData.isGreyscale:
        exit(f'Image {inPath} is greyscale, and doesn\'t have a palette.')
    else:
        palbin = make_palette_bin(pngData.info['palette'], pngData.bitDepth)
        if outPath.exists():
            os.remove(outPath)
        with open(outPath, "wb") as oFile:
            oFile.write(bytearray(palbin))


def PngToBpp(inPath: Path, outPath: Path, mw: int, mh: int, n: int) -> None:
    pngData = parse_png(inPath)
    tileList = make_tile_list(pngData.rows, pngData.bitDepth, pngData.width, pngData.height)
    outTileList = make_meta_tile_list(tileList, mw, mh, pngData.width >> 3, pngData.height >> 3)
    tilecap = n * mw * mh
    tileCount = len(outTileList)
    if tilecap > 0 and tilecap < tileCount:
        outTileList = outTileList[0:tilecap]
    with open(outPath, "wb") as oFile:
        for tile in outTileList:
            oFile.write(bytearray(tile))


def JascPalToGbaPal(inPath: Path, outPath: Path) -> None:
    palData = parse_pal(inPath)
    palbin = make_palette_bin(palData, len(palData))
    if outPath.exists():
        os.remove(outPath)
    with open(outPath, "wb") as oFile:
        oFile.write(bytearray(palbin))


def RgbxPalToGbaPal(inPath: Path, outPath: Path) -> None:
    palData = parse_rgbx(inPath)
    palbin = make_palette_bin(palData, len(palData))
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
    parser.add_argument('-n', '--meta-tile-count', type=auto_int,
                    default=0,
                    help='The amount of meta tiles to pull.')
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
            return PngToGbaPal(inPath, outPath)
        elif outEx == ".8bpp" or outEx == ".4bpp":
            return PngToBpp(inPath, outPath, args.meta_tile_width, args.meta_tile_height, args.meta_tile_count)
        else:
            exit(f"Unsupported conversion from {inEx} to {outEx}")
    elif inEx == ".pal":
        if outEx == ".gbapal":
            return JascPalToGbaPal(inPath, outPath)
        else:
            exit(f"Unsupported conversion from {inEx} to {outEx}")
    elif inEx == ".txt":
        if outEx == ".gbapal":
            return RgbxPalToGbaPal(inPath, outPath)
        else:
            exit(f"Unsupported conversion from {inEx} to {outEx}")
    else:
        exit(f"Unsupported conversion from {inEx} to {outEx}")


if __name__ == "__main__":
    main()
