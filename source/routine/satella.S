#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Satella
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Satella_0_Init_0806d4a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Satella_0_Init_0806d4a8:
    .word PTR_R_Satella_0_Init_0806d4ac

PTR_R_Satella_0_Init_0806d4ac:
    .word R_Satella_0_Init
    .word R_Satella_1_Main
    .word R_Satella_2_Free


_ts R_Satella_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x52
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    ldr        r7,PTR_USHORT_ARRAY_0806d530
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#0x24]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x9
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_Satella_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_USHORT_ARRAY_0806d530:
    .word USHORT_ARRAY_0806d534

USHORT_ARRAY_0806d534:
    .short 0x3C
    .short 0x64
    .short 0xA0


_nt R_Satella_1_Main
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0806d568
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}


_ts FUN_0806d560
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    b          LAB_0806d570
LAB_0806d568:
    bl         R_Satella_CheckDamage
    tst        r0,r0
    bne        LAB_0806d57a
LAB_0806d570:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806d580
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0806d57a:
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806d580:
    .word PTR_R_Actor_1_0_Spawn_0806d584

PTR_R_Actor_1_0_Spawn_0806d584:
    .word R_Actor_1_0_Spawn
    .word R_Satella_1_1
    .word R_Satella_1_2
    .word R_Satella_1_3
    .word R_Satella_1_4


_ts R_Satella_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806d5b2
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0806d5b2:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0806d5c4
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d5c4:
    pop        {pc}


_nt R_Satella_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Satella_1_2_0_0806d5e8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0806d5e4
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0806d5e4:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Satella_1_2_0_0806d5e8:
    .word PTR_R_Satella_1_2_0_0806d5ec

PTR_R_Satella_1_2_0_0806d5ec:
    .word R_Satella_1_2_0
    .word R_Satella_1_2_1


_ts R_Satella_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Satella_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d616
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d616:
    pop        {pc}


_ts R_Satella_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Satella_1_3_0_0806d628
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Satella_1_3_0_0806d628:
    .word PTR_R_Satella_1_3_0_0806d62c

PTR_R_Satella_1_3_0_0806d62c:
    .word R_Satella_1_3_0
    .word R_Satella_1_3_1
    .word R_Satella_1_3_2
    .word R_Satella_1_3_3
    .word R_Satella_1_3_4


_ts R_Satella_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Satella_1_3_1
    push       {lr}
    ldr        r0,[r5,#0x30]
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d66c
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806d66c:
    pop        {pc}


_nt R_Satella_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d6a2
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x68]
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x6]
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_0806d6a4
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    mov        r0,#0xc
    strh       r0,[r5,#0xa]
LAB_0806d6a2:
    pop        {pc}

DAT_0806d6a4:
    .word 0x10B0000


_ts R_Satella_1_3_3
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d71a
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldrb       r0,[r5,#0x1a]
    ldrh       r6,[r5,#0x24]
    ldr        r4,DAT_0806d71c
    mov        r7,#0x1
    push       {r1,r2,r3}
    bl         Attack_SharpStrike_Create
    pop        {r1,r2,r3}
    mov        r4,#0x2d
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    lsl        r0,r0,#0x7
    add        r4,r4,r0
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0xe0
    bl         Sound_PlaySongImmediate
    ldr        r7,[r5,#0x68]
    ldrh       r0,[r7,#0x18]
    strh       r0,[r5,#0x6]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806d71a
    mov        r0,#0x10
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0806d71a
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
    bl         R_Actor_ClearCurrentAttack
    mov        r0,#0x10
    strh       r0,[r5,#0xa]
LAB_0806d71a:
    pop        {pc}

DAT_0806d71c:
    .word 0x100FF


_ts R_Satella_1_3_4
    push       {lr}
    ldr        r0,[r5,#0x30]
    mov        r1,#0x1
    lsl        r1,r1,#0x10
    sub        r0,r0,r1
    str        r0,[r5,#0x30]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d73c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d73c:
    pop        {pc}


_nt R_Satella_1_4
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Satella_1_4_0_0806d74c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Satella_1_4_0_0806d74c:
    .word PTR_R_Satella_1_4_0_0806d750

PTR_R_Satella_1_4_0_0806d750:
    .word R_Satella_1_4_0
    .word R_Satella_1_4_1


_ts R_Satella_1_4_0
    push       {lr}
    mov        r0,#0x68
    add        r0,r0,r5
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    ldrb       r7,[r5,#0x16]
    bl         Attack_LockonTarget_Create
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Satella_1_4_1
    push       {lr}
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0806d78a
    ldrb       r0,[r7,#0x6]
    tst        r0,r0
    beq        LAB_0806d788
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806d788:
    pop        {pc}
LAB_0806d78a:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Satella_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Satella_2_0_Delete_0806d7a4
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Satella_2_0_Delete_0806d7a4:
    .word PTR_R_Satella_2_0_Delete_0806d7a8

PTR_R_Satella_2_0_Delete_0806d7a8:
    .word R_Satella_2_0_Delete
    .word R_Satella_2_1_Free


_ts R_Satella_2_0_Delete
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_0806d7d8
    mov        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_0806d7d8:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_nt R_Satella_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806d7fa
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         R_Actor_ClearCurrentAttack
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806d7fa:
    pop        {pc}


_ts R_Satella_CheckDamage
    push       {lr}
    bl         Battle_IsInputLocked
    bne        LAB_0806d854
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    ble        LAB_0806d836
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806d836
    mov        r0,#0xa
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0806d854
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_0806d854
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806d84e
LAB_0806d836:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_0806d84e:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0806d854:
    mov        r0,#0x0
    pop        {pc}
