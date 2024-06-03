#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Sword
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Sword_0_Init_0806fa98
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Sword_0_Init_0806fa98:
    .word PTR_A_Sword_0_Init_0806fa9c

PTR_A_Sword_0_Init_0806fa9c:
    .word A_Sword_0_Init
    .word A_Sword_1_Main
    .word A_Sword_2_Free


_ts A_Sword_0_Init
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x6c
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoZClip
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    mov        r0,#0x0
    str        r0,[r5,#0x40]
    str        r0,[r5,#0x1c]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r1,[r5,#0x19]
    push       {r0}
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    add        r1,r0,#0x0
    pop        {r0}
    add        r0,r0,r1
    strb       r0,[r5,#0x18]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    pop        {pc}

    .align 2, 0



_ts A_Sword_1_Main
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_0806fb2e
    bl         SpritePtr_ProcessFrameDelay
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x1
    bne        LAB_0806fb22
    ldr        r0,[r5,#0x44]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x28
    lsl        r4,r4,#0x10
    mul        r4,r0
    add        r1,r1,r4
    mov        r4,#0x8
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    ldrb       r4,[r5,#0x4]
    bl         Effect_SwordSlash_Create
LAB_0806fb22:
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x1
    bne        LAB_0806fb2c
    bl         A_Sword_CreateAttackCells
LAB_0806fb2c:
    pop        {pc}
LAB_0806fb2e:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts A_Sword_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts A_Sword_CreateAttackCells
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    ldrb       r3,[r5,#0x4]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PTR_listSwordRange1x1_0806fb84
    ldr        r7,[r7,r3]
LAB_0806fb4a:
    mov        r3,#0x0
    ldrsb      r2,[r7,r3]
    cmp        r2,#0x7f
    beq        LAB_0806fb82
    ldr        r4,[r5,#0x44]
    mul        r2,r4
    push       {r0,r1}
    add        r0,r0,r2
    add        r7,#0x1
    ldrsb      r2,[r7,r3]
    add        r1,r1,r2
    add        r7,#0x1
    push       {r7}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x10
    lsl        r3,r3,#0x10
    ldrb       r0,[r5,#0x1a]
    ldr        r4,FamilyDetail_0806fbb0
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Attack_SharpStrike_Create
    pop        {r7}
    pop        {r0,r1}
    b          LAB_0806fb4a
LAB_0806fb82:
    pop        {pc}

PTR_PTR_listSwordRange1x1_0806fb84:
    .word PTR_listSwordRange1x1_0806fb88

PTR_listSwordRange1x1_0806fb88:
    .word listSwordRange1x1
    .word listSwordRange1x3
    .word listSwordRange2x1
    .word listSwordRange1x3
    .word listSwordRange1x3
    .word listSwordRange1x3
    .word listSwordRange3x1
    .word listSwordRange3x1
    .word listSwordRange3x1
    .word listSwordRange1x1

FamilyDetail_0806fbb0:
    .byte 0x19, 0x00, 0x01, 0x02

listSwordRange1x1:
    cell_pos 0, 0
    .byte 0x7F

listSwordRange2x1:
    cell_pos 0, 0
    cell_pos 1, 0
    .byte 0x7F

listSwordRange1x3:
    cell_pos 0, -1
    cell_pos 0, 0
    cell_pos 0, 1
    .byte 0x7F

listSwordRange3x1:
    cell_pos 0, 0
    cell_pos 1, 0
    cell_pos 2, 0
    .byte 0x7F

    .align 2, 0


_ts Attack_Sword_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x3
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    beq        LAB_0806fbe4
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x1a]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0806fbe4:
    pop        {pc}

    .align 2, 0

