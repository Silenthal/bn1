#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts PlayerLocation_Handler
    push       {lr}
    ldr        r0,PTR_PTR_PlayerLocation_0_Init_08055470
    ldrb       r1,[r5,#0x8]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         UpdateSpriteFrameIndex
    push       {r5}
    ldr        r0,PTR_DAT_08055474
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r1,[r7,#0x24]
    bl         PrintDebugString
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_0_Init_08055464:
    .word PlayerLocation_0_Init
    .word PlayerLocation_1_Main
    .word PlayerLocation_2_Free

PTR_PTR_PlayerLocation_0_Init_08055470:
    .word PTR_PlayerLocation_0_Init_08055464

PTR_DAT_08055474:
    .word DAT_08055478

DAT_08055478:
    .byte 0x00
    .byte 0x13
    .asciz "%D"

    .align 2, 0


_ts PlayerLocation_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r1,#0x3
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x4]
    mov        r2,#0x80
    cmp        r0,r2
    bmi        LAB_08055496
    mov        r1,#0x8
LAB_08055496:
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetZClip
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    str        r5,[r0,#0x28]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x5c
    add        r0,r0,r5
    mov        r1,#0x20
    bl         memset0_32
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0xc]
    ldrb       r0,[r5,#0x10]
    mov        r1,#0x7
    strb       r0,[r5,#0x10]
    mov        r0,#0xff
    strb       r0,[r5,#0x11]
    mov        r0,#0x0
    mov        r3,#0x60
    strh       r0,[r5,r3]
    mov        r3,#0x62
    strh       r0,[r5,r3]
    str        r0,[r5,#0x40]
    str        r0,[r5,#0x44]
    str        r0,[r5,#0x48]
    str        r0,[r5,#0x58]
    strb       r0,[r5,#0xd]
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    ldr        r0,[r5,#0x24]
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    str        r0,[r5,#0x30]
    str        r1,[r5,#0x34]
    str        r2,[r5,#0x38]
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    ldr        r1,PTR_gNpcTalkState_08055508
    strb       r0,[r1,#0x0]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0x1a]
    strh       r0,[r5,#0x1c]
    bl         PlayerLocation_1_Main
    pop        {pc}

    .align 2, 0

PTR_gNpcTalkState_08055508:
    .word gNpcTalkState


_ts PlayerLocation_1_Main
    push       {lr}
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0x1b]
    strb       r0,[r5,#0x13]
    strb       r0,[r5,#0x12]
    ldrb       r1,[r5,#0xe]
    strb       r1,[r5,#0xf]
    ldrb       r1,[r5,#0xd]
    strb       r1,[r5,#0xe]
    strb       r0,[r5,#0xd]
    ldr        r0,[r5,#0x24]
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    str        r0,[r5,#0x30]
    str        r1,[r5,#0x34]
    str        r2,[r5,#0x38]
    ldr        r7,PTR_PTR_PlayerLocation_1_0_Dispatch_080555c8
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         PlayerLocation_InitHitboxes
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08055550
    mov        r0,#0x24
    add        r0,r0,r5
    push       {r5}
    bl         Map_HandleCollisionBoundary
    pop        {r5}
LAB_08055550:
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08055564
    mov        r0,#0x24
    add        r0,r0,r5
    push       {r5}
    bl         Map_HandleCollisionElevation
    pop        {r5}
    strh       r0,[r5,#0x2e]
LAB_08055564:
    add        r0,r5,#0x0
    add        r0,#0x24
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         PlayerLocation_IsMoving
    tst        r0,r0
    beq        LAB_080555a4
    ldrb       r1,[r5,#0x13]
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r0,[r7,#0x24]
    add        r0,r0,r1
    str        r0,[r7,#0x24]
    ldr        r0,[r5,#0x58]
    add        r0,r0,r1
    str        r0,[r5,#0x58]
    bl         Scene_IsSceneActive
    tst        r0,r0
    bne        LAB_080555a4
    ldrh       r0,[r7,#0x10]
    add        r0,r0,r1
    ldr        r2,DAT_080555d0
    cmp        r0,r2
    blt        LAB_080555a2
    add        r0,r2,#0x0
LAB_080555a2:
    strh       r0,[r7,#0x10]
LAB_080555a4:
    bl         FUN_08055fa8
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_1_0_Dispatch_080555ac:
    .word PlayerLocation_1_0_Dispatch
    .word PlayerLocation_1_1_UpdateWalkDelta
    .word PlayerLocation_1_2_UpdateRunDelta
    .word PlayerLocation_1_3_Talking
    .word PlayerLocation_1_4_Commentary
    .word PlayerLocation_1_5_Animating
    .word PlayerLocation_1_6

PTR_PTR_PlayerLocation_1_0_Dispatch_080555c8:
    .word PTR_PlayerLocation_1_0_Dispatch_080555ac
    .word gGameStats

DAT_080555d0:
    .word 0xFFFF


_ts PlayerLocation_1_0_Dispatch
    push       {lr}
    bl         PlayerLocation_UpdateMoveFlags
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080555e8
    ldrb       r0,[r5,#0x10]
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_080555e8:
    bl         PlayerLocation_IsWalking
    tst        r0,r0
    beq        LAB_080555fa
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_080555fa:
    bl         PlayerLocation_IsRunning
    tst        r0,r0
    beq        LAB_0805560c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_0805560c:
    bl         PlayerLocation_IsCommentary
    tst        r0,r0
    beq        LAB_0805561e
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    pop        {pc}
LAB_0805561e:
    bl         PlayerLocation_CheckEvents
    tst        r0,r0
    beq        LAB_08055630
    mov        r1,#0xc
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    pop        {pc}
LAB_08055630:
    bl         PlayerAnimation_SaveAndGetState
    tst        r0,r0
    beq        LAB_08055646
    mov        r0,#0x0
    strb       r0,[r7,#0x1]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_08055646:
    bl         FUN_08055bf4
    tst        r0,r0
    beq        LAB_08055656
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08055656:
    pop        {pc}


_ts PlayerLocation_1_1_UpdateWalkDelta
    push       {lr}
    bl         PlayerLocation_UpdateMoveFlags
    ldrb       r0,[r5,#0x10]
    ldrb       r1,[r5,#0x11]
    cmp        r0,r1
    beq        LAB_0805566a
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_0805566a:
    ldr        r7,PTR_PTR_PlayerLocation_1_1_0_UpdateWalkDelta_080556f4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         FUN_08055bf4
    tst        r0,r0
    beq        LAB_08055686
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_080556e8
LAB_08055686:
    bl         PlayerAnimation_SaveAndGetState
    tst        r0,r0
    beq        LAB_0805569c
    mov        r0,#0x0
    strb       r0,[r7,#0x1]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_080556e8
LAB_0805569c:
    bl         PlayerLocation_IsCommentary
    tst        r0,r0
    beq        LAB_080556ae
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_080556e8
LAB_080556ae:
    bl         PlayerLocation_CheckEvents
    tst        r0,r0
    beq        LAB_080556c0
    mov        r1,#0xc
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    b          LAB_080556e8
LAB_080556c0:
    bl         PlayerLocation_IsRunning
    tst        r0,r0
    beq        LAB_080556d2
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_080556e4
LAB_080556d2:
    bl         PlayerLocation_IsWalking
    tst        r0,r0
    bne        LAB_080556e4
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_080556e8
LAB_080556e4:
    ldrb       r0,[r5,#0x12]
    strb       r0,[r5,#0x13]
LAB_080556e8:
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_1_1_0_UpdateWalkDelta_080556ec:
    .word PlayerLocation_1_1_0_UpdateWalkDelta
    .word PlayerLocation_1_1_1_UpdateWalkPosition

PTR_PTR_PlayerLocation_1_1_0_UpdateWalkDelta_080556f4:
    .word PTR_PlayerLocation_1_1_0_UpdateWalkDelta_080556ec


_ts PlayerLocation_1_1_0_UpdateWalkDelta
    push       {lr}
    ldrb       r0,[r5,#0x10]
    ldr        r7,PTR_MovementOffset_ARRAY_080557c0
    lsl        r1,r0,#0x3
    lsl        r0,r0,#0x2
    add        r0,r0,r1
    add        r7,r7,r0
    ldr        r0,[r7,#0x4]
    str        r0,[r5,#0x40]
    ldr        r0,[r7,#0x8]
    str        r0,[r5,#0x44]
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts PlayerLocation_1_1_1_UpdateWalkPosition
    push       {lr}
    bl         FUN_08055e60
    tst        r0,r0
    beq        LAB_08055752
    mov        r0,#0x24
    add        r0,r0,r5
    push       {r5}
    bl         Map_HandleCollisionElevation
    pop        {r5}
    mov        r2,#0x0
    mov        r3,#0x1
    cmp        r1,#0x1
    bne        LAB_0805573a
    mov        r2,#0x1
    mov        r3,#0x2
LAB_0805573a:
    strb       r3,[r5,#0x12]
    ldr        r0,[r5,#0x40]
    lsl        r0,r2
    ldr        r1,[r5,#0x24]
    add        r1,r1,r0
    str        r1,[r5,#0x24]
    ldr        r0,[r5,#0x44]
    lsl        r0,r2
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    pop        {pc}
LAB_08055752:
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x34]
    ldr        r2,[r5,#0x38]
    str        r0,[r5,#0x24]
    str        r1,[r5,#0x28]
    str        r2,[r5,#0x2c]
    pop        {pc}

MovementOffset_ARRAY_08055760:
    .byte 0x8, 0
    .short 0
    .word f(1, -1)
    .byte 0x9, 0
    .short 0
    .word f(1, 0)
    .byte 0xA, 0
    .short 0
    .word f(0.5, 0.5)
    .byte 0xB, 0
    .short 0
    .word f(0, 1)
    .byte 0xC, 0
    .short 0
    .word f(-1, 1)
    .byte 0xD, 1
    .short 0
    .word f(-1, 0)
    .byte 0xE, 1
    .short 0
    .word f(-0.5, -0.5)
    .byte 0xF, 0
    .short 0
    .word f(0, -1)

PTR_MovementOffset_ARRAY_080557c0:
    .word MovementOffset_ARRAY_08055760


_ts PlayerLocation_1_2_UpdateRunDelta
    push       {lr}
    bl         PlayerLocation_UpdateMoveFlags
    ldrb       r0,[r5,#0x10]
    ldrb       r1,[r5,#0x11]
    cmp        r0,r1
    beq        LAB_080557d6
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_080557d6:
    ldr        r7,PTR_PTR_PlayerLocation_1_2_0_UpdateRunDelta_08055860
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         FUN_08055bf4
    tst        r0,r0
    beq        LAB_080557f2
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08055854
LAB_080557f2:
    bl         PlayerAnimation_SaveAndGetState
    tst        r0,r0
    beq        LAB_08055808
    mov        r0,#0x0
    strb       r0,[r7,#0x1]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08055854
LAB_08055808:
    bl         PlayerLocation_IsCommentary
    tst        r0,r0
    beq        LAB_0805581a
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_08055854
LAB_0805581a:
    bl         PlayerLocation_CheckEvents
    tst        r0,r0
    beq        LAB_0805582c
    mov        r1,#0xc
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
    b          LAB_08055854
LAB_0805582c:
    bl         PlayerLocation_IsWalking
    tst        r0,r0
    beq        LAB_0805583e
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_08055850
LAB_0805583e:
    bl         PlayerLocation_IsRunning
    tst        r0,r0
    bne        LAB_08055850
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    b          LAB_08055854
LAB_08055850:
    ldrb       r0,[r5,#0x12]
    strb       r0,[r5,#0x13]
LAB_08055854:
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_1_2_0_UpdateRunDelta_08055858:
    .word PlayerLocation_1_2_0_UpdateRunDelta
    .word PlayerLocation_1_2_1_UpdateRunPosition

PTR_PTR_PlayerLocation_1_2_0_UpdateRunDelta_08055860:
    .word PTR_PlayerLocation_1_2_0_UpdateRunDelta_08055858


_ts PlayerLocation_1_2_0_UpdateRunDelta
    push       {lr}
    ldrb       r0,[r5,#0x10]
    ldr        r7,PTR_MovementOffset_ARRAY_08055884
    lsl        r1,r0,#0x3
    lsl        r0,r0,#0x2
    add        r0,r0,r1
    add        r7,r7,r0
    ldr        r0,[r7,#0x4]
    str        r0,[r5,#0x40]
    ldr        r0,[r7,#0x8]
    str        r0,[r5,#0x44]
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

PTR_MovementOffset_ARRAY_08055884:
    .word MovementOffset_ARRAY_080558b8


_ts PlayerLocation_1_2_1_UpdateRunPosition
    push       {lr}
    bl         FUN_08055e60
    tst        r0,r0
    beq        LAB_080558a8
    ldr        r0,[r5,#0x40]
    ldr        r1,[r5,#0x24]
    add        r1,r1,r0
    str        r1,[r5,#0x24]
    ldr        r0,[r5,#0x44]
    ldr        r1,[r5,#0x28]
    add        r1,r1,r0
    str        r1,[r5,#0x28]
    mov        r0,#0x2
    strb       r0,[r5,#0x12]
    pop        {pc}
LAB_080558a8:
    ldr        r0,[r5,#0x30]
    ldr        r1,[r5,#0x34]
    ldr        r2,[r5,#0x38]
    str        r0,[r5,#0x24]
    str        r1,[r5,#0x28]
    str        r2,[r5,#0x2c]
    pop        {pc}

    .align 2, 0

MovementOffset_ARRAY_080558b8:
    .byte 0x10, 0
    .short 0
    .word f(2, -2)
    .byte 0x11, 0
    .short 0
    .word f(2, 0)
    .byte 0x12, 0
    .short 0
    .word f(1, 1)
    .byte 0x13, 0
    .short 0
    .word f(0, 2)
    .byte 0x14, 0
    .short 0
    .word f(-2, 2)
    .byte 0x15, 1
    .short 0
    .word f(-2, 0)
    .byte 0x16, 1
    .short 0
    .word f(-1, -1)
    .byte 0x17, 0
    .short 0
    .word f(0, -2)


_ts PlayerLocation_1_3_Talking
    push       {lr}
    ldr        r7,PTR_PTR_PlayerLocation_1_3_0_08055948
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         PlayerAnimation_SaveAndGetState
    tst        r0,r0
    beq        LAB_08055938
    mov        r0,#0x1
    strb       r0,[r7,#0x1]
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08055938:
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_1_3_0_0805593c:
    .word PlayerLocation_1_3_0
    .word PlayerLocation_1_3_1_WaitTalkEnd
    .word PlayerLocation_1_3_2_EndTalking

PTR_PTR_PlayerLocation_1_3_0_08055948:
    .word PTR_PlayerLocation_1_3_0_0805593c


_ts PlayerLocation_1_3_0
    push       {lr}
    ldrb       r0,[r5,#0x10]
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts PlayerLocation_1_3_1_WaitTalkEnd
    push       {lr}
    ldr        r7,PTR_gNpcTalkState_08055968
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0x3
    bne        LAB_08055966
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
LAB_08055966:
    pop        {pc}

PTR_gNpcTalkState_08055968:
    .word gNpcTalkState


_ts PlayerLocation_1_3_2_EndTalking
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x1a]
    tst        r0,r0
    bne        LAB_08055984
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
LAB_08055984:
    pop        {pc}


_nt PlayerLocation_1_4_Commentary
    push       {lr}
    ldr        r7,PTR_PTR_PlayerLocation_1_4_0_ShowCommentary_0805599c
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PlayerLocation_1_4_0_ShowCommentary_08055994:
    .word PlayerLocation_1_4_0_ShowCommentary
    .word PlayerLocation_1_4_1_End

PTR_PTR_PlayerLocation_1_4_0_ShowCommentary_0805599c:
    .word PTR_PlayerLocation_1_4_0_ShowCommentary_08055994


_ts PlayerLocation_1_4_0_ShowCommentary
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    push       {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r0,[r0,#0x12]
    bl         Text_LoadCommentaryDialogue
    pop        {r5}
    pop        {pc}


_nt PlayerLocation_1_4_1_End
    push       {lr}
    ldr        r0,PTR_gTextOptionFlags_080559d8
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r1,r0
    bne        LAB_080559d4
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    bl         NPC_ResetAllTalkState
LAB_080559d4:
    pop        {pc}

    .align 2, 0

PTR_gTextOptionFlags_080559d8:
    .word gTextOptionFlags


_ts PlayerLocation_2_Free
    push       {lr}
    bl         PlayerLocation_Free
    pop        {pc}


_ts PlayerLocation_1_5_Animating
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_08055a74
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_080559f8
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldrb       r0,[r7,#0x0]
    add        r0,#0x1
    strb       r0,[r7,#0x0]
LAB_080559f8:
    ldr        r0,[r5,#0x24]
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    str        r0,[r5,#0x30]
    str        r1,[r5,#0x34]
    str        r2,[r5,#0x38]
    ldrb       r0,[r7,#0x2]
    strb       r0,[r5,#0x14]
    ldr        r0,[r7,#0x8]
    str        r0,[r5,#0x24]
    ldr        r0,[r7,#0xc]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x10]
    str        r0,[r5,#0x2c]
    bl         PlayerAnimation_SaveAndGetState
    tst        r0,r0
    bne        LAB_08055a26
    ldr        r6,PTR_FunctionState_08055a78
    ldrb       r0,[r7,#0x1]
    lsl        r0,r0,#0x2
    ldr        r0,[r6,r0]
    str        r0,[r5,#0x8]
LAB_08055a26:
    ldrb       r0,[r5,#0xc]
    tst        r0,r0
    beq        LAB_08055a38
    mov        r0,#0x24
    add        r0,r0,r5
    push       {r5}
    bl         Map_HandleCollisionBoundary
    pop        {r5}
LAB_08055a38:
    ldr        r7,PTR_gPlayerAnimation_08055a7c
    ldr        r0,[r5,#0x24]
    str        r0,[r7,#0x8]
    ldr        r0,[r5,#0x28]
    str        r0,[r7,#0xc]
    ldr        r0,[r5,#0x2c]
    str        r0,[r7,#0x10]
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08055a5a
    mov        r0,#0x24
    add        r0,r0,r5
    push       {r5}
    bl         Map_HandleCollisionElevation
    pop        {r5}
    strh       r0,[r5,#0x2e]
LAB_08055a5a:
    add        r0,r5,#0x0
    add        r0,#0x24
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    pop        {pc}

FunctionState_08055a6c:
    .byte 0x04, 0x00, 0x04, 0x00
    .byte 0x04, 0x0C, 0x08, 0x00

PTR_gPlayerAnimation_08055a74:
    .word gPlayerAnimation

PTR_FunctionState_08055a78:
    .word FunctionState_08055a6c

PTR_gPlayerAnimation_08055a7c:
    .word gPlayerAnimation


_ts PlayerLocation_1_6
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08055a9e
    mov        r0,#0x4
    strb       r0,[r5,#0x10]
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r0,PTR_TextData_BattleMessages_08055ab4
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08055a9e:
    ldr        r0,PTR_gTextOptionFlags_08055ab8
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_08055ab2
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
LAB_08055ab2:
    pop        {pc}

PTR_TextData_BattleMessages_08055ab4:
    .word TextData_BattleMessages

PTR_gTextOptionFlags_08055ab8:
    .word gTextOptionFlags


_ts PlayerLocation_UpdateMoveFlags
    push       {lr}
    sub        sp,#0xc
    mov        r8,sp
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r1,[r7,#0x3]
    mov        r2,#0x1
    cmp        r1,r2
    beq        LAB_08055b60
    mov        r0,#0x0
    bl         Flag_Get400
    add        r1,r0,#0x0
    mov        r0,#0x0
    tst        r1,r1
    beq        LAB_08055b60
    ldrb       r0,[r5,#0x10]
    strb       r0,[r5,#0x11]
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r1,[r7,#0x2]
    mov        r2,#0x1
    tst        r2,r1
    beq        LAB_08055b2c
    push       {r0,r1,r5,r7}
    ldrb       r0,[r5,#0x10]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listHitboxTalking_08055c50
    ldr        r7,[r7,r0]
    mov        r6,r8
    ldr        r0,[r5,#0x24]
    ldr        r1,[r7,#0x0]
    add        r0,r0,r1
    str        r0,[r6,#0x0]
    ldr        r0,[r5,#0x28]
    ldr        r1,[r7,#0x4]
    add        r0,r0,r1
    str        r0,[r6,#0x4]
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r7,#0x8]
    add        r0,r0,r1
    str        r0,[r6,#0x8]
    add        r0,r6,#0x0
    bl         Map_HandleCollisionEvent
    add        r2,r0,#0x0
    pop        {r0,r1,r5,r7}
    strb       r2,[r5,#0xd]
    push       {r7}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r2,#0x1
    strb       r2,[r7,#0x1b]
    pop        {r7}
LAB_08055b2c:
    ldr        r2,DAT_08055b84
    tst        r1,r2
    beq        LAB_08055b40
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldrb       r2,[r6,#0x12]
    cmp        r2,#0xff
    beq        LAB_08055b40
    ldr        r2,DAT_08055b88
    orr        r0,r2
LAB_08055b40:
    ldrh       r1,[r7,#0x0]
    mov        r2,#0xf0
    and        r2,r1
    beq        LAB_08055b60
    lsr        r2,r2,#0x4
    ldr        r7,PTR_directionList_08055b8c
    ldrb       r2,[r7,r2]
    orr        r0,r2
    mov        r2,#0x2
    tst        r2,r1
    beq        LAB_08055b5c
    mov        r1,#0x20
    orr        r0,r1
    b          LAB_08055b60
LAB_08055b5c:
    mov        r1,#0x10
    orr        r0,r1
LAB_08055b60:
    mov        r3,#0x60
    strh       r0,[r5,r3]
    mov        r1,#0xf
    and        r1,r0
    beq        LAB_08055b6e
    sub        r1,#0x1
    strb       r1,[r5,#0x10]
LAB_08055b6e:
    add        sp,#0xc
    pop        {pc}

directionList:
    .byte 0x00
    .byte 0x03
    .byte 0x07
    .byte -1
    .byte 0x01
    .byte 0x02
    .byte 0x08
    .byte -1
    .byte 0x05
    .byte 0x04
    .byte 0x06
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

    .align 2, 0

DAT_08055b84:
    .word 0x200

DAT_08055b88:
    .word 0x100

PTR_directionList_08055b8c:
    .word directionList


_ts PlayerLocation_IsWalking
    mov        r3,#0x60
    ldrh       r0,[r5,r3]
    mov        r1,#0x10
    and        r0,r1
    mov        pc,lr


_nt PlayerLocation_IsRunning
    mov        r3,#0x60
    ldrh       r0,[r5,r3]
    mov        r1,#0x20
    and        r0,r1
    mov        pc,lr


_ts PlayerLocation_IsCommentary
    push       {lr}
    mov        r6,#0x0
    mov        r3,#0x60
    ldrh       r0,[r5,r3]
    mov        r1,#0x1
    lsl        r1,r1,#0x8
    and        r0,r1
    beq        LAB_08055bec
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x1a]
    ldrb       r1,[r7,#0x1b]
    add        r0,r0,r1
    bne        LAB_08055bec
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_08055bec
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08055bec
    bl         Scene_IsSceneActive
    bne        LAB_08055bec
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08055bec
    ldr        r0,PTR_gNpcTalkState_08055bf0
    ldrb       r0,[r0,#0x0]
    tst        r0,r0
    bne        LAB_08055bec
    mov        r6,#0x1
LAB_08055bec:
    add        r0,r6,#0x0
    pop        {pc}

PTR_gNpcTalkState_08055bf0:
    .word gNpcTalkState


_ts FUN_08055bf4
    mov        r3,#0x60
    ldrh       r0,[r5,r3]
    mov        r1,#0x2
    lsl        r1,r1,#0x8
    and        r0,r1
    mov        pc,lr


_ts PlayerLocation_InitHitboxes
    push       {lr}
    ldr        r0,PTR_EntityBoundsParams_8055c84
    mov        r1,#0x3c
    add        r1,r1,r5
    bl         PlayerLocation_AddHitbox
    ldrb       r0,[r5,#0x10]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_ARRAY_08055c54
    ldr        r0,[r7,r0]
    mov        r1,#0x64
    add        r1,r1,r5
    bl         PlayerLocation_AddHitbox
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x1b]
    tst        r0,r0
    beq        LAB_08055c3e
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_08055c3e
    ldrb       r0,[r5,#0x10]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_listHitboxTalking_08055c50
    ldr        r0,[r7,r0]
    mov        r1,#0x5c
    add        r1,r1,r5
    bl         PlayerLocation_AddHitbox
LAB_08055c3e:
    mov        r0,#0x0
    mov        r3,#0x3c
    str        r0,[r5,r3]
    mov        r3,#0x5c
    str        r0,[r5,r3]
    mov        r3,#0x64
    str        r0,[r5,r3]
    pop        {pc}

    .align 2, 0

PTR_listHitboxTalking_08055c50:
    .word listHitboxTalking

PTR_PTR_ARRAY_08055c54:
    .word PTR_ARRAY_08055d80


_ts PlayerLocation_AddHitbox
    push       {r5,lr}
    add        r7,r0,#0x0
    mov        r2,#0x0
    str        r2,[r1,#0x0]
    push       {r1}
    ldr        r3,[r5,#0x24]
    ldr        r0,[r7,#0x0]
    add        r0,r0,r3
    ldr        r3,[r5,#0x28]
    ldr        r1,[r7,#0x4]
    add        r1,r1,r3
    ldr        r3,[r5,#0x2c]
    ldr        r2,[r7,#0x8]
    add        r2,r2,r3
    ldr        r3,[r7,#0xc]
    ldr        r4,[r7,#0x10]
    ldr        r5,[r7,#0x14]
    pop        {r6}
    bl         EntityBounds_AddToList
    pop        {r5,pc}

    .align 2, 0

PTR_EntityBoundsParams_8055c84:
    .word EntityBoundsParams_8055c88

EntityBoundsParams_8055c88:
    entity_bounds f(0, 0, 0), 4, 32, 0x1, 0xFFFF0000

listHitboxTalking:
    .word EntityBoundsParams_8055cc0
    .word EntityBoundsParams_8055cd8
    .word EntityBoundsParams_8055cf0
    .word EntityBoundsParams_8055d08
    .word EntityBoundsParams_8055d20
    .word EntityBoundsParams_8055d38
    .word EntityBoundsParams_8055d50
    .word EntityBoundsParams_8055d68

EntityBoundsParams_8055cc0:
    entity_bounds f(5.65683, -5.65683, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055cd8:
    entity_bounds f(8, 0, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055cf0:
    entity_bounds f(5.65683, 5.65683, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055d08:
    entity_bounds f(0, 8, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055d20:
    entity_bounds f(-5.65683, 5.65683, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055d38:
    entity_bounds f(-8, 0, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055d50:
    entity_bounds f(-5.65683, -5.65683, 0), 8, 32, 0x4, 0xFFFF0000

EntityBoundsParams_8055d68:
    entity_bounds f(0, -8, 0), 8, 32, 0x4, 0xFFFF0000

PTR_ARRAY_08055d80:
    .word EntityBoundsParams_8055da0
    .word EntityBoundsParams_8055db8
    .word EntityBoundsParams_8055dd0
    .word EntityBoundsParams_8055de8
    .word EntityBoundsParams_8055e00
    .word EntityBoundsParams_8055e18
    .word EntityBoundsParams_8055e30
    .word EntityBoundsParams_8055e48

EntityBoundsParams_8055da0:
    entity_bounds f(2.82842, -2.82842, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055db8:
    entity_bounds f(4, 0, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055dd0:
    entity_bounds f(2.82842, 2.82842, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055de8:
    entity_bounds f(0, 4, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055e00:
    entity_bounds f(-2.82842, 2.82842, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055e18:
    entity_bounds f(-4, 0, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055e30:
    entity_bounds f(-2.82842, -2.82842, 0), 4, 32, 0x0, 0xFFFF0002

EntityBoundsParams_8055e48:
    entity_bounds f(0, -4, 0), 4, 32, 0x0, 0xFFFF0002


_ts FUN_08055e60
    push       {lr}
    mov        r0,#0x0
    ldrh       r1,[r5,#0x1c]
    tst        r1,r1
    beq        LAB_08055e72
    sub        r1,#0x1
    strh       r1,[r5,#0x1c]
    mov        r0,#0x1
    b          LAB_08055e7c
LAB_08055e72:
    ldr        r1,[r5,#0x64]
    ldr        r2,DAT_08055e80
    tst        r2,r1
    bne        LAB_08055e7c
    mov        r0,#0x1
LAB_08055e7c:
    pop        {pc}

    .align 2, 0

DAT_08055e80:
    .word 0xFFFF0002


_ts PlayerLocation_CheckEvents
    push       {lr}
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_08055e96
    bl         Scene_IsSceneActive
    bne        LAB_08055e96
    b          LAB_08055ea0
LAB_08055e96:
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    ldr        r1,PTR_gNpcTalkState_08055f0c
    strb       r0,[r1,#0x0]
    b          LAB_08055eac
LAB_08055ea0:
    ldrb       r0,[r5,#0x7]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_PlayerLocation_Events_0_Update_08055ebc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08055eac:
    pop        {pc}

    .align 2, 0

PTR_PlayerLocation_Events_0_Update_08055eb0:
    .word PlayerLocation_Events_0_Update
    .word PlayerLocation_Events_1_WaitTalk
    .word PlayerLocation_Events_2_Talking

PTR_PTR_PlayerLocation_Events_0_Update_08055ebc:
    .word PTR_PlayerLocation_Events_0_Update_08055eb0


_ts PlayerLocation_Events_0_Update
    push       {lr}
    ldr        r7,PTR_gNpcTalkState_08055f0c
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    beq        LAB_08055ed4
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0x2
    strb       r0,[r7,#0x0]
    b          LAB_08055edc
LAB_08055ed4:
    ldrb       r0,[r5,#0xf]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0xe]
LAB_08055edc:
    mov        r0,#0x0
    pop        {pc}


_ts PlayerLocation_Events_1_WaitTalk
    push       {lr}
    ldr        r7,PTR_gNpcTalkState_08055f0c
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0x3
    bne        LAB_08055efa
    mov        r0,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0x1a]
    mov        r0,#0x2
    strb       r0,[r5,#0x7]
    mov        r0,#0x1
    pop        {pc}
LAB_08055efa:
    mov        r0,#0x0
    pop        {pc}


_nt PlayerLocation_Events_2_Talking
    push       {lr}
    mov        r0,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0x1a]
    mov        r0,#0x1
    pop        {pc}

PTR_gNpcTalkState_08055f0c:
    .word gNpcTalkState


_ts PlayerAnimation_SaveAndGetState
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_08055f28
    ldr        r0,[r5,#0x24]
    str        r0,[r7,#0x8]
    ldr        r0,[r5,#0x28]
    str        r0,[r7,#0xc]
    ldr        r0,[r5,#0x2c]
    str        r0,[r7,#0x10]
    ldrb       r0,[r5,#0x14]
    strb       r0,[r7,#0x2]
    ldrb       r0,[r7,#0x0]
    pop        {pc}

PTR_gPlayerAnimation_08055f28:
    .word gPlayerAnimation


_ts FUN_08055f2c
    push       {lr}
    ldr        r7,PTR_LOOP_08055f84
    lsl        r0,r0,#0x3
    add        r7,r7,r0
    ldr        r3,[r7,#0x0]
    mul        r3,r1
    ldr        r4,[r7,#0x4]
    mul        r4,r1
    add        r0,r3,#0x0
    add        r1,r4,#0x0
    pop        {pc}

    .align 2, 0
    .word 0xB504
    .word 0xFFFF4AFC
    .word 0x10000
    .word 0x0
    .word 0xB504
    .word 0xB504
    .word 0x0
    .word 0x10000
    .word 0xFFFF4AFC
    .word 0xB504
    .word 0xFFFF0000
    .word 0x0
    .word 0xFFFF4AFC
    .word 0xFFFF4AFC
    .word 0x0
    .word 0xFFFF0000

PTR_LOOP_08055f84:
    .word PTR_LOOP_08055f84


_ts PlayerLocation_IsMoving
    push       {lr}
    mov        r0,#0x1
    ldr        r1,[r5,#0x24]
    ldr        r2,[r5,#0x30]
    cmp        r1,r2
    bne        LAB_08055fa6
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x34]
    cmp        r1,r2
    bne        LAB_08055fa6
    ldr        r1,[r5,#0x2c]
    ldr        r2,[r5,#0x38]
    cmp        r1,r2
    bne        LAB_08055fa6
    mov        r0,#0x0
LAB_08055fa6:
    pop        {pc}


_ts FUN_08055fa8
    push       {lr}
    bl         PlayerLocation_IsMoving
    mov        r3,#0x6a
    tst        r0,r0
    beq        LAB_08055fba
    mov        r0,#0x0
    strh       r1,[r5,r3]
    b          LAB_08055fd2
LAB_08055fba:
    ldrb       r0,[r5,r3]
    ldrb       r2,[r5,#0x10]
    ldr        r7,PTR_BYTE_ARRAY_08055fd4
    ldrb       r1,[r7,r2]
    orr        r0,r1
    strb       r0,[r5,r3]
    cmp        r0,#0xf
    bne        LAB_08055fd2
    mov        r0,#0xa
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,r3]
LAB_08055fd2:
    pop        {pc}

PTR_BYTE_ARRAY_08055fd4:
    .word BYTE_ARRAY_08055fd8

BYTE_ARRAY_08055fd8:
    .byte 0x01
    .byte 0x03
    .byte 0x02
    .byte 0x06
    .byte 0x04
    .byte 0x0C
    .byte 0x08
    .byte 0x09


_ts FUN_08055fe0
    push       {lr}
    push       {r5}
    ldr        r0,PTR_DAT_0805601c
    mov        r4,#0x24
    ldr        r1,[r5,r4]
    mov        r4,#0x28
    ldr        r2,[r5,r4]
    mov        r4,#0x2c
    ldr        r3,[r5,r4]
    ldr        r4,[r5,#0x58]
    mov        r6,#0x6a
    ldrb       r5,[r5,r6]
    bl         PrintDebugString
    pop        {r5}
    pop        {pc}

DAT_08056000:
    .byte 0x00
    .byte 0x01
    .asciz "X:%x\nY:%x\nZ:%x\nD:%x\nH:%8x"

PTR_DAT_0805601c:
    .word DAT_08056000


_ts PlayerLocation_Create
    push       {lr}
    mov        r0,#0x0
    bl         PlayerLocation_Alloc
    tst        r5,r5
    beq        LAB_08056042
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    str        r5,[r6,#0x28]
    ldr        r1,[r6,#0x38]
    str        r1,[r5,#0x24]
    ldr        r1,[r6,#0x3c]
    str        r1,[r5,#0x28]
    ldr        r1,[r6,#0x40]
    str        r1,[r5,#0x2c]
    ldr        r1,[r6,#0x44]
    strb       r1,[r5,#0x10]
LAB_08056042:
    pop        {pc}


_ts Flag_SetPlayerActive
    push       {lr}
    mov        r0,#0x0
    bl         Flag_Set400
    pop        {pc}


_nt Flag_SetPlayerInactive
    push       {lr}
    mov        r0,#0x0
    bl         Flag_Clear400
    pop        {pc}


_ts PlayerAnimation_Lock
    ldr        r7,PTR_gPlayerAnimation_08056060
    mov        r0,#0x1
    strb       r0,[r7,#0x0]
    mov        pc,lr

PTR_gPlayerAnimation_08056060:
    .word gPlayerAnimation


_ts PlayerAnimation_Unlock
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_08056070
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    pop        {pc}

    .align 2, 0

PTR_gPlayerAnimation_08056070:
    .word gPlayerAnimation


_ts PlayerAnimation_SetState
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_0805607c
    strb       r0,[r7,#0x2]
    pop        {pc}

PTR_gPlayerAnimation_0805607c:
    .word gPlayerAnimation


_ts PlayerAnimation_SetPosition
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_080560a4
    str        r0,[r7,#0x8]
    str        r1,[r7,#0xc]
    str        r2,[r7,#0x10]
    pop        {pc}


_ts PlayerAnimation_Move
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_080560a4
    ldr        r3,[r7,#0x8]
    add        r3,r3,r0
    str        r3,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    add        r3,r3,r1
    str        r3,[r7,#0xc]
    ldr        r3,[r7,#0x10]
    add        r3,r3,r2
    str        r3,[r7,#0x10]
    pop        {pc}

PTR_gPlayerAnimation_080560a4:
    .word gPlayerAnimation


_ts FUN_080560a8
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_080560b0
    strh       r0,[r7,#0x4]
    pop        {pc}

PTR_gPlayerAnimation_080560b0:
    .word gPlayerAnimation


_ts PlayerAnimation_GetState
    push       {lr}
    ldr        r7,PTR_gPlayerAnimation_080560bc
    ldrb       r0,[r7,#0x0]
    pop        {pc}

PTR_gPlayerAnimation_080560bc:
    .word gPlayerAnimation


_ts EnableElevationCheck
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x1
    strb       r0,[r7,#0x17]
    pop        {pc}


_nt DisableElevationCheck
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x0
    strb       r0,[r7,#0x17]
    pop        {pc}


_ts EnableBoundaryCheck
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x1
    strb       r0,[r7,#0xc]
    pop        {pc}


_nt DisableBoundaryCheck
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x0
    strb       r0,[r7,#0xc]
    pop        {pc}


_ts PlayerLocation_IsCommentaryState
    push       {r1,r7,lr}
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r1,[r7,#0x9]
    cmp        r1,#0x10
    bne        LAB_0805610a
    mov        r0,#0x1
LAB_0805610a:
    pop        {r1,r7,pc}
