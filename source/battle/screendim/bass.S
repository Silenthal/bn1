#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Bass
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_Bass_0_Init_0809b5f4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Bass_0_Init_0809b5e8:
    .word SD_Bass_0_Init
    .word SD_Bass_1_Main
    .word SD_Bass_2_Free

PTR_PTR_SD_Bass_0_Init_0809b5f4:
    .word PTR_SD_Bass_0_Init_0809b5e8


_ts SD_Bass_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xc7
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


_nt SD_Bass_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_Bass_1_0_0809b644
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_SD_Bass_1_0_0809b634:
    .word SD_Bass_1_0
    .word SD_Bass_1_1
    .word SD_Bass_1_2
    .word SD_Bass_1_3

PTR_PTR_SD_Bass_1_0_0809b644:
    .word PTR_SD_Bass_1_0_0809b634


_ts SD_Bass_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b67e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b67e
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809b67e:
    pop        {pc}


_ts SD_Bass_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b698
    ldrb       r2,[r5,#0x6]
    mov        r3,#0xc8
    ldrb       r4,[r5,#0x5]
    bl         Routine_Bass_Chip_Create
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809b698:
    pop        {pc}


_nt SD_Bass_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809b6aa
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0xa
    strh       r0,[r5,#0x8]
LAB_0809b6aa:
    pop        {pc}


_ts SD_Bass_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b6c2
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809b6c2:
    pop        {pc}


_ts SD_Bass_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809b6dc
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809b6dc:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809b6f2
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b6f2:
    pop        {pc}
