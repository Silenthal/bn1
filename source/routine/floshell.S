#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Floshell
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Floshell_0_Init_0805fda8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Floshell_0_Init_0805fda8:
    .word PTR_R_Floshell_0_Init_0805fdac

PTR_R_Floshell_0_Init_0805fdac:
    .word R_Floshell_0_Init
    .word R_Floshell_1_Main
    .word R_Floshell_2_Free


_ts R_Floshell_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x3f
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x7
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
    strb       r0,[r5,#0x1b]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0x7]
    bl         SpritePtr_ObjModeSemiTransparent
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    mov        r1,#0x1e
    strb       r1,[r7,#0x8]
    bl         FieldObject_Alloc
    str        r0,[r5,#0x64]
    mov        r1,#0x1e
    strh       r1,[r0,#0x8]
    mov        r1,#0x0
    str        r1,[r0,#0x14]
    mov        r1,#0x0
    strb       r1,[r0,#0x6]
    mov        r1,#0x82
    lsl        r1,r1,#0x4
    str        r1,[r0,#0xc]
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    strb       r1,[r0,#0x2]
    strb       r1,[r0,#0x4]
    ldrb       r1,[r5,#0x19]
    strb       r1,[r0,#0x3]
    strb       r1,[r0,#0x5]
    bl         R_Floshell_SetShieldHealth
    bl         R_FloShell_SetShieldTimer
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         Attack_FloshellShield_Create
    str        r0,[r5,#0x5c]
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    pop        {pc}


_ts R_Floshell_1_Main
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
    beq        LAB_0805fea2
    bl         Battle_IsInputLocked
    bne        LAB_0805fea2
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_0805ff08
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
    beq        LAB_0805fea2
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_0805fea2:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0805fee4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0805fec2
    mov        r0,#0x9
    b          LAB_0805fec4
LAB_0805fec2:
    mov        r0,#0xf
LAB_0805fec4:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0805fee2
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0805fee2:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0805fee4:
    .word PTR_R_Actor_1_0_Spawn_0805fee8

PTR_R_Actor_1_0_Spawn_0805fee8:
    .word R_Actor_1_0_Spawn
    .word R_Floshell_1_1_Wait
    .word R_Floshell_1_2_Decide
    .word R_Floshell_1_3_RaiseShield
    .word R_Floshell_1_4_DropShield
    .word R_Floshell_1_5_MiniBomb_ShieldDown
    .word R_Floshell_1_6_MiniBomb_ShieldUp
    .word R_Floshell_1_7

PanelFlag_0805ff08:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Floshell_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0805ff38
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805ff2a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805ff2a:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0805ff38:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0805ff4a
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ff4a:
    pop        {pc}


_ts R_Floshell_1_2_Decide
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_2_0_Next_0805ff78
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805ff6e
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805ff6e:
    pop        {pc}

PTR_R_Floshell_1_2_0_Next_0805ff70:
    .word R_Floshell_1_2_0_Next
    .word R_Floshell_1_2_1_Decide

PTR_PTR_R_Floshell_1_2_0_Next_0805ff78:
    .word PTR_R_Floshell_1_2_0_Next_0805ff70


_ts R_Floshell_1_2_0_Next
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0805ff8a
    strb       r0,[r7,#0x14]
LAB_0805ff8a:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         R_Floshell_1_2_1_Decide
    pop        {pc}


_ts R_Floshell_1_2_1_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    mov        r1,#0x80
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_0805ffae
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0805ffcc
LAB_0805ffae:
    ldr        r0,[r5,#0x68]
    tst        r0,r0
    bgt        LAB_0805ffbe
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0805ffcc
LAB_0805ffbe:
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_0805ffcc
    mov        r0,#0x1c
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0805ffcc:
    pop        {pc}


_nt R_Floshell_1_3_RaiseShield
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_3_0_StartAnim_08060000
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0805fff0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_0805fff0:
    pop        {pc}

    .align 2, 0


PTR_R_Floshell_1_3_0_StartAnim_0805fff4:
    .word R_Floshell_1_3_0_StartAnim
    .word R_Floshell_1_3_1_RaiseShield
    .word R_Floshell_1_3_2_Decide

PTR_PTR_R_Floshell_1_3_0_StartAnim_08060000:
    .word PTR_R_Floshell_1_3_0_StartAnim_0805fff4


_ts R_Floshell_1_3_0_StartAnim
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08060012
    strb       r0,[r7,#0x14]
LAB_08060012:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Floshell_1_3_1_RaiseShield
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0806003c
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08060030
    strb       r0,[r7,#0x14]
LAB_08060030:
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1c]
LAB_0806003c:
    pop        {pc}


_nt R_Floshell_1_3_2_Decide
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bgt        LAB_08060052
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08060062
LAB_08060052:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08060062
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08060062:
    pop        {pc}


_ts R_Floshell_1_4_DropShield
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_4_0_DropShield_08060080
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Floshell_1_4_0_DropShield_08060078:
    .word R_Floshell_1_4_0_DropShield
    .word R_Floshell_1_4_1_SetShieldHealth

PTR_PTR_R_Floshell_1_4_0_DropShield_08060080:
    .word PTR_R_Floshell_1_4_0_DropShield_08060078


_ts R_Floshell_1_4_0_DropShield
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08060092
    strb       r0,[r7,#0x14]
LAB_08060092:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Floshell_1_4_1_SetShieldHealth
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080600b4
    bl         R_Floshell_SetShieldHealth
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
LAB_080600b4:
    pop        {pc}


_nt R_Floshell_1_5_MiniBomb_ShieldDown
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_5_0_StartAnim_080600d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Floshell_1_5_0_StartAnim_080600c8:
    .word R_Floshell_1_5_0_StartAnim
    .word R_Floshell_1_5_1_MiniBomb
    .word R_Floshell_1_5_2_Next

PTR_PTR_R_Floshell_1_5_0_StartAnim_080600d4:
    .word PTR_R_Floshell_1_5_0_StartAnim_080600c8


_ts R_Floshell_1_5_0_StartAnim
    push       {lr}
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_080600e6
    strb       r0,[r7,#0x14]
LAB_080600e6:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Floshell_1_5_1_MiniBomb
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x20
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x81
    bl         Sound_PlaySongImmediate
    bl         R_Floshell_LaunchMiniBomb
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_Floshell_1_5_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08060126
    bl         R_FloShell_SetShieldTimer
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08060126:
    pop        {pc}


_ts R_Floshell_1_6_MiniBomb_ShieldUp
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_6_0_StartAnim_08060148
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Floshell_1_6_0_StartAnim_0806013c:
    .word R_Floshell_1_6_0_StartAnim
    .word R_Floshell_1_6_1_MiniBomb
    .word R_Floshell_1_6_2_Next

PTR_PTR_R_Floshell_1_6_0_StartAnim_08060148:
    .word PTR_R_Floshell_1_6_0_StartAnim_0806013c


_ts R_Floshell_1_6_0_StartAnim
    push       {lr}
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806015a
    strb       r0,[r7,#0x14]
LAB_0806015a:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Floshell_1_6_1_MiniBomb
    push       {lr}
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x20
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x81
    bl         Sound_PlaySongImmediate
    bl         R_Floshell_LaunchMiniBomb
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt R_Floshell_1_6_2_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080601a6
    bl         R_FloShell_SetShieldTimer
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806019e
    strb       r0,[r7,#0x14]
LAB_0806019e:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_080601a6:
    pop        {pc}


_ts R_Floshell_1_7
    push       {lr}
    bl         R_Floshell_CheckDamage
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Floshell_1_7_0_080601c8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    pop        {pc}

PTR_R_Floshell_1_7_0_080601c0:
    .word R_Floshell_1_7_0
    .word R_Floshell_1_7_1

PTR_PTR_R_Floshell_1_7_0_080601c8:
    .word PTR_R_Floshell_1_7_0_080601c0


_ts R_Floshell_1_7_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldr        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_080601da
    strb       r0,[r7,#0x14]
LAB_080601da:
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Floshell_1_7_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080601f8
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080601f8:
    pop        {pc}


_nt R_Floshell_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Floshell_2_0_Delete_08060210
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_R_Floshell_2_0_Delete_08060208:
    .word R_Floshell_2_0_Delete
    .word R_Floshell_2_1_Free

PTR_PTR_R_Floshell_2_0_Delete_08060210:
    .word PTR_R_Floshell_2_0_Delete_08060208


_ts R_Floshell_2_0_Delete
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


_ts R_Floshell_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806024e
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_0806024e:
    pop        {pc}


_ts R_Floshell_CheckDamage
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x5c]
    tst        r5,r5
    beq        LAB_0806025e
    bl         SpritePtr_ResetPalette
LAB_0806025e:
    pop        {r5}
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    beq        LAB_080602a8
    ldr        r6,[r5,#0x64]
    ldrh       r0,[r5,#0x18]
    sub        r0,#0x1
    ldr        r1,PanelFlag_080602d0
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x64]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_080602a8
    ldr        r1,[r5,#0x68]
    sub        r1,r1,r0
    str        r1,[r5,#0x68]
    push       {r5}
    ldr        r5,[r5,#0x5c]
    tst        r5,r5
    beq        LAB_0806029c
    bl         SpritePtr_SetFlashPalette
LAB_0806029c:
    pop        {r5}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
LAB_080602a8:
    ldr        r0,[r5,#0x64]
    ldrh       r1,[r0,#0x2]
    strh       r1,[r0,#0x4]
    ldrh       r1,[r5,#0x18]
    sub        r1,#0x1
    strh       r1,[r0,#0x2]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    ldr        r7,[r5,#0x64]
    ldr        r1,PanelFlag_080602cc
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    beq        LAB_080602c6
    mov        r1,#0x20
LAB_080602c6:
    str        r1,[r7,#0xc]
    pop        {pc}

    .align 2, 0


PanelFlag_080602cc:
    .word PF_Teleporting

PanelFlag_080602d0:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple


_ts R_Floshell_FindEmptyPanels
    push       {lr}
    sub        sp,#0x14
    mov        r4,sp
    add        r6,r0,#0x0
    add        r7,r1,#0x0
    push       {r4,r6,r7}
    add        r0,r4,#0x0
    mov        r1,#0x1
    mov        r2,#0x12
    bl         Field_Search
    pop        {r4,r6,r7}
    mov        r2,#0x0
    tst        r1,r1
    beq        LAB_08060312
    push       {r1,r4,r6,r7}
    add        r0,r4,#0x0
    mov        r2,#0x14
    bl         ArrayShuffle
    pop        {r1,r4,r6,r7}
    add        r2,r1,#0x0
    cmp        r1,r7
    bmi        LAB_08060306
    add        r2,r7,#0x0
LAB_08060306:
    push       {r2}
    add        r0,r4,#0x0
    add        r1,r6,#0x0
    bl         memcpy_8
    pop        {r2}
LAB_08060312:
    add        r0,r2,#0x0
    add        sp,#0x14
    pop        {pc}


_ts R_Floshell_LaunchMiniBomb
    push       {lr}
    sub        sp,#0x14
    mov        r6,sp
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x1e
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listFloshellExtraBombCount_08060380
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_08060364
    push       {r1,r2,r3,r6}
    add        r1,r0,#0x0
    add        r0,r6,#0x0
    bl         R_Floshell_FindEmptyPanels
    pop        {r1,r2,r3,r6}
    tst        r0,r0
    beq        LAB_08060364
    mov        r4,#0x0
LAB_08060346:
    push       {r0,r1,r2,r3,r4,r6}
    push       {r1,r2,r3}
    ldrb       r0,[r6,r4]
    bl         Field_IndexToCellXY
    lsl        r1,r1,#0x8
    orr        r0,r1
    lsl        r4,r0,#0x10
    pop        {r1,r2,r3}
    bl         Attack_FloshellMiniBomb_Create
    pop        {r0,r1,r2,r3,r4,r6}
    add        r4,#0x1
    cmp        r4,r0
    bmi        LAB_08060346
LAB_08060364:
    push       {r1,r2,r3}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,#0x40]
    ldrh       r4,[r7,#0x18]
    lsl        r4,r4,#0x10
    bl         Attack_FloshellMiniBomb_Create
    pop        {r1,r2,r3}
    add        sp,#0x14
    pop        {pc}

listFloshellExtraBombCount:
    .byte 0x00
    .byte 0x02
    .byte 0x04

    .align 2, 0


PTR_listFloshellExtraBombCount_08060380:
    .word listFloshellExtraBombCount


_ts R_FloShell_SetShieldTimer
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_USHORT_ARRAY_08060390
    add        r0,r0,r0
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#0x1e]
    mov        pc,lr

PTR_USHORT_ARRAY_08060390:
    .word USHORT_ARRAY_08060394

USHORT_ARRAY_08060394:
    .short 0x3C
    .short 0x5A
    .short 0x78


_nt R_Floshell_SetShieldHealth
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_listFloshellShieldHealth_080603a8
    add        r0,r0,r0
    ldrh       r0,[r7,r0]
    str        r0,[r5,#0x68]
    mov        pc,lr

    .align 2, 0


PTR_listFloshellShieldHealth_080603a8:
    .word listFloshellShieldHealth

listFloshellShieldHealth:
    .short 0x28
    .short 0x3C
    .short 0xC8

    .align 2, 0

