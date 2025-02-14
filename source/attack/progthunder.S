#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_ProgThunder
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_ProgThunder_0_Init_08075c98
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ProgThunder_0_Init_08075c98:
    .word PTR_A_ProgThunder_0_Init_08075c9c

PTR_A_ProgThunder_0_Init_08075c9c:
    .word A_ProgThunder_0_Init
    .word A_ProgThunder_1_Main
    .word A_ProgThunder_2_Free


_ts A_ProgThunder_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x6b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r1,#0x3
    strb       r1,[r5,#0x0]
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    bl         A_ProgThunder_1_Main
    pop        {pc}


_ts A_ProgThunder_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_ProgThunder_1_0_08075cfc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ProgThunder_1_0_08075cfc:
    .word PTR_A_ProgThunder_1_0_08075d00

PTR_A_ProgThunder_1_0_08075d00:
    .word A_ProgThunder_1_0


_ts A_ProgThunder_1_0
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x1a]
    ldrb       r1,[r5,#0x16]
    eor        r0,r1
    ldr        r7,PTR_PTR_ARRAY_08075da0
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08075d9c
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    ldrh       r0,[r5,#0x1e]
    cmp        r0,#0x9
    blt        LAB_08075d40
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
    ldrb       r1,[r5,#0xc]
    sub        r1,#0x1
    strb       r1,[r5,#0xc]
    bgt        LAB_08075d40
    bl         A_ProgThunder_2_Free
    b          LAB_08075d9c
LAB_08075d40:
    add        r1,r0,#0x1
    strh       r1,[r5,#0x1e]
    add        r0,r0,r0
    add        r7,r7,r0
    mov        r3,#0x0
    ldrsb      r0,[r7,r3]
    ldrb       r1,[r5,#0xd]
    add        r0,r0,r1
    strb       r0,[r5,#0x18]
    mov        r3,#0x1
    ldrsb      r0,[r7,r3]
    ldrb       r1,[r5,#0xe]
    add        r0,r0,r1
    strb       r0,[r5,#0x19]
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x24]
    ldr        r4,PTR_listProgThunderAttackFlag_08075dac
    lsl        r6,r2,#0x2
    ldr        r4,[r4,r6]
    mov        r6,#0x1
    mov        r7,#0x5
    bl         Attack_QuickAttack_Create
    pop        {r5}
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0xbc
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldr        r2,PTR_PanelFlag_ARRAY_08075db0
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r2,r1]
    tst        r0,r1
    beq        LAB_08075d9c
    bl         A_ProgThunder_2_Free
LAB_08075d9c:
    pop        {pc}

    .align 2, 0


PTR_PTR_ARRAY_08075da0:
    .word PTR_ARRAY_08075da4

PTR_ARRAY_08075da4:
    .word CellPosition_ARRAY_08075dc4
    .word CellPosition_ARRAY_08075dd6

PTR_listProgThunderAttackFlag_08075dac:
    .word listProgThunderAttackFlag

PTR_PanelFlag_ARRAY_08075db0:
    .word PanelFlag_ARRAY_08075dbc

listProgThunderAttackFlag:
    .word PF_Ground | PF_Player | PF_Numb
    .word PF_Ground | PF_Enemy | PF_Numb

PanelFlag_ARRAY_08075dbc:
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid

CellPosition_ARRAY_08075dc4:
    cell_pos 1, 0
    cell_pos 1, -1
    cell_pos 0, -1
    cell_pos -1, -1
    cell_pos -1, 0
    cell_pos -1, 1
    cell_pos 0, 1
    cell_pos 1, 1
    cell_pos 1, 0

CellPosition_ARRAY_08075dd6:
    cell_pos -1, 0
    cell_pos -1, -1
    cell_pos 0, -1
    cell_pos 1, -1
    cell_pos 1, 0
    cell_pos 1, 1
    cell_pos 0, 1
    cell_pos -1, 1
    cell_pos -1, 0


_ts A_ProgThunder_2_Free
    push       {lr}
    ldr        r7,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    bl         Attack_Free
    pop        {pc}


_nt Attack_ProgThunder_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x37
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    tst        r7,r7
    beq        LAB_08075e1a
    strb       r0,[r7,#0xd]
    strb       r1,[r7,#0xe]
    strb       r2,[r7,#0xc]
    str        r3,[r7,#0x64]
    str        r7,[r3,#0x0]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_08075e1a:
    add        r0,r7,#0x0
    pop        {pc}

    .align 2, 0

