#!/usr/bin/python3
import argparse
from pathlib import Path


def auto_int(x):
    return int(x, 0)


parser = argparse.ArgumentParser(description='Extract binary data.')
parser.add_argument('path', type=str, help='The path to the binary.')
parser.add_argument('offset', type=auto_int, help='The offset into the binary.')
parser.add_argument('size', type=auto_int, help='The size of the output.')
args = parser.parse_args()


inPath = Path(args.path)
if not inPath.exists():
    exit(f"Couldn't find file {args.path}")


outPath = f"cut_{args.offset:08x}.bin"


with open(inPath, mode='rb') as inFile:
    inFile.seek(args.offset)
    outbuf = inFile.read(args.size)
    with open(outPath, "wb") as outFile:
        outFile.write(outbuf)
