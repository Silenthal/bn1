#!/usr/bin/python3
import argparse
import os
from pathlib import Path
from typing import Callable, List
from map_common import getMapConfig
from make_map import (
    packDialogue,
    packScb,
    packPalette,
    packTalk,
    packTilemap,
    packTileset,
)
from multiprocessing import Pool


def process_pack(dirBase: Path, extension: str, function: Callable[[Path], None]):
    outFile = dirBase.with_suffix(extension)
    if not outFile.exists():
        print(f"Packing {dirBase}{extension}")
        function(dirBase)
    else:
        outFileTime = outFile.stat().st_mtime
        fileList = os.listdir(dirBase)
        for file in fileList:
            filePath = dirBase / file
            if filePath.exists():
                fileTime = filePath.stat().st_mtime
                if fileTime > outFileTime:
                    print(f"Packing {dirBase}{extension}")
                    function(dirBase)


def process(dirBase: Path):
    config = getMapConfig(dirBase)
    if "scb" in config:
        process_pack(dirBase, ".scb", packScb)
    if "tileset" in config:
        process_pack(dirBase, ".pib", packTileset)
    if "tilemap" in config:
        process_pack(dirBase, ".srb", packTilemap)
    if "palette" in config:
        process_pack(dirBase, ".clb", packPalette)
    if "talk" in config:
        process_pack(dirBase, ".talk", packTalk)
    if "dialogue" in config:
        process_pack(dirBase, ".dialogue", packDialogue)


def main():
    parser = argparse.ArgumentParser(description="Builds all maps.")
    parser.add_argument("path", type=str, help="The path to the maps folder.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    dirList: List[Path] = [s.parent for s in inPath.glob("**/map.json")]
    with Pool(16) as pool:
        pool.map(process, dirList)
    print("Done.")


if __name__ == "__main__":
    main()
