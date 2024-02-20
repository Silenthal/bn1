#!/usr/bin/python3
import argparse
from pathlib import Path
from typing import List
from common import auto_int, get_int
from unlz import extract


class spritePtr:
    def __init__(self, of: int, ln: int, isLz: bool) -> None:
        self.offset: int = of
        self.length: int = ln
        self.isCompressed: bool = isLz
        self.buffer: bytes = bytes([])

    def __str__(self) -> str:
        return (
            f"Off: {self.offset:06X} | Len: {self.length:0X} | Lz: {self.isCompressed}"
        )


def main():
    parser = argparse.ArgumentParser(description="Extract sprites.")
    parser.add_argument(
        "-o",
        "--offset",
        type=auto_int,
        default=0x12690,
        help="The offset of the sprite pointer list.",
    )
    parser.add_argument(
        "-l",
        "--length",
        type=auto_int,
        default=291,
        help="The length of the sprite pointer list.",
    )
    parser.add_argument(
        "-ls",
        "--lastsize",
        type=auto_int,
        default=0xE0,
        help="The length of the last sprite.",
    )
    parser.add_argument("path", type=str, help="The path to the game.")
    args = parser.parse_args()
    offset: int = args.offset
    listLen: int = args.length
    lastSize: int = args.lastsize

    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    pointerList: List[spritePtr] = []
    with open(inPath, mode="rb") as inFile:
        # Each pointer is 4 bytes
        inFile.seek(offset)
        pointerList.append(spritePtr(get_int(inFile) & 0xFFFFFF, 0, False))
        for _ in range(listLen):
            off = get_int(inFile)
            isLz = False
            if off & 0x80000000 != 0:
                isLz = True
            off = off & 0xFFFFFF
            pointerList.append(spritePtr(off, 0, isLz))
        pointerList.sort(key=lambda x: x.offset)
        for i in range(len(pointerList) - 1):
            cur = i + 1
            pre = i
            pointerList[pre].length = pointerList[cur].offset - pointerList[pre].offset
        pointerList[-1].length = off - pointerList[-1].offset
        pointerList[-1].length = lastSize
        for ptr in pointerList:
            inFile.seek(ptr.offset)
            if ptr.isCompressed:
                ptr.buffer = extract(inFile).getbuffer()
            else:
                ptr.buffer = inFile.read(ptr.length)
    incList: List[str] = []
    for ptr in pointerList:
        fileName = f"{ptr.offset:06X}.sprite"
        includeName = fileName
        if ptr.isCompressed:
            includeName = f"{ptr.offset:06X}.sprite.lz"
        with open(fileName, mode="wb") as outFile:
            outFile.write(ptr.buffer)
        incList.append(f'    .incbin "images/sprites/{includeName}"\n')
    with open("includelist.txt", mode="w") as outList:
        outList.writelines(incList)


if __name__ == "__main__":
    main()
