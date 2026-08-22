#!/usr/bin/python3
import argparse
import re
import subprocess
import sys
from collections.abc import Callable
from multiprocessing import Pool
from pathlib import Path

from common import exit_error


class DependFileParams:
    def __init__(
        self,
        writeFile: Path,
        readFile: Path,
        dFile: Path,
        oFile: Path,
        sFile: Path,
        files: list[Path],
        assets: list[Path],
    ) -> None:
        self.writeFile: Path = writeFile
        self.sourceFile: Path = readFile
        self.assets = assets
        slist = [str(f) for f in files]
        slist.sort()
        deps = " ".join(slist)
        self.line = f"{oFile} {dFile}: {sFile} {deps}\n"

    def write(self):
        self.writeFile.parent.mkdir(parents=True, exist_ok=True)
        with open(self.writeFile, "w") as outFile:
            outFile.write(self.line)


def processIfNew(depFile: Path, destFile: Path, function: Callable[[], None]):
    if not destFile.exists():
        function()
    else:
        outFileTime = destFile.stat().st_mtime
        fileTime = depFile.stat().st_mtime
        if fileTime > outFileTime:
            function()


def useTool(tool: str, inFile: Path, outFile: Path):
    def runner():
        print(f"Processing {outFile}")
        subprocess.run(
            [sys.executable, tool, str(outFile), str(inFile)],
            check=True,
            stdout=sys.stdout,
            stderr=sys.stderr,
        )

    processIfNew(inFile, outFile, runner)


def process(outFile: Path):
    ex = outFile.suffix
    res = ""
    if ex == ".4bpp" or ex == ".8bpp":
        inFile = outFile.with_suffix(".png")
        useTool("./make_tiles.py", inFile, outFile)
    elif ex == ".gbapal":
        for srcEx in [".pal", ".txt", ".png"]:
            if outFile.with_suffix(srcEx).exists():
                inFile = outFile.with_suffix(srcEx)
                useTool("./make_tiles.py", inFile, outFile)
                break
    if ex == ".script":
        inFile = outFile.with_suffix(".txt")
        useTool("./build_script.py", inFile, outFile)
    elif ex == ".lz":
        if str(outFile).endswith(".4bpp.lz"):
            inFile1 = outFile.parent / Path(Path(outFile.stem).stem).with_suffix(".png")
            inFile2 = outFile.parent / Path(outFile.stem)
            useTool("./make_tiles.py", inFile1, inFile2)
            useTool("./lz.py", inFile2, outFile)
        else:
            inFile = outFile.parent / Path(outFile.stem)
            useTool("./lz.py", inFile, outFile)
    if res != "":
        print(res)


def searchAssets(assetPath: Path, incLink: Path) -> list[str]:
    retList: list[str] = []
    inPath = assetPath / incLink
    if not inPath.exists():
        return retList
    with open(assetPath / incLink, "r") as inFile:
        for line in inFile:
            inMatch = re.match(r"^\s+\.incbin \"(.*)\".*$", line)
            if inMatch:
                link = inMatch.group(1)
                retList.append(link)
            inMatch = re.match(r"^\s+\.include \"(.*.inc)\".*$", line)
            if inMatch:
                link = inMatch.group(1)
                retList.append(link)
                retList.extend(searchAssets(assetPath, Path(link)))
    return retList


def createDepParams(
    inPath: Path, build_s: Path, buildFolder: Path, assetPath: Path, depPrefix: str
) -> DependFileParams:
    source_index = build_s.parts.index(inPath.stem) + 1
    build_rep = buildFolder.joinpath(*build_s.parts[source_index:])
    depFile = build_rep.with_suffix(depPrefix)
    build_d = (
        Path("$(BUILD)").joinpath(*build_s.parts[source_index:]).with_suffix(depPrefix)
    )
    build_o = build_d.with_suffix(".o")
    sFile = Path("$(SOURCE)").joinpath(*build_s.parts[source_index:])
    fileList: list[Path] = []
    assetList: list[Path] = []
    with open(build_s, "r") as inFile:
        for line in inFile:
            inMatch = re.match(r"^\s*\.incbin \"(.*)\".*$", line)
            if inMatch:
                link = inMatch.group(1)
                fileList.append(Path("$(ASSETS)") / link)
                assetList.append(assetPath / link)
            inMatch = re.match(r"^\s*\.include \"(.*.inc)\".*$", line)
            if inMatch:
                link = inMatch.group(1)
                fileList.append(Path("$(ASSETS)") / link)
                retList = searchAssets(assetPath, Path(link))
                for file in retList:
                    fileList.append(Path("$(ASSETS)") / file)
                    assetList.append(assetPath / file)
    return DependFileParams(
        depFile, build_s, build_d, build_o, sFile, fileList, assetList
    )


def main():
    parser = argparse.ArgumentParser(description="Builds assets.")
    parser.add_argument("source_path", type=str, help="The path to the source folder.")
    parser.add_argument("build_path", type=str, help="The path to the build folder.")
    parser.add_argument("asset_path", type=str, help="The path to the asset folder.")
    args = parser.parse_args()
    inPath = Path(args.source_path)
    buildFolder = Path(args.build_path)
    if not inPath.exists():
        exit_error(f"Couldn't find file {args.path}")
    assetPath = Path(args.asset_path)
    if not assetPath.exists():
        exit_error(f"Couldn't find path {assetPath}")
    processList: list[Path] = []
    depList: list[DependFileParams] = []
    for build_s in inPath.glob("**/*.c"):
        param = createDepParams(inPath, build_s, buildFolder, assetPath, ".c.d")
        depList.append(param)
        processList.extend(param.assets)
    for build_s in inPath.glob("**/*.S"):
        param = createDepParams(inPath, build_s, buildFolder, assetPath, ".S.d")
        depList.append(param)
        processList.extend(param.assets)
    print(f"Checking {len(processList)} file(s)")
    with Pool(16) as pool:
        pool.map(process, processList)
    for param in depList:

        def process_dep():
            param.write()

        processIfNew(param.sourceFile, param.writeFile, process_dep)


if __name__ == "__main__":
    main()
