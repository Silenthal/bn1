import json
from pathlib import Path


def getMapConfig(mapDir: Path):
    outBuild = mapDir / "map.json"
    if outBuild.exists():
        with open(outBuild, "r") as config:
            build = json.load(config)
    else:
        build = {}
    return build


def writeMapConfig(mapDir: Path, cfg: dict):
    outBuild = mapDir / "map.json"
    with open(outBuild, "w") as config:
        json.dump(cfg, config, indent=4)
