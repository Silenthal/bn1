#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_LockOn
    push       {lr}
    ldr        r7,PTR_PTR_SD_LockOn_0_0809b704
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_LockOn_0_0809b704:
    .word PTR_SD_LockOn_0_0809b708

PTR_SD_LockOn_0_0809b708:
    .word SD_LockOn_0
    .word SD_LockOn_1
    .word SD_LockOn_2
    .word SD_LockOn_3
    .word SD_LockOn_4


_ts SD_LockOn_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x3d
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


_ts SD_LockOn_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809b7a4
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b7a4
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
LAB_0809b7a4:
    pop        {pc}


_nt SD_LockOn_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b7e2
    LoadMain matchBattleState, r0, r0
    ldrb       r7,[r5,#0x6]
    tst        r7,r7
    beq        LAB_0809b7bc
    add        r0,#0x70
LAB_0809b7bc:
    add        r0,#0x50
    mov        r3,#0x14
    ldrb       r1,[r5,r3]
    mov        r3,#0x15
    ldrb       r2,[r5,r3]
    ldrb       r4,[r5,#0x5]
    ldrh       r6,[r5,#0xc]
    bl         Attack_LockOn_Create
    tst        r4,r4
    beq        LAB_0809b7da
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_0809b7da:
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809b7e2:
    pop        {pc}


_ts SD_LockOn_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809b7fe
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_0809b7fe:
    pop        {pc}


_ts SD_LockOn_4
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809b81a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809b81a:
    pop        {pc}
