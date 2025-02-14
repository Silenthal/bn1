#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_ShadowMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_ShadowMan_0_Init_0806b76c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ShadowMan_0_Init_0806b76c:
    .word PTR_R_ShadowMan_0_Init_0806b770

PTR_R_ShadowMan_0_Init_0806b770:
    .word R_ShadowMan_0_Init
    .word R_ShadowMan_1_Main
    .word R_ShadowMan_2_Free


_ts R_ShadowMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x62
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
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    bl         R_ShadowMan_1_Main
    pop        {pc}


_nt R_ShadowMan_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#0x0
    strb       r0,[r5,#0xf]
    ldr        r0,[r5,#0x60]
    mov        r1,#0x1
    lsl        r1,r1,#0x14
    bl         FieldObject_SetPanelFlag
    ldrb       r1,[r5,#0xe]
    tst        r1,r1
    beq        LAB_0806b814
    mov        r0,#0x3
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0806b800
    mov        r0,#0x1
LAB_0806b800:
    sub        r1,#0x1
    strb       r1,[r5,#0xe]
    push       {r0}
    ldr        r0,[r5,#0x60]
    mov        r1,#0x1
    lsl        r1,r1,#0x14
    bl         FieldObject_ClearPanelFlag
    pop        {r0}
    strb       r0,[r5,#0x0]
LAB_0806b814:
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0806b846
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    bne        LAB_0806b846
    bl         R_ShadowMan_CheckDamage
    tst        r0,r0
    beq        LAB_0806b846
    cmp        r0,#0x64
    bmi        LAB_0806b834
    mov        r1,#0x1
    strb       r0,[r5,#0xf]
LAB_0806b834:
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806b846:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806b880
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    mov        r0,#0x9
    ldr        r1,[r5,#0x60]
    ldrb       r2,[r5,#0x17]
    tst        r2,r2
    bne        LAB_0806b868
    mov        r0,#0xf
LAB_0806b868:
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806b87c
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0806b87c:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_0806b880:
    .word PTR_R_Actor_1_0_Spawn_0806b884

PTR_R_Actor_1_0_Spawn_0806b884:
    .word R_Actor_1_0_Spawn
    .word R_ShadowMan_1_1_WaitForBattleStart
    .word R_ShadowMan_1_2_Decide
    .word R_ShadowMan_1_3_MoveAndBunshin
    .word R_ShadowMan_1_4_Bakufu
    .word R_ShadowMan_1_5_Shuriken
    .word R_ShadowMan_1_6_Vulnerable


_ts R_ShadowMan_1_1_WaitForBattleStart
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806b8b6
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806b8b6:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806b8c8
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b8c8:
    pop        {pc}


_nt R_ShadowMan_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ShadowMan_1_2_0_0806b8f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_ShadowMan_CheckVulnerable
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806b8ec
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806b8ec:
    pop        {pc}

    .align 2, 0


PTR_R_ShadowMan_1_2_0_0806b8f0:
    .word R_ShadowMan_1_2_0
    .word R_ShadowMan_1_2_1

PTR_PTR_R_ShadowMan_1_2_0_0806b8f8:
    .word PTR_R_ShadowMan_1_2_0_0806b8f0


_ts R_ShadowMan_1_2_0
    push       {lr}
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts R_ShadowMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806b91e
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806b91e:
    pop        {pc}


_ts R_ShadowMan_1_3_MoveAndBunshin
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ShadowMan_1_3_0_0806b934
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_ShadowMan_CheckVulnerable
    pop        {pc}

    .align 2, 0


PTR_PTR_R_ShadowMan_1_3_0_0806b934:
    .word PTR_R_ShadowMan_1_3_0_0806b938

PTR_R_ShadowMan_1_3_0_0806b938:
    .word R_ShadowMan_1_3_0
    .word R_ShadowMan_1_3_1
    .word R_ShadowMan_1_3_2
    .word R_ShadowMan_1_3_3


_ts R_ShadowMan_1_3_0
    push       {lr}
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,PTR_BYTE_ARRAY_ARRAY_0806ba0c
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x4
    add        r7,r7,r1
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_0806b96a
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806b9d8
LAB_0806b96a:
    ldrb       r0,[r5,#0xc]
    add        r0,#0x1
    strb       r0,[r5,#0xc]
    cmp        r0,#0x9
    blt        LAB_0806b97c
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
LAB_0806b97c:
    bl         R_ShadowMan_GetNextMovePanel
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x3
    beq        LAB_0806b9a8
    cmp        r0,#0x6
    beq        LAB_0806b9a8
    b          LAB_0806b9d8
LAB_0806b9a8:
    ldr        r0,[r5,#0x68]
    tst        r0,r0
    bne        LAB_0806b9c0
    bl         R_ShadowMan_GetAvailablePanel
    cmp        r0,#0xff
    beq        LAB_0806b9c0
    mov        r2,#0x68
    add        r2,r2,r5
    ldr        r4,[r5,#0x4]
    bl         Attack_Bunshin_Create
LAB_0806b9c0:
    ldr        r0,[r5,#0x6c]
    tst        r0,r0
    bne        LAB_0806b9d8
    bl         R_ShadowMan_GetAvailablePanel
    cmp        r0,#0xff
    beq        LAB_0806b9d8
    mov        r2,#0x6c
    add        r2,r2,r5
    ldr        r4,[r5,#0x4]
    bl         Attack_Bunshin_Create
LAB_0806b9d8:
    pop        {pc}

BYTE_ARRAY_ARRAY_0806b9da:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00

    .align 2, 0


PTR_BYTE_ARRAY_ARRAY_0806ba0c:
    .word BYTE_ARRAY_ARRAY_0806b9da


_ts R_ShadowMan_1_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ba36
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         R_Actor_UpdateSpritePos
LAB_0806ba36:
    pop        {pc}


_ts R_ShadowMan_1_3_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ba50
    mov        r0,#0x18
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806ba50:
    pop        {pc}


_nt R_ShadowMan_1_3_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ba6c
    mov        r0,#0xc
    ldrb       r1,[r5,#0xd]
    tst        r1,r1
    beq        LAB_0806ba66
    mov        r0,#0x10
LAB_0806ba66:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ba6c:
    pop        {pc}


_nt R_ShadowMan_1_4_Bakufu
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ShadowMan_1_4_0_0806ba80
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_ShadowMan_CheckVulnerable
    pop        {pc}

PTR_PTR_R_ShadowMan_1_4_0_0806ba80:
    .word PTR_R_ShadowMan_1_4_0_0806ba84

PTR_R_ShadowMan_1_4_0_0806ba84:
    .word R_ShadowMan_1_4_0
    .word R_ShadowMan_1_4_1
    .word R_ShadowMan_1_4_2
    .word R_ShadowMan_1_4_3


_ts R_ShadowMan_1_4_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    pop        {pc}


_ts R_ShadowMan_1_4_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bad2
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    mov        r2,#0xc8
    ldrb       r3,[r5,#0x16]
    mov        r4,#0x3
    ldrb       r6,[r5,#0x4]
    add        r6,r6,r6
    mov        r7,#0xc
    sub        r6,r7,r6
    bl         Attack_Bakufu_Create
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0806bad2:
    pop        {pc}


_ts R_ShadowMan_1_4_2
    push       {lr}
    bl         R_ShadowMan_IsPlayerInRow
    tst        r0,r0
    beq        LAB_0806bae8
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806bafc
LAB_0806bae8:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bafc
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x5
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806bafc:
    pop        {pc}


_nt R_ShadowMan_1_4_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bb10
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806bb10:
    pop        {pc}


_nt R_ShadowMan_1_5_Shuriken
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ShadowMan_1_5_0_0806bb20
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_ShadowMan_1_5_0_0806bb20:
    .word PTR_R_ShadowMan_1_5_0_0806bb24

PTR_R_ShadowMan_1_5_0_0806bb24:
    .word R_ShadowMan_1_5_0
    .word R_ShadowMan_1_5_1
    .word R_ShadowMan_1_5_2
    .word R_ShadowMan_1_5_3
    .word R_ShadowMan_1_5_4
    .word R_ShadowMan_1_5_5
    .word R_ShadowMan_1_5_6
    .word R_ShadowMan_1_5_7


_ts R_ShadowMan_1_5_0
    push       {lr}
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x28
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    pop        {r5}
    pop        {pc}


_nt R_ShadowMan_1_5_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bb8e
    mov        r0,#0x30
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_0806bb8e:
    pop        {pc}


_ts R_ShadowMan_1_5_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806bbac
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x3
    strh       r0,[r5,#0x1e]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806bbac:
    pop        {pc}


_nt R_ShadowMan_1_5_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bbe2
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0xb7
    bl         Sound_PlaySE
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    mov        r6,#0xc8
    bl         Attack_Shuriken_Create
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806bbe2
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0806bbe2:
    pop        {pc}


_ts R_ShadowMan_1_5_4
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bc14
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x28
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strb       r0,[r5,#0xa]
LAB_0806bc14:
    pop        {pc}


_nt R_ShadowMan_1_5_5
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bc2c
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x18
    strb       r0,[r5,#0xa]
LAB_0806bc2c:
    pop        {pc}


_nt R_ShadowMan_1_5_6
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806bc4a
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x1c
    strb       r0,[r5,#0xa]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806bc4a:
    pop        {pc}


_ts R_ShadowMan_1_5_7
    push       {lr}
    bl         R_ShadowMan_CheckVulnerable
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bc62
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806bc62:
    pop        {pc}


_ts R_ShadowMan_1_6_Vulnerable
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_ShadowMan_1_6_0_0806bc7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_ShadowMan_1_6_0_0806bc74:
    .word R_ShadowMan_1_6_0
    .word R_ShadowMan_1_6_1

PTR_PTR_R_ShadowMan_1_6_0_0806bc7c:
    .word PTR_R_ShadowMan_1_6_0_0806bc74


_ts R_ShadowMan_1_6_0
    push       {lr}
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    pop        {pc}


_nt R_ShadowMan_1_6_1
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806bcb0
    bl         SpritePtr_EnableFlash
LAB_0806bcb0:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bcc8
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x78
    strb       r0,[r5,#0xe]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
LAB_0806bcc8:
    pop        {pc}


_nt R_ShadowMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_ShadowMan_2_0_Delete_0806bce0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_ShadowMan_2_0_Delete_0806bcd8:
    .word R_ShadowMan_2_0_Delete
    .word R_ShadowMan_2_1_Free

PTR_PTR_R_ShadowMan_2_0_Delete_0806bce0:
    .word PTR_R_ShadowMan_2_0_Delete_0806bcd8


_ts R_ShadowMan_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    pop        {pc}


_ts R_ShadowMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806bd1e
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806bd1e:
    pop        {pc}


_ts R_ShadowMan_CheckDamage
    push       {lr}
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,PanelFlag_0806bd48
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    pop        {pc}

    .align 2, 0


PanelFlag_0806bd48:
    .word PF_Player | PF_Solid | PF_FieldBlock | PF_Apple


_ts R_ShadowMan_GetNextMovePanel
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_0806bd88
    ldrb       r3,[r5,#0x16]
    bl         Field_SearchWithOwner
    push       {r1}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         R_ShadowMan_CellPosToIndex
    pop        {r1}
    mov        r7,sp
    strb       r0,[r7,r1]
    add        r1,#0x1
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_0806bd88:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_ShadowMan_GetAvailablePanel
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x3
    ldr        r2,PanelFlag_0806bdbc
    ldrb       r3,[r5,#0x16]
    bl         Field_SearchWithOwner
    mov        r0,#0xff
    tst        r1,r1
    beq        LAB_0806bdb6
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
LAB_0806bdb6:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_0806bdbc:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_ShadowMan_CellPosToIndex
    lsl        r1,r1,#0x3
    orr        r0,r1
    mov        pc,lr


_nt R_ShadowMan_IsPlayerInRow
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
LAB_0806bdcc:
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x40
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_0806bdde
    mov        r0,#0x1
    b          LAB_0806bde4
LAB_0806bdde:
    sub        r0,#0x1
    bne        LAB_0806bdcc
    mov        r0,#0x0
LAB_0806bde4:
    pop        {pc}


_nt R_ShadowMan_CheckVulnerable
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_0806bdf4
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806bdf4:
    mov        pc,lr

    .align 2, 0

