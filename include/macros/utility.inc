    .macro time_msf m, s, f
    .word 0x\m\s\f
    .endm

    .macro time_sf s, f
    .short 0x\s\f
    .endm

    .macro tilemap_entry tileIndex, flipFlags, paletteBank
    .short (\tileIndex & 0x3FF) | (\flipFlags & 0x3) << 10 | (\paletteBank & 0xF) << 12
    .endm
