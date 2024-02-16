#!/usr/bin/python3
import argparse
import os
from pathlib import Path
from typing import List
from make_map import packMap
from multiprocessing import Pool

def process(dirBase: Path):
    scb = dirBase.with_suffix(".scb")
    if not scb.exists():
        packMap(scb)
    else:
        scb_time = scb.stat().st_mtime
        fileList = os.listdir(dirBase)
        for file in fileList:
            fn = Path(file)
            if fn.exists() and fn.stem in ["boundary", "elevation", "cover", "event"]:
                fn_time = fn.stat().st_mtime
                if fn_time > scb_time:
                    packMap(scb)


def main():
    parser = argparse.ArgumentParser(description='Builds all maps.')
    parser.add_argument('path', type=str, help='The path to the maps folder.')
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    mapDict = {
        "offline": {
            "ACDC_Elementary": [
                "map_56a038",
                "map_56aad4",
                "map_56b55c",
                "map_56c38c",
                "map_56c880",
                "map_56d314",
                "map_56dd8c",
                "map_56e684",
                "map_56e94c",
                "map_56eea0",
                "map_56f084",
                "map_56f604",
                "map_5707ec"
            ],
            "ACDC_Town": [
                "map_570a60",
                "map_574080",
                "map_574a2c",
                "map_5751d0",
                "map_5754a8",
                "map_575c98",
                "map_5761a8",
                "map_57663c",
                "map_576c60",
                "map_577280",
                "map_577770"
            ],
            "Govt_Complex": [
                "map_57793c",
                "map_578bb8",
                "map_578fb0",
                "map_57a3b0",
                "map_57b814",
                "map_57c4a0",
                "map_57d2a8",
                "map_57daa8",
                "map_57e6dc",
                "map_57e994"
            ],
            "DenTown": [
                "map_57f160",
                "map_581924",
                "map_581d30",
                "map_583404",
                "map_584cc0",
                "map_5864d0",
                "map_587acc",
                "map_587e00"
            ],
            "SciLab": [
                "map_58853c",
                "map_588c00",
                "map_58a988",
                "map_58aff0",
                "map_58b330",
                "map_58bcb0"
            ],
            "WWW_Base": [
                "map_58bff8",
                "map_58d42c",
                "map_58dca8",
                "map_58e4d4",
                "map_58eaa4",
                "map_58f058"
            ]
        },
        "online": {
            "SchoolComp": [
                "map_58f5c8",
                "map_590ff8",
                "map_593d9c",
                "map_5949d8",
                "map_595f10"
            ],
            "OvenComp": [
                "map_596c9c",
                "map_5985c4"
            ],
            "WaterworksComp": [
                "map_599a28",
                "map_59bd44",
                "map_59eba0",
                "map_5a427c",
                "map_5a9f50",
                "map_5b1478"
            ],
            "TrafficLight_Comp": [
                "map_5b64d0",
                "map_5b82f4",
                "map_5ba740",
                "map_5be13c",
                "map_5c05dc"
            ],
            "Power_Plant_Comp": [
                "map_5c2a2c",
                "map_5c7b08",
                "map_5c9ff8",
                "map_5cd228"
            ],
            "WWW_Comp": [
                "map_5cff6c",
                "map_5d1b54",
                "map_5d57a8",
                "map_5d9f4c",
                "map_5db4a8",
                "map_5de704"
            ],
            "ACDC_HP": [
                "map_5ded58",
                "map_5defe4",
                "map_5e0c24",
                "map_5e1c18"
            ],
            "Govt_Complex_HP": [
                "map_5e22a8",
                "map_5e27d8"
            ],
            "DenTown_HP": [
                "map_5e2f20"
            ],
            "Govt_Complex_HP_2": [
                "map_5e384c"
            ],
            "Other": [
                "map_5e41f8"
            ],
            "Internet": [
                "map_5e4604",
                "map_5e774c",
                "map_5ed608",
                "map_5f1e54",
                "map_5f5548",
                "map_5f8100",
                "map_5fa53c",
                "map_5fcb14",
                "map_5ffee0",
                "map_6017a8",
                "map_604ab4",
                "map_6074e0",
                "map_609b64",
                "map_60ad44",
                "map_60de5c",
                "map_6109c0"
            ]
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
    print(f"Collected {len(dirList)} paths")
    with Pool(16) as pool:
        pool.map(process, dirList)


if __name__=="__main__":
    main()