#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_MagicMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_MagicMan_0_Init_0806a840
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MagicMan_0_Init_0806a840:
    .word PTR_R_MagicMan_0_Init_0806a844

PTR_R_MagicMan_0_Init_0806a844:
    .word R_MagicMan_0_Init
    .word R_MagicMan_1_Main
    .word R_MagicMan_2_Free


_ts R_MagicMan_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x51
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
    str        r0,[r5,#0x5c]
    str        r0,[r5,#0x74]
    str        r0,[r5,#0x7c]
    mov        r0,#0xff
    mov        r1,#0x3c
    mov        r2,#0x0
    mov        r7,#0x70
    add        r7,r7,r5
    strb       r0,[r7,#0x0]
    strh       r1,[r7,#0x2]
    strb       r2,[r7,#0x4]
    add        r7,#0x8
    strb       r0,[r7,#0x0]
    strh       r1,[r7,#0x2]
    strb       r2,[r7,#0x4]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x4
    mov        r1,#0x1
    mov        r4,#0x0
    bl         Effect_MagicMan_Create
    str        r7,[r5,#0x64]
    mov        r0,#0x5
    mov        r1,#0x3
    mov        r4,#0x0
    bl         Effect_MagicMan_Create
    str        r7,[r5,#0x68]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x0
    bl         Effect_MagicMan_Create
    str        r7,[r5,#0x6c]
    bl         R_MagicMan_LoadEnemySprites
    bl         R_MagicMan_1_Main
    pop        {pc}


_ts R_MagicMan_1_Main
    push       {lr}
    bl         R_MagicMan_UnloadEnemies
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0806a916
    bl         Battle_IsInputLocked
    bne        LAB_0806a916
    bl         Routine_CheckPoisonDrain
    bl         R_MagicMan_CalcDamage
    tst        r0,r0
    beq        LAB_0806a916
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_0806a916:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806a950
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    mov        r0,#0x9
    ldr        r1,[r5,#0x60]
    ldrb       r2,[r5,#0x17]
    tst        r2,r2
    bne        LAB_0806a932
    mov        r0,#0xf
LAB_0806a932:
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806a94e
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0806a94e:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806a950:
    .word PTR_R_Actor_1_0_Spawn_0806a954

PTR_R_Actor_1_0_Spawn_0806a954:
    .word R_Actor_1_0_Spawn
    .word R_MagicMan_1_1_Wait
    .word R_MagicMan_1_2_Decide
    .word R_MagicMan_1_3_VirusSummon
    .word R_MagicMan_1_4_MagicFire


_ts R_MagicMan_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806a97e
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806a97e:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806a990
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806a990:
    pop        {pc}


_nt R_MagicMan_1_2_Decide
    push       {lr}
    mov        r7,#0x70
    add        r7,r7,r5
    bl         R_MagicMan_EnemyControl
    mov        r7,#0x78
    add        r7,r7,r5
    bl         R_MagicMan_EnemyControl
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MagicMan_1_2_0_0806a9cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806a9c0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806a9c0:
    pop        {pc}

    .align 2, 0


PTR_R_MagicMan_1_2_0_0806a9c4:
    .word R_MagicMan_1_2_0
    .word R_MagicMan_1_2_1

PTR_PTR_R_MagicMan_1_2_0_0806a9cc:
    .word PTR_R_MagicMan_1_2_0_0806a9c4


_ts R_MagicMan_1_2_0
    push       {lr}
    mov        r0,#0x64
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_MagicMan_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806aa02
    mov        r0,#0xc
    mov        r7,#0x70
    add        r7,r7,r5
    ldrb       r1,[r7,#0x0]
    cmp        r1,#0xff
    bne        LAB_0806a9fc
    add        r7,#0x8
    ldrb       r1,[r7,#0x0]
    cmp        r1,#0xff
    bne        LAB_0806a9fc
    mov        r0,#0x10
LAB_0806a9fc:
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806aa02:
    pop        {pc}


_ts R_MagicMan_1_3_VirusSummon
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MagicMan_1_3_0_0806aa24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_MagicMan_1_3_0_0806aa14:
    .word R_MagicMan_1_3_0
    .word R_MagicMan_1_3_1
    .word R_MagicMan_1_3_2
    .word R_MagicMan_1_3_3

PTR_PTR_R_MagicMan_1_3_0_0806aa24:
    .word PTR_R_MagicMan_1_3_0_0806aa14


_ts R_MagicMan_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_MagicMan_1_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806aa5a
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_0806aa56
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_0806aa56:
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
LAB_0806aa5a:
    pop        {pc}


_ts R_MagicMan_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ab10
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x6c]
    tst        r7,r7
    beq        LAB_0806aa7c
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_0806aa7c:
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r3,#0x70
    ldrb       r0,[r5,r3]
    cmp        r0,#0xff
    beq        LAB_0806aac8
    mov        r1,#0x4
    mov        r2,#0x1
    bl         R_MagicMan_SummonEnemy
    str        r7,[r5,#0x74]
    mov        r0,#0xff
    mov        r1,#0xd2
    lsl        r1,r1,#0x1
    mov        r3,#0x70
    add        r3,r3,r5
    strb       r0,[r3,#0x0]
    strh       r1,[r3,#0x2]
    ldr        r7,[r5,#0x64]
    tst        r0,r0
    beq        LAB_0806aaaa
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_0806aaaa:
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x1
    bl         Battle_CellCoordsToSprite
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x11
    bl         Effect_QuickEffect_Create
    pop        {r5}
LAB_0806aac8:
    mov        r3,#0x78
    ldrb       r0,[r5,r3]
    cmp        r0,#0xff
    beq        LAB_0806ab10
    mov        r1,#0x5
    mov        r2,#0x3
    bl         R_MagicMan_SummonEnemy
    str        r7,[r5,#0x7c]
    mov        r0,#0xff
    mov        r1,#0xd2
    lsl        r1,r1,#0x1
    mov        r3,#0x78
    add        r3,r3,r5
    strb       r0,[r3,#0x0]
    strh       r1,[r3,#0x2]
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0806aaf2
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_0806aaf2:
    push       {r5}
    mov        r0,#0x5
    mov        r1,#0x3
    bl         Battle_CellCoordsToSprite
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r4,#0xa
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x11
    bl         Effect_QuickEffect_Create
    pop        {r5}
LAB_0806ab10:
    pop        {pc}


_nt R_MagicMan_1_3_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ab26
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806ab26:
    pop        {pc}


_ts R_MagicMan_1_4_MagicFire
    push       {lr}
    mov        r7,#0x70
    add        r7,r7,r5
    bl         R_MagicMan_EnemyControl
    mov        r7,#0x78
    add        r7,r7,r5
    bl         R_MagicMan_EnemyControl
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MagicMan_1_4_0_0806ab5c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_MagicMan_1_4_0_0806ab48:
    .word R_MagicMan_1_4_0
    .word R_MagicMan_1_4_1
    .word R_MagicMan_1_4_2
    .word R_MagicMan_1_4_3
    .word R_MagicMan_1_4_4

PTR_PTR_R_MagicMan_1_4_0_0806ab5c:
    .word PTR_R_MagicMan_1_4_0_0806ab48


_ts R_MagicMan_1_4_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_MagicMan_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806ab92
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x1
    bl         Effect_MagicMan_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0x8f
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
LAB_0806ab92:
    pop        {pc}


_ts R_MagicMan_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806abc2
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mov        r4,#0x0
    mov        r6,#0xa0
    bl         Attack_MagicFire_Create
    mov        r0,#0xb6
    bl         Sound_PlaySE
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_0806abc2:
    pop        {pc}


_ts R_MagicMan_1_4_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806abd6
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
LAB_0806abd6:
    pop        {pc}


_ts R_MagicMan_1_4_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806abec
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806abec:
    pop        {pc}


_nt R_MagicMan_2_Free
    push       {lr}
    bl         R_MagicMan_UnloadEnemies
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_MagicMan_2_0_0806ac08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_MagicMan_2_0_0806ac00:
    .word R_MagicMan_2_0
    .word R_MagicMan_2_1

PTR_PTR_R_MagicMan_2_0_0806ac08:
    .word PTR_R_MagicMan_2_0_0806ac00


_ts R_MagicMan_2_0
    push       {lr}
    mov        r0,#0x0
    ldr        r7,[r5,#0x74]
    tst        r7,r7
    beq        LAB_0806ac18
    strh       r0,[r7,#0x20]
LAB_0806ac18:
    ldr        r7,[r5,#0x7c]
    tst        r7,r7
    beq        LAB_0806ac20
    strh       r0,[r7,#0x20]
LAB_0806ac20:
    str        r0,[r5,#0x5c]
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


_nt R_MagicMan_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806ac54
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806ac54:
    pop        {pc}


_nt R_MagicMan_CalcDamage
    push       {lr}
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,DAT_0806ac78
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    pop        {pc}

DAT_0806ac78:
    .word 0x28850


_ts R_MagicMan_SummonEnemy
    push       {r5,lr}
    sub        sp,#0xc
    str        r0,[sp,#0x0]
    str        r1,[sp,#0x4]
    str        r2,[sp,#0x8]
    bl         Enemy_GetEnemyDetail
    add        r7,r0,#0x0
    ldr        r0,[sp,#0x4]
    ldr        r1,[sp,#0x8]
    bl         Battle_CellCoordsToSprite
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldrb       r0,[r7,#0x4]
    ldr        r4,[r7,#0x8]
    push       {r7}
    bl         Actor_Alloc
    pop        {r7}
    ldrh       r0,[r7,#0x0]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    ldr        r0,[sp,#0x0]
    strb       r0,[r5,#0x13]
    ldr        r0,[sp,#0x4]
    strb       r0,[r5,#0x18]
    ldr        r1,[sp,#0x8]
    strb       r1,[r5,#0x19]
    mov        r0,#0x1
    strb       r0,[r5,#0x16]
    mov        r0,#0xff
    strb       r0,[r5,#0x12]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_BattleHP_Create
    pop        {r7}
    add        sp,#0xc
    pop        {r5,pc}


_nt R_MagicMan_LoadEnemySprites
    push       {r5,lr}
    ldr        r0,PTR_gSpriteDecompLocation1_0806ace4
    bl         SpriteLz_Init
    ldr        r0,PTR_SHORT_ARRAY_0806ace0
    bl         SpriteLz_DecompressSpriteList
    pop        {r5,pc}

    .align 2, 0


PTR_SHORT_ARRAY_0806ace0:
    .word SHORT_ARRAY_0806ace8

PTR_gSpriteDecompLocation1_0806ace4:
    .word gSpriteDecompLocation1

SHORT_ARRAY_0806ace8:
    .short 0x53
    .short 0x28
    .short 0x20
    .short 0x1
    .short 0x5F
    .short 0x49
    .short 0x3C
    .short 0x3D
    .short -1


_nt R_MagicMan_EnemyControl
    push       {lr}
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0xff
    bne        LAB_0806ad3a
    ldr        r6,[r7,#0x4]
    tst        r6,r6
    beq        LAB_0806ad18
    ldrb       r0,[r6,#0x0]
    tst        r0,r0
    bne        LAB_0806ad3a
    mov        r0,#0xd2
    lsl        r0,r0,#0x1
    strh       r0,[r7,#0x2]
    mov        r0,#0xff
    b          LAB_0806ad3a
LAB_0806ad18:
    mov        r0,#0xff
    ldrh       r1,[r7,#0x2]
    sub        r1,#0x1
    strh       r1,[r7,#0x2]
    bge        LAB_0806ad38
    push       {r7}
    bl         Rng_RandomUint
    pop        {r7}
    mov        r1,#0xf
    and        r1,r0
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r6,PTR_PTR_ARRAY_0806ad40
    ldr        r6,[r6,r0]
    ldrb       r0,[r6,r1]
LAB_0806ad38:
    strb       r0,[r7,#0x0]
LAB_0806ad3a:
    pop        {pc}
    .byte 0xA4
    .byte 0x01

    .align 2, 0


PTR_PTR_ARRAY_0806ad40:
    .word PTR_ARRAY_0806ad44

PTR_ARRAY_0806ad44:
    .word DAT_0806ad50
    .word DAT_0806ad60
    .word DAT_0806ad70

DAT_0806ad50:
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x0C
    .byte 0x0C
    .byte 0x1E
    .byte 0x1E
    .byte 0x1E
    .byte 0x2D
    .byte 0x2D
    .byte 0x2D
    .byte 0x45
    .byte 0x45
    .byte 0x49
    .byte 0x4F
    .byte 0x4F

DAT_0806ad60:
    .byte 0x02
    .byte 0x02
    .byte 0x0C
    .byte 0x0C
    .byte 0x0C
    .byte 0x1E
    .byte 0x1E
    .byte 0x1E
    .byte 0x1E
    .byte 0x2D
    .byte 0x45
    .byte 0x45
    .byte 0x49
    .byte 0x49
    .byte 0x4F
    .byte 0x4F

DAT_0806ad70:
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x0C
    .byte 0x0C
    .byte 0x0C
    .byte 0x0C
    .byte 0x1E
    .byte 0x1E
    .byte 0x1E
    .byte 0x1E
    .byte 0x2D
    .byte 0x45
    .byte 0x49
    .byte 0x49
    .byte 0x4F


_ts R_MagicMan_UnloadEnemies
    push       {lr}
    ldr        r7,[r5,#0x74]
    tst        r7,r7
    beq        LAB_0806ad92
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0806ad92
    mov        r0,#0x0
    str        r0,[r5,#0x74]
LAB_0806ad92:
    ldr        r7,[r5,#0x7c]
    tst        r7,r7
    beq        LAB_0806ada2
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0806ada2
    mov        r0,#0x0
    str        r0,[r5,#0x7c]
LAB_0806ada2:
    pop        {pc}
