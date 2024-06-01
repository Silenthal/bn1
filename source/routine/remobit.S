#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_Remobit_Create, 0x807F99C+1


_ts Routine_Remobit
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Remobit_0_Init_08067020
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Remobit_0_Init_08067020:
    .word PTR_R_Remobit_0_Init_08067024

PTR_R_Remobit_0_Init_08067024:
    .word R_Remobit_0_Init
    .word R_Remobit_1_Main
    .word R_Remobit_2_Free


_ts R_Remobit_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x4b
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r7,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_nt R_Remobit_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080670dc
    bl         Battle_IsInputLocked
    bne        LAB_080670dc
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0806711c
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
    beq        LAB_080670dc
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_080670dc:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806710c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806710a
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_0806710a:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806710c:
    .word PTR_R_Actor_1_0_Spawn_08067110

PTR_R_Actor_1_0_Spawn_08067110:
    .word R_Actor_1_0_Spawn
    .word R_Remobit_1_1_Wait
    .word R_Remobit_1_2_CreateSprites

PanelFlag_0806711c:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Remobit_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08067142
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08067142:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08067158
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x6e
    strh       r0,[r5,#0x1c]
LAB_08067158:
    pop        {pc}


_nt R_Remobit_1_2_CreateSprites
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Remobit_1_2_0_08067184
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08067178
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08067178:
    pop        {pc}

    .align 2, 0


PTR_R_Remobit_1_2_0_0806717c:
    .word R_Remobit_1_2_0
    .word R_Remobit_1_2_1

PTR_PTR_R_Remobit_1_2_0_08067184:
    .word PTR_R_Remobit_1_2_0_0806717c


_ts R_Remobit_1_2_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldrb       r4,[r5,#0x4]
    ldr        r3,PTR_INT_ARRAY_080671b4
    lsl        r2,r4,#0x2
    ldr        r3,[r3,r2]
    ldr        r6,PTR_listRemobitDamage_080671c4
    lsl        r0,r4,#0x1
    ldrh       r6,[r6,r0]
    bl         Attack_Remobit_Create
    str        r0,[r5,#0x5c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    mov        r4,#0x1
    bl         Effect_Remobit_Create
    str        r0,[r5,#0x5c]
    pop        {pc}

PTR_INT_ARRAY_080671b4:
    .word INT_ARRAY_080671b8

INT_ARRAY_080671b8:
    .word 0x4CCC
    .word 0x8000
    .word 0xB333

PTR_listRemobitDamage_080671c4:
    .word listRemobitDamage

listRemobitDamage:
    .short 0x64
    .short 0x96
    .short 0xC8


_nt R_Remobit_1_2_1
    push       {lr}
    pop        {pc}


_nt R_Remobit_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Remobit_2_0_Delete_080671e8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Remobit_2_0_Delete_080671e0:
    .word R_Remobit_2_0_Delete
    .word R_Remobit_2_1_Free

PTR_PTR_R_Remobit_2_0_Delete_080671e8:
    .word PTR_R_Remobit_2_0_Delete_080671e0


_ts R_Remobit_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
    bl         Battle_RegisterVirusDelete
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDelete_Create
    add        r0,r5,#0x0
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt R_Remobit_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08067224
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_08067224:
    pop        {pc}

    .align 2, 0

