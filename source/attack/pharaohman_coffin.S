#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_PharaohManCoffin
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_PharaohManCoffin_0_Init_0807a3cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohManCoffin_0_Init_0807a3cc:
    .word PTR_A_PharaohManCoffin_0_Init_0807a3d0

PTR_A_PharaohManCoffin_0_Init_0807a3d0:
    .word A_PharaohManCoffin_0_Init
    .word A_PharaohManCoffin_1_Main
    .word A_PharaohManCoffin_2_Free


_ts A_PharaohManCoffin_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xb0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0807a412
    mov        r0,#0x0
LAB_0807a412:
    bl         SpritePtr_SetFlipType
    bl         A_PharaohManCoffin_1_Main
    pop        {pc}


_ts A_PharaohManCoffin_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_PharaohManCoffin_1_0_0807a42c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohManCoffin_1_0_0807a42c:
    .word PTR_A_PharaohManCoffin_1_0_0807a430

PTR_A_PharaohManCoffin_1_0_0807a430:
    .word A_PharaohManCoffin_1_0


_ts A_PharaohManCoffin_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_PharaohManCoffin_1_0_0_0807a444
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohManCoffin_1_0_0_0807a444:
    .word PTR_A_PharaohManCoffin_1_0_0_0807a448

PTR_A_PharaohManCoffin_1_0_0_0807a448:
    .word A_PharaohManCoffin_1_0_0
    .word A_PharaohManCoffin_1_0_1
    .word A_PharaohManCoffin_1_0_2
    .word A_PharaohManCoffin_1_0_3
    .word A_PharaohManCoffin_1_0_4
    .word A_PharaohManCoffin_1_0_5
    .word A_PharaohManCoffin_1_0_6
    .word A_PharaohManCoffin_1_0_7


_ts A_PharaohManCoffin_1_0_0
    push       {lr}
    mov        r0,#0xa0
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_PharaohManCoffin_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x32]
    cmp        r0,#0x28
    bge        LAB_0807a486
    mov        r1,#0x1
    strb       r1,[r5,#0x17]
LAB_0807a486:
    sub        r0,#0x8
    strh       r0,[r5,#0x32]
    bgt        LAB_0807a4a6
    mov        r0,#0x1
    mov        r1,#0x1e
    push       {r5}
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x7e
    bl         Sound_PlaySE
LAB_0807a4a6:
    pop        {pc}


_ts A_PharaohManCoffin_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a4be
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0807a4be:
    pop        {pc}


_ts A_PharaohManCoffin_1_0_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a4ce
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0807a4ce:
    pop        {pc}


_ts A_PharaohManCoffin_1_0_4
    push       {lr}
    bl         A_PharaohManCoffin_Laser
    pop        {pc}


_ts A_PharaohManCoffin_Laser
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_A_PharaohManCoffin_Laser_0_0807a4e8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohManCoffin_Laser_0_0807a4e8:
    .word PTR_A_PharaohManCoffin_Laser_0_0807a4ec

PTR_A_PharaohManCoffin_Laser_0_0807a4ec:
    .word A_PharaohManCoffin_Laser_0
    .word A_PharaohManCoffin_Laser_1


_ts A_PharaohManCoffin_Laser_0
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0xc8
    bl         Effect_PharaohManLaser_Create
    bl         A_PharaohManCoffin_Laser_CreateAttackArea
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt A_PharaohManCoffin_Laser_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x4b
    bne        LAB_0807a51c
    mov        r0,#0x97
    bl         Sound_PlaySE
LAB_0807a51c:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a528
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
LAB_0807a528:
    pop        {pc}


_nt A_PharaohManCoffin_1_0_5
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_PharaohManCoffin_1_0_6
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807a54e
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1c
    strb       r0,[r5,#0xa]
LAB_0807a54e:
    pop        {pc}


_ts A_PharaohManCoffin_1_0_7
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807a564
    mov        r2,#0x5
    strb       r2,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    b          LAB_0807a570
LAB_0807a564:
    mov        r2,#0x7
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807a56e
    mov        r2,#0x5
LAB_0807a56e:
    strb       r2,[r5,#0x0]
LAB_0807a570:
    pop        {pc}


_nt A_PharaohManCoffin_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_PharaohManCoffin_2_0_0807a584
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_PharaohManCoffin_2_0_0807a580:
    .word A_PharaohManCoffin_2_0

PTR_PTR_A_PharaohManCoffin_2_0_0807a584:
    .word PTR_A_PharaohManCoffin_2_0_0807a580


_ts A_PharaohManCoffin_2_0
    push       {lr}
    ldr        r7,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    bl         Attack_Free
    pop        {pc}


_nt Attack_PharaohManCoffin_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x54
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807a5c8
    str        r2,[r7,#0x64]
    str        r7,[r2,#0x0]
    strh       r6,[r7,#0x24]
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
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
LAB_0807a5c8:
    add        r0,r7,#0x0
    pop        {pc}


_ts A_PharaohManCoffin_Laser_CreateAttackArea
    push       {r5,lr}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
    ldrb       r1,[r5,#0x19]
LAB_0807a5da:
    push       {r0,r1,r2}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0807a612
    push       {r0,r1,r2}
    bl         FieldObject_GetPanelFlags
    ldr        r7,PTR_PanelFlag_ARRAY_0807a614
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x3
    add        r7,r7,r1
    ldr        r1,[r7,#0x0]
    tst        r0,r1
    pop        {r0,r1,r2}
    beq        LAB_0807a60e
    push       {r0,r1,r2,r5}
    ldrb       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x24]
    ldr        r4,[r7,#0x4]
    mov        r6,#0x0
    mov        r7,#0x1
    bl         Attack_QuickAttack_Create
    pop        {r0,r1,r2,r5}
LAB_0807a60e:
    add        r0,r0,r2
    b          LAB_0807a5da
LAB_0807a612:
    pop        {r5,pc}

PTR_PanelFlag_ARRAY_0807a614:
    .word PanelFlag_ARRAY_0807a618

PanelFlag_ARRAY_0807a618:
    .word PF_ActorEnemy
    .word PF_Ground | PF_Player
    .word PF_ActorPlayer
    .word PF_Ground | PF_Enemy
