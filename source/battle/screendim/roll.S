#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Roll
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_Roll_0_Init_0809a2a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Roll_0_Init_0809a29c:
    .word SD_Roll_0_Init
    .word SD_Roll_1_Main
    .word SD_Roll_2_Free

PTR_PTR_SD_Roll_0_Init_0809a2a8:
    .word PTR_SD_Roll_0_Init_0809a29c


_ts SD_Roll_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xa0
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


_ts SD_Roll_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_Roll_1_0_WarpOut_0809a304
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Roll_1_0_WarpOut_0809a2ec:
    .word SD_Roll_1_0_WarpOut
    .word SD_Roll_1_1
    .word SD_Roll_1_2
    .word SD_Roll_1_3
    .word SD_Roll_1_4_Recover
    .word SD_Roll_1_5_Next

PTR_PTR_SD_Roll_1_0_WarpOut_0809a304:
    .word PTR_SD_Roll_1_0_WarpOut_0809a2ec


_ts SD_Roll_1_0_WarpOut
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a33e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a33e
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809a33e:
    pop        {pc}


_ts SD_Roll_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a374
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    bl         Routine_Roll_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809a374:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .word DAT_0809a37c

DAT_0809a37c:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0



_ts SD_Roll_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809a39a
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySongImmediate
    mov        r0,#0xf
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
LAB_0809a39a:
    pop        {pc}


_ts SD_Roll_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a3d6
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    mov        r6,#0x28
    add        r6,r6,r7
    ldmia      r6!,{r1,r2,r3}
    mov        r3,#0x90
    lsl        r3,r3,#0x10
    mov        r4,#0x0
    bl         Effect_RollHeart_Create
    tst        r7,r7
    beq        LAB_0809a3ce
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0809a3ce:
    mov        r0,#0x24
    strh       r0,[r5,#0x8]
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
LAB_0809a3d6:
    pop        {pc}


_ts SD_Roll_1_4_Recover
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a42a
    ldr        r7,PTR_BYTE_ARRAY_0809a42c
    ldrb       r0,[r5,#0x5]
    ldrb       r0,[r7,r0]
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r5,#0x6]
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r5,[r7,r1]
    ldrh       r1,[r7,#0x20]
    tst        r1,r1
    beq        LAB_0809a420
    bl         Field_AddHp
    mov        r0,#0x72
    bl         Sound_PlaySongImmediate
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0xe
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0809a420
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809a420:
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
LAB_0809a42a:
    pop        {pc}

PTR_BYTE_ARRAY_0809a42c:
    .word BYTE_ARRAY_0809a430

BYTE_ARRAY_0809a430:
    .byte 0x1E
    .byte 0x32
    .byte 0x50

    .align 2, 0



_ts SD_Roll_1_5_Next
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a442
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a442:
    pop        {pc}


_ts SD_Roll_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809a45c
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809a45c:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809a472
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a472:
    pop        {pc}
