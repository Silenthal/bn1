#!/usr/bin/python3
import argparse
import io
import os
import subprocess
from pathlib import Path
from typing import Callable


def create_object_list_with_pad(srcList, maxSize: int, assemble: Callable[[str, int, int], None]):
    outList = []
    for index in range(len(srcList)):
        if index >= len(srcList):
            break
        cur = srcList[index]
        outList.append(cur)
        of = cur['off']
        ln = cur['len']
        following_offset = of + ln
        next_offset = -1
        if index + 1 < len(srcList):
            next_offset = srcList[index + 1]['off']
        else:
            next_offset = maxSize
        if following_offset < next_offset:
            pad_off = following_offset
            pad_len = next_offset - following_offset
            pad_base = f"__pad__bin__{pad_off:X}_{pad_len:X}"
            pad_obj = pad_base + ".o"
            if not Path(pad_obj).exists():
                assemble(pad_obj, pad_off, pad_len)
            outList.append({
                'name': pad_base,
                'obj': pad_obj,
                'off': pad_off,
                'len': pad_len
            })
    return outList


def fill_layout_off_len(layDesc):
    srcList = []
    for part in layDesc:
        nameObj = part["name"] + ".o"
        fullpath = Path(nameObj)
        if fullpath.exists():
            pOd = subprocess.Popen(["objdump", "-h", fullpath], stdout=subprocess.PIPE)
            pGp = subprocess.Popen(["grep", "\.text"], stdin=pOd.stdout, stdout=subprocess.PIPE)
            pSd = subprocess.Popen(["sed", "-E", "s/ +/_/g"], stdin=pGp.stdout, stdout=subprocess.PIPE)
            pCt = subprocess.Popen(["cut", "-d", "_", "-f4"], stdin=pSd.stdout, stdout=subprocess.PIPE)
            size = int("0x" + pCt.communicate()[0].decode("utf-8"), 0)
            srcList.append({
                'name': part["name"],
                'obj': nameObj,
                'off': part["off"],
                'len': size
            })
    srcList.sort(key=lambda x: x['off'])
    return srcList


def parse_layout_file(fileObjPos: io.IOBase):
    layDesc = []
    maxSize = -1
    with open(fileObjPos, 'r') as layoutFile:
        maxSize = int(layoutFile.readline(), 0)
        for line in layoutFile:
            tok = line.strip().split()
            if len(tok) == 2 and len(tok[0]) > 0:
                try:
                    offset = int(tok[1], 0)
                    layDesc.append({
                        'name': tok[0],
                        'off': offset
                    })
                except:
                    exit(f"Unable to parse line \"{line}\" in layout file")
            else:
                exit(f"Unable to parse line \"{line}\" in layout file")
    return maxSize, layDesc


def main():
    parser = argparse.ArgumentParser(description='Preprocessing.')
    parser.add_argument('assembler', type=str, help='The path to the assembler.')
    parser.add_argument('layout_file', type=str, help='The path to the layout file.')
    parser.add_argument('base_file', type=str, help='The name of the base file.')
    parser.add_argument('link_file', type=str, help='The name of the linker file to be created.')
    args = parser.parse_args()
    fileLayout = Path(args.layout_file)
    fileBaseRom = Path(args.base_file)
    if not fileLayout.exists():
        exit(f"Couldn't find layout file {fileLayout}")
    def assemble(outputName: str, outputOffset: int, outputLength: int) -> None:
        pEcho = subprocess.Popen(["echo", f".incbin \"{fileBaseRom}\", 0x{outputOffset:X}, 0x{outputLength:X}"], stdout=subprocess.PIPE)
        subprocess.Popen(args.assembler.split() + ["-o", outputName, "-"], stdin=pEcho.stdout)
    maxSize, layDesc = parse_layout_file(fileLayout)
    srcList = fill_layout_off_len(layDesc)
    outList = create_object_list_with_pad(srcList, maxSize, assemble)
    with open(args.link_file, 'w') as lFile:
        for desc in outList:
            lFile.write(f"{desc['obj']}(.text)\n")


if __name__ == "__main__":
    main()
