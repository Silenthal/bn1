    .macro time_msf m, s, f
    .word 0x\m\s\f
    .endm

    .macro time_sf s, f
    .short 0x\s\f
    .endm
