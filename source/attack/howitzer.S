#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Howitzer
    push       {lr}
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    ldr        r7,PTR_PTR_A_Howitzer_0_Init_08071be4
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Howitzer_0_Init_08071bd8:
    .word A_Howitzer_0_Init
    .word A_Howitzer_1_Main
    .word A_Howitzer_2_Free

PTR_PTR_A_Howitzer_0_Init_08071be4:
    .word PTR_A_Howitzer_0_Init_08071bd8


_ts A_Howitzer_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x86
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x18
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    push       {r0,r1}
    add        r7,r5,#0x0
    add        r7,#0x28
    push       {r7}
    ldmia      r7!,{r2,r3}
    sub        r2,r0,r2
    sub        r0,r1,r3
    add        r1,r2,#0x0
    push       {r5}
    bl         VectorToAngle
    pop        {r5}
    strb       r0,[r5,#0x10]
    ldr        r1,DAT_08071c88
    push       {r1}
    bl         AngleToVector
    str        r0,[r5,#0x44]
    str        r1,[r5,#0x48]
    pop        {r4}
    pop        {r0}
    pop        {r1,r2}
    mov        r3,#0x0
    ldr        r6,DAT_08071c8c
    bl         Field_CalculateTrajectoryZ
    str        r0,[r5,#0x4c]
    strh       r1,[r5,#0x1c]
    tst        r1,r1
    beq        LAB_08071c6e
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Howitzer_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}
LAB_08071c6e:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    bl         A_Howitzer_2_Free
    pop        {pc}

DAT_08071c88:
    .word 0x2C000

DAT_08071c8c:
    .word 0xFFFFD800


_ts A_Howitzer_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    beq        LAB_08071c9e
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08071c9e:
    ldr        r7,PTR_PTR_A_Howitzer_1_0_08071cb0
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Howitzer_1_0_08071cb0:
    .word PTR_A_Howitzer_1_0_08071cb4

PTR_A_Howitzer_1_0_08071cb4:
    .word A_Howitzer_1_0


_ts A_Howitzer_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_08071ce6
    add        r7,r5,#0x0
    add        r7,#0x44
    ldmia      r7!,{r3,r4,r6}
    ldr        r0,DAT_08071d14
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    add        r7,r5,#0x0
    add        r7,#0x28
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    cmp        r2,#0x0
    ble        LAB_08071ce6
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    pop        {pc}
LAB_08071ce6:
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    bl         Battle_CellCoordsToSprite
    mov        r2,#0x0
    add        r7,r5,#0x0
    add        r7,#0x28
    stmia      r7!,{r0,r1,r2}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    pop        {pc}

DAT_08071d14:
    .word 0xFFFFD800


_ts A_Howitzer_2_Free
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_08071d4e
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    ldr        r1,DAT_08071d6c
    tst        r0,r1
    bne        LAB_08071d4e
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x1
    bic        r2,r3
    bl         Field_SetPanelProperty
    mov        r0,#0x7b
    bl         Sound_PlaySE
LAB_08071d4e:
    push       {r5}
    mov        r7,#0x28
    add        r7,r5,r7
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


DAT_08071d6c:
    .word 0x6060C30


_ts Attack_Howitzer_Create
    push       {lr}
    push       {r5,r6}
    mov        r0,#0x1b
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r5,r6}
    tst        r7,r7
    beq        LAB_08071d88
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08071d88:
    pop        {pc}

    .align 2, 0

