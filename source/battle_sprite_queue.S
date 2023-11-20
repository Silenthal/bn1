#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start BattleSpriteQueue_Add
global_label BattleSpriteQueue_Add
    ldr        r6,PTR_gBattleSpriteArgsArrayCount_08009d88
    ldr        r4,[r6,#0x0]
    ldr        r7,PTR_gBattleSpriteArgsArray_08009d84
    lsl        r4,r4,#0x4
    add        r7,r7,r4
    str        r0,[r7,#0x0]
    str        r1,[r7,#0x4]
    str        r2,[r7,#0x8]
    str        r3,[r7,#0xc]
    lsr        r4,r4,#0x4
    add        r4,#0x1
    str        r4,[r6,#0x0]
    mov        pc,lr

    .align 2, 0

PTR_gBattleSpriteArgsArray_08009d84:        .word gBattleSpriteArgsArray
PTR_gBattleSpriteArgsArrayCount_08009d88:   .word gBattleSpriteArgsArrayCount

    thumb_func_end BattleSpriteQueue_Add

thumb_func_start BattleSpriteQueue_TransferAll
global_label BattleSpriteQueue_TransferAll
    push       {r5,lr}
    ldr        r6,PTR_gBattleSpriteArgsArrayCount_08009db4
    ldr        r6,[r6,#0x0]
    ldr        r7,PTR_gBattleSpriteArgsArray_08009db0
LAB_08009d94:
    tst        r6,r6
    beq        LAB_08009dae
    sub        r6,#0x1
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    push       {r6,r7}
    bl         Oam_AddObject
    pop        {r6,r7}
    add        r7,#0x10
    b          LAB_08009d94
LAB_08009dae:
    pop        {r5,pc}

PTR_gBattleSpriteArgsArray_08009db0:        .word gBattleSpriteArgsArray
PTR_gBattleSpriteArgsArrayCount_08009db4:   .word gBattleSpriteArgsArrayCount

    thumb_func_end BattleSpriteQueue_TransferAll

thumb_func_start BattleSpriteQueue_Clear
global_label BattleSpriteQueue_Clear
    mov        r0,#0x0
    ldr        r7,=gBattleSpriteArgsArrayCount
    str        r0,[r7,#0x0]
    mov        pc,lr

    .pool

thumb_func_end BattleSpriteQueue_Clear

    .end
