#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set vBattleHandChipIcons, 0x6016e00


_ts Effect_BattleChip
    push       {lr}
    sub        sp,#0xc
    mov        r8,sp
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
    ldr        r6,[r5,#0x60]
    ldrb       r0,[r6,#0x0]
    tst        r0,r0
    bne        LAB_0807c08c
    bl         Effect_Free
    b          LAB_0807c0f2
LAB_0807c08c:
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x9]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807c0f2
    ldrb       r0,[r7,#0x18]
    tst        r0,r0
    bne        LAB_0807c0f2
    ldrb       r0,[r6,#0x13]
    bl         Enemy_GetEnemyDetail
    mov        r4,#0x3
    ldrsb      r1,[r0,r4]
    add        r1,#0x4
    lsl        r1,r1,#0x10
    mov        r7,r8
    ldr        r0,[r6,#0x28]
    str        r0,[r7,#0x0]
    ldr        r0,[r6,#0x2c]
    str        r0,[r7,#0x4]
    ldr        r0,[r6,#0x30]
    add        r0,r0,r1
    str        r0,[r7,#0x8]
    add        r0,r7,#0x0
    bl         ConvertToObjectPosition
    tst        r2,r2
    bne        LAB_0807c0c8
    b          LAB_0807c0f2
LAB_0807c0c8:
    push       {r0,r1}
    bl         E_BattleChip_GetCurrentChipIndex
    pop        {r0,r1}
    mov        r7,#0x64
    add        r7,r7,r5
    sub        r4,r3,r2
    add        r4,r4,r4
    sub        r0,r0,r4
    strh       r0,[r7,#0x0]
    sub        r1,r1,r4
    strh       r1,[r7,#0x2]
LAB_0807c0e0:
    sub        r3,#0x1
    cmp        r3,r2
    bmi        LAB_0807c0f2
    push       {r2,r3}
    add        r0,r3,#0x0
    bl         E_BattleChip_DrawFloatingChipIcon
    pop        {r2,r3}
    b          LAB_0807c0e0
LAB_0807c0f2:
    add        sp,#0xc
    pop        {pc}


_nt E_BattleChip_DrawFloatingChipIcon
    push       {r5,lr}
    ldr        r7,[r5,#0x60]
    ldrb       r2,[r7,#0x16]
    mov        r1,#0x14
    mul        r2,r1
    ldr        r1,DAT_0807c134
    add        r1,r1,r2
    lsl        r0,r0,#0x2
    add        r1,r1,r0
    push       {r1}
    mov        r2,#0x40
    lsl        r2,r2,#0x8
    mov        r7,#0x64
    add        r7,r7,r5
    ldrh       r1,[r7,#0x0]
    add        r1,#0x2
    strh       r1,[r7,#0x0]
    orr        r1,r2
    lsl        r1,r1,#0x10
    ldrh       r2,[r7,#0x2]
    add        r2,#0x2
    strh       r2,[r7,#0x2]
    orr        r2,r1
    pop        {r1}
    add        r0,r2,#0x0
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Battle_SpriteQueueAdd
    pop        {r5,pc}

    .align 2, 0


DAT_0807c134:
    .word 0xCB70


_ts Effect_BattleChip_Create
    push       {r5,lr}
    push       {r0}
    mov        r0,#0x9
    bl         Effect_Alloc
    pop        {r0}
    tst        r5,r5
    beq        LAB_0807c14e
    str        r0,[r5,#0x60]
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
LAB_0807c14e:
    add        r0,r5,#0x0
    pop        {r5,pc}


_nt Effect_BattleChip_DrawHand
    push       {r5,lr}
    LoadMain battle, r7, r7
    ldr        r0,[r7,#0x40]
    bl         Effect_BattleChip_Create
    pop        {r5,pc}


_ts Effect_BattleChip_LoadHandIcons
    push       {r5,lr}
    sub        sp,#0x10
    LoadMain playerBattleState, r7, r7
    mov        r6,#0x6a
    add        r0,r6,r7
    mov        r1,sp
    mov        r2,#0x5
    bl         memcpy_8
    add        r7,#0x70
    mov        r6,#0x6a
    add        r0,r6,r7
    mov        r1,sp
    add        r1,#0x5
    mov        r2,#0x5
    bl         memcpy_8
    ldr        r0,PTR_gBattleHandChipIcons_0807c1c0
    mov        r1,#0x40
    lsl        r1,r1,#0x4
    bl         memset0_32
    ldr        r6,PTR_gBattleHandChipIcons_0807c1c0
    mov        r7,sp
    mov        r4,#0x0
LAB_0807c194:
    ldrb       r0,[r7,r4]
    cmp        r0,#0xff
    beq        LAB_0807c1a8
    bl         BattleChip_GetChipData
    ldr        r0,[r0,#0x10]
    add        r1,r6,#0x0
    ldr        r2,CpuSetControl_0807c1c4
    bl         SWI_CpuSet
LAB_0807c1a8:
    add        r6,#0x80
    add        r4,#0x1
    cmp        r4,#0xa
    bmi        LAB_0807c194
    ldr        r0,PTR_gBattleHandChipIcons_0807c1c0
    ldr        r1,PTR_vBattleHandChipIcons_0807c1c8
    mov        r2,#0x10
    lsl        r2,r2,#0x4
    bl         Dma_TransferListAdd
    add        sp,#0x10
    pop        {r5,pc}

PTR_gBattleHandChipIcons_0807c1c0:
    .word gBattleHandChipIcons

CpuSetControl_0807c1c4:
    .byte 0x20, 0x00, 0x00, 0x04

PTR_vBattleHandChipIcons_0807c1c8:
    .word vBattleHandChipIcons


_ts E_BattleChip_GetCurrentChipIndex
    push       {lr}
    mov        r1,#0x70
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x16]
    mul        r0,r1
    LoadMain playerBattleState, r7, r7
    add        r7,r7,r0
    mov        r3,#0x0
    mov        r6,#0x6a
    add        r6,r6,r7
LAB_0807c1e2:
    ldrb       r1,[r6,r3]
    cmp        r1,#0xff
    beq        LAB_0807c1ec
    add        r3,#0x1
    b          LAB_0807c1e2
LAB_0807c1ec:
    ldrb       r2,[r7,#0x1]
    pop        {pc}
