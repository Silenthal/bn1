#!/usr/bin/python3
import argparse
import re
from pathlib import Path
from common import auto_int


def main():
    parser = argparse.ArgumentParser(description="Calculate disassembly progress.")
    parser.add_argument(
        "-p", "--print", action="store_true", help="Only print the percentage."
    )
    parser.add_argument("path", type=str, help="The path to the map file used.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find map file {args.path}")

    covered = 0
    pad = 0

    with open(inPath, "r") as inMap:
        for line in inMap:
            matchx = re.match(r"^ \.(\w+)\s+0x[0-9a-f]+\s+(0x[0-9a-f]+) (\w+)\.o", line)
            if matchx:
                if matchx[1] == "text":
                    size = auto_int(matchx[2])
                    if matchx[3].startswith("__pad__"):
                        pad += size
                    else:
                        covered += size

    total = covered + pad
    if args.print:
        print("{:.2f}".format(100 * covered / total))
    else:
        print("Disassembled: {:.2f}%".format(100 * covered / total))


if __name__ == "__main__":
    main()
