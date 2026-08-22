#!/usr/bin/python3
import argparse
from pathlib import Path

from common import exit_error, make_out_path


def compress(src: bytearray, srcSize: int) -> list[int]:
    if srcSize == 0:
        return [0x10, 0x00, 0x00, 0x00]
    
    buffLen = 0x1000
    minDistance = 2
    worstCaseDestSize = 4 + srcSize + (srcSize + 7) // 8

    worstCaseDestSize = (worstCaseDestSize + 3) >> 2 << 2

    dest = [0]  * worstCaseDestSize

    dest[0] = 0x10
    dest[1] = srcSize & 0xFF
    dest[2] = (srcSize >> 8) & 0xFF
    dest[3] = (srcSize >> 16) & 0xFF

    srcPos = 0
    destPos = 4

    while True:
        flagsOff = destPos
        destPos += 1

        for i in range(8):
            bestBlockDistance = 0
            bestBlockSize = 0
            blockDistance = minDistance

            while blockDistance <= min(srcPos, buffLen):
                blockStart = srcPos - blockDistance
                blockSize = 0

                while (
                    blockSize < 18
                    and srcPos + blockSize < srcSize
                    and src[blockStart + blockSize] == src[srcPos + blockSize]
                ):
                    blockSize += 1

                if blockSize > bestBlockSize:
                    bestBlockDistance = blockDistance
                    bestBlockSize = blockSize

                    if blockSize == 18:
                        break

                blockDistance += 1

            if bestBlockSize >= 3:
                dest[flagsOff] |= 0x80 >> i
                srcPos += bestBlockSize
                bestBlockSize -= 3
                bestBlockDistance -= 1
                disp = bestBlockDistance
                dest[destPos + 0] = (bestBlockSize << 4) | (disp >> 8)
                dest[destPos + 1] = disp & 0xFF
                destPos += 2
            else:
                dest[destPos] = src[srcPos]
                destPos += 1
                srcPos += 1

            if srcPos == srcSize:
                remainder = 4 - destPos % 4
                if remainder < 4:
                    destPos += remainder
                return dest[:destPos]


def main():
    parser = argparse.ArgumentParser(description="Compress files.")
    parser.add_argument("output", type=str, help="The output name.")
    parser.add_argument("input", type=str, help="The path to the input.")
    args = parser.parse_args()
    inPath = Path(args.input)
    if not inPath.exists():
        exit_error(f"Error: Couldn't find file {args.input}")
    outPath = make_out_path(inPath, Path(args.output))
    with open(inPath, mode="rb") as inFile:
        src = bytearray(inFile.read())
    srcLen = len(src)
    if srcLen == 0:
        print(f"Warning: source file '{inPath}' is empty")
    elif srcLen >= 2 ** 24:
        exit_error(f"Error: source file '{inPath}' is too large")
    result = compress(src, srcLen)
    try:
        with open(outPath, mode="wb") as outFile:
            outFile.write(bytes(result))
    except PermissionError:
        exit_error(f"Error: Unable to write output file '{outPath}' due to a permission error")


if __name__ == "__main__":
    main()
