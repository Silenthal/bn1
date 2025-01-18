#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


BYTE_ARRAY_ARRAY_080723d0:
    .byte 0x01
    .byte 0x3C
    .byte 0x02
    .byte 0x3C
    .byte 0x03
    .byte 0x3C
    .byte 0x04
    .byte 0x0A
    .byte -1
    .byte -1

    .align 2, 0



_ts Attack_TimeBomb
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_TimeBomb_0_Init_080723f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_TimeBomb_0_Init_080723f0:
    .word PTR_A_TimeBomb_0_Init_080723f4

PTR_A_TimeBomb_0_Init_080723f4:
    .word A_TimeBomb_0_Init
    .word A_TimeBomb_1
    .word A_TimeBomb_2
    .word A_TimeBomb_3_Free


_ts A_TimeBomb_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x84
    bl         Sprite_InitSpritePtr
    ldr        r7,PTR_listInitialFrame_08072468
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x7
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0xa
    strh       r0,[r5,#0x22]
    strh       r0,[r5,#0x20]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x10
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_TimeBomb_1
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listInitialFrame_08072468:
    .word listInitialFrame

listInitialFrame:
    .byte 0x00
    .byte 0x01


_nt A_TimeBomb_1
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_TimeBomb_CheckDamage
    tst        r0,r0
    bne        LAB_080724ac
    ldrb       r0,[r5,#0x7]
    tst        r0,r0
    beq        LAB_080724a2
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080724a2
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
LAB_080724a2:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_TimeBomb_1_0_080724b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080724ac:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_TimeBomb_1_0_080724b8:
    .word PTR_A_TimeBomb_1_0_080724bc

PTR_A_TimeBomb_1_0_080724bc:
    .word A_TimeBomb_1_0
    .word A_TimeBomb_1_1


_ts A_TimeBomb_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080724e8
    bl         A_TimeBomb_SetNumber
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Enable
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x8a
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_080724e8:
    pop        {pc}


_nt A_TimeBomb_1_1
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08072526
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08072526
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08072514
    bl         A_TimeBomb_SetNumber
    cmp        r0,#0xff
    bne        LAB_08072516
    mov        r0,#0xc
    str        r0,[r5,#0x8]
LAB_08072514:
    pop        {pc}
LAB_08072516:
    mov        r0,#0x8a
    ldrb       r1,[r5,#0x14]
    cmp        r1,#0x4
    bne        LAB_08072520
    mov        r0,#0x8b
LAB_08072520:
    bl         Sound_PlaySE
    pop        {pc}
LAB_08072526:
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_nt A_TimeBomb_2
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0xb
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08072562
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08072562:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08072572
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_08072572
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_08072572:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_TimeBomb_3_Free
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0}
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    and        r0,r1
    eor        r0,r1
    lsr        r0,r0,#0x1
    pop        {r1}
    mov        r4,#0x1
    ldrh       r6,[r5,#0x24]
    mov        r2,#0x3
LAB_080725a0:
    push       {r0,r1,r2,r4,r6}
    bl         Effect_DieBombExplosion_Create
    pop        {r0,r1,r2,r4,r6}
    sub        r2,#0x1
    bne        LAB_080725a0
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_080725bc
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_080725bc
    mov        r0,#0x0
    str        r0,[r7,#0x0]
LAB_080725bc:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_TimeBomb_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08072616
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08072638
    mov        r0,#0x11
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08072638
    ldr        r1,PanelFlag_0807263c
    tst        r0,r1
    bne        LAB_08072616
    ldrb       r1,[r5,#0x7]
    tst        r1,r1
    bne        LAB_08072604
    bl         R_Actor_CheckPush
    tst        r0,r0
    beq        LAB_08072604
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
LAB_08072604:
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08072638
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0807262e
LAB_08072616:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x70
    bl         Sound_PlaySE
    mov        r0,#0x1
    pop        {pc}
LAB_0807262e:
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08072638:
    mov        r0,#0x0
    pop        {pc}

PanelFlag_0807263c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid | PF_Break


_ts A_TimeBomb_SetNumber
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_0807265c
    ldrb       r1,[r5,#0x6]
    lsl        r2,r1,#0x1
    add        r7,r7,r2
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_08072658
    strb       r0,[r5,#0x14]
    add        r1,#0x1
    strb       r1,[r5,#0x6]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x1c]
LAB_08072658:
    mov        pc,lr

    .align 2, 0


PTR_BYTE_ARRAY_ARRAY_0807265c:
    .word BYTE_ARRAY_ARRAY_080723d0


_ts Attack_TimeBomb_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x1e
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08072680
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    mov        r0,#0x0
    str        r0,[r7,#0x6c]
LAB_08072680:
    pop        {pc}


_nt Attack_TimeBomb_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x1e
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    beq        LAB_080726a2
    str        r3,[r7,#0x6c]
    tst        r3,r3
    beq        LAB_0807269a
    str        r7,[r3,#0x0]
LAB_0807269a:
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x16]
LAB_080726a2:
    pop        {pc}
