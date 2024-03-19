#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0809bd28, 0x809bd28+1
    .set FUN_080825cc, 0x80825cc+1
    .set FUN_0809bc4c, 0x809bc4c+1
    .set Sio_SetReady, 0x809bdf0+1
    .set GetBattleChipTotalCount, 0x801e7e4+1
    .set ChipBagSlot_02018fe0, 0x2018fe0
    .set BuildChipSack, 0x3007518+1
    .set PlayerMpState_020037d0, 0x20037d0
    .set listDefaultSort, 0x30072B0
    .set TilemapEntry_ARRAY_08019668, 0x8019668

tilemapNetworkListOptions:
    .incbin "images/start_menu/network/list_options.tilemap"
tilemapNetworkChipCount:
    .incbin "images/start_menu/network/chip_count.tilemap"
tilemapNetworkWinLoss:
    .incbin "images/start_menu/network/win_loss.tilemap"
tilemapNetworkNoneEntry:
    .incbin "images/start_menu/network/entry_none.tilemap"
tilemapNetworkTradeBlankEntry:
    .incbin "images/start_menu/network/entry_blank.tilemap"


_ts Menu_5_Network
    push       {lr}
    ldr        r0,PTR_PTR_Menu_Network_0_Init_0801cd0c
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r0}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x8
    beq        LAB_0801ccfa
    mov        r0,r10
    push       {r0,r5}
    ldr        r0,PTR_PlayerMpState_0801cd04
    ldr        r1,PTR_gListMPStateAll_0801cd08
    bl         FUN_0809bd28
    pop        {r1,r5}
    mov        r10,r1
    add        r3,r0,#0x0
    mov        r2,#0x80
    and        r3,r2
    cmp        r3,#0x80
    bne        LAB_0801ccbe
    mov        r0,#0x30
    lsl        r0,r0,#0x4
    strh       r0,[r5,#0x10]
    b          LAB_0801ccd8
LAB_0801ccbe:
    mov        r2,#0x3
    and        r0,r2
    cmp        r0,#0x3
    bne        LAB_0801ccd8
    push       {r1,r3}
    bl         SIO_GetMultiplayerId
    pop        {r1,r3}
    cmp        r0,#0x2
    bge        LAB_0801ccd8
    mov        r0,#0x0
    strh       r0,[r5,#0x10]
    b          LAB_0801ccfa
LAB_0801ccd8:
    ldrh       r0,[r5,#0x10]
    ldr        r1,DAT_0801cd00
    cmp        r0,r1
    bge        LAB_0801cce6
    add        r0,#0x1
    strh       r0,[r5,#0x10]
    b          LAB_0801ccfa
LAB_0801cce6:
    mov        r0,r10
    push       {r0,r5}
    bl         Sio_SetReady
    bl         FUN_0809bc4c
    pop        {r0,r5}
    mov        r10,r0
    mov        r0,#0x0
    strh       r0,[r5,#0x10]
LAB_0801ccfa:
    pop        {r0}
    pop        {pc}

    .align 2, 0

DAT_0801cd00:
    .word 0x12C
PTR_PlayerMpState_0801cd04:
    .word PlayerMpState_020037d0
PTR_gListMPStateAll_0801cd08:
    .word gListMPStateAll
PTR_PTR_Menu_Network_0_Init_0801cd0c:
    .word PTR_Menu_Network_0_Init_0801cd10
PTR_Menu_Network_0_Init_0801cd10:
    .word Menu_Network_0_Init
    .word Menu_Network_1_Main
    .word Menu_Network_2_Close
    .word Menu_Network_3_ConfirmSaveFirst
    .word Menu_Network_4_SaveGame
    .word Menu_Network_5_ShowSelectionInfo
    .word Menu_Network_6_ConfirmOptionTrade
    .word Menu_Network_7_InitTrade
    .word Menu_Network_8_Trade
    .word Menu_Network_9_LoadOptionMenu
    .word Menu_Network_10_OpenTradePending
    .word Menu_Network_11
    .word Menu_Network_12_TradeDialogue
    .word Menu_Network_13_TradePending
    .word Menu_Network_14
    .word Menu_Network_15
    .word Menu_Network_16_TradeAcceptPending
    .word Menu_Network_17_PerformTrade
    .word Menu_Network_18_RevealTrade
    .word Menu_Network_19_LoadOptionMenu
    .word Menu_Network_20_LoadTradeMenu
    .word Menu_Network_21
    .word Menu_Network_22_ConfirmOptionBattle
    .word Menu_Network_23_StartBattle
    .word Menu_Network_22_ConfirmOptionBattle
    .word Menu_Network_23_StartBattle
    .word Menu_Network_26_Sort


_ts Menu_Network_0_Init
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ce82
    push       {r5}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetMenuDesign_0801d138
    ldr        r1,PTR_DAT_0801d13c
    ldr        r2,DAT_0801d140
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801d144
    ldr        r1,PTR_eBgPalette4_0801d148
    mov        r2,#0x40
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_tilesetMenuSideArrow_0801d14c
    ldr        r1,PTR_DAT_0801d150
    mov        r2,#0x60
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_paletteMenuSideArrow_0801d154
    ldr        r1,PTR_eBgPaletteF_0801d158
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    bl         Menu_Network_PrintMpInfo
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuNetwork_0801d15c
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    ldr        r2,DAT_0801d160
    bl         memcpy_32
    mov        r0,#0x3
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkListOptions_0801d164
    mov        r4,#0xd
    mov        r5,#0x6
    bl         Screen_CopyTileMapRect
    mov        r0,#0x16
    mov        r1,#0x5
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkChipCount_0801d168
    mov        r4,#0x6
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,#0x13
    mov        r1,#0x9
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkWinLoss_0801d16c
    mov        r4,#0x9
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    bl         Menu_Network_ClearPackets
    mov        r0,r10
    push       {r0}
    bl         FUN_0809bc4c
    pop        {r0}
    mov        r10,r0
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801d170
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    strh       r0,[r5,#0x10]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    strh       r0,[r5,#0x24]
    strh       r0,[r5,#0x26]
    strh       r0,[r5,#0x28]
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    bne        LAB_0801ce68
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x64
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    b          LAB_0801ce82
LAB_0801ce68:
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x10]
    ldr        r7,PTR_listNetworkBattleResultMessage_0801ce98
    ldrb       r1,[r7,r1]
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
LAB_0801ce82:
    push       {r5}
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x5
    bl         Flag_Clear400
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_listNetworkBattleResultMessage_0801ce98:
    .word listNetworkBattleResultMessage
listNetworkBattleResultMessage:
    .byte 0x70, 0x71, 0xFF, 0x61


_ts Menu_Network_1_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ceb2
    bl         Menu_Network_HandleInput
LAB_0801ceb2:
    bl         Menu_Network_DrawUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_2_Close
    push       {lr}
    bl         Menu_Network_DrawUi
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801cf20
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801cee2
    mov        r1,#0x4
LAB_0801cee2:
    strb       r1,[r0,#0x0]
    push       {r5,r7}
    bl         FUN_080825cc
    pop        {r5,r7}
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r0,#0x40
    bl         StartMenu_ClearState
    push       {r5}
    ldr        r0,PTR_paletteKeyboardNumberChars_0801d178
    ldr        r1,PTR_eBgPaletteF_0801d17c
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    mov        r0,r10
    push       {r0}
    bl         Sio_SetReady
    pop        {r0}
    mov        r10,r0
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801cf20:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_3_ConfirmSaveFirst
    push       {lr}
    push       {r5}
    mov        r0,#0x20
    bl         Text_CheckOption
    pop        {r5}
    beq        LAB_0801cf6a
    bl         TextOption_GetDefaultOption
    cmp        r0,#0x0
    beq        LAB_0801cf4c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801cf6a
LAB_0801cf4c:
    mov        r0,#0x9
    bl         Flag_Get400
    beq        LAB_0801cf60
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    bne        LAB_0801cf60
    mov        r0,#0x1
    strb       r0,[r5,#0xf]
    b          LAB_0801cf6a
LAB_0801cf60:
    mov        r0,#0x0
    strb       r0,[r5,#0xf]
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    b          LAB_0801cf6a
LAB_0801cf6a:
    bl         Menu_Network_DrawUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_4_SaveGame
    push       {lr}
    push       {r5}
    bl         Save_SaveGame
    pop        {r5}
    beq        LAB_0801cf92
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x83
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    b          LAB_0801cfa2
LAB_0801cf92:
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x66
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
LAB_0801cfa2:
    bl         Menu_Network_DrawUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_5_ShowSelectionInfo
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801cfd2
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    ldrb       r1,[r5,#0xc]
    add        r1,#0x67
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
LAB_0801cfd2:
    bl         Menu_Network_DrawUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_DrawUi
    push       {lr}
    bl         Menu_Network_DrawArrow
    pop        {pc}


_ts Menu_Network_HandleInput
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801d07c
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_0801d002
    sub        r0,#0x1
    strb       r0,[r5,#0xf]
    b          LAB_0801d07c
LAB_0801d002:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801d026
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801d066
LAB_0801d026:
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801d032
    bl         Menu_Network_HandleOptionSelect
    b          LAB_0801d066
LAB_0801d032:
    ldrb       r2,[r5,#0xc]
    ldrh       r0,[r7,#0x4]
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801d046
    sub        r2,#0x1
    cmp        r2,#0x0
    bge        LAB_0801d056
    mov        r2,#0x0
    b          LAB_0801d056
LAB_0801d046:
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801d056
    add        r2,#0x1
    cmp        r2,#0x3
    blt        LAB_0801d056
    mov        r2,#0x2
    b          LAB_0801d056
LAB_0801d056:
    ldrb       r4,[r5,#0xc]
    cmp        r2,r4
    bne        LAB_0801d05e
    b          LAB_0801d064
LAB_0801d05e:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801d064:
    strb       r2,[r5,#0xc]
LAB_0801d066:
    ldrb       r1,[r5,#0xd]
    ldrb       r2,[r5,#0xc]
    cmp        r1,r2
    beq        LAB_0801d07c
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x67
    add        r1,r1,r2
    bl         Text_LoadDialogue
    pop        {r5}
LAB_0801d07c:
    pop        {pc}


_ts Menu_Network_PrintMpInfo
    push       {r5,lr}
    mov        r0,#0x0
    ldr        r2,PTR_DAT_0801d180
    mov        r1,#0x74
    ldr        r3,PTR_DAT_0801d184
    push       {r5}
LAB_0801d08c:
    push       {r0,r1,r2,r3}
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r4,#0xd
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801d188
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3}
    mov        r4,#0x4
    lsl        r4,r4,#0x8
    add        r2,r2,r4
    add        r3,r3,r4
    add        r0,#0x1
    add        r1,#0x1
    cmp        r0,#0x3
    blt        LAB_0801d08c
    pop        {r5}
    bl         GetBattleChipTotalCount
    str        r0,[r5,#0x18]
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    str        r0,[r7,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x60
    ldr        r2,PTR_DAT_0801d18c
    ldr        r3,PTR_DAT_0801d190
    mov        r4,#0x6
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801d188
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    mov        r7,r10
    ldr        r6,[r7,#0x78]
    ldr        r7,[r7,#0x68]
    ldrh       r0,[r6,#0x14]
    ldrh       r1,[r6,#0x16]
    str        r0,[r7,#0x8]
    str        r1,[r7,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801d174
    mov        r1,#0x73
    ldr        r2,PTR_DAT_0801d194
    ldr        r3,PTR_DAT_0801d198
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801d188
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,pc}


_ts Menu_Network_DrawArrow
    push       {r5,lr}
    mov        r8,r5
    mov        r0,#0x1
    mov        r1,#0x4
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x6
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r1,[r5,#0xe]
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x4
    bne        LAB_0801d11c
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801d11a
    mov        r1,#0x0
LAB_0801d11a:
    strb       r1,[r5,#0xe]
LAB_0801d11c:
    ldr        r3,PTR_tilemapListSideArrow_0801d19c
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    mov        r0,#0x1
    ldrb       r1,[r5,#0xc]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}

    .align 2, 0

PTR_tilesetMenuDesign_0801d138:
    .word tilesetMenuDesign
PTR_DAT_0801d13c:
    .word 0x6000020
DAT_0801d140:
    .word 0x540
PTR_paletteMenuDesign_0801d144:
    .word paletteMenuDesign
PTR_eBgPalette4_0801d148:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801d14c:
    .word tilesetMenuSideArrow
PTR_DAT_0801d150:
    .word 0x6004020
PTR_paletteMenuSideArrow_0801d154:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801d158:
    .word eBgPaletteF
PTR_tilemapMenuNetwork_0801d15c:
    .word tilemapMenuNetwork
DAT_0801d160:
    .word 0x300
PTR_tilemapNetworkListOptions_0801d164:
    .word tilemapNetworkListOptions
PTR_tilemapNetworkChipCount_0801d168:
    .word tilemapNetworkChipCount
PTR_tilemapNetworkWinLoss_0801d16c:
    .word tilemapNetworkWinLoss
PTR_DAT_0801d170:
    .word 0x1f40
PTR_textDict_MenuMessages_0801d174:
    .word textDict_MenuMessages
PTR_paletteKeyboardNumberChars_0801d178:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801d17c:
    .word eBgPaletteF
PTR_DAT_0801d180:
    .word 0x2011400
PTR_DAT_0801d184:
    .word 0x6004400
PTR_tilesetDialogueText_0801d188:
    .word tilesetDialogueText
PTR_DAT_0801d18c:
    .word 0x2012000
PTR_DAT_0801d190:
    .word 0x6005000
PTR_DAT_0801d194:
    .word 0x2012200
PTR_DAT_0801d198:
    .word 0x6005200
PTR_tilemapListSideArrow_0801d19c:
    .word tilemapListSideArrow


_ts Menu_Network_HandleOptionSelect
    push       {lr}
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x0
    beq        LAB_0801d1ae
    cmp        r0,#0x1
    beq        LAB_0801d1ce
    b          LAB_0801d1e8
LAB_0801d1ae:
    ldr        r0,[r5,#0x18]
    cmp        r0,#0x1e
    ble        LAB_0801d21e
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d212
    bl         Menu_Network_ClearPackets
    mov        r0,#0x80
    bl         Menu_Network_TransmitOptionSelection
    mov        r0,#0x0
    strh       r0,[r5,#0x12]
    mov        r0,#0x18
    strb       r0,[r5,#0x1]
    b          LAB_0801d208
LAB_0801d1ce:
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d212
    bl         Menu_Network_ClearPackets
    mov        r0,#0x40
    bl         Menu_Network_TransmitOptionSelection
    mov        r0,#0x0
    strh       r0,[r5,#0x12]
    mov        r0,#0x58
    strb       r0,[r5,#0x1]
    b          LAB_0801d208
LAB_0801d1e8:
    ldr        r0,[r5,#0x18]
    cmp        r0,#0x1e
    ble        LAB_0801d21e
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d212
    bl         Menu_Network_ClearPackets
    mov        r0,#0x20
    bl         Menu_Network_TransmitOptionSelection
    mov        r0,#0x0
    strh       r0,[r5,#0x12]
    mov        r0,#0x60
    strb       r0,[r5,#0x1]
    b          LAB_0801d208
LAB_0801d208:
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    pop        {pc}
LAB_0801d212:
    mov        r0,#0x14
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    mov        r0,#0x0
    pop        {pc}
LAB_0801d21e:
    bl         Menu_Network_ClearPackets
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d23c
    mov        r1,#0x6b
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}
PTR_textDict_MenuMessages_0801d23c:
    .word textDict_MenuMessages


_ts Menu_Network_6_ConfirmOptionTrade
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d296
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801d296
    cmp        r0,#0x2
    beq        LAB_0801d2a0
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801d27e
    cmp        r1,#0xf0
    bne        LAB_0801d2a0
    ldrh       r0,[r5,#0x12]
    add        r0,#0x1
    strh       r0,[r5,#0x12]
    cmp        r0,#0x10
    bne        LAB_0801d276
    push       {r0,r5}
    ldr        r0,PTR_textDict_MenuMessages_0801d2b4
    mov        r1,#0x6f
    bl         Text_LoadDialogue
    pop        {r0,r5}
LAB_0801d276:
    ldr        r1,DAT_0801d2b0
    cmp        r0,r1
    bge        LAB_0801d296
    b          LAB_0801d2aa
LAB_0801d27e:
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x1]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    b          LAB_0801d2aa
LAB_0801d296:
    mov        r0,#0x14
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d2aa
LAB_0801d2a0:
    mov        r0,#0x14
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d2aa
LAB_0801d2aa:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

DAT_0801d2b0:
    .word 0x12C
PTR_textDict_MenuMessages_0801d2b4:
    .word textDict_MenuMessages


_ts Menu_Network_7_InitTrade
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    bne        LAB_0801d2ca
    mov        r0,#0x0
    pop        {pc}
LAB_0801d2ca:
    push       {r5}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetMenuDesign_0801d334
    ldr        r1,PTR_DAT_0801d338
    ldr        r2,DAT_0801d33c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801d340
    ldr        r1,PTR_eBgPalette4_0801d344
    mov        r2,#0x40
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_tilesetMenuSideArrow_0801d348
    ldr        r1,PTR_DAT_0801d34c
    mov        r2,#0x60
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_paletteMenuSideArrow_0801d350
    ldr        r1,PTR_eBgPaletteF_0801d354
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_tilesetMenuSideArrow_0801d358
    ldr        r1,PTR_DAT_0801d35c
    mov        r2,#0x60
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_paletteMenuDesign_0801d360
    ldr        r1,PTR_eObjPalette0_0801d364
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_tilesetMenuUpDownArrow_0801d378
    ldr        r1,PTR_DAT_0801d37c
    mov        r2,#0x40
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_gFillValue_0801d368
    ldr        r1,PTR_ChipBagSlot_0801d36c
    ldr        r2,PTR_DAT_0801d370
    mov        r3,#0x3
    ldr        r4,DAT_0801d374
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    b          LAB_0801d380
PTR_tilesetMenuDesign_0801d334:
    .word tilesetMenuDesign
PTR_DAT_0801d338:
    .word 0x6000020
DAT_0801d33c:
    .word 0x540
PTR_paletteMenuDesign_0801d340:
    .word paletteMenuDesign
PTR_eBgPalette4_0801d344:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801d348:
    .word tilesetMenuSideArrow
PTR_DAT_0801d34c:
    .word 0x6004020
PTR_paletteMenuSideArrow_0801d350:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801d354:
    .word eBgPaletteF
PTR_tilesetMenuSideArrow_0801d358:
    .word tilesetMenuSideArrow
PTR_DAT_0801d35c:
    .word 0x6010020
PTR_paletteMenuDesign_0801d360:
    .word paletteMenuDesign
PTR_eObjPalette0_0801d364:
    .word eObjPalette0
PTR_gFillValue_0801d368:
    .word gFillValue
PTR_ChipBagSlot_0801d36c:
    .word ChipBagSlot_02018fe0
PTR_DAT_0801d370:
    .word 0x28f8
DAT_0801d374:
    .word 0x85000000
PTR_tilesetMenuUpDownArrow_0801d378:
    .word tilesetMenuUpDownArrow
PTR_DAT_0801d37c:
    .word 0x6004240
LAB_0801d380:
    ldr        r0,PTR_textDict_MenuMessages_0801d40c
    mov        r1,#0x4
    ldr        r2,PTR_gSpriteDecompLocation1_0801d410
    ldr        r3,PTR_DAT_0801d414
    mov        r4,#0x8
    mov        r5,#0x8
    ldr        r6,PTR_tilesetDialogueText_0801d418
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    ldr        r0,PTR_textDict_MenuMessages_0801d40c
    mov        r1,#0x5d
    ldr        r2,PTR_DAT_0801d41c
    ldr        r3,PTR_DAT_0801d420
    mov        r4,#0x5
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801d418
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    ldr        r0,PTR_BuildChipSack_0801d408
    mov        lr,pc
    bx         r0
    add        r0,#0x1
    strh       r0,[r5,#0x28]
    bl         Menu_Network_CheckPageOffset
    ldrh       r0,[r5,#0x24]
    ldr        r1,PTR_ChipBagSlot_0801d424
    bl         Menu_LoadSackPageInfo
    push       {r5}
    ldrh       r0,[r5,#0x24]
    ldrh       r1,[r5,#0x20]
    add        r0,r0,r1
    ldr        r7,PTR_ChipBagSlot_0801d424
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    ldr        r0,[r7,#0x18]
    ldr        r1,[r7,#0x8]
    lsr        r1,r1,#0x10
    bl         Menu_LoadChipData
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuNetworkTrade_0801d428
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    ldr        r2,DAT_0801d42c
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x20
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    pop        {pc}
PTR_BuildChipSack_0801d408:
    .word BuildChipSack
PTR_textDict_MenuMessages_0801d40c:
    .word textDict_MenuMessages
PTR_gSpriteDecompLocation1_0801d410:
    .word gSpriteDecompLocation1
PTR_DAT_0801d414:
    .word 0x6002c00
PTR_tilesetDialogueText_0801d418:
    .word tilesetDialogueText
PTR_DAT_0801d41c:
    .word 0x2017000
PTR_DAT_0801d420:
    .word 0x6008400
PTR_ChipBagSlot_0801d424:
    .word ChipBagSlot_02018fe0
PTR_tilemapMenuNetworkTrade_0801d428:
    .word tilemapMenuNetworkTrade
DAT_0801d42c:
    .word 0x140


_ts Menu_Network_8_Trade
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d452
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801d452
    cmp        r0,#0x2
    beq        LAB_0801d45c
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801d466
    cmp        r1,#0xf0
    beq        LAB_0801d452
    b          LAB_0801d45c
LAB_0801d452:
    mov        r0,#0x2c
    mov        r1,#0x5a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d46a
LAB_0801d45c:
    mov        r0,#0x2c
    mov        r1,#0x5b
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d46a
LAB_0801d466:
    bl         Menu_Network_HandleInputTrade
LAB_0801d46a:
    bl         Menu_Network_PrintUiTrade
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_9_LoadOptionMenu
    push       {lr}
    bl         Menu_Network_PrintUiTrade
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801d526
    push       {r5}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetMenuDesign_0801d52c
    ldr        r1,PTR_DAT_0801d530
    ldr        r2,DAT_0801d534
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801d538
    ldr        r1,PTR_eBgPalette4_0801d53c
    mov        r2,#0x40
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_tilesetMenuSideArrow_0801d540
    ldr        r1,PTR_DAT_0801d544
    mov        r2,#0x60
    lsl        r2,r2,#0x2
    bl         memcpy_32
    ldr        r0,PTR_paletteMenuSideArrow_0801d548
    ldr        r1,PTR_eBgPaletteF_0801d54c
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    bl         Menu_Network_PrintMpInfo
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuNetwork_0801d550
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    ldr        r2,DAT_0801d554
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkListOptions_0801d558
    mov        r4,#0xd
    mov        r5,#0x6
    bl         Screen_CopyTileMapRect
    mov        r0,#0x16
    mov        r1,#0x5
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkChipCount_0801d55c
    mov        r4,#0x6
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,#0x13
    mov        r1,#0x9
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkWinLoss_0801d560
    mov        r4,#0x9
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    bl         Menu_Network_ClearPackets
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    ldr        r0,PTR_textDict_MenuMessages_0801d564
    ldrb       r1,[r5,#0xc]
    add        r1,#0x67
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0801d526:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_tilesetMenuDesign_0801d52c:
    .word tilesetMenuDesign
PTR_DAT_0801d530:
    .word 0x6000020
DAT_0801d534:
    .word 0x540
PTR_paletteMenuDesign_0801d538:
    .word paletteMenuDesign
PTR_eBgPalette4_0801d53c:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801d540:
    .word tilesetMenuSideArrow
PTR_DAT_0801d544:
    .word 0x6004020
PTR_paletteMenuSideArrow_0801d548:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801d54c:
    .word eBgPaletteF
PTR_tilemapMenuNetwork_0801d550:
    .word tilemapMenuNetwork
DAT_0801d554:
    .word 0xC0
PTR_tilemapNetworkListOptions_0801d558:
    .word tilemapNetworkListOptions
PTR_tilemapNetworkChipCount_0801d55c:
    .word tilemapNetworkChipCount
PTR_tilemapNetworkWinLoss_0801d560:
    .word tilemapNetworkWinLoss
PTR_textDict_MenuMessages_0801d564:
    .word textDict_MenuMessages


_ts Menu_Network_10_OpenTradePending
    push       {lr}
    bl         Menu_Network_PrintUiTrade
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801d57e
    mov        r0,#0x34
    strb       r0,[r5,#0x1]
LAB_0801d57e:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_11
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801d5a4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x24
    strb       r0,[r5,#0x1]
LAB_0801d5a4:
    bl         Menu_Network_PrintUiTrade
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_12_TradeDialogue
    push       {lr}
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0801d5ba
    mov        r0,#0x20
    strb       r0,[r5,#0x1]
LAB_0801d5ba:
    bl         Menu_Network_PrintUiTrade
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_PrintUiTrade
    push       {lr}
    ldrh       r0,[r5,#0x24]
    ldrh       r1,[r5,#0x20]
    ldrb       r3,[r5,#0x14]
    cmp        r3,#0xff
    bne        LAB_0801d5d6
    mov        r3,#0x0
    strb       r3,[r5,#0x14]
    b          LAB_0801d5e8
LAB_0801d5d6:
    cmp        r2,#0x10
    beq        LAB_0801d5e8
    ldrh       r2,[r5,#0x26]
    cmp        r0,r2
    bne        LAB_0801d5e8
    ldrh       r2,[r5,#0x22]
    cmp        r1,r2
    bne        LAB_0801d5e8
    b          LAB_0801d608
LAB_0801d5e8:
    push       {r0,r1}
    ldr        r1,PTR_ChipBagSlot_0801d640
    bl         Menu_LoadSackPageInfo
    pop        {r0,r1}
    push       {r5}
    add        r0,r0,r1
    ldr        r7,PTR_ChipBagSlot_0801d640
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    ldr        r0,[r7,#0x18]
    ldr        r1,[r7,#0x8]
    lsr        r1,r1,#0x10
    bl         Menu_LoadChipData
    pop        {r5}
LAB_0801d608:
    bl         Menu_Network_PrintUiTradeFrame
    bl         Menu_Network_PrintUiTradeSort
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x68
    beq        LAB_0801d62c
    ldrh       r0,[r5,#0x24]
    ldrh       r1,[r5,#0x20]
    add        r1,r1,r0
    tst        r1,r1
    beq        LAB_0801d62c
    push       {r0,r5}
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Menu_ShowChipDetail
    pop        {r0,r5}
LAB_0801d62c:
    ldrh       r0,[r5,#0x24]
    bl         Menu_Network_PrintBlankEntry
    bl         Menu_Network_PrintListArrowTrade
    bl         Menu_Network_PrintArrowsTrade
    bl         Menu_Network_PrintNoneEntry
    pop        {pc}
PTR_ChipBagSlot_0801d640:
    .word ChipBagSlot_02018fe0


_ts Menu_Network_PrintListArrowTrade
    push       {r5,lr}
    mov        r8,r5
    mov        r0,#0xd
    mov        r1,#0x4
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0xe
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r1,[r5,#0xe]
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801d664
    mov        r1,#0x0
LAB_0801d664:
    strb       r1,[r5,#0xe]
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x68
    beq        LAB_0801d684
    ldr        r3,PTR_tilemapListSideArrow_0801d688
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    mov        r0,#0xd
    ldrh       r1,[r5,#0x20]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801d684:
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapListSideArrow_0801d688:
    .word tilemapListSideArrow


_ts Menu_Network_PrintBlankEntry
    push       {r5,lr}
    ldr        r7,PTR_ChipBagSlot_0801d6d8
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    push       {r0,r7}
    mov        r0,#0xf
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderSackList_0801d6e0
    mov        r4,#0xe
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r0,r7}
    mov        r1,#0x0
LAB_0801d6aa:
    ldr        r2,[r7,#0x18]
    tst        r2,r2
    bne        LAB_0801d6ce
    push       {r0,r1,r7}
    mov        r3,#0x1
    and        r3,r1
    lsl        r3,r3,#0x6
    ldr        r2,PTR_tilemapNetworkTradeBlankEntry_0801d6dc
    add        r3,r3,r2
    mov        r0,#0xf
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x0
    mov        r4,#0xe
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r0,r1,r7}
LAB_0801d6ce:
    add        r7,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801d6aa
    pop        {r5,pc}
PTR_ChipBagSlot_0801d6d8:
    .word ChipBagSlot_02018fe0
PTR_tilemapNetworkTradeBlankEntry_0801d6dc:
    .word tilemapNetworkTradeBlankEntry
PTR_tilemapFolderSackList_0801d6e0:
    .word tilemapFolderSackList


_ts Menu_Network_ClearPackets
    push       {r5,lr}
    ldr        r0,PTR_PlayerMpState_0801d6fc
    mov        r1,#0x10
    mov        r2,#0xff
    bl         memset
    ldr        r0,PTR_gListMPStateAll_0801d700
    mov        r1,#0x40
    mov        r2,#0xff
    bl         memset
    pop        {r5,pc}
PTR_PlayerMpState_0801d6fc:
    .word PlayerMpState_020037d0
PTR_gListMPStateAll_0801d700:
    .word gListMPStateAll


_ts Menu_Network_HandleInputTrade
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801d800
    mov        r0,#0x20
    ldrh       r1,[r5,r0]
    mov        r0,#0x22
    strh       r1,[r5,r0]
    mov        r0,#0x24
    ldrh       r1,[r5,r0]
    mov        r0,#0x26
    strh       r1,[r5,r0]
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Get400
    mov        r5,r9
    beq        LAB_0801d734
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
    b          LAB_0801d800
LAB_0801d734:
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_0801d740
    sub        r0,#0x1
    strb       r0,[r5,#0xf]
    b          LAB_0801d800
LAB_0801d740:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801d752
    bl         Menu_Network_TradeClose
    b          LAB_0801d800
LAB_0801d752:
    mov        r1,#0x8
    tst        r1,r0
    beq        LAB_0801d75e
    bl         Menu_Network_OpenSort
    b          LAB_0801d800
LAB_0801d75e:
    mov        r6,#0x28
    ldrh       r6,[r5,r6]
    tst        r6,r6
    beq        LAB_0801d800
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801d772
    bl         FUN_0801dc74
    b          LAB_0801d800
LAB_0801d772:
    mov        r2,#0x20
    ldrh       r2,[r5,r2]
    mov        r3,#0x24
    ldrh       r3,[r5,r3]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_0801db44
    tst        r4,r1
    beq        LAB_0801d78a
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_0801d78a:
    mov        r4,#0x7
    ldr        r1,DAT_0801db48
    tst        r1,r0
    bne        LAB_0801d7a0
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801d7a8
    sub        r2,r2,r4
    bge        LAB_0801d7a8
    mov        r2,#0x0
LAB_0801d7a0:
    sub        r3,r3,r4
    bgt        LAB_0801d7e0
    mov        r3,#0x0
    b          LAB_0801d7e0
LAB_0801d7a8:
    mov        r6,#0x28
    ldrh       r6,[r5,r6]
    sub        r6,#0x1
    mov        r4,#0x7
    ldr        r1,DAT_0801db4c
    tst        r1,r0
    bne        LAB_0801d7cc
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801d7e0
    cmp        r6,#0x6
    blt        LAB_0801d7c4
    mov        r6,#0x6
LAB_0801d7c4:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801d7e0
    add        r2,r6,#0x0
LAB_0801d7cc:
    cmp        r6,#0x6
    blt        LAB_0801d7e0
    mov        r6,#0x28
    ldrh       r6,[r5,r6]
    sub        r6,#0x7
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801d7e0
    add        r3,r6,#0x0
    b          LAB_0801d7e0
LAB_0801d7e0:
    mov        r4,#0x20
    ldrh       r4,[r5,r4]
    cmp        r2,r4
    bne        LAB_0801d7f2
    mov        r4,#0x24
    ldrh       r4,[r5,r4]
    cmp        r3,r4
    bne        LAB_0801d7f2
    b          LAB_0801d7f8
LAB_0801d7f2:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801d7f8:
    mov        r0,#0x20
    strh       r2,[r5,r0]
    mov        r0,#0x24
    strh       r3,[r5,r0]
LAB_0801d800:
    pop        {pc}


_ts Menu_Network_PrintNoneEntry
    push       {r5,lr}
    ldrh       r0,[r5,#0x24]
    tst        r0,r0
    bne        LAB_0801d81c
    mov        r0,#0xf
    mov        r1,#0x4
    mov        r2,#0x0
    ldr        r3,PTR_tilemapNetworkNoneEntry_0801db50
    mov        r4,#0xe
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801d81c:
    pop        {r5,pc}


_ts Menu_Network_OpenSort
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x78]
    ldrb       r1,[r0,#0x2]
    strb       r1,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0x68
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         SetSortDefault
    pop        {r5}
    pop        {pc}


_ts Menu_Network_PrintUiTradeSort
    push       {r5,lr}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x68
    bne        LAB_0801d86c
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderSortList_0801d870
    mov        r4,#0xc
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    mov        r0,#0x3
    mov        r1,#0x2
    mov        r2,#0x1
    ldr        r3,PTR_tilemapSmallList_0801d874
    mov        r4,#0x8
    mov        r5,#0xf
    bl         Screen_CopyTileMapRect
LAB_0801d86c:
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapFolderSortList_0801d870:
    .word tilemapFolderSortList
PTR_tilemapSmallList_0801d874:
    .word tilemapSmallList


_ts Menu_Network_26_Sort
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801d89a
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801d89a
    cmp        r0,#0x2
    beq        LAB_0801d8a4
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801d8ae
    cmp        r1,#0xf0
    beq        LAB_0801d89a
    b          LAB_0801d8a4
LAB_0801d89a:
    mov        r0,#0x2c
    mov        r1,#0x5a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d8b2
LAB_0801d8a4:
    mov        r0,#0x2c
    mov        r1,#0x5b
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801d8b2
LAB_0801d8ae:
    bl         Menu_Network_HandleInputSort
LAB_0801d8b2:
    bl         Menu_Network_PrintUiTrade
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_HandleInputSort
    push       {lr}
    ldrb       r1,[r5,#0x1c]
    strb       r1,[r5,#0x1d]
    ldrb       r1,[r5,#0x1e]
    strb       r1,[r5,#0x1f]
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Get400
    mov        r5,r9
    beq        LAB_0801d8d8
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
    b          LAB_0801d96a
LAB_0801d8d8:
    ldrb       r0,[r5,#0xf]
    tst        r0,r0
    beq        LAB_0801d8e4
    sub        r0,#0x1
    strb       r0,[r5,#0xf]
    b          LAB_0801d96a
LAB_0801d8e4:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0xa
    tst        r1,r0
    beq        LAB_0801d8fc
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    mov        r0,#0x20
    strb       r0,[r5,#0x1]
    b          LAB_0801d96a
LAB_0801d8fc:
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801d908
    bl         Menu_Network_UpdateSort
    b          LAB_0801d96a
LAB_0801d908:
    ldrb       r2,[r5,#0x1c]
    ldrb       r3,[r5,#0x1e]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801d926
    sub        r2,r2,r4
    bge        LAB_0801d926
    mov        r2,#0x5
    sub        r3,r3,r4
    bgt        LAB_0801d952
    mov        r3,#0x0
    b          LAB_0801d952
LAB_0801d926:
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801d952
    mov        r6,#0x6
    sub        r6,#0x1
    cmp        r6,#0x5
    blt        LAB_0801d938
    mov        r6,#0x5
LAB_0801d938:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801d952
    mov        r2,#0x0
    cmp        r6,#0x5
    blt        LAB_0801d952
    mov        r6,#0x6
    sub        r6,#0x6
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801d952
    add        r3,r6,#0x0
    b          LAB_0801d952
LAB_0801d952:
    ldrb       r4,[r5,#0x1c]
    cmp        r2,r4
    bne        LAB_0801d960
    ldrb       r4,[r5,#0x1e]
    cmp        r3,r4
    bne        LAB_0801d960
    b          LAB_0801d966
LAB_0801d960:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801d966:
    strb       r2,[r5,#0x1c]
    strb       r3,[r5,#0x1e]
LAB_0801d96a:
    pop        {pc}


_ts Menu_Network_UpdateSort
    push       {lr}
    ldrb       r0,[r5,#0x1c]
    mov        r1,r10
    ldr        r1,[r1,#0x78]
    ldrb       r2,[r1,#0x2]
    cmp        r0,r2
    beq        LAB_0801d984
    strb       r0,[r1,#0x2]
    ldr        r2,PTR_listDefaultSort_0801db54
    ldrb       r0,[r2,r0]
    strb       r0,[r1,#0x3]
    b          LAB_0801d98e
LAB_0801d984:
    strb       r0,[r1,#0x2]
    ldrb       r0,[r1,#0x3]
    mov        r2,#0x4
    eor        r0,r2
    strb       r0,[r1,#0x3]
LAB_0801d98e:
    bl         Menu_Folder_SortSack
    add        r0,#0x1
    strh       r0,[r5,#0x28]
    mov        r0,#0xff
    strb       r0,[r5,#0x14]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    pop        {pc}


_ts Menu_Network_PrintArrowsTrade
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x4
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0xe
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x68
    bne        LAB_0801d9fe
    ldrb       r1,[r5,#0xe]
    ldr        r3,PTR_tilemapListSideArrow_0801da54
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    ldrb       r1,[r5,#0x1c]
    lsl        r1,r1,#0x1
    add        r1,#0x5
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_0801d9fe:
    mov        r0,#0x28
    ldrh       r0,[r5,r0]
    cmp        r0,#0x7
    ble        LAB_0801da4c
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    mov        r0,#0x24
    ldrh       r0,[r5,r0]
    ldr        r3,PTR_tilemapUpDownArrows_0801da58
    add        r3,r3,r1
    cmp        r0,#0x0
    beq        LAB_0801da2e
    push       {r0,r3,r5}
    mov        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r0,r3,r5}
LAB_0801da2e:
    mov        r1,#0x28
    ldrh       r1,[r5,r1]
    sub        r1,#0x7
    cmp        r0,r1
    beq        LAB_0801da4c
    push       {r5}
    mov        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_0801da4c:
    pop        {pc}

    .align 2, 0

    .word tilemapFolderBlank
PTR_tilemapListSideArrow_0801da54:
    .word tilemapListSideArrow
PTR_tilemapUpDownArrows_0801da58:
    .word tilemapUpDownArrows


_ts Menu_Network_PrintUiTradeFrame
    push       {r5,lr}
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapMenuNetworkTrade_0801da70
    mov        r4,#0x20
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}
PTR_tilemapMenuNetworkTrade_0801da70:
    .word tilemapMenuNetworkTrade


_ts Menu_Network_GetOtherMpState
    ldr        r7,PTR_gListMPStateAll_0801da88
    ldr        r0,PTR_REG_SIOCNT_0801da8c
    ldr        r0,[r0,#0x0]
    ldr        r1,DAT_0801da90
    and        r0,r1
    lsr        r0,r0,#0x4
    tst        r0,r0
    bne        LAB_0801da86
    add        r7,#0x10
LAB_0801da86:
    mov        pc,lr
PTR_gListMPStateAll_0801da88:
    .word gListMPStateAll
PTR_REG_SIOCNT_0801da8c:
    .word REG_SIOCNT
DAT_0801da90:
    .word 0x30


_ts Menu_Network_ChangeStateShowMessage
    push       {lr}
    push       {r0,r1}
    bl         Menu_Network_ClearPackets
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    pop        {r0,r1}
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801dab4
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_textDict_MenuMessages_0801dab4:
    .word textDict_MenuMessages


_ts Menu_Network_GetOtherPlayerDelay
    push       {lr}
    push       {r5}
    bl         SIO_GetMultiplayerId
    pop        {r5}
    mov        r2,#0x0
    cmp        r0,#0x2
    bge        LAB_0801dad2
    ldrh       r0,[r5,#0x10]
    ldr        r1,DAT_0801dad8
    cmp        r0,r1
    bge        LAB_0801dad2
    mov        r2,#0x1
LAB_0801dad2:
    tst        r2,r2
    pop        {pc}

    .align 2, 0

DAT_0801dad8:
    .word 0x12C


_ts Menu_Network_GetOtherPlayerSelection
    push       {lr}
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    mov        r2,#0xf0
    add        r4,r0,#0x0
    and        r4,r2
LAB_0801daec:
    ldrb       r3,[r7,r1]
    cmp        r0,r3
    bne        LAB_0801db04
    and        r3,r2
    cmp        r4,r3
    bne        LAB_0801db08
    add        r1,#0x1
    cmp        r1,#0x10
    blt        LAB_0801daec
    ldrb       r1,[r7,#0x0]
    mov        r0,#0x0
    pop        {pc}
LAB_0801db04:
    mov        r0,#0x1
    pop        {pc}
LAB_0801db08:
    mov        r0,#0x2
    pop        {pc}


_ts Menu_Network_TransmitOptionSelection
    push       {lr}
    ldr        r7,PTR_PlayerMpState_0801db58
    strb       r0,[r7,#0x0]
    mov        r1,#0x4
LAB_0801db14:
    strb       r0,[r7,r1]
    add        r1,#0x1
    cmp        r1,#0x10
    blt        LAB_0801db14
    pop        {pc}


_ts Menu_Network_CheckPageOffset
    ldrh       r0,[r5,#0x28]
    cmp        r0,#0x6
    ble        LAB_0801db34
    ldrh       r1,[r5,#0x24]
    add        r1,#0x7
    cmp        r0,r1
    bge        LAB_0801db42
    sub        r0,#0x7
    strh       r0,[r5,#0x24]
    b          LAB_0801db42
LAB_0801db34:
    tst        r0,r0
    beq        LAB_0801db42
    sub        r0,#0x1
    ldrh       r1,[r5,#0x20]
    cmp        r0,r1
    bgt        LAB_0801db42
    strh       r0,[r5,#0x20]
LAB_0801db42:
    mov        pc,lr
DAT_0801db44:
    .word 0x300
DAT_0801db48:
    .word 0x200
DAT_0801db4c:
    .word 0x100
PTR_tilemapNetworkNoneEntry_0801db50:
    .word tilemapNetworkNoneEntry
PTR_listDefaultSort_0801db54:
    .word listDefaultSort
PTR_PlayerMpState_0801db58:
    .word PlayerMpState_020037d0


_ts Menu_Network_22_ConfirmOptionBattle
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801dbc4
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801dbc4
    cmp        r0,#0x2
    beq        LAB_0801dbce
    mov        r2,#0xf0
    and        r1,r2
    mov        r2,#0x40
    ldrb       r7,[r5,#0x1]
    cmp        r7,#0x58
    beq        LAB_0801db7e
    mov        r2,#0x20
LAB_0801db7e:
    cmp        r1,r2
    beq        LAB_0801dba4
    cmp        r1,#0xf0
    bne        LAB_0801dbce
    ldrh       r0,[r5,#0x12]
    add        r0,#0x1
    strh       r0,[r5,#0x12]
    cmp        r0,#0x10
    bne        LAB_0801db9c
    push       {r0,r5}
    ldr        r0,PTR_textDict_MenuMessages_0801ddb8
    mov        r1,#0x6f
    bl         Text_LoadDialogue
    pop        {r0,r5}
LAB_0801db9c:
    ldr        r1,DAT_0801ddbc
    cmp        r0,r1
    bge        LAB_0801dbc4
    b          LAB_0801dbd6
LAB_0801dba4:
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x5c
    ldrb       r7,[r5,#0x1]
    cmp        r7,#0x58
    beq        LAB_0801dbba
    mov        r0,#0x64
LAB_0801dbba:
    strb       r0,[r5,#0x1]
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
    b          LAB_0801dbd6
LAB_0801dbc4:
    mov        r0,#0x14
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801dbd6
LAB_0801dbce:
    mov        r0,#0x14
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
LAB_0801dbd6:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_23_StartBattle
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801dc42
    mov        r1,#0x9
    ldrb       r7,[r5,#0x1]
    cmp        r7,#0x5c
    beq        LAB_0801dbf4
    mov        r1,#0x8
LAB_0801dbf4:
    push       {r5}
    mov        r0,#0x7
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r6,#0x1
    bl         World_SetBattleParams
    bl         Text_DisableDialogue
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    bl         NPC_UnloadAll
    bl         Battle_Init
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x8
    strb       r1,[r0,#0x0]
    push       {r5}
    mov        r0,#0x3
    bl         Video_SetBgControl
    ldr        r0,PTR_paletteKeyboardNumberChars_0801ddc0
    ldr        r1,PTR_eBgPaletteF_0801ddc4
    mov        r2,#0x20
    bl         memcpy_32
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
LAB_0801dc42:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_TradeClose
    push       {lr}
    ldrb       r0,[r5,#0x14]
    tst        r0,r0
    bne        LAB_0801dc66
    bl         Menu_Network_ClearPackets
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#0x1]
    b          LAB_0801dc70
LAB_0801dc66:
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
LAB_0801dc70:
    pop        {pc}


_ts FUN_0801dc74
    push       {lr}
    ldrb       r0,[r5,#0x14]
    tst        r0,r0
    bne        LAB_0801dc96
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r1,#0x20
    ldrh       r2,[r5,#0x24]
    ldrh       r3,[r5,#0x20]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    add        r7,r5,#0x0
    add        r7,#0x2a
    strh       r1,[r7,#0x0]
    strh       r2,[r7,#0x2]
    strh       r3,[r7,#0x4]
LAB_0801dc96:
    bl         FUN_0801dc9c
    pop        {pc}


_ts FUN_0801dc9c
    push       {lr}
    ldr        r6,PTR_ChipBagSlot_0801ddc8
    ldrh       r2,[r5,#0x24]
    ldrh       r3,[r5,#0x20]
    add        r2,r2,r3
    lsl        r2,r2,#0x5
    add        r2,r2,r6
    add        r7,r5,#0x0
    add        r7,#0x2a
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
    add        r0,r0,r1
    lsl        r0,r0,#0x5
    add        r0,r0,r6
    cmp        r0,r2
    beq        LAB_0801dd06
    cmp        r0,r6
    beq        LAB_0801dd3a
    cmp        r2,r6
    beq        LAB_0801dd3a
    ldr        r6,[r0,#0x0]
    ldr        r7,[r2,#0x0]
    str        r7,[r0,#0x0]
    str        r6,[r2,#0x0]
    ldr        r6,[r0,#0x4]
    ldr        r7,[r2,#0x4]
    str        r7,[r0,#0x4]
    str        r6,[r2,#0x4]
    ldr        r6,[r0,#0x8]
    ldr        r7,[r2,#0x8]
    str        r7,[r0,#0x8]
    str        r6,[r2,#0x8]
    ldr        r6,[r0,#0xc]
    ldr        r7,[r2,#0xc]
    str        r7,[r0,#0xc]
    str        r6,[r2,#0xc]
    ldr        r6,[r0,#0x10]
    ldr        r7,[r2,#0x10]
    str        r7,[r0,#0x10]
    str        r6,[r2,#0x10]
    ldr        r6,[r0,#0x14]
    ldr        r7,[r2,#0x14]
    str        r7,[r0,#0x14]
    str        r6,[r2,#0x14]
    ldr        r6,[r0,#0x18]
    ldr        r7,[r2,#0x18]
    str        r7,[r0,#0x18]
    str        r6,[r2,#0x18]
    ldr        r6,[r0,#0x1c]
    ldr        r7,[r2,#0x1c]
    str        r7,[r0,#0x1c]
    str        r6,[r2,#0x1c]
    b          LAB_0801dd2e
LAB_0801dd06:
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x1]
    ldr        r1,[r2,#0x18]
    tst        r1,r1
    bne        LAB_0801dd12
LAB_0801dd12:
    ldr        r7,PTR_PlayerMpState_0801ddcc
    ldr        r2,[r2,#0x8]
    lsr        r2,r2,#0x10
    strb       r1,[r7,#0x1]
    strb       r2,[r7,#0x2]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x1]
    pop        {pc}
LAB_0801dd2e:
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0xff
    strb       r0,[r5,#0x14]
    pop        {pc}
LAB_0801dd3a:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    pop        {pc}


_nt FUN_0801dd46
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801ddb8
    mov        r1,#0x5e
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x30
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts FUN_0801dd64
    push       {lr}
    ldrb       r0,[r5,#0x14]
    tst        r0,r0
    beq        LAB_0801ddb6
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x2
    and        r1,r7
    cmp        r1,#0x0
    beq        LAB_0801ddb6
    add        r7,r5,#0x0
    add        r7,#0x2a
    ldrh       r1,[r7,#0x0]
    ldrh       r2,[r7,#0x2]
    ldrh       r3,[r7,#0x4]
    add        r2,r2,r3
    add        r7,r5,#0x0
    add        r7,r7,r1
    ldrh       r1,[r7,#0x4]
    sub        r2,r2,r1
    blt        LAB_0801ddb6
    cmp        r2,#0x7
    bge        LAB_0801ddb6
    add        r2,#0x2
    lsl        r2,r2,#0x4
    mov        r1,#0xd
    lsl        r1,r1,#0x3
    push       {r5}
    add        r1,#0x2
    sub        r2,#0x2
    ldr        r0,DAT_0801ddd0
    lsl        r1,r1,#0x10
    orr        r0,r1
    orr        r0,r2
    ldr        r1,DAT_0801ddd4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
LAB_0801ddb6:
    pop        {pc}
PTR_textDict_MenuMessages_0801ddb8:
    .word textDict_MenuMessages
DAT_0801ddbc:
    .word 0x12C
PTR_paletteKeyboardNumberChars_0801ddc0:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801ddc4:
    .word eBgPaletteF
PTR_ChipBagSlot_0801ddc8:
    .word ChipBagSlot_02018fe0
PTR_PlayerMpState_0801ddcc:
    .word PlayerMpState_020037d0
DAT_0801ddd0:
    .word 0x40000000
DAT_0801ddd4:
    .word 0xC01


_ts Menu_Network_13_TradePending
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801de92
    push       {r5}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetMenuDesign_0801de98
    ldr        r1,PTR_DAT_0801de9c
    ldr        r2,DAT_0801dea0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801dea4
    ldr        r1,PTR_eBgPalette4_0801dea8
    mov        r2,#0x38
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801deac
    ldr        r1,PTR_DAT_0801deb0
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801deb4
    ldr        r1,PTR_eBgPaletteF_0801deb8
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    ldr        r7,PTR_PlayerMpState_0801debc
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    ldr        r2,PTR_DAT_0801dec0
    ldr        r3,PTR_DAT_0801dec4
    mov        r4,#0xb
    lsl        r4,r4,#0x5
    bl         Menu_LoadChipDataCustom
    ldr        r0,PTR_tilesetNoChip_0801dee4
    ldr        r1,PTR_DAT_0801dee8
    ldr        r2,DAT_0801deec
    bl         Dma_TransferListAdd
    mov        r0,#0x0
    ldr        r7,PTR_DAT_0801dec8
LAB_0801de34:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x58
    blt        LAB_0801de34
    add        r0,r7,#0x0
    mov        r1,#0x58
    mov        r2,#0x38
    bl         ArrayShuffle
    pop        {r5}
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuNetwork3_0801decc
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    ldr        r2,DAT_0801ded0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_TilemapEntry_ARRAY_0801ded4
    ldr        r7,PTR_PlayerMpState_0801debc
    ldrb       r1,[r7,#0x1]
    tst        r1,r1
    bne        LAB_0801de6c
    ldr        r0,PTR_tilemapMenuNetwork4_0801dedc
LAB_0801de6c:
    ldr        r1,PTR_DAT_0801ded8
    mov        r2,#0xb0
    bl         memcpy_32
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    ldr        r0,PTR_textDict_MenuMessages_0801dee0
    mov        r1,#0x6c
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
    mov        r0,#0x0
    str        r0,[r5,#0x3c]
    mov        r0,#0x38
    strb       r0,[r5,#0x1]
LAB_0801de92:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_tilesetMenuDesign_0801de98:
    .word tilesetMenuDesign
PTR_DAT_0801de9c:
    .word 0x6000020
DAT_0801dea0:
    .word 0x540
PTR_paletteMenuDesign_0801dea4:
    .word paletteMenuDesign
PTR_eBgPalette4_0801dea8:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801deac:
    .word tilesetMenuSideArrow
PTR_DAT_0801deb0:
    .word 0x6004020
PTR_paletteMenuSideArrow_0801deb4:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801deb8:
    .word eBgPaletteF
PTR_PlayerMpState_0801debc:
    .word PlayerMpState_020037d0
PTR_DAT_0801dec0:
    .word 0x6008200
PTR_DAT_0801dec4:
    .word 0x2029000
PTR_DAT_0801dec8:
    .word 0x2026000
PTR_tilemapMenuNetwork3_0801decc:
    .word tilemapMenuNetwork3
DAT_0801ded0:
    .word 0xC0
PTR_TilemapEntry_ARRAY_0801ded4:
    .word TilemapEntry_ARRAY_08019668
PTR_DAT_0801ded8:
    .word 0x2026200
PTR_tilemapMenuNetwork4_0801dedc:
    .word tilemapMenuNetwork4
PTR_textDict_MenuMessages_0801dee0:
    .word textDict_MenuMessages
PTR_tilesetNoChip_0801dee4:
    .word tilesetNoChip
PTR_DAT_0801dee8:
    .word 0x6009800
DAT_0801deec:
    .word 0x68


_ts Menu_Network_14
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801df12
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801df12
    cmp        r0,#0x2
    beq        LAB_0801df1c
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801df26
    cmp        r1,#0xf0
    beq        LAB_0801df12
    b          LAB_0801df1c
LAB_0801df12:
    mov        r0,#0x54
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801dfa6
LAB_0801df1c:
    mov        r0,#0x54
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801dfa6
LAB_0801df26:
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x1]
    cmp        r0,#0xff
    beq        LAB_0801df72
    push       {r5}
    mov        r8,r7
    add        r1,r0,#0x0
    ldr        r0,PTR_tilemapChipDetailFG_0801dfb0
    tst        r1,r1
    bne        LAB_0801df3e
    ldr        r0,PTR_tilemapMenuNetwork4_0801dfb8
LAB_0801df3e:
    ldr        r1,PTR_DAT_0801dfb4
    mov        r2,#0xb0
    bl         memcpy_32
    mov        r7,r8
    pop        {r5}
    push       {r5}
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    str        r0,[r5,#0x34]
    str        r1,[r5,#0x38]
    ldr        r2,PTR_DAT_0801dfc0
    ldr        r3,PTR_DAT_0801dfc4
    mov        r4,#0x0
    bl         Menu_LoadChipDataCustom
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801dfbc
    mov        r1,#0x6d
    bl         Text_LoadDialogue
    pop        {r5}
    b          LAB_0801dfa6
LAB_0801df72:
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801dfa6
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801dfa6
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    ldr        r7,PTR_PlayerMpState_0801e370
    mov        r0,#0xff
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x2]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x50
    strb       r0,[r5,#0x1]
LAB_0801dfa6:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_tilemapChipDetailFG_0801dfb0:
    .word tilemapChipDetailFG
PTR_DAT_0801dfb4:
    .word 0x2026400
PTR_tilemapMenuNetwork4_0801dfb8:
    .word tilemapMenuNetwork4
PTR_textDict_MenuMessages_0801dfbc:
    .word textDict_MenuMessages
PTR_DAT_0801dfc0:
    .word 0x600a000
PTR_DAT_0801dfc4:
    .word 0x202b000


_ts Menu_Network_19_LoadOptionMenu
    push       {lr}
    bl         Menu_Network_PrintChipsTrading
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801e074
    push       {r5}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetMenuDesign_0801e374
    ldr        r1,PTR_DAT_0801e378
    ldr        r2,DAT_0801e37c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801e380
    ldr        r1,PTR_eBgPalette4_0801e384
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801e388
    ldr        r1,PTR_DAT_0801e38c
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801e390
    ldr        r1,PTR_eBgPaletteF_0801e394
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    bl         Menu_Network_PrintMpInfo
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuNetwork_0801e398
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801e39c
    add        r1,r1,r2
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkListOptions_0801e3a0
    mov        r4,#0xd
    mov        r5,#0x6
    bl         Screen_CopyTileMapRect
    mov        r0,#0x16
    mov        r1,#0x5
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkChipCount_0801e3a4
    mov        r4,#0x6
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,#0x13
    mov        r1,#0x9
    mov        r2,#0x2
    ldr        r3,PTR_tilemapNetworkWinLoss_0801e3a8
    mov        r4,#0x9
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    bl         Menu_Network_ClearPackets
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    ldr        r0,PTR_textDict_MenuMessages_0801e3ac
    ldrb       r1,[r5,#0xc]
    add        r1,#0x67
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xf]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0801e074:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_20_LoadTradeMenu
    push       {lr}
    bl         Menu_Network_PrintChipsTrading
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801e08e
    mov        r0,#0x1c
    strb       r0,[r5,#0x1]
LAB_0801e08e:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_21
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801e0b4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x4c
    strb       r0,[r5,#0x1]
LAB_0801e0b4:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_PrintChipsTrading
    push       {lr}
    mov        r0,#0x0
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801e0f0
    mov        r3,#0x1
    bl         Menu_Network_PrintChipDetailTrading
    bl         Menu_Network_GetOtherMpState
    ldr        r0,[r5,#0x3c]
    tst        r0,r0
    bne        LAB_0801e0dc
    mov        r3,#0x0
    ldrb       r0,[r7,#0x1]
    cmp        r0,#0xff
    beq        LAB_0801e0de
LAB_0801e0dc:
    mov        r3,#0x1
LAB_0801e0de:
    mov        r0,#0x14
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801e0f4
    bl         Menu_Network_PrintChipDetailTrading
    pop        {pc}

    .align 2, 0

    .word textDict_MenuMessages
PTR_DAT_0801e0f0:
    .word 0x2026200
PTR_DAT_0801e0f4:
    .word 0x2026400


_ts Menu_Network_PrintChipDetailTrading
    push       {r5,lr}
    mov        r8,r0
    mov        r9,r1
    mov        r12,r2
    push       {r3}
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipDetailBG_0801e3b0
    mov        r4,#0xa
    mov        r5,#0xd
    bl         Screen_CopyTileMapRect
    pop        {r3}
    tst        r3,r3
    beq        LAB_0801e128
    mov        r0,#0x1
    add        r0,r8
    mov        r1,#0x1
    add        r1,r9
    mov        r2,#0x0
    mov        r3,r12
    mov        r4,#0x8
    mov        r5,#0xb
    bl         Screen_CopyTileMapRect
LAB_0801e128:
    pop        {r5,pc}


_ts Menu_Network_15
    push       {lr}
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801e14e
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801e14e
    cmp        r0,#0x2
    beq        LAB_0801e158
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801e162
    cmp        r1,#0xf0
    beq        LAB_0801e14e
    b          LAB_0801e158
LAB_0801e14e:
    mov        r0,#0x54
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801e1c6
LAB_0801e158:
    mov        r0,#0x54
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801e1c6
LAB_0801e162:
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x1]
    cmp        r0,#0xff
    bne        LAB_0801e17e
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801e270
    mov        r1,#0x6c
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x1]
    b          LAB_0801e1c6
LAB_0801e17e:
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    ldr        r2,[r5,#0x34]
    ldr        r3,[r5,#0x38]
    cmp        r0,r2
    bne        LAB_0801e14e
    cmp        r1,r3
    bne        LAB_0801e14e
    mov        r0,#0x20
    bl         Text_CheckOption
    beq        LAB_0801e1c6
    bl         TextOption_GetDefaultOption
    tst        r0,r0
    bne        LAB_0801e1aa
    mov        r0,#0x81
    bl         Menu_Network_TransmitOptionSelection
    mov        r0,#0x40
    strb       r0,[r5,#0x1]
    b          LAB_0801e1c6
LAB_0801e1aa:
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x50
    strb       r0,[r5,#0x1]
    mov        r0,#0x80
    bl         Menu_Network_TransmitOptionSelection
    mov        r0,#0xff
    strb       r0,[r7,#0x1]
    strb       r0,[r7,#0x2]
LAB_0801e1c6:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

    .word textDict_MenuMessages


_ts Menu_Network_16_TradeAcceptPending
    push       {lr}
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801e20a
    cmp        r0,#0x2
    beq        LAB_0801e214
    cmp        r1,#0x81
    beq        LAB_0801e24c
    cmp        r1,#0x82
    beq        LAB_0801e24c
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801e20a
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801e20a
    cmp        r0,#0x2
    beq        LAB_0801e214
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801e21e
    cmp        r1,#0xf0
    beq        LAB_0801e20a
    b          LAB_0801e214
LAB_0801e20a:
    mov        r0,#0x54
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801e266
LAB_0801e214:
    mov        r0,#0x54
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801e266
LAB_0801e21e:
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x1]
    cmp        r0,#0xff
    bne        LAB_0801e23a
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801e270
    mov        r1,#0x6c
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x38
    strb       r0,[r5,#0x1]
    b          LAB_0801e266
LAB_0801e23a:
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    ldr        r2,[r5,#0x34]
    ldr        r3,[r5,#0x38]
    cmp        r0,r2
    bne        LAB_0801e20a
    cmp        r1,r3
    bne        LAB_0801e20a
    b          LAB_0801e266
LAB_0801e24c:
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    str        r0,[r5,#0x34]
    str        r1,[r5,#0x38]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x44
    strb       r0,[r5,#0x1]
    mov        r0,#0x1
    str        r0,[r5,#0x3c]
    mov        r0,#0x82
    bl         Menu_Network_TransmitOptionSelection
LAB_0801e266:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_textDict_MenuMessages_0801e270:
    .word textDict_MenuMessages


_ts Menu_Network_17_PerformTrade
    push       {lr}
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801e2a6
    cmp        r0,#0x2
    beq        LAB_0801e2b0
    cmp        r1,#0x82
    beq        LAB_0801e2d0
    bl         Menu_Network_GetOtherPlayerDelay
    beq        LAB_0801e2a6
    bl         Menu_Network_GetOtherPlayerSelection
    cmp        r0,#0x1
    beq        LAB_0801e2a6
    cmp        r0,#0x2
    beq        LAB_0801e2b0
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,#0x80
    beq        LAB_0801e2ba
    cmp        r1,#0xf0
    beq        LAB_0801e2a6
    b          LAB_0801e2b0
LAB_0801e2a6:
    mov        r0,#0x54
    mov        r1,#0x6a
    bl         Menu_Network_ChangeStateShowMessage
    b          LAB_0801e30a
LAB_0801e2b0:
    mov        r0,#0x54
    mov        r1,#0x77
    bl         Menu_Network_ChangeStateShowMessage
    bne        LAB_0801e30a
LAB_0801e2ba:
    bl         Menu_Network_GetOtherMpState
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    ldr        r2,[r5,#0x34]
    ldr        r3,[r5,#0x38]
    cmp        r0,r2
    bne        LAB_0801e2a6
    cmp        r1,r3
    bne        LAB_0801e2a6
    b          LAB_0801e30a
LAB_0801e2d0:
    push       {r5}
    ldr        r0,[r5,#0x34]
    ldr        r1,[r5,#0x38]
    tst        r0,r0
    beq        LAB_0801e2e0
    mov        r2,#0x1
    bl         Inventory_AddChip
LAB_0801e2e0:
    ldr        r7,PTR_PlayerMpState_0801e3b4
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    tst        r0,r0
    beq        LAB_0801e300
    push       {r0,r1}
    mov        r2,#0x1
    bl         Inventory_SubtractChip
    pop        {r0,r1}
    ldr        r2,[r5,#0x34]
    ldr        r3,[r5,#0x38]
    sub        r0,r0,r2
    sub        r1,r1,r3
    str        r0,[r5,#0x34]
    str        r1,[r5,#0x38]
LAB_0801e300:
    bl         Save_SaveGame
    pop        {r5}
    mov        r0,#0x48
    strb       r0,[r5,#0x1]
LAB_0801e30a:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Network_18_RevealTrade
    push       {lr}
    ldr        r0,[r5,#0x30]
    push       {r0}
    mov        r1,#0x3
    and        r0,r1
    bne        LAB_0801e326
    mov        r0,#0xca
    bl         Sound_PlaySongImmediate
LAB_0801e326:
    pop        {r0}
    ldr        r1,PTR_DAT_0801e3b8
    ldr        r2,PTR_DAT_0801e3bc
    ldr        r3,PTR_DAT_0801e3c0
    ldrb       r3,[r3,r0]
    lsl        r3,r3,#0x1
    ldrh       r6,[r1,r3]
    ldrh       r7,[r2,r3]
    strh       r7,[r1,r3]
    strh       r6,[r2,r3]
    add        r0,#0x1
    str        r0,[r5,#0x30]
    cmp        r0,#0x58
    blt        LAB_0801e362
    mov        r0,#0x54
    strb       r0,[r5,#0x1]
    ldr        r0,[r5,#0x34]
    ldr        r4,[r5,#0x38]
    mov        r1,#0x6e
    tst        r0,r0
    bne        LAB_0801e356
    tst        r4,r4
    bne        LAB_0801e356
    mov        r1,#0x5f
LAB_0801e356:
    ldr        r0,PTR_textDict_MenuMessages_0801e36c
    bl         Text_LoadDialogue
    bl         Menu_Network_ClearPackets
    pop        {r5}
LAB_0801e362:
    bl         Menu_Network_PrintChipsTrading
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_textDict_MenuMessages_0801e36c:
    .word textDict_MenuMessages
PTR_PlayerMpState_0801e370:
    .word PlayerMpState_020037d0
PTR_tilesetMenuDesign_0801e374:
    .word tilesetMenuDesign
PTR_DAT_0801e378:
    .word 0x6000020
DAT_0801e37c:
    .word 0x540
PTR_paletteMenuDesign_0801e380:
    .word paletteMenuDesign
PTR_eBgPalette4_0801e384:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801e388:
    .word tilesetMenuSideArrow
PTR_DAT_0801e38c:
    .word 0x6004020
PTR_paletteMenuSideArrow_0801e390:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801e394:
    .word eBgPaletteF
PTR_tilemapMenuNetwork_0801e398:
    .word tilemapMenuNetwork
DAT_0801e39c:
    .word 0x800
PTR_tilemapNetworkListOptions_0801e3a0:
    .word tilemapNetworkListOptions
PTR_tilemapNetworkChipCount_0801e3a4:
    .word tilemapNetworkChipCount
PTR_tilemapNetworkWinLoss_0801e3a8:
    .word tilemapNetworkWinLoss
PTR_textDict_MenuMessages_0801e3ac:
    .word textDict_MenuMessages
PTR_tilemapChipDetailBG_0801e3b0:
    .word tilemapChipDetailBG
PTR_PlayerMpState_0801e3b4:
    .word PlayerMpState_020037d0
PTR_DAT_0801e3b8:
    .word 0x2026200
PTR_DAT_0801e3bc:
    .word 0x2026400
PTR_DAT_0801e3c0:
    .word 0x2026000
