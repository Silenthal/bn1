#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Cloudy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Cloudy_0_Init_0805eedc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Cloudy_0_Init_0805eedc:
    .word PTR_R_Cloudy_0_Init_0805eee0

PTR_R_Cloudy_0_Init_0805eee0:
    .word R_Cloudy_0_Init
    .word R_Cloudy_1_Main
    .word R_Cloudy_2_Free


_ts R_Cloudy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3c
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
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r0,#0x8]
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
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_0805ef5c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_0805ef5c:
    bl         R_Cloudy_1_Main
    pop        {pc}


_nt R_Cloudy_1_Main
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
    beq        LAB_0805efc0
    bl         Battle_IsInputLocked
    bne        LAB_0805efc0
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0805f018
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
    beq        LAB_0805efc0
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805efc0:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Cloudy_1_0_Spawn_0805f004
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805efe0
    mov        r0,#0x9
    b          LAB_0805efe2
LAB_0805efe0:
    mov        r0,#0xf
LAB_0805efe2:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805f000
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
LAB_0805f000:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Cloudy_1_0_Spawn_0805f004:
    .word PTR_R_Cloudy_1_0_Spawn_0805f008

PTR_R_Cloudy_1_0_Spawn_0805f008:
    .word R_Cloudy_1_0_Spawn
    .word R_Cloudy_1_1_Wait
    .word R_Cloudy_1_2_Decide
    .word R_Cloudy_1_3_Act

PanelFlag_0805f018:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Cloudy_1_0_Spawn
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Cloudy_1_0_0_0805f044
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_0_0_0805f034:
    .word R_Cloudy_1_0_0
    .word R_Cloudy_1_0_1
    .word R_Cloudy_1_0_2
    .word R_Cloudy_1_0_3

PTR_PTR_R_Cloudy_1_0_0_0805f044:
    .word PTR_R_Cloudy_1_0_0_0805f034


_ts R_Cloudy_1_0_0
    push       {lr}
    bl         Battle_PriorityQueueIsEntityNext
    tst        r0,r0
    beq        LAB_0805f05a
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         ResetBattleSpawnAnimationState
LAB_0805f05a:
    pop        {pc}


_ts R_Cloudy_1_0_1
    push       {lr}
    bl         BattleSpawnAnimation_Main
    tst        r0,r0
    bne        LAB_0805f06e
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_0805f06e:
    pop        {pc}


_ts R_Cloudy_1_0_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805f082
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    bl         Battle_PriorityQueueRemove
LAB_0805f082:
    pop        {pc}


_ts R_Cloudy_1_0_3
    push       {lr}
    bl         Battle_GetEntryState
    mov        r1,#0x8
    tst        r0,r1
    bne        LAB_0805f098
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805f098:
    pop        {pc}


_nt R_Cloudy_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805f0b4
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805f0b4:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805f0c6
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805f0c6:
    pop        {pc}


_ts R_Cloudy_1_2_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Cloudy_1_2_0_Next_0805f0f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805f0ec
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805f0ec:
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_2_0_Next_0805f0f0:
    .word R_Cloudy_1_2_0_Next
    .word R_Cloudy_1_2_1_Decide

PTR_PTR_R_Cloudy_1_2_0_Next_0805f0f8:
    .word PTR_R_Cloudy_1_2_0_Next_0805f0f0


_ts R_Cloudy_1_2_0_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Cloudy_1_2_1_Decide
    pop        {pc}


_ts R_Cloudy_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    cmp        r0,#0x3c
    blt        LAB_0805f132
    bl         R_Cloudy_GetPlayerX
    cmp        r0,#0xff
    beq        LAB_0805f146
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         R_Cloudy_SetBattleFlag
    b          LAB_0805f146
LAB_0805f132:
    bl         R_Cloudy_IsTargetInRow
    tst        r0,r0
    beq        LAB_0805f146
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805f146:
    pop        {pc}


_ts R_Cloudy_1_3_Act
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Cloudy_1_3_0_Rise_0805f174
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x1
    bne        LAB_0805f164
    bl         R_Cloudy_SetBattleFlag
LAB_0805f164:
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_3_0_Rise_0805f168:
    .word R_Cloudy_1_3_0_Rise
    .word R_Cloudy_1_3_1_Fall
    .word R_Cloudy_1_3_2_Cloud

PTR_PTR_R_Cloudy_1_3_0_Rise_0805f174:
    .word PTR_R_Cloudy_1_3_0_Rise_0805f168


_ts R_Cloudy_1_3_0_Rise
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Cloudy_1_3_0_0_StartAnim_0805f194
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_3_0_0_StartAnim_0805f188:
    .word R_Cloudy_1_3_0_0_StartAnim
    .word R_Cloudy_1_3_0_1_Rise
    .word R_Cloudy_1_3_0_2_Next

PTR_PTR_R_Cloudy_1_3_0_0_StartAnim_0805f194:
    .word PTR_R_Cloudy_1_3_0_0_StartAnim_0805f188


_ts R_Cloudy_1_3_0_0_StartAnim
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0xb
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    pop        {pc}


_ts R_Cloudy_1_3_0_1_Rise
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805f1be
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0805f1be:
    ldr        r0,[r5,#0x30]
    mov        r1,#0x4
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    pop        {pc}


_nt R_Cloudy_1_3_0_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805f1e2
    mov        r1,#0x4
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0805f1e0
    mov        r1,#0x8
LAB_0805f1e0:
    strh       r1,[r5,#0xa]
LAB_0805f1e2:
    pop        {pc}


_ts R_Cloudy_1_3_1_Fall
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Cloudy_1_3_1_0_StartAnim_0805f20c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x1
    ldrh       r1,[r5,#0x32]
    cmp        r1,#0x23
    bmi        LAB_0805f1fa
    mov        r0,#0x0
LAB_0805f1fa:
    strb       r0,[r5,#0x17]
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_3_1_0_StartAnim_0805f200:
    .word R_Cloudy_1_3_1_0_StartAnim
    .word R_Cloudy_1_3_1_1_Fall
    .word R_Cloudy_1_3_1_2_Next

PTR_PTR_R_Cloudy_1_3_1_0_StartAnim_0805f20c:
    .word PTR_R_Cloudy_1_3_1_0_StartAnim_0805f200


_ts R_Cloudy_1_3_1_0_StartAnim
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}


_ts R_Cloudy_1_3_1_1_Fall
    push       {lr}
    ldr        r0,[r5,#0x30]
    mov        r1,#0x8
    lsl        r1,r1,#0xc
    sub        r0,r0,r1
    bgt        LAB_0805f232
    mov        r0,#0x9
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
LAB_0805f232:
    str        r0,[r5,#0x30]
    pop        {pc}


_nt R_Cloudy_1_3_1_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805f24a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805f24a:
    pop        {pc}


_ts R_Cloudy_1_3_2_Cloud
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Cloudy_1_3_2_0_StartAnim_0805f26c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_1_3_2_0_StartAnim_0805f25c:
    .word R_Cloudy_1_3_2_0_StartAnim
    .word R_Cloudy_1_3_2_1_Cloud
    .word R_Cloudy_1_3_2_2_EndAnim
    .word R_Cloudy_1_3_2_3_Next

PTR_PTR_R_Cloudy_1_3_2_0_StartAnim_0805f26c:
    .word PTR_R_Cloudy_1_3_2_0_StartAnim_0805f25c


_ts R_Cloudy_1_3_2_0_StartAnim
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x9
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts R_Cloudy_1_3_2_1_Cloud
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805f2ac
    ldrb       r0,[r5,#0x16]
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    ldrb       r3,[r5,#0x4]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_DAT_0805f2b4
    ldr        r3,[r7,r3]
    ldrh       r4,[r5,#0x6]
    lsl        r4,r4,#0x10
    ldr        r7,PTR_listCloudyCloudDamage_0805f2c4
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    mov        r7,#0x0
    bl         Attack_Cloudy_Create
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_0805f2ac:
    pop        {pc}

listCloudyCloudDamage:
    .byte 0x1E
    .byte 0x50
    .byte 0x78

    .align 2, 0


PTR_DAT_0805f2b4:
    .word DAT_0805f2b8

DAT_0805f2b8:
    .byte 0xCC
    .byte 0x4C
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x00
    .byte 0x33
    .byte 0xB3

    .align 2, 0


PTR_listCloudyCloudDamage_0805f2c4:
    .word listCloudyCloudDamage


_ts R_Cloudy_1_3_2_2_EndAnim
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805f2dc
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0xb]
LAB_0805f2dc:
    pop        {pc}


_nt R_Cloudy_1_3_2_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0805f2ee
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_0805f2ee:
    pop        {pc}


_ts R_Cloudy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Cloudy_2_0_0805f308
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Cloudy_2_0_0805f300:
    .word R_Cloudy_2_0
    .word R_Cloudy_2_1

PTR_PTR_R_Cloudy_2_0_0805f308:
    .word PTR_R_Cloudy_2_0_0805f300


_ts R_Cloudy_2_0
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


_ts R_Cloudy_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805f346
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0805f346:
    pop        {pc}


_ts R_Cloudy_GetPlayerX
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    push       {r0}
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    and        r0,r1
    lsr        r0,r0,#0x1
    ldrb       r1,[r7,#0x16]
    eor        r1,r0
    pop        {r0}
    bne        LAB_0805f37e
    mov        r1,#0x9
    add        r0,r0,r1
    push       {r7}
    bl         Battle_GetBattleFlagCurrent
    pop        {r7}
    tst        r0,r0
    bne        LAB_0805f37e
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r5,#0x19]
    b          LAB_0805f380
LAB_0805f37e:
    mov        r0,#0xff
LAB_0805f380:
    pop        {pc}


_nt R_Cloudy_IsTargetInRow
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
LAB_0805f388:
    push       {r0,r1}
    bl         Field_GetPanelFlags
    mov        r1,#0x40
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_0805f39a
    mov        r0,#0x1
    b          LAB_0805f3a0
LAB_0805f39a:
    sub        r0,#0x1
    bne        LAB_0805f388
    mov        r0,#0x0
LAB_0805f3a0:
    pop        {pc}


_nt R_Cloudy_SetBattleFlag
    push       {lr}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x9
    bl         Battle_SetBattleFlag
    pop        {pc}

    .align 2, 0

