    .macro entity type, routine, x, y, z, family
    .byte ET_\type
    .byte \routine & 0xFF
    .short 0
    .word \x
    .word \y
    .word \z
    .word \family
    .endm
