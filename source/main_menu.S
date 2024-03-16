#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set MainMenu_LoadTitleScreen, 0x0801093C
    .set tilesetBlankTiles, 0x87b6798
    .set tileset8MainMenuBackground, 0x87b67d8
    .set tileset8BattleNetworkLogo, 0x87b8c58
    .set palette8MainMenu, 0x87b6598
    .set tilesetMainMenuText, 0x87b4758
    .set paletteMainMenuText, 0x87b64d8
    .set layoutMainMenuBG1, 0x87bc2d8
    .set layoutMainMenuBackground, 0x87bc7d8
    .set layoutBattleNetworkLogo, 0x87bccd8

    .text

    .thumb

_ts InitMainMenu
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x34]
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }

_ts MainMenu_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldr        r0,=jumpTableMainMenu
    ldrb       r1,[r5,#0x0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

    .pool

jumpTableMainMenu:
    .word 0x08010460+1
    .word 0x080104D4+1
    .word 0x08010504+1

    .ascii "\x00\x01RNO/%1d,%1d,%1d,%1d"
    .align 2,0

_ts MainMenu_0_Init
    push       { lr }
    push       { r5 }
    mov        r0,#0x5
    bl         Video_SetBgControl
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0xc]
    strh       r1,[r0,#0xe]
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    bl         MainMenu_LoadTitleScreen
    mov        r0,#FT_FadeOutToBlack
    mov        r1,#0xff
    bl         Fade_Request
    pop        { r5 }
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#T_Theme_Of_Mega_Man_Battle_Network
    bl         Sound_PlaySong
    mov        r0,#F400_SaveOk
    bl         Flag_Clear400
    mov        r0,#0x0
    push       { r0, r5 }
    bl         Save_LoadGame
    bl         Save_ChecksumCheck
    pop        { r0, r5 }
    bne        LAB_080104c8
    push       { r0, r5 }
    bl         Save_CheckBuildId
    pop        { r0, r5 }
    bne        LAB_080104c8
    mov        r0,#0x1
    push       { r0, r5 }
    mov        r0,#F400_SaveOk
    bl         Flag_Set400
    pop        { r0, r5 }
LAB_080104c8:
    strb       r0,[r5,#0xb]
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    strb       r0,[r5,#0x7]
    pop        { pc }


_ts MainMenu_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_ARRAY_080104f0
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         MainMenu_DrawCopyrightInfo
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    ldrh       r0,[r7,#0x14]
    sub        r0,#0x2
    strh       r0,[r7,#0x14]
    pop        {pc}
PTR_PTR_ARRAY_080104f0:
    .word PTR_ARRAY_080104f4
PTR_ARRAY_080104f4:
    .word MainMenu_1_0_Display
    .word MainMenu_1_1_PressStartMenuLoop
    .word MainMenu_1_2_Options
    .word MainMenu_1_3_End


_ts MainMenu_2_Free
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08010548
    mov        r1,#0x0
    push       {r1}
    mov        r0,#0x9
    bl         Flag_Get400
    pop        {r1}
    beq        LAB_0801052c
    mov        r1,#0x1
LAB_0801052c:
    push       {r1,r5}
    bl         Oam_Init
    bl         InitWorld_NewGame
    bl         InitWorld_LoadGame
    pop        {r1,r5}
    tst        r1,r1
    beq        LAB_08010550
    mov        r0,#0x9
    bl         Flag_Set400
    b          LAB_08010550
LAB_08010548:
    push       {r5}
    bl         InitWorld_LoadGame
    pop        {r5}
LAB_08010550:
    pop        {pc}

   .align 2, 0

   .word 0x300


_ts MainMenu_1_0_Display
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    ldr        r0,INT_08010580
    strh       r0,[r5,#0x4]
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,INT_08010584
    strh       r1,[r0,#0x0]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    pop        {pc}

    .align 2, 0

INT_08010580:
    .word 0x8E8
INT_08010584:
    .word 0x1F40


_ts MainMenu_1_1_PressStartMenuLoop
    push       {lr}
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    ble        LAB_080105a8
    ldr        r1,INT_080105cc
    cmp        r0,r1
    bne        LAB_080105a2
    push       {r0,r5}
    mov        r0,#0x1f
    mov        r1,#0x10
    bl         Song_FadeOut
    pop        {r0,r5}
LAB_080105a2:
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    b          LAB_080105ba
LAB_080105a8:
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    b          LAB_080105c6
LAB_080105ba:
    ldrh       r0,[r5,#0x4]
    ldr        r1,INT_080105d0
    cmp        r0,r1
    bge        LAB_080105c6
    bl         MainMenu_HandlePressStart
LAB_080105c6:
    bl         MainMenu_PressStartFlash
    pop        {pc}

   .align 2, 0

INT_080105cc:
    .word 0x12C
INT_080105d0:
    .word 0x8AC


_ts MainMenu_1_2_Options
    push       {lr}
    bl         MainMenu_HandleInput
    bl         MainMenu_DisplayMenuOptions
    pop        {pc}


_ts MainMenu_1_3_End
    push       {lr}
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    ble        LAB_080105ec
    bl         MainMenu_DisplayMenuOptions
LAB_080105ec:
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08010618
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    ble        LAB_08010608
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0x2
    strb       r0,[r5,#0x0]
    b          LAB_08010618
LAB_08010608:
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x14
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         InitMainMenu
    pop        {r5}
LAB_08010618:
    pop        {pc}


_ts MainMenu_PressStartFlash
    push       {r5,lr}
    mov        r0,r10
    ldr        r0,[r0,#0x50]
    ldrh       r0,[r0,#0x0]
    mov        r1,#0x1f
    and        r0,r1
    cmp        r0,#0x18
    bgt        LAB_08010668
    ldr        r0,ObjectXYAttributes_0801066c
    mov        r1,#0x1
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_08010670
    mov        r1,#0x9
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_08010674
    mov        r1,#0x11
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_08010678
    mov        r1,#0x19
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_0801067c
    mov        r1,#0x21
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
LAB_08010668:
    pop        {r5,pc}

   .align 2, 0

ObjectXYAttributes_0801066c:
    .word 0x80344062
ObjectXYAttributes_08010670:
    .word 0x80544062
ObjectXYAttributes_08010674:
    .word 0x80744062
ObjectXYAttributes_08010678:
    .word 0x80944062
ObjectXYAttributes_0801067c:
    .word 0x00b48062


_ts MainMenu_DisplayMenuOptions
    push       {r5,lr}
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldrb       r0,[r5,#0x6]
    add        r0,#0x1
    cmp        r0,#0x12
    blt        LAB_08010690
    mov        r0,#0x0
LAB_08010690:
    strb       r0,[r5,#0x6]
    ldrb       r0,[r5,#0x7]
    add        r0,#0x1
    cmp        r0,#0x3c
    blt        LAB_0801069c
    mov        r0,#0x0
LAB_0801069c:
    strb       r0,[r5,#0x7]
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x1
    ldr        r1,PTR_tileAttrListArrow_080107a4
    ldrh       r1,[r1,r0]
    ldrb       r2,[r5,#0x8]
    lsl        r2,r2,#0x2
    ldr        r0,PTR_ObjectXYAttributes_080107a0
    ldr        r0,[r0,r2]
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldrb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08010734
    ldr        r0,ObjXY_New
    ldr        r1,ObjectTileAttributes_080109b4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Gam
    ldr        r1,ObjectTileAttributes_080109b8
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_E
    ldr        r1,ObjectTileAttributes_080109bc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    mov        r7,r10
    ldr        r5,[r7,#0x34]
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        LAB_0801079c
    ldr        r0,ObjXY_Cont
    ldr        r1,ObjectTileAttributes_080109c0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Inue
    ldr        r1,ObjectTileAttributes_080109c4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Blank
    ldr        r1,ObjectTileAttributes_080109c8
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    mov        r0,#0x5
    bl         Flag_GetBase
    beq        LAB_0801079c
    ldr        r0,ObjXY_Star
    ldr        r1,PTR_tileAttrListStarShine_080107f0
    mov        r7,r10
    ldr        r7,[r7,#0x34]
    ldrb       r7,[r7,#0x7]
    mov        r6,#0x3
    bic        r7,r6
    ldr        r1,[r1,r7]
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    b          LAB_0801079c
LAB_08010734:
    ldr        r0,ObjXY_New
    ldr        r1,ObjectTileAttributes_080109cc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Gam
    ldr        r1,ObjectTileAttributes_080109d0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_E
    ldr        r1,ObjectTileAttributes_080109d4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Cont
    ldr        r1,ObjectTileAttributes_080109d8
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Inue
    ldr        r1,ObjectTileAttributes_080109dc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjXY_Blank
    ldr        r1,PTR_DAT_080109e0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    mov        r0,#0x5
    bl         Flag_GetBase
    beq        LAB_0801079c
    ldr        r0,ObjXY_Star
    ldr        r1,PTR_tileAttrListStarShine_080107f0
    mov        r7,r10
    ldr        r7,[r7,#0x34]
    ldrb       r7,[r7,#0x7]
    mov        r6,#0x3
    bic        r7,r6
    ldr        r1,[r1,r7]
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
LAB_0801079c:
    pop        {r5,pc}

    .align 2, 0

PTR_ObjectXYAttributes_080107a0:
    .word ObjectXYAttributes_080107a8
PTR_tileAttrListArrow_080107a4:
    .word tileAttrListArrow
ObjectXYAttributes_080107a8:
    .word 0x4048005a
    .word 0x4048006a
tileAttrListArrow:
    .short 0x4023
    .short 0x4023
    .short 0x4023
    .short 0x4023
    .short 0x4023
    .short 0x4023
    .short 0x4027
    .short 0x4027
    .short 0x4027
    .short 0x4027
    .short 0x4027
    .short 0x4027
    .short 0x402b
    .short 0x402b
    .short 0x402b
    .short 0x402b
    .short 0x402b
    .short 0x402b
ObjXY_New:
    .word 0x8058405a
ObjXY_Gam:
    .word 0x8078405a
ObjXY_E:
    .word 0x4098005a
ObjXY_Cont:
    .word 0x8058406a
ObjXY_Inue:
    .word 0x8078406a
ObjXY_Blank:
    .word 0x0098806a
ObjXY_Star:
    .word 0x409c006a
PTR_tileAttrListStarShine_080107f0:
    .word tileAttrListStarShine
tileAttrListStarShine:
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x502F
    .word 0x5033
    .word 0x5037
    .word 0x503B
    .word 0x503F
    .word 0x5043


_ts MainMenu_HandlePressStart
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x4]
    ldrh       r0,[r0,#0x2]
    mov        r1,#0x8
    tst        r1,r0
    beq        LAB_08010848
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
LAB_08010848:
    pop        {pc}


_ts MainMenu_HandleInput
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x9
    tst        r1,r0
    beq        LAB_08010882
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080108b4
    bl         Sound_StopAllMusic
    mov        r0,#0x64
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    b          LAB_080108b4
LAB_08010882:
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_08010898
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    b          LAB_080108b4
LAB_08010898:
    ldrh       r0,[r7,#0x4]
    mov        r1,#0xc0
    tst        r1,r0
    beq        LAB_080108b4
    ldrb       r0,[r5,#0xb]
    tst        r0,r0
    beq        LAB_080108b4
    ldrb       r0,[r5,#0x8]
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#0x8]
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_080108b4:
    pop        {pc}


_ts MainMenu_DrawCopyrightInfo
    push       {r5,lr}
    ldr        r0,DAT_0801091c
    ldr        r1,PTR_DAT_080109e4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010920
    ldr        r1,PTR_DAT_080109e8
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010924
    ldr        r1,PTR_DAT_080109ec
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010928
    ldr        r1,PTR_DAT_080109f0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_0801092c
    ldr        r1,PTR_DAT_080109f4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010930
    ldr        r1,PTR_DAT_080109f8
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010934
    ldr        r1,PTR_DAT_080109fc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_08010938
    ldr        r1,PTR_DAT_08010a00
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5,pc}

   .align 2, 0

DAT_0801091c:
    .word 0x8000007E
DAT_08010920:
    .word 0x8020007E
DAT_08010924:
    .word 0x8040007E
DAT_08010928:
    .word 0x8060007E
DAT_0801092c:
    .word 0x807E007E
DAT_08010930:
    .word 0x80A0007E
DAT_08010934:
    .word 0x80C0007E
DAT_08010938:
    .word 0x80E0007E


_ts MainMenu_LoadTitleScreen
    push       {lr}
    bl         Video_ClearAllTile0Maps
    ldr        r0,PTR_tilesetBlankTiles_08010a04
    ldr        r1,PTR_DAT_08010a08
    mov        r2,#0x10
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tileset8MainMenuBackground_08010a0c
    ldr        r1,PTR_DAT_08010a10
    ldr        r2,DAT_08010a14
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tileset8BattleNetworkLogo_08010a18
    ldr        r1,PTR_DAT_08010a1c
    ldr        r2,DAT_08010a20
    bl         Dma_TransferListAdd
    ldr        r0,PTR_palette8MainMenu_08010a24
    ldr        r1,PTR_eBgPalette0_08010a28
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMainMenuText_08010a2c
    ldr        r1,PTR_DAT_08010a30
    ldr        r2,DAT_08010a34
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMainMenuText_08010a38
    ldr        r1,PTR_eObjPalette0_08010a3c
    mov        r2,#0xc0
    bl         memcpy_32
    bl         Video_ClearScreen
    ldr        r0,PTR_layoutMainMenuBG1_08010a40
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_08010a44
    add        r1,r1,r2
    ldr        r2,DAT_08010a48
    bl         Dma_TransferListAdd
    ldr        r0,PTR_layoutMainMenuBackground_08010a4c
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,INT_08010a50
    add        r1,r1,r2
    ldr        r2,DAT_08010a48
    bl         Dma_TransferListAdd
    ldr        r0,PTR_layoutBattleNetworkLogo_08010a54
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,INT_08010a58
    add        r1,r1,r2
    ldr        r2,DAT_08010a48
    bl         Dma_TransferListAdd
    pop        {pc}

   .align 2, 0

ObjectTileAttributes_080109b4:
    .word 0x1047
ObjectTileAttributes_080109b8:
    .word 0x104F
ObjectTileAttributes_080109bc:
    .word 0x1057
ObjectTileAttributes_080109c0:
    .word 0x205B
ObjectTileAttributes_080109c4:
    .word 0x2063
ObjectTileAttributes_080109c8:
    .word 0x206B
ObjectTileAttributes_080109cc:
    .word 0x2047
ObjectTileAttributes_080109d0:
    .word 0x204F
ObjectTileAttributes_080109d4:
    .word 0x2057
ObjectTileAttributes_080109d8:
    .word 0x105B
ObjectTileAttributes_080109dc:
    .word 0x1063
PTR_DAT_080109e0:
    .word 0x106b
PTR_DAT_080109e4:
    .word 0x306d
PTR_DAT_080109e8:
    .word 0x307d
PTR_DAT_080109ec:
    .word 0x308d
PTR_DAT_080109f0:
    .word 0x309d
PTR_DAT_080109f4:
    .word 0x30ad
PTR_DAT_080109f8:
    .word 0x30bd
PTR_DAT_080109fc:
    .word 0x30cd
PTR_DAT_08010a00:
    .word 0x30dd
PTR_tilesetBlankTiles_08010a04:
    .word tilesetBlankTiles
PTR_DAT_08010a08:
    .word 0x6000040
PTR_tileset8MainMenuBackground_08010a0c:
    .word tileset8MainMenuBackground
PTR_DAT_08010a10:
    .word 0x6000440
DAT_08010a14:
    .word 0x920
PTR_tileset8BattleNetworkLogo_08010a18:
    .word tileset8BattleNetworkLogo
PTR_DAT_08010a1c:
    .word 0x6004040
DAT_08010a20:
    .word 0xDA0
PTR_palette8MainMenu_08010a24:
    .word palette8MainMenu
PTR_eBgPalette0_08010a28:
    .word eBgPalette0
PTR_tilesetMainMenuText_08010a2c:
    .word tilesetMainMenuText
PTR_DAT_08010a30:
    .word 0x6010020
DAT_08010a34:
    .word 0x760
PTR_paletteMainMenuText_08010a38:
    .word paletteMainMenuText
PTR_eObjPalette0_08010a3c:
    .word eObjPalette0
PTR_layoutMainMenuBG1_08010a40:
    .word layoutMainMenuBG1
DAT_08010a44:
    .word 0x800
DAT_08010a48:
    .word 0x140
PTR_layoutMainMenuBackground_08010a4c:
    .word layoutMainMenuBackground
INT_08010a50:
    .word 0x1000
PTR_layoutBattleNetworkLogo_08010a54:
    .word layoutBattleNetworkLogo
INT_08010a58:
    .word 0x1800
