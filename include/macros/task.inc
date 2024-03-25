    .macro task_direct slot, dst, len=8, delay=1
    .word \dst, \len
    .byte 0
    .byte \slot, 0xFF, 0xFF
    .set task_delay, \delay
    .endm

    .macro task_tileset slot, src, dst, count, bufIndex, delay=8
    .word \src, \dst
    .byte 4
    .byte \slot, \count, \bufIndex
    .set task_delay, \delay
    .endm

    .macro task_tilemap slot, count, bufIndex
    .word 0, 0
    .byte 8
    .byte \slot, \count, \bufIndex
    .endm

    .macro task_tileset_arg offset, delay=task_delay
    .word \offset, \delay
    .endm

    .macro task_direct_arg dst, delay=task_delay
    .word \dst, \delay
    .endm

    .macro task_tilemap_arg archiveIndex, tilemap
    .word \archiveIndex, \tilemap
    .endm

    .macro task_repeat
    .word 1
    .endm

    .macro task_stop
    .word 0
    .endm

    .macro task_jump dst
    .word 2
    .word \dst
    .endm

