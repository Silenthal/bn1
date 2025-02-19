#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ShadowMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_ShadowMan_0_Init_0809b1c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ShadowMan_0_Init_0809b1bc:
    .word SD_ShadowMan_0_Init
    .word SD_ShadowMan_1_Main
    .word SD_ShadowMan_2_Free

PTR_PTR_SD_ShadowMan_0_Init_0809b1c8:
    .word PTR_SD_ShadowMan_0_Init_0809b1bc


_ts SD_ShadowMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x97
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts SD_ShadowMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_ShadowMan_1_0_WarpOut_0809b21c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ShadowMan_1_0_WarpOut_0809b20c:
    .word SD_ShadowMan_1_0_WarpOut
    .word SD_ShadowMan_1_1
    .word SD_ShadowMan_1_2
    .word SD_ShadowMan_1_3_WarpIn

PTR_PTR_SD_ShadowMan_1_0_WarpOut_0809b21c:
    .word PTR_SD_ShadowMan_1_0_WarpOut_0809b20c


_ts SD_ShadowMan_1_0_WarpOut
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b256
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b256
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809b256:
    pop        {pc}


_ts SD_ShadowMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b2ae
    mov        r0,#0x14
    add        r0,r0,r5
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    bge        LAB_0809b276
    bl         SD_ShadowMan_FindTargets
    b          LAB_0809b27a
LAB_0809b276:
    bl         SD_ShadowMan_FindTarget_MP
LAB_0809b27a:
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    mov        r3,#0x14
    ldrb       r2,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    mov        r6,#0x0
    bl         Routine_ShadowMan_Chip_Create
    ldrb       r0,[r5,#0x16]
    ldrb       r1,[r5,#0x17]
    mov        r3,#0x1e
    ldrb       r2,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    mov        r6,#0x1
    bl         Routine_ShadowMan_Chip_Create
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r3,#0x28
    ldrb       r2,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    mov        r6,#0x2
    bl         Routine_ShadowMan_Chip_Create
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809b2ae:
    pop        {pc}


_ts SD_ShadowMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809b2c0
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_0809b2c0:
    pop        {pc}


_nt SD_ShadowMan_1_3_WarpIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b2d8
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809b2d8:
    pop        {pc}


_nt SD_ShadowMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809b2f2
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809b2f2:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809b308
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b308:
    pop        {pc}


_nt SD_ShadowMan_FindTargets
    push       {r5,lr}
    sub        sp,#0x10
    str        r0,[sp,#0xc]
    LoadMain battle, r7, r7
    mov        r0,#0x54
    add        r6,r7,r0
    mov        r2,#0x0
    mov        r3,#0x0
    mov        r4,sp
LAB_0809b31e:
    ldr        r1,[r6,#0x0]
    tst        r1,r1
    beq        LAB_0809b332
    mov        r7,#0x20
    ldrsh      r0,[r1,r7]
    tst        r0,r0
    ble        LAB_0809b332
    str        r1,[r4,#0x0]
    add        r4,#0x4
    add        r2,#0x1
LAB_0809b332:
    add        r6,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    blt        LAB_0809b31e
    cmp        r2,#0x2
    bne        LAB_0809b352
    ldr        r3,[sp,#0x0]
    ldrh       r3,[r3,#0x20]
    ldr        r4,[sp,#0x4]
    ldrh       r4,[r4,#0x20]
    cmp        r3,r4
    bge        LAB_0809b352
    ldr        r3,[sp,#0x0]
    ldr        r4,[sp,#0x4]
    str        r3,[sp,#0x4]
    str        r4,[sp,#0x0]
LAB_0809b352:
    ldr        r6,[sp,#0xc]
    mov        r7,sp
    mov        r3,#0x0
    mov        r4,#0x0
LAB_0809b35a:
    lsl        r5,r4,#0x2
    ldr        r5,[r7,r5]
    ldrb       r0,[r5,#0x18]
    strb       r0,[r6,#0x0]
    ldrb       r0,[r5,#0x19]
    strb       r0,[r6,#0x1]
    add        r6,#0x2
    add        r3,#0x1
    cmp        r3,#0x3
    bge        LAB_0809b378
    add        r4,#0x1
    cmp        r4,r2
    blt        LAB_0809b35a
    mov        r4,#0x0
    b          LAB_0809b35a
LAB_0809b378:
    add        sp,#0x10
    pop        {r5,pc}


_ts SD_ShadowMan_FindTarget_MP
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r1,[r5,#0x6]
    mov        r2,#0x1
    eor        r1,r2
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrh       r1,[r7,#0x18]
    strh       r1,[r0,#0x0]
    strh       r1,[r0,#0x2]
    strh       r1,[r0,#0x4]
    pop        {pc}
