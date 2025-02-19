#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_RemobitThunder
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_RemobitThunder_0_Init_0807f880
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_RemobitThunder_0_Init_0807f880:
    .word PTR_E_RemobitThunder_0_Init_0807f884

PTR_E_RemobitThunder_0_Init_0807f884:
    .word E_RemobitThunder_0_Init
    .word E_RemobitThunder_1_Main
    .word E_RemobitThunder_2_Free


_ts E_RemobitThunder_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x4b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x1
    mov        r1,#0x0
    ldrb       r2,[r5,#Effect_family_family]
    tst        r2,r2
    beq        LAB_0807f8ac
    mov        r0,#0x5
    mov        r1,#0xc
LAB_0807f8ac:
    mov        r2,#0x4
    strb       r2,[r5,#Effect_state_s0]
    strb       r1,[r5,#Effect_state_s1]
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    bl         R_Actor_UpdateSpritePos
    mov        r0,#0x0
    str        r0,[r5,#Effect_pos_curr_z]
    pop        {pc}


_ts E_RemobitThunder_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Effect_state_s1]
    ldr        r7,PTR_PTR_E_RemobitThunder_1_0_0807f8e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_RemobitThunder_1_0_0807f8e4:
    .word PTR_E_RemobitThunder_1_0_0807f8e8

PTR_E_RemobitThunder_1_0_0807f8e8:
    .word E_RemobitThunder_1_0
    .word E_RemobitThunder_1_1
    .word E_RemobitThunder_1_2
    .word E_RemobitThunder_1_3


_ts E_RemobitThunder_1_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#Effect_frameIndexCurr]
    mov        r0,#0x3
    strh       r0,[r5,#Effect_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s1]
    pop        {pc}


_ts E_RemobitThunder_1_1
    push       {lr}
    ldrh       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Effect_counterA]
    bne        LAB_0807f960
    push       {r5}
    ldrb       r0,[r5,#Effect_owner]
    lsl        r0,r0,#0x2
    ldr        r4,PTR_DAT_0807f964
    ldr        r4,[r4,r0]
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    ldrb       r2,[r5,#Effect_owner]
    ldrh       r3,[r5,#Effect_damage]
    mov        r6,#0x1
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldr        r1,DAT_0807f970
    tst        r0,r1
    bne        LAB_0807f958
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    bl         Field_GetPanelProperty
    mov        r1,#0x5
    mvn        r1,r1
    and        r2,r1
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    bl         FieldObject_SetFieldPanelFlag
    mov        r0,#0x7b
    bl         Sound_PlaySE
LAB_0807f958:
    mov        r0,#0x3
    strb       r0,[r5,#Effect_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Effect_state_s1]
LAB_0807f960:
    pop        {pc}

    .align 2, 0


PTR_DAT_0807f964:
    .word DAT_0807f968

DAT_0807f968:
    .byte 0x48
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x88
    .byte 0x00
    .byte 0x80

    .align 2, 0


DAT_0807f970:
    .byte 0x30
    .byte 0x0C
    .byte 0x00
    .byte 0x02


_ts E_RemobitThunder_1_2
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Effect_state_s2]
    pop        {pc}


_ts E_RemobitThunder_1_3
    push       {lr}
    ldr        r7,[r5,#Effect_obj_60]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    bne        LAB_0807f992
    mov        r0,#0x8
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Effect_state_s2]
LAB_0807f992:
    pop        {pc}


_ts E_RemobitThunder_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_RemobitThunder_Create
    push       {lr}
    push       {r0,r1,r5,r6}
    mov        r0,#0x2a
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    beq        LAB_0807f9b8
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Effect_owner]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_0807f9b8:
    add        r0,r7,#0x0
    pop        {pc}
