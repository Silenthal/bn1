#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Mine
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Mine_0_Init_080757ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Mine_0_Init_080757ac:
    .word PTR_A_Mine_0_Init_080757b0

PTR_A_Mine_0_Init_080757b0:
    .word A_Mine_0_Init
    .word A_Mine_1_Main
    .word A_Mine_2_Free


_ts A_Mine_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x9f
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x4]
    mov        r1,#0x3
    bl         SWI_Div
    add        r0,r1,#0x0
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    ldr        r7,PTR_USHORT_ARRAY_08075824
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#0x24]
    mov        r0,#0x2b
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

USHORT_ARRAY_08075818:
    .short 0xA0
    .short 0xB4
    .short 0xC8
    .short 0x64
    .short 0xB4
    .short 0x12C

PTR_USHORT_ARRAY_08075824:
    .word USHORT_ARRAY_08075818


_ts A_Mine_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Mine_1_0_0807584c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Mine_1_0_0807584c:
    .word PTR_A_Mine_1_0_08075850

PTR_A_Mine_1_0_08075850:
    .word A_Mine_1_0
    .word A_Mine_1_1


_ts A_Mine_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Mine_1_0_0_08075868
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Mine_1_0_0_08075868:
    .word PTR_A_Mine_1_0_0_0807586c

PTR_A_Mine_1_0_0_0807586c:
    .word A_Mine_1_0_0
    .word A_Mine_1_0_1


_ts A_Mine_1_0_0
    push       {lr}
    sub        sp,#0x14
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_080758c0
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    mov        r0,sp
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    ldrb       r3,[r5,#0x16]
    bl         Field_SearchWithOwner
    tst        r1,r1
    beq        LAB_080758ac
    strb       r1,[r5,#0x1b]
    mov        r0,sp
    mov        r2,#0x14
    bl         ArrayShuffle
    mov        r0,sp
    mov        r1,#0x64
    add        r1,r1,r5
    ldrb       r2,[r5,#0x1b]
    bl         memcpy_8
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    b          LAB_080758bc
LAB_080758ac:
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_080758bc:
    add        sp,#0x14
    pop        {pc}

PTR_PanelFlag_ARRAY_ARRAY_080758c0:
    .word PanelFlag_ARRAY_ARRAY_080758c4

PanelFlag_ARRAY_ARRAY_080758c4:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Teleporting | PF_Solid | PF_Trap
    .word PF_Walkable
    .word PF_EnemyTerritory | PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Teleporting | PF_Solid | PF_Trap


_ts A_Mine_1_0_1
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,DAT_080758e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


DAT_080758e4:
    .word PTR_A_Mine_1_0_1_0_080758e8

PTR_A_Mine_1_0_1_0_080758e8:
    .word A_Mine_1_0_1_0
    .word A_Mine_1_0_1_1


_ts A_Mine_1_0_1_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x64
    ldrb       r0,[r5,r0]
    bl         Field_IndexToCellXY
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_nt A_Mine_1_0_1_1
    push       {lr}
    mov        r1,#0x7
    ldrh       r0,[r5,#0x1c]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08075920
    mov        r1,#0x5
LAB_08075920:
    strb       r1,[r5,#0x0]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x4
    bmi        LAB_0807596e
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    ldrh       r1,[r5,#0x1e]
    add        r1,#0x1
    strh       r1,[r5,#0x1e]
    cmp        r1,#0xf
    bge        LAB_0807595e
    add        r0,r1,#0x0
    ldrb       r1,[r5,#0x1b]
    bl         SWI_Div
    mov        r0,#0x64
    add        r0,r0,r5
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0xb1
    bl         Sound_PlaySE
    b          LAB_0807596e
LAB_0807595e:
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807596e:
    pop        {pc}


_ts A_Mine_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Mine_1_1_0_08075980
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Mine_1_1_0_08075980:
    .word PTR_A_Mine_1_1_0_08075984

PTR_A_Mine_1_1_0_08075984:
    .word A_Mine_1_1_0
    .word A_Mine_1_1_1


_ts A_Mine_1_1_0
    push       {lr}
    bl         A_Mine_IsActivated
    tst        r0,r0
    beq        LAB_080759a8
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x2
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_080759a8:
    pop        {pc}


_nt A_Mine_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x2
    bne        LAB_080759b8
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
LAB_080759b8:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080759ee
    mov        r4,#0x24
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_080759ca
    mov        r4,#0x25
LAB_080759ca:
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_080759de
    mov        r0,#0x5
    strb       r0,[r5,#0x0]
LAB_080759de:
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080759ee:
    pop        {pc}


_ts A_Mine_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_080759fc
    bl         FieldObstacleManager_Remove
LAB_080759fc:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts Attack_Mine_Create
    push       {lr}
    push       {r3,r5}
    mov        r0,#0x35
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r3,r5}
    tst        r7,r7
    beq        LAB_08075a2a
    strb       r3,[r7,#0x16]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
    push       {r5}
    add        r5,r7,#0x0
    bl         FieldObstacleManager_Add
    pop        {r5}
LAB_08075a2a:
    pop        {pc}


_ts A_Mine_IsActivated
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    mov        r0,#0x1
    mov        r1,#0x1
    tst        r2,r1
    beq        LAB_08075a54
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_08075a58
    ldr        r1,[r7,r1]
    tst        r2,r1
    bne        LAB_08075a54
    ldrb       r1,[r5,#0x5]
    tst        r1,r1
    bne        LAB_08075a54
    mov        r0,#0x0
LAB_08075a54:
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_08075a58:
    .word PanelFlag_08075a5c

PanelFlag_08075a5c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
