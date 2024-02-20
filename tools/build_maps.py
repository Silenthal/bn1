#!/usr/bin/python3
import argparse
import os
from pathlib import Path
from typing import Callable, List
from map_common import getMapConfig
from make_map import packScb, packPalette, packTilemap, packTileset
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
        process_pack(dirBase, ".tilesetz", packTileset)
    if "tilemap" in config:
        process_pack(dirBase, ".tilemapz", packTilemap)
    if "palette" in config:
        process_pack(dirBase, ".palettez", packPalette)


def main():
    parser = argparse.ArgumentParser(description="Builds all maps.")
    parser.add_argument("path", type=str, help="The path to the maps folder.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    mapDict = {
        "offline": {
            "ACDC_Elementary": [
                "map_56A038",
                "map_56AAD4",
                "map_56B55C",
                "map_56C38C",
                "map_56C880",
                "map_56D314",
                "map_56DD8C",
                "map_56E684",
                "map_56E94C",
                "map_56EEA0",
                "map_56F084",
                "map_56F604",
                "map_5707EC",
            ],
            "ACDC_Town": [
                "map_570A60",
                "map_574080",
                "map_574A2C",
                "map_5751D0",
                "map_5754A8",
                "map_575C98",
                "map_5761A8",
                "map_57663C",
                "map_576C60",
                "map_577280",
                "map_577770",
            ],
            "Govt_Complex": [
                "map_57793C",
                "map_578BB8",
                "map_578FB0",
                "map_57A3B0",
                "map_57B814",
                "map_57C4A0",
                "map_57D2A8",
                "map_57DAA8",
                "map_57E6DC",
                "map_57E994",
            ],
            "DenTown": [
                "map_57F160",
                "map_581924",
                "map_581D30",
                "map_583404",
                "map_584CC0",
                "map_5864D0",
                "map_587ACC",
                "map_587E00",
            ],
            "SciLab": [
                "map_58853C",
                "map_588C00",
                "map_58A988",
                "map_58AFF0",
                "map_58B330",
                "map_58BCB0",
            ],
            "WWW_Base": [
                "map_58BFF8",
                "map_58D42C",
                "map_58DCA8",
                "map_58E4D4",
                "map_58EAA4",
                "map_58F058",
            ],
        },
        "online": {
            "SchoolComp": [
                "map_58F5C8",
                "map_590FF8",
                "map_593D9C",
                "map_5949D8",
                "map_595F10",
            ],
            "OvenComp": [
                "map_596C9C",
                "map_5985C4",
            ],
            "WaterworksComp": [
                "map_599A28",
                "map_59BD44",
                "map_59EBA0",
                "map_5A427C",
                "map_5A9F50",
                "map_5B1478",
            ],
            "TrafficLight_Comp": [
                "map_5B64D0",
                "map_5B82F4",
                "map_5BA740",
                "map_5BE13C",
                "map_5C05DC",
            ],
            "Power_Plant_Comp": [
                "map_5C2A2C",
                "map_5C7B08",
                "map_5C9FF8",
                "map_5CD228",
            ],
            "WWW_Comp": [
                "map_5CFF6C",
                "map_5D1B54",
                "map_5D57A8",
                "map_5D9F4C",
                "map_5DB4A8",
                "map_5DE704",
            ],
            "ACDC_HP": [
                "map_5DED58",
                "map_5DEFE4",
                "map_5E0C24",
                "map_5E1C18",
            ],
            "Govt_Complex_HP": [
                "map_5E22A8",
                "map_5E27D8",
            ],
            "DenTown_HP": [
                "map_5E2F20",
            ],
            "Govt_Complex_HP_2": [
                "map_5E384C",
            ],
            "Other": [
                "Generic",
            ],
            "Internet": [
                "map_5E4604",
                "map_5E774C",
                "map_5ED608",
                "map_5F1E54",
                "map_5F5548",
                "map_5F8100",
                "map_5FA53C",
                "map_5FCB14",
                "map_5FFEE0",
                "map_6017A8",
                "map_604AB4",
                "map_6074E0",
                "map_609B64",
                "map_60AD44",
                "map_60DE5C",
                "map_6109C0",
            ],
        },
    }
    mapDict2 = {
        "battle": {
            "NumberMan",
            "FireMan",
            "IceMan",
            "ColorMan",
            "ElecMan",
            "WWW",
            "Internet",
            "Generic",
            "LanHP",
            "MaylHP",
            "YaiHP",
            "DexHP",
            "HikariHP",
            "SalHP",
            "MiyuHP",
            "MasaHP",
            "LifeVirus",
        }
    }
    dirList: List[Path] = []
    for loc in mapDict.keys():
        locationDir = inPath / loc
        for area in mapDict[loc].keys():
            outFolder = locationDir / area
            for offset in mapDict[loc][area]:
                dirBase = outFolder / offset
                if dirBase.exists():
                    dirList.append(dirBase)
    for loc in mapDict2.keys():
        outFolder = inPath / loc
        for offset in mapDict2[loc]:
            dirBase = outFolder / offset
            if dirBase.exists():
                dirList.append(dirBase)
    with Pool(16) as pool:
        pool.map(process, dirList)
    print("Done.")


if __name__ == "__main__":
    main()
