#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_MagicMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_MagicMan_0_Init_0809b3b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_MagicMan_0_Init_0809b3a8:
    .word SD_MagicMan_0_Init
    .word SD_MagicMan_1_Main
    .word SD_MagicMan_2_Free

PTR_PTR_SD_MagicMan_0_Init_0809b3b4:
    .word PTR_SD_MagicMan_0_Init_0809b3a8


_ts SD_MagicMan_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x9d
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


_ts SD_MagicMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_MagicMan_1_0_0809b408
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_MagicMan_1_0_0809b3f8:
    .word SD_MagicMan_1_0
    .word SD_MagicMan_1_1
    .word SD_MagicMan_1_2
    .word SD_MagicMan_1_3

PTR_PTR_SD_MagicMan_1_0_0809b408:
    .word PTR_SD_MagicMan_1_0_0809b3f8


_ts SD_MagicMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b442
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b442
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809b442:
    pop        {pc}


_ts SD_MagicMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b45a
    ldrb       r2,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Routine_MagicMan_Chip_Create
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809b45a:
    pop        {pc}


_ts SD_MagicMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809b46c
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
LAB_0809b46c:
    pop        {pc}


_nt SD_MagicMan_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b484
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809b484:
    pop        {pc}


_nt SD_MagicMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809b49e
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809b49e:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809b4b4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b4b4:
    pop        {pc}

    .align 2, 0

