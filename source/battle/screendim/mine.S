#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Mine
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_Mine_0_080998a4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Mine_0_08099898:
    .word SD_Mine_0
    .word SD_Mine_1
    .word SD_Mine_2

PTR_PTR_SD_Mine_0_080998a4:
    .word PTR_SD_Mine_0_08099898


_ts SD_Mine_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x5]
    mov        r1,#0x3
    bl         SWI_Div
    add        r1,#0x7c
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


_nt SD_Mine_1
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_Mine_1_0_080998fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_SD_Mine_1_0_080998ec:
    .word SD_Mine_1_0
    .word SD_Mine_1_1
    .word SD_Mine_1_2
    .word SD_Mine_1_3

PTR_PTR_SD_Mine_1_0_080998fc:
    .word PTR_SD_Mine_1_0_080998ec


_ts SD_Mine_1_0
    push       {lr}
    ldrb       r0,[r5,#0x5]
    mov        r1,#0x3
    bl         SWI_Div
    add        r1,#0x7c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809993c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809993c
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809993c:
    pop        {pc}


_nt SD_Mine_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099958
    push       {r5}
    ldrb       r3,[r5,#0x6]
    ldrb       r4,[r5,#0x5]
    bl         Attack_Mine_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_08099958:
    pop        {pc}


_nt SD_Mine_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809996a
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_0809996a:
    pop        {pc}


_ts SD_Mine_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809997e
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809997e:
    pop        {pc}


_ts SD_Mine_2
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08099998
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08099998:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_080999ae
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080999ae:
    pop        {pc}
