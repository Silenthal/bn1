#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_PharaohTrap
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_PharaohTrap_0_Init_0809ad20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_PharaohTrap_0_Init_0809ad14:
    .word SD_PharaohTrap_0_Init
    .word SD_PharaohTrap_1_Main
    .word SD_PharaohTrap_2_Free

PTR_PTR_SD_PharaohTrap_0_Init_0809ad20:
    .word PTR_SD_PharaohTrap_0_Init_0809ad14


_ts SD_PharaohTrap_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0xf2
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


_nt SD_PharaohTrap_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_PharaohTrap_1_0_0809ad70
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_SD_PharaohTrap_1_0_0809ad60:
    .word SD_PharaohTrap_1_0
    .word SD_PharaohTrap_1_1
    .word SD_PharaohTrap_1_2
    .word SD_PharaohTrap_1_3

PTR_PTR_SD_PharaohTrap_1_0_0809ad70:
    .word PTR_SD_PharaohTrap_1_0_0809ad60


_ts SD_PharaohTrap_1_0
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809ada6
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809ada6
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
LAB_0809ada6:
    pop        {pc}


_ts SD_PharaohTrap_1_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809adc0
    ldr        r0,[r5,#0x14]
    bl         A_PharaohTrap_PlaceTrap
    mov        r0,#0x1
    strb       r0,[r5,#0x3]
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0809adc0:
    pop        {pc}


_nt SD_PharaohTrap_1_2
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809add2
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
LAB_0809add2:
    pop        {pc}


_ts SD_PharaohTrap_1_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809ade6
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0809ade6:
    pop        {pc}


_ts SD_PharaohTrap_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0809ae00
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0809ae00:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809ae16
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809ae16:
    pop        {pc}
