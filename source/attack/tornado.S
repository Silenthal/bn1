#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Tornado
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Tornado_0_Init_080775cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Tornado_0_Init_080775c0:
    .word A_Tornado_0_Init
    .word A_Tornado_1_Main
    .word A_Tornado_2_Free

PTR_PTR_A_Tornado_0_Init_080775cc:
    .word PTR_A_Tornado_0_Init_080775c0


_ts A_Tornado_0_Init
    push       {lr}
    mov        r0,#0xc9
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xac
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x28
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    FieldObject_Create PFI_Self_Grounded, Attack_param_64, offset_reg=3
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_Tornado_1_Main
    pop        {pc}


_ts A_Tornado_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    beq        LAB_08077636
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_08077636:
    bl         A_Tornado_CheckDamage
    tst        r0,r0
    bne        LAB_08077648
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_Tornado_1_0_08077650
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08077648:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Tornado_1_0_08077650:
    .word PTR_A_Tornado_1_0_08077654

PTR_A_Tornado_1_0_08077654:
    .word A_Tornado_1_0
    .word A_Tornado_1_1


_ts A_Tornado_1_0
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08077678
    ldrb       r0,[r5,#Attack_family_b1]
    tst        r0,r0
    beq        LAB_08077670
    bl         A_Tornado_CreateTargetingTornado
LAB_08077670:
    mov        r0,#0x14
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
LAB_08077678:
    pop        {pc}


_nt A_Tornado_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08077678
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_Tornado_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_Tornado_CheckDamage
    push       {lr}
    FieldObject_GetDamage PFI_Target_Solid, Attack_param_64
    tst        r0,r0
    beq        LAB_080776d8
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x19
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    ldr        r0,[r5,#Attack_param_64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    pop        {pc}
LAB_080776d8:
    mov        r0,#0x0
    pop        {pc}


_ts A_Tornado_CreateTargetingTornado
    push       {lr}
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r3,[r7,#0x18]
    ldrb       r1,[r5,#Attack_cPos_x]
    mov        r0,#0x1
    sub        r3,r3,r1
    bpl        LAB_080776f2
    neg        r3,r3
    neg        r0,r0
LAB_080776f2:
    ldrb       r4,[r7,#0x19]
    ldrb       r2,[r5,#Attack_cPos_y]
    mov        r6,#0x1
    sub        r4,r4,r2
    bpl        LAB_08077700
    neg        r4,r4
    neg        r6,r6
LAB_08077700:
    cmp        r3,r4
    bge        LAB_08077708
    add        r2,r2,r6
    b          LAB_0807770a
LAB_08077708:
    add        r1,r1,r0
LAB_0807770a:
    mov        r3,#0x0
    ldrb       r4,[r5,#Attack_family_family]
    ldrb       r0,[r5,#Attack_family_b1]
    sub        r0,#0x1
    lsl        r0,r0,#0x8
    orr        r4,r0
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_Tornado_Create
    pop        {pc}


_nt Attack_Tornado_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x42
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807773a
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_0807773a:
    pop        {pc}
