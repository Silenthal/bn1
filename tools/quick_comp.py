#!/usr/bin/python3
import argparse
from pathlib import Path
import os

from common import auto_int


def main():
    parser = argparse.ArgumentParser(description="Compares two files.")
    parser.add_argument(
        "-c",
        "--count",
        type=auto_int,
        default=50,
        help="The maximum amount of changes to report.",
    )
    parser.add_argument("base_file_path", type=str, help="The base file path.")
    parser.add_argument("build_file_path", type=str, help="The build file path.")
    args = parser.parse_args()
    base = Path(args.base_file_path)
    newg = Path(args.build_file_path)
    if not newg.exists():
        raise SystemExit(f"Couldn't find build file {newg}")
    if not base.exists():
        raise SystemExit(f"Couldn't find base file {base}")
    data_a: bytes = bytes()
    data_b: bytes = bytes()
    if base.exists() and newg.exists():
        with open(base, "rb") as inOrig:
            with open(newg, "rb") as inNewG:
                data_a = inOrig.read()
                data_b = inNewG.read()
    counter = int(args.count)
    for f in range(len(data_a)):
        if counter <= 0:
            break
        byte_a = data_a[f]
        byte_b = data_b[f]
        if byte_a != byte_b:
            print(f"Diff at {f:X} (Old: {byte_a:2X} - New: {byte_b:2X})")
            counter -= 1


if __name__ == "__main__":
    main()
