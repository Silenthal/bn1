#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PoweredCannon
    push       {lr}
    ldr        r7,PTR_PTR_SD_PoweredCannon_0_Init_080986b8
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_PoweredCannon_0_Init_080986b8:
    .word PTR_SD_PoweredCannon_0_Init_080986bc

PTR_SD_PoweredCannon_0_Init_080986bc:
    .word SD_PoweredCannon_0_Init
    .word SD_PoweredCannon_1_ShowMessage
    .word SD_PoweredCannon_2_FadeIn
    .word SD_PoweredCannon_3_Free


_ts SD_PoweredCannon_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xe6
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_ts SD_PoweredCannon_1_ShowMessage
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098734
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098734
    ldrb       r0,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    mov        r6,#0xc8
    bl         Routine_PoweredCannon_Create
    mov        r0,#0xc0
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08098734:
    pop        {pc}


_nt SD_PoweredCannon_2_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098750
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08098750:
    pop        {pc}


_nt SD_PoweredCannon_3_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809876c
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809876c:
    pop        {pc}

    .align 2, 0

