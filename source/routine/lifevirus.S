#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_LifeVirus
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_LifeVirus_0_Init_08069504
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_LifeVirus_0_Init_08069504:
    .word PTR_R_LifeVirus_0_Init_08069508

PTR_R_LifeVirus_0_Init_08069508:
    .word R_LifeVirus_0_Init
    .word R_LifeVirus_1_Main
    .word R_LifeVirus_2_Free


_ts R_LifeVirus_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x68
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    FieldObject_Create PFI_Self_Actor, 0x60
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r4,#0x0
    bl         Effect_LifeVirusAura_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x4
    mov        r1,#0x1
    bl         Effect_Scuttlest_Create
    str        r7,[r5,#0x68]
    mov        r0,#0x4
    mov        r1,#0x2
    bl         Effect_Scuttlest_Create
    str        r7,[r5,#0x6c]
    mov        r0,#0x4
    mov        r1,#0x3
    bl         Effect_Scuttlest_Create
    str        r7,[r5,#0x70]
    mov        r0,#0x4
    mov        r1,#0x2
    mov        r4,#0x0
    bl         Attack_Scuttlest_Create
    push       {r0}
    mov        r0,#0xff
    mov        r4,#0x0
    bl         Attack_Scuttlest_Create
    pop        {r1}
    mov        r2,#0x0
    tst        r1,r1
    beq        LAB_080695a0
    strb       r2,[r1,#0xe]
    str        r0,[r1,#0x6c]
LAB_080695a0:
    mov        r2,#0x1
    tst        r0,r0
    beq        LAB_080695aa
    strb       r2,[r0,#0xe]
    str        r1,[r0,#0x6c]
LAB_080695aa:
    mov        r0,#0x1
    strb       r0,[r5,#0x10]
    mov        r0,#0x0
    strb       r0,[r5,#0x11]
    bl         R_LifeVirus_1_Main
    pop        {pc}


_ts R_LifeVirus_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080695ee
    bl         Battle_IsInputLocked
    bne        LAB_080695ee
    bl         Routine_CheckPoisonDrain
    bl         R_LifeVirus_CheckDamage
    tst        r0,r0
    beq        LAB_080695ee
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_080695ee:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08069630
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08069620
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         Battle_DecreaseOpponentCount
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x1
    strb       r0,[r5,#0xf]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    str        r0,[r5,#0x64]
LAB_08069620:
    bl         R_LifeVirus_GetStage
    cmp        r0,#0x1
    blt        LAB_0806962c
    mov        r0,#0x1
    strb       r0,[r5,#0x11]
LAB_0806962c:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08069630:
    .word PTR_R_Actor_1_0_Spawn_08069634

PTR_R_Actor_1_0_Spawn_08069634:
    .word R_Actor_1_0_Spawn
    .word R_LifeVirus_1_1_WaitForBattleStart
    .word R_LifeVirus_1_2
    .word R_LifeVirus_1_3
    .word R_LifeVirus_1_4_Laser
    .word R_LifeVirus_1_5_Sword
    .word R_LifeVirus_1_6_Meteor


_ts R_LifeVirus_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08069666
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08069666:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806967c
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806967c:
    pop        {pc}


_nt R_LifeVirus_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_1_2_0_080696a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806969c
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806969c:
    pop        {pc}

    .align 2, 0


PTR_R_LifeVirus_1_2_0_080696a0:
    .word R_LifeVirus_1_2_0
    .word R_LifeVirus_1_2_1

PTR_PTR_R_LifeVirus_1_2_0_080696a8:
    .word PTR_R_LifeVirus_1_2_0_080696a0


_ts R_LifeVirus_1_2_0
    push       {lr}
    bl         R_LifeVirus_Decide
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_LifeVirus_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080696d4
    mov        r1,#0xc
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_080696ce
    mov        r1,#0x10
LAB_080696ce:
    strb       r1,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080696d4:
    pop        {pc}


_nt R_LifeVirus_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_1_3_0_080696ec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_LifeVirus_1_3_0_080696e4:
    .word R_LifeVirus_1_3_0
    .word R_LifeVirus_1_3_1

PTR_PTR_R_LifeVirus_1_3_0_080696ec:
    .word PTR_R_LifeVirus_1_3_0_080696e4


_ts R_LifeVirus_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r4,#0x1
    bl         Effect_LifeVirusAura_Create
    str        r7,[r5,#0x64]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strb       r0,[r5,#0xd]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xd3
    bl         Sound_PlaySE
    mov        r0,#0x28
    strh       r0,[r5,#0x1e]
    pop        {pc}


_ts R_LifeVirus_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806972c
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    mov        r0,#0xd4
    bl         Sound_PlaySE
LAB_0806972c:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r1,#0x69
    lsl        r1,r1,#0x2
    cmp        r0,r1
    blt        LAB_0806974c
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    mov        r0,#0x1
    strb       r0,[r5,#0xe]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08069764
LAB_0806974c:
    cmp        r0,#0xb4
    bge        LAB_08069754
    mov        r2,#0x0
    b          LAB_08069762
LAB_08069754:
    mov        r1,#0x2d
    lsl        r1,r1,#0x3
    cmp        r0,r1
    bge        LAB_08069760
    mov        r2,#0x1
    b          LAB_08069762
LAB_08069760:
    mov        r2,#0x2
LAB_08069762:
    strb       r2,[r5,#0xd]
LAB_08069764:
    pop        {pc}

DAT_08069766:
    .byte 0xB4
    .byte 0x00
    .byte 0x68
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .word DAT_08069766


_ts R_LifeVirus_1_4_Laser
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_1_4_0_08069794
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_LifeVirus_1_4_0_08069780:
    .word R_LifeVirus_1_4_0
    .word R_LifeVirus_1_4_1
    .word R_LifeVirus_1_4_2
    .word R_LifeVirus_1_4_3
    .word R_LifeVirus_1_4_4

PTR_PTR_R_LifeVirus_1_4_0_08069794:
    .word PTR_R_LifeVirus_1_4_0_08069780


_ts R_LifeVirus_1_4_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    pop        {pc}


_ts R_LifeVirus_1_4_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080697ca
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r2,#0xc8
    mov        r4,#0x1
    bl         Effect_Laser_Create
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
LAB_080697ca:
    pop        {pc}


_ts R_LifeVirus_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x4b
    bne        LAB_080697da
    mov        r0,#0x97
    bl         Sound_PlaySE
LAB_080697da:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080697ea
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_080697ea:
    pop        {pc}


_ts R_LifeVirus_1_4_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08069804
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_08069804:
    pop        {pc}


_nt R_LifeVirus_1_4_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806981c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
LAB_0806981c:
    pop        {pc}


_nt R_LifeVirus_1_5_Sword
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_1_5_0_08069840
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_LifeVirus_1_5_0_0806982c:
    .word R_LifeVirus_1_5_0
    .word R_LifeVirus_1_5_1
    .word R_LifeVirus_1_5_2
    .word R_LifeVirus_1_5_3
    .word R_LifeVirus_1_5_4

PTR_PTR_R_LifeVirus_1_5_0_08069840:
    .word PTR_R_LifeVirus_1_5_0_0806982c


_ts R_LifeVirus_1_5_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    pop        {pc}


_ts R_LifeVirus_1_5_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069876
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    mov        r6,#0xc8
    bl         Attack_LifeVirusSword_Create
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
LAB_08069876:
    pop        {pc}


_ts R_LifeVirus_1_5_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806988a
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806988a:
    pop        {pc}


_ts R_LifeVirus_1_5_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080698a4
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_080698a4:
    pop        {pc}


_nt R_LifeVirus_1_5_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080698bc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
LAB_080698bc:
    pop        {pc}


_nt R_LifeVirus_1_6_Meteor
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_1_6_0_080698e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_LifeVirus_1_6_0_080698cc:
    .word R_LifeVirus_1_6_0
    .word R_LifeVirus_1_6_1
    .word R_LifeVirus_1_6_2
    .word R_LifeVirus_1_6_3
    .word R_LifeVirus_1_6_4

PTR_PTR_R_LifeVirus_1_6_0_080698e0:
    .word PTR_R_LifeVirus_1_6_0_080698cc


_ts R_LifeVirus_1_6_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    pop        {pc}


_ts R_LifeVirus_1_6_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806990e
    bl         Effect_LifeVirusMeteor_Create
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
LAB_0806990e:
    pop        {pc}


_ts R_LifeVirus_1_6_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069922
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_08069922:
    pop        {pc}


_ts R_LifeVirus_1_6_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806993c
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806993c:
    pop        {pc}


_nt R_LifeVirus_1_6_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069954
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
LAB_08069954:
    pop        {pc}


_nt R_LifeVirus_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_LifeVirus_2_0_0806996c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_LifeVirus_2_0_08069964:
    .word R_LifeVirus_2_0
    .word R_LifeVirus_2_1

PTR_PTR_R_LifeVirus_2_0_0806996c:
    .word PTR_R_LifeVirus_2_0_08069964


_ts R_LifeVirus_2_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_2_0_0_08069994
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_LifeVirus_2_0_0_08069980:
    .word R_LifeVirus_2_0_0
    .word R_LifeVirus_2_0_1
    .word R_LifeVirus_2_0_2
    .word R_LifeVirus_2_0_3
    .word R_LifeVirus_2_0_4

PTR_PTR_R_LifeVirus_2_0_0_08069994:
    .word PTR_R_LifeVirus_2_0_0_08069980


_ts R_LifeVirus_2_0_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    LoadMain battle, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x8]
    mov        r0,#0x0
    strb       r0,[r7,#0x12]
    push       {r5}
    bl         BattleUi_ClearHpDisplay
    bl         BattleUi_LoadCustomGaugeTileMap
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    bl         SpritePtr_DisableFlash
    pop        {pc}


_ts R_LifeVirus_2_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x78
    ble        LAB_080699f0
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x2
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x0
    mov        r1,#0x1f
    bl         Sound_FadeOut
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_080699f0:
    bl         R_LifeVirus_ShowSmallExplosions
    pop        {pc}


_nt R_LifeVirus_2_0_2
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08069a42
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    push       {r5}
    ldr        r5,[r5,#0x68]
    tst        r5,r5
    beq        LAB_08069a1c
    bl         Effect_Free
LAB_08069a1c:
    pop        {r5}
    push       {r5}
    ldr        r5,[r5,#0x68]
    tst        r5,r5
    beq        LAB_08069a2a
    bl         Effect_Free
LAB_08069a2a:
    pop        {r5}
    push       {r5}
    ldr        r5,[r5,#0x68]
    tst        r5,r5
    beq        LAB_08069a38
    bl         Effect_Free
LAB_08069a38:
    pop        {r5}
    mov        r0,#0xe6
    bl         Sound_PlaySE
    b          LAB_08069a46
LAB_08069a42:
    bl         R_LifeVirus_ShowSmallExplosions
LAB_08069a46:
    pop        {pc}


_ts R_LifeVirus_2_0_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069a62
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x2
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_08069a62:
    pop        {pc}


_ts R_LifeVirus_2_0_4
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08069a7a
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08069a7a:
    pop        {pc}


_ts R_LifeVirus_2_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_LifeVirus_2_1_0_08069a98
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_LifeVirus_2_1_0_08069a8c:
    .word R_LifeVirus_2_1_0
    .word R_LifeVirus_2_1_1
    .word R_LifeVirus_2_1_2

PTR_PTR_R_LifeVirus_2_1_0_08069a98:
    .word PTR_R_LifeVirus_2_1_0_08069a8c


_ts R_LifeVirus_2_1_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_LifeVirus_2_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0xf0
    ble        LAB_08069ac6
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x4
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08069ac6:
    pop        {pc}


_ts R_LifeVirus_2_1_2
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08069ade
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08069ade:
    pop        {pc}


_ts R_LifeVirus_CheckDamage
    push       {lr}
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,DAT_08069b18
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08069b0e
    mov        r0,#0x0
    bl         R_Actor_IsShieldPopped
    tst        r0,r0
    beq        LAB_08069b0e
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
LAB_08069b0e:
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    pop        {pc}

    .align 2, 0


DAT_08069b18:
    .word 0x28850


_ts R_LifeVirus_Decide
    push       {lr}
    bl         R_LifeVirus_GetStage
    add        r4,r0,#0x0
    mov        r0,#0xc
    ldrb       r1,[r5,#0xe]
    tst        r1,r1
    beq        LAB_08069b64
    bl         Rng_RandomUint
    mov        r6,#0x3
    and        r6,r0
    bl         Entity_CompareToPlayerRow
    bne        LAB_08069b4a
    cmp        r4,#0x2
    blt        LAB_08069b42
    cmp        r6,#0x2
    beq        LAB_08069b46
LAB_08069b42:
    mov        r0,#0x10
    b          LAB_08069b64
LAB_08069b46:
    mov        r0,#0x18
    b          LAB_08069b64
LAB_08069b4a:
    cmp        r4,#0x2
    blt        LAB_08069b5e
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    cmp        r0,#0x2
    blt        LAB_08069b62
    cmp        r6,#0x2
    beq        LAB_08069b46
LAB_08069b5e:
    mov        r0,#0x14
    b          LAB_08069b64
LAB_08069b62:
    mov        r0,#0x18
LAB_08069b64:
    pop        {pc}


_nt R_LifeVirus_ShowSmallExplosions
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    mov        r2,#0x1
    mov        r1,#0x4
    tst        r1,r0
    bne        LAB_08069b78
    mov        r2,#0x3
LAB_08069b78:
    strb       r2,[r5,#0x0]
    mov        r1,#0x8
    and        r1,r0
    cmp        r1,#0x8
    bne        LAB_08069ba4
    push       {r5}
    ldr        r3,[r5,#0x30]
    mov        r0,#0x20
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r0,#0x3f
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
LAB_08069ba4:
    pop        {pc}


_nt R_LifeVirus_GetStage
    push       {lr}
    mov        r0,#0x0
    ldrh       r1,[r5,#0x20]
    ldr        r2,DAT_08069bc0
    cmp        r1,r2
    bge        LAB_08069bbc
    mov        r0,#0x1
    ldr        r2,DAT_08069bc4
    cmp        r1,r2
    bge        LAB_08069bbc
    mov        r0,#0x2
LAB_08069bbc:
    pop        {pc}

    .align 2, 0


DAT_08069bc0:
    .word 0x2EE

DAT_08069bc4:
    .word 0x1F4
