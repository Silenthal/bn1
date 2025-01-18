#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_SharkMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_SharkMan_0_Init_0809aa50
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_SharkMan_0_Init_0809aa44:
    .word SD_SharkMan_0_Init
    .word SD_SharkMan_1_Main
    .word SD_SharkMan_2_Free

PTR_PTR_SD_SharkMan_0_Init_0809aa50:
    .word PTR_SD_SharkMan_0_Init_0809aa44


_ts SD_SharkMan_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xc1
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


_ts SD_SharkMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_SharkMan_1_0_0809aaa0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_SharkMan_1_0_0809aa94:
    .word SD_SharkMan_1_0
    .word SD_SharkMan_1_1
    .word SD_SharkMan_1_2

PTR_PTR_SD_SharkMan_1_0_0809aaa0:
    .word PTR_SD_SharkMan_1_0_0809aa94


_ts SD_SharkMan_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809aada
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809aada
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809aada:
    pop        {pc}


_ts SD_SharkMan_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809ab16
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    ldrb       r4,[r5,#0x5]
    bl         Routine_SharkMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         SD_SharkMan_1_1_CreateFins
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809ab16:
    pop        {pc}
    .word DAT_0809ab20
    .word DAT_0809ab24

DAT_0809ab20:
    .byte 0x01
    .byte 0x03
    .byte 0x02

    .align 2, 0


DAT_0809ab24:
    .byte 0x01
    .byte 0x06


_nt SD_SharkMan_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    bne        LAB_0809ab3c
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809ab3c:
    pop        {pc}


_nt SD_SharkMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809ab56
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809ab56:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809ab6c
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ab6c:
    pop        {pc}


_nt SD_SharkMan_1_1_CreateFins
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r7,[r7,r0]
    ldrb       r1,[r7,#0x18]
    mov        r2,#0x3
    ldrb       r7,[r7,#0x19]
    mov        r6,#0x1
LAB_0809ab8a:
    cmp        r2,r7
    beq        LAB_0809abc4
    push       {r1,r2,r6,r7}
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    bl         Field_GetPanelFlags
    pop        {r1,r2,r6,r7}
    mov        r3,#0x1
    tst        r0,r3
    beq        LAB_0809abc4
    mov        r3,#0x8
    lsl        r3,r3,#0x8
    tst        r0,r3
    bne        LAB_0809abc4
    push       {r1,r2,r6,r7}
    ldrb       r0,[r5,#0x6]
    ldrh       r6,[r5,#0xc]
    ldrb       r4,[r5,#0x5]
    mov        r3,#0x80
    orr        r4,r3
    bl         Routine_SharkMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    pop        {r1,r2,r6,r7}
    add        r6,#0x1
LAB_0809abc4:
    sub        r2,#0x1
    bpl        LAB_0809ab8a
    strb       r6,[r5,#0x3]
    pop        {pc}
