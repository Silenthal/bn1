    .macro song address, ms, me
    .word \address
    .short \ms
    .short \me
    .endm
