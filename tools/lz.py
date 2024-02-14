#!/usr/bin/python3
import argparse
from pathlib import Path
from common import make_out_path
from typing import List


def compress(src: List[int], srcSize: int):
    buffLen = 0x1000
    minDistance = 2
    srcLast = (srcSize >> 3) + 1
    worstCaseDestSize = 4 + srcSize + srcLast

    worstCaseDestSize = (worstCaseDestSize + 3) & ~3

    dest = [0 for _ in range(worstCaseDestSize)]
    
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

            while blockDistance <= srcPos and blockDistance <= buffLen:
                blockStart = srcPos - blockDistance
                blockSize = 0

                while blockSize < 18 and srcPos + blockSize < srcSize and src[blockStart + blockSize] == src[srcPos + blockSize]:
                    blockSize += 1

                if blockSize > bestBlockSize:
                    bestBlockDistance = blockDistance
                    bestBlockSize = blockSize

                    if blockSize == 18:
                        break

                blockDistance += 1

            if bestBlockSize >= 3:
                dest[flagsOff] |= (0x80 >> i)
                srcPos += bestBlockSize
                bestBlockSize -= 3
                bestBlockDistance -= 1
                disp = bestBlockDistance & 0xFFF
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
    parser = argparse.ArgumentParser(description='Compress files.')
    parser.add_argument('output', type=str, help='The output name.')
    parser.add_argument('input', type=str, help='The path to the input.')
    args = parser.parse_args()
    inPath = Path(args.input)
    if not inPath.exists():
        exit(f"Couldn't find file {args.input}")
    outPath = make_out_path(inPath, Path(args.output))
    with open(inPath, mode='rb') as inFile:
        src = [byte for byte in bytearray(inFile.read())]
    result = compress(src, len(src))
    with open(outPath, mode='wb+') as outFile:
        outFile.write(bytes(result))

if __name__ == "__main__":
    main()
