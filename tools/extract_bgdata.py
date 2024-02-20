#!/usr/bin/python3
import argparse
from pathlib import Path
from common import auto_int
from common_archive import PaletteHeader, TilemapHeader, TilesetHeader
from map_common import getMapConfig, writeMapConfig
from unlz import extract
from typing import Any, List, BinaryIO
from extract_tiles import TileReader


def unpackTilesetArchive(
    inFile: BinaryIO, offset: int, paletteHeader: PaletteHeader, dirName: Path
):
    dirName.mkdir(exist_ok=True, parents=True)
    inFile.seek(offset)
    header0 = TilesetHeader(inFile)
    header1 = TilesetHeader(inFile)
    header2 = TilesetHeader(inFile)
    inFile.seek(offset + header0.lzOffset)
    data0 = extract(inFile)
    inFile.seek(offset + header1.lzOffset)
    data1 = extract(inFile)
    inFile.seek(offset + header2.lzOffset)
    data2 = extract(inFile)
    out1 = dirName / "BG1.png"
    out2 = dirName / "BG2.png"
    out3 = dirName / "BG3.png"
    tr: TileReader = TileReader()
    tr.setPaletteFromGbaPal(paletteHeader.palette)
    sizeList = []
    for header, data, out in [
        (header0, data0, out1),
        (header1, data1, out2),
        (header2, data2, out3),
    ]:
        tr.setReadWords(header.wordCount)
        sizeList.append(tr.writePng(data, out, 1, True))
    config = getMapConfig(dirName)
    config["tileset"] = []
    runningOff = 0
    for header, data, out, size in [
        (header0, data0, out1, sizeList[0]),
        (header1, data1, out2, sizeList[1]),
        (header2, data2, out3, sizeList[2]),
    ]:
        appended: dict[str, Any] = {"file": out.name}
        if size > 16 and size % 16 != 0:
            appended["tileCount"] = size
        if runningOff != header.vramOff:
            runningOff = header.vramOff
            appended["offset"] = runningOff
        config["tileset"].append(appended)
        runningOff += size * 4
    writeMapConfig(dirName, config)


def unpackPaletteArchive(inFile: BinaryIO, offset: int, dirName: Path):
    dirName.mkdir(exist_ok=True, parents=True)
    inFile.seek(offset)
    header = PaletteHeader(inFile)
    fileName = "palette" + header.palette.get_ext()
    with open(dirName / fileName, "w") as outFile:
        outFile.write(header.palette.as_text())
    config = getMapConfig(dirName)
    config["palette"] = fileName
    writeMapConfig(dirName, config)
    return header


def unpackTilemapArchive(inFile: BinaryIO, offset: int, dirName: Path):
    dirName.mkdir(exist_ok=True, parents=True)
    inFile.seek(offset)
    header = TilemapHeader(inFile)
    data = extract(inFile)
    out = dirName / "tilemap.bin"
    out0 = dirName / "BG1.bin"
    out1 = dirName / "BG2.bin"
    out2 = dirName / "BG3.bin"
    for out in [out0, out1, out2]:
        tilemap = data.read(header.mapSizeX * header.mapSizeY * 2)
        with open(out, "wb") as outFile:
            outFile.write(tilemap)
    config = getMapConfig(dirName)
    config["tilemap"] = [{"file": "BG1.bin"}, {"file": "BG2.bin"}, {"file": "BG3.bin"}]
    sortedConfig = {"width": header.mapSizeX, "height": header.mapSizeY}
    for key in config.keys():
        sortedConfig[key] = config[key]
    writeMapConfig(dirName, sortedConfig)


def unpack_all(inFile):
    mapStore = set()
    paletteStore: dict[int, PaletteHeader] = dict()
    mapDict: dict[str, dict[str, dict[str, List[int]]]] = {
        "offline": {
            "ACDC_Elementary": {
                "map_56A038": [0x3B0298, 0x3B3230, 0x3B33D4],
                "map_56AAD4": [0x3B0298, 0x3B3230, 0x3B4054],
                "map_56B55C": [0x3B4E98, 0x3B4CF4, 0x3B7980],
                "map_56C38C": [0x3B9148, 0x3BBEC0, 0x3BC064],
                "map_56C880": [0x3B0298, 0x3BF0B4, 0x3BF258],
                "map_56D314": [0x3B0298, 0x3BFEF0, 0x3C0094],
                "map_56DD8C": [0x3B0298, 0x3C0D04, 0x3C0EA8],
                "map_56E684": [0x3C1CA8, 0x3C434C, 0x3C44F0],
                "map_56E94C": [0x3B9148, 0x3BBEC0, 0x3C51D4],
                "map_56EEA0": [0x3B9148, 0x3C8280, 0x3C8424],
                "map_56F084": [0x3C8F94, 0x3CBF18, 0x3CC0BC],
                "map_56F604": [0x3CD220, 0x3CFBD0, 0x3CFD74],
                "map_5707EC": [0x3B9148, 0x3D10CC, 0x3D1270],
            },
            "ACDC_Town": {
                "map_570A60": [0x3D22F0, 0x3D8104, 0x3D82A8],
                "map_574080": [0x3DD8FC, 0x3E1FC0, 0x3E2164],
                "map_574A2C": [0x3E3CC4, 0x3E6678, 0x3E681C],
                "map_5751D0": [0x3E7718, 0x3E9500, 0x3E96A4],
                "map_5754A8": [0x3EA180, 0x3EC5F0, 0x3EC794],
                "map_575C98": [0x3ED76C, 0x3EF004, 0x3EF1A8],
                "map_5761A8": [0x3EFBD4, 0x3F2310, 0x3F24B4],
                "map_57663C": [0x3F308C, 0x3F600C, 0x3F61B0],
                "map_576C60": [0x3F715C, 0x3F9D04, 0x3F9EA8],
                "map_577280": [0x3FACE4, 0x3FEE84, 0x3FF028],
                "map_577770": [0x3FACE4, 0x4005B0, 0x400754],
            },
            "Govt_Complex": {
                "map_57793C": [0x401ABC, 0x405374, 0x405518],
                "map_578BB8": [0x3FACE4, 0x40A4A0, 0x40A644],
                "map_578FB0": [0x40BDD0, 0x40E520, 0x40E6C4],
                "map_57A3B0": [0x410FA4, 0x41338C, 0x413530],
                "map_57B814": [0x415D74, 0x41640C, 0x4165B0],
                "map_57C4A0": [0x4176B8, 0x419D04, 0x419EA8],
                "map_57D2A8": [0x41C27C, 0x41D8F0, 0x41DA94],
                "map_57DAA8": [0x41F390, 0x420B50, 0x420CF4],
                "map_57E6DC": [0x42344C, 0x426324, 0x4264C8],
                "map_57E994": [0x42344C, 0x428498, 0x42863C],
            },
            "DenTown": {
                "map_57F160": [0x42BDB8, 0x42ED5C, 0x42EF00],
                "map_581924": [0x3FACE4, 0x432970, 0x432B14],
                "map_581D30": [0x43423C, 0x438430, 0x4385D4],
                "map_583404": [0x43423C, 0x43A984, 0x43AB28],
                "map_584CC0": [0x43423C, 0x43CE70, 0x43D014],
                "map_5864D0": [0x43423C, 0x43F534, 0x43F6D8],
                "map_587ACC": [0x441810, 0x443618, 0x4437BC],
                "map_587E00": [0x4442B0, 0x44531C, 0x4454C0],
            },
            "SciLab": {
                "map_58853C": [0x445F98, 0x447BB8, 0x447D5C],
                "map_588C00": [0x44A1C4, 0x44CB4C, 0x44CCF0],
                "map_58A988": [0x445F98, 0x44F584, 0x44F728],
                "map_58AFF0": [0x445F98, 0x451AFC, 0x451CA0],
                "map_58B330": [0x41F390, 0x4537D8, 0x45397C],
                "map_58BCB0": [0x454EEC, 0x45673C, 0x4568E0],
            },
            "WWW_Base": {
                "map_58BFF8": [0x458D1C, 0x45C3EC, 0x45C590],
                "map_58D42C": [0x45E93C, 0x462CC4, 0x462E68],
                "map_58DCA8": [0x465260, 0x468E34, 0x468FD8],
                "map_58E4D4": [0x46B200, 0x46C410, 0x46C5B4],
                "map_58EAA4": [0x46B200, 0x46D578, 0x46D71C],
                "map_58F058": [0x46B200, 0x46E6B0, 0x46E854],
            },
        },
        "online": {
            "SchoolComp": {
                "map_58F5C8": [0x46F8A8, 0x472B84, 0x472D28],
                "map_590FF8": [0x475A74, 0x478820, 0x4789C4],
                "map_593D9C": [0x46F8A8, 0x47B634, 0x47B7D8],
                "map_5949D8": [0x46F8A8, 0x47E290, 0x47E434],
                "map_595F10": [0x46F8A8, 0x481450, 0x4815F4],
            },
            "OvenComp": {
                "map_596C9C": [0x483F78, 0x487718, 0x4878BC],
                "map_5985C4": [0x483F78, 0x487718, 0x48BB6C],
            },
            "WaterworksComp": {
                "map_599A28": [0x48EE68, 0x4955C4, 0x495768],
                "map_59BD44": [0x48EE68, 0x4955C4, 0x49A91C],
                "map_59EBA0": [0x48EE68, 0x4955C4, 0x49EC7C],
                "map_5A427C": [0x4A4264, 0x4A99D0, 0x4A9B74],
                "map_5A9F50": [0x4AF050, 0x4B26C4, 0x4B2868],
                "map_5B1478": [0x4A4264, 0x4B6EE0, 0x4B7084],
            },
            "TrafficLight_Comp": {
                "map_5B64D0": [0x4BBFB0, 0x4BDB30, 0x4BDCD4],
                "map_5B82F4": [0x4BBFB0, 0x4BDB30, 0x4C16F0],
                "map_5BA740": [0x4BBFB0, 0x4BDB30, 0x4C5284],
                "map_5BE13C": [0x4BBFB0, 0x4BDB30, 0x4C9438],
                "map_5C05DC": [0x4BBFB0, 0x4BDB30, 0x4CCC70],
            },
            "Power_Plant_Comp": {
                "map_5C2A2C": [0x4D16FC, 0x4D3868, 0x4D3A0C],
                "map_5C7B08": [0x4D16FC, 0x4D3868, 0x4D8530],
                "map_5C9FF8": [0x4D16FC, 0x4D3868, 0x4DCF48],
                "map_5CD228": [0x4D16FC, 0x4D3868, 0x4E1AE8],
            },
            "WWW_Comp": {
                "map_5CFF6C": [0x483F78, 0x487718, 0x4E63AC],
                "map_5D1B54": [0x475A74, 0x4EAFBC, 0x4EB160],
                "map_5D57A8": [0x48EE68, 0x4955C4, 0x4EEFC0],
                "map_5D9F4C": [0x4BBFB0, 0x4BDB30, 0x4F3DE0],
                "map_5DB4A8": [0x4D16FC, 0x4D3868, 0x4F8438],
                "map_5DE704": [0x4FCBA4, 0x4FDCFC, 0x4FDEA0],
            },
            "ACDC_HP": {
                "map_5DED58": [0x500FD4, 0x502C60, 0x502E04],
                "map_5DEFE4": [0x500FD4, 0x506384, 0x503934],
                "map_5E0C24": [0x500FD4, 0x5087D4, 0x506528],
                "map_5E1C18": [0x500FD4, 0x50C900, 0x508978],
            },
            "Govt_Complex_HP": {
                "map_5E22A8": [0x50CAA4, 0x50DC6C, 0x50DE10],
                "map_5E27D8": [0x50CAA4, 0x511580, 0x50F498],
            },
            "DenTown_HP": {
                "map_5E2F20": [0x50CAA4, 0x51398C, 0x511724]
            },
            "Govt_Complex_HP_2": {
                "map_5E384C": [0x50CAA4, 0x517C78, 0x513B30]
            },
            "Other": {
                "Generic": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "Servbot": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "NewGameNachine": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "Telephone": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "Car": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "VendingMachineWaterworks": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "LobbyTV": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "LargeMonitor": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "ControlEquipment": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "VendingMachineSciLab": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "RecycledPET": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "BigVase": [0x50CAA4, 0x51A1C4, 0x517E1C],
                "Blackboard": [0x50CAA4, 0x51A1C4, 0x517E1C],
            },
            "Internet": {
                "map_5E4604": [0x51A368, 0x51E23C, 0x51E3E0],
                "map_5E774C": [0x51A368, 0x51E23C, 0x523568],
                "map_5ED608": [0x51A368, 0x51E23C, 0x528AE8],
                "map_5F1E54": [0x51A368, 0x51E23C, 0x52D57C],
                "map_5F5548": [0x51A368, 0x51E23C, 0x531ED4],
                "map_5F8100": [0x51A368, 0x51E23C, 0x53614C],
                "map_5FA53C": [0x51A368, 0x51E23C, 0x53A4C8],
                "map_5FCB14": [0x51A368, 0x51E23C, 0x53E484],
                "map_5FFEE0": [0x51A368, 0x51E23C, 0x542204],
                "map_6017A8": [0x51A368, 0x51E23C, 0x545C3C],
                "map_604AB4": [0x51A368, 0x51E23C, 0x549A60],
                "map_6074E0": [0x51A368, 0x51E23C, 0x54DF24],
                "map_609B64": [0x51A368, 0x51E23C, 0x551D84],
                "map_60AD44": [0x51A368, 0x51E23C, 0x55564C],
                "map_60DE5C": [0x51A368, 0x51E23C, 0x559694],
                "map_6109C0": [0x51A368, 0x51E23C, 0x55CF88],
            },
        },
        "battle": {
            "battle": {
                "NumberMan": [0x561434, 0x561650, 0x561774],
                "FireMan": [0x561C78, 0x561E84, 0x561FA8],
                "IceMan": [0x562478, 0x562674, 0x562798],
                "ColorMan": [0x562C6C, 0x562EE4, 0x563008],
                "ElecMan": [0x563500, 0x5637A8, 0x5638CC],
                "WWW": [0x563E24, 0x563FEC, 0x564110],
                "Internet": [0x564654, 0x5648D0, 0x5649F4],
                "Generic": [0x564EF4, 0x565124, 0x565248],
                "LanHP": [0x565750, 0x5659AC, 0x565AD0],
                "MaylHP": [0x565FD8, 0x566260, 0x566384],
                "YaiHP": [0x566898, 0x566A7C, 0x566BA0],
                "DexHP": [0x5670B0, 0x567410, 0x567534],
                "HikariHP": [0x567AA4, 0x567CD4, 0x567DF8],
                "SalHP": [0x568300, 0x5684C0, 0x5685E4],
                "MiyuHP": [0x568AF0, 0x568CB4, 0x568DD8],
                "MasaHP": [0x5692E8, 0x56939C, 0x5694C0],
                "LifeVirus": [0x56999C, 0x569A40, 0x569B64],
            }
        },
    }
    sortList = []
    for loc in mapDict.keys():
        locationDir = Path.cwd() / loc
        for area in mapDict[loc].keys():
            if area == "battle":
                outArea = locationDir
            else:
                outArea = locationDir / area
            for subArea in mapDict[loc][area].keys():
                outFolder = outArea / subArea
                tileset = mapDict[loc][area][subArea][0]
                palette = mapDict[loc][area][subArea][1]
                tilemap = mapDict[loc][area][subArea][2]
                if palette not in paletteStore:
                    palHeader = unpackPaletteArchive(inFile, palette, outFolder)
                    mapStore.add(palette)
                    paletteStore[palette] = palHeader
                    sortList.append([palette, outFolder.with_suffix(".palettez")])
                else:
                    palHeader = paletteStore[palette]
                if tileset not in mapStore:
                    unpackTilesetArchive(inFile, tileset, palHeader, outFolder)
                    mapStore.add(tileset)
                    sortList.append([tileset, outFolder.with_suffix(".tilesetz")])
                if tilemap not in mapStore:
                    unpackTilemapArchive(inFile, tilemap, outFolder)
                    mapStore.add(tilemap)
                    sortList.append([tilemap, outFolder.with_suffix(".tilemapz")])
    sortList.sort(key=lambda x: x[0])
    with open("sortlist.txt", "w") as outSort:
        for off, name in sortList:
            outSort.write(f'    .incbin "{name}" ; 0x{off:X}\n')


def main():
    parser = argparse.ArgumentParser(description="Extracts maps.")
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset to the map.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    with open(inPath, "rb") as inFile:
        unpack_all(inFile)
    # with open(inPath, 'rb') as inFile:
    #     unpackPaletteArchive(inFile, args.offset, Path.cwd() / f"map_{args.offset:X}")


if __name__ == "__main__":
    main()
