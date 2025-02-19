#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BloodSuck
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_BloodSuck_0_Init_0806ee7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BloodSuck_0_Init_0806ee7c:
    .word PTR_R_BloodSuck_0_Init_0806ee80

PTR_R_BloodSuck_0_Init_0806ee80:
    .word R_BloodSuck_0_Init
    .word R_BloodSuck_1_Main
    .word R_BloodSuck_2_Free


_ts R_BloodSuck_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    ldrb       r1,[r5,#Actor_owner]
    tst        r1,r1
    beq        LAB_0806eeac
    mov        r0,#0x4
LAB_0806eeac:
    bl         SpritePtr_SetPaletteIndex
    ldrb       r3,[r5,#Actor_owner]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_owner]
    bl         SpritePtr_SetFlipType
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    ldr        r0,DAT_0806eefc
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_BloodSuck_1_Main
    pop        {pc}

    .align 2, 0


DAT_0806eefc:
    .word 0x1E


_ts R_BloodSuck_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_BloodSuck_1_0_0806ef14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BloodSuck_1_0_0806ef14:
    .word PTR_R_BloodSuck_1_0_0806ef18

PTR_R_BloodSuck_1_0_0806ef18:
    .word R_BloodSuck_1_0
    .word R_BloodSuck_1_1
    .word R_BloodSuck_1_2


_ts R_BloodSuck_1_0
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806ef36
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806ef36:
    pop        {pc}


_ts R_BloodSuck_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BloodSuck_1_1_0_0806ef48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BloodSuck_1_1_0_0806ef48:
    .word PTR_R_BloodSuck_1_1_0_0806ef4c

PTR_R_BloodSuck_1_1_0_0806ef4c:
    .word R_BloodSuck_1_1_0
    .word R_BloodSuck_1_1_1
    .word R_BloodSuck_1_1_2
    .word R_BloodSuck_1_1_3


_ts R_BloodSuck_1_1_0
    push       {lr}
    mov        r0,#0xf
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806ef84
    ldrb       r0,[r5,#Actor_owner]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_0806ef7e
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806ef7e:
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

DAT_0806ef84:
    .word 0xB80000


_ts R_BloodSuck_1_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_0806efd8
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Actor_cPos_x]
    add        r1,r1,r0
    mov        r2,#0x3
    mov        r4,#0x0
    ldrh       r6,[r5,#Actor_damage]
    ldrb       r7,[r5,#Actor_owner]
LAB_0806efa4:
    push       {r1,r2,r4,r6,r7}
    bl         Attack_BloodSuckSyringe_Create
    pop        {r1,r2,r4,r6,r7}
    sub        r2,#0x1
    bne        LAB_0806efa4
    mov        r0,#0x94
    bl         Sound_PlaySE
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}


_ts R_BloodSuck_1_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806efd8
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    bl         Field_AttackFree
    mov        r0,#0x50
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0xc
    strh       r0,[r5,#Actor_state_s2]
LAB_0806efd8:
    pop        {pc}


_nt R_BloodSuck_1_1_3
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806efec
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_0806efec:
    pop        {pc}


_nt R_BloodSuck_1_2
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_BloodSuck_1_2_0_0806effc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_BloodSuck_1_2_0_0806effc:
    .word PTR_R_BloodSuck_1_2_0_0806f000

PTR_R_BloodSuck_1_2_0_0806f000:
    .word R_BloodSuck_1_2_0


_ts R_BloodSuck_1_2_0
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s0]
    pop        {pc}


_ts R_BloodSuck_2_Free
    push       {lr}
    bl         Field_AttackFree
    LoadMain screenDim, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
    ldrb       r3,[r5,#Actor_owner]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         Actor_Free
    pop        {pc}


_ts Routine_BloodSuck_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x51
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_0806f054
    strb       r0,[r7,#0x16]
    str        r6,[r7,#0x24]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806f054:
    pop        {pc}

    .align 2, 0

