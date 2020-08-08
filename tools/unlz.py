#!/usr/bin/python3
import argparse
import struct
import io
from pathlib import Path


def auto_int(x):
    return int(x, 0)


parser = argparse.ArgumentParser(description='Extract compressed archives.')
parser.add_argument('-s', '--size', action='count', default=0,
                        help='Print the compressed size.')
parser.add_argument('path', type=str, help='The path to the binary.')
parser.add_argument('offset', type=auto_int, help='The offset into the binary.')
args = parser.parse_args()


inPath = Path(args.path)
if not inPath.exists():
    exit(f"Couldn't find file {args.path}")


outPath = f"{args.offset:08x}.bin"

outBuffer = io.BytesIO()
buffLen = 0x1000
buff = [0 for x in range(buffLen)]
buffOff = 0


def get_int(inFile):
    return struct.unpack("I", inFile.read(4))[0]


def get_short(inFile):
    return struct.unpack('H', inFile.read(2))[0]


def get_byte(inFile):
    return inFile.read(1)[0]


def get_24(inFile):
    pack = inFile.read(3)
    return pack[0] | (pack[1] << 8) | (pack[2] << 16)


def extract(inFile):
    outputBuffer = io.BytesIO()
    bufferLen = 0x1000
    buffer = [0 for x in range(bufferLen)]
    bufferOffset = 0
    size = get_24(inFile)
    if size == 0:
        size = get_int(inFile)
    curSize = 0
    flags = 0
    mask = 1
    while curSize < size:
        if mask == 1:
            flags = get_byte(inFile)
            mask = 0x80
        else:
            mask = mask >> 1
        if (flags & mask) > 0:
            b1 = get_byte(inFile)
            b2 = get_byte(inFile)
            length = (b1 >> 4) + 3
            disp = ((b1 & 0x0F) << 8 | b2) + 1
            bufIdx = bufferOffset + bufferLen - disp
            for _ in range(length):
                nx = buffer[bufIdx % bufferLen]
                bufIdx = bufIdx + 1
                outputBuffer.write(bytes([nx]))
                buffer[bufferOffset] = nx
                bufferOffset = (bufferOffset + 1) % bufferLen
            curSize = curSize + length
        else:
            nx = get_byte(inFile)
            curSize = curSize + 1
            outputBuffer.write(bytes([nx]))
            buffer[bufferOffset] = nx
            bufferOffset = (bufferOffset + 1) % bufferLen
    return outputBuffer

def get_compressed_size(inFile):
    offStart = inFile.tell()
    size = get_24(inFile)
    if size == 0:
        size = get_int(inFile)
    curSize = 0
    flags = 0
    mask = 1
    while curSize < size:
        if mask == 1:
            flags = get_byte(inFile)
            mask = 0x80
        else:
            mask = mask >> 1
        b1 = (get_byte(inFile) >> 4) + 3
        if (flags & mask) > 0:
            get_byte(inFile)
        else:
            b1 = 1
        curSize = curSize + b1
    offEnd = inFile.tell()
    inFile.seek(offStart)
    return offEnd - offStart + 1


def get_uncompressed_size(inFile):
    offStart = inFile.tell()
    get_byte(inFile)
    size = get_24(inFile)
    if size == 0:
        size = get_int(inFile)
    inFile.seek(offStart)
    return size

with open(inPath, mode='rb') as inFile:
    inFile.seek(args.offset)
    magic = get_byte(inFile)
    if magic != 0x10:
        print("Data at offset does not start with the magic value for a compressed archive (0x10)")
        exit(1)
    if args.size > 0:
        print(f"Compressed size: {get_compressed_size(inFile)}")
    else:
        outBuffer = extract(inFile)
        with open(outPath, "wb") as outFile:
            # Copy the BytesIO stream to the output file
            outFile.write(outBuffer.getbuffer())
