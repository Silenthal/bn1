#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Shockwave
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Shockwave_0_Init_0807081c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Shockwave_0_Init_08070810:
    .word A_Shockwave_0_Init
    .word A_Shockwave_1_Main
    .word A_Shockwave_2_Free

PTR_PTR_A_Shockwave_0_Init_0807081c:
    .word PTR_A_Shockwave_0_Init_08070810


_ts A_Shockwave_0_Init
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08070906
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_08070906
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,PTR_Struct_807091C_ARRAY_0807090c
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    tst        r0,r0
    beq        LAB_08070858
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08070906
LAB_08070858:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,[r5,#0x60]
    ldrb       r1,[r7,#0x0]
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x7a
    bl         Sound_PlaySE
    ldr        r7,[r5,#0x60]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r5,#0x1c]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_080708ca
    mov        r0,#0x3
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Shockwave_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_080708ca:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r7,PTR_PanelFlag_08070910
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_080708fc
    ldrb       r0,[r5,#0x1a]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x1
    mov        r6,#0x0
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x1
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_080708fc:
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Shockwave_1_Main
    pop        {pc}
LAB_08070906:
    bl         Attack_Free
    pop        {pc}

PTR_Struct_807091C_ARRAY_0807090c:
    .word Struct_807091C_ARRAY_0807091c

PTR_PanelFlag_08070910:
    .word PanelFlag_08070914

PanelFlag_08070914:
    .word PF_ActorEnemy
    .word PF_ActorPlayer

Struct_807091C_ARRAY_0807091c:
    .byte 0x73, 0x00, 0x0F, 0x00
    .byte 0x73, 0x00, 0x17, 0x00
    .byte 0x73, 0x00, 0x0F, 0x00
    .byte 0x73, 0x00, 0x0A, 0x00
    .byte 0x73, 0x00, 0x0F, 0x00
    .byte 0x73, 0x00, 0x0A, 0x00
    .byte 0x73, 0x00, 0x06, 0x00


_ts A_Shockwave_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807094a
    ldr        r0,[r5,#0x64]
    bl         FieldObject_DisableIfDeleted
    bl         A_Shockwave_CheckTargetDamage
LAB_0807094a:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Shockwave_1_0_0807095c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Shockwave_1_0_0807095c:
    .word PTR_A_Shockwave_1_0_08070960

PTR_A_Shockwave_1_0_08070960:
    .word A_Shockwave_1_0
    .word A_Shockwave_1_1
    .word A_Shockwave_1_2


_ts A_Shockwave_1_0
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807098a
    ldr        r0,[r5,#0x64]
    ldr        r0,[r0,#0x10]
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r3,#0x1
    tst        r0,r3
    beq        LAB_08070998
LAB_0807098a:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08070996
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08070996:
    pop        {pc}
LAB_08070998:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_nt A_Shockwave_1_1
    push       {lr}
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    ldr        r0,[r5,#0x44]
    add        r1,r1,r0
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    bl         Attack_Shockwave_Create
    tst        r7,r7
    beq        LAB_080709be
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
LAB_080709be:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts A_Shockwave_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080709d4
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_080709d4:
    pop        {pc}


_nt A_Shockwave_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_080709e4
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
LAB_080709e4:
    bl         Attack_Free
    pop        {pc}


_nt A_Shockwave_CheckTargetDamage
    push       {lr}
    ldr        r1,[r5,#0x64]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08070a12
    mov        r0,#0x2
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08070a12
    mov        r0,#0x1
    mov        r3,#0x0
    bl         Field_CreateStrikeEffect
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x1
    pop        {pc}
LAB_08070a12:
    mov        r0,#0x0
    pop        {pc}


_nt Attack_Shockwave_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0xe
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    beq        LAB_08070a30
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08070a30:
    pop        {pc}

    .align 2, 0

