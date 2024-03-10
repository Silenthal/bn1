#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


_ts Battle_SetState_InBattle
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x9]
    mov        pc,lr


_nt Battle_ClearState_InBattle
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x2
    mvn        r1,r1
    and        r0,r1
    strb       r0,[r7,#0x9]
    mov        pc,lr


_nt Battle_SetState_EnemySpawned
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x1
    orr        r0,r1
    strb       r0,[r7,#0x9]
    mov        pc,lr

_nt Battle_ClearState_EnemySpawned
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x1
    bic        r0,r1
    strb       r0,[r7,#0x9]
    mov        pc,lr

_nt Battle_IncreaseBattleTime
    ldrh       r0,[r5,#0x20]
    add        r0,#0x1
    ldr        r1,=36000
    cmp        r0,r1
    bmi        LAB_08006ab2
    add        r0,r1,#0x0
LAB_08006ab2:
    strh       r0,[r5,#0x20]
    mov        pc,lr

    .align 2, 0

    .pool

@@ Update the multiple delete count based on the delete buffer.
_ts Battle_ProcessMultipleDelete
    @ Set the current count to the temp count if the temp count is greater
    ldrb       r0,[r5,#0x16]
    ldrb       r1,[r5,#0x17]
    cmp        r0,r1
    bmi        .checkTimer
    strb       r0,[r5,#0x17]
.checkTimer:
    @ Check the buffer timer - if it has run out,
    @ set the temp count to 0. Otherwise, decrease
    @ the timer
    ldrb       r0,[r5,#0x15]
    tst        r0,r0
    beq        .resetCounter
    sub        r0,#0x1
    strb       r0,[r5,#0x15]
    b          0f
.resetCounter:
    mov        r0,#0x0
    strb       r0,[r5,#0x16]
0:
    mov        pc,lr
thumb_func_end Battle_ProcessMultipleDelete


_ts Battle_CheckCrackedPanelBreak
    push       {r5,lr}
    mov        r3,#0x0
    ldr        r6,PTR_gAreaProperties_08006b2c
    ldr        r7,PTR_gPanelStatuses_08006b28
LAB_08006ae0:
    ldrb       r0,[r6,#0x0]
    ldr        r1,[r7,#0x0]
    mov        r2,#0x1
    tst        r0,r2
    beq        LAB_08006b1a
    mov        r2,#0x4
    tst        r0,r2
    beq        LAB_08006b1a
    ldr        r2,UINT_08006b38
    tst        r1,r2
    bne        LAB_08006b1a
    ldr        r2,DAT_08006b30
    tst        r1,r2
    bne        LAB_08006b1a
    add        r4,r1,#0x0
    ldr        r5,[r7,#0x4]
    ldr        r2,DAT_08006b34
    and        r4,r2
    and        r5,r2
    mvn        r4,r4
    and        r4,r5
    beq        LAB_08006b1a
    mov        r2,#0x5
    mvn        r2,r2
    and        r2,r0
    strb       r2,[r6,#0x0]
    mov        r0,#0x7b
    bl         Sound_PlaySongImmediate
LAB_08006b1a:
    str        r1,[r7,#0x4]
    add        r6,#0x1
    add        r7,#0x10
    add        r3,#0x1
    cmp        r3,#0x28
    bmi        LAB_08006ae0
    pop        {r5,pc}
PTR_gPanelStatuses_08006b28: .word gPanelStatuses
PTR_gAreaProperties_08006b2c: .word gAreaProperties
DAT_08006b30: .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
DAT_08006b34: .word PF_PlayerOccupied | PF_EnemyOccupied
UINT_08006b38: .word PF_Teleporting | PF_Sealed


_ts Battle_CheckPanelRestore
    push       {r5,lr}
    mov        r4,#0x0
    ldr        r5,PTR_listValidPanels_08006b88
    ldr        r6,PTR_gAreaProperties_08006bb8
    ldr        r7,PTR_gPanelStatuses_08006bb4
LAB_08006b46:
    ldrb       r0,[r5,r4]
    tst        r0,r0
    beq        LAB_08006b7c
    ldrb       r0,[r6,r4]
    mov        r2,#0x1
    tst        r0,r2
    bne        LAB_08006b68
    mov        r3,#0x4
    bic        r0,r3
    strb       r0,[r6,r4]
    ldrh       r1,[r7,#0x8]
    sub        r1,#0x1
    strh       r1,[r7,#0x8]
    bne        LAB_08006b70
    orr        r0,r2
    strb       r0,[r6,r4]
    b          LAB_08006b70
LAB_08006b68:
    ldr        r1,DAT_08006bbc
    strh       r1,[r7,#0x8]
    mov        r2,#0x0
    b          LAB_08006b7a
LAB_08006b70:
    mov        r2,#0x0
    ldrh       r1,[r7,#0x8]
    cmp        r1,#0x78
    bpl        LAB_08006b7a
    mov        r2,#0x1
LAB_08006b7a:
    strb       r2,[r7,#0xd]
LAB_08006b7c:
    add        r7,#0x10
    add        r4,#0x1
    cmp        r4,#0x28
    bmi        LAB_08006b46
    pop        {r5,pc}

    .align 2, 0

PTR_listValidPanels_08006b88: .word listValidPanels
listValidPanels:
    .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 1, 1, 1, 1, 1, 1, 0
    .byte 0, 1, 1, 1, 1, 1, 1, 0
    .byte 0, 1, 1, 1, 1, 1, 1, 0
    .byte 0, 0, 0, 0, 0, 0, 0, 0

PTR_gPanelStatuses_08006bb4: .word gPanelStatuses
PTR_gAreaProperties_08006bb8: .word gAreaProperties
DAT_08006bbc: .word 900


_ts FUN_08006bc0
    push       {lr}
    tst        r0,r0
    bne        LAB_08006bce
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x1
    strb       r0,[r7,#0xd]
LAB_08006bce:
    mov        r7,r10
    ldr        r6,[r7,#0x8]
    mov        r0,#0x2
    strb       r0,[r6,#0x10]
    ldr        r6,[r7,#0xc]
    mov        r0,#0x8
    strb       r0,[r6,#0x0]
    mov        r0,#0x8
    strb       r0,[r6,#0x1]
    mov        r0,#0x0
    strh       r0,[r6,#0x2]
    pop        {pc}

    .align 2, 0
