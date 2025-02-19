#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_ElecMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_ElecMan_0_Init_0809abe8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ElecMan_0_Init_0809abdc:
    .word SD_ElecMan_0_Init
    .word SD_ElecMan_1_Main
    .word SD_ElecMan_2_Free

PTR_PTR_SD_ElecMan_0_Init_0809abe8:
    .word PTR_SD_ElecMan_0_Init_0809abdc


_ts SD_ElecMan_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xc4
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


_ts SD_ElecMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_ElecMan_1_0_0809ac38
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_ElecMan_1_0_0809ac2c:
    .word SD_ElecMan_1_0
    .word SD_ElecMan_1_1
    .word SD_ElecMan_1_2

PTR_PTR_SD_ElecMan_1_0_0809ac38:
    .word PTR_SD_ElecMan_1_0_0809ac2c


_ts SD_ElecMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809ac72
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809ac72
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809ac72:
    pop        {pc}


_ts SD_ElecMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809aca8
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    bl         Routine_ElecMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809aca8:
    pop        {pc}

    .align 2, 0

    .word DAT_0809acb4
    .word DAT_0809acb8

DAT_0809acb4:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0


DAT_0809acb8:
    .byte 0x01
    .byte 0x06


_nt SD_ElecMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809acd0
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809acd0:
    pop        {pc}


_nt SD_ElecMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809acea
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809acea:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809ad00
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ad00:
    pop        {pc}

    .align 2, 0

