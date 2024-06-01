#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Struct_7BCDC_ARRAY_0807bcdc:
    .byte 0x0A, 0x04, 0x75, 0x00
    .byte 0x10, 0x01, 0x76, 0x00
    .byte 0x19, 0x01, 0x77, 0x00
    .byte 0x10, 0x01, 0x76, 0x00
    .byte 0x10, 0x01, 0x7B, 0x00
    .byte 0x10, 0x01, 0x7D, 0x00
    .byte 0x0A, 0x04, 0x75, 0x00
    .byte 0x10, 0x01, 0x76, 0x00
    .byte 0x10, 0x01, 0x7B, 0x00

PTR_Struct_Dat7BD24_ARRAY_0807bd00:
    .word Struct_Dat7BD24_ARRAY_0807bd24
    .word Struct_Dat7BD24_ARRAY_0807bd28
    .word Struct_Dat7BD24_ARRAY_0807bd30
    .word Struct_Dat7BD24_ARRAY_0807bd38
    .word Struct_Dat7BD24_ARRAY_0807bd40
    .word Struct_Dat7BD24_ARRAY_0807bd48
    .word Struct_Dat7BD24_ARRAY_0807bd50
    .word Struct_Dat7BD24_ARRAY_0807bd54
    .word Struct_Dat7BD24_ARRAY_0807bd5c

Struct_Dat7BD24_ARRAY_0807bd24:
    .byte 0x04, 0xC8, 0x80, 0x00

Struct_Dat7BD24_ARRAY_0807bd28:
    .byte 0x01, 0x78, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd30:
    .byte 0x01, 0xAC, 0x01, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd38:
    .byte 0x01, 0x78, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd40:
    .byte 0x01, 0x00, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd48:
    .byte 0x01, 0x00, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd50:
    .byte 0x04, 0xBE, 0x80, 0x00

Struct_Dat7BD24_ARRAY_0807bd54:
    .byte 0x01, 0x1E, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00

Struct_Dat7BD24_ARRAY_0807bd5c:
    .byte 0x01, 0x1E, 0x00, 0x00
    .byte 0x02, 0x00, 0x83, 0x00


_ts Effect_Tower
    push       {lr}
    ldr        r7,PTR_PTR_E_Tower_0_Init_0807bed0
    ldrb       r0,[r5,#0x8]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_E_Tower_0_Init_0807bd74:
    .word E_Tower_0_Init
    .word E_Tower_1_Main
    .word E_Tower_2_Free


_ts E_Tower_0_Init
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    beq        LAB_0807bd90
    bl         Effect_Free
    pop        {pc}
LAB_0807bd90:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x17
    ldr        r7,PTR_Struct_7BCDC_ARRAY_0807be10
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r0,#0x1
    ldrh       r1,[r7,#0x2]
    push       {r7}
    bl         Sprite_InitSpritePtr
    pop        {r7}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    lsr        r0,r0,#0x17
    ldr        r7,PTR_PTR_Struct_Dat7BD24_ARRAY_0807be14
    ldr        r7,[r7,r0]
    str        r7,[r5,#0x64]
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    push       {r7}
    bl         SpritePtr_SetFlipType
    pop        {r7}
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r7,#0x0]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0807be04
    mov        r0,#0x4
    mov        r1,#0x68
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_Tower_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_0807be04:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_Tower_1_Main
    pop        {pc}

    .align 2, 0


PTR_Struct_7BCDC_ARRAY_0807be10:
    .word Struct_7BCDC_ARRAY_0807bcdc

PTR_PTR_Struct_Dat7BD24_ARRAY_0807be14:
    .word PTR_Struct_Dat7BD24_ARRAY_0807bd00


_ts E_Tower_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0807be26
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfHitFlagSet
LAB_0807be26:
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_0807be80
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    bmi        LAB_0807be3a
    strh       r0,[r5,#0x1c]
    bne        LAB_0807be60
    b          LAB_0807be44
LAB_0807be3a:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807be60
LAB_0807be44:
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x2]
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_0807be80
    add        r7,#0x4
    str        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x1]
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r7,#0x0]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0807be60:
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0807be9e
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0807be8e
    mov        r0,#0x2
    ldr        r1,[r5,#0x68]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0807be8e
LAB_0807be80:
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
LAB_0807be8e:
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807be9e
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetHitFlag
LAB_0807be9e:
    pop        {pc}


_ts E_Tower_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x19
    bcs        LAB_0807beae
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
LAB_0807beae:
    bl         Effect_Free
    pop        {pc}


_ts Effect_Tower_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x5
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    beq        LAB_0807becc
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0807becc:
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Tower_0_Init_0807bed0:
    .word PTR_E_Tower_0_Init_0807bd74
