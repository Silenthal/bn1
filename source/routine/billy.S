#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_Billy
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Billy_0_Init_080665f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Billy_0_Init_080665f8:
    .word PTR_R_Billy_0_Init_080665fc

PTR_R_Billy_0_Init_080665fc:
    .word R_Billy_0_Init
    .word R_Billy_1_Main
    .word R_Billy_2_Free


_ts R_Billy_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x49
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    bl         SpritePtr_SetPaletteIndex
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
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_08066686
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_08066686:
    bl         R_Billy_1_Main
    pop        {pc}


_ts R_Billy_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         SpritePtr_DisableFlash
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_080666e4
    bl         Battle_IsInputLocked
    bne        LAB_080666e4
    bl         Routine_CheckPoisonDrain
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08066744
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
    tst        r0,r0
    beq        LAB_080666e4
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_080666e4:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08066718
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_0806672c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_0806670a
    mov        r0,#0x9
    b          LAB_0806670c
LAB_0806670a:
    mov        r0,#0xf
LAB_0806670c:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_0806672a
LAB_08066718:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_0806672a:
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_0806672c:
    .word PTR_R_Actor_1_0_Spawn_08066730

PTR_R_Actor_1_0_Spawn_08066730:
    .word R_Actor_1_0_Spawn
    .word R_Billy_1_1_Wait
    .word R_Billy_1_2_Decide
    .word R_Billy_1_3_Move
    .word R_Billy_1_4_Thunder

PanelFlag_08066744:
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_Teleporting
    .word PF_EnemyOccupied


_ts R_Billy_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0806676a
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0806676a:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08066780
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x6e
    strh       r0,[r5,#0x1c]
LAB_08066780:
    pop        {pc}


_nt R_Billy_1_2_Decide
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Billy_1_2_0_080667ac
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080667a0
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080667a0:
    pop        {pc}

    .align 2, 0


PTR_R_Billy_1_2_0_080667a4:
    .word R_Billy_1_2_0
    .word R_Billy_1_2_1

PTR_PTR_R_Billy_1_2_0_080667ac:
    .word PTR_R_Billy_1_2_0_080667a4


_ts R_Billy_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts R_Billy_1_2_1
    push       {lr}
    sub        sp,#0x4
    ldr        r1,PTR_DAT_08066834
    ldrb       r0,[r5,#0x4]
    add        r0,r0,r0
    add        r0,r0,r1
    str        r1,[sp,#0x0]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_0806682a
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         R_Billy_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_080667f8
    ldr        r7,[sp,#0x0]
    ldrb       r2,[r7,#0x0]
    strh       r2,[r5,#0x1e]
LAB_080667ea:
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0806682a
LAB_080667f8:
    add        r0,#0x1
    push       {r0,r1}
    bl         Entity_CompareToPlayerRow
    add        r2,r0,#0x0
    pop        {r0,r1}
    beq        LAB_08066822
    bmi        LAB_0806680c
    add        r1,#0x1
    b          LAB_0806680e
LAB_0806680c:
    sub        r1,#0x1
LAB_0806680e:
    push       {r0,r1}
    bl         R_Billy_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08066822
    ldr        r7,[sp,#0x0]
    ldrb       r2,[r7,#0x1]
    strh       r2,[r5,#0x1e]
    b          LAB_080667ea
LAB_08066822:
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0806682a:
    add        sp,#0x4
    pop        {pc}

DAT_0806682e:
    .byte 0x64
    .byte 0x3C
    .byte 0x50
    .byte 0x28
    .byte 0x3C
    .byte 0x1E

PTR_DAT_08066834:
    .word DAT_0806682e


_ts R_Billy_1_3_Move
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_R_Billy_1_3_0_08066848
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Billy_1_3_0_08066848:
    .word PTR_R_Billy_1_3_0_0806684c

PTR_R_Billy_1_3_0_0806684c:
    .word R_Billy_1_3_0
    .word R_Billy_1_3_1
    .word R_Billy_1_3_2


_ts R_Billy_1_3_0
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         R_Billy_IsPanelWalkable
    tst        r0,r0
    beq        LAB_08066888
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_08066890
LAB_08066888:
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08066890:
    pop        {pc}


_nt R_Billy_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080668b8
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
LAB_080668b8:
    pop        {pc}


_nt R_Billy_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080668d2
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_080668d2:
    pop        {pc}


_ts R_Billy_1_4_Thunder
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Billy_1_4_0_080668e4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Billy_1_4_0_080668e4:
    .word PTR_R_Billy_1_4_0_080668e8

PTR_R_Billy_1_4_0_080668e8:
    .word R_Billy_1_4_0
    .word R_Billy_1_4_1
    .word R_Billy_1_4_2


_ts R_Billy_1_4_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0xbc
    bl         Sound_PlaySE
    pop        {pc}


_nt R_Billy_1_4_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08066922
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
LAB_08066922:
    pop        {pc}


_ts R_Billy_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08066960
    push       {r5}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listBillyThunderSpeed_08066968
    ldr        r2,[r7,r0]
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    mov        r3,#0x3
    mov        r4,#0x1
    ldr        r7,PTR_listBillyThunderDamage_08066978
    ldrb       r6,[r5,#0x4]
    ldrb       r6,[r7,r6]
    mov        r7,#0x0
    bl         Attack_Thunder_Create
    pop        {r5}
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0xb4
    strh       r0,[r5,#0x1e]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08066960:
    pop        {pc}

listBillyThunderDamage:
    .byte 0x64
    .byte 0x8C
    .byte 0xB4

    .align 2, 0


PTR_listBillyThunderSpeed_08066968:
    .word listBillyThunderSpeed

listBillyThunderSpeed:
    .word 0xAAAA
    .word 0xCCCC
    .word 0x10000

PTR_listBillyThunderDamage_08066978:
    .word listBillyThunderDamage


_ts R_Billy_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Billy_2_0_Delete_08066994
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_Billy_2_0_Delete_0806698c:
    .word R_Billy_2_0_Delete
    .word R_Billy_2_1_Free

PTR_PTR_R_Billy_2_0_Delete_08066994:
    .word PTR_R_Billy_2_0_Delete_0806698c


_ts R_Billy_2_0_Delete
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


_ts R_Billy_2_1_Free
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080669d2
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080669d2:
    pop        {pc}


_ts R_Billy_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_08066a02
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x42
    lsl        r1,r1,#0x4
    tst        r0,r1
    bne        LAB_08066a02
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08066a02
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08066a02
    mov        r2,#0x1
    add        r0,r2,#0x0
LAB_08066a02:
    add        r0,r2,#0x0
    pop        {pc}

    .align 2, 0

