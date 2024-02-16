import struct
import os
from pathlib import Path
from math import log10
from typing import BinaryIO


def is_int(x: str) -> int:
    try:
        int(x, 0)
        return True
    except ValueError:
        return False


def auto_int(x: str) -> int:
    return int(x, 0)


def len_int(val: int):
    return int(log10(val)) + 1


def get_int(inFile: BinaryIO) -> int:
    return struct.unpack("I", inFile.read(4))[0]


def get_short(inFile: BinaryIO) -> int:
    return struct.unpack('H', inFile.read(2))[0]


def get_sshort(inFile: BinaryIO) -> int:
    return struct.unpack('h', inFile.read(2))[0]


def get_byte(inFile: BinaryIO) -> int:
    return inFile.read(1)[0]


def write_int(outFile: BinaryIO, val: int) -> None:
    writeVal = struct.pack("I", val & 0xFFFFFFFF)
    outFile.write(writeVal)


def write_short(outFile: BinaryIO, val: int) -> None:
    writeVal = struct.pack("H", val & 0xFFFF)
    outFile.write(writeVal)


def write_sshort(outFile: BinaryIO, val: int) -> None:
    writeVal = struct.pack("h", val & 0xFFFF)
    outFile.write(writeVal)


def write_byte(outFile: BinaryIO, val: int) -> None:
    writeVal = struct.pack("B", val & 0xFF)
    outFile.write(writeVal)


def make_out_path(inPath: Path, outName: Path) -> Path:
    return Path(os.path.join(os.path.dirname(inPath), os.path.basename(outName)))


def enemy_id(bt):
    idList = [
        "Megaman",
        "Mettaur1",
        "Mettaur2",
        "Mettaur3",
        "Canodumb1",
        "Canodumb2",
        "Canodumb3",
        "Vulgear",
        "Vatgear",
        "Vulgear_X",
        "Spooky1",
        "Spooky2",
        "Spooky3",
        "Beetank1",
        "Beetank2",
        "Beetank3",
        "Handy1",
        "Handy2",
        "Handy3",
        "Flappy1",
        "Flappy2",
        "Flappy3",
        "Froshell1",
        "Froshell2",
        "Froshell3",
        "HardHead1",
        "HardHead2",
        "HardHead3",
        "Swordy1",
        "Swordy2",
        "Swordy3",
        "Fishy1",
        "Fishy2",
        "Fishy3",
        "Piranha1",
        "Piranha2",
        "Piranha3",
        "AquaPuffy",
        "HeatPuffy",
        "0x27",
        "ColdBear1",
        "ColdBear2",
        "ColdBear3",
        "Cloudy1",
        "Cloudy2",
        "Cloudy3",
        "Ratty1",
        "Ratty2",
        "Ratty3",
        "Miney1",
        "Miney2",
        "Miney3",
        "Ammonicule1",
        "Ammonicule2",
        "Ammonicule3",
        "Jelly",
        "HeatJelly",
        "EarthJelly",
        "Gaia1",
        "Gaia2",
        "Gaia3",
        "Popper1",
        "Popper2",
        "Popper3",
        "Satella1",
        "Satella2",
        "Satella3",
        "Fanner1",
        "Fanner2",
        "Fanner3",
        "Remobit1",
        "Remobit2",
        "Remobit3",
        "Billy",
        "Silly",
        "Killy",
        "Prog1",
        "Prog2",
        "Prog3",
        "MegalianA",
        "MegalianH",
        "MegalianW",
        "CanDevil1",
        "CanDevil2",
        "CanDevil3",
        "BigSnake1",
        "BigSnake2",
        "BigSnake3",
        "Mosqurito1",
        "Mosqurito2",
        "Mosqurito3",
        "Poitton1",
        "Poitton2",
        "Poitton3",
        "Mole",
        "0x5F",
        "GutsManV1",
        "GutsManV2",
        "GutsManV3",
        "ProtoManV1",
        "ProtoManV2",
        "ProtoManV3",
        "WoodManV1",
        "WoodManV2",
        "WoodManV3",
        "FireManV1",
        "FireManV2",
        "FireManV3",
        "NumberManV1",
        "NumberManV2",
        "NumberManV3",
        "StoneManV1",
        "StoneManV2",
        "StoneManV3",
        "IceManV1",
        "IceManV2",
        "IceManV3",
        "SkullManV1",
        "SkullManV2",
        "SkullManV3",
        "ColorManV1",
        "ColorManV2",
        "ColorManV3",
        "BombManV1",
        "BombManV2",
        "BombManV3",
        "SharkManV1",
        "SharkManV2",
        "SharkManV3",
        "ElecManV1",
        "ElecManV2",
        "ElecManV3",
        "PharaohManV1",
        "PharaohManV2",
        "PharaohManV3",
        "ShadowManV1",
        "ShadowManV2",
        "ShadowManV3",
        "0x8A",
        "0x8B",
        "0x8C",
        "MagicManV1",
        "MagicManV2",
        "MagicManV3",
        "Bass",
        "0x91",
        "0x92",
        "LifeVirus",
        "BlueDummyV1",
        "RedDummyV1",
        "BlueDummyV2",
        "RedDummyV2",
        "BlueDummyV3",
        "RedDummyV3",
        "InvElecMan",
        "SharkManFinV1",
        "SharkManFinV2",
        "SharkManFinV3_0",
        "SharkManFinV3_1",
        "SharkManFinV3_2",
        "SharkManFinV3_3"
    ]
    return idList[bt] if bt < len(idList) and bt >= 0 else f"{bt:02X}"


def chip_id(bt: int) -> str:
    chipIdDict = {
        0x00: "Buster",
        0x01: "Cannon",
        0x02: "HiCannon",
        0x03: "M_Cannon",
        0x04: "Sword",
        0x05: "WideSwrd",
        0x06: "LongSwrd",
        0x07: "LilBomb",
        0x08: "CrosBomb",
        0x09: "BigBomb",
        0x0A: "Spreader",
        0x0B: "Bubbler",
        0x0C: "Heater",
        0x0D: "MiniBomb",
        0x0E: "Shotgun",
        0x0F: "CrossGun",
        0x10: "ShokWave",
        0x11: "SoniWave",
        0x12: "DynaWave",
        0x13: "FireTowr",
        0x14: "AquaTowr",
        0x15: "WoodTowr",
        0x16: "Quake1",
        0x17: "Quake2",
        0x18: "Quake3",
        0x19: "FireSwrd",
        0x1A: "ElecSwrd",
        0x1B: "AquaSwrd",
        0x1C: "GutsPnch",
        0x1D: "IcePunch",
        0x1E: "FtrSword",
        0x1F: "Dash",
        0x20: "KngtSwrd",
        0x21: "HeroSwrd",
        0x22: "MetGuard",
        0x25: "TriArrow",
        0x26: "TriSpear",
        0x27: "TriLance",
        0x28: "Typhoon",
        0x29: "Huricane",
        0x2A: "Cyclone",
        0x2B: "Howitzer",
        0x2C: "Thunder1",
        0x2D: "Thunder2",
        0x2E: "Thunder3",
        0x31: "Snakegg1",
        0x32: "Snakegg2",
        0x33: "Snakegg3",
        0x34: "Hammer",
        0x37: "BodyBurn",
        0x3A: "Ratton1",
        0x3B: "Ratton2",
        0x3C: "Ratton3",
        0x3D: "Lockon1",
        0x3E: "Lockon2",
        0x3F: "Lockon3",
        0x40: "X_Panel1",
        0x41: "X_Panel3",
        0x43: "Recov10",
        0x44: "Recov30",
        0x45: "Recov50",
        0x46: "Recov80",
        0x47: "Recov120",
        0x48: "Recov150",
        0x49: "Recov200",
        0x4A: "Recov300",
        0x4C: "Steal",
        0x4F: "Geddon1",
        0x50: "Geddon2",
        0x52: "Escape",
        0x53: "Interupt",
        0x54: "LifeAura",
        0x55: "AquaAura",
        0x56: "FireAura",
        0x57: "WoodAura",
        0x58: "Repair",
        0x5B: "Cloud",
        0x5C: "Cloudier",
        0x5D: "Cloudest",
        0x5E: "IceCube",
        0x5F: "RockCube",
        0x61: "TimeBom1",
        0x62: "TimeBom2",
        0x63: "TimeBom3",
        0x64: "Invis1",
        0x65: "Invis2",
        0x66: "Invis3",
        0x67: "IronBody",
        0x69: "Remobit1",
        0x6A: "Remobit2",
        0x6B: "Remobit3",
        0x6C: "BstrGard",
        0x6D: "BstrBomb",
        0x6E: "BstrSwrd",
        0x6F: "BstrPnch",
        0x70: "RingZap1",
        0x71: "RingZap2",
        0x72: "RingZap3",
        0x73: "Candle1",
        0x74: "Candle2",
        0x75: "Candle3",
        0x76: "SloGauge",
        0x77: "FstGauge",
        0x79: "Drain1",
        0x7A: "Drain2",
        0x7B: "Drain3",
        0x7C: "Mine1",
        0x7D: "Mine2",
        0x7E: "Mine3",
        0x7F: "Gaia1",
        0x80: "Gaia2",
        0x81: "Gaia3",
        0x82: "BblWrap1",
        0x83: "BblWrap2",
        0x84: "BblWrap3",
        0x85: "Wave",
        0x86: "RedWave",
        0x87: "BigWave",
        0x88: "Muramasa",
        0x89: "Dropdown",
        0x8A: "Popup",
        0x8B: "Dynamyt1",
        0x8C: "Dynamyt2",
        0x8D: "Dynamyt3",
        0x8E: "Anubis",
        0x91: "IronShld",
        0x92: "LeafShld",
        0x93: "Barrier",
        0x94: "PharoMan",
        0x95: "PharoMn2",
        0x96: "PharoMn3",
        0x97: "ShadoMan",
        0x98: "ShadoMn2",
        0x99: "ShadoMn3",
        0x9D: "MagicMan",
        0x9E: "MagicMn2",
        0x9F: "MagicMn3",
        0xA0: "Roll",
        0xA1: "Roll2",
        0xA2: "Roll3",
        0xA3: "GutsMan",
        0xA4: "GutsMan2",
        0xA5: "GutsMan3",
        0xA6: "ProtoMan",
        0xA7: "ProtoMn2",
        0xA8: "ProtoMn3",
        0xA9: "WoodMan",
        0xAA: "WoodMan2",
        0xAB: "WoodMan3",
        0xAC: "FireMan",
        0xAD: "FireMan2",
        0xAE: "FireMan3",
        0xAF: "NumbrMan",
        0xB0: "NumbrMn2",
        0xB1: "NumbrMn3",
        0xB2: "StoneMan",
        0xB3: "StoneMn2",
        0xB4: "StoneMn3",
        0xB5: "IceMan",
        0xB6: "IceMan2",
        0xB7: "IceMan3",
        0xB8: "SkullMan",
        0xB9: "SkullMn2",
        0xBA: "SkullMn3",
        0xBB: "ColorMan",
        0xBC: "ColorMn2",
        0xBD: "ColorMn3",
        0xBE: "BombMan",
        0xBF: "BombMan2",
        0xC0: "BombMan3",
        0xC1: "SharkMan",
        0xC2: "SharkMn2",
        0xC3: "SharkMn3",
        0xC4: "ElecMan",
        0xC5: "ElecMan2",
        0xC6: "ElecMan3",
        0xC7: "Bass"
    }
    return chipIdDict[bt] if bt in chipIdDict else f"{bt:02X}"


def chip_code(id: int) -> str:
    return "ABCDEFGHIJKLMNOPQRSTUVWXYZ*"[id] if id < 27 and id >= 0 else "None"


def element(id: int) -> str:
    elemList = [
        "None",
        "Elec",  
        "Fire",
        "Water",
        "Wood"
    ]
    return elemList[id] if id < len(elemList) and id >= 0 else "None"
