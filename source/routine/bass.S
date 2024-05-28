#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_AirBurst_Create, 0x8079BA0+1
    .set Attack_BassExplosionYellow_Create, 0x8079E88+1
    .set Attack_BassExplosionBlue_Create, 0x807A010+1
    .set Effect_Bass_Create, 0x8081808+1
    .set Effect_NaviDelete_Create, 0x8081D7C+1
    .set SWI_Div, 0x809DF54+1


_ts Routine_Bass
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Bass_0_Init_0806cca0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_0_Init_0806cca0:
    .word PTR_R_Bass_0_Init_0806cca4

PTR_R_Bass_0_Init_0806cca4:
    .word R_Bass_0_Init
    .word R_Bass_1_Main
    .word R_Bass_2_Free


_ts R_Bass_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x6a
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r0,#0x5
    strb       r0,[r5,#0x1b]
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
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    mov        r0,#0xce
    bl         Sound_PlaySongImmediate
    mov        r4,#0x0
    bl         Effect_Bass_Create
    str        r7,[r5,#0x5c]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    bl         R_Bass_1_Main
    pop        {pc}


_ts R_Bass_1_Main
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
    beq        LAB_0806cd5a
    mov        r0,#0x3
    mov        r2,#0x2
    tst        r1,r2
    beq        LAB_0806cd46
    mov        r0,#0x1
LAB_0806cd46:
    sub        r1,#0x1
    strb       r1,[r5,#0xe]
    push       {r0}
    ldr        r0,[r5,#0x60]
    mov        r1,#0x1
    lsl        r1,r1,#0x14
    bl         FieldObject_ClearPanelFlag
    pop        {r0}
    strb       r0,[r5,#0x0]
LAB_0806cd5a:
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0806cd96
    bl         Battle_IsInputLocked
    bne        LAB_0806cd96
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    bne        LAB_0806cd96
    bl         Routine_CheckPoisonDrain
    bl         R_Bass_CheckDamage
    tst        r0,r0
    beq        LAB_0806cd96
    cmp        r0,#0x64
    bmi        LAB_0806cd84
    mov        r1,#0x1
    strb       r0,[r5,#0xf]
LAB_0806cd84:
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0806cd96:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0806cdc8
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806cdd8
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
    bne        LAB_0806cdbe
    mov        r0,#0xf
LAB_0806cdbe:
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806cdd6
LAB_0806cdc8:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_0806cdd6:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806cdd8:
    .word PTR_R_Actor_1_0_Spawn_0806cddc

PTR_R_Actor_1_0_Spawn_0806cddc:
    .word R_Actor_1_0_Spawn
    .word R_Bass_1_1_Wait
    .word R_Bass_1_2_Decide
    .word R_Bass_1_3_Move
    .word R_Bass_1_4_Flinch
    .word R_Bass_1_5_AirBurst
    .word R_Bass_1_6_Explosion


_ts R_Bass_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806ce0e
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806ce0e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806ce20
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ce20:
    pop        {pc}


_nt R_Bass_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Bass_1_2_0_0806ce50
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Bass_CheckFlinch
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806ce44
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806ce44:
    pop        {pc}

    .align 2, 0


PTR_R_Bass_1_2_0_0806ce48:
    .word R_Bass_1_2_0
    .word R_Bass_1_2_1

PTR_PTR_R_Bass_1_2_0_0806ce50:
    .word PTR_R_Bass_1_2_0_0806ce48


_ts R_Bass_1_2_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts R_Bass_1_2_1
    push       {lr}
    ldrb       r0,[r5,#0x1b]
    sub        r0,#0x1
    strb       r0,[r5,#0x1b]
    bne        LAB_0806ce8e
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    add        r0,#0x2
    strb       r0,[r5,#0x1b]
    mov        r1,#0x14
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_0806ce80
    mov        r1,#0x18
LAB_0806ce80:
    mov        r2,#0x1
    eor        r0,r2
    strb       r0,[r5,#0x4]
    strb       r1,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806ce96
LAB_0806ce8e:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ce96:
    pop        {pc}


_ts R_Bass_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Bass_1_3_0_0806ceac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Bass_CheckFlinch
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_1_3_0_0806ceac:
    .word PTR_R_Bass_1_3_0_0806ceb0

PTR_R_Bass_1_3_0_0806ceb0:
    .word R_Bass_1_3_0
    .word R_Bass_1_3_1
    .word R_Bass_1_3_2
    .word R_Bass_1_3_3


_ts R_Bass_1_3_0
    push       {lr}
    ldrb       r0,[r5,#0x1b]
    cmp        r0,#0x1
    bne        LAB_0806cee0
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_0806ced8
    bl         R_Bass_GetNextMovePanelPlayerRow
    cmp        r0,#0xff
    beq        LAB_0806cee0
    b          LAB_0806cee4
LAB_0806ced8:
    bl         R_Bass_GetNextMovePanelFront
    cmp        r0,#0xff
    bne        LAB_0806cee4
LAB_0806cee0:
    bl         R_Bass_GetNextMovePanel
LAB_0806cee4:
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
    pop        {pc}


_nt R_Bass_1_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806cf28
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
LAB_0806cf28:
    pop        {pc}


_nt R_Bass_1_3_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806cf42
    mov        r0,#0xf
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806cf42:
    pop        {pc}


_ts R_Bass_1_3_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806cf56
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806cf56:
    pop        {pc}


_ts R_Bass_1_4_Flinch
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Bass_1_4_0_0806cf70
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Bass_1_4_0_0806cf68:
    .word R_Bass_1_4_0
    .word R_Bass_1_4_1

PTR_PTR_R_Bass_1_4_0_0806cf70:
    .word PTR_R_Bass_1_4_0_0806cf68


_ts R_Bass_1_4_0
    push       {lr}
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x32
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0x10]
    str        r0,[r5,#0x68]
    strb       r0,[r5,#0xd]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    add        r0,#0x2
    strb       r0,[r5,#0x1b]
    pop        {pc}


_ts R_Bass_1_4_1
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrh       r0,[r5,#0x1c]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0806cfb2
    bl         SpritePtr_SetFlashPalette
LAB_0806cfb2:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806cfca
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x78
    strb       r0,[r5,#0xe]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
LAB_0806cfca:
    pop        {pc}


_ts R_Bass_1_5_AirBurst
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Bass_1_5_0_0806cfe0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Bass_CheckFlinch
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_1_5_0_0806cfe0:
    .word PTR_R_Bass_1_5_0_0806cfe4

PTR_R_Bass_1_5_0_0806cfe4:
    .word R_Bass_1_5_0
    .word R_Bass_1_5_1
    .word R_Bass_1_5_2
    .word R_Bass_1_5_3


_ts R_Bass_1_5_0
    push       {lr}
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Bass_1_5_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806d036
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    mov        r2,#0xc8
    ldrb       r3,[r5,#0x16]
    mov        r4,#0x3
    mov        r6,#0x7
    bl         Attack_AirBurst_Create
    tst        r7,r7
    beq        LAB_0806d02a
    mov        r0,#0x0
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    strb       r0,[r7,#0x6]
LAB_0806d02a:
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0806d036:
    pop        {pc}


_ts R_Bass_1_5_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d04e
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strb       r0,[r5,#0x1c]
LAB_0806d04e:
    pop        {pc}


_ts R_Bass_1_5_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d062
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d062:
    pop        {pc}


_ts R_Bass_1_6_Explosion
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Bass_1_6_0_0806d078
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         R_Bass_CheckFlinch
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_1_6_0_0806d078:
    .word PTR_R_Bass_1_6_0_0806d07c

PTR_R_Bass_1_6_0_0806d07c:
    .word R_Bass_1_6_0
    .word R_Bass_1_6_1
    .word R_Bass_1_6_2
    .word R_Bass_1_6_3
    .word R_Bass_1_6_4
    .word R_Bass_1_6_5


_ts R_Bass_1_6_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Bass_1_6_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806d0d0
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         SWI_Div
    strb       r1,[r5,#0xc]
    mov        r0,#0x1e
    mul        r0,r1
    add        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r4,#0x1
    bl         Effect_Bass_Create
    str        r7,[r5,#0x68]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1e]
LAB_0806d0d0:
    pop        {pc}


_nt R_Bass_1_6_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806d0e6
    mov        r0,#0x22
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8f
    bl         Sound_PlaySongImmediate
LAB_0806d0e6:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d0fc
    mov        r0,#0x0
    str        r0,[r5,#0x68]
    strb       r0,[r5,#0xd]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_0806d0fc:
    pop        {pc}


_nt R_Bass_1_6_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806d10e
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_0806d10e:
    pop        {pc}


_ts R_Bass_1_6_4
    push       {lr}
    ldrb       r0,[r5,#0xc]
    ldr        r7,PTR_PTR_R_Bass_ExplosionGreen_0806d120
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Bass_ExplosionGreen_0806d120:
    .word PTR_R_Bass_ExplosionGreen_0806d124

PTR_R_Bass_ExplosionGreen_0806d124:
    .word R_Bass_ExplosionGreen
    .word R_Bass_ExplosionBlue
    .word R_Bass_ExplosionYellow


_ts R_Bass_ExplosionGreen
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Bass_ExplosionGreen_0_0806d140
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_ExplosionGreen_0_0806d140:
    .word PTR_R_Bass_ExplosionGreen_0_0806d144

PTR_R_Bass_ExplosionGreen_0_0806d144:
    .word R_Bass_ExplosionGreen_0
    .word R_Bass_ExplosionGreen_1


_ts R_Bass_ExplosionGreen_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts R_Bass_ExplosionGreen_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d1b0
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         SWI_Div
    add        r1,#0x1
    mov        r0,#0x5
    mov        r2,#0x96
    lsl        r2,r2,#0x1
    ldrb       r3,[r5,#0x16]
    mov        r4,#0x3
    mov        r6,#0x7
    bl         Attack_AirBurst_Create
    tst        r7,r7
    beq        LAB_0806d192
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    strb       r0,[r7,#0x6]
LAB_0806d192:
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0xf
    bge        LAB_0806d1a4
    ldr        r7,PTR_BYTE_ARRAY_0806d1c4
    ldrb       r1,[r7,r0]
    strh       r1,[r5,#0x1c]
    b          LAB_0806d1b0
LAB_0806d1a4:
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806d1b0:
    pop        {pc}

BYTE_ARRAY_0806d1b2:
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10
    .byte 0x08
    .byte 0x0C
    .byte 0x10

    .align 2, 0


PTR_BYTE_ARRAY_0806d1c4:
    .word BYTE_ARRAY_0806d1b2


_ts R_Bass_ExplosionYellow
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Bass_ExplosionYellow_0_0806d1d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_ExplosionYellow_0_0806d1d8:
    .word PTR_R_Bass_ExplosionYellow_0_0806d1dc

PTR_R_Bass_ExplosionYellow_0_0806d1dc:
    .word R_Bass_ExplosionYellow_0
    .word R_Bass_ExplosionYellow_1


_ts R_Bass_ExplosionYellow_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts R_Bass_ExplosionYellow_1
    push       {lr}
    sub        sp,#0x14
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d268
    ldrh       r0,[r5,#0x1e]
    ldr        r7,PTR_listBassExplosionYellowDelay_0806d27c
    ldrb       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,sp
    mov        r1,#0x1
    ldr        r2,PanelFlag_0806d278
    ldrb       r3,[r5,#0x16]
    bl         Field_SearchWithOwner
    mov        r0,sp
    mov        r2,#0x14
    bl         ArrayShuffle
    push       {r1}
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    add        r0,#0x3
    pop        {r1}
    cmp        r0,r1
    ble        LAB_0806d234
    add        r0,r1,#0x0
LAB_0806d234:
    mov        r7,sp
LAB_0806d236:
    push       {r0,r7}
    ldrb       r0,[r7,#0x0]
    bl         Field_IndexToCellXY
    mov        r2,#0x96
    lsl        r2,r2,#0x1
    ldrb       r3,[r5,#0x16]
    bl         Attack_BassExplosionYellow_Create
    pop        {r0,r7}
    add        r7,#0x1
    sub        r0,#0x1
    bgt        LAB_0806d236
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    cmp        r0,#0xc
    bge        LAB_0806d25c
    b          LAB_0806d268
LAB_0806d25c:
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806d268:
    add        sp,#0x14
    pop        {pc}

listBassExplosionYellowDelay:
    .byte 0x3C
    .byte 0x3C
    .byte 0x3C
    .byte 0x3C
    .byte 0x2D
    .byte 0x2D
    .byte 0x2D
    .byte 0x2D
    .byte 0x20
    .byte 0x20
    .byte 0x20
    .byte 0x20

PanelFlag_0806d278:
    .word PF_EnemyTerritory

PTR_listBassExplosionYellowDelay_0806d27c:
    .word listBassExplosionYellowDelay


_ts R_Bass_ExplosionBlue
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Bass_ExplosionBlue_0_0806d290
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Bass_ExplosionBlue_0_0806d290:
    .word PTR_R_Bass_ExplosionBlue_0_0806d294

PTR_R_Bass_ExplosionBlue_0_0806d294:
    .word R_Bass_ExplosionBlue_0
    .word R_Bass_ExplosionBlue_1


_ts R_Bass_ExplosionBlue_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    mov        r0,#0x96
    lsl        r0,r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         R_Bass_FindFirstEnemyPanel
    mov        r2,#0x96
    lsl        r2,r2,#0x1
    mov        r3,#0x20
    mov        r4,#0x0
    mov        r6,#0x7
    bl         Attack_BassExplosionBlue_Create
    tst        r7,r7
    beq        LAB_0806d2c8
    str        r5,[r7,#0x68]
LAB_0806d2c8:
    mov        r0,#0x1
    strb       r0,[r5,#0x10]
    pop        {pc}


_nt R_Bass_ExplosionBlue_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d2e8
    mov        r0,#0x0
    strb       r0,[r5,#0x10]
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x14
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
LAB_0806d2e8:
    pop        {pc}


_nt R_Bass_1_6_5
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d306
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    mov        r0,#0xce
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d306:
    pop        {pc}


_ts R_Bass_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Bass_2_0_0806d320
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Bass_2_0_0806d318:
    .word R_Bass_2_0
    .word R_Bass_2_1

PTR_PTR_R_Bass_2_0_0806d320:
    .word PTR_R_Bass_2_0_0806d318


_ts R_Bass_2_0
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
    pop        {pc}


_nt R_Bass_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d358
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806d358:
    pop        {pc}


_nt R_Bass_CheckDamage
    push       {lr}
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,DAT_0806d390
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0xd]
    tst        r0,r0
    beq        LAB_0806d388
    mov        r0,#0x0
    bl         R_Actor_IsShieldPopped
    tst        r0,r0
    beq        LAB_0806d388
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
LAB_0806d388:
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    pop        {pc}

DAT_0806d390:
    .word 0x28850


_ts R_Bass_GetNextMovePanel
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x2
    ldr        r2,PanelFlag_0806d3d0
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


PanelFlag_0806d3d0:
    .word PF_EnemyOccupied | PF_Teleporting


_ts R_Bass_IsPlayerInSameRow
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
LAB_0806d3da:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r1,#0x40
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_0806d3ec
    mov        r0,#0x1
    b          LAB_0806d3f2
LAB_0806d3ec:
    sub        r0,#0x1
    bne        LAB_0806d3da
    mov        r0,#0x0
LAB_0806d3f2:
    pop        {pc}


_ts R_Bass_CheckFlinch
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_0806d402
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d402:
    mov        pc,lr


_ts R_Bass_FindFirstEnemyPanel
    push       {lr}
    mov        r0,#0x6
LAB_0806d408:
    push       {r0}
    mov        r1,#0x2
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0}
    mov        r1,#0x2
    tst        r2,r1
    beq        LAB_0806d41e
    sub        r0,#0x1
    bgt        LAB_0806d408
LAB_0806d41e:
    pop        {pc}


_ts R_Bass_GetNextMovePanelFront
    push       {lr}
    sub        sp,#0x10
    mov        r0,#0x0
    mov        r1,#0x1
    mov        r7,sp
    bl         Field_FindEmptyOpponentWalkableEdgeFront
    mov        r0,#0xff
    tst        r1,r1
    beq        LAB_0806d448
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    mov        r7,sp
    ldrb       r0,[r7,r1]
    bl         Field_IndexToCellXY
LAB_0806d448:
    add        sp,#0x10
    pop        {pc}


_ts R_Bass_GetNextMovePanelPlayerRow
    push       {lr}
    sub        sp,#0x10
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r1,[r7,#0x19]
    mov        r7,sp
    mov        r0,#0x1
    mov        r3,#0x0
LAB_0806d45e:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_0806d470
    strb       r0,[r7,r3]
    add        r3,#0x1
LAB_0806d470:
    add        r0,#0x1
    cmp        r0,#0x6
    ble        LAB_0806d45e
    mov        r0,#0xff
    tst        r3,r3
    beq        LAB_0806d448
    push       {r1}
    add        r1,r3,#0x0
    push       {r1,r7}
    bl         Rng_RandomInt
    pop        {r1,r7}
    bl         SWI_Div
    ldrb       r0,[r7,r1]
    pop        {r1}
    add        sp,#0x10
    pop        {pc}
