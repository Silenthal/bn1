#!/usr/bin/python3
import argparse
import io
from pathlib import Path
from typing import BinaryIO

from common import (
    auto_int,
    get_byte,
    get_int,
    exit_error
)


def fix(num: int):
    flt = num / 0x10000
    if flt >= 0x8000:
        flt -= 0x10000
    return flt


def extract_task_at(inFile, funcIndex, delay):
    textBuf = ""
    isDone = False
    label = -1
    val1 = get_int(inFile)
    if val1 == 0:
        textBuf = "task_stop"
        isDone = True
    elif val1 == 1:
        textBuf = "task_repeat"
        isDone = True
    elif val1 == 2:
        jmp = get_int(inFile)
        textBuf = f"task_jump L_{jmp:X}"
        isDone = True
        label = jmp
    else:
        val2 = get_int(inFile)
        delay_arg = "" if val2 == delay else f", {val2}"
        if funcIndex == 0:  # direct
            textBuf = f"task_direct_arg 0x{val1:X}{delay_arg}"
        elif funcIndex == 4:  # tileset
            textBuf = f"task_tileset_arg 0x{val1:X}{delay_arg}"
        elif funcIndex == 8:  # tilemap
            textBuf = f"task_tilemap_arg 0x{val1:X} 0x{val2:X}"
    return isDone, textBuf, label


def extract_task(inFile):
    offset = inFile.tell()
    output = f"global_label BgTask_{(offset+0x8000000):07X}\n"
    endAddr = get_int(inFile)
    vramDest = get_int(inFile)
    funcIndex = get_byte(inFile)
    bgIndex = get_byte(inFile)
    tileCount = get_byte(inFile)
    tileBufferIndex = get_byte(inFile)
    inFile.seek(4, 1)
    delay = get_int(inFile)
    delay_arg = "" if delay == 1 else f", {delay}"
    delay_arg_8 = "" if delay == 8 else f", {delay}"
    inFile.seek(-8, 1)
    if funcIndex == 0:  # direct
        if vramDest == 8:
            output += (
                f"    task_direct {bgIndex}, 0x{endAddr:X}, 0x{vramDest:X}{delay_arg}\n"
            )
        else:
            output += (
                f"    task_direct {bgIndex}, 0x{endAddr:X}, 0x{vramDest:X}{delay_arg}\n"
            )
    elif funcIndex == 4:  # tileset
        output += f"    task_tileset {bgIndex}, 0x{endAddr:X}, 0x{vramDest:X}, 0x{tileCount:X}, {tileBufferIndex}{delay_arg_8}\n"
    elif funcIndex == 8:  # tilemap
        output += f"    task_tilemap {bgIndex}, 0x{tileCount:X}, {tileBufferIndex}\n"
    else:
        return output
    argcount = 500
    if funcIndex == 8:
        argcount = tileCount
    scriptBuf = []
    labelList = []
    while True:
        if argcount <= 0:
            break
        lineOff = inFile.tell() + 0x8000000
        interp = extract_task_at(inFile, funcIndex, delay)
        if interp[0]:
            if interp[1] != "":
                scriptBuf.append([lineOff, "    " + interp[1]])
            if interp[2] != -1:
                labelList.append(interp[2])
            # Only continue if there's a line label after this
            nextLine = inFile.tell() + 0x8000000
            if nextLine not in labelList:
                break
        else:
            scriptBuf.append([lineOff, "    " + interp[1]])
            if interp[2] != -1:
                labelList.append(interp[2])
        argcount -= 1
    scriptBufTxt = []
    for line in scriptBuf:
        if line[0] in labelList:
            scriptBufTxt.append(f"L_{line[0]:X}:")
        scriptBufTxt.append(line[1])
    scriptBufTxt = "\n".join(scriptBufTxt)
    output += scriptBufTxt + "\n\n"
    return output


def extract_task_list(inFile: BinaryIO) -> str:
    output: str = ""
    while True:
        temp = get_int(inFile)
        inFile.seek(-4, io.SEEK_CUR)
        if temp >= 0x2000000 and temp <= 0x8800000:
            output += extract_task(inFile)
        else:
            print(f"Break reached at {inFile.tell():X}")
            break
    return output


def main():
    parser = argparse.ArgumentParser(
        description="Extract bg task data from Mega Man Battle Network."
    )
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
        exit_error(f"Couldn't find file {args.path}")
    fileOffset = args.offset
    fileSize = inPath.stat().st_size
    if fileOffset >= fileSize:
        exit_error(f"File offset {fileOffset} is greater than the size of the file {inPath}")
    outPath = Path(args.output if args.output else f"{fileOffset:08x}.txt")
    with open(inPath, mode="rb") as inFile:
        inFile.seek(fileOffset)
        with open(outPath, "w") as outFile:
            outFile.write(extract_task_list(inFile))


if __name__ == "__main__":
    main()
