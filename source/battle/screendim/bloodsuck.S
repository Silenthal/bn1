#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_BloodSuck
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_BloodSuck_0_Init_0809bb44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_BloodSuck_0_Init_0809bb38:
    .word SD_BloodSuck_0_Init
    .word SD_BloodSuck_1_Main
    .word SD_BloodSuck_2_Free

PTR_PTR_SD_BloodSuck_0_Init_0809bb44:
    .word PTR_SD_BloodSuck_0_Init_0809bb38


_ts SD_BloodSuck_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xe9
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


_ts SD_BloodSuck_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_BloodSuck_1_0_0809bb94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_BloodSuck_1_0_0809bb88:
    .word SD_BloodSuck_1_0
    .word SD_BloodSuck_1_1
    .word SD_BloodSuck_1_2

PTR_PTR_SD_BloodSuck_1_0_0809bb94:
    .word PTR_SD_BloodSuck_1_0_0809bb88


_ts SD_BloodSuck_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809bbca
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809bbca
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809bbca:
    pop        {pc}


_ts SD_BloodSuck_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809bbf2
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x6]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#0xc]
    mov        r4,#0x0
    bl         Routine_BloodSuck_Create
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809bbf2:
    pop        {pc}


_ts SD_BloodSuck_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809bc18
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    beq        LAB_0809bc14
    ldrb       r0,[r5,#0x6]
    bl         Battle_GetPlayer
    push       {r5}
    add        r5,r7,#0x0
    mov        r0,#0xc8
    bl         Field_AddHp
    pop        {r5}
LAB_0809bc14:
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809bc18:
    pop        {pc}


_nt SD_BloodSuck_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809bc32
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809bc32:
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809bc48
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809bc48:
    pop        {pc}

    .align 2, 0

