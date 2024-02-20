from typing import BinaryIO, Optional

from common import get_byte, get_int, get_short, write_byte, write_int, write_short
from extract_pal import GbaPal


class TilesetHeader:
    def __init__(self, inFile: Optional[BinaryIO] = None) -> None:
        self.wordCount = 0
        self.lzOffset = 0
        self.vramOff = 0
        if inFile:
            self.read(inFile)

    def read(self, inFile: BinaryIO):
        self.wordCount = get_int(inFile)
        self.lzOffset = get_int(inFile)
        self.vramOff = get_int(inFile)

    def write(self, outFile: BinaryIO):
        write_int(outFile, self.wordCount)
        write_int(outFile, self.lzOffset)
        write_int(outFile, self.vramOff)


class PaletteHeader:
    def __init__(self, inFile: Optional[BinaryIO] = None) -> None:
        self.byteCount = 0
        self.palette: GbaPal = GbaPal()
        if inFile:
            self.read(inFile)

    def read(self, inFile: BinaryIO):
        self.byteCount = get_int(inFile)
        self.palette.load(inFile, self.byteCount >> 1)


class TilemapHeader:
    def __init__(self, inFile: Optional[BinaryIO] = None) -> None:
        self.mapSizeX = 0
        self.mapSizeY = 0
        self.offset1 = 0
        self.offset2 = 0
        self.offset3 = 0
        if inFile:
            self.read(inFile)

    def read(self, inFile: BinaryIO):
        self.mapSizeX = get_byte(inFile)
        self.mapSizeY = get_byte(inFile)
        get_short(inFile)
        self.offset1 = get_int(inFile)
        self.offset2 = get_int(inFile)
        self.offset3 = get_int(inFile)

    def setMapSize(self, width: int, height: int):
        self.mapSizeX = width
        self.mapSizeY = height
        binSize = width * height * 2
        self.offset1 = 0x10
        self.offset2 = self.offset1 + binSize
        self.offset3 = self.offset2 + binSize

    def write(self, outFile: BinaryIO):
        write_byte(outFile, self.mapSizeX)
        write_byte(outFile, self.mapSizeY)
        write_short(outFile, 0)
        write_int(outFile, self.offset1)
        write_int(outFile, self.offset2)
        write_int(outFile, self.offset3)
