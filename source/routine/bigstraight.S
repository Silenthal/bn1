#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BigStraight
    push       {lr}
    ldr        r7,PTR_PTR_R_BigStraight_0_Init_08067f64
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigStraight_0_Init_08067f64:
    .word PTR_R_BigStraight_0_Init_08067f68

PTR_R_BigStraight_0_Init_08067f68:
    .word R_BigStraight_0_Init
    .word R_BigStraight_1_Main
    .word R_BigStraight_2_Free


_ts R_BigStraight_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_08067f90
    mov        r0,#0x4
LAB_08067f90:
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    mov        r3,#0x28
    add        r7,r7,r3
    ldmia      r7!,{r0,r1,r2}
    add        r3,r3,r5
    stmia      r3!,{r0,r1,r2}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_BigStraight_1_Main
    pop        {pc}


_ts R_BigStraight_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_R_BigStraight_1_0_StartAnim_08067ff4
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BigStraight_1_0_StartAnim_08067ff4:
    .word PTR_R_BigStraight_1_0_StartAnim_08067ff8

PTR_R_BigStraight_1_0_StartAnim_08067ff8:
    .word R_BigStraight_1_0_StartAnim
    .word R_BigStraight_1_1_Attack
    .word R_BigStraight_1_2_Next


_ts R_BigStraight_1_0_StartAnim
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068038
    mov        r0,#0x26
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    sub        r2,r2,r0
    ldr        r3,[r5,#0x30]
    sub        r3,r3,r0
    ldr        r4,DAT_0806803c
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    tst        r7,r7
    beq        LAB_08068034
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08068034:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08068038:
    pop        {pc}

    .align 2, 0


DAT_0806803c:
    .word 0x950000


_ts R_BigStraight_1_1_Attack
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080680a4
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x0
    ldrh       r6,[r5,#0x24]
    push       {r0,r1}
    bl         Attack_BigStraight_Create
    tst        r7,r7
    pop        {r0,r1}
    beq        LAB_0806809a
    ldrb       r2,[r7,#0x0]
    mov        r3,#0x4
    orr        r2,r3
    strb       r2,[r7,#0x0]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r1,#0x18
    lsl        r1,r1,#0x10
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_0806809a
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#0x1a]
    ldr        r4,DAT_080680a8
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_0806809a:
    mov        r0,#0xbd
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_080680a4:
    pop        {pc}

    .align 2, 0


DAT_080680a8:
    .word 0x10001


_ts R_BigStraight_1_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080680bc
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_080680bc:
    pop        {pc}


_nt R_BigStraight_2_Free
    push       {lr}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         Actor_Free
    pop        {pc}


_nt Routine_BigStraight_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x31
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_080680f8
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_080680f8:
    pop        {pc}

    .align 2, 0

