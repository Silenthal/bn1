#!/usr/bin/python3
import argparse
from pathlib import Path

from common import auto_int, exit_error

def main():
    parser = argparse.ArgumentParser(description="Extract binary data.")
    parser.add_argument(
        "-o",
        "--output",
        type=str,
        help="The name of the output file.",
    )
    parser.add_argument(
        "-r",
        "--repeat",
        type=auto_int,
        default=1,
        help="Controls how many times to perform cutting using the same arguments on following offsets",
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset into the binary.")
    parser.add_argument("size", type=auto_int, help="The size of the output.")
    args = parser.parse_args()

    inPath = Path(args.path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    fs = inPath.stat().st_size
    if args.offset > fs:
        exit_error(f"Offset 0x{args.offset:X} is greater than file size {fs}")
    if args.offset + args.size > fs:
        exit_error(f"Size 0x{args.size:X} with offset 0x{args.offset:X} is greater than file size {fs}")

    repeat: int = int(args.repeat)
    repLen = len(str(repeat - 1))
    repFmt = f"_{{0:0{repLen}}}"
    if repeat <= 1:
        outPath = Path(args.output if args.output else f"{args.offset:07X}.bin")
        with open(inPath, mode="rb") as inFile:
            inFile.seek(args.offset)
            outbuf = inFile.read(args.size)
            with open(outPath, "wb") as outFile:
                outFile.write(outbuf)
    else:
        with open(inPath, mode="rb") as inFile:
            inFile.seek(args.offset)
            for i in range(repeat):
                offset = inFile.tell()
                outPath = ""
                if args.output:
                    tempPath = Path(args.output)
                    outPath = Path(tempPath.stem + repFmt.format(i) + tempPath.suffix)
                else:
                    outPath = Path(f"{offset:07X}.bin")
                outbuf = inFile.read(args.size)
                with open(outPath, "wb") as outFile:
                    outFile.write(outbuf)

if __name__=="__main__":
    main()