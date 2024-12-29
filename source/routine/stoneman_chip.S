#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_StoneMan_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_StoneManC_0_Init_08061c84
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_StoneManC_0_Init_08061c84:
    .word PTR_R_StoneManC_0_Init_08061c88

PTR_R_StoneManC_0_Init_08061c88:
    .word R_StoneManC_0_Init
    .word R_StoneManC_1_Main
    .word R_StoneManC_2_Free


_ts R_StoneManC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3a
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    LoadMain battle, r7, r7
    add        r7,#0x40
    ldrb       r0,[r5,#0x16]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_08061cde
    mov        r0,#0x0
LAB_08061cde:
    bl         SpritePtr_SetFlipType
    mov        r0,#0x60
    add        r0,r0,r5
    mov        r1,#0x18
    bl         memset0_32
    mov        r0,#0x4
    strh       r0,[r5,#0x1e]
    pop        {pc}


_nt R_StoneManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_StoneManC_1_0_08061d00
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_StoneManC_1_0_08061d00:
    .word PTR_R_StoneManC_1_0_08061d04

PTR_R_StoneManC_1_0_08061d04:
    .word R_StoneManC_1_0
    .word R_StoneManC_1_1_Attack


_ts R_StoneManC_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_StoneManC_1_0_0_08061d24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_StoneManC_1_0_0_08061d1c:
    .word R_StoneManC_1_0_0
    .word R_StoneManC_1_0_1

PTR_PTR_R_StoneManC_1_0_0_08061d24:
    .word PTR_R_StoneManC_1_0_0_08061d1c


_ts R_StoneManC_1_0_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08061d40
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08061d4c
LAB_08061d40:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    bl         R_StoneManC_1_0_1
LAB_08061d4c:
    pop        {pc}


_nt R_StoneManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061d60
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061d60:
    pop        {pc}


_nt R_StoneManC_1_1_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_StoneManC_1_1_0_RaiseArms_08061d80
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_StoneManC_1_1_0_RaiseArms_08061d70:
    .word R_StoneManC_1_1_0_RaiseArms
    .word R_StoneManC_1_1_1_SlamGround
    .word R_StoneManC_1_1_2_ShakeScreen
    .word R_StoneManC_1_1_3_Stones

PTR_PTR_R_StoneManC_1_1_0_RaiseArms_08061d80:
    .word PTR_R_StoneManC_1_1_0_RaiseArms_08061d70


_ts R_StoneManC_1_1_0_RaiseArms
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_StoneManC_1_1_1_SlamGround
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061daa
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_08061daa:
    pop        {pc}


_ts R_StoneManC_1_1_2_ShakeScreen
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061dd0
    mov        r0,#0x2
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
    mov        r0,#0x7e
    bl         Sound_PlaySongImmediate
LAB_08061dd0:
    pop        {pc}


_nt R_StoneManC_1_1_3_Stones
    push       {lr}
    sub        sp,#0x20
    mov        r6,sp
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061e3e
    push       {r6}
    ldrb       r2,[r5,#0x16]
    lsl        r2,r2,#0x3
    ldr        r7,PTR_listStoneManChipTargetFlags_08061e44
    add        r7,r7,r2
    add        r0,r6,#0x0
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    ldrb       r3,[r5,#0x16]
    bl         Field_SearchWithOwner
    pop        {r6}
    tst        r1,r1
    beq        LAB_08061e36
    push       {r1,r6}
    add        r0,r6,#0x0
    mov        r2,#0x14
    bl         ArrayShuffle
    pop        {r1,r6}
    ldrb       r2,[r5,#0x4]
    add        r2,#0x3
    cmp        r1,r2
    ble        LAB_08061e12
    add        r1,r2,#0x0
LAB_08061e12:
    push       {r1,r6}
    ldrb       r0,[r6,#0x0]
    bl         Field_IndexToCellXY
    sub        r7,r1,#0x1
    lsl        r7,r7,#0x3
    add        r7,r7,r0
    add        r7,#0x60
    ldrb       r2,[r5,r7]
    add        r2,#0x1
    strb       r2,[r5,r7]
    mov        r4,#0x1
    bl         Attack_Stone_Create
    pop        {r1,r6}
    add        r6,#0x1
    sub        r1,#0x1
    bne        LAB_08061e12
LAB_08061e36:
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08061e3e:
    add        sp,#0x20
    pop        {pc}

    .align 2, 0


PTR_listStoneManChipTargetFlags_08061e44:
    .word listStoneManChipTargetFlags

listStoneManChipTargetFlags:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Solid
    .word PF_Walkable
    .word PF_EnemyTerritory | PF_Solid


_ts R_StoneManC_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    bne        LAB_08061e6c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    bl         R_StoneManC_CheckStoneHit
LAB_08061e6c:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08061e7e
    bl         Actor_Free
    ldr        r7,PTR_gScreenDim_08061e80
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_08061e7e:
    pop        {pc}

PTR_gScreenDim_08061e80:
    .word gScreenDim


_ts Routine_StoneMan_Chip_Create
    push       {lr}
    push       {r1,r5}
    mov        r0,#0x1e
    bl         Actor_Alloc
    pop        {r1,r6}
    tst        r5,r5
    beq        LAB_08061e9a
    mov        r0,#0xf
    strb       r0,[r5,#0x0]
    strb       r1,[r5,#0x16]
LAB_08061e9a:
    pop        {pc}


_ts R_StoneManC_CheckStoneHit
    push       {lr}
    mov        r1,#0x1
LAB_08061ea0:
    mov        r0,#0x1
LAB_08061ea2:
    sub        r7,r1,#0x1
    lsl        r7,r7,#0x3
    add        r7,r7,r0
    add        r7,#0x60
    ldrb       r3,[r5,r7]
    tst        r3,r3
    beq        LAB_08061edc
    push       {r0,r1}
    bl         Field_GetPanelFlags
    ldrb       r2,[r5,#0x16]
    ldr        r4,PTR_listStoneManStoneTargetFlag_08061eec
    lsl        r6,r2,#0x2
    ldr        r4,[r4,r6]
    tst        r0,r4
    pop        {r0,r1}
    beq        LAB_08061edc
    push       {r0,r1,r5}
    ldrb       r2,[r5,#0x16]
    mov        r4,#0x64
    mul        r3,r4
    ldr        r4,PTR_listStoneManStoneAttackFlag_08061ef8
    lsl        r6,r2,#0x2
    ldr        r4,[r4,r6]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r5}
LAB_08061edc:
    add        r0,#0x1
    cmp        r0,#0x6
    ble        LAB_08061ea2
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_08061ea0
    pop        {pc}

    .align 2, 0


PTR_listStoneManStoneTargetFlag_08061eec:
    .word listStoneManStoneTargetFlag

listStoneManStoneTargetFlag:
    .word PF_ActorEnemy
    .word PF_ActorPlayer

PTR_listStoneManStoneAttackFlag_08061ef8:
    .word listStoneManStoneAttackFlag

listStoneManStoneAttackFlag:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
