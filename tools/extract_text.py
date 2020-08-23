#!/usr/bin/python3
import argparse
import os
import struct
from pathlib import Path


def isUi(args):
    return args.ui_string > 0


def get_text_offset_list(infile, args):
    blockOffset = args.blockOffset
    infile.seek(blockOffset)

    offTo1 = get_short(infile)
    offsetList = [blockOffset + offTo1]
    for _ in range((offTo1 >> 1) - 1):
        offsetList.append(blockOffset + get_short(infile))
    return offsetList


charmap = {
    0x00: " ",
    0x01: "0",
    0x02: "1",
    0x03: "2",
    0x04: "3",
    0x05: "4",
    0x06: "5",
    0x07: "6",
    0x08: "7",
    0x09: "8",
    0x0A: "9",
    0x0B: "[Lv.]",  # katakana ア
    0x0C: "∥",  # katakana イ
    0x0D: "ウ",
    0x0E: "エ",
    0x0F: "オ",
    0x10: "カ",
    0x11: "キ",
    0x12: "ク",
    0x13: "ケ",
    0x14: "コ",
    0x15: "サ",
    0x16: "シ",
    0x17: "ス",
    0x18: "セ",
    0x19: "ソ",
    0x1A: "タ",
    0x1B: "チ",
    0x1C: "ツ",
    0x1D: "テ",
    0x1E: "ト",
    0x1F: "ナ",
    0x20: "ニ",
    0x21: "ヌ",
    0x22: "ネ",
    0x23: "ノ",
    0x24: "ハ",
    0x25: "ヒ",
    0x26: "フ",
    0x27: "ヘ",
    0x28: "ホ",
    0x29: "マ",
    0x2A: "ミ",
    0x2B: "ム",
    0x2C: "メ",
    0x2D: "モ",
    0x2E: "ヤ",
    0x2F: "ユ",
    0x30: "ヨ",
    0x31: "ラ",
    0x32: "リ",
    0x33: "ル",
    0x34: "レ",
    0x35: "ロ",
    0x36: "ワ",
    0x37: "ヰ",
    0x38: "ヱ",
    0x39: "ヲ",
    0x3A: "ン",
    0x3B: "ガ",
    0x3C: "ギ",
    0x3D: "グ",
    0x3E: "ゲ",
    0x3F: "ゴ",
    0x40: "ザ",
    0x41: "ジ",
    0x42: "ズ",
    0x43: "ゼ",
    0x44: "ゾ",
    0x45: "ダ",
    0x46: "ヂ",
    0x47: "ヅ",
    0x48: "デ",
    0x49: "ド",
    0x4A: "バ",
    0x4B: "ビ",
    0x4C: "ブ",
    0x4D: "ベ",
    0x4E: "ボ",
    0x4F: "パ",
    0x50: "ピ",
    0x51: "プ",
    0x52: "ペ",
    0x53: "ポ",
    0x54: "ァ",
    0x55: "ィ",
    0x56: "ゥ",
    0x57: "ェ",
    0x58: "ォ",
    0x59: "ッ",
    0x5A: "ャ",
    0x5B: "ュ",
    0x5C: "ョ",
    0x5D: "ヴ",
    0x5E: "ー",
    0x5F: "A",
    0x60: "B",
    0x61: "C",
    0x62: "D",
    0x63: "E",
    0x64: "F",
    0x65: "G",
    0x66: "H",
    0x67: "I",
    0x68: "J",
    0x69: "K",
    0x6A: "L",
    0x6B: "M",
    0x6C: "N",
    0x6D: "O",
    0x6E: "P",
    0x6F: "Q",
    0x70: "R",
    0x71: "S",
    0x72: "T",
    0x73: "U",
    0x74: "V",
    0x75: "W",
    0x76: "X",
    0x77: "Y",
    0x78: "Z",
    0x79: "a",
    0x7A: "b",
    0x7B: "c",
    0x7C: "d",
    0x7D: "e",
    0x7E: "f",
    0x7F: "g",
    0x80: "h",
    0x81: "i",
    0x82: "j",
    0x83: "k",
    0x84: "l",
    0x85: "m",
    0x86: "n",
    0x87: "o",
    0x88: "p",
    0x89: "q",
    0x8A: "r",
    0x8B: "s",
    0x8C: "t",
    0x8D: "u",
    0x8E: "v",
    0x8F: "w",
    0x90: "x",
    0x91: "y",
    0x92: "z",
    0x93: "あ",
    0x94: "い",
    0x95: "う",
    0x96: "え",
    0x97: "お",
    0x98: "か",
    0x99: "き",
    0x9A: "く",
    0x9B: "け",
    0x9C: "こ",
    0x9D: "さ",
    0x9E: "し",
    0x9F: "す",
    0xA0: "せ",
    0xA1: "そ",
    0xA2: "た",
    0xA3: "ち",
    0xA4: "つ",
    0xA5: "て",
    0xA6: "と",
    0xA7: "な",
    0xA8: "に",
    0xA9: "ぬ",
    0xAA: "ね",
    0xAB: "の",
    0xAC: "は",
    0xAD: "ひ",
    0xAE: "ふ",
    0xAF: "へ",
    0xB0: "ほ",
    0xB1: "ま",
    0xB2: "み",
    0xB3: "む",
    0xB4: "め",
    0xB5: "も",
    0xB6: "や",
    0xB7: "ゆ",
    0xB8: "よ",
    0xB9: "ら",
    0xBA: "り",
    0xBB: "る",
    0xBC: "れ",
    0xBD: "ろ",
    0xBE: "わ",
    0xBF: "ゐ",
    0xC0: "ゑ",
    0xC1: "を",
    0xC2: "ん",
    0xC3: "が",
    0xC4: "ぎ",
    0xC5: "ぐ",
    0xC6: "げ",
    0xC7: "ご",
    0xC8: "ざ",
    0xC9: "じ",
    0xCA: "ず",
    0xCB: "ぜ",
    0xCC: "ぞ",
    0xCD: "だ",
    0xCE: "ぢ",
    0xCF: "づ",
    0xD0: "で",
    0xD1: "ど",
    0xD2: "ば",
    0xD3: "び",
    0xD4: "ぶ",
    0xD5: "べ",
    0xD6: "ぼ",
    0xD7: "ぱ",
    0xD8: "ぴ",
    0xD9: "ぷ",
    0xDA: "ぺ",
    0xDB: "ぽ",
    0xDC: "ぁ",
    0xDD: "ぃ",
    0xDE: "ぅ",
    0xDF: "ぇ",
    0xE0: "ぉ",
    0xE1: "っ",
    0xE2: "ゃ",
    0xE3: "ゅ",
    0xE4: "ょ",
    0xE5: "!",
    0xE6: "‼️",
    0xE7: "?",
    0xE8: "\"",
    0xE9: "„",
    0xEA: "#",
    0xEB: "♭",
    0xEC: "$",
    0xED: "%",
    0xEE: "&",
    0xEF: "'",
    0xF0: "(",
    0xF1: ")",
    0xF2: "~",
    0xF3: "ˆ",
    0xF4: "˜",
    0xF5: "⌃",
    0xF6: "⌄",
    0xF7: "˂",
    0xF8: "˃",
    0xF9: ",",
    0xFA: "。",
    0xFB: ".",
    0xFC: "・",
    0xFD: "/",
    0xFE: "\\",
    0xFF: "_",
    0x100: "「",
    0x101: "」",
    0x102: "[",
    0x103: "]",
    0x104: "【",
    0x105: "】",
    0x106: "⊂",
    0x107: "⊃",
    0x108: "⋂",
    0x109: "💧",
    0x10A: "↑",
    0x10B: "→",
    0x10C: "↓",
    0x10D: "←",
    0x10E: "∀",
    0x10F: "α",
    0x110: "β",
    0x111: "★",
    0x112: "♥",
    0x113: "♪",
    0x114: "℃",
    0x115: "♂︎",
    0x116: "♀︎",
    0x117: "_",
    0x118: "|",
    0x119: "‾",
    0x11A: ":",
    0x11B: ";",
    0x11C: "…",
    0x11D: "¥",
    0x11E: "[+]",
    0x11F: "−",
    0x120: "×",
    0x121: "÷",
    0x122: "=",
    0x123: "※",
    0x124: "[*]",
    0x125: "○",
    0x126: "⬤",
    0x127: "◉",
    0x128: "□",
    0x129: "■",
    0x12A: "◇",
    0x12B: "◆",
    0x12C: "△",
    0x12D: "▲",
    0x12E: "▽",
    0x12F: "▼",
    0x130: "▶",
    0x131: "◀",
    0x132: "☛",
    0x133: "\\x0133",
    0x134: "\\x0134",
    0x135: "\\x0135",
    0x136: "\\x0136",
    0x137: "\\x0137",
    0x138: "\\x0138",
    0x139: "\\x0139",
    0x13A: "\\x013A",
    0x13B: "\\x013B",
    0x13C: "\\x013C",
    0x13D: "\\x013D",
    0x13E: "\\x013E",
    0x13F: "\\x013F",
    0x140: "\\x0140",
    0x141: "\\x0141",
    0x142: "\\x0142",
    0x143: "\\x0143",
    0x144: "\\x0144",
    0x145: "\\x0145",
    0x146: "\\x0146",
    0x147: "\\x0147",
    0x148: "\\x0148",
    0x149: "\\x0149",
    0x14A: "\\x014A",
    0x14B: "\\x014B",
    0x14C: "\\x014C",
    0x14D: "\\x014D",
    0x14E: "\\x014E",
    0x14F: "\\x014F",
    0x150: "\\x0150",
    0x151: "\\x0151",
    0x152: "\\x0152",
    0x153: "\\x0153",
    0x154: "\\x0154",
    0x155: "\\x0155",
    0x156: "\\x0156",
    0x157: "\\x0157",
    0x158: "\\x0158",
    0x159: "\\x0159",
    0x15A: "\\x015A",
    0x15B: "\\x015B",
    0x15C: "\\x015C",
    0x15D: "\\x015D",
    0x15E: "\\x015E",
    0x15F: "\\x015F",
    0x160: "\\x0160",
    0x161: "\\x0161",
    0x162: "\\x0162",
    0x163: "\\x0163",
    0x164: "\\x0164",
    0x165: "\\x0165",
    0x166: "\\x0166",
    0x167: "\\x0167",
    0x168: "\\x0168",
    0x169: "\\x0169",
    0x16A: "\\x016A",
    0x16B: "\\x016B",
    0x16C: "\\x016C",
    0x16D: "\\x016D",
    0x16E: "\\x016E",
    0x16F: "\\x016F",
    0x170: "\\x0170",
    0x171: "\\x0171",
    0x172: "\\x0172",
    0x173: "\\x0173",
    0x174: "\\x0174",
    0x175: "\\x0175",
    0x176: "\\x0176",
    0x177: "\\x0177",
    0x178: "\\x0178",
    0x179: "\\x0179",
    0x17A: "\\x017A",
    0x17B: "\\x017B",
    0x17C: "\\x017C",
    0x17D: "\\x017D",
    0x17E: "\\x017E",
    0x17F: "\\x017F",
    0x180: "\\x0180",
    0x181: "\\x0181",
    0x182: "\\x0182",
    0x183: "\\x0183",
    0x184: "\\x0184",
    0x185: "\\x0185",
    0x186: "\\x0186",
    0x187: "\\x0187",
    0x188: "\\x0188",
    0x189: "\\x0189",
    0x18A: "\\x018A",
    0x18B: "\\x018B",
    0x18C: "\\x018C",
    0x18D: "\\x018D",
    0x18E: "\\x018E",
    0x18F: "\\x018F",
    0x190: "¼",
    0x191: "[inf1]",
    0x192: "[inf2]",
    0x193: "\\x0193",
    0x194: "\\x0194",
    0x195: "\\x0195",
    0x196: "\\x0196",
    0x197: "\\x0197",
    0x198: "\\x0198",
    0x199: "\\x0199",
    0x19A: "\\x019A",
    0x19B: "\\x019B",
    0x19C: "\\x019C",
    0x19D: "\\x019D",
    0x19E: "\\x019E",
    0x19F: "\\x019F",
    0x1A0: "\\x01A0",
    0x1A1: "\\x01A1",
    0x1A2: "\\x01A2",
    0x1A3: "\\x01A3",
    0x1A4: "\\x01A4",
    0x1A5: "\\x01A5",
    0x1A6: "\\x01A6",
    0x1A7: "\\x01A7",
    0x1A8: "\\x01A8",
    0x1A9: "\\x01A9",
    0x1AA: "\\x01AA",
    0x1AB: "\\x01AB",
    0x1AC: "\\x01AC",
    0x1AD: "\\x01AD",
    0x1AE: "\\x01AE",
    0x1AF: "\\x01AF",
    0x1B0: "\\x01B0",
    0x1B1: "\\x01B1",
    0x1B2: "\\x01B2",
    0x1B3: "\\x01B3",
    0x1B4: "\\x01B4",
    0x1B5: "\\x01B5",
    0x1B6: "\\x01B6",
    0x1B7: "\\x01B7",
    0x1B8: "\\x01B8",
    0x1B9: "\\x01B9",
    0x1BA: "\\x01BA",
    0x1BB: "\\x01BB",
    0x1BC: "\\x01BC",
    0x1BD: "\\x01BD",
    0x1BE: "\\x01BE",
    0x1BF: "\\x01BF",
    0x1C0: "\\x01C0",
    0x1C1: "\\x01C1",
    0x1C2: "\\x01C2",
    0x1C3: "\\x01C3",
    0x1C4: "\\x01C4",
    0x1C5: "\\x01C5",
    0x1C6: "\\x01C6",
    0x1C7: "\\x01C7",
    0x1C8: "\\x01C8",
    0x1C9: "\\x01C9",
    0x1CA: "\\x01CA",
    0x1CB: "\\x01CB",
    0x1CC: "\\x01CC",
    0x1CD: "\\x01CD",
    0x1CE: "\\x01CE",
    0x1CF: "\\x01CF",
    0x1D0: "\\x01D0",
    0x1D1: "\\x01D1",
    0x1D2: "\\x01D2",
    0x1D3: "\\x01D3",
    0x1D4: "\\x01D4",
    0x1D5: "\\x01D5",
    0x1D6: "\\x01D6",
    0x1D7: "\\x01D7",
    0x1D8: "\\x01D8",
    0x1D9: "\\x01D9",
    0x1DA: "\\x01DA",
    0x1DB: "\\x01DB",
    0x1DC: "\\x01DC",
    0x1DD: "\\x01DD",
    0x1DE: "\\x01DE",
    0x1DF: "\\x01DF",
    0x1E0: "\\x01E0",
    0x1E1: "\\x01E1",
    0x1E2: "\\x01E2",
    0x1E3: "\\x01E3",
    0x1E4: "\\x01E4",
    0x1E5: "\\x01E5",
    0x1E6: "\\x01E6",
    0x1E7: "\\x01E7",
    0x1E8: "\\x01E8",
    0x1E9: "\\x01E9",
    0x1EA: "\\x01EA",
    0x1EB: "\\x01EB",
    0x1EC: "\\x01EC",
    0x1ED: "\\x01ED",
    0x1EE: "\\x01EE",
    0x1EF: "\\x01EF",
    0x1F0: "\\x01F0",
    0x1F1: "\\x01F1",
    0x1F2: "\\x01F2",
    0x1F3: "\\x01F3",
    0x1F4: "\\x01F4",
    0x1F5: "\\x01F5",
    0x1F6: "\\x01F6",
    0x1F7: "\\x01F7",
    0x1F8: "\\x01F8",
    0x1F9: "\\x01F9",
    0x1FA: "\\x01FA",
    0x1FB: "\\x01FB",
    0x1FC: "\\x01FC",
    0x1FD: "\\x01FD",
    0x1FE: "\\x01FE",
    0x1FF: "\\x01FF"
}


def arg_list(infile, count = 1, func = lambda inf, i: f"${get_byte(inf):02X}"):
    argList = []
    for i in range(count):
        arg = str(func(infile, i))
        if arg != "":
            argList.append(arg)
    return ", ".join(argList)


def key_item(bt):
    itemList = {
        0x00: "PET",
        0x01: "IceBlock",
        0x02: "WaterGun",
        0x03: "SchoolID",
        0x04: "SciLabID",
        0x05: "Handle",
        0x06: "Message",
        0x07: "Response",
        0x08: "WWW PIN",
        0x09: "BatteryA",
        0x0A: "BatteryB",
        0x0B: "BatteryC",
        0x0C: "BatteryD",
        0x0D: "BatteryE",
        0x0E: "Charger",
        0x0F: "WWW Pass",
        0x11: "Dentures",
        0x21: "★Mayl",
        0x22: "★Yai",
        0x23: "★Dex",
        0x25: "★Dad",
        0x26: "★Sal",
        0x28: "★Miyu",
        0x2B: "★Masa",
        0x2D: "★WWW",
        0x30: "/Dex",
        0x31: "/Sal",
        0x32: "/Miyu",
        0x34: "Hig Memo",
        0x35: "Lab Memo",
        0x36: "YuriMemo",
        0x37: "Pa'sMemo",
        0x3C: "ACDCPass",
        0x3D: "GovtPass",
        0x3E: "TownPass",
        0x40: "HPmemory",
        0x41: "PowerUP",
        0x42: "Armor",
        0x44: "HeatArmr",
        0x45: "AquaArmr",
        0x46: "WoodArmr"
    }
    return f"{itemList[bt]}" if bt in itemList else f"${bt:02X}"


def chip_id(bt):
    idSet = {
        0x00: "Buster",
        0x01: "Cannon",
        0x02: "HiCannon",
        0x03: "MーCannon",
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
        0x40: "XーPanel1",
        0x41: "XーPanel3",
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
        0xC7: "Bass",
        0xCA: "ZーCanon1",
        0xCB: "ZーCanon2",
        0xCC: "ZーCanon3",
        0xCD: "ZーSpread",
        0xCE: "ZーRaton1",
        0xCF: "ZーRaton2",
        0xD0: "ZーRaton3",
        0xD1: "ZーArrow",
        0xD2: "ZーSpear",
        0xD3: "ZーLance",
        0xD4: "OーCanon1",
        0xD5: "OーCanon2",
        0xD6: "OーCanon3",
        0xD7: "OーSpread",
        0xD8: "OーRaton1",
        0xD9: "OーRaton2",
        0xDA: "OーRaton3",
        0xDB: "OーArrow",
        0xDC: "OーSpear",
        0xDD: "OーLance",
        0xDE: "BーBomb",
        0xDF: "BーSword",
        0xE0: "BーWave",
        0xE1: "BーQuake",
        0xE2: "SーBomb",
        0xE3: "SーSword",
        0xE4: "SーWave",
        0xE5: "SーQuake",
        0xE6: "PwrCanon",
        0xE7: "HvyStamp",
        0xE8: "BgStrait",
        0xE9: "BloodSuk",
        0xEA: "Storm",
        0xEB: "GtsShoot",
        0xEC: "LifeSavr",
        0xED: "2xHero",
        0xF0: "HPmemory",
        0xF1: "PowerUP",
        0xF2: "PharTrap",
        0xF4: "HeatArmr",
        0xF5: "AquaArmr",
        0xF6: "WoodArmr"
    }
    return idSet[bt] if bt in idSet else f"${bt:02X}"


def chip_code(bt):
    return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"[bt] if bt < 26 else f"${bt:02X}"


def get_item(infile):
    return f"'{key_item(get_byte(infile))}'"


def get_chip_id(infile):
    return f"'{chip_id(get_byte(infile))}'"


def get_chip_code(infile):
    return f"'{chip_code(get_byte(infile))}'"


def get_chip(infile):
    return f"'{chip_id(get_byte(infile))} {chip_code(get_byte(infile))}'"


def get_int(infile):
    return struct.unpack("I", infile.read(4))[0]


def get_short(infile):
    return struct.unpack('H', infile.read(2))[0]


def get_byte(infile):
    return infile.read(1)[0]


#region Commands
def Com_E7(infile):
    delay = get_short(infile)
    if delay == 0:
        textBuf = "[end]"
    else:
        textBuf = f"[end({delay})]"
    return True, textBuf


def Com_E8(infile):
    return False, "\\n"


def Com_E9(infile):
    delay = get_short(infile)
    if delay == 0:
        textBuf = "[wait]"
    else:
        textBuf = f"[wait({delay})]"
    return False, textBuf


def Com_EA(infile):
    command = get_byte(infile)
    isDone = False
    if command == 0:
        delay = get_short(infile)
        textBuf = f"[break({delay})]"
    elif command == 1:
        delay = get_short(infile)
        if delay == 30:
            textBuf = "[delay]"
        else:
            textBuf = f"[delay({delay})]"
    else:
        textBuf = f"[stop]"
        isDone = True
    return isDone, textBuf


def Com_EB(infile):
    return False, "[page]"


def Com_EC(infile):
    command = get_byte(infile)
    if command == 0:
        delay = get_byte(infile)
        textBuf = f"[setdelay({delay})]"
    elif command == 1:
        textBuf = "[skipon]"
    else:
        textBuf = "[skipoff]"
    return False, textBuf


def Com_ED(infile):
    command = get_byte(infile)
    if command == 1:
        textBuf = "[hidepic]"
    elif command == 2:
        pal = get_byte(infile)
        textBuf = f"[picpal({pal})]"
    else:
        pic = get_byte(infile)
        pal = get_byte(infile)
        if pal == 0:
            textBuf = f"[pic({pic})]"
        else:
            textBuf = f"[pic({pic}, {pal})]"
    return False, textBuf


def Com_EE(infile):
    anim = get_byte(infile)
    return False, f"[pic_anim({anim})]"


def Com_EF(infile):
    command = get_byte(infile)
    count = get_byte(infile)
    if command == 0:
        textBuf = f"[pad({count})]"
    else:
        textBuf = f"[col({count})]"
    return False, textBuf


def Com_F0(infile):
    optpack = get_short(infile)
    rt = (optpack >> 0x0) & 0xF
    lt = (optpack >> 0x4) & 0xF
    dn = (optpack >> 0x8) & 0xF
    up = (optpack >> 0xC) & 0xF
    return False, f"[option({up}, {dn}, {lt}, {rt})]"


def Com_F1(infile):
    comlen = get_byte(infile)
    opt = get_byte(infile)
    defpick = opt & 0x3F
    isDisableB = (opt >> 6) & 1 != 0
    clearAfterPick = (opt >> 7) & 1 != 0
    argList = []
    for _ in range(comlen - 3):
        argList.append(f"${get_byte(infile):02X}")
    args = ", ".join(argList)
    return False, f"[pick([{args}], {defpick}, {isDisableB}, {clearAfterPick})]"


def Com_F2(infile):
    command = get_byte(infile)
    isDone = False
    if command == 1:
        textBuf = "[down]"
        isDone = True
    elif command == 2:
        textBuf = "[show]"
    elif command == 3:
        textBuf = "[hide]"
        isDone = True
    else:
        textBuf = "[up]"
    return isDone, textBuf


def Com_F3(infile):
    command = get_byte(infile) >> 2
    flagpack = get_short(infile)
    off = flagpack >> 3
    flag = flagpack & 7
    if command == 0:
        textBuf = f"[setflag({off}, {flag})]"
    elif command == 1:
        textBuf = f"[clearflag({off}, {flag})]"
    else:
        textBuf = f"[mail({off}, {flag})]"
    return False, textBuf


def Com_F4(infile):
    command = get_byte(infile) >> 2
    if command == 0:
        def proc(inf, i):
            if i == 0:
                flagpack = get_short(inf)
                off = flagpack >> 3
                flag = flagpack & 7
                return f"{off}, {flag}"
            else:
                return arg_list(inf)
        textBuf = f"[ifflag({arg_list(infile, 3, proc)})]"
    elif command == 1:
        textBuf = f"[ifstory({arg_list(infile, 4)})]"
    elif command == 2:
        textBuf = f"[ifshop({arg_list(infile, 3)})]"
    elif command == 3:
        def proc(inf, i):
            if i == 0:
                return get_chip(infile)
            else:
                return arg_list(inf)
        textBuf = f"[ifchip({arg_list(infile, 3, proc)})]"
    elif command == 4:
        def proc(inf, i):
            if i == 0 or i == 1:
                return get_byte(inf)
            else:
                return arg_list(inf)
        textBuf = f"[iflevel({arg_list(infile, 4, proc)})]"
    elif command == 5:
        def proc(inf, i):
            if i == 0 or i == 1:
                lv = get_byte(inf)
                return f"'{lv}'" if lv < 11 else "'S'"
            else:
                return arg_list(inf)
        textBuf = f"[ifbust({arg_list(infile, 4, proc)})]"
    elif command == 6:
        def proc(inf, i):
            if i == 0 or i == 1:
                return get_byte(inf)
            else:
                return arg_list(inf)
        textBuf = f"[iflibrary({arg_list(infile, 4, proc)})]"
    else:
        textBuf = f"[_F4({command})]"
    return False, textBuf


def Com_F5(infile):
    command = get_byte(infile)
    if command == 0:
        textBuf = "[input_off]"
    else:
        textBuf = "[input_on]"
    return False, textBuf


def Com_F6(infile):
    command = get_byte(infile)
    args = arg_list(infile, command + 1)
    if command == 0:
        textBuf = f"[jump({args})]"
    else:
        textBuf = f"[jump([{args}])]"
    return True, textBuf


def Com_F7(infile):
    command = get_byte(infile)
    def proc_item(inf, i):
        if i == 0:
            return get_item(infile)
        elif i == 1:
            return get_byte(infile)
        else:
            return arg_list(infile)
    def proc_chip(inf, i):
        if i == 0:
            return get_chip(infile)
        elif i == 1:
            return get_byte(infile)
        else:
            return arg_list(infile)
    if command & 0x10 == 0:
        if command == 0x00:
            textBuf = f"[additem({arg_list(infile, 5, proc_item)})]"
        elif command == 0x01:
            textBuf = f"[subitem({arg_list(infile, 5, proc_item)})]"
        elif command == 0x02:
            textBuf = f"[setitem({arg_list(infile, 2, proc_item)})]"
        else:
            textBuf = f"[checkitem({arg_list(infile, 5, proc_item)})]"
    else:
        if command == 0x10:
            textBuf = f"[addchip({arg_list(infile, 5, proc_chip)})]"
        elif command == 0x11:
            textBuf = f"[subchip({arg_list(infile, 5, proc_chip)})]"
        elif command == 0x12:
            textBuf = f"[setchip({arg_list(infile, 5, proc_chip)})]"
        elif command == 0x14:
            textBuf = f"[checkchip({arg_list(infile, 5, proc_chip)})]"
        else:
            textBuf = f"[checkchippack({arg_list(infile, 5, proc_chip)})]"
    return False, textBuf


def Com_F8(infile):
    command = get_byte(infile) >> 2
    if command == 0:
        textBuf = f"[passcode({arg_list(infile, 2)})]"
    elif command == 1:
        textBuf = f"[passcode_pick({arg_list(infile, 4)})]"
    elif command == 2:
        textBuf = f"[passcode_check({arg_list(infile, 7)})]"
    elif command == 3:
        textBuf = f"[passcode_hide]"
    elif command == 4:
        textBuf = f"[passcode_shift({arg_list(infile, 4)})]"
    else:
        textBuf = f"[_F8_{command}()]"
    return False, textBuf


def Com_F9(infile):
    return False, f"[textpal({get_byte(infile)})]"


def Com_FA(infile):
    command = get_byte(infile) >> 2
    if command == 0:
        textBuf = "[pclock]"
    elif command == 1:
        anim = get_byte(infile)
        textBuf = f"[pc({anim})]"
    elif command == 2:
        textBuf = "[pcunlock]"
    elif command == 3:
        textBuf = "[pcwait]"
    elif command == 4:
        textBuf = "[pcrestore]"
    else:
        textBuf = f"[F4_{command}]"
    return False, textBuf


def Com_FB(infile):
    command = get_byte(infile) >> 2
    if command == 0:
        itemid = get_byte(infile)
        itempack = get_byte(infile)
        itemtype = itempack & 0xF
        buf = (itempack >> 4) & 0xF
        arg = ""
        if itemtype > 2:
            textBuf = f"[FB_0(${itemid:02X}, ${itempack:02X})]"
        else:
            if buf == 0:
                if itemtype == 0:
                    arg = "'" + key_item(itemid) + "'"
                elif itemtype == 1:
                    arg = "'" + chip_id(itemid) + "'"
                else:
                    arg = "'" + chip_code(itemid) + "'"
            else:
                arg = f"buf{buf - 1}"
            if itemtype == 0:
                textBuf = f"[item({arg})]"
            elif itemtype == 1:
                textBuf = f"[chip_id({arg})]"
            else:
                textBuf = f"[chip_code({arg})]"
    elif command == 1:
        flags = get_byte(infile)
        minlen = flags & 0xF
        isPadZero = (flags & 0x40) != 0
        isPadLeft = (flags & 0x80) != 0
        item = get_item(infile)
        textBuf = f"[item_amt({item}, {minlen}, {isPadZero}, {isPadLeft})]"
    elif command == 3:
        flags = get_byte(infile)
        minlen = flags & 0xF
        isPadZero = (flags & 0x40) != 0
        isPadLeft = (flags & 0x80) != 0
        buf = get_byte(infile)
        arg = ""
        if buf == 0:
            arg = "zenny"
        else:
            arg = f"zenny:{buf}"
        textBuf = f"[print({arg}, {minlen}, {isPadZero}, {isPadLeft})]"
    else:
        textBuf = f"[FB_{command}]"
    return False, textBuf


def Com_FC(infile):
    command = get_byte(infile) >> 2
    if command == 0:
        soundId = get_short(infile)
        textBuf = f"[se(${soundId:02X})]"
    elif command == 1:
        songId = get_short(infile)
        textBuf = f"[song(${songId:02X})]"
    elif command == 2:
        textBuf = "[text_se_on]"
    elif command == 3:
        textBuf = "[text_se_off]"
    elif command == 4:
        textBuf = "[all_sound_off]"
    elif command == 5:
        playerId = get_byte(infile)
        speed = get_byte(infile)
        textBuf = f"[song_fade({playerId}, {speed})]"
    else:
        textBuf = f"[FC_{command}]"
    return False, textBuf


def Com_FD(infile):
    command = get_byte(infile) >> 2
    isDone = False
    if command == 0:
        count = get_byte(infile)
        jump = get_byte(infile)
        get_short(infile)
        argList = []
        for _ in range(count + 1):
            argList.append(str(get_int(infile)))
        zen = ", ".join(argList)
        textBuf = f"[addzenny([{zen}], ${jump:02X})]"
    elif command == 1:
        count = get_byte(infile)
        getall = get_byte(infile)
        getnone = get_byte(infile)
        getsome = get_byte(infile)
        chpL = ", ".join([f"{chip_id(get_byte(infile))} {chip_code(get_byte(infile))}" for _ in range(count + 1)])
        if getall == getnone == getsome == 0xFF:
            textBuf = f"[addchip([{chpL}])]"
        else:
            textBuf = f"[addchip([{chpL}], ${getall:02X}, ${getsome:02X}, ${getnone:02X})]"
    elif command == 2:
        textBuf = "[battle]"
    elif command == 3:
        textBuf = f"[shop_open({get_byte(infile)})]"
        isDone = True
    else:
        textBuf = f"[FD_{command}]"
    return isDone, textBuf


def Com_FE(infile):
    savegood = get_byte(infile)
    savebad = get_byte(infile)
    isDone = not (savegood == 0xFF and savebad == 0xFF)
    return isDone, f"[save(${savegood:02X}, ${savebad:02X})]"
#endregion


def interpret(infile):
    funcList = [
        Com_E7,
        Com_E8,
        Com_E9,
        Com_EA,
        Com_EB,
        Com_EC,
        Com_ED,
        Com_EE,
        Com_EF,
        Com_F0,
        Com_F1,
        Com_F2,
        Com_F3,
        Com_F4,
        Com_F5,
        Com_F6,
        Com_F7,
        Com_F8,
        Com_F9,
        Com_FA,
        Com_FB,
        Com_FC,
        Com_FD,
        Com_FE
    ]
    textBuf = ""
    isDone = False
    chr = get_byte(infile)
    if chr <= 0xE4:
        textBuf = charmap[chr]
    elif chr == 0xE5:
        chr2 = get_byte(infile)
        textBuf = charmap[chr2 + 0xE5]
    elif chr == 0xE6:
        chr2 = get_byte(infile)
        textBuf = charmap[chr2 + 0x1E5]
    elif chr < 0xFF:
        isDone, textBuf = funcList[chr - 0xE7](infile)
    else:
        textBuf = f"[Com_{chr:02X}]"
    return isDone, textBuf


def interpretUi(infile):
    textBuf = ""
    isDone = False
    c = get_byte(infile)
    if c == 0xE5:
        c2 = get_byte(infile) + 0xE5
        textBuf = charmap[c2]
    elif c == 0xE6:
        c2 = get_byte(infile) + 0x1E5
        textBuf = charmap[c2 % 0x200]
    elif c == 0xE7:
        textBuf = "[end]"
        isDone = True
    elif c == 0xE8:
        textBuf = "\\n"
    elif c == 0xE9:
        bcdIndex = get_byte(infile)
        commandNum = get_byte(infile)
        textBuf = f"[Func2({bcdIndex}, 0x{commandNum:X})]"
    else:
        textBuf = charmap[c]
    return isDone, textBuf


def engine1(infile, args):
    output = ""
    offsetlist = get_text_offset_list(infile, args)
    idx = 0
    for off in offsetlist:
        infile.seek(off)
        la = infile.peek()
        if la[0] != 0:
            txbuf = ""
            while True:
                interp = interpretUi(infile) if isUi(args) else interpret(infile)
                txbuf += interp[1]
                if interp[0]:
                    break
            output += f"<{idx:02X} | {off:X}>{txbuf}\n"
        idx += 1
    return output


def main():
    def auto_int(x):
        return int(x, 0)
    parser = argparse.ArgumentParser(description='Extract scripts from Mega Man Battle Network.')
    parser.add_argument('-ui', '--ui-string', action='count', default=0,
                        help='Use UI parsing rules.')
    parser.add_argument('path', type=str, help='The path to the binary.')
    parser.add_argument('blockOffset', type=auto_int, help='The offset into the binary.')
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    outPath = f"{args.blockOffset:08x}.txt"
    of = ""
    with open(inPath, mode='rb') as infile:
        of = engine1(infile, args)
    with open(outPath, mode='w', encoding='utf-8') as outFile:
        outFile.write(of)
    os.startfile(outPath)


if __name__ == "__main__":
    main()
