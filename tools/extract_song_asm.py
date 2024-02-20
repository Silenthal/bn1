#!/usr/bin/python3
import argparse
from pathlib import Path
import struct
from typing import BinaryIO, List


class SongHeader:
    def __init__(self, inGBA: BinaryIO) -> None:
        self.track_count: int = get_byte(inGBA)
        self.block_count: int = get_byte(inGBA)
        self.priority: int = get_byte(inGBA)
        rv = get_byte(inGBA)
        self.reverb_raw = rv
        self.reverb: int = rv & 0x7F
        self.reverb_set: bool = (rv & 0x80) != 0
        self.tone_data_off: int = get_offset_from_pointer(inGBA)
        self.track_ptr: List[int] = []
        for _ in range(self.track_count):
            self.track_ptr.append(get_offset_from_pointer(inGBA))

    def valid(self) -> bool:
        if self.track_count == 0:
            return False
        if self.track_count < 1 or self.track_count > 16:
            return False
        return True


class ParseResult:
    def __init__(self, size: int, offset: int, text: str, is_ref_label: bool = False):
        self.size: int = size
        self.offset_gba: int = offset
        self.text: str = text
        self.is_ref_label: bool = is_ref_label


file_header = """#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

"""


def to_n(n: int) -> str:
    list_n: List[str] = [
        "N01",
        "N02",
        "N03",
        "N04",
        "N05",
        "N06",
        "N07",
        "N08",
        "N09",
        "N10",
        "N11",
        "N12",
        "N13",
        "N14",
        "N15",
        "N16",
        "N17",
        "N18",
        "N19",
        "N20",
        "N21",
        "N22",
        "N23",
        "N24",
        "N28",
        "N30",
        "N32",
        "N36",
        "N40",
        "N42",
        "N44",
        "N48",
        "N52",
        "N54",
        "N56",
        "N60",
        "N64",
        "N66",
        "N68",
        "N72",
        "N76",
        "N78",
        "N80",
        "N84",
        "N88",
        "N90",
        "N92",
        "N96",
    ]
    if n >= 0xD0 and n <= 0xFF:
        return list_n[n - 0xD0]
    else:
        return f"0x{n:X}"


def to_note(note: int) -> str:
    list_note: List[str] = [
        "CnM2",
        "CsM2",
        "DnM2",
        "DsM2",
        "EnM2",
        "FnM2",
        "FsM2",
        "GnM2",
        "GsM2",
        "AnM2",
        "AsM2",
        "BnM2",
        "CnM1",
        "CsM1",
        "DnM1",
        "DsM1",
        "EnM1",
        "FnM1",
        "FsM1",
        "GnM1",
        "GsM1",
        "AnM1",
        "AsM1",
        "BnM1",
        "Cn0",
        "Cs0",
        "Dn0",
        "Ds0",
        "En0",
        "Fn0",
        "Fs0",
        "Gn0",
        "Gs0",
        "An0",
        "As0",
        "Bn0",
        "Cn1",
        "Cs1",
        "Dn1",
        "Ds1",
        "En1",
        "Fn1",
        "Fs1",
        "Gn1",
        "Gs1",
        "An1",
        "As1",
        "Bn1",
        "Cn2",
        "Cs2",
        "Dn2",
        "Ds2",
        "En2",
        "Fn2",
        "Fs2",
        "Gn2",
        "Gs2",
        "An2",
        "As2",
        "Bn2",
        "Cn3",
        "Cs3",
        "Dn3",
        "Ds3",
        "En3",
        "Fn3",
        "Fs3",
        "Gn3",
        "Gs3",
        "An3",
        "As3",
        "Bn3",
        "Cn4",
        "Cs4",
        "Dn4",
        "Ds4",
        "En4",
        "Fn4",
        "Fs4",
        "Gn4",
        "Gs4",
        "An4",
        "As4",
        "Bn4",
        "Cn5",
        "Cs5",
        "Dn5",
        "Ds5",
        "En5",
        "Fn5",
        "Fs5",
        "Gn5",
        "Gs5",
        "An5",
        "As5",
        "Bn5",
        "Cn6",
        "Cs6",
        "Dn6",
        "Ds6",
        "En6",
        "Fn6",
        "Fs6",
        "Gn6",
        "Gs6",
        "An6",
        "As6",
        "Bn6",
        "Cn7",
        "Cs7",
        "Dn7",
        "Ds7",
        "En7",
        "Fn7",
        "Fs7",
        "Gn7",
        "Gs7",
        "An7",
        "As7",
        "Bn7",
        "Cn8",
        "Cs8",
        "Dn8",
        "Ds8",
        "En8",
        "Fn8",
        "Fs8",
        "Gn8",
    ]
    if note < len(list_note):
        return list_note[note]
    else:
        return f"0x{note:X}"


def to_vel(vel: int) -> str:
    return f"v{vel:03}"


def to_wait(wait: int) -> str:
    list_wait: List[str] = [
        "W00",
        "W01",
        "W02",
        "W03",
        "W04",
        "W05",
        "W06",
        "W07",
        "W08",
        "W09",
        "W10",
        "W11",
        "W12",
        "W13",
        "W14",
        "W15",
        "W16",
        "W17",
        "W18",
        "W19",
        "W20",
        "W21",
        "W22",
        "W23",
        "W24",
        "W28",
        "W30",
        "W32",
        "W36",
        "W40",
        "W42",
        "W44",
        "W48",
        "W52",
        "W54",
        "W56",
        "W60",
        "W64",
        "W66",
        "W68",
        "W72",
        "W76",
        "W78",
        "W80",
        "W84",
        "W88",
        "W90",
        "W92",
        "W96",
    ]

    if wait >= 0x80 and wait <= 0xB0:
        return list_wait[wait - 0x80]
    else:
        return f"0x{wait:X}"


def auto_int(x: str) -> int:
    return int(x, 0)


def get_int(inFile: BinaryIO) -> int:
    return struct.unpack("I", inFile.read(4))[0]


def get_byte(inFile: BinaryIO) -> int:
    return inFile.read(1)[0]


def get_offset_from_pointer(inFile: BinaryIO) -> int:
    return get_int(inFile) - 0x8000000


def offset_to_pointer(offset: int) -> int:
    return offset + 0x8000000


def cur_offset_to_pointer(inFile: BinaryIO) -> int:
    return offset_to_pointer(inFile.tell())


def get_note_param(inFile: BinaryIO) -> ParseResult:
    addr = cur_offset_to_pointer(inFile)
    note = get_byte(inFile)
    if note < 0x80:
        vel = get_byte(inFile)
        if vel < 0x80:
            return ParseResult(2, addr, f", {to_note(note)}, v{vel:03}")
        else:
            inFile.seek(-1, 1)
            return ParseResult(1, addr, f", {to_note(note)}")
    else:
        inFile.seek(-1, 1)
        return ParseResult(0, addr, "")


def parse(inFile) -> ParseResult:
    dict_no_arg = {0xB1: "FINE", 0xB4: "PEND"}
    dict_single_arg = {
        0xBA: "PRIO ",
        0xBB: "TEMPO",
        0xBC: "KEYSH",
        0xBD: "VOICE",
        0xBE: "VOL  ",
        0xBF: "PAN  ",
        0xC0: "BEND ",
        0xC1: "BENDR",
        0xC2: "LFOS ",
        0xC3: "LFODL",
        0xC4: "MOD  ",
        0xC5: "MODT ",
        0xC8: "TUNE ",
    }
    dict_ext = {0x08: "xIECV", 0x09: "xIECL"}
    addr = cur_offset_to_pointer(inFile)
    command = get_byte(inFile)

    if command < 0x80:
        vel = get_byte(inFile)
        if vel < 0x80:
            return ParseResult(
                2, addr, f"    .byte    {to_note(command)}, {to_vel(vel)}\n"
            )
        else:
            inFile.seek(-1, 1)
            return ParseResult(1, addr, f"    .byte    {to_note(command)}\n")
    if command >= 0x80 and command <= 0xB0:
        return ParseResult(1, addr, f"    .byte {to_wait(command)}\n")
    if command == 0xB2:
        addr = get_int(inFile)
        return ParseResult(
            5, addr, f"    .byte GOTO\n    .word LABEL_{addr:08X}\n", True
        )
    if command == 0xB3:
        addr = get_int(inFile)
        return ParseResult(
            5, addr, f"    .byte PATT\n    .word LABEL_{addr:08X}\n", True
        )
    if command in dict_no_arg:
        return ParseResult(1, addr, f"    .byte {dict_no_arg[command]}\n")
    if command in dict_single_arg:
        ex1 = get_byte(inFile)
        return ParseResult(2, addr, f"    .byte {dict_single_arg[command]}, {ex1}\n")
    if command == 0xCD:
        ex1 = get_byte(inFile)
        arg1 = get_byte(inFile)
        if ex1 in dict_ext:
            ex2 = get_byte(inFile)
            arg2 = get_byte(inFile)
            if ex2 in dict_ext:
                return ParseResult(
                    5,
                    addr,
                    f"    .byte XCMD , {dict_ext[ex1]}, {arg1}, {dict_ext[ex2]}, {arg2}\n",
                )
            else:
                inFile.seek(-2, 1)
                return ParseResult(
                    3, addr, f"    .byte XCMD , {dict_ext[ex1]}, {arg1}\n"
                )
        else:
            inFile.seek(-2, 1)
            return ParseResult(1, addr, f"    .byte 0x{command:02X}\n")
    if command == 0xCE:
        rest = get_note_param(inFile)
        return ParseResult(rest.size + 1, addr, f"    .byte EOT{rest.text}\n")
    if command == 0xCF:
        rest = get_note_param(inFile)
        return ParseResult(rest.size + 1, addr, f"    .byte TIE{rest.text}\n")
    if command >= 0xD0 and command <= 0xFF:
        rest = get_note_param(inFile)
        return ParseResult(
            1 + rest.size, addr, f"    .byte    {to_n(command)}{rest.text}\n"
        )
    return ParseResult(1, addr, f"    .byte 0x{command:02X}\n")


def main():
    parser = argparse.ArgumentParser(description="Extract songs.")
    parser.add_argument("inPath", type=str, help="The path to the game.")
    args = parser.parse_args()
    inPath = Path(args.inPath)
    if not inPath.exists():
        exit(f"Couldn't find file {args.inPath}")

    song_count = 238
    main_song_list_offset = 0xA111C
    song_offset_list = []
    offsets_file_dict = {}
    song_set = set()
    with open(inPath, "rb") as inFile:
        inFile.seek(main_song_list_offset)
        for i in range(song_count):
            song_offset_list.append(get_offset_from_pointer(inFile))
            inFile.seek(4, 1)

        for i in range(len(song_offset_list)):
            song_offset = song_offset_list[i]
            if song_offset not in song_set:
                song_set.add(song_offset)
                inFile.seek(song_offset)
                fileName = f"song{i:03}"
                fileNameWithEx = fileName + ".S"
                head = SongHeader(inFile)
                with open(fileNameWithEx, "w") as outSong:
                    global file_header
                    if head.track_count == 0:
                        offsets_file_dict[song_offset] = fileName
                        outSong.write(file_header)
                        outSong.write(
                            f"global_label se_dummy_{song_offset:08X}\n    .word 0\n\n    .end\n"
                        )
                    else:
                        offsets_file_dict[head.track_ptr[0]] = fileName
                        inFile.seek(head.track_ptr[0])
                        outSong.write(file_header)
                        for track_idx in range(len(head.track_ptr)):
                            outSong.write(
                                f"Track_{offset_to_pointer(head.track_ptr[track_idx]):08X}:\n"
                            )
                            cur_off = cur_offset_to_pointer(inFile)
                            preproc_list: List[ParseResult] = []
                            labels_set = set()
                            if track_idx >= len(head.track_ptr) - 1:
                                while True:
                                    c = get_byte(inFile)
                                    inFile.seek(-1, 1)
                                    pr = parse(inFile)
                                    if pr.is_ref_label:
                                        labels_set.add(pr.offset_gba)
                                    preproc_list.append(pr)
                                    if c == 0xB1:
                                        break
                            else:
                                count = (
                                    head.track_ptr[track_idx + 1]
                                    - head.track_ptr[track_idx]
                                )
                                cur = 0
                                while True:
                                    c = get_byte(inFile)
                                    inFile.seek(-1, 1)
                                    pr = parse(inFile)
                                    if pr.is_ref_label:
                                        labels_set.add(pr.offset_gba)
                                    preproc_list.append(pr)
                                    cur += pr.size
                                    if cur >= count:
                                        break

                            for line in preproc_list:
                                if cur_off in labels_set:
                                    outSong.write(f"LABEL_{cur_off:08X}:\n")
                                outSong.write(line.text)
                                cur_off += line.size

                            outSong.write("\n")
                        outSong.write("    .align 2, 0\n\n")
                        outSong.write(
                            f"global_label SongHeader_{offset_to_pointer(song_offset):08X}\n"
                        )
                        outSong.write(f"    .byte {head.track_count}\n")
                        outSong.write(f"    .byte {head.block_count}\n")
                        outSong.write(f"    .byte {head.priority}\n")
                        outSong.write(f"    .byte {head.reverb_raw}\n")
                        outSong.write(
                            f"    .word 0x{offset_to_pointer(head.tone_data_off):X}\n"
                        )
                        for ptr in head.track_ptr:
                            outSong.write(
                                f"    .word Track_{offset_to_pointer(ptr):08X}\n"
                            )
                        outSong.write("\n    .end\n")
    # with open("offset_temp.txt", "w") as outOffsetFile:
    #     for off in sorted(offsets_file_dict.keys()):
    #         outOffsetFile.write(f"{offsets_file_dict[off]}             0x{off:X}\n")


if __name__ == "__main__":
    main()
