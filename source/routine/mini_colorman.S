#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listMiniColorManSpec:
    .byte 0x68
    .byte 0x01
    .byte 0x02
    .byte 0x00
    .byte 0x68
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x0E
    .byte 0x01
    .byte 0x02
    .byte 0x00
    .byte 0x0E
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0xB4
    .byte 0x00
    .byte 0x02
    .byte 0x00
    .byte 0xB4
    .byte 0x00
    .byte 0x00
    .byte 0x00


_ts Routine_MiniColorMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_MiniColorMan_0_Init_080639fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MiniColorMan_0_Init_080639fc:
    .word PTR_R_MiniColorMan_0_Init_08063a00

PTR_R_MiniColorMan_0_Init_08063a00:
    .word R_MiniColorMan_0_Init
    .word R_MiniColorMan_1_Main
    .word R_MiniColorMan_2_Free


_ts R_MiniColorMan_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xa5
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x4]
    lsl        r1,r0,#0x2
    ldr        r7,PTR_listMiniColorManSpec_08063a8c
    add        r7,r7,r1
    str        r7,[r5,#0x64]
    lsl        r0,r0,#0x1f
    lsr        r0,r0,#0x1f
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0xc0
    lsl        r0,r0,#0x8
    str        r0,[r5,#0x48]
    mov        r0,#0x1d
    mov        r3,#0x68
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0xf
    mov        r3,#0x6c
    add        r1,r5,r3
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    bl         R_MiniColorMan_1_Main
    ldr        r0,[r5,#0x68]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

PTR_listMiniColorManSpec_08063a8c:
    .word listMiniColorManSpec


_ts R_MiniColorMan_1_Main
    push       {lr}
    bl         SpritePtr_DisableFlash
    ldr        r0,[r5,#0x68]
    bl         FieldObject_DisableIfDeleted
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08063abc
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}
LAB_08063abc:
    bl         R_MiniColorMan_CheckLive
    tst        r0,r0
    bne        LAB_08063ace
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08063adc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08063ace:
    ldr        r0,[r5,#0x68]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Actor_1_0_Spawn_08063adc:
    .word PTR_R_Actor_1_0_Spawn_08063ae0

PTR_R_Actor_1_0_Spawn_08063ae0:
    .word R_Actor_1_0_Spawn
    .word R_MiniColorMan_1_1_Register
    .word R_MiniColorMan_1_2_Wait
    .word R_MiniColorMan_1_3_Move
    .word R_MiniColorMan_1_4_PrepareAttack
    .word R_MiniColorMan_1_5_Tower


_ts R_MiniColorMan_1_1_Register
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08063b12
    bl         Battle_RemoveFromEnemyList
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08063b12:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08063b24
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063b24:
    pop        {pc}


_nt R_MiniColorMan_1_2_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MiniColorMan_1_2_0_Wait_08063b48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08063b44
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_08063b44:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MiniColorMan_1_2_0_Wait_08063b48:
    .word PTR_R_MiniColorMan_1_2_0_Wait_08063b4c

PTR_R_MiniColorMan_1_2_0_Wait_08063b4c:
    .word R_MiniColorMan_1_2_0_Wait
    .word R_MiniColorMan_1_2_1_Next


_ts R_MiniColorMan_1_2_0_Wait
    push       {lr}
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_MiniColorMan_1_2_1_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063b78
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08063b78:
    pop        {pc}


_nt R_MiniColorMan_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MiniColorMan_1_3_0_StartMove_08063b88
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_MiniColorMan_1_3_0_StartMove_08063b88:
    .word PTR_R_MiniColorMan_1_3_0_StartMove_08063b8c

PTR_R_MiniColorMan_1_3_0_StartMove_08063b8c:
    .word R_MiniColorMan_1_3_0_StartMove
    .word R_MiniColorMan_1_3_1_EndMove


_ts R_MiniColorMan_1_3_0_StartMove
    push       {lr}
    ldr        r0,[r5,#0x48]
    mov        r6,#0x2
LAB_08063b9a:
    lsr        r1,r0,#0x1f
    lsl        r1,r1,#0x1
    neg        r1,r1
    add        r1,#0x1
    ldrb       r0,[r5,#0x19]
    add        r1,r1,r0
    ldrb       r0,[r5,#0x18]
    ldr        r7,[r5,#0x6c]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x5]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    push       {r6}
    bl         Field_GetPanelFlags
    pop        {r6}
    ldr        r1,PanelFlag_08063bec
    tst        r0,r1
    bne        LAB_08063bc8
    ldr        r1,PanelFlag_08063be8
    and        r0,r1
    cmp        r0,r1
    beq        LAB_08063bd8
LAB_08063bc8:
    ldr        r0,[r5,#0x48]
    neg        r0,r0
    str        r0,[r5,#0x48]
    sub        r6,#0x1
    bne        LAB_08063b9a
    bl         R_MiniColorMan_Decide
    pop        {pc}
LAB_08063bd8:
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Enable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

PanelFlag_08063be8:
    .word PF_Walkable | PF_EnemyTerritory

PanelFlag_08063bec:
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid


_ts R_MiniColorMan_1_3_1_EndMove
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    beq        LAB_08063c0e
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    str        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    pop        {pc}
LAB_08063c0e:
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    bl         R_MiniColorMan_Decide
    pop        {pc}


_nt R_MiniColorMan_1_4_PrepareAttack
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1f
    lsr        r0,r0,#0x1f
    add        r0,#0x1
    bl         Battle_SetBattleFlag
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MiniColorMan_1_4_0_08063c40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_MiniColorMan_1_4_0_08063c40:
    .word PTR_R_MiniColorMan_1_4_0_08063c44

PTR_R_MiniColorMan_1_4_0_08063c44:
    .word R_MiniColorMan_1_4_0
    .word R_MiniColorMan_1_4_1
    .word R_MiniColorMan_1_4_2


_ts R_MiniColorMan_1_4_0
    push       {lr}
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_MiniColorMan_1_4_1
    push       {lr}
    mov        r0,#0x3
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08063c74
    ldr        r7,[r5,#0x64]
    ldrh       r0,[r7,#0x0]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063c74:
    pop        {pc}


_nt R_MiniColorMan_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063c84
    bl         R_MiniColorMan_Decide
LAB_08063c84:
    pop        {pc}


_nt R_MiniColorMan_1_5_Tower
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_MiniColorMan_1_5_0_Delay_08063c94
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_MiniColorMan_1_5_0_Delay_08063c94:
    .word PTR_R_MiniColorMan_1_5_0_Delay_08063c98

PTR_R_MiniColorMan_1_5_0_Delay_08063c98:
    .word R_MiniColorMan_1_5_0_Delay
    .word R_MiniColorMan_1_5_1_Tower
    .word R_MiniColorMan_1_5_2_Next


_ts R_MiniColorMan_1_5_0_Delay
    push       {lr}
    mov        r0,#0x5
    bl         Battle_SetBattleFlag
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_MiniColorMan_1_5_1_Tower
    push       {lr}
    LoadMain frameCounter, r7, r7
    ldrh       r0,[r7,#0x0]
    lsr        r0,r0,#0x2
    bcc        LAB_08063cc6
    bl         SpritePtr_EnableFlash
LAB_08063cc6:
    mov        r0,#0x5
    bl         Battle_SetBattleFlag
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063cfc
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    LoadMain battle, r7, r7
    ldr        r2,[r7,#0x40]
    add        r2,#0x2c
    ldr        r7,[r5,#0x64]
    ldrb       r4,[r7,#0x2]
    mov        r6,#0x64
    ldrb       r3,[r5,#0x1a]
    bl         Attack_Tower_Create
    bl         Rng_RandomUint
    lsl        r0,r0,#0x1b
    lsr        r0,r0,#0x1b
    add        r0,#0xb4
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_08063cfc:
    pop        {pc}


_nt R_MiniColorMan_1_5_2_Next
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063d0e
    bl         R_MiniColorMan_Decide
    pop        {pc}
LAB_08063d0e:
    mov        r0,#0x5
    bl         Battle_SetBattleFlag
    pop        {pc}


_nt R_MiniColorMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_MiniColorMan_2_0_Delete_08063d24
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_MiniColorMan_2_0_Delete_08063d24:
    .word PTR_R_MiniColorMan_2_0_Delete_08063d28

PTR_R_MiniColorMan_2_0_Delete_08063d28:
    .word R_MiniColorMan_2_0_Delete
    .word R_MiniColorMan_2_1_Free


_ts R_MiniColorMan_2_0_Delete
    push       {lr}
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Disable
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Disable
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_NaviDelete_Create
    pop        {r5}
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_nt R_MiniColorMan_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08063d6c
    ldr        r0,[r5,#0x68]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x6c]
    bl         FieldObject_Free
    bl         Actor_Free
LAB_08063d6c:
    pop        {pc}


_nt R_MiniColorMan_CheckLive
    push       {lr}
    mov        r0,#0x4
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08063d88
    ldr        r0,[r5,#0x68]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08063d88:
    mov        r0,#0x0
    pop        {pc}


_ts R_MiniColorMan_Decide
    push       {lr}
    mov        r0,#0x0
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    beq        LAB_08063da2
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08063da2:
    LoadMain battle, r7, r7
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x19]
    ldrb       r1,[r5,#0x19]
    cmp        r0,r1
    bne        LAB_08063dca
    mov        r0,#0x5
    bl         Battle_GetBattleFlagCurrent
    tst        r0,r0
    bne        LAB_08063dca
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x5
    bl         Battle_SetBattleFlag
    pop        {pc}
LAB_08063dca:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
