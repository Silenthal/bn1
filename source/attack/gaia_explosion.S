#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_GaiaExplosion
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_GaiaExplosion_0_Init_08079bd8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_GaiaExplosion_0_Init_08079bd8:
    .word PTR_A_GaiaExplosion_0_Init_08079bdc

PTR_A_GaiaExplosion_0_Init_08079bdc:
    .word A_GaiaExplosion_0_Init
    .word A_GaiaExplosion_1_Main
    .word A_GaiaExplosion_2_Free


_ts A_GaiaExplosion_0_Init
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08079c5a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x7
    add        r1,#0xff
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x1
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_GaiaExplosion_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08079c5a:
    bl         Attack_Free
    pop        {pc}


_ts A_GaiaExplosion_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfDeleted
    bl         A_GaiaExplosion_CheckIfHitSolid
    tst        r0,r0
    bne        LAB_08079caa
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079ca4
    ldrb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    pop        {r1,r2}
    beq        LAB_08079c9e
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    bl         Attack_GaiaExplosion_Create
LAB_08079c9e:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08079ca4:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08079caa:
    bl         UpdateSpriteFrameIndex
    pop        {pc}


_ts A_GaiaExplosion_2_Free
    push       {lr}
    bl         UpdateSpriteFrameIndex
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08079cd0
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
LAB_08079cd0:
    pop        {pc}


_nt A_GaiaExplosion_CheckIfHitSolid
    push       {lr}
    mov        r0,#0x2
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    mov        r1,#0x8
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_08079cf2
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08079cf2:
    mov        r0,#0x0
    pop        {pc}


_nt Attack_GaiaExplosion_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x50
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    beq        LAB_08079d10
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08079d10:
    pop        {pc}

    .align 2, 0

