#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Puffy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Puffy_0_Init_0805e098
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Puffy_0_Init_0805e098:
    .word PTR_R_Puffy_0_Init_0805e09c

PTR_R_Puffy_0_Init_0805e09c:
    .word R_Puffy_0_Init
    .word R_Puffy_1_Main
    .word R_Puffy_2_Free


_ts R_Puffy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x27
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x0
    strh       r0,[r5,#0x1e]
    str        r0,[r5,#0x5c]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Puffy_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805e176
    bl         Battle_IsInputLocked
    bne        LAB_0805e176
    bl         Routine_CheckPoisonDrain
    bl         SpritePtr_ResetPalette
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,DAT_0805e1bc
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
    tst        r0,r0
    beq        LAB_0805e176
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805e176:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Puffy_1_0_Spawn_0805e1a8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805e1a4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_0805e1a4:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Puffy_1_0_Spawn_0805e1a8:
    .word PTR_R_Puffy_1_0_Spawn_0805e1ac

PTR_R_Puffy_1_0_Spawn_0805e1ac:
    .word R_Puffy_1_0_Spawn
    .word R_Puffy_1_1_Wait
    .word R_Puffy_1_2_Idle
    .word R_Puffy_1_3_Bubbler

DAT_0805e1bc:
    .word 0x28850


_ts R_Puffy_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Puffy_1_0_0_0805e1dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Puffy_1_0_0_0805e1d0:
    .word R_Puffy_1_0_0
    .word R_Puffy_1_0_1
    .word R_Puffy_1_0_2

PTR_PTR_R_Puffy_1_0_0_0805e1dc:
    .word PTR_R_Puffy_1_0_0_0805e1d0


_ts R_Puffy_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805e1f2
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805e1f2:
    pop        {pc}


_ts R_Puffy_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805e206
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805e206:
    pop        {pc}


_ts R_Puffy_1_0_2
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805e21c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e21c:
    pop        {pc}


_nt R_Puffy_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805e238
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805e238:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805e24a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e24a:
    pop        {pc}


_ts R_Puffy_1_2_Idle
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Puffy_1_2_0_Next_0805e274
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805e26a
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805e26a:
    pop        {pc}

PTR_R_Puffy_1_2_0_Next_0805e26c:
    .word R_Puffy_1_2_0_Next
    .word R_Puffy_1_2_1_ReadyAttack

PTR_PTR_R_Puffy_1_2_0_Next_0805e274:
    .word PTR_R_Puffy_1_2_0_Next_0805e26c


_ts R_Puffy_1_2_0_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Puffy_1_2_1_ReadyAttack
    pop        {pc}


_ts R_Puffy_1_2_1_ReadyAttack
    push       {lr}
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805e298
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_0805e298
    b          LAB_0805e2a0
LAB_0805e298:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e2a0:
    pop        {pc}


_nt R_Puffy_1_3_Bubbler
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Puffy_1_3_0_StartAnim_0805e2b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Puffy_1_3_0_StartAnim_0805e2b0:
    .word R_Puffy_1_3_0_StartAnim
    .word R_Puffy_1_3_1_Bubbler

PTR_PTR_R_Puffy_1_3_0_StartAnim_0805e2b8:
    .word PTR_R_Puffy_1_3_0_StartAnim_0805e2b0


_ts R_Puffy_1_3_0_StartAnim
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x12
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Puffy_1_3_1_Bubbler
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e2f6
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r3,#0x5c
    add        r3,r3,r5
    ldrb       r4,[r5,#0x4]
    mov        r6,#0x1e
    bl         Attack_PuffyBubble_Create
    tst        r0,r0
    beq        LAB_0805e2ee
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x1a]
LAB_0805e2ee:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805e2f6:
    pop        {pc}


_ts R_Puffy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Puffy_2_0_Delete_0805e310
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Puffy_2_0_Delete_0805e308:
    .word R_Puffy_2_0_Delete
    .word R_Puffy_2_1_Free

PTR_PTR_R_Puffy_2_0_Delete_0805e310:
    .word PTR_R_Puffy_2_0_Delete_0805e308


_ts R_Puffy_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Puffy_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805e34e
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805e34e:
    pop        {pc}
