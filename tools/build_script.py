#!/usr/bin/python3
import argparse
import io
import shlex
from pathlib import Path
from typing import List, Union
import re

from common import auto_int, is_int


class Section:
    def __init__(self):
        self.buffer: io.BytesIO = io.BytesIO()
        self.len = 0

    def size(self) -> int:
        return 2 if self.len == 0 else self.len

    def emitByte(self, b: int) -> None:
        self.buffer.write(bytes([b & 0xFF]))
        self.len += 1

    def emitShort(self, b: int) -> None:
        self.buffer.write(bytes([b & 0xFF, (b >> 8) & 0xFF]))
        self.len += 2

    def emitInt(self, b: int) -> None:
        self.buffer.write(
            bytes([b & 0xFF, (b >> 8) & 0xFF, (b >> 16) & 0xFF, (b >> 24) & 0xFF])
        )
        self.len += 4

    def getbuffer(self) -> bytes:
        if self.len == 0:
            return bytes([0, 0])
        else:
            return self.buffer.getbuffer()


class Script:
    def __init__(self):
        self.current_section = 0
        self.sections: List[Section] = []

    def setScriptCount(self, size: int):
        if size > 0 and size > len(self.sections):
            for _ in range(size - len(self.sections)):
                self.sections.append(Section())

    def selectSection(self, sectionIndex: int) -> None:
        self.current_section = sectionIndex
        if self.current_section < 0:
            self.current_section = 0
        while len(self.sections) < self.current_section + 1:
            self.sections.append(Section())

    def emitByte(self, b: int) -> None:
        self.sections[self.current_section].emitByte(b)

    def emitShort(self, b: int) -> None:
        self.sections[self.current_section].emitShort(b)

    def emitInt(self, b: int) -> None:
        self.sections[self.current_section].emitInt(b)

    def writeToFile(self, outPath: Path) -> None:
        outBuffer = io.BytesIO()
        offset = len(self.sections) * 2
        ind = 0
        align = offset
        for section in self.sections:
            outBuffer.write(bytes([offset & 0xFF]))
            outBuffer.write(bytes([(offset >> 8) & 0xFF]))
            offset += section.size()
            ind += 1
        for section in self.sections:
            outBuffer.write(section.getbuffer())
            align += section.size()
        align = align % 4
        with open(outPath, "wb") as oFile:
            oFile.write(outBuffer.getbuffer())
            if align != 0:
                while align % 4 != 0:
                    oFile.write(bytes([0]))
                    align += 1


class Reader:
    def __init__(self, string: str):
        self.buffer = string
        self.pos = 0

    def isEmpty(self) -> bool:
        return self.pos >= len(self.buffer)

    def read(self) -> str:
        if self.isEmpty():
            return ""
        else:
            ch = self.buffer[self.pos]
            self.pos = self.pos + 1
            return ch

    def seek(self, count: int) -> None:
        self.pos += count
        if self.pos < 0:
            self.pos = 0
        if self.pos > len(self.buffer):
            self.pos = len(self.buffer)

    def peek(self) -> str:
        if self.isEmpty():
            return ""
        else:
            return self.buffer[self.pos]

    def left(self) -> int:
        if self.isEmpty():
            return 0
        else:
            return len(self.buffer) - self.pos


curScript: Script = Script()

# region
charmap_basic = {
    " ": 0x00,
    "0": 0x01,
    "1": 0x02,
    "2": 0x03,
    "3": 0x04,
    "4": 0x05,
    "5": 0x06,
    "6": 0x07,
    "7": 0x08,
    "8": 0x09,
    "9": 0x0A,
    # "[Lv.]": 0x0B,
    "∥": 0x0C,
    "ウ": 0x0D,
    "エ": 0x0E,
    "オ": 0x0F,
    "カ": 0x10,
    "キ": 0x11,
    "ク": 0x12,
    "ケ": 0x13,
    "コ": 0x14,
    "サ": 0x15,
    "シ": 0x16,
    "ス": 0x17,
    "セ": 0x18,
    "ソ": 0x19,
    "タ": 0x1A,
    "チ": 0x1B,
    "ツ": 0x1C,
    "テ": 0x1D,
    "ト": 0x1E,
    "ナ": 0x1F,
    "ニ": 0x20,
    "ヌ": 0x21,
    "ネ": 0x22,
    "ノ": 0x23,
    "ハ": 0x24,
    "ヒ": 0x25,
    "フ": 0x26,
    "ヘ": 0x27,
    "ホ": 0x28,
    "マ": 0x29,
    "ミ": 0x2A,
    "ム": 0x2B,
    "メ": 0x2C,
    "モ": 0x2D,
    "ヤ": 0x2E,
    "ユ": 0x2F,
    "ヨ": 0x30,
    "ラ": 0x31,
    "リ": 0x32,
    "ル": 0x33,
    "レ": 0x34,
    "ロ": 0x35,
    "ワ": 0x36,
    "ヰ": 0x37,
    "ヱ": 0x38,
    "ヲ": 0x39,
    "ン": 0x3A,
    "ガ": 0x3B,
    "ギ": 0x3C,
    "グ": 0x3D,
    "ゲ": 0x3E,
    "ゴ": 0x3F,
    "ザ": 0x40,
    "ジ": 0x41,
    "ズ": 0x42,
    "ゼ": 0x43,
    "ゾ": 0x44,
    "ダ": 0x45,
    "ヂ": 0x46,
    "ヅ": 0x47,
    "デ": 0x48,
    "ド": 0x49,
    "バ": 0x4A,
    "ビ": 0x4B,
    "ブ": 0x4C,
    "ベ": 0x4D,
    "ボ": 0x4E,
    "パ": 0x4F,
    "ピ": 0x50,
    "プ": 0x51,
    "ペ": 0x52,
    "ポ": 0x53,
    "ァ": 0x54,
    "ィ": 0x55,
    "ゥ": 0x56,
    "ェ": 0x57,
    "ォ": 0x58,
    "ッ": 0x59,
    "ャ": 0x5A,
    "ュ": 0x5B,
    "ョ": 0x5C,
    "ヴ": 0x5D,
    "ー": 0x5E,
    "A": 0x5F,
    "B": 0x60,
    "C": 0x61,
    "D": 0x62,
    "E": 0x63,
    "F": 0x64,
    "G": 0x65,
    "H": 0x66,
    "I": 0x67,
    "J": 0x68,
    "K": 0x69,
    "L": 0x6A,
    "M": 0x6B,
    "N": 0x6C,
    "O": 0x6D,
    "P": 0x6E,
    "Q": 0x6F,
    "R": 0x70,
    "S": 0x71,
    "T": 0x72,
    "U": 0x73,
    "V": 0x74,
    "W": 0x75,
    "X": 0x76,
    "Y": 0x77,
    "Z": 0x78,
    "a": 0x79,
    "b": 0x7A,
    "c": 0x7B,
    "d": 0x7C,
    "e": 0x7D,
    "f": 0x7E,
    "g": 0x7F,
    "h": 0x80,
    "i": 0x81,
    "j": 0x82,
    "k": 0x83,
    "l": 0x84,
    "m": 0x85,
    "n": 0x86,
    "o": 0x87,
    "p": 0x88,
    "q": 0x89,
    "r": 0x8A,
    "s": 0x8B,
    "t": 0x8C,
    "u": 0x8D,
    "v": 0x8E,
    "w": 0x8F,
    "x": 0x90,
    "y": 0x91,
    "z": 0x92,
    "あ": 0x93,
    "い": 0x94,
    "う": 0x95,
    "え": 0x96,
    "お": 0x97,
    "か": 0x98,
    "き": 0x99,
    "く": 0x9A,
    "け": 0x9B,
    "こ": 0x9C,
    "さ": 0x9D,
    "し": 0x9E,
    "す": 0x9F,
    "せ": 0xA0,
    "そ": 0xA1,
    "た": 0xA2,
    "ち": 0xA3,
    "つ": 0xA4,
    "て": 0xA5,
    "と": 0xA6,
    "な": 0xA7,
    "に": 0xA8,
    "ぬ": 0xA9,
    "ね": 0xAA,
    "の": 0xAB,
    "は": 0xAC,
    "ひ": 0xAD,
    "ふ": 0xAE,
    "へ": 0xAF,
    "ほ": 0xB0,
    "ま": 0xB1,
    "み": 0xB2,
    "む": 0xB3,
    "め": 0xB4,
    "も": 0xB5,
    "や": 0xB6,
    "ゆ": 0xB7,
    "よ": 0xB8,
    "ら": 0xB9,
    "り": 0xBA,
    "る": 0xBB,
    "れ": 0xBC,
    "ろ": 0xBD,
    "わ": 0xBE,
    "ゐ": 0xBF,
    "ゑ": 0xC0,
    "を": 0xC1,
    "ん": 0xC2,
    "が": 0xC3,
    "ぎ": 0xC4,
    "ぐ": 0xC5,
    "げ": 0xC6,
    "ご": 0xC7,
    "ざ": 0xC8,
    "じ": 0xC9,
    "ず": 0xCA,
    "ぜ": 0xCB,
    "ぞ": 0xCC,
    "だ": 0xCD,
    "ぢ": 0xCE,
    "づ": 0xCF,
    "で": 0xD0,
    "ど": 0xD1,
    "ば": 0xD2,
    "び": 0xD3,
    "ぶ": 0xD4,
    "べ": 0xD5,
    "ぼ": 0xD6,
    "ぱ": 0xD7,
    "ぴ": 0xD8,
    "ぷ": 0xD9,
    "ぺ": 0xDA,
    "ぽ": 0xDB,
    "ぁ": 0xDC,
    "ぃ": 0xDD,
    "ぅ": 0xDE,
    "ぇ": 0xDF,
    "ぉ": 0xE0,
    "っ": 0xE1,
    "ゃ": 0xE2,
    "ゅ": 0xE3,
    "ょ": 0xE4,
    "\n": 0xE8,
}


charmap_E5 = {
    "!": 0x00,
    "‼️": 0x01,
    "?": 0x02,
    '"': 0x03,
    "„": 0x04,
    "#": 0x05,
    "♭": 0x06,
    "$": 0x07,
    "%": 0x08,
    "&": 0x09,
    "'": 0x0A,
    "(": 0x0B,
    ")": 0x0C,
    "~": 0x0D,
    "ˆ": 0x0E,
    "˜": 0x0F,
    "⌃": 0x10,
    "⌄": 0x11,
    "˂": 0x12,
    "˃": 0x13,
    ",": 0x14,
    "。": 0x15,
    ".": 0x16,
    "・": 0x17,
    "/": 0x18,
    "\\": 0x19,
    "_": 0x1A,
    "「": 0x1B,
    "」": 0x1C,
    "[": 0x1D,
    "]": 0x1E,
    "【": 0x1F,
    "】": 0x20,
    "⊂": 0x21,
    "⊃": 0x22,
    "⋂": 0x23,
    "💧": 0x24,
    "↑": 0x25,
    "→": 0x26,
    "↓": 0x27,
    "←": 0x28,
    "∀": 0x29,
    "α": 0x2A,
    "β": 0x2B,
    "★": 0x2C,
    "♥": 0x2D,
    "♪": 0x2E,
    "℃": 0x2F,
    "♂︎": 0x30,
    "♀︎": 0x31,
    # "_": 0x32,
    "|": 0x33,
    "‾": 0x34,
    ":": 0x35,
    ";": 0x36,
    "…": 0x37,
    "¥": 0x38,
    # "[+]": 0x39,
    "−": 0x3A,
    "×": 0x3B,
    "÷": 0x3C,
    "=": 0x3D,
    "※": 0x3E,
    "*": 0x3F,
    "○": 0x40,
    "⬤": 0x41,
    "◉": 0x42,
    "□": 0x43,
    "■": 0x44,
    "◇": 0x45,
    "◆": 0x46,
    "△": 0x47,
    "▲": 0x48,
    "▽": 0x49,
    "▼": 0x4A,
    "▶": 0x4B,
    "◀": 0x4C,
    "☛": 0x4D,
    "¼": 0xAB,
    # "[inf1]": 0xAC,
    # "[inf2]": 0xAD
}


charmap_bold = {
    " ": 0x00,
    "0": 0x01,
    "1": 0x02,
    "2": 0x03,
    "3": 0x04,
    "4": 0x05,
    "5": 0x06,
    "6": 0x07,
    "7": 0x08,
    "8": 0x09,
    "9": 0x0A,
    "ー": 0x5E,
    "A": 0x5F,
    "B": 0x60,
    "C": 0x61,
    "D": 0x62,
    "E": 0x63,
    "F": 0x64,
    "G": 0x65,
    "H": 0x66,
    "I": 0x67,
    "J": 0x68,
    "K": 0x69,
    "L": 0x6A,
    "M": 0x6B,
    "N": 0x6C,
    "O": 0x6D,
    "P": 0x6E,
    "Q": 0x6F,
    "R": 0x70,
    "S": 0x71,
    "T": 0x72,
    "U": 0x73,
    "V": 0x74,
    "W": 0x75,
    "X": 0x76,
    "Y": 0x77,
    "Z": 0x78,
    "a": 0x79,
    "b": 0x7A,
    "c": 0x7B,
    "d": 0x7C,
    "e": 0x7D,
    "f": 0x7E,
    "g": 0x7F,
    "h": 0x80,
    "i": 0x81,
    "j": 0x82,
    "k": 0x83,
    "l": 0x84,
    "m": 0x85,
    "n": 0x86,
    "o": 0x87,
    "p": 0x88,
    "q": 0x89,
    "r": 0x8A,
    "s": 0x8B,
    "t": 0x8C,
    "u": 0x8D,
    "v": 0x8E,
    "w": 0x8F,
    "x": 0x90,
    "y": 0x91,
    "z": 0x92,
    ".": 0x93,
    "×": 0x94,
    "=": 0x95,
    ":": 0x96,
}


key_item_map = {
    "PET": 0x00,
    "IceBlock": 0x01,
    "WaterGun": 0x02,
    "SchoolID": 0x03,
    "SciLabID": 0x04,
    "Handle": 0x05,
    "Message": 0x06,
    "Response": 0x07,
    "WWW_PIN": 0x08,
    "BatteryA": 0x09,
    "BatteryB": 0x0A,
    "BatteryC": 0x0B,
    "BatteryD": 0x0C,
    "BatteryE": 0x0D,
    "BattA_Ct": 0x50,
    "BattB_Ct": 0x51,
    "BattC_Ct": 0x52,
    "BattD_Ct": 0x53,
    "BattE_Ct": 0x54,
    "Charger": 0x0E,
    "WWW_Pass": 0x0F,
    "Dentures": 0x11,
    "★Mayl": 0x21,
    "★Yai": 0x22,
    "★Dex": 0x23,
    "★Dad": 0x25,
    "★Sal": 0x26,
    "★Miyu": 0x28,
    "★Masa": 0x2B,
    "★WWW": 0x2D,
    "/Dex": 0x30,
    "/Sal": 0x31,
    "/Miyu": 0x32,
    "Hig_Memo": 0x34,
    "Lab_Memo": 0x35,
    "YuriMemo": 0x36,
    "Pa_sMemo": 0x37,
    "ACDCPass": 0x3C,
    "GovtPass": 0x3D,
    "TownPass": 0x3E,
    "HPmemory": 0x40,
    "PowerUP": 0x41,
    "Armor": 0x42,
    "HeatArmr": 0x44,
    "AquaArmr": 0x45,
    "WoodArmr": 0x46,
}


chip_id_map = {
    "Buster": 0x00,
    "Cannon": 0x01,
    "HiCannon": 0x02,
    "M-Cannon": 0x03,
    "Sword": 0x04,
    "WideSwrd": 0x05,
    "LongSwrd": 0x06,
    "LilBomb": 0x07,
    "CrosBomb": 0x08,
    "BigBomb": 0x09,
    "Spreader": 0x0A,
    "Bubbler": 0x0B,
    "Heater": 0x0C,
    "MiniBomb": 0x0D,
    "Shotgun": 0x0E,
    "CrossGun": 0x0F,
    "ShokWave": 0x10,
    "SoniWave": 0x11,
    "DynaWave": 0x12,
    "FireTowr": 0x13,
    "AquaTowr": 0x14,
    "WoodTowr": 0x15,
    "Quake1": 0x16,
    "Quake2": 0x17,
    "Quake3": 0x18,
    "FireSwrd": 0x19,
    "ElecSwrd": 0x1A,
    "AquaSwrd": 0x1B,
    "GutsPnch": 0x1C,
    "IcePunch": 0x1D,
    "FtrSword": 0x1E,
    "Dash": 0x1F,
    "KngtSwrd": 0x20,
    "HeroSwrd": 0x21,
    "MetGuard": 0x22,
    "TriArrow": 0x25,
    "TriSpear": 0x26,
    "TriLance": 0x27,
    "Typhoon": 0x28,
    "Huricane": 0x29,
    "Cyclone": 0x2A,
    "Howitzer": 0x2B,
    "Thunder1": 0x2C,
    "Thunder2": 0x2D,
    "Thunder3": 0x2E,
    "Snakegg1": 0x31,
    "Snakegg2": 0x32,
    "Snakegg3": 0x33,
    "Hammer": 0x34,
    "BodyBurn": 0x37,
    "Ratton1": 0x3A,
    "Ratton2": 0x3B,
    "Ratton3": 0x3C,
    "Lockon1": 0x3D,
    "Lockon2": 0x3E,
    "Lockon3": 0x3F,
    "X-Panel1": 0x40,
    "X-Panel3": 0x41,
    "Recov10": 0x43,
    "Recov30": 0x44,
    "Recov50": 0x45,
    "Recov80": 0x46,
    "Recov120": 0x47,
    "Recov150": 0x48,
    "Recov200": 0x49,
    "Recov300": 0x4A,
    "Steal": 0x4C,
    "Geddon1": 0x4F,
    "Geddon2": 0x50,
    "Escape": 0x52,
    "Interupt": 0x53,
    "LifeAura": 0x54,
    "AquaAura": 0x55,
    "FireAura": 0x56,
    "WoodAura": 0x57,
    "Repair": 0x58,
    "Cloud": 0x5B,
    "Cloudier": 0x5C,
    "Cloudest": 0x5D,
    "IceCube": 0x5E,
    "RockCube": 0x5F,
    "TimeBom1": 0x61,
    "TimeBom2": 0x62,
    "TimeBom3": 0x63,
    "Invis1": 0x64,
    "Invis2": 0x65,
    "Invis3": 0x66,
    "IronBody": 0x67,
    "Remobit1": 0x69,
    "Remobit2": 0x6A,
    "Remobit3": 0x6B,
    "BstrGard": 0x6C,
    "BstrBomb": 0x6D,
    "BstrSwrd": 0x6E,
    "BstrPnch": 0x6F,
    "RingZap1": 0x70,
    "RingZap2": 0x71,
    "RingZap3": 0x72,
    "Candle1": 0x73,
    "Candle2": 0x74,
    "Candle3": 0x75,
    "SloGauge": 0x76,
    "FstGauge": 0x77,
    "Drain1": 0x79,
    "Drain2": 0x7A,
    "Drain3": 0x7B,
    "Mine1": 0x7C,
    "Mine2": 0x7D,
    "Mine3": 0x7E,
    "Gaia1": 0x7F,
    "Gaia2": 0x80,
    "Gaia3": 0x81,
    "BblWrap1": 0x82,
    "BblWrap2": 0x83,
    "BblWrap3": 0x84,
    "Wave": 0x85,
    "RedWave": 0x86,
    "BigWave": 0x87,
    "Muramasa": 0x88,
    "Dropdown": 0x89,
    "Popup": 0x8A,
    "Dynamyt1": 0x8B,
    "Dynamyt2": 0x8C,
    "Dynamyt3": 0x8D,
    "Anubis": 0x8E,
    "IronShld": 0x91,
    "LeafShld": 0x92,
    "Barrier": 0x93,
    "PharoMan": 0x94,
    "PharoMn2": 0x95,
    "PharoMn3": 0x96,
    "ShadoMan": 0x97,
    "ShadoMn2": 0x98,
    "ShadoMn3": 0x99,
    "MagicMan": 0x9D,
    "MagicMn2": 0x9E,
    "MagicMn3": 0x9F,
    "Roll": 0xA0,
    "Roll2": 0xA1,
    "Roll3": 0xA2,
    "GutsMan": 0xA3,
    "GutsMan2": 0xA4,
    "GutsMan3": 0xA5,
    "ProtoMan": 0xA6,
    "ProtoMn2": 0xA7,
    "ProtoMn3": 0xA8,
    "WoodMan": 0xA9,
    "WoodMan2": 0xAA,
    "WoodMan3": 0xAB,
    "FireMan": 0xAC,
    "FireMan2": 0xAD,
    "FireMan3": 0xAE,
    "NumbrMan": 0xAF,
    "NumbrMn2": 0xB0,
    "NumbrMn3": 0xB1,
    "StoneMan": 0xB2,
    "StoneMn2": 0xB3,
    "StoneMn3": 0xB4,
    "IceMan": 0xB5,
    "IceMan2": 0xB6,
    "IceMan3": 0xB7,
    "SkullMan": 0xB8,
    "SkullMn2": 0xB9,
    "SkullMn3": 0xBA,
    "ColorMan": 0xBB,
    "ColorMn2": 0xBC,
    "ColorMn3": 0xBD,
    "BombMan": 0xBE,
    "BombMan2": 0xBF,
    "BombMan3": 0xC0,
    "SharkMan": 0xC1,
    "SharkMn2": 0xC2,
    "SharkMn3": 0xC3,
    "ElecMan": 0xC4,
    "ElecMan2": 0xC5,
    "ElecMan3": 0xC6,
    "Bass": 0xC7,
    "Z-Canon1": 0xCA,
    "Z-Canon2": 0xCB,
    "Z-Canon3": 0xCC,
    "Z-Spread": 0xCD,
    "Z-Raton1": 0xCE,
    "Z-Raton2": 0xCF,
    "Z-Raton3": 0xD0,
    "Z-Arrow": 0xD1,
    "Z-Spear": 0xD2,
    "Z-Lance": 0xD3,
    "O-Canon1": 0xD4,
    "O-Canon2": 0xD5,
    "O-Canon3": 0xD6,
    "O-Spread": 0xD7,
    "O-Raton1": 0xD8,
    "O-Raton2": 0xD9,
    "O-Raton3": 0xDA,
    "O-Arrow": 0xDB,
    "O-Spear": 0xDC,
    "O-Lance": 0xDD,
    "B-Bomb": 0xDE,
    "B-Sword": 0xDF,
    "B-Wave": 0xE0,
    "B-Quake": 0xE1,
    "S-Bomb": 0xE2,
    "S-Sword": 0xE3,
    "S-Wave": 0xE4,
    "S-Quake": 0xE5,
    "PwrCanon": 0xE6,
    "HvyStamp": 0xE7,
    "BgStrait": 0xE8,
    "BloodSuk": 0xE9,
    "Storm": 0xEA,
    "GtsShoot": 0xEB,
    "LifeSavr": 0xEC,
    "2xHero": 0xED,
    "HPmemory": 0xF0,
    "PowerUP": 0xF1,
    "PharTrap": 0xF2,
    "HeatArmr": 0xF4,
    "AquaArmr": 0xF5,
    "WoodArmr": 0xF6,
}


def bytes_chip(chip: str):
    global curScript
    chips = chip.split()
    if len(chips) != 2 or chips[0] not in chip_id_map or not chips[1].isalpha():
        exit(f'Unrecognized chip "{chip}"')
    return [chip_id_map[chips[0]], charmap_basic[chips[1].upper()] - charmap_basic["A"]]


def bytes_chip_id(chipid: str):
    global curScript
    if chipid not in chip_id_map:
        exit(f'Unrecognized chip ID "{chipid}"')
    return [chip_id_map[chipid]]


def bytes_chip_code(chipcode: str):
    global curScript
    if not chipcode.isalpha():
        exit(f'Unrecognized chip code "{chipcode}"')
    return [charmap_basic[chipcode.upper()] - charmap_basic["A"]]


def bytes_key(itemid: Union[str, int]):
    global curScript
    if isinstance(itemid, int):
        return [itemid]
    elif isinstance(itemid, str):
        if itemid not in key_item_map:
            exit(f"Unrecognized item name {itemid}")
        return [key_item_map[itemid]]
    else:
        exit(f"Unrecognized item name {itemid}")


# endregion


# region Flags

FLAG_STORY_NEW_GAME = 0
FLAG_STORY_TUTORIAL_START = 1
FLAG_STORY_TUTORIAL_END = 2
FLAG_STORY_OVEN_FIRE = 3
FLAG_STORY_OVEN_EXPLODE = 4
FLAG_STORY_WATER_GUN = 5
FLAG_STORY_DELETE_FIREMAN = 6
FLAG_STORY_FIREMAN_BED = 16
FLAG_STORY_CLASS_TALK = 17
FLAG_STORY_DEX_TALK = 18
FLAG_STORY_DOOR_1_UNLOCK = 19
FLAG_STORY_DOOR_3_UNLOCK = 20
FLAG_STORY_MEGAMAN_CAPTURE = 21
FLAG_STORY_DELETE_NUMBERMAN = 32
FLAG_STORY_CONDUCTOR_TALK = 33
FLAG_STORY_DELETE_STONEMAN = 34
FLAG_STORY_DAD_POWERUP = 35
FLAG_STORY_SCHOOL_CANCEL = 36
FLAG_STORY_SCILAB_NIGHT = 37
FLAG_STORY_POLAR_BEAR = 38
FLAG_STORY_TRUNK_FIND = 39
FLAG_STORY_DELETE_ICEMAN = 48
FLAG_STORY_TRAFFIC_LIGHTS = 49
FLAG_STORY_LIGHT_1_FIX = 50
FLAG_STORY_EXPOSE_WWW = 51
FLAG_STORY_LIGHT_2_FIX = 52
FLAG_STORY_LIGHT_3_FIX = 53
FLAG_STORY_LIGHT_4_FIX = 54
FLAG_STORY_LIGHT_5_FIX = 55
FLAG_STORY_DELETE_COLORMAN = 64
FLAG_STORY_COUNT_ZAP = 65
FLAG_STORY_CONTROL_ROOM = 66
FLAG_STORY_BATTERIES_DONE = 67
FLAG_STORY_DELETE_PROTOMAN = 80
FLAG_STORY_DELETE_DOOR_VIRUS = 81
FLAG_STORY_DELETE_BOMBMAN = 82
FLAG_STORY_BOMBMAN_BED = 83
FLAG_STORY_FINAL = 84

# endregion


# region Script control
def section_count(count: int) -> None:
    global curScript
    curScript.setScriptCount(count)


def section_start(section: int) -> None:
    global curScript
    curScript.selectSection(section)


def section_end():
    global curScript
    curScript.emitByte(0)
    curScript.emitByte(0)


# endregion


# region Commands
def emit(bt: int):
    global curScript
    curScript.emitByte(bt)


def end(delay: int = 0):
    global curScript
    curScript.emitByte(0xE7)
    curScript.emitShort(delay)


def newline():
    global curScript
    curScript.emitByte(0xE8)


def wait(amt: int = 0):
    global curScript
    curScript.emitByte(0xE9)
    curScript.emitShort(amt)


def delay_control(com: int):
    global curScript
    curScript.emitByte(0xEA)
    curScript.emitByte(com)


def breaks(amt: int):
    delay_control(0)
    curScript.emitShort(amt)


def delay(amt: int = 30):
    delay_control(1)
    curScript.emitShort(amt)


def stop():
    delay_control(0xFF)
    curScript.emitShort(0)


def page():
    global curScript
    curScript.emitByte(0xEB)


def skip_control(amt: int):
    global curScript
    curScript.emitByte(0xEC)
    curScript.emitByte(amt)


def set_delay(amt: int):
    global curScript
    skip_control(0)
    curScript.emitByte(amt)


def skip_on():
    skip_control(1)


def skip_off():
    skip_control(2)


def picture_control(com: int):
    global curScript
    curScript.emitByte(0xED)
    curScript.emitByte(com)


def pic(picture: int = 0, palette: int = 0):
    global curScript
    picture_control(0)
    curScript.emitByte(picture)
    curScript.emitByte(palette)


def hidepic():
    picture_control(1)


def picpal(palette: int):
    picture_control(2)
    curScript.emitByte(palette)


def anim(face: int):
    global curScript
    curScript.emitByte(0xEE)
    curScript.emitByte(face)


def pad_control(com: int):
    global curScript
    curScript.emitByte(0xEF)
    curScript.emitByte(com)


def pad(count: int = 2):
    global curScript
    pad_control(0)
    curScript.emitByte(count)


def col(count: int):
    global curScript
    pad_control(1)
    curScript.emitByte(count)


def option(up: int, down: int, left: int, right: int):
    global curScript
    curScript.emitByte(0xF0)
    high = ((up & 0xF) << 4) | (down & 0xF)
    low = ((left & 0xF) << 4) | (right & 0xF)
    curScript.emitByte(low)
    curScript.emitByte(high)


def pick(optionList: List[int], default, isDisableB=False, isClearAfterPick=True):
    global curScript
    curScript.emitByte(0xF1)
    curScript.emitByte(len(optionList) + 3)
    flag_7 = (1 if isClearAfterPick else 0) << 7
    flag_6 = (1 if isDisableB else 0) << 6
    flag_other = default & 0x3F
    curScript.emitByte(flag_7 | flag_6 | flag_other)
    for opt in optionList:
        curScript.emitByte(opt)


def dialog_control(com: int):
    global curScript
    curScript.emitByte(0xF2)
    curScript.emitByte(com)


def dialog_up():
    dialog_control(0)


def dialog_down():
    dialog_control(1)


def dialog_show():
    dialog_control(2)


def dialog_hide():
    dialog_control(3)


def flag_control(com: int, flag: int):
    global curScript
    curScript.emitByte(0xF3)
    curScript.emitByte(com << 2)
    curScript.emitShort(flag)


def set_flag(flag: int):
    flag_control(0, flag)


def clear_flag(flag: int):
    flag_control(1, flag)


def mail(flag: int):
    flag_control(2, flag)


def cond_control(com: int):
    global curScript
    curScript.emitByte(0xF4)
    curScript.emitByte(com << 2)


def if_flag(flag: int, eq: int = 0xFF, neq: int = 0xFF):
    global curScript
    cond_control(0)
    curScript.emitShort(flag)
    curScript.emitByte(eq)
    curScript.emitByte(neq)


def if_story(flag: int, inrange: int = 0xFF, outrange: int = 0xFF):
    if_story_in(flag, flag, inrange, outrange)


def if_story_in(lower: int, upper: int, inrange: int = 0xFF, outrange: int = 0xFF):
    global curScript
    cond_control(1)
    curScript.emitByte(lower)
    curScript.emitByte(upper)
    curScript.emitByte(inrange)
    curScript.emitByte(outrange)


def if_shop(shop: int, instock: int = 0xFF, outstock: int = 0xFF):
    global curScript
    cond_control(2)
    curScript.emitByte(shop)
    curScript.emitByte(instock)
    curScript.emitByte(outstock)


def if_chip(chip: str, eq: int = 0xFF, neq: int = 0xFF):
    global curScript
    cond_control(3)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(eq)
    curScript.emitByte(neq)


def if_level(lower: int, upper: int, inrange: int = 0xFF, outrange: int = 0xFF):
    global curScript
    cond_control(4)
    curScript.emitByte(lower)
    curScript.emitByte(upper)
    curScript.emitByte(inrange)
    curScript.emitByte(outrange)


def if_bust(lower: int, upper: int, inrange: int = 0xFF, outrange: int = 0xFF):
    global curScript
    cond_control(5)
    curScript.emitByte(lower)
    curScript.emitByte(upper)
    curScript.emitByte(inrange)
    curScript.emitByte(outrange)


def if_library(lower: int, upper: int, inrange: int = 0xFF, outrange: int = 0xFF):
    global curScript
    cond_control(6)
    curScript.emitByte(lower)
    curScript.emitByte(upper)
    curScript.emitByte(inrange)
    curScript.emitByte(outrange)


def input_control(com: int):
    global curScript
    curScript.emitByte(0xF5)
    curScript.emitByte(com)


def input_off():
    input_control(0)


def input_on():
    input_control(1)


def jump_control(sz: int):
    global curScript
    curScript.emitByte(0xF6)
    curScript.emitByte(sz)


def jump(index: int):
    global curScript
    jump_control(0)
    curScript.emitByte(index)


def jumprandom(indexList: List[int]):
    global curScript
    jump_control(len(indexList) - 1)
    for bt in indexList:
        curScript.emitByte(bt)


def inv_control(com: int):
    global curScript
    curScript.emitByte(0xF7)
    curScript.emitByte(com)


def add_item(
    itemid: Union[str, int],
    amt: int = 1,
    ifall: int = 0xFF,
    ifnone: int = 0xFF,
    ifsome: int = 0xFF,
):
    global curScript
    inv_control(0)
    bitem = bytes_key(itemid)
    curScript.emitByte(bitem[0])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def sub_item(
    itemid: Union[str, int],
    amt: int = 1,
    ifall: int = 0xFF,
    ifnone: int = 0xFF,
    ifsome: int = 0xFF,
):
    global curScript
    inv_control(1)
    bitem = bytes_key(itemid)
    curScript.emitByte(bitem[0])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def set_item(
    itemid: Union[str, int],
    amt: int,
    ifall: int = 0xFF,
    ifnone: int = 0xFF,
    ifsome: int = 0xFF,
):
    global curScript
    inv_control(2)
    bitem = bytes_key(itemid)
    curScript.emitByte(bitem[0])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def check_item(
    itemid: Union[str, int],
    amt: int = 1,
    eq: int = 0xFF,
    gt: int = 0xFF,
    lt: int = 0xFF,
):
    global curScript
    inv_control(4)
    bitem = bytes_key(itemid)
    curScript.emitByte(bitem[0])
    curScript.emitByte(amt)
    curScript.emitByte(eq)
    curScript.emitByte(gt)
    curScript.emitByte(lt)


def if_have_item(itemid: Union[str, int], jump: int):
    check_item(itemid, 1, jump, jump)


def if_no_item(itemid: Union[str, int], jump: int):
    check_item(itemid, 1, lt=jump)


def add_chip(
    chip: str, amt: int = 1, ifall: int = 0xFF, ifnone: int = 0xFF, ifsome: int = 0xFF
):
    global curScript
    inv_control(0x10)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def sub_chip(
    chip: str, amt: int = 1, ifall: int = 0xFF, ifnone: int = 0xFF, ifsome: int = 0xFF
):
    global curScript
    inv_control(0x11)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def set_chip(
    chip: str, amt: int, ifall: int = 0xFF, ifnone: int = 0xFF, ifsome: int = 0xFF
):
    global curScript
    inv_control(0x12)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(amt)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)


def check_chip(
    chip: str, amt: int, ifeq: int = 0xFF, ifgt: int = 0xFF, iflt: int = 0xFF
):
    global curScript
    inv_control(0x14)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(amt)
    curScript.emitByte(ifeq)
    curScript.emitByte(ifgt)
    curScript.emitByte(iflt)


def if_have_chip(chip: str, jump: int):
    check_chip(chip, 1, jump, jump, 0xFF)


def check_chip_pack(
    chip: str, amt: int = 1, eq: int = 0xFF, gt: int = 0xFF, lt: int = 0xFF
):
    global curScript
    inv_control(0x15)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])
    curScript.emitByte(amt)
    curScript.emitByte(eq)
    curScript.emitByte(gt)
    curScript.emitByte(lt)


def passcode_control(com: int):
    global curScript
    curScript.emitByte(0xF8)
    curScript.emitByte(com << 2)


def passcode(pickrand: int, solution: int):
    global curScript
    passcode_control(0)
    curScript.emitByte(pickrand)
    curScript.emitByte(solution)


def passcode_pick(ifconfirm: int, ifabort: int, unused1: int = 0, unused2: int = 0):
    global curScript
    passcode_control(1)
    curScript.emitByte(ifconfirm)
    curScript.emitByte(ifabort)
    curScript.emitByte(unused1)
    curScript.emitByte(unused2)


def passcode_check(
    bothlow: int,
    bothhigh: int,
    secondlow: int,
    firstlow: int,
    secondhigh: int,
    firsthigh: int,
    ifcorrect: int,
):
    global curScript
    passcode_control(2)
    curScript.emitByte(bothlow)
    curScript.emitByte(bothhigh)
    curScript.emitByte(secondlow)
    curScript.emitByte(firstlow)
    curScript.emitByte(secondhigh)
    curScript.emitByte(firsthigh)
    curScript.emitByte(ifcorrect)


def passcode_hide():
    global curScript
    passcode_control(3)


def passcode_shift(firstup: int, firstdown: int, secondup: int, seconddown: int):
    global curScript
    passcode_control(4)
    curScript.emitByte(firstup)
    curScript.emitByte(firstdown)
    curScript.emitByte(secondup)
    curScript.emitByte(seconddown)


def textpal(pal: int):
    global curScript
    curScript.emitByte(0xF9)
    curScript.emitByte(pal)


def pc_control(com: int):
    global curScript
    curScript.emitByte(0xFA)
    curScript.emitByte(com << 2)


def pc_lock():
    pc_control(0)


def pc_anim(anim: int):
    global curScript
    pc_control(1)
    curScript.emitByte(anim)


def pc_anim_start(anim: int):
    pc_lock()
    pc_anim(anim)


def pc_anim_end():
    pc_wait()
    pc_unlock()


def pc_unlock():
    pc_control(2)


def pc_wait():
    pc_control(3)


def pc_restore():
    pc_control(4)


def item_control(com: int):
    global curScript
    curScript.emitByte(0xFB)
    curScript.emitByte(com << 2)


def key_item_buf(index: int):
    global curScript
    item_control(0)
    curScript.emitByte(0)
    pack = (index << 4) & 0xF0
    curScript.emitByte(pack)


def chip_id_buf(index: int):
    global curScript
    item_control(0)
    curScript.emitByte(0)
    pack = (index << 4) & 0xF0
    curScript.emitByte(pack + 1)


def chip_code_buf(index: int):
    global curScript
    item_control(0)
    curScript.emitByte(0)
    pack = (index << 4) & 0xF0
    curScript.emitByte(pack + 2)


def key_item(itemid: Union[str, int]):
    global curScript
    item_control(0)
    bkey = bytes_key(itemid)
    curScript.emitByte(bkey[0])
    curScript.emitByte(0)


def chip_id(chipid: str):
    global curScript
    item_control(0)
    bcid = bytes_chip_id(chipid)
    curScript.emitByte(bcid[0])
    curScript.emitByte(1)


def chip_code(chipcode: str):
    global curScript
    item_control(0)
    bcode = bytes_chip_code(chipcode)
    curScript.emitByte(bcode[0])
    curScript.emitByte(2)


def chip(chipId: str, chipCode: str):
    chip_id(chipId)
    text(" ")
    chip_code(chipCode)


def item_amt(
    itemid: Union[str, int],
    minlen: int = 0,
    isPadZero: bool = False,
    isPadLeft: bool = False,
):
    global curScript
    item_control(1)
    flag_7 = (1 if isPadLeft else 0) << 7
    flag_6 = (1 if isPadZero else 0) << 6
    flag_other = minlen & 0xF
    curScript.emitByte(flag_7 | flag_6 | flag_other)
    bkey = bytes_key(itemid)
    curScript.emitByte(bkey[0])


def chip_amt(
    chip: str, minlen: int = 0, isPadZero: bool = False, isPadLeft: bool = False
):
    global curScript
    item_control(2)
    flag_7 = (1 if isPadLeft else 0) << 7
    flag_6 = (1 if isPadZero else 0) << 6
    flag_other = minlen & 0xF
    curScript.emitByte(flag_7 | flag_6 | flag_other)
    bchip = bytes_chip(chip)
    curScript.emitByte(bchip[0])
    curScript.emitByte(bchip[1])


def zenny_amt(minlen: int = 0, isPadZero: bool = False, isPadLeft: bool = False):
    global curScript
    item_control(3)
    flag_7 = (1 if isPadLeft else 0) << 7
    flag_6 = (1 if isPadZero else 0) << 6
    flag_other = minlen & 0xF
    curScript.emitByte(flag_7 | flag_6 | flag_other)
    curScript.emitByte(0)


def buffer(
    buffer: int, minlen: int = 0, isPadZero: bool = False, isPadLeft: bool = False
):
    global curScript
    item_control(3)
    flag_7 = (1 if isPadLeft else 0) << 7
    flag_6 = (1 if isPadZero else 0) << 6
    flag_other = minlen & 0xF
    curScript.emitByte(flag_7 | flag_6 | flag_other)
    curScript.emitByte(buffer)


def sound_control(com: int):
    global curScript
    curScript.emitByte(0xFC)
    curScript.emitByte(com << 2)


def se(songid: int):
    global curScript
    sound_control(0)
    curScript.emitShort(songid)


def song(songid: int):
    global curScript
    sound_control(1)
    curScript.emitShort(songid)


def text_se_on():
    sound_control(2)


def text_se_off():
    sound_control(3)


def all_sound_off():
    sound_control(4)


def song_fade(playerId: int, speed: int):
    global curScript
    sound_control(5)
    curScript.emitByte(playerId)
    curScript.emitByte(speed)


def misc_control(com: int):
    global curScript
    curScript.emitByte(0xFD)
    curScript.emitByte(com << 2)


def award_zenny(
    amtList: List[int], nextjump: int = 0xFF, unused1: int = 0xFF, unused2: int = 0xFF
):
    global curScript
    misc_control(0)
    curScript.emitByte(len(amtList) - 1)
    curScript.emitByte(nextjump)
    curScript.emitByte(unused1)
    curScript.emitByte(unused2)
    for amt in amtList:
        curScript.emitInt(amt)


def award_chip(
    chipList: List[str], ifall: int = 0xFF, ifnone: int = 0xFF, ifsome: int = 0xFF
):
    global curScript
    misc_control(1)
    curScript.emitByte(len(chipList) - 1)
    curScript.emitByte(ifall)
    curScript.emitByte(ifnone)
    curScript.emitByte(ifsome)
    for chip in chipList:
        bchip = bytes_chip(chip)
        curScript.emitByte(bchip[0])
        curScript.emitByte(bchip[1])


def battle():
    misc_control(2)


def shop(shopIndex: int):
    global curScript
    misc_control(3)
    curScript.emitByte(shopIndex)


def miniboss(
    bg: int,
    mode: int,
    folder: int,
    shuffle: int,
    flags: int,
    noescape: int,
    battleId: int,
):
    global curScript
    misc_control(4)
    curScript.emitByte(bg)
    curScript.emitByte(mode)
    curScript.emitByte(folder)
    curScript.emitByte(shuffle)
    curScript.emitByte(flags)
    curScript.emitByte(noescape)
    curScript.emitByte(battleId)


def trader(amt: int, ifless: int = 0xFF):
    global curScript
    misc_control(5)
    curScript.emitByte(amt)
    curScript.emitByte(ifless)


def virus_machine():
    misc_control(6)


def save(savegood: int, savebad: int):
    global curScript
    curScript.emitByte(0xFE)
    curScript.emitByte(savegood)
    curScript.emitByte(savebad)


def parse_command(reader: Reader):
    global curScript
    com = ""
    while not reader.isEmpty() and reader.peek() != "}":
        com += reader.read()
    if reader.isEmpty():
        exit("Incomplete command")
    reader.read()
    singleMatch = re.match(r"^([0123])$", com)
    padMatch = re.match(r"^([0123]):(([ 0])?(<|>)?)?(\d+)$", com)
    if singleMatch:
        bf = int(singleMatch.group(1))
        curScript.emitByte(0xE9)
        curScript.emitByte(bf)
        curScript.emitByte(1)
        return
    if padMatch:
        bf = int(padMatch.group(1))
        padChar = padMatch.group(3)
        direction = padMatch.group(4)
        count = int(padMatch.group(5))
        if count >= 0x40:
            exit("Pad amount needs to be less than 0x40")
        if direction == ">":
            count += 0x80
        if padChar == "0":
            count += 0x40
        curScript.emitByte(0xE9)
        curScript.emitByte(bf)
        curScript.emitByte(count)
        return

    coms = shlex.split(com)
    if len(coms) > 0:
        if coms[0] == "delay" or coms[0] == "d":
            if len(coms) > 1:
                arg = auto_int(coms[1])
                delay(arg)
            else:
                delay()
        elif coms[0] == "key":
            if len(coms) > 1:
                key_item(coms[1])
            else:
                exit("Key item name required")
        elif coms[0] == "chip":
            if len(coms) == 2:
                chip_id(coms[1])
            elif len(coms) > 2:
                chip(coms[1], coms[2])
            else:
                exit("Chip ID or chip id with code required")
        elif coms[0] == "chip_buf":
            chip_id_buf(1)
            text(" ")
            chip_code_buf(2)
        elif coms[0] == "key_item_buf":
            arg = auto_int(coms[1])
            key_item_buf(arg)
        elif coms[0] == "anim" or coms[0] == "a":
            if len(coms) > 1:
                arg = auto_int(coms[1])
                anim(arg)
            else:
                exit("Animation index required")
        elif coms[0] == "add_chip":
            if len(coms) == 1:
                exit("Arguments required for add_chip")
            item = coms[1]
            args = [auto_int(i) for i in coms[2:]]
            add_chip(item, *args)
        elif coms[0] == "sub_chip":
            if len(coms) == 1:
                exit("Arguments required for sub_chip")
            item = coms[1]
            args = [auto_int(i) for i in coms[2:]]
            sub_chip(item, *args)
        elif coms[0] == "add_item":
            if len(coms) == 1:
                exit("Arguments required for add_item")
            item = coms[1]
            args = [auto_int(i) for i in coms[2:]]
            add_item(item, *args)
        elif coms[0] == "sub_item":
            if len(coms) == 1:
                exit("Arguments required for sub_item")
            item = coms[1]
            args = [auto_int(i) for i in coms[2:]]
            sub_item(item, *args)
        elif coms[0] == "wait" or coms[0] == "w":
            if len(coms) > 1:
                arg = auto_int(coms[1])
                wait(arg)
            else:
                wait()
        elif coms[0] == "buf":
            buffer(1)
        elif coms[0] == "end":
            if len(coms) > 1:
                arg = auto_int(coms[1])
                end(arg)
            else:
                end()
        elif coms[0] == "lv":
            emit(0xB)
        elif coms[0] == "..":
            for _ in range(2):
                curScript.emitByte(0xE5)
                curScript.emitByte(charmap_E5["."])
                delay()
        elif coms[0] == "...":
            for _ in range(3):
                curScript.emitByte(0xE5)
                curScript.emitByte(charmap_E5["."])
                delay()
        elif coms[0] == "item_amt":
            item_amt(coms[1])
        elif coms[0] == "p":
            pad()
        elif coms[0] == "c":
            args = [auto_int(i) for i in coms[1:]]
            option(*args)
            pad()
        elif len(coms[0]) == 6 and coms[0][1:4] == "pad":
            if len(coms) != 2:
                exit("Argument required for pad")
            if not is_int(str(coms[1])):
                exit("Number argument required for pad")
            dr = coms[0][0]
            pd = coms[0][4]
            bf = coms[0][5]
            sz = auto_int(coms[1])
            if dr != "l" and dr != "r":
                exit("Unrecognized direction for pad")
            if pd != "s" and pd != "z":
                exit("Unrecognized padding char for pad")
            if not is_int(str(bf)):
                exit("Buffer for pad function must be a number")
            bf = int(bf)
            if bf < 0 or bf > 3:
                exit("Buffer for pad function required to be from 0 to 3")
            if sz > 0x40:
                exit("Pad amount needs to be less than 0x40")
            if dr == "l":
                sz += 0x80
            if pd == "z":
                sz += 0x40
            curScript.emitByte(0xE9)
            curScript.emitByte(bf)
            curScript.emitByte(sz)
        elif coms[0] == "col":
            if len(coms) > 1:
                arg = auto_int(coms[1])
                col(arg)
            else:
                exit("Argument required for col")
        elif coms[0] == "se":
            if len(coms) == 1:
                exit("Argument required for se")
            arg = auto_int(coms[1])
            se(arg)
        else:
            exit(f"Unrecognized command {coms[0]}")


def text_base(useBold: bool, *txtList):
    global curScript, charmap_bold, charmap_basic, charmap_E5
    for txt in txtList:
        if txt and len(txt) > 0:
            reader = Reader(txt)
            while not reader.isEmpty():
                char = reader.read()
                if char == "{":
                    parse_command(reader)
                elif char == "\\":
                    char += reader.read()
                    if char == "\\p":
                        page()
                    else:
                        exit(f"Unrecognized command {char}")
                else:
                    if useBold and char in charmap_bold:
                        curScript.emitByte(charmap_bold[char])
                    elif not useBold and char in charmap_basic:
                        curScript.emitByte(charmap_basic[char])
                    elif char in charmap_E5:
                        curScript.emitByte(0xE5)
                        curScript.emitByte(charmap_E5[char])
                    else:
                        curScript.emitByte(ord(char))


def text(*txtList):
    text_base(False, *txtList)


def text_bold(*txtList):
    text_base(True, *txtList)


# endregion


def main():
    global curScript
    parser = argparse.ArgumentParser(
        description="Builds Mega Man Battle Network text scripts."
    )
    parser.add_argument("output", type=str, help="The output file.")
    parser.add_argument("input", type=str, help="The input file.")
    args = parser.parse_args()
    inPath = Path(args.input)
    outPath = Path(args.output)
    if not inPath.exists():
        exit(f"Couldn't find file {inPath}")
    with open(inPath, mode="r") as inFile:
        exec(inFile.read())
    curScript.writeToFile(outPath)


if __name__ == "__main__":
    main()
