#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_BigStraight
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_BigStraight_0_0807748c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BigStraight_0_0807748c:
    .word PTR_A_BigStraight_0_08077490

PTR_A_BigStraight_0_08077490:
    .word A_BigStraight_0
    .word A_BigStraight_1
    .word A_BigStraight_2


_ts A_BigStraight_0
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x95
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Attack_cPos_x]
    add        r0,r0,r1
    strb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0807751c
    mov        r0,#0x5
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x18
    lsl        r1,r1,#0x10
    tst        r0,r1
    beq        LAB_08077512
    ldrb       r0,[r5,#Attack_element]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08077528
    ldrh       r6,[r5,#Attack_damage]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_08077512:
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_BigStraight_1
    pop        {pc}
LAB_0807751c:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    bl         Attack_Free
    pop        {pc}

    .align 2, 0


DAT_08077528:
    .word 0x10001


_ts A_BigStraight_1
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_BigStraight_1_0_08077540
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_BigStraight_1_0_08077540:
    .word PTR_A_BigStraight_1_0_08077544

PTR_A_BigStraight_1_0_08077544:
    .word A_BigStraight_1_0
    .word A_BigStraight_1_1


_ts A_BigStraight_1_0
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08077576
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    mov        r4,#0x0
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_BigStraight_Create
    tst        r7,r7
    beq        LAB_0807756e
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0807756e:
    mov        r0,#0xe
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
LAB_08077576:
    pop        {pc}


_ts A_BigStraight_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08077586
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08077586:
    pop        {pc}


_ts A_BigStraight_2
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_BigStraight_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x41
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_080775ae
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
LAB_080775ae:
    pop        {pc}
