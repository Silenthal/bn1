#!/usr/bin/python3
import argparse
from pathlib import Path
from typing import BinaryIO, List, Tuple
from common import auto_int, get_byte, get_int, get_short, get_sshort


def a_end(inFile):
    return True, "a_end"


def a_jump(inFile):
    addr = get_int(inFile)
    return True, f"a_jump L_{addr:X}", addr


def a_destroy(inFile):
    return False, "a_destroy"


def a_jump_if_flag(inFile):
    flag = get_short(inFile)
    addr = get_int(inFile)
    return False, f"a_jump_if_flag 0x{flag:X}, L_{addr:X}", addr


def a_jump_if_not_flag(inFile):
    flag = get_short(inFile)
    addr = get_int(inFile)
    return False, f"a_jump_if_not_flag 0x{flag:X}, L_{addr:X}", addr


def a_set_flag(inFile):
    flag = get_short(inFile)
    return False, f"a_set_flag 0x{flag:X}"


def a_clear_flag(inFile):
    flag = get_short(inFile)
    return False, f"a_clear_flag 0x{flag:X}"


def a_init(inFile):
    return False, "a_init"


def a_init_no_sprite(inFile):
    return False, "a_init_no_sprite"


def a_set_radius(inFile):
    val = get_byte(inFile)
    return False, f"a_set_radius {val}"


def a_set_height(inFile):
    val = get_byte(inFile)
    return False, f"a_set_height {val}"


def a_set_hitbox_offset(inFile):
    x = get_byte(inFile)
    y = get_byte(inFile)
    z = get_byte(inFile)
    return False, f"a_set_hitbox_offset {x}, {y}, {z}"


def a_enable_dialog(inFile):
    return False, "a_enable_dialog"


def a_disable_dialog(inFile):
    return False, "a_disable_dialog"


def a_set_palette(inFile):
    return False, f"a_set_palette 0x{get_byte(inFile):X}"


def a_wait(inFile):
    return False, f"a_wait {get_byte(inFile)}"


def a_drop(inFile):
    initial = get_byte(inFile)
    accel = get_byte(inFile)
    return False, f"a_drop {initial}, {accel}"


def a_enable_turn(inFile):
    return False, "a_enable_turn"


def a_disable_turn(inFile):
    return False, "a_disable_turn"


def a_set_pos(inFile):
    x = get_sshort(inFile)
    y = get_sshort(inFile)
    z = get_sshort(inFile)
    if z == 0:
        return False, f"a_set_pos {x}, {y}"
    else:
        return False, f"a_set_pos {x}, {y}, {z}"


def a_move(inFile):
    dirs = ["d_n", "d_ne", "d_e", "d_se", "d_s", "d_sw", "d_w", "d_nw"]
    d = dirs[get_byte(inFile) & 0x7]
    ic = get_byte(inFile)
    ct = get_byte(inFile)
    return False, f"a_move {d}, {ic}, {ct}"


def a_set_sprite_frame(inFile):
    return False, f"a_set_sprite_frame {get_byte(inFile)}"


def a_set_sprite(inFile):
    return False, f"a_set_sprite 0x{get_byte(inFile):X}"


def a_set_dialog(inFile):
    return False, f"a_set_dialog 0x{get_byte(inFile):X}"


def a_sprite_auto_priority(inFile):
    return False, "a_sprite_auto_priority"


def a_sprite_high_priority(inFile):
    return False, "a_sprite_high_priority"


def a_sprite_low_priority(inFile):
    return False, "a_sprite_low_priority"


def a_sprite_mask(inFile):
    fl = get_int(inFile)
    return False, f"a_sprite_mask 0x{fl:X}"


def a_sprite_mask_set_flag(inFile):
    fl = get_byte(inFile)
    return False, f"a_sprite_mask_set_flag 0x{fl:X}"


def a_sprite_mask_clear_flag(inFile):
    fl = get_byte(inFile)
    return False, f"a_sprite_mask_set_flag 0x{fl:X}"


def a_disable_collision(inFile):
    return False, "a_disable_collision"


def a_enable_collision(inFile):
    return False, "a_enable_collision"


def a_set_no_z_clip(inFile):
    return False, "a_set_no_z_clip"


def a_set_z_clip(inFile):
    return False, "a_set_z_clip"


def a_clear_z_clip(inFile):
    return False, "a_clear_z_clip"


def a_set_sprite_ex(inFile):
    return False, f"a_set_sprite_ex 0x{get_short(inFile):X}"


def interpret(inFile) -> Tuple[bool, str, int]:
    funcList = {
        0x00: a_end,
        # 0x01
        0x02: a_jump,
        0x03: a_destroy,
        0x04: a_jump_if_flag,
        0x05: a_jump_if_not_flag,
        0x06: a_set_flag,
        0x07: a_clear_flag,
        0x08: a_init,
        0x09: a_init_no_sprite,
        0x0A: a_set_radius,
        0x0B: a_set_height,
        0x0C: a_set_hitbox_offset,
        0x0D: a_enable_dialog,
        0x0E: a_disable_dialog,
        0x0F: a_set_palette,
        0x10: a_wait,
        0x11: a_drop,
        0x12: a_enable_turn,
        0x13: a_disable_turn,
        0x14: a_set_pos,
        0x15: a_move,
        0x16: a_set_sprite_frame,
        0x17: a_set_sprite,
        0x18: a_set_dialog,
        0x19: a_sprite_auto_priority,
        0x1A: a_sprite_high_priority,
        0x1B: a_sprite_low_priority,
        0x1C: a_sprite_mask,
        0x1D: a_sprite_mask_set_flag,
        0x1E: a_sprite_mask_clear_flag,
        0x1F: a_disable_collision,
        0x20: a_enable_collision,
        0x21: a_set_no_z_clip,
        0x22: a_set_z_clip,
        0x23: a_clear_z_clip,
        0x24: a_set_sprite_ex,
    }
    textBuf = ""
    isDone = False
    label = -1
    b = get_byte(inFile)
    if b in funcList:
        isDone, textBuf, *lbl = funcList[b](inFile)
        label = lbl[0] if lbl else -1
    else:
        isDone = True
        print(f"Unknown Command {b:X} at {inFile.tell():X}")
    return isDone, textBuf, label


def get_text_offset_list(inFile: BinaryIO) -> List[int]:
    offsetList = []
    while True:
        off = get_int(inFile)
        if off == 0xFF:
            print("Break")
            break
        off -= 0x8000000
        offsetList.append(off)
    return offsetList


def extract_npc(label: str, inFile: BinaryIO) -> str:
    output = label + ":\n"
    offsetlist = get_text_offset_list(inFile)
    for off in offsetlist:
        output += f"    .word NPC_{off + 0x8000000:08X}\n"
    output += "    .word 0xFF\n\n"
    idx = 0
    for off in offsetlist:
        if off & 4 != 0:
            output += "    .align 2, 0\n\n"
        inFile.seek(off)
        scriptBuf = []
        labelList = []
        while True:
            lineOff = inFile.tell() + 0x8000000
            interp = interpret(inFile)
            if interp[0]:
                if interp[1] != "":
                    scriptBuf.append([lineOff, "    " + interp[1]])
                if interp[2] != -1:
                    labelList.append(interp[2])
                nextLine = inFile.tell() + 0x8000000
                if nextLine not in labelList:
                    break
            else:
                scriptBuf.append([lineOff, "    " + interp[1]])
                if interp[2] != -1:
                    labelList.append(interp[2])
        scriptBufTxt = []
        for line in scriptBuf:
            if line[0] in labelList:
                scriptBufTxt.append(f"L_{line[0]:X}:")
            scriptBufTxt.append(line[1])
        scriptBufTxt = "\n".join(scriptBufTxt)
        output += f"NPC_{(off + 0x8000000):08X}:\n{scriptBufTxt}\n\n"
        idx += 1
    output += "    .align 2, 0\n\n"
    return output


def main():
    parser = argparse.ArgumentParser(description="Extract NPC AI data.")
    parser.add_argument(
        "-o", "--output", type=str, default="", help="The output file name."
    )
    parser.add_argument(
        "-l", "--label", type=str, default="", help="The label for the generated code."
    )
    parser.add_argument("path", type=str, help="The path to the binary.")
    parser.add_argument("offset", type=auto_int, help="The offset into the binary.")
    args = parser.parse_args()
    inPath = Path(args.path)
    if not inPath.exists():
        exit(f"Couldn't find file {args.path}")
    fileOffset = args.offset
    fileSize = inPath.stat().st_size
    if fileOffset >= fileSize:
        exit(f"File offset {fileOffset} is greater than the size of the file {inPath}")
    label = args.label if args.label else f"NPC_{fileOffset:08X}"
    outPath = Path(args.output if args.output else f"{fileOffset:08x}.txt")
    with open(inPath, mode="rb") as inFile:
        inFile.seek(fileOffset)
        result = extract_npc(label, inFile)
        with open(outPath, "w") as outFile:
            outFile.write(result)


if __name__ == "__main__":
    main()
