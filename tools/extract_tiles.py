#!/usr/bin/python3
import json
from typing import List, Literal, Tuple, BinaryIO
import png
import argparse
import os
from math import ceil, log10
from pathlib import Path
import sys
from common import auto_int, get_short
from extract_pal import GbaPal


def open_file(filename):
    if sys.platform == "win32":
        os.startfile(filename)


class TileReader:
    def __init__(self) -> None:
        self.readType = 0
        self.readCount = 256
        self.metaTileWidth = 1
        self.metaTileHeight = 1
        self.metaWidth = 16
        self.bitDepth = 4
        self.pixelsPerTileRow = 8
        self.tileRowCount = 8
        self.palette: list[Tuple[int, int, int, Literal[0, 255]]] = []
        self.setDefaultPalette()

    def getOutputInfo(self) -> str:
        ppt = self.getPixelsPerTile()
        tpm = self.getTilesPerMeta()
        mpo = self.getMetaPerOutput()
        pixelsPerMetaX = ppt[0] * tpm[0]
        pixelsPerMetaY = ppt[1] * tpm[1]
        pixelsPerOutputX = pixelsPerMetaX * mpo[0]
        pixelsPerOutputY = pixelsPerMetaY * mpo[1]
        out = (
            f"Metatile count: {mpo[0] * mpo[1]}\n"
            f"Metatile tile size: {tpm[0]} x {tpm[1]}\n"
            f"Metatile tile size (pixels): {pixelsPerMetaX} x {pixelsPerMetaY}\n"
            f"Output metatile size: {mpo[0]} x {mpo[1]}\n"
            f"Output image dimensions: {pixelsPerOutputX} x {pixelsPerOutputY}"
        )
        return out

    def setMetaTileWidth(self, count: int):
        if count < 1:
            self.metaTileWidth = 1
        self.metaTileWidth = count

    def setMetaTileHeight(self, count: int):
        if count < 1:
            self.metaTileHeight = 1
        self.metaTileHeight = count

    def setMetaWidth(self, width: int):
        if width < 1:
            self.metaWidth = 1
        self.metaWidth = width

    def setBitDepth(self, bitDepth: int):
        if bitDepth not in [4, 8]:
            exit("Unable to parse bit depths that aren't 4 or 8")
        self.bitDepth = bitDepth

    def setReadTiles(self, tileCount: int):
        self.readType = 0
        self.readCount = tileCount

    def setReadBytes(self, byteCount: int):
        self.readType = 1
        self.readCount = byteCount

    def setReadWords(self, wordCount: int):
        self.readType = 2
        self.readCount = wordCount

    def getMetaTileCount(self):
        metaCount = 1
        if self.readType == 0:
            metaCount = self.readCount
        else:
            byteCount = 1
            if self.readType == 1:
                byteCount = self.readCount
            elif self.readType == 2:
                byteCount = self.readCount * 4
            bytesPerTile = (self.bitDepth * self.tileRowCount) * (
                self.metaTileWidth * self.metaTileHeight
            )
            metaCount = byteCount // bytesPerTile
        if metaCount < 1:
            metaCount = 1
        return metaCount

    def getBytesPerRow(self) -> int:
        return self.bitDepth

    def readTileRow(self, file: BinaryIO) -> List[int]:
        tileRow: List[int] = []
        bitDepth = self.getBitDepth()
        bpr = self.getBytesPerRow()
        byteList = file.read(bpr)
        if len(byteList) < bpr:
            exit("Unable to read data")
        mask = (1 << bitDepth) - 1
        if bitDepth == 8:
            tileRow = list(byteList)
        else:
            for pack in byteList:
                for i in range(8 // bitDepth):
                    pixel = (pack >> (i * bitDepth)) & mask
                    tileRow.append(pixel)
        return tileRow

    def getBitDepth(self) -> int:
        return self.bitDepth

    def getPalette(self) -> List[Tuple[int, int, int, Literal[0, 255]]]:
        return self.palette

    def getPixelsPerTile(self) -> Tuple[int, int]:
        return self.pixelsPerTileRow, self.tileRowCount

    def getTilesPerMeta(self) -> Tuple[int, int]:
        return self.metaTileWidth, self.metaTileHeight

    def getMetaPerOutput(self) -> Tuple[int, int]:
        metaPerOutput = self.getMetaTileCount()
        metaPerOutputX = min(self.metaWidth, metaPerOutput)
        metaPerOutputY = ceil(metaPerOutput / metaPerOutputX)
        return metaPerOutputX, metaPerOutputY

    def getPixelsPerOutput(self) -> Tuple[int, int]:
        ppt = self.getPixelsPerTile()
        tpm = self.getTilesPerMeta()
        mpo = self.getMetaPerOutput()
        pixelsPerMetaX = ppt[0] * tpm[0]
        pixelsPerMetaY = ppt[1] * tpm[1]
        pixelsPerOutputX = pixelsPerMetaX * mpo[0]
        pixelsPerOutputY = pixelsPerMetaY * mpo[1]
        return pixelsPerOutputX, pixelsPerOutputY

    def setDefaultPalette(self):
        colorCount = 1 << self.bitDepth
        scale = 256 // colorCount
        # 1 (2) -> i * 256 (256 /1)
        # 2 (4) -> i * 64 (256 / 4)
        # 4 (16) -> i * 8 (256 / 16)
        # 8 (256) -> i * 1 (256 / 256)
        pal = [
            (i * scale, i * scale, i * scale, 0 if i == 0 else 255)
            for i in range(colorCount)
        ]
        self.palette = pal

    def setPaletteFromGbaPal(self, gbaPal: GbaPal):
        self.palette = []
        for colR, colG, colB, _ in gbaPal.palette:
            self.palette.append((colR, colG, colB, 0xFF))
        cap = 1 << self.bitDepth
        if len(self.palette) > cap:
            self.palette = self.palette[:cap]

    def readPaletteFromFile(
        self, inFile: BinaryIO, paletteOffset: int, paletteSize: int = 0
    ):
        bd = self.bitDepth
        colCount = 1 << bd
        if paletteSize > 0:
            colCount = paletteSize
        pal: list[Tuple[int, int, int, Literal[0, 255]]] = []
        inFile.seek(paletteOffset)
        for _ in range(colCount):
            col = get_short(inFile)
            colR = ((col >> 0) & 0x1F) * 8
            colG = ((col >> 5) & 0x1F) * 8
            colB = ((col >> 10) & 0x1F) * 8
            pal.append((colR, colG, colB, 0xFF))
        cap = 1 << self.bitDepth
        if len(pal) > cap:
            pal = pal[:cap]
        self.palette = pal

    def readImageData(self, inFile: BinaryIO) -> List[List[int]]:
        ppt = self.getPixelsPerTile()
        tpm = self.getTilesPerMeta()
        mpo = self.getMetaPerOutput()
        pixelsPerTileX = ppt[0]
        pixelsPerTileY = ppt[1]
        pixelsPerTile = pixelsPerTileX * pixelsPerTileY
        tilesPerMetaX = tpm[0]
        tilesPerMetaY = tpm[1]
        tilesPerMeta = tilesPerMetaX * tilesPerMetaY
        pixelsPerMetaX = pixelsPerTileX * tilesPerMetaX
        pixelsPerMetaY = pixelsPerTileY * tilesPerMetaY
        pixelsPerMeta = pixelsPerMetaX * pixelsPerMetaY
        metaPerOutputX = mpo[0]
        metaPerOutputY = mpo[1]
        # Actual image dim is (metaPerOutputX * metaPerOutputY)
        # but read tiles may be less than that
        metaPerOutput = self.getMetaTileCount()
        pixelsPerOutputX = pixelsPerMetaX * metaPerOutputX
        pixelsPerOutputY = pixelsPerMetaY * metaPerOutputY
        readPixelCount = pixelsPerMeta * metaPerOutput

        outData = [
            [0 for _ in range(pixelsPerOutputX)] for _ in range(pixelsPerOutputY)
        ]
        offset = 0
        while offset < readPixelCount:
            line = self.readTileRow(inFile)
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
            outOffsetY = (
                (indexMetaTileY * pixelsPerMetaY) + (indexTileY * ppt[1]) + indexPixelY
            )
            outOffsetX = (
                (indexMetaTileX * pixelsPerMetaX) + (indexTileX * ppt[0]) + indexPixelX
            )

            try:
                for i in range(ppt[0]):
                    outData[outOffsetY][outOffsetX + i] = line[i]
            except IndexError:
                print("Error when writing pixel data: out of range")
                print(
                    f"X offset calculation: "
                    f"({indexMetaTileX} * {pixelsPerMetaX}) + "
                    f"({indexTileX} * {ppt[0]}) + "
                    f"{indexPixelX}"
                )
                print(f"X = {outOffsetY}")
                print(
                    f"Y offset calculation: "
                    f"({indexMetaTileY} * {pixelsPerMetaY}) + "
                    f"({indexTileY} * {ppt[1]}) + "
                    f"{indexPixelY}"
                )
                print(f"Y = {outOffsetY}")
                print(f"Binary offset: {offset}")
                print(f"Pixel index: {totalPixels}")
                print(f"Tile index: {totalTiles}")
                print(f"Metatile index: {totalMetaTiles}")
                print(f"Pixel position: {indexPixelX}, {indexPixelY}")
                print(f"Tileile position: {indexTileX}, {indexTileY}")
                print(f"Metatile position: {indexMetaTileX}, {indexMetaTileY}")
                exit()
            offset += ppt[0]
        return outData

    def writePng(self, inFile: BinaryIO, outPath: Path, repeat: int = 1):
        outDataList = []
        for _ in range(repeat):
            outDataList.append(self.readImageData(inFile))

        ppo = self.getPixelsPerOutput()

        w = png.Writer(
            ppo[0], ppo[1], bitdepth=self.getBitDepth(), palette=self.getPalette()
        )

        tc = self.getMetaTileCount()
        isWriteConfig = tc % self.metaWidth != 0

        if len(outDataList) == 1:
            with open(outPath, mode="wb") as of:
                w.write(of, outDataList[0])
            if isWriteConfig:
                with open(outPath.with_suffix(".json"), "w") as outJson:
                    outJson.write(json.dumps({"tileCount": tc}, indent=4))
            open_file(outPath)
        else:
            padLen = int(log10(len(outDataList))) + 1
            for i in range(len(outDataList)):
                base = outPath.stem
                ex = outPath.suffix
                suffix = f"{{0:0{padLen}}}".format(i)
                op = outPath.with_name(base + "_" + suffix + ex)
                with open(op, mode="wb") as of:
                    w.write(of, outDataList[i])
                if isWriteConfig:
                    with open(op.with_suffix(".json"), "w") as outJson:
                        outJson.write(json.dumps({"tileCount": tc}, indent=4))


def main():
    parser = argparse.ArgumentParser(
        description="Extract GBA format tilesets from binaries."
    )
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file name."
    )
    parser.add_argument(
        "-d",
        "--depth",
        type=int,
        choices=[4, 8],
        default=4,
        help="The bit depth of the extracted tiles.",
    )
    parser.add_argument(
        "-n",
        "--meta-tile-count",
        type=auto_int,
        default=256,
        help="The amount of meta tiles to pull.",
    )
    parser.add_argument(
        "-nb", "--byte-count", type=auto_int, help="The amount of bytes to pull."
    )
    parser.add_argument(
        "-nw", "--word-count", type=auto_int, help="The amount of 32-bit words to pull."
    )
    parser.add_argument(
        "-mw",
        "--meta-tile-width",
        type=auto_int,
        default=1,
        help="The width of the meta tile, in tiles.",
    )
    parser.add_argument(
        "-mh",
        "--meta-tile-height",
        type=auto_int,
        default=1,
        help="The height of the meta tile, in tiles.",
    )
    parser.add_argument(
        "-po", "--palette-offset", type=auto_int, help="The offset of the palette."
    )
    parser.add_argument(
        "-pb",
        "--palette-bank",
        type=auto_int,
        default=0,
        help=(
            "The offset into a palette collection to use. The default is 0 - the first one found."
        ),
    )
    parser.add_argument(
        "-w",
        "--width",
        type=auto_int,
        default=16,
        help="The width of the output image, in meta tiles.",
    )
    parser.add_argument(
        "-r",
        "--repeat",
        type=auto_int,
        default=1,
        help="Controls how many times to perform tile extraction using the same arguments on following offsets",
    )
    parser.add_argument(
        "--verbose",
        "-v",
        action="count",
        default=0,
        help="Print extra information about the output.",
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset into the binary.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    fileOffset = args.offset
    fileSize = inPath.stat().st_size
    if fileOffset >= fileSize:
        exit(f"File offset {fileOffset} is greater than the size of the file {inPath}")
    outPath = Path(f"{fileOffset:08x}.png" if args.output == "" else args.output)
    tileReader = TileReader()
    tileReader.setBitDepth(args.depth)
    tileReader.setMetaTileWidth(args.meta_tile_width)
    tileReader.setMetaTileHeight(args.meta_tile_height)
    tileReader.setMetaWidth(args.width)
    if args.byte_count and args.byte_count > 0:
        tileReader.setReadBytes(args.byte_count)
    elif args.word_count and args.word_count > 0:
        tileReader.setReadWords(args.word_count)
    else:
        tileReader.setReadTiles(args.meta_tile_count)

    def v(info):
        if args.verbose > 0:
            print(f"{info}\n")

    # Verbose output detail
    v(tileReader.getOutputInfo())

    with open(inPath, mode="rb") as inFile:
        if args.palette_offset:
            tileReader.readPaletteFromFile(inFile, args.palette_offset)
        else:
            tileReader.setDefaultPalette()
        inFile.seek(fileOffset)
        tileReader.writePng(inFile, outPath, args.repeat)


if __name__ == "__main__":
    main()
