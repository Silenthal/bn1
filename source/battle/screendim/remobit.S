#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Remobit
    push       {lr}
    ldr        r7,PTR_PTR_SD_Remobit_0_08099eac
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Remobit_0_08099eac:
    .word PTR_SD_Remobit_0_08099eb0

PTR_SD_Remobit_0_08099eb0:
    .word SD_Remobit_0
    .word SD_Remobit_1
    .word SD_Remobit_2
    .word SD_Remobit_3
    .word SD_Remobit_4


_ts SD_Remobit_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x69
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


_ts SD_Remobit_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099f4c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099f4c
    ldrb       r0,[r5,#0x6]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    add        r2,r0,#0x0
    pop        {r0}
    LoadMain battle, r7, r7
    add        r7,#0x40
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    add        r0,r0,r2
    mov        r3,#0x14
    strb       r0,[r5,r3]
    mov        r3,#0x15
    strb       r1,[r5,r3]
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
    mov        r0,#0x15
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099f4c:
    pop        {pc}


_nt SD_Remobit_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099f8a
    LoadMain matchBattleState, r0, r0
    ldrb       r7,[r5,#0x6]
    tst        r7,r7
    beq        LAB_08099f64
    add        r0,#0x70
LAB_08099f64:
    add        r0,#0x50
    mov        r3,#0x14
    ldrb       r1,[r5,r3]
    mov        r3,#0x15
    ldrb       r2,[r5,r3]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    bl         Attack_Remobit_Chip_Create
    tst        r4,r4
    beq        LAB_08099f82
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_08099f82:
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08099f8a:
    pop        {pc}


_ts SD_Remobit_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099fa6
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_08099fa6:
    pop        {pc}


_ts SD_Remobit_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099fc2
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099fc2:
    pop        {pc}
