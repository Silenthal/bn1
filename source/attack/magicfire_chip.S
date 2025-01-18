#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_MagicFire_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_MagicFireC_0_Init_0807a798
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MagicFireC_0_Init_0807a798:
    .word PTR_A_MagicFireC_0_Init_0807a79c

PTR_A_MagicFireC_0_Init_0807a79c:
    .word A_MagicFireC_0_Init
    .word A_MagicFireC_1_Main
    .word A_MagicFireC_2_Free


_ts A_MagicFireC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xa0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x0
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0807a7ea
    mov        r0,#0x0
LAB_0807a7ea:
    bl         SpritePtr_SetFlipType
    bl         A_MagicFireC_1_Main
    pop        {pc}


_ts A_MagicFireC_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_MagicFireC_1_0_0807a808
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_MagicFireC_1_0_0807a808:
    .word PTR_A_MagicFireC_1_0_0807a80c

PTR_A_MagicFireC_1_0_0807a80c:
    .word A_MagicFireC_1_0
    .word A_MagicFireC_1_1_LethalHit
    .word A_MagicFireC_1_2_RegularHit


_ts A_MagicFireC_1_0
    push       {lr}
    bl         A_MagicFireC_CheckTargetPanel
    tst        r0,r0
    beq        LAB_0807a83e
    bl         A_MagicFireC_IsRareEvent
    tst        r0,r0
    beq        LAB_0807a834
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807a886
LAB_0807a834:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807a886
LAB_0807a83e:
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    bne        LAB_0807a874
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a886
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0807a86c
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    b          LAB_0807a874
LAB_0807a86c:
    ldr        r2,[r5,#0x60]
    ldrb       r4,[r5,#0x4]
    bl         Attack_MagicFire_Chip_Create
LAB_0807a874:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a886
    mov        r0,#0x5
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807a886:
    pop        {pc}


_ts A_MagicFireC_1_1_LethalHit
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_MagicFireC_1_1_0_0807a898
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MagicFireC_1_1_0_0807a898:
    .word PTR_A_MagicFireC_1_1_0_0807a89c

PTR_A_MagicFireC_1_1_0_0807a89c:
    .word A_MagicFireC_1_1_0
    .word A_MagicFireC_1_1_1


_ts A_MagicFireC_1_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a8d6
    mov        r0,#0x5
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x2
    bl         Effect_MagicMan_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0807a8c8
    mov        r0,#0x5
    strb       r0,[r7,#0x0]
LAB_0807a8c8:
    mov        r0,#0x8f
    bl         Sound_PlaySE
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0807a8d6:
    pop        {pc}


_ts A_MagicFireC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a8f6
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    mov        r3,#0x7d
    lsl        r3,r3,#0x3
    bl         A_MagicFireC_CreateAttack
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
LAB_0807a8f6:
    pop        {pc}


_ts A_MagicFireC_1_2_RegularHit
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a91c
    mov        r0,#0x5
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldrb       r3,[r5,#0x4]
    mov        r1,#0x14
    mul        r3,r1
    add        r3,#0x64
    bl         A_MagicFireC_CreateAttack
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
LAB_0807a91c:
    pop        {pc}


_nt A_MagicFireC_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_MagicFire_2_0_Free_0807a930
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_MagicFire_2_0_Free_0807a92c:
    .word A_MagicFire_2_0_Free

PTR_PTR_A_MagicFire_2_0_Free_0807a930:
    .word PTR_A_MagicFire_2_0_Free_0807a92c


_ts A_MagicFire_2_0_Free
    push       {lr}
    bl         Attack_Free
    ldrb       r0,[r5,#0xd]
    tst        r0,r0
    beq        LAB_0807a946
    ldr        r7,[r5,#0x60]
    mov        r0,#0x0
    strb       r0,[r7,#0x5]
LAB_0807a946:
    pop        {pc}


_ts Attack_MagicFire_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x56
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807a97a
    str        r2,[r7,#0x60]
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    ldrh       r1,[r7,#0x2e]
    mov        r2,#0x10
    lsl        r2,r2,#0x10
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0807a97a:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_MagicFireC_CheckTargetPanel
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldrb       r1,[r5,#0x16]
    ldr        r7,PTR_PanelFlag_0807a99c
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_0807a998
    mov        r0,#0x1
    b          LAB_0807a99a
LAB_0807a998:
    mov        r0,#0x0
LAB_0807a99a:
    pop        {pc}

PTR_PanelFlag_0807a99c:
    .word PanelFlag_0807a9a0

PanelFlag_0807a9a0:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_ts A_MagicFireC_IsRareEvent
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x0
    bne        LAB_0807a9c4
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    cmp        r0,#0x2
    bne        LAB_0807a9c4
    mov        r0,#0x1
    b          LAB_0807a9c6
LAB_0807a9c4:
    mov        r0,#0x0
LAB_0807a9c6:
    pop        {pc}


_ts A_MagicFireC_CreateAttack
    push       {lr}
    ldr        r7,PTR_PanelFlag_ARRAY_0807a9e8
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    add        r7,r7,r1
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r2,[r5,#0x16]
    ldr        r4,[r7,#0x0]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
    pop        {pc}

PTR_PanelFlag_ARRAY_0807a9e8:
    .word PanelFlag_ARRAY_0807a9ec

PanelFlag_ARRAY_0807a9ec:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
