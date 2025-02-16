#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Shuriken_Chip
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_ShurikenC_0_Init_0807a63c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ShurikenC_0_Init_0807a63c:
    .word PTR_A_ShurikenC_0_Init_0807a640

PTR_A_ShurikenC_0_Init_0807a640:
    .word A_ShurikenC_0_Init
    .word A_ShurikenC_1_Main
    .word A_ShurikenC_2_Free


_ts A_ShurikenC_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xb3
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x7
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x1
    ldrb       r1,[r5,#Attack_owner]
    tst        r1,r1
    beq        LAB_0807a67e
    mov        r0,#0x0
LAB_0807a67e:
    bl         SpritePtr_SetFlipType
    bl         A_ShurikenC_1_Main
    pop        {pc}


_ts A_ShurikenC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_ShurikenC_1_0_0807a698
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ShurikenC_1_0_0807a698:
    .word PTR_A_ShurikenC_1_0_0807a69c

PTR_A_ShurikenC_1_0_0807a69c:
    .word A_ShurikenC_1_0
    .word A_ShurikenC_1_1
    .word A_ShurikenC_1_2
    .word A_ShurikenC_1_3


_ts A_ShurikenC_1_0
    push       {lr}
    mov        r0,#0xf
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    pop        {pc}


_ts A_ShurikenC_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807a6f2
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x7b
    bl         Sound_PlaySE
    ldr        r7,PTR_listShurikenAttackFlag_0807a6f4
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    add        r7,r7,r1
    push       {r5}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldrb       r2,[r5,#Attack_owner]
    ldrh       r3,[r5,#Attack_damage]
    ldr        r4,[r7,#0x0]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r5}
LAB_0807a6f2:
    pop        {pc}

PTR_listShurikenAttackFlag_0807a6f4:
    .word listShurikenAttackFlag

listShurikenAttackFlag:
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy


_ts A_ShurikenC_1_2
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807a712
    mov        r0,#0x3c
    str        r0,[r5,#Attack_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Attack_state_s1]
LAB_0807a712:
    pop        {pc}


_ts A_ShurikenC_1_3
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807a724
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_0807a730
LAB_0807a724:
    mov        r2,#0x5
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807a72e
    mov        r2,#0x7
LAB_0807a72e:
    strb       r2,[r5,#Attack_header_entityFlags]
LAB_0807a730:
    pop        {pc}


_nt A_ShurikenC_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_ShurikenC_2_0_0807a744
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_ShurikenC_2_0_0807a740:
    .word A_ShurikenC_2_0

PTR_PTR_A_ShurikenC_2_0_0807a744:
    .word PTR_A_ShurikenC_2_0_0807a740


_ts A_ShurikenC_2_0
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_Shuriken_Chip_Create
    push       {lr}
    push       {r0,r1,r5,r6}
    mov        r0,#0x55
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    tst        r7,r7
    beq        LAB_0807a77e
    ldrb       r3,[r5,#Attack_owner]
    strb       r3,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    ldrh       r1,[r7,#0x2e]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0807a77e:
    add        r0,r7,#0x0
    pop        {pc}

    .align 2, 0

