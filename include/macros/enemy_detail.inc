    .macro hp amt
    .short \amt
    .endm

    .macro element elem
    .byte \elem
    .endm

    .macro zenny amt
    .short 0x8000 | (\amt & 0x7FFF)
    .endm

    .macro chip id code
    .byte \id & 0xFF
    .byte \code & 0xFF
    .endm
