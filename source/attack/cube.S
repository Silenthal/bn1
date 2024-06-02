#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


EP_60_A_Block_BlockParam_ARRAY_080735bc:
    .byte 0x01, 0x01, 0x96, 0x01, 0x84, 0x03, 0x00, 0x00
    .byte 0x00, 0x01, 0x8B, 0x01, 0x84, 0x03, 0x00, 0x00
    .byte 0x01, 0x01, 0x89, 0x01, 0x84, 0x03, 0x00, 0x00
    .byte 0x01, 0x05, 0x8B, 0x01, 0x84, 0x03, 0x00, 0x00
    .byte 0x00, 0x04, 0x8B, 0x01, 0x70, 0x17, 0x00, 0x00
    .byte 0x00, 0x06, 0x8B, 0x01, 0x70, 0x17, 0x00, 0x00
    .byte 0x01, 0x01, 0x89, 0x01, 0x84, 0x03, 0x00, 0x00


_ts Attack_Cube
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Cube_0_Init_08073608
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Cube_0_Init_08073608:
    .word PTR_A_Cube_0_Init_0807360c

PTR_A_Cube_0_Init_0807360c:
    .word A_Cube_0_Init
    .word A_Cube_1_Main
    .word A_Cube_2_Free


_ts A_Cube_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,PTR_EP_60_A_Block_BlockParam_ARRAY_08073680
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    mov        r0,#0x1
    ldrb       r1,[r7,#0x2]
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x10
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    cmp        r0,#0x5
    bcs        LAB_08073674
    mov        r0,#0x93
    bl         Sound_PlaySongImmediate
LAB_08073674:
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Cube_1_Main
    pop        {pc}

    .align 2, 0


PTR_EP_60_A_Block_BlockParam_ARRAY_08073680:
    .word EP_60_A_Block_BlockParam_ARRAY_080735bc


_ts A_Cube_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_IsInputLocked
    beq        LAB_08073698
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08073698:
    bl         A_Cube_CheckDamage
    tst        r0,r0
    bne        LAB_080736ea
    ldrb       r0,[r5,#0x7]
    lsr        r0,r0,#0x1
    bcc        LAB_080736e0
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080736e0
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    lsr        r0,r0,#0x1
    bcc        LAB_080736dc
    ldrb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x4c]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_080736e0
LAB_080736dc:
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
LAB_080736e0:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Cube_1_0_080736f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080736ea:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_UpdateCellPosition
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Cube_1_0_080736f8:
    .word PTR_A_Cube_1_0_080736fc

PTR_A_Cube_1_0_080736fc:
    .word A_Cube_1_0
    .word A_Cube_1_1


_ts A_Cube_1_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807372a
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#0x14]
    str        r7,[r5,#0x60]
    ldr        r0,[r7,#0x4]
    strh       r0,[r5,#0x1c]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Enable
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0807372a:
    pop        {pc}


_ts A_Cube_1_1
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807374c
    ldr        r7,[r5,#0x60]
    ldrb       r1,[r7,#0x3]
    tst        r1,r1
    beq        LAB_0807375c
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807375c
LAB_0807374c:
    ldr        r7,[r5,#0x68]
    tst        r7,r7
    beq        LAB_08073758
    ldrb       r0,[r7,#0x0]
    add        r0,#0x1
    strb       r0,[r7,#0x0]
LAB_08073758:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0807375c:
    pop        {pc}


_nt A_Cube_2_Free
    push       {lr}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x7
    bl         Field_GetRandomXZPosOnTarget
    ldrb       r4,[r5,#0x4]
    bl         Effect_CubeBreak_Create
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x7
    bl         Field_GetRandomXZPosOnTarget
    ldrb       r4,[r5,#0x4]
    bl         Effect_CubeBreak_Create
    mov        r0,#0x95
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08073794
    bl         FieldObstacleManager_Remove
LAB_08073794:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Cube_CheckDamage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_080737fa
    ldr        r7,[r5,#0x64]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_08073816
    ldrb       r1,[r5,#0x7]
    lsr        r1,r1,#0x2
    bcc        LAB_080737bc
    bl         A_Cube_SetSlide
LAB_080737bc:
    mov        r0,#0x11
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08073816
    ldr        r1,PanelFlag_0807381c
    tst        r0,r1
    bne        LAB_080737fa
    ldrb       r1,[r5,#0x7]
    lsr        r1,r1,#0x1
    bcs        LAB_080737e8
    bl         R_Actor_CheckPush
    tst        r0,r0
    beq        LAB_080737e8
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    str        r1,[r5,#0x4c]
LAB_080737e8:
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08073816
    bl         Field_SubtractHP
    tst        r1,r1
    bne        LAB_0807380c
LAB_080737fa:
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x1
    pop        {pc}
LAB_0807380c:
    bl         SpritePtr_SetFlashPalette
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08073816:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PanelFlag_0807381c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid | PF_Break


_ts A_Cube_SetSlide
    ldrb       r0,[r5,#0x16]
    ldr        r1,PTR_BYTE_ARRAY_0807383c
    ldrsb      r1,[r1,r0]
    mov        r0,#0x4
    mul        r0,r1
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0xa
    strh       r0,[r5,#0x1e]
    str        r1,[r5,#0x4c]
    mov        pc,lr

    .align 2, 0


PTR_BYTE_ARRAY_0807383c:
    .word BYTE_ARRAY_08073840

BYTE_ARRAY_08073840:
    .byte 0x01
    .byte -1


_nt Attack_Cube_Create
    push       {r5,lr}
    lsl        r2,r2,#0x8
    orr        r1,r2
    add        r2,r5,#0x0
    push       {r0,r1,r2,r3,r6,r7}
    mov        r0,#0x25
    bl         Attack_Alloc
    pop        {r0,r1,r2,r3,r6,r7}
    tst        r5,r5
    beq        LAB_08073876
    strb       r0,[r5,#0x1a]
    strh       r1,[r5,#0x18]
    strh       r3,[r5,#0x20]
    strh       r3,[r5,#0x22]
    strh       r6,[r5,#0x24]
    str        r7,[r5,#0x68]
    add        r7,r5,#0x0
    ldrb       r0,[r2,#0x16]
    strb       r0,[r7,#0x16]
    push       {r7}
    bl         FieldObstacleManager_Add
    tst        r0,r0
    pop        {r7}
    bmi        LAB_08073878
LAB_08073876:
    pop        {r5,pc}
LAB_08073878:
    bl         Attack_Free
    pop        {r5,pc}


_nt Attack_Cube_Chip_Create
    push       {r5,lr}
    lsl        r2,r2,#0x8
    orr        r1,r2
    push       {r0,r1,r3,r6,r7}
    mov        r0,#0x25
    bl         Attack_Alloc
    pop        {r0,r1,r3,r6,r7}
    tst        r5,r5
    beq        LAB_080738b0
    strb       r0,[r5,#0x1a]
    strh       r1,[r5,#0x18]
    strh       r3,[r5,#0x20]
    strh       r3,[r5,#0x22]
    strh       r6,[r5,#0x24]
    str        r7,[r5,#0x68]
    add        r7,r5,#0x0
    mov        r0,#0x0
    strb       r0,[r7,#0x16]
    push       {r7}
    bl         FieldObstacleManager_Add
    tst        r0,r0
    pop        {r7}
    bmi        LAB_080738b2
LAB_080738b0:
    pop        {r5,pc}
LAB_080738b2:
    bl         Attack_Free
    pop        {r5,pc}


_ts Attack_Cube_MP_Create
    push       {r5,lr}
    lsl        r2,r2,#0x8
    orr        r1,r2
    add        r2,r5,#0x0
    push       {r0,r1,r2,r3,r6,r7}
    mov        r0,#0x25
    bl         Attack_Alloc
    pop        {r0,r1,r2,r3,r6,r7}
    tst        r5,r5
    beq        LAB_080738ec
    strb       r0,[r5,#0x1a]
    strh       r1,[r5,#0x18]
    strh       r3,[r5,#0x20]
    strh       r3,[r5,#0x22]
    strh       r6,[r5,#0x24]
    str        r7,[r5,#0x68]
    add        r7,r5,#0x0
    mov        r0,#0x0
    strb       r0,[r7,#0x16]
    push       {r2,r7}
    bl         FieldObstacleManager_Add
    tst        r0,r0
    pop        {r2,r7}
    bmi        LAB_080738ee
LAB_080738ec:
    pop        {r5,pc}
LAB_080738ee:
    bl         Attack_Free
    pop        {r5,pc}
