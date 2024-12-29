#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Struct_C1C0_0200c1c0, 0x200c1c0
    .set PlayerMpState_ARRAY_020075a0, 0x20075a0

    .text

    .thumb

_ts Battle_Main
    push       { lr }
    LoadMain battle, r5, r5
    mov        r0,#0x1
    strb       r0,[r5,#0x1f]
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08005890
    ldrb       r0,[r5,#0x1d]
    cmp        r0,#0xff
    beq        LAB_08005890
    ldrb       r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_0800588c
    bl         FUN_08007acc
    strb       r0,[r5,#0x1f]
    b          LAB_08005890
LAB_0800588c:
    bl         FUN_08007828
LAB_08005890:
    ldr        r0,=jumpTableBattleMain
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Battle_IsActive
    tst        r0,r0
    beq        LAB_080058aa
    bl         dummy_10280
    bl         Battle_SetFieldTilemap
LAB_080058aa:
    bl         BattleSpriteQueue_TransferAll
    push       { r5 }
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        { r5 }
    ldrb       r0,[r5,#0x1f]
    tst        r0,r0
    beq        LAB_080058e0
    bl         Battle_IsTimerPaused
    tst        r0,r0
    bne        LAB_080058e0
    ldr        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_080058e0:
    bl         Battle_AdvanceTimer
    pop        { pc }
    .align 2, 0

jumpTableBattleMain:
    .word Battle_0_Init
    .word Battle_1_Main
    .word Battle_2_BattleEnd
    .word Battle_3_TransmissionError

    .pool

_ts Battle_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,=PTR_Battle_0_0_InitStats
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_Battle_0_0_InitStats:
    .word Battle_0_0_InitStats
    .word Battle_0_1_InitField
    .word Battle_0_2_InitStatsMP

    .pool

_ts Battle_0_0_InitStats
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08005938
    bl         FUN_0809bc4c
    bl         PlayerMPState_Free
    mov        r0,#0x3c
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    b          LAB_08005948
LAB_08005938:
    bl         PlayerBattleState_InitStats
    LoadMain gameStats, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#0x24]
    str        r0,[r7,#0x28]
    mov        r0,#0x4
LAB_08005948:
    strb       r0,[r5,#0x1]
    pop        {pc}

_ts Battle_0_1_InitField
    push       {lr}
    bl         Battle_InitChipDeck
    bl         Battle_InitEnemyList
    bl         Battle_InitBackground
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_08005970
    ldr        r0,PTR_gSpriteDecompLocation1_08005a28
    bl         SpriteLz_Init
    ldr        r0,[r5,#0x74]
    bl         SpriteLz_DecompressEnemyList
LAB_08005970:
    push       {r5}
    bl         BattleUi_Init
    mov        r0,#0x2
    ldr        r7,PTR_TransferStruct_ARRAY_08005a0c
LAB_0800597a:
    push       {r0,r7}
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r0,r7}
    add        r7,#0xc
    sub        r0,#0x1
    bne        LAB_0800597a
    pop        {r5}
    LoadMain display, r7, r7
    ldr        r1,INT_08005a04
    strh       r1,[r7,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    bl         Field_InitializeAreaProperties
    LoadMain camera, r7, r7
    ldr        r0,INT_08005a08
    str        r0,[r7,#0x30]
    bl         FieldObject_Init
    mov        r0,#0xff
    mov        r3,#0x8
    mov        r7,#0x4c
    add        r7,r7,r5
LAB_080059b4:
    strb       r0,[r7,#0x0]
    add        r7,#0x1
    sub        r3,#0x1
    bne        LAB_080059b4
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    LoadMain world, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x9]
    str        r0,[r6,#0x58]
    bl         FieldObstacleManager_Init
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    ldr        r7,PTR_battleSongList_08005a00
    ldrb       r0,[r7,r0]
    bl         Sound_ChangeSong
    bl         Battle_IncreaseBattleCount
    pop        {pc}

battleSongList:
    .byte T_Operation
    .byte T_Operation
    .byte T_Operation
    .byte T_Operation
    .byte T_Operation
    .byte T_Net_Battle
    .byte T_Vs_Life_Virus
    .byte T_Net_Battle
    .byte T_Operation
    .byte T_Operation
PTR_battleSongList_08005a00: .word battleSongList
INT_08005a04: .word 0x1F40
INT_08005a08: .word 0xFFF00000
PTR_TransferStruct_ARRAY_08005a0c: .word TransferStruct_ARRAY_08005a10

TransferStruct_ARRAY_08005a10:
    .word tilesetBattleMiscellaneous
    .word 0x6017200
    .word 0x180

    .word paletteCustomScreenBg_1
    .word eObjPaletteB
    .word 0x8
PTR_gSpriteDecompLocation1_08005a28: .word gSpriteDecompLocation1

_ts Battle_0_2_InitStatsMP
    push       {lr}
    ldrb       r0,[r5,#0x1e]
    cmp        r0,#0x1
    bne        LAB_08005a52
    bl         SIO_GetMultiplayerId
    strb       r0,[r5,#0x1b]
    mov        r1,#0x0
    sub        r1,#0x2
    tst        r0,r1
    bne        LAB_08005a60
    strb       r0,[r5,#0x1a]
    ldr        r7,PTR_gIsObjectXFlipped_08005a78
    strb       r0,[r7,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_08005a74
LAB_08005a52:
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bmi        LAB_08005a60
    bl         FUN_08007994
    b          LAB_08005a74
LAB_08005a60:
    mov        r0,#0x3
    LoadMain world, r7, r7
    strb       r0,[r7,#0x10]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08005a74:
    pop        {pc}

    .align 2, 0

PTR_gIsObjectXFlipped_08005a78: .word gIsObjectXFlipped


_ts Battle_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1f]
    tst        r0,r0
    beq        LAB_08005ab4
    bl         BattleSpriteQueue_Clear
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    lsl        r0,r0,#0x2
    ldr        r7,=JT_R5_0C_5AB8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         BattleUi_Update
    pop        {r5}
LAB_08005ab4:
    pop        {pc}

    .align 2, 0

JT_R5_0C_5AB8:
    .word Battle_Regular
    .word Battle_Tutorial1
    .word Battle_Tutorial2
    .word Battle_Regular
    .word Battle_Tutorial3
    .word Battle_Regular
    .word Battle_Regular
    .word Battle_Regular
    .word Battle_Regular
    .word Battle_Regular

    .pool

    .word Struct_C1C0_0200c1c0
    .word PlayerMpState_ARRAY_020075a0


_ts Battle_2_BattleEnd
    push       {lr}
    bl         BattleSpriteQueue_Clear
    ldr        r7,=JT_R5_0C_5B1C
    ldrb       r0,[r5,#0x1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         BattleUi_Update
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    pop        {r5}
    pop        {pc}

    .align 2, 0

JT_R5_0C_5B1C:
    .word Battle_2_0_EnemyDeleted
    .word Battle_2_1_MegaManDeleted
    .word Battle_2_2_BattleEnd
    .word Battle_2_3_BattleResult
    .word Battle_2_4_BattleResult_MP

    .pool


_ts Battle_2_0_EnemyDeleted
    push       {lr}
    ldr        r7,=PTR_Battle_2_0_0_LoadMessage
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_Battle_2_0_0_LoadMessage:
    .word Battle_2_0_0_LoadMessage
    .word Battle_2_0_1_ShowMessage
    .word Battle_2_0_2_CalculateRank

    .pool

_nt Battle_2_0_0_LoadMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt Battle_2_0_1_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08005b7e
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08005b7e:
    pop        {pc}


_ts Battle_2_0_2_CalculateRank
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08005bbc
    bl         Effect_BattleResult_CalculateRank
    LoadMain world, r7, r7
    strb       r0,[r7,#0x19]
    mov        r0,#0x0
    strb       r0,[r7,#0x10]
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x0
    beq        LAB_08005ba8
    cmp        r1,#0x5
    beq        LAB_08005ba8
    cmp        r1,#0x7
    beq        LAB_08005ba8
    b          LAB_08005bac
LAB_08005ba8:
    mov        r0,#0xc
    b          LAB_08005bb6
LAB_08005bac:
    cmp        r1,#0x8
    bne        LAB_08005bb4
    mov        r0,#0x10
    b          LAB_08005bb6
LAB_08005bb4:
    mov        r0,#0x8
LAB_08005bb6:
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08005bbc:
    pop        {pc}


_nt Battle_2_1_MegaManDeleted
    push       {lr}
    ldr        r7,=JT_R5_0C_5BCC
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
JT_R5_0C_5BCC:
    .word Battle_2_1_0_LoadMessage
    .word Battle_2_1_1_ShowMessage
    .word Battle_2_1_2_End

    .pool

_nt Battle_2_1_0_LoadMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt Battle_2_1_1_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08005c06
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08005c06:
    pop        {pc}


_nt Battle_2_1_2_End
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08005c30
    LoadMain world, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x19]
    mov        r0,#0x1
    strb       r0,[r7,#0x10]
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    bne        LAB_08005c28
    mov        r0,#0x10
    b          LAB_08005c2a
LAB_08005c28:
    mov        r0,#0x8
LAB_08005c2a:
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08005c30:
    pop        {pc}


_nt Battle_2_2_BattleEnd
    push       {lr}
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    bne        LAB_08005c58
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    bl         Sound_StopAllMusic
    bl         Sio_SetReady
    mov        r0,#0xff
    strb       r0,[r5,#0x1d]
    pop        {pc}
LAB_08005c58:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08005cde
    push       {r5}
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    pop        {r5}
    bl         DisableScreenDim
    LoadMain world, r0, r7
    ldrb       r1,[r0,#0x10]
    cmp        r1,#0x1
    bne        LAB_08005c96
    ldrb       r1,[r0,#0xf]
    cmp        r1,#0x0
    beq        LAB_08005c8c
    cmp        r1,#0x5
    beq        LAB_08005c8c
    cmp        r1,#0x6
    beq        LAB_08005c8c
    b          LAB_08005c96
LAB_08005c8c:
    push       {r5,r7}
    bl         World_StartGameOver
    pop        {r5,r7}
    b          LAB_08005cd2
LAB_08005c96:
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_08005ca2
    mov        r1,#0x4
LAB_08005ca2:
    strb       r1,[r0,#0x0]
    ldrb       r1,[r0,#0x4]
    strb       r1,[r0,#0xc]
    ldrb       r1,[r0,#0x5]
    strb       r1,[r0,#0xd]
    mov        r1,#0x0
    strb       r1,[r0,#0x9]
    LoadMain manager, r6, r7
    ldrb       r2,[r0,#0xf]
    cmp        r2,#0x8
    blt        LAB_08005cc6
    push       {r5,r6}
    bl         InitMenu_MP
    pop        {r5,r6}
    mov        r1,#0x18
    b          LAB_08005cd0
LAB_08005cc6:
    push       {r6}
    bl         Battle_SetPostBattleHP
    pop        {r6}
    mov        r1,#0x4
LAB_08005cd0:
    strb       r1,[r6,#0x0]
LAB_08005cd2:
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r0,#0x3
    bl         Video_SetBgControl
LAB_08005cde:
    pop        {pc}

_nt Battle_2_3_BattleResult
    push       {lr}
    ldrb       r0,[r5,#0x2]
    ldr        r7,=PTR_Battle_2_3_0_BattleResult
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

    .pool
PTR_Battle_2_3_0_BattleResult:
    .word Battle_2_3_0_BattleResult
    .word Battle_2_3_1_Wait

_nt Battle_2_3_0_BattleResult
    push       {lr}
    mov        r0,#0x0
    bl         Effect_BattleResult_Create
    mov        r0,#0x4
    strh       r0,[r5,#0x2]
    pop        {pc}


_nt Battle_2_3_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_08005d1a
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08005d1a:
    pop        {pc}


_nt Battle_2_4_BattleResult_MP
    push       {lr}
    ldrb       r0,[r5,#0x2]
    ldr        r7,=PTR_Battle_2_4_0_BattleResult
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
    .pool
PTR_Battle_2_4_0_BattleResult:
.word Battle_2_4_0_BattleResult
.word Battle_2_4_1_Wait


_nt Battle_2_4_0_BattleResult
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x10]
    add        r0,#0x1
    bl         Effect_BattleResult_Create
    bl         PlayerMPState_Free
    mov        r0,#0x4
    strh       r0,[r5,#0x2]
    pop        {pc}


_nt Battle_2_4_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_08005d60
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08005d60:
    pop        {pc}


_nt Battle_3_TransmissionError
    push       {lr}
    ldr        r7,=PTR_Battle_3_0_ShowMessage
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_Battle_3_0_ShowMessage:
    .word Battle_3_0_ShowMessage
    .word Battle_3_1_FadeOut
    .word Battle_3_2_End

    .pool

_nt Battle_3_0_ShowMessage
    push       {lr}
    ldr        r0,=TextData_BattleMessages
    mov        r1,#0x6
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3
    LoadMain world, r7, r7
    strb       r0,[r7,#0x10]
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}

    .pool


_nt Battle_3_1_FadeOut
    push       {lr}
    bl         Text_CheckIfDialogActive
    bne        LAB_08005db8
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_08005db8:
    pop        {pc}


_nt Battle_3_2_End
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08005dd4
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08005dd4:
    pop        {pc}

_nt BattleR_2_Main
    push       {lr}
    ldr        r7,=PTR_BattleR_2_0_CheckProgramAdvance
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_BattleR_2_0_CheckProgramAdvance:
    .word BattleR_2_0_CheckProgramAdvance
    .word BattleR_2_1_SetupHand
    .word BattleR_2_2_BattleStart
    .word BattleR_2_3_CheckBattleState
    .word BattleR_2_4_CheckUnPause
    .word BattleR_2_5_ScreenDim
    .word BattleR_2_6_End
    .word BattleR_2_7_MaxMode

    .pool


_nt BattleR_2_0_CheckProgramAdvance
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    bne        LAB_08005e20
    push       {r5}
    bl         Effect_ProgramAdvance_Create
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    strh       r0,[r5,#0x2e]
LAB_08005e20:
    ldrh       r0,[r5,#0x2e]
    tst        r0,r0
    beq        LAB_08005e2c
    mov        r0,#0x4
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
LAB_08005e2c:
    pop        {pc}


_nt BattleR_2_2_BattleStart
    push       {lr}
    ldr        r7,=PTR_BattleR_2_2_0_DrawBattleElements
    ldrb       r0,[r5,#0x3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_BattleR_2_2_0_DrawBattleElements:
    .word BattleR_2_2_0_DrawBattleElements
    .word BattleR_2_2_1_LoadMessage
    .word BattleR_2_2_2_ShowMessage
    .word BattleR_2_2_3_StartBattle

    .pool

_nt BattleR_2_2_0_DrawBattleElements
    push       {lr}
    push       {r5}
    bl         BattleUi_DrawFullCustomGauge
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         Battle_SetState_InBattle
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    bl         PlayerMPState_Init
    pop        {pc}


_nt BattleR_2_2_1_LoadMessage
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08005e8c
    push       {r5}
    mov        r0,#0x0
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x3]
LAB_08005e8c:
    pop        {pc}


_nt BattleR_2_2_2_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x0
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08005ea6
    mov        r0,#0xc
    strb       r0,[r5,#0x3]
    mov        r0,#0x1
    strh       r0,[r5,#0x2e]
LAB_08005ea6:
    pop        {pc}


_nt BattleR_2_2_3_StartBattle
    push       {lr}
    ldrb       r0,[r5,#0x1f]
    tst        r0,r0
    beq        LAB_08005ee0
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08005ecc
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
    bl         Battle_UnpauseTimer
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
LAB_08005ecc:
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_08005edc
    bl         Battle_UpdateKeyState
    b          LAB_08005ee0
LAB_08005edc:
    bl         Multiplayer_UpdateKeyState
LAB_08005ee0:
    pop        {pc}


_nt BattleR_2_3_CheckBattleState
    push       {lr}
    bl         Battle_IsActive
    tst        r0,r0
    beq        LAB_08005f38
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08005efc
    bl         Multiplayer_UpdateKeyState
    b          LAB_08005f00
LAB_08005efc:
    bl         Battle_UpdateKeyState
LAB_08005f00:
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x9]
    tst        r0,r0
    bne        LAB_08005f2e
    @ If time is not paused, increment gauge by speed value
    @ FstGauge increases by double, SloGauge increases by half
    ldrh       r0,[r5,#0x3e]
    ldrb       r1,[r5,#0x12]
    add        r0,r0,r1
    strh       r0,[r5,#0x3e]
    ldr        r1,DAT_08005f48
    cmp        r0,r1
    bmi        LAB_08005f26
    @ If gauge is more than 0x4000, cap to val
    ldr        r0,DAT_08005f48
    strh       r0,[r5,#0x3e]
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    bne        LAB_08005f26
    mov        r0,#0x1
    strb       r0,[r5,#0xe]
LAB_08005f26:
    bl         Battle_IncreaseBattleTime
    bl         Battle_ProcessMultipleDelete
LAB_08005f2e:
    ldr        r7,PTR_PTR_BattleR_2_3_0_CheckPauseAndBattleEnd
    ldrb       r0,[r5,#0x3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08005f38:
    pop        {pc}

    .align 2, 0

PTR_BattleR_2_3_0_CheckPauseAndBattleEnd:
    .word BattleR_2_3_0_CheckPauseAndBattleEnd
    .word BattleR_2_3_1_CheckSpritesSpawned
PTR_PTR_BattleR_2_3_0_CheckPauseAndBattleEnd:
    .word PTR_BattleR_2_3_0_CheckPauseAndBattleEnd
DAT_08005f48:
    .word 0x4000


_nt BattleR_2_3_0_CheckPauseAndBattleEnd
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08005f72
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08005f6e
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    mov        r0,#0x2
    strb       r0,[r7,#0x10]
    mov        r0,#0x0
    b          LAB_08005f70
LAB_08005f6e:
    mov        r0,#0x2
LAB_08005f70:
    pop        {pc}
LAB_08005f72:
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08005fa6
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x6
    beq        LAB_08005fa2
    cmp        r0,#0x8
    blt        LAB_08005f9c
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    mov        r0,#0x1
    strb       r0,[r7,#0x10]
    mov        r0,#0x11
    bl         Sound_ChangeSong
    mov        r0,#0x0
    b          LAB_08005fa4
LAB_08005f9c:
    mov        r0,#0x11
    bl         Sound_ChangeSong
LAB_08005fa2:
    mov        r0,#0x1
LAB_08005fa4:
    pop        {pc}
LAB_08005fa6:
    ldrb       r1,[r5,#0xe]
    tst        r1,r1
    beq        LAB_08005fce
    bl         Battle_CheckKeyLR
    tst        r0,r0
    beq        LAB_08005fce
    LoadMain playerBattleState, r7, r7
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#0x19]
    ldrb       r0,[r5,#0xc]
    add        r0,#0x1
    strb       r0,[r5,#0xc]
    bl         Battle_PauseTimer
    mov        r0,#0x18
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
    pop        {pc}
LAB_08005fce:
    bl         Battle_CheckStartPressed
    tst        r0,r0
    beq        LAB_08005fe4
    strb       r0,[r5,#0x14]
    bl         Battle_PauseTimer
    mov        r0,#0x10
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    pop        {pc}
LAB_08005fe4:
    ldrb       r0,[r5,#0x18]
    tst        r0,r0
    beq        LAB_08005ff6
    bl         Battle_PauseTimer
    mov        r0,#0x14
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    pop        {pc}
LAB_08005ff6:
    mov        r0,#0x0
    pop        {pc}


_nt BattleR_2_3_1_CheckSpritesSpawned
    push       {lr}
    bl         Battle_AreAllSpritesSpawned
    tst        r0,r0
    beq        LAB_0800600c
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x10]
    b          LAB_0800600e
LAB_0800600c:
    mov        r0,#0x0
LAB_0800600e:
    pop        {pc}


_nt BattleR_2_4_CheckUnPause
    push       {lr}
    bl         Battle_IsActive
    tst        r0,r0
    beq        LAB_08006052
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08006026
    b          LAB_08006026
LAB_08006026:
    bl         Battle_CheckStartPressed
    tst        r0,r0
    beq        LAB_0800603e
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
    bl         Battle_UnpauseTimer
    ldr        r3,PTR_tsPauseHide_0800605c
    b          LAB_08006040
LAB_0800603e:
    ldr        r3,PTR_tsPauseShow_08006058
LAB_08006040:
    push       {r5}
    mov        r0,#0xb
    mov        r1,#0x9
    mov        r2,#0x3
    mov        r4,#0x7
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_08006052:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_tsPauseShow_08006058:
    .word tsPauseShow
PTR_tsPauseHide_0800605c:
    .word tsPauseHide
tsPauseShow:
    tilemap_entry 0x2F2, 0, 0xC
    tilemap_entry 0x2F3, 0, 0xC
    tilemap_entry 0x2F4, 0, 0xC
    tilemap_entry 0x2F5, 0, 0xC
    tilemap_entry 0x2F6, 0, 0xC
    tilemap_entry 0x2F7, 0, 0xC
    tilemap_entry 0x2F8, 0, 0xC
    tilemap_entry 0x2F9, 0, 0xC
    tilemap_entry 0x2FA, 0, 0xC
    tilemap_entry 0x2FB, 0, 0xC
    tilemap_entry 0x2FC, 0, 0xC
    tilemap_entry 0x2FD, 0, 0xC
    tilemap_entry 0x2FE, 0, 0xC
    tilemap_entry 0x2FF, 0, 0xC
tsPauseHide:
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0
    tilemap_entry 0, 0, 0


_nt BattleR_2_5_ScreenDim
    push       {lr}
    bl         Battle_IsActive
    tst        r0,r0
    beq        LAB_080060b4
    bl         ScreenDim_UpdateAll
    ldrb       r0,[r5,#0x18]
    tst        r0,r0
    bne        LAB_080060b4
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
    bl         Battle_UnpauseTimer
LAB_080060b4:
    mov        r0,#0x0
    pop        {pc}


_nt BattleR_2_1_SetupHand
    push       {lr}
    ldr        r7,=PTR_BattleR_2_1_0_CopyBattleHand
    ldrb       r0,[r5,#0x3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x0
    pop        {pc}
PTR_BattleR_2_1_0_CopyBattleHand:
    .word BattleR_2_1_0_CopyBattleHand
    .word BattleR_2_1_1
    .word BattleR_2_1_2_ShowMessage
    .word BattleR_2_1_3_CopyChipHandIcons

    .pool


_nt BattleR_2_1_0_CopyBattleHand
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_080060f2
    bl         Battle_CopyBattleHand
    mov        r0,#0xc
    strb       r0,[r5,#0x3]
    b          LAB_080060fa
LAB_080060f2:
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    mov        r0,#0xa
    strh       r0,[r5,#0x2e]
LAB_080060fa:
    pop        {pc}


_nt BattleR_2_1_1
    push       {lr}
    ldrb       r0,[r5,#0x1e]
    cmp        r0,#0x2
    bne        LAB_0800610e
    mov        r0,#0xc
    strb       r0,[r5,#0x3]
    bl         FUN_080079c8
    b          LAB_08006128
LAB_0800610e:
    bl         FUN_080079c8
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08006128
    push       {r5}
    mov        r0,#0xd
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x3]
LAB_08006128:
    pop        {pc}


_nt BattleR_2_1_2_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0xd
    bl         BattleMessage_Main
    pop        {r5}
    ldrb       r0,[r5,#0x1e]
    cmp        r0,#0x2
    bne        LAB_0800614a
    push       {r5}
    mov        r0,#0xd
    bl         BattleMessage_Disable
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x3]
LAB_0800614a:
    bl         FUN_080079c8
    pop        {pc}


_nt BattleR_2_1_3_CopyChipHandIcons
    push       {lr}
    bl         Effect_BattleChip_LoadHandIcons
    mov        r0,#0x8
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    blt        LAB_0800616a
    ldrb       r1,[r5,#0xc]
    cmp        r1,#0x10
    bne        LAB_0800616a
    mov        r0,#0x1c
LAB_0800616a:
    strh       r0,[r5,#0x2]
    pop        {pc}


_nt BattleR_2_6_End
    push       {lr}
    ldr        r7,=PTR_BattleR_2_6_0_Wait_0800617c
    ldrb       r0,[r5,#0x3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_BattleR_2_6_0_Wait_0800617c:
    .word BattleR_2_6_0_Wait
    .word BattleR_2_6_1_FreeMP

    .pool


_nt BattleR_2_6_0_Wait
    push       {lr}
    mov        r0,#0xa
    strh       r0,[r5,#0x2e]
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    mov        r0,#0x0
    pop        {pc}


_nt BattleR_2_6_1_FreeMP
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_080061a8
    bl         PlayerMPState_Free
    mov        r0,#0x3
    b          LAB_080061aa
LAB_080061a8:
    mov        r0,#0x0
LAB_080061aa:
    pop        {pc}


_nt BattleR_2_7_MaxMode
    push       {lr}
    ldr        r7,=PTR_BattleR_2_7_0_Darken_080061bc
    ldrb       r0,[r5,#0x3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r0,#0x0
    pop        {pc}
PTR_BattleR_2_7_0_Darken_080061bc:
    .word BattleR_2_7_0_Darken
    .word BattleR_2_7_1_ApplyEffect
    .word BattleR_2_7_2_LoadMessage
    .word BattleR_2_7_3_ShowMessage
    .word BattleR_2_7_4_End

    .pool


_nt BattleR_2_7_0_Darken
    push       {lr}
    mov        r0,#0xc
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x3]
    pop        {pc}

_nt BattleR_2_7_1_ApplyEffect
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08006236
    push       {r5}
    ldr        r7,[r5,#0x40]
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    ldr        r3,[r7,#0x30]
    mov        r4,#0x2c
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0800620e
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
LAB_0800620e:
    pop        {r5}
    push       {r5}
    ldr        r7,[r5,#0x44]
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    ldr        r3,[r7,#0x30]
    mov        r4,#0xac
    bl         Effect_QuickEffect_Create
    beq        LAB_08006226
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
LAB_08006226:
    pop        {r5}
    mov        r0,#0x32
    bl         Flag_SetEvent
    mov        r0,#0x1e
    strh       r0,[r5,#0x2e]
    mov        r0,#0x8
    strb       r0,[r5,#0x3]
LAB_08006236:
    pop        {pc}


_nt BattleR_2_7_2_LoadMessage
    push       {lr}
    ldrh       r0,[r5,#0x2e]
    sub        r0,#0x1
    strh       r0,[r5,#0x2e]
    bne        LAB_08006250
    push       {r5}
    mov        r0,#0xc
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x3]
LAB_08006250:
    pop        {pc}


_nt BattleR_2_7_3_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0xc
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0800627c
    push       {r5}
    mov        r0,#0xc
    bl         BattleMessage_Disable
    pop        {r5}
    mov        r0,#0xb
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x3]
LAB_0800627c:
    pop        {pc}


_nt BattleR_2_7_4_End
    push       {lr}
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08006290
    mov        r0,#0x8
    strh       r0,[r5,#0x2]
LAB_08006290:
    pop        {pc}

_nt Battle_CopyBattleHand
    push       {lr}
    LoadMain playerBattleState, r6, r6
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x19]
    strb       r0,[r6,#0x1]
    mov        r0,#0x78
    add        r0,r0,r7
    mov        r1,#0x6a
    add        r1,r1,r6
    mov        r2,#0x6
    bl         memcpy_8
    pop        {pc}

_nt PlayerBattleState_InitStats
    push       {lr}
    LoadMain playerBattleState, r7, r7
    LoadMain world, r6, r6
    ldrb       r0,[r6,#0x14]
    strb       r0,[r7,#0x9]
    ldrb       r0,[r6,#0x15]
    strb       r0,[r7,#0xa]
    ldrb       r0,[r6,#0x16]
    strb       r0,[r7,#0xb]
    ldrh       r0,[r6,#0x1c]
    strh       r0,[r7,#0x26]
    ldrh       r0,[r6,#0x1e]
    strh       r0,[r7,#0x28]
    ldrb       r0,[r6,#0x17]
    strb       r0,[r7,#0xf]
    pop        {pc}


_nt Battle_UpdateKeyState
    push       {lr}
    LoadMain playerBattleState, r4, r4
    LoadMain input, r6, r6
    bl         Battle_IsInputLocked
    bne        LAB_080062f4
    ldrh       r0,[r6,#0x0]
    ldrh       r1,[r4,#0x1e]
    bl         GetToggledKeys
    strh       r0,[r4,#0x1e]
    strh       r1,[r4,#0x24]
    strh       r2,[r4,#0x20]
    b          LAB_080062fe
LAB_080062f4:
    mov        r0,#0x0
    strh       r0,[r4,#0x1e]
    strh       r0,[r4,#0x20]
    strh       r0,[r4,#0x22]
    strh       r0,[r4,#0x24]
LAB_080062fe:
    pop        {pc}


_nt Battle_CheckKeyLR
    push       {lr}
    mov        r0,#0x0
    push       {r0}
    bl         Battle_IsInputLocked
    pop        {r0}
    bne        LAB_08006338
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_0800632c
    LoadMain playerBattleState, r7, r7
    ldrh       r0,[r7,#0x20]
    add        r7,#0x70
    ldrh       r1,[r7,#0x20]
    orr        r0,r1
    mov        r1,#0x3
    lsl        r1,r1,#0x8
    and        r0,r1
    b          LAB_08006338
LAB_0800632c:
    LoadMain input, r7, r7
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x3
    lsl        r1,r1,#0x8
    and        r0,r1
LAB_08006338:
    pop        {pc}

_nt Battle_CheckStartPressed
    push       {lr}
    mov        r0,#0x0
    push       {r0}
    bl         Battle_IsInputLocked
    pop        {r0}
    bne        LAB_08006386
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_0800637c
    ldr        r7,=gListMpState
    mov        r1,#0x8
    ldrb       r2,[r5,#0x14]
    cmp        r2,#0x2
    beq        LAB_0800636e
    ldrh       r0,[r7,#0x4]
    and        r0,r1
    bne        LAB_08006368
    tst        r2,r2
    bne        LAB_08006386
    b          LAB_0800636e
LAB_08006368:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_08006386
LAB_0800636e:
    add        r7,#0x10
    ldrh       r0,[r7,#0x4]
    and        r0,r1
    beq        LAB_08006386
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    b          LAB_08006386
LAB_0800637c:
    LoadMain input, r7, r7
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x8
    and        r0,r1
LAB_08006386:
    pop        {pc}

    .pool


_nt Battle_SetPostBattleHP
    push       {lr}
    LoadMain world, r6, r6
    LoadMain gameStats, r7, r7
    ldrh       r4,[r6,#0x1e]
    ldrb       r0,[r7,#0x5]
    mul        r0,r4
    mov        r1,#0xa
    bl         SWI_Div
    ldr        r7,[r5,#0x40]
    ldrh       r1,[r7,#0x20]
    add        r1,r1,r0
    cmp        r1,r4
    ble        LAB_080063ae
    add        r1,r4,#0x0
LAB_080063ae:
    strh       r1,[r6,#0x1c]
    pop        {pc}


_nt Battle_IsBattleActive
    push       {lr}
    mov        r0,#0x1
    LoadMain manager, r7, r7
    ldrb       r1,[r7,#0x0]
    cmp        r1,#0x8
    bne        LAB_080063dc
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    blt        LAB_080063dc
    push       {r0,r5}
    LoadMain battle, r5, r5
    bl         Battle_IsActive
    tst        r0,r0
    pop        {r0,r5}
    bne        LAB_080063dc
    mov        r0,#0x0
LAB_080063dc:
    pop        {pc}

    .align 2, 0

global_label listScreenDimHandler
    .word ScreenDim_Recover
    .word ScreenDim_WoodMan
    .word ScreenDim_Steal
    .word ScreenDim_PoweredCannon
    .word ScreenDim_ActivateProgAdv
    .word ScreenDim_FireMan
    .word ScreenDim_NumberMan
    .word ScreenDim_GutsMan
    .word ScreenDim_Escape
    .word ScreenDim_Repair
    .word ScreenDim_Cube
    .word ScreenDim_Cube
    .word ScreenDim_TimeBomb
    .word ScreenDim_TimeBomb
    .word ScreenDim_TimeBomb
    .word ScreenDim_Invisible
    .word ScreenDim_IceMan
    .word ScreenDim_StoneMan
    .word ScreenDim_Geddon
    .word ScreenDim_Cloudy
    .word ScreenDim_ElecManEscape
    .word ScreenDim_Mine
    .word ScreenDim_Anubis
    .word ScreenDim_Barrier
    .word ScreenDim_IronBody
    .word ScreenDim_Candle
    .word ScreenDim_Gauge
    .word ScreenDim_Remobit
    .word ScreenDim_Interrupt
    .word ScreenDim_SkullMan
    .word ScreenDim_Roll
    .word ScreenDim_BigStraight
    .word ScreenDim_GutsShoot
    .word ScreenDim_DeathStorm
    .word ScreenDim_Drain
    .word ScreenDim_ColorMan
    .word ScreenDim_ProtoMan
    .word ScreenDim_SharkMan
    .word ScreenDim_ElecMan
    .word ScreenDim_PharaohTrap
    .word ScreenDim_SnakeEgg
    .word ScreenDim_Dynamyte
    .word ScreenDim_PharaohMan
    .word ScreenDim_ShadowMan
    .word ScreenDim_MagicMan
    .word ScreenDim_BombMan
    .word ScreenDim_Bass
    .word ScreenDim_LockOn
    .word ScreenDim_LifeSaver
    .word ScreenDim_DoubleHero
    .word ScreenDim_HeavyStamp
    .word ScreenDim_BloodSuck


_ts Battle_SetFieldTilemap
    push       {r5,lr}
    ldrb       r0,[r5,#0x1a]
    mov        r9,r0
    bl         Battle_IsTimerPaused
    tst        r0,r0
    bne        LAB_080064cc
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_CheckPanelRestore
    bl         Battle_CheckCrackedPanelBreak
LAB_080064cc:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r4,#0x1
LAB_080064d4:
    mov        r3,#0x1
LAB_080064d6:
    push       {r3,r4,r5}
    add        r7,r3,#0x0
    mov        r8,r4
    lsl        r0,r4,#0x3
    add        r0,r0,r3
    lsl        r0,r0,#0x4
    ldr        r2,PTR_gPanelStatuses_08006534
    add        r0,r0,r2
    sub        r1,r4,#0x1
    bl         GetPanelTilemap
    add        r3,r0,#0x0
    sub        r0,r7,#0x1
    mov        r4,r8
    sub        r1,r4,#0x1
    ldr        r6,PTR_PTR_CellPosition_ARRAY_08006528
    mov        r2,r9
    lsl        r2,r2,#0x2
    ldr        r6,[r6,r2]
    add        r2,r1,r1
    lsl        r1,r1,#0x2
    add        r1,r1,r2
    add        r0,r0,r1
    add        r0,r0,r0
    add        r6,r6,r0
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    mov        r4,#0x5
    mov        r5,#0x3
    mov        r2,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r3,r4,r5}
    add        r3,#0x1
    cmp        r3,#0x7
    bne        LAB_080064d6
    add        r4,#0x1
    cmp        r4,#0x5
    bne        LAB_080064d4
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_CellPosition_ARRAY_08006528:
    .word PTR_CellPosition_ARRAY_0800652c
PTR_CellPosition_ARRAY_0800652c:
    .word CellPosition_ARRAY_08006556
    .word CellPosition_ARRAY_08006586
PTR_gPanelStatuses_08006534:
    .word gPanelStatuses
TilemapEntry_ARRAY_08006538:
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
    tilemap_entry 0x200, 0
CellPosition_ARRAY_08006556:
    .byte 0x00, 0x07,  0x05, 0x07,  0x0a, 0x07,  0x0f, 0x07,  0x14, 0x07,  0x19, 0x07
    .byte 0x00, 0x0a,  0x05, 0x0a,  0x0a, 0x0a,  0x0f, 0x0a,  0x14, 0x0a,  0x19, 0x0a
    .byte 0x00, 0x0d,  0x05, 0x0d,  0x0a, 0x0d,  0x0f, 0x0d,  0x14, 0x0d,  0x19, 0x0d
    .byte 0x00, 0x10,  0x05, 0x10,  0x0a, 0x10,  0x0f, 0x10,  0x14, 0x10,  0x19, 0x10
CellPosition_ARRAY_08006586:
    .byte 0x19, 0x07,  0x14, 0x07,  0x0f, 0x07,  0x0a, 0x07,  0x05, 0x07,  0x00, 0x07
    .byte 0x19, 0x0a,  0x14, 0x0a,  0x0f, 0x0a,  0x0a, 0x0a,  0x05, 0x0a,  0x00, 0x0a
    .byte 0x19, 0x0d,  0x14, 0x0d,  0x0f, 0x0d,  0x0a, 0x0d,  0x05, 0x0d,  0x00, 0x0d
    .byte 0x19, 0x10,  0x14, 0x10,  0x0f, 0x10,  0x0a, 0x10,  0x05, 0x10,  0x00, 0x10


_nt GetPanelTilemap
    ldr        r2,[r0,#0x0]
    ldrb       r3,[r0,#0xd]
    tst        r3,r3
    beq        LAB_080065d6
    LoadMain frameCounter, r3, r3
    ldrh       r3,[r3,#0x0]
    mov        r4,#0x2
    tst        r3,r4
    bne        LAB_080065d2
    mov        r4,#0x1
    mvn        r4,r4
    and        r2,r4
    b          LAB_080065d6
LAB_080065d2:
    mov        r4,#0x1
    orr        r2,r4
LAB_080065d6:
    mov        r3,#0x0
    strb       r3,[r0,#0xc]
    mov        r6,#0x0
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08006600
    mov        r3,#0x1
    strb       r3,[r0,#0xc]
    mov        r6,#0x6
    mov        r3,#0x8
    tst        r2,r3
    bne        LAB_080065f8
    mov        r6,#0x4
    mov        r3,#0x4
    tst        r2,r3
    bne        LAB_080065f8
    mov        r6,#0x2
LAB_080065f8:
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08006600
    add        r6,#0x1
LAB_08006600:
    lsl        r1,r1,#0x3
    add        r6,r6,r1
    add        r3,r0,#0x0
    sub        r3,#0x80
    ldrb       r3,[r3,#0xc]
    tst        r3,r3
    bne        LAB_08006610
    add        r6,#0x20
LAB_08006610:
    ldr        r0,PTR_BYTE_ARRAY_ARRAY_ARRAY_ARRAY_08006664
    ldrb       r2,[r0,r6]
    ldr        r0,PTR_PTR_08006668
    ldrb       r1,[r5,#0xf]
    lsl        r1,r1,#0x2
    ldr        r6,[r0,r1]
    lsl        r2,r2,#0x2
    ldr        r0,[r6,r2]
    mov        pc,lr

    .align 2, 0

BYTE_ARRAY_ARRAY_ARRAY_ARRAY_08006624:
    .byte 0x06, 0x06
    .byte 0x00, 0x01
    .byte 0x13, 0x16
    .byte 0x0b, 0x0b

    .byte 0x06, 0x06
    .byte 0x02, 0x03
    .byte 0x14, 0x17
    .byte 0x0b, 0x0b

    .byte 0x06, 0x06
    .byte 0x04, 0x05
    .byte 0x15, 0x18
    .byte 0x0b, 0x0b

    .byte 0x06, 0x06
    .byte 0x06, 0x06
    .byte 0x06, 0x06
    .byte 0x06, 0x06

    .byte 0x19, 0x19
    .byte 0x00, 0x01
    .byte 0x13, 0x16
    .byte 0x0b, 0x0b

    .byte 0x19, 0x19
    .byte 0x07, 0x08
    .byte 0x14, 0x17
    .byte 0x0b, 0x0b

    .byte 0x19, 0x19
    .byte 0x09, 0x0a
    .byte 0x15, 0x18
    .byte 0x0b, 0x0b

    .byte 0x19, 0x19
    .byte 0x19, 0x19
    .byte 0x19, 0x19
    .byte 0x19, 0x19

PTR_BYTE_ARRAY_ARRAY_ARRAY_ARRAY_08006664:
    .word BYTE_ARRAY_ARRAY_ARRAY_ARRAY_08006624
PTR_PTR_08006668:
    .word PTR_listTilemapPanelNumberMan_0800666c

PTR_listTilemapPanelNumberMan_0800666c:
    .word listTilemapPanelNumberMan
    .word listTilemapPanelFireMan
    .word listTilemapPanelIceMan
    .word listTilemapPanelColorMan
    .word listTilemapPanelElecMan
    .word listTilemapPanelWWW
    .word listTilemapPanelInternet
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelGeneric
    .word listTilemapPanelWWW

listTilemapPanelNumberMan:
    .word tilemapPanelNumberMan_00
    .word tilemapPanelNumberMan_01
    .word tilemapPanelNumberMan_02
    .word tilemapPanelNumberMan_03
    .word tilemapPanelNumberMan_04
    .word tilemapPanelNumberMan_05
    .word tilemapPanelNumberMan_06
    .word tilemapPanelNumberMan_07
    .word tilemapPanelNumberMan_08
    .word tilemapPanelNumberMan_09
    .word tilemapPanelNumberMan_10
    .word tilemapPanelNumberMan_11
    .word tilemapPanelNumberMan_12
    .word tilemapPanelNumberMan_13
    .word tilemapPanelNumberMan_14
    .word tilemapPanelNumberMan_15
    .word tilemapPanelNumberMan_16
    .word tilemapPanelNumberMan_17
    .word tilemapPanelNumberMan_18
    .word tilemapPanelNumberMan_19
    .word tilemapPanelNumberMan_20
    .word tilemapPanelNumberMan_21
    .word tilemapPanelNumberMan_22
    .word tilemapPanelNumberMan_23
    .word tilemapPanelNumberMan_24
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelFireMan:
    .word tilemapPanelFireMan_00
    .word tilemapPanelFireMan_01
    .word tilemapPanelFireMan_02
    .word tilemapPanelFireMan_03
    .word tilemapPanelFireMan_04
    .word tilemapPanelFireMan_05
    .word tilemapPanelFireMan_06
    .word tilemapPanelFireMan_02
    .word tilemapPanelFireMan_03
    .word tilemapPanelFireMan_04
    .word tilemapPanelFireMan_05
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_07
    .word tilemapPanelFireMan_08
    .word tilemapPanelFireMan_09
    .word tilemapPanelFireMan_10
    .word tilemapPanelFireMan_11
    .word tilemapPanelFireMan_12
    .word tilemapPanelFireMan_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelIceMan:
    .word tilemapPanelIceMan_00
    .word tilemapPanelIceMan_01
    .word tilemapPanelIceMan_02
    .word tilemapPanelIceMan_03
    .word tilemapPanelIceMan_04
    .word tilemapPanelIceMan_05
    .word tilemapPanelIceMan_06
    .word tilemapPanelIceMan_02
    .word tilemapPanelIceMan_03
    .word tilemapPanelIceMan_04
    .word tilemapPanelIceMan_05
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_07
    .word tilemapPanelIceMan_08
    .word tilemapPanelIceMan_09
    .word tilemapPanelIceMan_10
    .word tilemapPanelIceMan_11
    .word tilemapPanelIceMan_12
    .word tilemapPanelIceMan_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelColorMan:
    .word tilemapPanelColorMan_00
    .word tilemapPanelColorMan_01
    .word tilemapPanelColorMan_02
    .word tilemapPanelColorMan_03
    .word tilemapPanelColorMan_04
    .word tilemapPanelColorMan_05
    .word tilemapPanelColorMan_06
    .word tilemapPanelColorMan_02
    .word tilemapPanelColorMan_03
    .word tilemapPanelColorMan_04
    .word tilemapPanelColorMan_05
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_07
    .word tilemapPanelColorMan_08
    .word tilemapPanelColorMan_09
    .word tilemapPanelColorMan_10
    .word tilemapPanelColorMan_11
    .word tilemapPanelColorMan_12
    .word tilemapPanelColorMan_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelElecMan:
    .word tilemapPanelElecMan_00
    .word tilemapPanelElecMan_01
    .word tilemapPanelElecMan_02
    .word tilemapPanelElecMan_03
    .word tilemapPanelElecMan_04
    .word tilemapPanelElecMan_05
    .word tilemapPanelElecMan_06
    .word tilemapPanelElecMan_02
    .word tilemapPanelElecMan_03
    .word tilemapPanelElecMan_04
    .word tilemapPanelElecMan_05
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_07
    .word tilemapPanelElecMan_08
    .word tilemapPanelElecMan_09
    .word tilemapPanelElecMan_10
    .word tilemapPanelElecMan_11
    .word tilemapPanelElecMan_12
    .word tilemapPanelElecMan_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelWWW:
    .word tilemapPanelWWW_00
    .word tilemapPanelWWW_01
    .word tilemapPanelWWW_02
    .word tilemapPanelWWW_03
    .word tilemapPanelWWW_04
    .word tilemapPanelWWW_05
    .word tilemapPanelWWW_06
    .word tilemapPanelWWW_02
    .word tilemapPanelWWW_03
    .word tilemapPanelWWW_04
    .word tilemapPanelWWW_05
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_07
    .word tilemapPanelWWW_08
    .word tilemapPanelWWW_09
    .word tilemapPanelWWW_10
    .word tilemapPanelWWW_11
    .word tilemapPanelWWW_12
    .word tilemapPanelWWW_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelInternet:
    .word tilemapPanelInternet_00
    .word tilemapPanelInternet_01
    .word tilemapPanelInternet_02
    .word tilemapPanelInternet_03
    .word tilemapPanelInternet_04
    .word tilemapPanelInternet_05
    .word tilemapPanelInternet_06
    .word tilemapPanelInternet_02
    .word tilemapPanelInternet_03
    .word tilemapPanelInternet_04
    .word tilemapPanelInternet_05
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_07
    .word tilemapPanelInternet_08
    .word tilemapPanelInternet_09
    .word tilemapPanelInternet_10
    .word tilemapPanelInternet_11
    .word tilemapPanelInternet_12
    .word tilemapPanelInternet_13
    .word TilemapEntry_ARRAY_08006538
listTilemapPanelGeneric:
    .word tilemapPanelGeneric_00
    .word tilemapPanelGeneric_01
    .word tilemapPanelGeneric_02
    .word tilemapPanelGeneric_03
    .word tilemapPanelGeneric_04
    .word tilemapPanelGeneric_05
    .word tilemapPanelGeneric_06
    .word tilemapPanelGeneric_02
    .word tilemapPanelGeneric_03
    .word tilemapPanelGeneric_04
    .word tilemapPanelGeneric_05
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_07
    .word tilemapPanelGeneric_08
    .word tilemapPanelGeneric_09
    .word tilemapPanelGeneric_10
    .word tilemapPanelGeneric_11
    .word tilemapPanelGeneric_12
    .word tilemapPanelGeneric_13
    .word TilemapEntry_ARRAY_08006538


_nt Battle_PauseTimer
    LoadMain world, r7, r7
    mov        r0,#0x1
    strb       r0,[r7,#0x9]
    mov        pc,lr


_nt Battle_UnpauseTimer
    LoadMain world, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x9]
    mov        pc,lr


_nt Battle_IsTimerPaused
    LoadMain world, r7, r7
    ldrb       r0,[r7,#0x9]
    mov        pc,lr


_nt Battle_AreAllSpritesSpawned
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x6]
    ldrb       r2,[r5,#0x7]
    add        r1,r1,r2
    cmp        r0,r1
    beq        LAB_08006a20
    mov        r0,#0x0
    mov        pc,lr
LAB_08006a20:
    mov        r0,#0x1
    mov        pc,lr
