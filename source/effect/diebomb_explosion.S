#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_DieBombExplosion
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_DieBombExplosion_0_Init_0807dcf4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_DieBombExplosion_0_Init_0807dcf4:
    .word PTR_E_DieBombExplosion_0_Init_0807dcf8

PTR_E_DieBombExplosion_0_Init_0807dcf8:
    .word E_DieBombExplosion_0_Init
    .word E_DieBombExplosion_1_Main
    .word E_DieBombExplosion_2_Free


_ts E_DieBombExplosion_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807dd26
    bl         Battle_IsInputLocked
    bne        LAB_0807ddd2
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldr        r1,DAT_0807ddd8
    tst        r0,r1
    bne        LAB_0807ddd2
LAB_0807dd26:
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0807ddd2
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xce
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x76
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807dd90
    mov        r0,#0x15
    mov        r3,#0x60
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_DieBombExplosion_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_0807dd90:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_0807dddc
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    beq        LAB_0807ddc8
    ldrb       r0,[r5,#0x1a]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x19
    mov        r6,#0x0
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x1
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_0807ddc8:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_DieBombExplosion_1_Main
    pop        {pc}
LAB_0807ddd2:
    bl         Effect_Free
    pop        {pc}

DAT_0807ddd8:
    .word 0x10000

PTR_PanelFlag_ARRAY_0807dddc:
    .word PanelFlag_ARRAY_0807dde0

PanelFlag_ARRAY_0807dde0:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_ts E_DieBombExplosion_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807de0c
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x2
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0807de0c
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0807de0c:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807de48
    ldr        r0,[r5,#0x44]
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    ldrb       r0,[r5,#0x16]
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    bl         Effect_DieBombExplosion_Create
    tst        r7,r7
    beq        LAB_0807de38
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r1,r0
    strb       r1,[r7,#0x0]
LAB_0807de38:
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807de48
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0807de48:
    pop        {pc}


_nt E_DieBombExplosion_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0807de58
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
LAB_0807de58:
    bl         Effect_Free
    pop        {pc}


_nt Effect_DieBombExplosion_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x11
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807de78
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x16]
LAB_0807de78:
    pop        {pc}

    .align 2, 0

