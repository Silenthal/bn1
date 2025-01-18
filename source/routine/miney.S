#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Miney
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Miney_0_Init_08065088
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Miney_0_Init_08065088:
    .word PTR_R_Miney_0_Init_0806508c

PTR_R_Miney_0_Init_0806508c:
    .word R_Miney_0_Init
    .word R_Miney_1_Main
    .word R_Miney_2_Free


_ts R_Miney_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x43
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    strb       r0,[r5,#0xc]
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x4
    lsl        r1,r1,#0x8
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r0,#0x6]
    mov        r1,#0x0
    strh       r1,[r0,#0x8]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    str        r0,[r5,#0x48]
    strb       r0,[r5,#0x1b]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Miney_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08065170
    bl         Battle_IsInputLocked
    bne        LAB_08065170
    bl         Routine_CheckPoisonDrain
    ldrb       r0,[r5,#0x16]
    bl         Battle_GetBattleFlagBuffer
    beq        LAB_0806513c
    mov        r0,#0x0
    str        r0,[r5,#0xc]
LAB_0806513c:
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_080651cc
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
    beq        LAB_08065170
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08065170:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_080651b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08065190
    mov        r0,#0x9
    b          LAB_08065192
LAB_08065190:
    mov        r0,#0xf
LAB_08065192:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_080651b0
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_080651b0:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_080651b4:
    .word PTR_R_Actor_1_0_Spawn_080651b8

PTR_R_Actor_1_0_Spawn_080651b8:
    .word R_Actor_1_0_Spawn
    .word R_Miney_1_1_Wait
    .word R_Miney_1_2_Decide
    .word R_Miney_1_3_Mine
    .word R_Miney_1_4_Steal

PanelFlag_080651cc:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Miney_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080651f2
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_080651f2:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08065204
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065204:
    pop        {pc}


_nt R_Miney_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Miney_1_2_0_Wait_08065230
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08065224
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08065224:
    pop        {pc}

    .align 2, 0


PTR_R_Miney_1_2_0_Wait_08065228:
    .word R_Miney_1_2_0_Wait
    .word R_Miney_1_2_1_Decide

PTR_PTR_R_Miney_1_2_0_Wait_08065230:
    .word PTR_R_Miney_1_2_0_Wait_08065228


_ts R_Miney_1_2_0_Wait
    push       {lr}
    ldr        r7,PTR_USHORT_ARRAY_08065248
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


PTR_USHORT_ARRAY_08065248:
    .word USHORT_ARRAY_0806524c

USHORT_ARRAY_0806524c:
    .short 0x168
    .short 0x12C
    .short 0xF0


_nt R_Miney_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065286
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    bne        LAB_08065270
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
LAB_08065266:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08065286
LAB_08065270:
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08065266
    sub        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08065286:
    pop        {pc}


_ts R_Miney_1_3_Mine
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Miney_1_3_0_StartAnim_080652ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Miney_1_3_0_StartAnim_08065298:
    .word R_Miney_1_3_0_StartAnim
    .word R_Miney_1_3_1_GoUnder
    .word R_Miney_1_3_2_Mine
    .word R_Miney_1_3_3_Reappear
    .word R_Miney_1_3_4_Next

PTR_PTR_R_Miney_1_3_0_StartAnim_080652ac:
    .word PTR_R_Miney_1_3_0_StartAnim_08065298


_ts R_Miney_1_3_0_StartAnim
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Miney_1_3_1_GoUnder
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080652d0
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_080652d0:
    pop        {pc}


_nt R_Miney_1_3_2_Mine
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080652f2
    mov        r0,#0x15
    ldrb       r1,[r5,#0x4]
    add        r1,#0x3
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
LAB_080652f2:
    pop        {pc}


_ts R_Miney_1_3_3_Reappear
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08065306
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strb       r0,[r5,#0xa]
LAB_08065306:
    pop        {pc}


_ts R_Miney_1_3_4_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806531c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806531c:
    pop        {pc}


_nt R_Miney_1_4_Steal
    push       {lr}
    mov        r0,#0x2
    mov        r1,#0x2
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_ts R_Miney_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Miney_2_0_Delete_0806534c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Miney_2_0_Delete_08065344:
    .word R_Miney_2_0_Delete
    .word R_Miney_2_1_Free

PTR_PTR_R_Miney_2_0_Delete_0806534c:
    .word PTR_R_Miney_2_0_Delete_08065344


_ts R_Miney_2_0_Delete
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


_ts R_Miney_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806538a
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806538a:
    pop        {pc}
