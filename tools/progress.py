#!/usr/bin/python3
import argparse
import re
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description="Calculate disassembly progress.")
    parser.add_argument("-mp", "--map-path", type=str, help="The path to the map file used.")
    args = parser.parse_args()
    inPath = Path(args.path if args.path else "../build/mmbn.map")
    if not inPath.exists():
        exit(f"Couldn't find map file {args.path}")

    default_count = 0
    with open(inPath, "r") as inMap:
        for line in inMap:
            match_fun = re.search(r"[0-9A-Fa-f]{6}$", line)
            if match_fun:
                default_count += 1

    print(f"Default label count: {default_count}")


if __name__ == "__main__":
    main()
