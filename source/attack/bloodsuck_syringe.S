#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BloodSuckSyringe
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_BloodSuckSyringe_0_Init_0807b254
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_BloodSuckSyringe_0_Init_0807b248:
    .word A_BloodSuckSyringe_0_Init
    .word A_BloodSuckSyringe_1_Main
    .word A_BloodSuckSyringe_2_Free

PTR_PTR_A_BloodSuckSyringe_0_Init_0807b254:
    .word PTR_A_BloodSuckSyringe_0_Init_0807b248


_ts A_BloodSuckSyringe_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xb8
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x1
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    mul        r0,r1
    str        r0,[r5,#0x44]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_BloodSuckSyringe_1_Main
    pop        {pc}


_nt A_BloodSuckSyringe_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_BloodSuckSyringe_1_0_0807b2bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_BloodSuckSyringe_1_0_0807b2bc:
    .word PTR_A_BloodSuckSyringe_1_0_0807b2c0

PTR_A_BloodSuckSyringe_1_0_0807b2c0:
    .word A_BloodSuckSyringe_1_0
    .word A_BloodSuckSyringe_1_1


_ts A_BloodSuckSyringe_1_0
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_DAT_0807b32c
    ldr        r1,[r7,r1]
    tst        r0,r1
    bne        LAB_0807b304
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    bne        LAB_0807b302
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807b302:
    pop        {pc}
LAB_0807b304:
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x2]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x0
    ldr        r4,FamilyDetail_0807b338
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}

PTR_DAT_0807b32c:
    .word DAT_0807b330

DAT_0807b330:
    .byte 0x00
    .byte 0x00
    .byte 0x10
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x08

    .align 2, 0


FamilyDetail_0807b338:
    .byte 0x19, 0x00, 0x01, 0x02


_ts A_BloodSuckSyringe_1_1
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    ldrh       r1,[r5,#0x1c]
    lsr        r1,r1,#0x2
    bcc        LAB_0807b34e
    mov        r1,#0x2
    orr        r0,r1
LAB_0807b34e:
    strb       r0,[r5,#0x0]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807b35c
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807b35c:
    pop        {pc}


_nt A_BloodSuckSyringe_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt Attack_BloodSuckSyringe_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6,r7}
    mov        r0,#0x5a
    bl         Attack_Alloc
    add        r4,r5,#0x0
    pop        {r0,r1,r2,r5,r6,r7}
    beq        LAB_0807b386
    strb       r1,[r4,#0x18]
    strb       r2,[r4,#0x19]
    strh       r6,[r4,#0x24]
    strb       r7,[r4,#0x16]
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_0807b386:
    pop        {pc}
