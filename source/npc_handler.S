#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts NPC_Main
    push       {lr}
    ldr        r7,PTR_PTR_NPC_0_Init_08081db0
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_NPC_0_Init_08081da4:
    .word NPC_0_Init
    .word NPC_1_Main
    .word NPC_2_Talking

PTR_PTR_NPC_0_Init_08081db0:
    .word PTR_NPC_0_Init_08081da4


_ts NPC_0_Init
    push       {lr}
    ldr        r0,[r5,#0x5c]
    bl         NPC_SetCommand
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    str        r0,[r5,#0x68]
    bl         SpritePtr_SetObjectExcludeFlags
    bl         SpritePtr_SetZClip
    mov        r0,#0xff
    strh       r0,[r5,#0x3c]
    strh       r0,[r5,#0x3e]
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0x7]
    strb       r0,[r5,#0x16]
    str        r0,[r5,#0x5c]
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x54]
    str        r0,[r5,#0x58]
    strb       r0,[r5,#0x11]
    strb       r0,[r5,#0x12]
    strb       r0,[r5,#0x13]
    mov        r0,#0x6
    strb       r0,[r5,#0xc]
    mov        r0,#0x20
    strb       r0,[r5,#0xd]
    bl         NPC_SetIdFlag
    bl         NPC_1_Main
    pop        {pc}


_ts NPC_1_Main
    push       {lr}
    ldr        r0,[r5,#0x5c]
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_08081e26
    bl         NPC_Talk_Main
    tst        r0,r0
    beq        LAB_08081e1a
    mov        r0,#0x1
    strb       r0,[r5,#0x18]
LAB_08081e1a:
    ldrb       r0,[r5,#0x18]
    tst        r0,r0
    beq        LAB_08081e26
    bl         NPC_Talk_SaveState
    b          LAB_08081e60
LAB_08081e26:
    bl         NPC_InterpretCommands
    ldr        r7,PTR_PTR_NPC_1_0_WaitMove_08081eb0
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrh       r0,[r5,#0x3c]
    ldrh       r1,[r5,#0x3e]
    cmp        r0,r1
    beq        LAB_08081e50
    add        r1,r0,#0x0
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
LAB_08081e50:
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    beq        LAB_08081e60
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_08081e60:
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetPaletteIndex
    ldr        r0,[r5,#0x64]
    ldr        r1,[r5,#0x68]
    cmp        r0,r1
    beq        LAB_08081e76
    bl         SpritePtr_SetObjectExcludeFlags
LAB_08081e76:
    ldrb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    ldrb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    ldrh       r0,[r5,#0x3c]
    strh       r0,[r5,#0x3e]
    ldr        r0,[r5,#0x64]
    str        r0,[r5,#0x68]
    bl         NPC_SetCollision
    ldr        r0,[r5,#0x60]
    tst        r0,r0
    bne        LAB_08081e9c
    add        r0,r5,#0x0
    add        r0,#0x24
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
LAB_08081e9c:
    bl         SpritePtr_SetPriority
    pop        {pc}

    .align 2, 0


PTR_NPC_1_0_WaitMove_08081ea4:
    .word NPC_1_0_WaitMove
    .word NPC_1_1_Move
    .word NPC_1_2_HandleZMovement

PTR_PTR_NPC_1_0_WaitMove_08081eb0:
    .word PTR_NPC_1_0_WaitMove_08081ea4


_ts NPC_1_0_WaitMove
    push       {lr}
    ldrh       r0,[r5,#0x20]
    sub        r0,#0x1
    strh       r0,[r5,#0x20]
    bne        LAB_08081ec2
    bl         NPC_ContinueScript
LAB_08081ec2:
    pop        {pc}


_ts NPC_1_1_Move
    push       {lr}
    ldr        r7,PTR_PTR_NPC_1_1_0_CalcNextMove_08081edc
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_NPC_1_1_0_CalcNextMove_08081ed4:
    .word NPC_1_1_0_CalcNextMove
    .word NPC_1_1_1_PerformMove

PTR_PTR_NPC_1_1_0_CalcNextMove_08081edc:
    .word PTR_NPC_1_1_0_CalcNextMove_08081ed4


_ts NPC_1_1_0_CalcNextMove
    push       {lr}
    @@ First, find the next position by adding 8 to X or Y,
    @@ depending on the facing direction
    ldr        r7,PTR_listPosDiffFull_08081fa0
    ldrb       r0,[r5,#0xe]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldr        r0,[r5,#0x24]
    mov        r3,#0x0
    ldrsh      r1,[r7,r3]
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x6c]
    ldr        r0,[r5,#0x28]
    mov        r3,#0x2
    ldrsh      r1,[r7,r3]
    lsl        r1,r1,#0x10
    add        r0,r0,r1
    str        r0,[r5,#0x70]
    @@ Divide 8 units by the position increment count
    @@ to get the movement delta count
    ldr        r0,DAT_08081fa4
    ldrb       r1,[r5,#0x4]
    push       {r5}
    bl         SWI_Div
    pop        {r5}
    ldr        r1,DAT_08081fb0
    add        r0,r0,r1
    lsr        r0,r0,#0xc
    strh       r0,[r5,#0x20]
    @@ Set the position delta to add to the curr pos
    @@ by multiplying the basic unit by the posIncrementCount
    ldr        r7,PTR_listPosDiffSmall_08081f9c
    ldrb       r0,[r5,#0xe]
    add        r0,r0,r0
    add        r7,r7,r0
    ldrb       r4,[r5,#0x4]
    mov        r3,#0x0
    ldrsb      r1,[r7,r3]
    mul        r1,r4
    lsl        r1,r1,#0xc
    str        r1,[r5,#0x40]
    mov        r3,#0x1
    ldrsb      r1,[r7,r3]
    mul        r1,r4
    lsl        r1,r1,#0xc
    str        r1,[r5,#0x44]
    mov        r0,#0x0
    str        r0,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r1,[r5,#0x40]
    ldr        r0,[r5,#0x24]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x28]
    add        r0,r0,r1
    str        r0,[r5,#0x34]
    ldr        r1,[r5,#0x48]
    ldr        r0,[r5,#0x2c]
    add        r0,r0,r1
    str        r0,[r5,#0x38]
    bl         NPC_AddMovingHitbox
    pop        {pc}

listPosDiffFull:
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x08, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0x08, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0xF8, 0xFF, 0x00, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .byte 0x00, 0x00, 0xF8, 0xFF

listPosDiffSmall:
    cell_pos 0, 0
    cell_pos 1, 0
    cell_pos 0, 0
    cell_pos 0, 1
    cell_pos 0, 0
    cell_pos -1, 0
    cell_pos 0, 0
    cell_pos 0, -1

DAT_08081f8a:
    .byte 0x00
    .byte 0x08
    .byte 0x00
    .byte 0x09
    .byte 0x00
    .byte 0x0A
    .byte 0x00
    .byte 0x0B

DAT_08081f92:
    .byte 0x00
    .byte 0x01
    .byte 0x00
    .byte 0x03
    .byte 0x00
    .byte 0x05
    .byte 0x00
    .byte 0x07

    .align 2, 0


PTR_listPosDiffSmall_08081f9c:
    .word listPosDiffSmall

PTR_listPosDiffFull_08081fa0:
    .word listPosDiffFull

DAT_08081fa4:
    .word 0x80000
    .word DAT_08081f8a
    .word DAT_08081f92

DAT_08081fb0:
    .word 0xFFF


_ts NPC_1_1_1_PerformMove
    push       {lr}
    bl         NPC_IsBlockedByPlayer
    tst        r0,r0
    bne        LAB_08082004
    ldr        r0,[r5,#0x30]
    str        r0,[r5,#0x24]
    ldr        r0,[r5,#0x34]
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x38]
    str        r0,[r5,#0x2c]
    ldrh       r0,[r5,#0x20]
    sub        r0,#0x1
    strh       r0,[r5,#0x20]
    bne        LAB_08081fee
    ldr        r0,[r5,#0x6c]
    str        r0,[r5,#0x24]
    ldr        r0,[r5,#0x70]
    str        r0,[r5,#0x28]
    ldrb       r0,[r5,#0x5]
    sub        r0,#0x1
    strb       r0,[r5,#0x5]
    bne        LAB_08081fe8
    bl         NPC_ContinueScript
    pop        {pc}
LAB_08081fe8:
    bl         NPC_1_1_0_CalcNextMove
    pop        {pc}
LAB_08081fee:
    ldr        r1,[r5,#0x40]
    ldr        r0,[r5,#0x30]
    add        r0,r0,r1
    str        r0,[r5,#0x30]
    ldr        r1,[r5,#0x44]
    ldr        r0,[r5,#0x34]
    add        r0,r0,r1
    str        r0,[r5,#0x34]
    bl         NPC_AddMovingHitbox
    pop        {pc}
LAB_08082004:
    bl         NPC_AddMovingHitbox
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x02
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .word DAT_08081f8a
    .word DAT_08081f92


_ts NPC_1_2_HandleZMovement
    push       {lr}
    ldr        r7,PTR_PTR_NPC_1_2_0_CalcYZ_08082030
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_NPC_1_2_0_CalcYZ_08082028:
    .word NPC_1_2_0_CalcYZ
    .word NPC_1_2_1_MoveZ

PTR_PTR_NPC_1_2_0_CalcYZ_08082030:
    .word PTR_NPC_1_2_0_CalcYZ_08082028


_ts NPC_1_2_0_CalcYZ
    push       {lr}
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x48]
    mov        r3,#0x5
    ldrsb      r0,[r5,r3]
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt NPC_1_2_1_MoveZ
    push       {lr}
    ldr        r0,[r5,#0x48]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x48]
    ldr        r1,[r5,#0x2c]
    add        r0,r0,r1
    cmp        r0,#0x0
    bpl        LAB_0808206a
    mov        r0,#0x0
    str        r0,[r5,#0x2c]
    strb       r0,[r5,#0x17]
    bl         NPC_ContinueScript
LAB_0808206a:
    str        r0,[r5,#0x2c]
    pop        {pc}


_nt NPC_2_Talking
    push       {lr}
    ldr        r7,PTR_PTR_NPC_2_0_08082088
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         SpritePtr_ProcessFrameDelay
    bl         NPC_SetCollision
    pop        {pc}

PTR_NPC_2_0_08082084:
    .word NPC_2_0

PTR_PTR_NPC_2_0_08082088:
    .word PTR_NPC_2_0_08082084


_ts NPC_2_0
    push       {lr}
    ldr        r7,PTR_PTR_NPC_2_0_0_080820a4
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_NPC_2_0_0_0808209c:
    .word NPC_2_0_0
    .word NPC_2_0_1

PTR_PTR_NPC_2_0_0_080820a4:
    .word PTR_NPC_2_0_0_0808209c


_ts NPC_2_0_0
    push       {lr}
    ldr        r0,[r5,#0x5c]
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_080820c8
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    add        r0,#0x4
    mov        r1,#0x7
    and        r0,r1
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_080820c8:
    push       {r5}
    ldrb       r0,[r5,#0x1c]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    bl         NPC_2_0_1
    pop        {pc}


_ts NPC_2_0_1
    push       {lr}
    ldr        r0,PTR_gTextOptionFlags_080820fc
    ldr        r0,[r0,#0x0]
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_080820fa
    LoadMain world, r7, r7
    ldr        r6,PTR_gNpcTalkState_08082100
    mov        r0,#0x0
    strb       r0,[r7,#0x1a]
    strb       r0,[r6,#0x0]
    strb       r0,[r5,#0x7]
    bl         NPC_Talk_RestoreState
LAB_080820fa:
    pop        {pc}

PTR_gTextOptionFlags_080820fc:
    .word gTextOptionFlags

PTR_gNpcTalkState_08082100:
    .word gNpcTalkState


_ts NPC_InterpretCommands
    push       {lr}
LAB_08082106:
    ldrb       r0,[r5,#0x19]
    tst        r0,r0
    bne        LAB_0808211e
    ldr        r6,[r5,#0x50]
    ldrb       r0,[r6,#0x0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_NPC_Command_00_Stop_08082120
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    str        r6,[r5,#0x50]
    b          LAB_08082106
LAB_0808211e:
    pop        {pc}

PTR_PTR_NPC_Command_00_Stop_08082120:
    .word PTR_NPC_Command_00_Stop_08082124

PTR_NPC_Command_00_Stop_08082124:
    .word NPC_Command_00_Stop
    .word 0
    .word NPC_Command_02_Jump
    .word NPC_Command_03_Destroy
    .word NPC_Command_04_JumpIfFlag
    .word NPC_Command_05_JumpIfNotFlag
    .word NPC_Command_06_SetFlag
    .word NPC_Command_07_ClearFlag
    .word NPC_Command_08_Init
    .word NPC_Command_09_InitNoSprite
    .word NPC_Command_0A_SetRadius
    .word NPC_Command_0B_SetHeight
    .word NPC_Command_0C_SetHitboxOffset
    .word NPC_Command_0D_EnableDialog
    .word NPC_Command_0E_DisableDialog
    .word NPC_Command_0F_SetPalette
    .word NPC_Command_10_Wait
    .word NPC_Command_11_Drop
    .word NPC_Command_12_EnableTurn
    .word NPC_Command_13_DisableTurn
    .word NPC_Command_14_SetPosition
    .word NPC_Command_15_Move
    .word NPC_Command_16_SetSpriteFrame
    .word NPC_Command_17_SetSprite
    .word NPC_Command_18_SetAreaDialogue
    .word NPC_Command_19_SpriteAutoPriority
    .word NPC_Command_1A_SpriteHighPriority
    .word NPC_Command_1B_SpriteLowPriority
    .word NPC_Command_1C_SetObjExcludeFlags
    .word NPC_Command_1D_SetObjExcludeFlag
    .word NPC_Command_1E_ClearObjExcludeFlag
    .word NPC_Command_1F_DisableCollision
    .word NPC_Command_20_EnableCollision
    .word NPC_Command_21_SetNoZClip
    .word NPC_Command_22_SetZClip
    .word NPC_Command_23_ClearZClip
    .word NPC_Command_24_SetSpriteLong


_ts NPC_Command_00_Stop
    push       {lr}
    bl         NPC_StopScript
    pop        {pc}


_ts NPC_Command_02_Jump
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetInt
    add        r6,r0,#0x0
    pop        {pc}


_ts NPC_Command_03_Destroy
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    bl         NPC_Free
    bl         NPC_StopScript
    pop        {pc}


_ts NPC_Command_04_JumpIfFlag
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    bl         Flag_GetBase
    beq        LAB_080821f4
    add        r0,r6,#0x3
    bl         NPC_Command_GetInt
    add        r6,r0,#0x0
    pop        {pc}
LAB_080821f4:
    add        r6,#0x7
    pop        {pc}


_ts NPC_Command_05_JumpIfNotFlag
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    bl         Flag_GetBase
    bne        LAB_08082210
    add        r0,r6,#0x3
    bl         NPC_Command_GetInt
    add        r6,r0,#0x0
    pop        {pc}
LAB_08082210:
    add        r6,#0x7
    pop        {pc}


_ts NPC_Command_06_SetFlag
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    bl         Flag_SetBase
    add        r6,#0x3
    pop        {pc}


_ts NPC_Command_07_ClearFlag
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    bl         Flag_ClearBase
    add        r6,#0x3
    pop        {pc}


_ts NPC_Command_08_Init
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_09_InitNoSprite
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_0A_SetRadius
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0xc]
    add        r6,#0x2
    mov        pc,lr


_ts NPC_Command_0B_SetHeight
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0xd]
    add        r6,#0x2
    mov        pc,lr


_ts NPC_Command_0C_SetHitboxOffset
    mov        r1,#0x1
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x11]
    mov        r1,#0x2
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x12]
    mov        r1,#0x3
    ldrsb      r0,[r6,r1]
    strb       r0,[r5,#0x13]
    add        r6,#0x4
    mov        pc,lr


_nt NPC_Command_0D_EnableDialog
    mov        r0,#0x1
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_0E_DisableDialog
    mov        r0,#0x1
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_0F_SetPalette
    push       {lr}
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x16]
    add        r6,#0x2
    pop        {pc}


_nt NPC_Command_10_Wait
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldrb       r0,[r6,#0x1]
    strh       r0,[r5,#0x20]
    bl         NPC_StopScript
    add        r6,#0x2
    pop        {pc}


_ts NPC_Command_11_Drop
    push       {lr}
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x4]
    ldrb       r0,[r6,#0x2]
    strb       r0,[r5,#0x5]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         NPC_StopScript
    add        r6,#0x3
    pop        {pc}


_nt NPC_Command_12_EnableTurn
    mov        r0,#0x2
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_13_DisableTurn
    mov        r0,#0x2
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_14_SetPosition
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x24]
    add        r0,r6,#0x3
    bl         NPC_Command_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x28]
    add        r0,r6,#0x5
    bl         NPC_Command_GetShort
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x2c]
    add        r6,#0x7
    pop        {pc}


_ts NPC_Command_15_Move
    push       {lr}
    ldrb       r2,[r6,#0x1]
    strb       r2,[r5,#0xe]
    ldrb       r2,[r6,#0x2]
    strb       r2,[r5,#0x4]
    ldrb       r2,[r6,#0x3]
    strb       r2,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         NPC_StopScript
    add        r6,#0x4
    pop        {pc}


_nt NPC_Command_16_SetSpriteFrame
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x14]
    add        r6,#0x2
    mov        pc,lr


_nt NPC_Command_17_SetSprite
    ldrb       r0,[r6,#0x1]
    strh       r0,[r5,#0x3c]
    add        r6,#0x2
    mov        pc,lr


_nt NPC_Command_18_SetAreaDialogue
    ldrb       r0,[r6,#0x1]
    strb       r0,[r5,#0x1c]
    add        r6,#0x2
    mov        pc,lr


_nt NPC_Command_19_SpriteAutoPriority
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr


_nt NPC_Command_1A_SpriteHighPriority
    mov        r0,#0x1
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr


_nt NPC_Command_1B_SpriteLowPriority
    mov        r0,#0x2
    str        r0,[r5,#0x60]
    add        r6,#0x1
    mov        pc,lr


_nt NPC_Command_1C_SetObjExcludeFlags
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetInt
    str        r0,[r5,#0x64]
    add        r6,#0x5
    pop        {pc}


_ts NPC_Command_1D_SetObjExcludeFlag
    push       {lr}
    ldrb       r0,[r6,#0x1]
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    ldr        r0,[r5,#0x64]
    orr        r0,r1
    str        r0,[r5,#0x64]
    add        r6,#0x2
    pop        {pc}


_ts NPC_Command_1E_ClearObjExcludeFlag
    push       {lr}
    ldrb       r0,[r6,#0x1]
    ldrb       r0,[r6,#0x1]
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    mvn        r1,r1
    ldr        r0,[r5,#0x64]
    and        r0,r1
    str        r0,[r5,#0x64]
    add        r6,#0x2
    pop        {pc}


_ts NPC_Command_1F_DisableCollision
    mov        r0,#0x4
    ldr        r1,[r5,#0x5c]
    orr        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_ts NPC_Command_20_EnableCollision
    mov        r0,#0x4
    mvn        r0,r0
    ldr        r1,[r5,#0x5c]
    and        r1,r0
    str        r1,[r5,#0x5c]
    add        r6,#0x1
    mov        pc,lr


_nt NPC_Command_21_SetNoZClip
    push       {lr}
    bl         SpritePtr_NoZClip
    add        r6,#0x1
    pop        {pc}


_ts NPC_Command_22_SetZClip
    push       {lr}
    bl         SpritePtr_SetZClip
    add        r6,#0x1
    pop        {pc}


_nt NPC_Command_23_ClearZClip
    push       {lr}
    bl         SpritePtr_Flag_ClearZClip
    add        r6,#0x1
    pop        {pc}


_ts NPC_Command_24_SetSpriteLong
    push       {lr}
    add        r0,r6,#0x1
    bl         NPC_Command_GetShort
    strh       r0,[r5,#0x3c]
    add        r6,#0x3
    pop        {pc}


_nt NPC_SetCommand
    push       {lr}
    str        r0,[r5,#0x50]
    mov        r0,#0x0
    strb       r0,[r5,#0x19]
    strb       r0,[r5,#0x18]
    pop        {pc}


_nt NPC_ContinueScript
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x19]
    pop        {pc}


_nt NPC_StopScript
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x19]
    pop        {pc}


_nt NPC_SetCollision
    push       {lr}
    push       {r5}
    ldr        r4,[r5,#0x4c]
    mvn        r0,r4
    mov        r8,r0
    ldr        r0,[r5,#0x5c]
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080823fa
    mov        r4,#0x0
LAB_080823fa:
    ldr        r0,[r5,#0x24]
    mov        r6,#0x11
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r0,r0,r6
    ldr        r1,[r5,#0x28]
    mov        r6,#0x12
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r1,r1,r6
    ldr        r2,[r5,#0x2c]
    mov        r6,#0x13
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r2,r2,r6
    mov        r6,#0x54
    add        r6,r6,r5
    ldrh       r3,[r5,#0xc]
    mov        r5,r8
    bl         EntityBounds_AddToList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x54]
    pop        {pc}


_ts NPC_AddMovingHitbox
    push       {lr}
    push       {r5}
    ldr        r0,[r5,#0x30]
    mov        r6,#0x11
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r0,r0,r6
    ldr        r1,[r5,#0x34]
    mov        r6,#0x12
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r1,r1,r6
    ldr        r2,[r5,#0x38]
    mov        r6,#0x13
    ldrsb      r6,[r5,r6]
    lsl        r6,r6,#0x10
    add        r2,r2,r6
    mov        r6,#0x58
    add        r6,r6,r5
    ldr        r3,INT_08082468
    mov        r4,#0x0
    ldr        r5,[r5,#0x4c]
    mvn        r5,r5
    bl         EntityBounds_AddToList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x58]
    pop        {pc}

    .align 2, 0


INT_08082468:
    .word 0x2006


_ts NPC_Talk_SaveState
    push       {lr}
    ldrb       r0,[r5,#0x9]
    strb       r0,[r5,#0x1d]
    ldrb       r0,[r5,#0xa]
    strb       r0,[r5,#0x1e]
    ldrb       r0,[r5,#0xb]
    strb       r0,[r5,#0x1f]
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt NPC_Talk_RestoreState
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x1d]
    strb       r0,[r5,#0x9]
    ldrb       r0,[r5,#0x1e]
    strb       r0,[r5,#0xa]
    ldrb       r0,[r5,#0x1f]
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x18]
    pop        {pc}


_ts NPC_Talk_Main
    push       {lr}
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_080824ba
    bl         Scene_IsSceneActive
    bne        LAB_080824ba
    b          LAB_080824c0
LAB_080824ba:
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    b          LAB_080824cc
LAB_080824c0:
    ldrb       r0,[r5,#0x7]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_NPC_Talk_0_SetReady_080824dc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_080824cc:
    pop        {pc}

    .align 2, 0


PTR_NPC_Talk_0_SetReady_080824d0:
    .word NPC_Talk_0_SetReady
    .word NPC_Talk_1_CheckPlayerReady
    .word NPC_Talk_2_Start

PTR_PTR_NPC_Talk_0_SetReady_080824dc:
    .word PTR_NPC_Talk_0_SetReady_080824d0


_ts NPC_Talk_0_SetReady
    push       {lr}
    ldr        r7,PTR_gNpcTalkState_08082528
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_080824fa
    ldr        r0,[r5,#0x54]
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080824fa
    mov        r0,#0x1
    ldr        r1,PTR_gNpcTalkState_08082528
    strb       r0,[r1,#0x0]
    strb       r0,[r5,#0x7]
LAB_080824fa:
    mov        r0,#0x0
    pop        {pc}


_nt NPC_Talk_1_CheckPlayerReady
    push       {lr}
    ldr        r1,PTR_gNpcTalkState_08082528
    ldrb       r0,[r1,#0x0]
    cmp        r0,#0x2
    bne        LAB_0808250c
    mov        r0,#0x2
    strb       r0,[r5,#0x7]
LAB_0808250c:
    mov        r0,#0x0
    pop        {pc}


_ts NPC_Talk_2_Start
    push       {lr}
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    bne        LAB_08082522
    mov        r0,#0x3
    ldr        r1,PTR_gNpcTalkState_08082528
    strb       r0,[r1,#0x0]
    mov        r0,#0x1
    pop        {pc}
LAB_08082522:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_gNpcTalkState_08082528:
    .word gNpcTalkState


_ts NPC_IsBlockedByPlayer
    push       {lr}
    mov        r0,#0x0
    ldr        r1,[r5,#0x4c]
    mvn        r1,r1
    lsr        r1,r1,#0x10
    lsl        r1,r1,#0x10
    ldr        r2,DAT_08082548
    orr        r2,r1
    ldr        r1,[r5,#0x58]
    tst        r1,r2
    beq        LAB_08082544
    mov        r0,#0x1
LAB_08082544:
    pop        {pc}

    .align 2, 0


DAT_08082548:
    .word 0x1


_ts NPC_Command_GetShort
    ldrb       r1,[r0,#0x0]
    ldrb       r0,[r0,#0x1]
    lsl        r0,r0,#0x8
    orr        r0,r1
    mov        pc,lr


_nt NPC_Command_GetInt
    ldrb       r1,[r0,#0x0]
    ldrb       r2,[r0,#0x1]
    lsl        r2,r2,#0x8
    ldrb       r3,[r0,#0x2]
    lsl        r3,r3,#0x10
    ldrb       r0,[r0,#0x3]
    lsl        r0,r0,#0x18
    orr        r0,r1
    orr        r0,r2
    orr        r0,r3
    mov        pc,lr


_ts NPC_SetIdFlag
    push       {lr}
    ldrb       r0,[r5,#0x10]
    add        r0,#0x10
    mov        r1,#0x1
    lsl        r1,r0
    str        r1,[r5,#0x4c]
    pop        {pc}


_nt NPC_PrintMovement
    push       {lr}
    push       {r5}
    ldr        r0,PTR_DAT_080825f0
    ldr        r1,[r5,#0x24]
    ldr        r2,[r5,#0x28]
    ldr        r3,[r5,#0x30]
    ldr        r4,[r5,#0x34]
    bl         Debug_Print
    pop        {r5}
    pop        {pc}

DAT_08082590:
    debug_str 0x00, 0x07, " X:%X\n Y:%X\nOX:%X\nOY:%X\nTM:%D"


_ts NPC_FindByIndex
    mov        r3,#0x10
    ldr        r7,PTR_gEntityListNpc_080825c8
LAB_080825b4:
    ldrb       r1,[r7,#0x10]
    cmp        r1,r0
    beq        LAB_080825c2
    add        r7,#0xc0
    sub        r3,#0x1
    bne        LAB_080825b4
    mov        r7,#0x0
LAB_080825c2:
    add        r0,r7,#0x0
    mov        pc,lr

    .align 2, 0


PTR_gEntityListNpc_080825c8:
    .word gEntityListNpc


_ts NPC_ResetAllTalkState
    push       {lr}
    ldr        r6,PTR_gEntityListNpc_080825e8
    mov        r0,#0x0
    mov        r2,#0x0
LAB_080825d4:
    strb       r0,[r6,#0x7]
    add        r6,#0xc0
    add        r2,#0x1
    cmp        r2,#0x10
    blt        LAB_080825d4
    ldr        r7,PTR_gNpcTalkState_080825ec
    strb       r0,[r7,#0x0]
    pop        {pc}
    .word gBitsetNPC

PTR_gEntityListNpc_080825e8:
    .word gEntityListNpc

PTR_gNpcTalkState_080825ec:
    .word gNpcTalkState

PTR_DAT_080825f0:
    .word DAT_08082590
