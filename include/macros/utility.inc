    .macro time_msf m, s, f
    .word 0x\m\s\f
    .endm

    .macro time_sf s, f
    .short 0x\s\f
    .endm

    .macro tilemap_entry tileIndex, flipFlags, paletteBank=0
    .short (\tileIndex & 0x3FF) | (\flipFlags & 0x3) << 10 | (\paletteBank & 0xF) << 12
    .endm

    .macro obj_attr_2 tileIndex, priority, paletteBank
    .short (\tileIndex & 0x3FF) | (\priority & 0x3) << 10 | (\paletteBank & 0xF) << 12
    .endm

    .macro cursor_attr xOff, yOff, flipFlags=0
    .byte \xOff
    .byte \yOff
    .short (\flipFlags & 0x3) << 12
    .endm

    .macro CpuSetControl wordCount, isSrcFixed, is32bit
    .word (\wordCount & 0x1FFFFF) | (\isSrcFixed & 1) << 24 | (\is32bit & 1) << 26
    .endm

    .macro pos_xyz x, y, z
    .word \x
    .word \y
    .word \z
    .endm

    .macro MapEntrance mapId, dir, x, y, z
    .short \mapId
    .byte 0
    .byte \dir
    .word \x
    .word \y
    .word \z
    .endm
