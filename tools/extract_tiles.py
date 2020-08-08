#!/usr/bin/python3
import png
import argparse
import os
import struct
from math import ceil
from pathlib import Path


def auto_int(x):
    return int(x, 0)


parser = argparse.ArgumentParser(
    description='Extract GBA format tilesets from binaries.')
parser.add_argument('-o', '--output', type=str,
                    default="",
                    help='The output file name.')
parser.add_argument('-d', '--depth', type=int,
                    choices=[4, 8], default=4,
                    help='The bit depth of the extracted tiles.')
parser.add_argument('-n', '--meta-tile-count', type=auto_int,
                    default=256,
                    help='The amount of meta tiles to pull.')
parser.add_argument('-nb', '--byte-count', type=auto_int,
                    help='The amount of bytes to pull.')
parser.add_argument('-nw', '--word-count', type=auto_int,
                    help='The amount of 32-bit words to pull.')
parser.add_argument('-mw', '--meta-tile-width', type=auto_int,
                    default=1,
                    help='The width of the meta tile, in tiles.')
parser.add_argument('-mh', '--meta-tile-height', type=auto_int,
                    default=1,
                    help='The height of the meta tile, in tiles.')
parser.add_argument('-po', '--palette-offset', type=auto_int,
                    help='The offset of the palette.')
parser.add_argument('-pb', '--palette-bank', type=auto_int,
                    default=0,
                    help=('The offset into a palette collection to use." \
                         " The default is 0 - the first one found.'))
parser.add_argument('-w', '--width', type=auto_int,
                    default=16,
                    help='The width of the output image, in meta tiles.')
parser.add_argument('--verbose', '-v',
                    action='count', default=0,
                    help='Print extra information about the output.')
parser.add_argument('path', type=str,
                    help='The path to the binary.')
parser.add_argument('offset', type=auto_int,
                    help='The offset into the binary.')
args = parser.parse_args()


def v(info):
    if args.verbose > 0:
        print(f"{info}\n")


def get_meta_tile_width():
    mw = args.meta_tile_width
    if mw < 1:
        mw = 1
    return mw


def get_meta_tile_height():
    mh = args.meta_tile_height
    if mh < 1:
        mh = 1
    return mh


def get_output_meta_width():
    w = args.width
    if w < 1:
        w = 1
    return w


def get_bpp():
    return args.depth


def get_meta_tile_count():
    bc = 0
    if args.byte_count and args.byte_count > 0:
        bc = args.byte_count
    elif args.word_count and args.word_count > 0:
        bc = args.word_count * 4
    mc = args.meta_tile_count
    if bc == 0:
        return mc
    bpt = (get_bpp() * 8) * \
          (args.meta_tile_width * args.meta_tile_height)
    ret = bc // bpt
    if ret == 0:
        ret = 1
    return ret


def get_palette_data(inFile):
    # For this...
    # If there is an offset present:
    # - Seek to the position...
    bd = get_bpp()
    colCount = 1 << bd
    scale = 256 // colCount
    # 1 (2) -> i * 256 (256 /1)
    # 2 (4) -> i * 64 (256 / 4)
    # 4 (16) -> i * 8 (256 / 16)
    # 8 (256) -> i * 1 (256 / 256)
    pal = []
    if args.palette_offset:
        off = args.palette_offset
        inFile.seek(off)
        for i in range(colCount):
            col = struct.unpack('H', inFile.read(2))[0]
            # combo = inFile.read(2)
            # col = combo[0] | (combo[1] << 8)
            colR = (col & 0x1F) * 8
            colG = ((col >> 5) & 0x1F) * 8
            colB = ((col >> 10) & 0x1F) * 8
            pal.append((colR, colG, colB, 0xFF))
    else:
        pal = [(i * scale, i * scale, i * scale, 0 if i == 0 else 255)
               for i in range(colCount)]
    return pal


inPath = Path(args.path)
if not inPath.exists():
    exit(f"Couldn't find file {args.path}")

fileOffset = args.offset
fileSize = inPath.stat().st_size
if fileOffset >= fileSize:
    exit(f"File offset {fileOffset} is greater than "
         f"the size of the file {inPath}")


outPath = f"{fileOffset:08x}.png" if args.output == "" else args.output


# Pixel vars
# bitsPerByte = 8
# bytesPerPixel = .5
# bitsPerPixel = 4
bytesPerRow = get_bpp()

# Tile vars
pixelsPerTileX = 8
pixelsPerTileY = 8
pixelsPerTile = pixelsPerTileX * pixelsPerTileY

# Metatile vars
tilesPerMetaX = get_meta_tile_width()
tilesPerMetaY = get_meta_tile_height()
tilesPerMeta = tilesPerMetaX * tilesPerMetaY
pixelsPerMetaX = pixelsPerTileX * tilesPerMetaX
pixelsPerMetaY = pixelsPerTileY * tilesPerMetaY
pixelsPerMeta = pixelsPerMetaX * pixelsPerMetaY

# Output vars
metaPerOutput = get_meta_tile_count()
metaPerOutputX = min(get_output_meta_width(), metaPerOutput)
metaPerOutputY = ceil(metaPerOutput / metaPerOutputX)
pixelsPerOutputX = pixelsPerMetaX * metaPerOutputX
pixelsPerOutputY = pixelsPerMetaY * metaPerOutputY
# pixelsPerOutput = pixelsPerOutputX * pixelsPerOutputY

# Verbose info
v(f"Input file: {inPath}")
v(f"Output file: {outPath}")
v(f"Metatile count: "
  f"{metaPerOutput}")
v(f"Metatile tile size: "
  f"{tilesPerMetaX} x {tilesPerMetaY}")
v(f"Metatile tile size (pixels): "
  f"{pixelsPerMetaX} x {pixelsPerMetaY}")
v(f"Output metatile size: "
  f"{metaPerOutputX} x {metaPerOutputY}")
v(f"Output image dimensions: "
  f"{pixelsPerOutputX} x {pixelsPerOutputY}")

# The max amount of bytes being input.
# bytesPerOutput = bytesPerPixel *
#                  pixelsPerTile *
#                  tilesPerMeta *
#                  metaPerOutput
pixelCount = (pixelsPerMeta * metaPerOutput)

outData = [[0 for x in range(pixelsPerOutputX)]
           for y in range(pixelsPerOutputY)]


def read_tile_row(file):
    tileRow = []
    dt = file.read(bytesPerRow)
    if len(dt) < bytesPerRow:
        exit(f"Unable to read data from {inPath}")
    if bytesPerRow == 4:
        for pack in dt:
            tileRow.extend([pack & 0xF, pack >> 4])
    elif bytesPerRow == 8:
        tileRow = list(dt)
    return tileRow


palette = []

with open(inPath, mode='rb') as inFile:
    palette = get_palette_data(inFile)
    inFile.seek(fileOffset)
    # For the following method...
    # Instead of...
    offset = 0
    while offset < pixelCount:
        line = read_tile_row(inFile)
        # Offset within the tile
        totalPixels = offset
        indexPixel = totalPixels % pixelsPerTile
        indexPixelX = indexPixel % pixelsPerTileX
        indexPixelY = indexPixel // pixelsPerTileX

        # Offset within the metatile
        totalTiles = totalPixels // pixelsPerTile
        indexTile = totalTiles % tilesPerMeta
        indexTileX = indexTile % tilesPerMetaX
        indexTileY = indexTile // tilesPerMetaX

        # Offset within the PNG
        totalMetaTiles = totalTiles // tilesPerMeta
        indexMetaTile = totalMetaTiles  # % metaPerOutput
        indexMetaTileX = indexMetaTile % metaPerOutputX
        indexMetaTileY = indexMetaTile // metaPerOutputX

        # Actual offsets
        outOffsetY = (indexMetaTileY * pixelsPerMetaY) + \
                     (indexTileY * pixelsPerTileY) + indexPixelY
        outOffsetX = (indexMetaTileX * pixelsPerMetaX) + \
                     (indexTileX * pixelsPerTileX) + indexPixelX

        try:
            for i in range(8):
                outData[outOffsetY][outOffsetX + i] = line[i]
        except IndexError:
            print(f"Error when writing pixel data: out of range")
            print(f"X offset calculation: "
                  f"({indexMetaTileX} * {pixelsPerMetaX}) + "
                  f"({indexTileX} * {pixelsPerTileX}) + "
                  f"{indexPixelX}")
            print(f"X = {outOffsetY}")
            print(f"Y offset calculation: "
                  f"({indexMetaTileY} * {pixelsPerMetaY}) + "
                  f"({indexTileY} * {pixelsPerTileY}) + "
                  f"{indexPixelY}")
            print(f"Y = {outOffsetY}")
            print(f"Binary offset: {offset}")
            print(f"Pixel index: {totalPixels}")
            print(f"Tile index: {totalTiles}")
            print(f"Metatile index: {totalMetaTiles}")
            print(f"Pixel position: {indexPixelX}, {indexPixelY}")
            print(f"Tileile position: {indexTileX}, {indexTileY}")
            print(f"Metatile position: {indexMetaTileX}, {indexMetaTileY}")
            exit()
        offset += pixelsPerTileX


w = png.Writer(pixelsPerOutputX, pixelsPerOutputY,
               bitdepth=get_bpp(), palette=palette)
with open(outPath, mode='wb') as of:
    w.write(of, outData)


os.startfile(outPath)
