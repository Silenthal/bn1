#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts InitCredits
    push       {lr}
    ldr        r0,PTR_gCredits_0802188c
    mov        r1,#0x10
    bl         memset0_32
    pop        {pc}

_ts Credits_Main
    push       {lr}
    ldr        r5,PTR_gCredits_08021890
    ldr        r0,PTR_jumpTableCreditsMain_08021894
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

jumpTableCreditsMain:
    .word Credits_0_Init
    .word Credits_1_Main
    .word Credits_2_Free


_ts Credits_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_paletteCreditsText_08021898
    ldr        r1,PTR_gBgPaletteF_0802189c
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_tilesetDialogueText_080218a0
    ldr        r1,PTR_DAT_080218a4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    LoadMain gameStats, r7, r7
    ldr        r0,[r7,#GameStats_gameTimer]
    ldr        r1,framesPerHour
    push       {r5}
    bl         SWI_Div
    pop        {r5}
    strb       r0,[r5,#0x9]
    add        r0,r1,#0x0
    ldr        r1,INT_080218ac
    push       {r5}
    bl         SWI_Div
    pop        {r5}
    strb       r0,[r5,#0xa]
    push       {r5}
    bl         Library_GetStandardChipCount
    pop        {r5}
    strb       r1,[r5,#0xc]
    mov        r0,#0xaf
    push       {r0,r5}
    Flag_GetLibrary CD_Bass
    pop        {r0,r5}
    beq        LAB_08021514
    mov        r0,#0xb0
LAB_08021514:
    strb       r0,[r5,#0xd]
    push       {r5}
    bl         Status_GetLevel
    pop        {r5}
    strb       r0,[r5,#0xe]
    mov        r0,#T_End_Roll
    bl         Sound_PlayBGM
    mov        r0,#0x3c
    strh       r0,[r5,#0x4]
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    pop        {pc}


_ts Credits_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_Credits_1_0_StartScene_08021544
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_Credits_1_0_StartScene_08021544:
    .word PTR_Credits_1_0_StartScene_08021548
PTR_Credits_1_0_StartScene_08021548:
    .word Credits_1_0_StartScene
    .word Credits_1_1_SceneMain
    .word Credits_1_2_ShowCreditsBackdrop
    .word Credits_1_3_FadeOut
    .word Credits_1_4_Wait
    .word Credits_1_5_SaveGame
    .word Credits_1_6_FinalScreen


_ts Credits_2_Free
    push       {lr}
    push       {r5}
    bl         Main_Init
    pop        {r5}
    LoadMain manager, r0, r7
    mov        r1,#0x14
    strb       r1,[r0,#Manager_gameState]
    LoadMain display, r0, r7
    mov        r1,#0x40
    strh       r1,[r0,#Manager_gameState]
    pop        {pc}


_ts Credits_1_0_StartScene
    push       {lr}
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    bl         Flag_InitGate
    bl         Flag_InitIgnore
    pop        {r5}
    bl         Credits_GetCreditsSceneData
    ldr        r0,[r7,#0x4]
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    bl         Credits_LoadScene
    push       {r5}
    mov        r0,#0x3
    bl         Video_SetBgControl
    pop        {r5}
    LoadMain display, r0, r7
    ldr        r1,INT_080215d4
    strh       r1,[r0,#DisplaySettings_dispcnt]
    mov        r0,#0x3
    ldrb       r1,[r5,#0x8]
    cmp        r1,#0x0
    bne        LAB_080215c4
    mov        r0,#FT_FadeInFromWhite
LAB_080215c4:
    push       {r5}
    mov        r1,#0x4
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    pop        {pc}
INT_080215d4:
    .word 0x1F40


_ts Credits_1_1_SceneMain
    push       {lr}
    bl         SceneCamera_Main
    push       {r0,r5}
    bl         EntityBounds_InitList
    bl         PlayerLocation_UpdateAll
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         NPC_UpdateAll
    bl         EntityBounds_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r0,r5}
    cmp        r0,#0x1
    beq        LAB_08021662
    push       {r5}
    Fade_Request FT_FadeOutAlphaBlendBG0, 0xff
    pop        {r5}
    bl         Credits_GetCreditsSceneData
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x3c
    mul        r0,r1
    strh       r0,[r5,#0x4]
    bl         Credits_GetNextCreditsSceneData
    mov        r0,#0x8
    cmp        r7,#0xff
    bne        LAB_0802165c
    push       {r5}
    mov        r0,#0x1f
    mov        r1,#0x10
    bl         Sound_FadeOut
    pop        {r5}
    mov        r1,#0x0
    strh       r1,[r5,#0x6]
    strb       r1,[r5,#0xf]
    mov        r0,#0x18
LAB_0802165c:
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
LAB_08021662:
    pop        {pc}


_ts Credits_1_2_ShowCreditsBackdrop
    push       {lr}
    push       {r5}
    bl         EntityBounds_InitList
    bl         PlayerLocation_UpdateAll
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         NPC_UpdateAll
    bl         EntityBounds_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    bl         Credits_PrintBackdrop
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    bne        LAB_080216c4
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    push       {r5}
    Fade_Request FT_FadeInAlphaBlendBG0, 0x10
    pop        {r5}
LAB_080216c4:
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_080216dc
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
LAB_080216dc:
    pop        {pc}


_ts Credits_1_3_FadeOut
    push       {lr}
    push       {r5}
    bl         EntityBounds_InitList
    bl         PlayerLocation_UpdateAll
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         NPC_UpdateAll
    bl         EntityBounds_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    bl         Credits_PrintBackdrop
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0802175e
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x8]
    add        r0,#0x1
    strb       r0,[r5,#0x8]
    bl         Credits_GetCreditsSceneData
    cmp        r7,#0xff
    beq        LAB_08021756
    bl         Credits_ResetEntityData
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    b          LAB_0802175e
LAB_08021756:
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    mov        r0,#0x3c
    strh       r0,[r5,#0x4]
LAB_0802175e:
    pop        {pc}


_ts Credits_1_4_Wait
    push       {lr}
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_0802176e
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
LAB_0802176e:
    pop        {pc}


_ts Credits_1_5_SaveGame
    push       {lr}
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_080217fa
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    push       {r5}
    ldr        r0,PTR_gFolder_080218b0
    ldr        r1,PTR_gTempMemory_080218b4
    mov        r2,#0x3c
    bl         memcpy_32
    ldr        r0,PTR_gBattleChipInventory_080218b8
    ldr        r1,PTR_DAT_080218bc
    ldr        r2,INT_080218c0
    bl         memcpy_32
    ldr        r0,PTR_DAT_080218c4
    ldr        r1,PTR_DAT_080218c8
    mov        r2,#0x20
    bl         memcpy_16
    pop        {r5}
    Flag_ClearSystem F_SYSTEM_SAVE_OK
    push       {r5}
    bl         Save_LoadGame
    bl         Save_ChecksumCheck
    pop        {r5}
    bne        LAB_080217fa
    push       {r5}
    bl         Save_CheckBuildId
    pop        {r5}
    bne        LAB_080217fa
    Flag_SetSystem F_SYSTEM_SAVE_OK
    push       {r5}
    Flag_SetBase 0x05
    ldr        r0,PTR_gTempMemory_080218b4
    ldr        r1,PTR_gFolder_080218cc
    mov        r2,#0x3c
    bl         memcpy_8
    ldr        r0,PTR_DAT_080218bc
    ldr        r1,PTR_gBattleChipInventory_080218d0
    ldr        r2,INT_080218c0
    bl         memcpy_8
    ldr        r0,PTR_DAT_080218c8
    ldr        r1,PTR_DAT_080218d4
    mov        r2,#0x20
    bl         memcpy_8
    pop        {r5}
    push       {r5}
    bl         Save_SaveGame
    pop        {r5}
    bne        LAB_080217fa
LAB_080217fa:
    pop        {pc}


_ts Credits_1_6_FinalScreen
    push       {lr}
    push       {r5}
    bl         EntityBounds_InitList
    bl         PlayerLocation_UpdateAll
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         NPC_UpdateAll
    bl         EntityBounds_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    bl         Credits_PrintBackdrop
    bl         Credits_PrintTheEnd
    ldrb       r0,[r5,#0x2]
    tst        r0,r0
    bne        LAB_08021860
    mov        r0,#0x1
    strb       r0,[r5,#0x2]
    push       {r5}
    Fade_Request FT_FadeInAlphaBlendBG0, 0x10
    pop        {r5}
LAB_08021860:
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_0802186c
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_08021888
LAB_0802186c:
    LoadMain input, r7, r7
    ldrh       r0,[r7,#Input_toggleKeyState]
    ldr        r1,DAT_080218d8
    tst        r1,r0
    beq        LAB_08021888
    push       {r5}
    Fade_Request FT_FadeOutToBlack, 0x2
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
LAB_08021888:
    pop        {pc}

    .align 2, 0

PTR_gCredits_0802188c:
    .word gCredits
PTR_gCredits_08021890:
    .word gCredits
PTR_jumpTableCreditsMain_08021894:
    .word jumpTableCreditsMain
PTR_paletteCreditsText_08021898:
    .word paletteCreditsText
PTR_gBgPaletteF_0802189c:
    .word gBgPaletteF
PTR_tilesetDialogueText_080218a0:
    .word tilesetDialogueText
PTR_DAT_080218a4:
    .word 0x600dfe0
framesPerHour:
    .word 0x34BC0
INT_080218ac:
    .word 0xE10
PTR_gFolder_080218b0:
    .word gFolder
PTR_gTempMemory_080218b4:
    .word gTempMemory
PTR_gBattleChipInventory_080218b8:
    .word gBattleChipInventory
PTR_DAT_080218bc:
    .word 0x201103c
INT_080218c0:
    .word 0xF00
PTR_DAT_080218c4:
    .word 0x2000020
PTR_DAT_080218c8:
    .word 0x2011f3c
PTR_gFolder_080218cc:
    .word gFolder
PTR_gBattleChipInventory_080218d0:
    .word gBattleChipInventory
PTR_DAT_080218d4:
    .word 0x2000020
DAT_080218d8:
    .word 0x3FF
tilemapCreditsBackdrop:
    .incbin "images/credits/backdrop.tilemap"


_ts Credits_LoadScene
    push       {r5,lr}
    bl         Credits_GetCreditsSceneData
    push       {r5,r7}
    ldr        r0,[r7,#0x10]
    bl         Entity_AllocList
    pop        {r5,r7}
    push       {r5,r7}
    ldr        r7,[r7,#0x8]
    bl         Map_LoadNPCList
    pop        {r5,r7}
    push       {r5,r7}
    add        r7,#0x20
LAB_08021b2a:
    ldr        r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_08021b3c
    push       {r7}
    bl         BgTask_AddNew
    pop        {r7}
    add        r7,#0x4
    b          LAB_08021b2a
LAB_08021b3c:
    pop        {r5,r7}
    push       {r5,r7}
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         BGDM_Init
    pop        {r5,r7}
    push       {r5,r7}
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Map_LoadBackgroundData
    pop        {r5,r7}
    LoadMain camera, r6, r6
    ldr        r0,[r6,#Camera_posMapNext_x]
    ldr        r1,[r6,#Camera_posMapNext_y]
    ldr        r2,[r6,#Camera_posMapNext_z]
    ldrb       r3,[r7,#0x0]
    ldrb       r4,[r7,#0x1]
    push       {r5,r7}
    bl         Camera_Init
    bl         BGDM_Load
    pop        {r5,r7}
    push       {r5,r7}
    ldr        r0,[r7,#0x14]
    ldr        r1,[r7,#0x18]
    ldr        r2,[r7,#0x1c]
    bl         BgUpdate_Set
    pop        {r5,r7}
    push       {r7}
    bl         Credits_GetNextCreditsSceneData
    cmp        r7,#0xff
    pop        {r7}
    beq        LAB_08021b90
    bl         Credits_PrintPage
    b          LAB_08021b94
LAB_08021b90:
    bl         Credits_PrintLastPage
LAB_08021b94:
    push       {r5}
    push       {r7}
    ldr        r0,PTR_gDstCompressedSpriteData_08021d7c
    bl         SpriteLz_Init
    pop        {r7}
    ldrb       r1,[r7,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r7,#0xc]
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {r5,pc}


_ts Credits_ResetEntityData
    push       {r5,lr}
    LoadMain world, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#World_npcCommandList]
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    mov        r0,#0x3
    bl         Video_SetBgControl
    LoadMain display, r0, r5
    ldr        r1,INT_08021bd0
    strh       r1,[r0,#0x0]
    pop        {r5,pc}
INT_08021bd0:
    .word 0x1F40


_ts Credits_GetCreditsSceneData
    ldr        r7,PTR_listCreditsSceneData_08021c24
    ldrb       r0,[r5,#0x8]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        pc,lr


_ts Credits_PrintBackdrop
    push       {r5,lr}
    push       {r5}
    bl         Credits_GetCreditsSceneData
    ldrb       r0,[r7,#0x2]
    mov        r1,#0x10
    mul        r0,r1
    mov        r1,#0x0
    mov        r2,#0x0
    ldr        r3,PTR_tilemapCreditsBackdrop_08021d30
    mov        r4,#0xe
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    pop        {r5}
    bl         Credits_GetNextCreditsSceneData
    cmp        r7,#0xff
    bne        LAB_08021c16
    mov        r0,#0x1
    mov        r1,#0x2
    mov        r2,#0x0
    ldr        r3,PTR_tilemapPresentedByCapcom_08021d34
    mov        r4,#0xc
    mov        r5,#0x6
    bl         Screen_CopyTileMapRect
LAB_08021c16:
    pop        {r5,pc}


_ts Credits_GetNextCreditsSceneData
    ldr        r7,PTR_listCreditsSceneData_08021c24
    ldrb       r0,[r5,#0x8]
    add        r0,#0x1
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        pc,lr
PTR_listCreditsSceneData_08021c24:
    .word listCreditsSceneData


_ts Credits_PrintPage
    push       {r5,r7,lr}
    mov        r6,#0x0
    ldrb       r1,[r5,#0x8]
    mov        r2,#0xa
    mul        r1,r2
    add        r1,#0xa
LAB_08021c34:
    push       {r1,r6}
    LoadMain textUI, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#TextUI_numberBuffer]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    str        r0,[r7,#0x10]
    ldr        r0,PTR_textDict_Credits_08021d80
    add        r1,r1,r6
    lsl        r6,r6,#0xa
    ldr        r2,PTR_iwBufferUITextTile_08021d84
    add        r2,r2,r6
    ldr        r3,PTR_BG_VRAM_BASE3_08021d88
    add        r3,r3,r6
    add        r3,#0x20
    mov        r4,#0xc
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_08021d8c
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r1,r6}
    add        r6,#0x1
    cmp        r6,#0x8
    blt        LAB_08021c34
    pop        {r5,r7,pc}


_ts Credits_PrintLastPage
    push       {r5,r7,lr}
    mov        r6,#0x3
    ldrb       r1,[r5,#0x8]
    mov        r2,#0xa
    mul        r1,r2
    add        r1,#0xa
LAB_08021c78:
    push       {r1,r5,r6}
    cmp        r6,#0x3
    beq        LAB_08021c88
    cmp        r6,#0x5
    beq        LAB_08021c8e
    cmp        r6,#0x6
    beq        LAB_08021c94
    b          LAB_08021c96
LAB_08021c88:
    ldrb       r0,[r5,#0x9]
    ldrb       r1,[r5,#0xa]
    b          LAB_08021c96
LAB_08021c8e:
    ldrb       r0,[r5,#0xc]
    ldrb       r1,[r5,#0xd]
    b          LAB_08021c96
LAB_08021c94:
    ldrb       r0,[r5,#0xe]
LAB_08021c96:
    LoadMain textUI, r7, r7
    str        r0,[r7,#TextUI_numberBuffer]
    str        r1,[r7,#0x8]
    ldr        r0,PTR_textDict_Credits_08021d80
    mov        r1,#0x8c
    add        r1,r1,r6
    lsl        r6,r6,#0xa
    ldr        r2,PTR_iwBufferUITextTile_08021d90
    add        r2,r2,r6
    ldr        r3,PTR_BG_VRAM_BASE3_08021d88
    add        r3,r3,r6
    add        r3,#0x20
    mov        r4,#0xd
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_08021d8c
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r1,r5,r6}
    add        r6,#0x1
    cmp        r6,#0x8
    blt        LAB_08021c78
    ldr        r0,PTR_tileset_PresentedByCapcom_08021d94
    ldr        r1,PTR_DAT_08021d98
    ldr        r2,DAT_08021d9c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_palette_PresentedByCapcom_08021da0
    ldr        r1,PTR_gBgPaletteE_08021da4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5,r7,pc}


_ts Credits_PrintTheEnd
    push       {r5,lr}
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    bgt        LAB_08021d1c
    ldrh       r0,[r5,#0x6]
    add        r0,#0x1
    strh       r0,[r5,#0x6]
    ldr        r6,PTR_listTheEndTiming_08021d6c
    ldrb       r1,[r5,#0xf]
    ldrb       r1,[r6,r1]
    cmp        r0,r1
    blt        LAB_08021d02
    mov        r0,#0x0
    strh       r0,[r5,#0x6]
    ldrb       r0,[r5,#0xf]
    add        r0,#0x1
    cmp        r0,#0xa
    bgt        LAB_08021d02
    strb       r0,[r5,#0xf]
LAB_08021d02:
    ldr        r7,PTR_listTheEndCharRect_08021d38
    ldrb       r0,[r5,#0xf]
    lsl        r0,r0,#0x2
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x0
    ldr        r3,PTR_tilemapCreditsBackdrop_08021d30
    ldrb       r4,[r7,#0x2]
    ldrb       r5,[r7,#0x3]
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}
LAB_08021d1c:
    ldr        r7,PTR_listTheEndCharRect_08021d38
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x0
    ldr        r3,PTR_tilemapCreditsBackdrop_08021d30
    ldrb       r4,[r7,#0x2]
    ldrb       r5,[r7,#0x3]
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}
PTR_tilemapCreditsBackdrop_08021d30:
    .word tilemapCreditsBackdrop
PTR_tilemapPresentedByCapcom_08021d34:
    .word tilemapPresentedByCapcom
PTR_listTheEndCharRect_08021d38:
    .word listTheEndCharRect
listTheEndCharRect:
    rect 3,  16, 11, 2
    rect 4,  16, 10, 2
    rect 5,  16, 9,  2
    rect 6,  16, 8,  2
    rect 7,  16, 7,  2
    rect 8,  16, 6,  2
    rect 9,  16, 5,  2
    rect 10, 16, 4,  2
    rect 11, 16, 3,  2
    rect 12, 16, 2,  2
    rect 13, 16, 1,  2
    rect -1, -1, -1, -1

PTR_listTheEndTiming_08021d6c:
    .word listTheEndTiming
listTheEndTiming:
    .byte 0x14, 0x14, 0x14, 0x14
    .byte 0x14, 0x14, 0x1E, 0x1E
    .byte 0x1E, 0x1E, 0x00, 0x00
PTR_gDstCompressedSpriteData_08021d7c:
    .word gDstCompressedSpriteData
PTR_textDict_Credits_08021d80:
    .word textDict_Credits
PTR_iwBufferUITextTile_08021d84:
    .word iwBufferUITextTile
PTR_BG_VRAM_BASE3_08021d88:
    .word BG_VRAM_BASE3
PTR_tilesetDialogueText_08021d8c:
    .word tilesetDialogueText
PTR_iwBufferUITextTile_08021d90:
    .word iwBufferUITextTile
PTR_tileset_PresentedByCapcom_08021d94:
    .word tileset_PresentedByCapcom
PTR_DAT_08021d98:
    .word 0x600c020
DAT_08021d9c:
    .word 0x190
PTR_palette_PresentedByCapcom_08021da0:
    .word palette_PresentedByCapcom
PTR_gBgPaletteE_08021da4:
    .word gBgPaletteE
listCreditsSceneData:
    .word CreditsSceneData_0
    .word CreditsSceneData_1
    .word CreditsSceneData_2
    .word CreditsSceneData_3
    .word CreditsSceneData_4
    .word CreditsSceneData_5
    .word CreditsSceneData_6
    .word CreditsSceneData_7
    .word CreditsSceneData_8
    .word CreditsSceneData_9
    .word CreditsSceneData_10
    .word CreditsSceneData_11
    .word CreditsSceneData_12
    .word CreditsSceneData_13
    .word 0xFF

CreditsSceneData_0:
    .short Map_ACDC_Town
    .byte 1
    .byte 3
    .word CSD_Cam_0
    .word CSD_NPC_0
    .word SpriteList_ACDC
    .word EntityAllocParams_8030D50
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_8029F14
    .word BgTask_8029F2C
    .word BgTask_8029F8C
    .word BgTask_8029FA4
    .word  0xFF

CreditsSceneData_1:
    .short Map_Oven_Comp_2
    .byte 1
    .byte 3
    .word CSD_Cam_1
    .word CSD_NPC_1
    .word SpriteList_Oven_Comp
    .word CSD_Entity_1
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_80423F8
    .word BgTask_8042418
    .word BgTask_8042448
    .word BgTask_8042498
    .word BgTask_80424D8
    .word BgTask_8042528
    .word  0xFF

CreditsSceneData_2:
    .short Map_School_Class_5A
    .byte 0
    .byte 3
    .word CSD_Cam_2
    .word CSD_NPC_2
    .word SpriteList_School
    .word EntityAllocParams_8029B18
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_School_TilesetBlackboardTriangle
    .word BgTask_School_PaletteBlackboardOn_2
    .word  0xFF

CreditsSceneData_3:
    .short Map_School_Comp_5
    .byte 1
    .byte 3
    .word CSD_Cam_3
    .word CSD_NPC_3
    .word SpriteList_School_Comp
    .word CSD_Entity_3
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word CSD_Task_3_0
    .word CSD_Task_3_1
    .word BgTask_803ECF8
    .word BgTask_803ED68
    .word BgTask_803F138
    .word  0xFF

CreditsSceneData_4:
    .short Map_Govt_Complex_Front
    .byte 0
    .byte 3
    .word CSD_Cam_4
    .word CSD_NPC_4
    .word SpriteList_Govt
    .word EntityAllocParams_8035C18
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word  0xFF

CreditsSceneData_5:
    .short Map_Waterworks_Comp_5
    .byte 1
    .byte 3
    .word CSD_Cam_5
    .word CSD_NPC_5
    .word SpriteList_ACDC
    .word EntityAllocParams_8031024
    .word BgUpdate_NoMove
    .word BgUpdate_MoveUp
    .word IRQ_Dummy_far
    .word BgTask_8044198
    .word  0xFF

CreditsSceneData_6:
    .short Map_ACDC_Higsbys
    .byte 0
    .byte 3
    .word CSD_Cam_6
    .word CSD_NPC_6
    .word SpriteList_ACDC
    .word EntityAllocParams_8031024
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word  0xFF

CreditsSceneData_7:
    .short Map_Internet_2
    .byte 1
    .byte 3
    .word CSD_Cam_7
    .word CSD_NPC_7
    .word SpriteList_Internet
    .word CSD_Entity_7
    .word BgUpdate_NoMove
    .word BgUpdate_MoveUpLeft
    .word IRQ_Dummy_far
    .word BgTask_80515C8
    .word BgTask_8051618
    .word BgTask_8051668
    .word BgTask_80516B8
    .word BgTask_80516F8
    .word BgTask_8051780
    .word BgTask_8051820
    .word  0xFF

CreditsSceneData_8:
    .short Map_DenTown_Block_2
    .byte 0
    .byte 3
    .word CSD_Cam_8
    .word CSD_NPC_8
    .word SpriteList_DenTown
    .word CSD_Entity_8
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word  0xFF

CreditsSceneData_9:
    .short Map_Traffic_Light_Comp_5
    .byte 0
    .byte 3
    .word CSD_Cam_9
    .word CSD_NPC_9
    .word SpriteList_Traffic_Light_Comp
    .word CSD_Entity_9
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_80475A4
    .word BgTask_80475F4
    .word CSD_Task_9_2
    .word CSD_Task_9_3
    .word CSD_Task_9_4
    .word CSD_Task_9_5
    .word  0xFF

CreditsSceneData_10:
    .short Map_SciLab_Generator_Room
    .byte 1
    .byte 3
    .word CSD_Cam_10
    .word CSD_NPC_10
    .word SpriteList_SciLab
    .word CSD_Entity_10
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_803BD78
    .word BgTask_803BB84
    .word  0xFF

CreditsSceneData_11:
    .short Map_Power_Plant_Comp_4
    .byte 0
    .byte 3
    .word CSD_Cam_11
    .word CSD_NPC_11
    .word SpriteList_Power_Plant_Comp
    .word CSD_Entity_11
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_8049C00
    .word BgTask_8049C70
    .word BgTask_8049CE0
    .word BgTask_8049D50
    .word BgTask_8049D68
    .word CSD_Task_11_5
    .word  0xFF

CreditsSceneData_12:
    .short Map_WWW_Wily_Lab
    .byte 1
    .byte 3
    .word CSD_Cam_12
    .word CSD_NPC_12
    .word SpriteList_WWW
    .word CSD_Entity_12
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_803D7E4
    .word  0xFF

CreditsSceneData_13:
    .short Map_ACDC_Lan_Room
    .byte 0
    .byte 3
    .word CSD_Cam_13
    .word CSD_NPC_13
    .word SpriteList_ACDC
    .word CSD_Entity_13
    .word BgUpdate_NoMove
    .word BgUpdate_NoMove
    .word IRQ_Dummy_far
    .word BgTask_ACDC_Lan_Room_Window_Bird
    .word BgTask_ACDC_Lan_Room_Tileset_Computer
    .word  0xFF

CSD_Cam_0:
    cam_set 116, 52, 0
    cam_move 64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_0:
    .word NPC_80220B0
    .word NPC_80220C8
    .word NPC_80220F4
    .word NPC_8022120
    .word 0xFF

NPC_80220B0:
    a_init_basic_npc_talk 180, 82, 0, SP_Overworld_OldMan, frame=5, dialog=0x0
    a_stop

    .align 2, 0

NPC_80220C8:
    a_init_basic_npc_talk 148, 84, 0, SP_Overworld_PreschoolGirl, dialog=0x0
L_80220D4:
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_jump L_80220D4

    .align 2, 0

NPC_80220F4:
    a_init_basic_npc_talk 76, 156, 0, SP_Overworld_PreschoolBoy, dialog=0x0
L_8022100:
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_jump L_8022100

    .align 2, 0

NPC_8022120:
    a_init_basic_npc_talk 180, 98, 0, SP_Overworld_OldWoman, frame=5, dialog=0x0
    a_stop

    .align 2, 0

CSD_Cam_1:
    cam_set -130, -276, 0
    cam_move -128, 128, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_1:
    .word NPC_8022170
    .word NPC_80221A8
    .word NPC_80221D0
    .word NPC_80221F8
    .word NPC_8022220
    .word NPC_8022248
    .word NPC_8022270
    .word 0xFF

NPC_8022170:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -332, -144, 0, SP_Overworld_Prog, frame=1
    a_wait 30
    a_wait_f 7, 60
    a_wait_f 3, 240
    a_wait 30
    a_wait_f 7, 45
L_8022190:
    a_wait_f 1, 60
    a_wait_f 7, 90
    a_wait_f 1, 60
    a_wait_f 7, 45
    a_jump L_8022190

    .align 2, 0

NPC_80221A8:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -344, -168, 0, SP_Overworld_Prog
L_80221B6:
    a_wait_f 3, 60
    a_wait_f 1, 80
    a_wait_f 3, 60
    a_wait_f 1, 40
    a_wait 1
    a_jump L_80221B6

    .align 2, 0

NPC_80221D0:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -322, -198, 0, SP_Overworld_Prog
L_80221DE:
    a_wait_f 1, 120
    a_wait_f 3, 80
    a_wait_f 1, 20
    a_wait_f 3, 60
    a_wait 1
    a_jump L_80221DE

    .align 2, 0

NPC_80221F8:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -304, -200, 0, SP_Overworld_Prog
L_8022206:
    a_wait_f 3, 60
    a_wait_f 5, 40
    a_wait_f 3, 60
    a_wait_f 5, 120
    a_wait 1
    a_jump L_8022206

    .align 2, 0

NPC_8022220:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -278, -174, 0, SP_Overworld_Prog
L_802222E:
    a_wait_f 5, 30
    a_wait_f 3, 30
    a_wait_f 5, 30
    a_wait_f 3, 30
    a_wait 1
    a_jump L_802222E

    .align 2, 0

NPC_8022248:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -286, -148, 0, SP_Overworld_Prog
L_8022256:
    a_wait_f 7, 60
    a_wait_f 5, 60
    a_wait_f 7, 60
    a_wait_f 5, 60
    a_wait 1
    a_jump L_8022256

    .align 2, 0

NPC_8022270:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at -320, -24, 0, SP_Overworld_Prog
    a_wait 60
    a_move_f 11, d_nw, 8, 13
    a_wait 90
    a_move_f 8, d_ne, 8, 2
    a_move_f 9, d_se, 8, 13
    a_stop

    .align 2, 0

CSD_Entity_1:
    .word 0xFF

CSD_Cam_2:
    cam_set 16, -48, 0
    cam_move 64, 64, 0, 180
    cam_wait 120
    cam_end

CSD_NPC_2:
    .word NPC_80222E4
    .word NPC_802230C
    .word NPC_8022320
    .word NPC_8022334
    .word NPC_8022348
    .word NPC_802235C
    .word NPC_8022374
    .word NPC_802238C
    .word NPC_80223A0
    .word NPC_80223C4
    .word 0xFF

NPC_80222E4:
    a_init
    a_disable_collision
    a_set_sprite_at -48, 32, 18, SP_Overworld_Dex, frame=12
    a_stop

    .align 2, 0

NPC_80222F8:
    a_init
    a_disable_collision
    a_set_sprite_at 0, 32, 18, SP_Overworld_Mayl, frame=12
    a_stop

NPC_802230C:
    a_init
    a_disable_collision
    a_set_sprite_at -96, -16, 18, SP_Overworld_Yai, frame=12
    a_stop

    .align 2, 0

NPC_8022320:
    a_init
    a_disable_collision
    a_set_sprite_at 0, 80, 18, SP_Overworld_YoungBoy, frame=12
    a_stop

    .align 2, 0

NPC_8022334:
    a_init
    a_disable_collision
    a_set_sprite_at -96, 32, 18, SP_Overworld_YoungBoy, frame=12
    a_stop

    .align 2, 0

NPC_8022348:
    a_init
    a_disable_collision
    a_set_sprite_at -48, 80, 18, SP_Overworld_YoungBoy, frame=12
    a_stop

    .align 2, 0

NPC_802235C:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 4
    a_set_sprite_at -48, -16, 18, SP_Overworld_YoungGirl, frame=12
    a_stop

    .align 2, 0

NPC_8022374:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 4
    a_set_sprite_at -96, 80, 18, SP_Overworld_YoungGirl, frame=12
    a_stop

    .align 2, 0

NPC_802238C:
    a_init_basic_npc 0, -16, 18, SP_Overworld_Lan, frame=25
    a_stop

    .align 2, 0

NPC_80223A0:
    a_init
    a_set_sprite_at 48, 92, 0, SP_Overworld_Mari
    a_wait_f 5, 120
    a_wait_f 7, 120
    a_wait_f 5, 120
    a_wait_f 7, 120
    a_stop

    .align 2, 0

NPC_80223C4:
    a_init
    a_set_sprite_at 88, 32, 4, SP_Overworld_Mayl
    a_wait_f 1, 120
    a_move_f 11, d_nw, 8, 4
    a_wait_f 1, 120
    a_move_f 9, d_se, 8, 4
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

EntityAllocParams_80223EC:
    .word 0xFF

CSD_Cam_3:
    cam_set 200, -34, 0
    cam_move -64, -64, 0, 120
    cam_wait 180
    cam_end

CSD_NPC_3:
    .word NPC_8022418
    .word NPC_8022450
    .word NPC_80224E8
    .word 0xFF

NPC_8022418:
    a_init_no_sprite
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at 130, -66, 0, SP_Overworld_NumberMan, frame=7
    a_wait  120
    a_init
    a_wait_f 12, 10
    a_wait_f 7, 50
    a_wait_f 5, 30
    a_wait_f 1, 30
    a_wait_f 13, 60
    a_wait_f 14, 30
    a_wait_f 7, 60
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_8022450:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_sprite_mask_set_flag 3
    a_set_pos 108, -66
    a_wait_f 1, 40
    a_wait_f 7, 30
    a_wait_f 1, 20
    a_wait_f 7, 30
    a_set_sprite_frame 1
    a_wait_at 108, -66, 4
    a_wait_at 108, -66, 5
    a_wait_at 108, -66, 6
    a_wait_at 108, -66, 4
    a_wait_at 108, -66, 2
    a_wait_at 108, -66, 0, wait=240
    a_wait 55
    a_wait 30
L_80224AC:
    a_wait_at 108, -66, 4
    a_wait_at 108, -66, 5
    a_wait_at 108, -66, 6
    a_wait_at 108, -66, 4
    a_wait_at 108, -66, 2
    a_wait_at 108, -66, 0, wait=30
    a_jump L_80224AC

    .align 2, 0

NPC_80224E8:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_sprite_mask_set_flag 3
    a_set_pos 148, -66
    a_wait_f 7, 40
    a_wait_f 5, 30
    a_wait_f 7, 20
    a_wait_f 5, 30
    a_set_sprite_frame 5
    a_wait_at 148, -66, 4
    a_wait_at 148, -66, 5
    a_wait_at 148, -66, 6
    a_wait_at 148, -66, 4
    a_wait_at 148, -66, 2
    a_wait_at 148, -66, 0, wait=240
    a_wait 40
    a_wait 30
L_8022544:
    a_wait_at 148, -66, 4
    a_wait_at 148, -66, 5
    a_wait_at 148, -66, 6
    a_wait_at 148, -66, 4
    a_wait_at 148, -66, 2
    a_wait_at 148, -66, 0, wait=30
    a_jump L_8022544

    .align 2, 0

NPC_8022580:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at 118, -42, 0, SP_Overworld_Prog, frame=8
    a_move d_ne, 8, 3
    a_move_f 10, d_sw, 8, 3
    a_move_f 8, d_ne, 8, 1
    a_wait 5
    a_set_sprite_frame 7
    a_wait_at 126, -42, 4
    a_wait_at 126, -42, 5
    a_wait_at 126, -42, 6
    a_wait_at 126, -42, 4
    a_wait_at 126, -42, 2
    a_wait_at 126, -42, 0, wait=240
    a_wait 30
    a_wait 30
L_80225DE:
    a_wait_at 126, -42, 4
    a_wait_at 126, -42, 5
    a_wait_at 126, -42, 6
    a_wait_at 126, -42, 4
    a_wait_at 126, -42, 2
    a_wait_at 126, -42, 0, wait=30
    a_jump L_80225DE

    .align 2, 0

CSD_Entity_3:
    entity Effect, EFI_MapObject, f(300, -68, 0), 0xD
    entity Effect, EFI_MapObject, f(300, -52, 0), 0xD
    entity Effect, EFI_MapObject, f(300, -4, 0), 0xD
    entity Effect, EFI_MapObject, f(300, 12, 0), 0xD
    entity Effect, EFI_MapObject, f(252, -68, 0), 0xD
    entity Effect, EFI_MapObject, f(252, -52, 0), 0xD
    entity Effect, EFI_MapObject, f(252, -4, 0), 0xD
    entity Effect, EFI_MapObject, f(252, 12, 0), 0xD
    entity Effect, EFI_MapObject, f(306, 70, 0), 0x49
    .word 0xFF

global_label CSD_Task_3_0
    task_direct slot=0, dst=gBgPaletteC, len=0x8, delay=5
    task_direct_arg palette_077FBF4_0
    task_direct_arg palette_077FBF4_1
    task_direct_arg palette_077FBF4_2
    task_direct_arg palette_077FBF4_3
    task_direct_arg palette_077FBF4_4
    task_direct_arg palette_077FBF4_5
    task_direct_arg palette_077FBF4_6
    task_repeat

    .align 2, 0

global_label CSD_Task_3_1
    task_direct slot=4, dst=gBgPaletteC, len=0x8, delay=5
    task_direct_arg palette_077FBF4_0, 370
L_8022730:
    task_direct_arg palette_077FCD4_0
    task_direct_arg palette_077FCD4_1
    task_direct_arg palette_077FCD4_2
    task_direct_arg palette_077FCD4_3
    task_direct_arg palette_077FCD4_4
    task_direct_arg palette_077FCD4_5
    task_direct_arg palette_077FCD4_6
    task_jump L_8022730

    .align 2, 0

CSD_Cam_4:
    cam_set 364, -76, 0
    cam_move 64, -64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_4:
    .word NPC_80227A8
    .word NPC_80227C9
    .word NPC_8022884
    .word NPC_8022899
    .word NPC_80228AE
    .word NPC_80228C3
    .word NPC_80228D8
    .word 0xFF

NPC_80227A8:
    a_init_basic_npc_talk 472, -132, 0, SP_Overworld_Sal, dialog=0x0
L_80227B4:
    a_wait_f 5, 45
    a_wait_f 3, 30
    a_wait_f 5, 45
    a_wait_f 3, 60
    a_jump L_80227B4

NPC_80227C9:
    a_init_basic_npc_talk 408, -146, 0, SP_Overworld_Masa, dialog=0x0
    a_wait_f 3, 90
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 5
    a_wait_at 408, -146, 6
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 2
    a_wait_at 408, -146, 0
L_802280F:
    a_wait 90
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 5
    a_wait_at 408, -146, 6
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 2
    a_wait_at 408, -146, 0
    a_wait 10
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 5
    a_wait_at 408, -146, 6
    a_wait_at 408, -146, 4
    a_wait_at 408, -146, 2
    a_wait_at 408, -146, 0
    a_jump L_802280F

NPC_8022884:
    a_init_basic_npc_talk 442, -110, 0, SP_Overworld_ManJacket, frame=1, dialog=0x0
    a_stop

NPC_8022899:
    a_init_basic_npc_talk 444, -90, 0, SP_Overworld_OldWoman, frame=7, dialog=0x0
    a_stop

NPC_80228AE:
    a_init_basic_npc_talk 420, -90, 0, SP_Overworld_WomanJacket, frame=1, dialog=0x0
    a_stop

NPC_80228C3:
    a_init_basic_npc_talk 418, -64, 0, SP_Overworld_ManJacket, frame=7, dialog=0x0
    a_stop

NPC_80228D8:
    a_init_basic_npc_talk 348, -64, 0, SP_Overworld_Scientist, dialog=0x0
    a_move_f 8, d_ne, 8, 6
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

EntityAllocParams_80228F4:
    .word 0xFF

CSD_Cam_5:
    cam_set -174, -38, 64
    cam_move -64, 64, 0, 120
    cam_shake 2, 30
    cam_wait 180
    cam_end

    .align 2, 0

CSD_NPC_5:
    .word NPC_8022930
    .word NPC_8022951
    .word NPC_80229F9
    .word NPC_8022B03
    .word NPC_8022C0D
    .word 0xFF

NPC_8022930:
    a_init_basic_npc_talk -234, 72, 64, SP_Overworld_GutsMan, dialog=0x0
    a_wait_f 7, 100
    a_wait_f 12, 15
    a_wait_f 13, 60
    a_set_sprite_frame 7
    a_stop

NPC_8022951:
    a_init
    a_set_sprite_at -242, -50, 64, SP_Overworld_ColdMan
    a_move_f 8, d_ne, 4, 2
    a_wait_f 1, 60
    a_wait_at -226, -50, 68
    a_wait_at -225, -50, 69
    a_wait_at -224, -50, 70
    a_wait_at -223, -50, 68
    a_wait_at -222, -50, 66
    a_set_pos -221, -50, 64
    a_shadow_off
    a_move_f 1, d_ne, 32, 22
    a_wait 90
    a_move_f 5, d_sw, 32, 22
    a_set_z_clip
    a_wait_at -221, -50, 68
    a_wait_at -222, -50, 69
    a_wait_at -223, -50, 70
    a_wait_at -224, -50, 68
    a_wait_at -225, -50, 66
    a_set_pos -226, -50, 64
    a_move_f 10, d_sw, 4, 1
    a_set_sprite_frame 1
    a_wait_f 3, 20
    a_wait_f 7, 20
    a_wait_f 3, 20
    a_stop

NPC_80229F9:
    a_init
    a_set_sprite_at -242, -18, 64, SP_Overworld_Prog
    a_move_f 8, d_ne, 4, 2
    a_wait_f 1, 60
    a_wait_at -226, -18, 68
    a_wait_at -225, -18, 69
    a_wait_at -224, -18, 70
    a_wait_at -223, -18, 68
    a_wait_at -222, -18, 66
    a_set_pos -221, -18, 64
    a_shadow_off
    a_move_f 1, d_ne, 32, 22
    a_wait 120
    a_sprite_mask_set_flag 3
    a_set_sprite SP_Overworld_NormalNavi
    a_move_f 5, d_sw, 32, 22
    a_set_z_clip
    a_wait_at -221, -18, 68
    a_wait_at -222, -18, 69
    a_wait_at -223, -18, 70
    a_wait_at -224, -18, 68
    a_wait_at -225, -18, 66
    a_set_pos -226, -18, 64
    a_move_f 5, d_sw, 4, 1
    a_set_sprite_frame 1
L_8022A92:
    a_wait_at -234, -18, 68
    a_wait_at -234, -18, 69
    a_wait_at -234, -18, 70
    a_wait_at -234, -18, 68
    a_wait_at -234, -18, 66
    a_wait_at -234, -18, 64, wait=10
    a_wait_at -234, -18, 68
    a_wait_at -234, -18, 69
    a_wait_at -234, -18, 70
    a_wait_at -234, -18, 68
    a_wait_at -234, -18, 66
    a_wait_at -234, -18, 64, wait=30
    a_jump L_8022A92

NPC_8022B03:
    a_init
    a_set_sprite_at -242, 14, 64, SP_Overworld_Prog
    a_move_f 8, d_ne, 4, 2
    a_wait_f 1, 60
    a_wait_at -226, 14, 68
    a_wait_at -225, 14, 69
    a_wait_at -224, 14, 70
    a_wait_at -223, 14, 68
    a_wait_at -222, 14, 66
    a_set_pos -221, 14, 64
    a_shadow_off
    a_move_f 1, d_ne, 32, 22
    a_wait 100
    a_sprite_mask_set_flag 3
    a_set_sprite SP_Overworld_NormalNavi
    a_move_f 5, d_sw, 32, 22
    a_set_z_clip
    a_wait_at -221, 14, 68
    a_wait_at -222, 14, 69
    a_wait_at -223, 14, 70
    a_wait_at -224, 14, 68
    a_wait_at -225, 14, 66
    a_set_pos -226, 14, 64
    a_move_f 5, d_sw, 4, 1
    a_set_sprite_frame 1
L_8022B9C:
    a_wait_at -234, 14, 68
    a_wait_at -234, 14, 69
    a_wait_at -234, 14, 70
    a_wait_at -234, 14, 68
    a_wait_at -234, 14, 66
    a_wait_at -234, 14, 64, wait=10
    a_wait_at -234, 14, 68
    a_wait_at -234, 14, 69
    a_wait_at -234, 14, 70
    a_wait_at -234, 14, 68
    a_wait_at -234, 14, 66
    a_wait_at -234, 14, 64, wait=30
    a_jump L_8022B9C

NPC_8022C0D:
    a_init
    a_set_sprite_at -242, -82, 64, SP_Overworld_Prog
    a_move_f 8, d_ne, 4, 2
    a_wait_f 1, 60
    a_wait_at -226, -82, 68
    a_wait_at -225, -82, 69
    a_wait_at -224, -82, 70
    a_wait_at -223, -82, 68
    a_wait_at -222, -82, 66
    a_set_pos -221, -82, 64
    a_shadow_off
    a_move_f 1, d_ne, 32, 22
    a_wait 130
    a_sprite_mask_set_flag 3
    a_set_sprite SP_Overworld_NormalNavi
    a_move_f 5, d_sw, 32, 22
    a_set_z_clip
    a_wait_at -221, -82, 68
    a_wait_at -222, -82, 69
    a_wait_at -223, -82, 70
    a_wait_at -224, -82, 68
    a_wait_at -225, -82, 66
    a_set_pos -226, -82, 64
    a_move_f 5, d_sw, 4, 1
    a_set_sprite_frame 1
L_8022CA6:
    a_wait_at -234, -82, 68
    a_wait_at -234, -82, 69
    a_wait_at -234, -82, 70
    a_wait_at -234, -82, 68
    a_wait_at -234, -82, 66
    a_wait_at -234, -82, 64, wait=10
    a_wait_at -234, -82, 68
    a_wait_at -234, -82, 69
    a_wait_at -234, -82, 70
    a_wait_at -234, -82, 68
    a_wait_at -234, -82, 66
    a_wait_at -234, -82, 64, wait=30
    a_jump L_8022CA6

NPC_8022D17:
    a_init_basic_npc -270, -18, 64, SP_Overworld_ProtoMan, frame=8
    a_stop

    .align 2, 0

EntityAllocParams_8022D2C:
    .word 0xFF

CSD_Cam_6:
    cam_set -52, -48, 0
    cam_move 64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_6:
    .word NPC_8022D60
    .word NPC_8022D80
    .word NPC_8022DA8
    .word NPC_8022DC0
    .word NPC_8022DE0
    .word 0xFF

NPC_8022D60:
    a_init_basic_npc_talk 48, 2, 0, SP_Overworld_Higsby, dialog=0x0
    a_wait_f 5, 60
    a_move_f 9, d_se, 8, 4
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_8022D80:
    a_init_basic_npc_talk -46, 2, 0, SP_Overworld_YoungBoy, dialog=0x0
L_8022D8C:
    a_wait_f 7, 120
    a_move_f 10, d_sw, 4, 2
    a_wait_f 7, 120
    a_move_f 8, d_ne, 4, 2
    a_jump L_8022D8C

    .align 2, 0

NPC_8022DA8:
    a_init_basic_npc_talk -28, 112, 0, SP_Overworld_Dex, frame=14, dialog=0x0
    a_stop

    .align 2, 0

NPC_8022DC0:
    a_init_basic_npc_talk -148, 32, 0, SP_Overworld_PreschoolGirl, dialog=0x0
    a_move_f 8, d_ne, 8, 20
    a_wait_f 1, 30
    a_set_sprite_frame 3
    a_stop 90

    .align 2, 0

NPC_8022DE0:
    a_init_basic_npc_talk -148, 50, 0, SP_Overworld_PreschoolBoy, dialog=0x0
    a_move_f 8, d_ne, 16, 20
    a_wait_f 1, 150
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 5
    a_wait_at 12, 50, 6
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 2
    a_wait_at 12, 50, 0, wait=10
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 5
    a_wait_at 12, 50, 6
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 2
    a_wait_at 12, 50, 0, wait=60
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 5
    a_wait_at 12, 50, 6
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 2
    a_wait_at 12, 50, 0, wait=10
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 5
    a_wait_at 12, 50, 6
    a_wait_at 12, 50, 4
    a_wait_at 12, 50, 2
    a_set_pos 12, 50
    a_stop

    .align 2, 0

EntityAllocParams_8022ED4:
    .word 0xFF

CSD_Cam_7:
    cam_set -160, -300, 64
    cam_move 128, -128, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_7:
    .word NPC_8022F00
    .word NPC_8022F28
    .word NPC_8022F50
    .word 0xFF

NPC_8022F00:
    a_init_basic_npc_talk -86, -442, 64, SP_Overworld_Glyde, dialog=0x0
    a_wait_f 2, 120
    a_wait_f 0, 60
    a_wait_f 2, 120
    a_wait_f 0, 30
    a_set_sprite_frame 2
    a_stop

    .align 2, 0

NPC_8022F28:
    a_init_basic_npc_talk -66, -442, 64, SP_Overworld_Prog, dialog=0x0
    a_wait_f 2, 140
    a_wait_f 4, 60
    a_wait_f 2, 80
    a_wait_f 4, 60
    a_set_sprite_frame 2
    a_stop

    .align 2, 0

NPC_8022F50:
    a_init_basic_npc_talk -278, -268, 32, SP_Overworld_MegaMan, frame=17, dialog=0x0
    a_wait_at -278, -268, 40
    a_wait_at -276, -268, 41
    a_wait_at -274, -268, 42
    a_wait_at -272, -268, 43
    a_wait_at -270, -268, 44
    a_wait_at -268, -268, 45
    a_wait_at -266, -268, 46
    a_wait_at -264, -268, 47
    a_wait_at -262, -268, 48
    a_wait_at -260, -268, 49
    a_wait_at -258, -268, 50
    a_wait_at -256, -268, 51
    a_wait_at -254, -268, 52
    a_wait_at -252, -268, 53
    a_wait_at -250, -268, 54
    a_wait_at -248, -268, 55
    a_wait_at -246, -268, 56
    a_wait_at -244, -268, 57
    a_wait_at -242, -268, 58
    a_wait_at -240, -268, 59
    a_wait_at -238, -268, 60
    a_wait_at -236, -268, 61
    a_wait_at -234, -268, 62
    a_wait_at -232, -268, 63
    a_wait_at -230, -268, 64
    a_wait_at -228, -268, 64
    a_wait_at -226, -268, 64
    a_wait_at -224, -268, 64
    a_wait_at -222, -268, 64
    a_wait_at -220, -268, 64
    a_wait_at -218, -268, 64
    a_wait_at -216, -268, 64
    a_wait_at -214, -268, 64
    a_wait_at -212, -268, 64
    a_wait_at -210, -268, 64
    a_wait_at -208, -268, 64
    a_set_pos -206, -268, 64
    a_move_f 19, d_se, 32, 8
    a_wait 30
    a_set_pos -78, -244, 64
    a_move_f 23, d_nw, 32, 6
    a_move_f 17, d_ne, 32, 8
    a_wait 30
    a_set_pos 162, -452
    a_move_f 21, d_sw, 32, 13
    a_move_f 17, d_ne, 32, 13
    a_wait 30
    a_set_sprite_frame 23
    a_wait_at -78, -320, 32
    a_wait_at -78, -322, 33
    a_wait_at -78, -324, 34
    a_wait_at -78, -326, 35
    a_wait_at -78, -328, 36
    a_wait_at -78, -330, 37
    a_wait_at -78, -332, 38
    a_wait_at -78, -334, 39
    a_wait_at -78, -336, 40
    a_wait_at -78, -338, 41
    a_wait_at -78, -340, 42
    a_wait_at -78, -342, 43
    a_wait_at -78, -344, 44
    a_wait_at -78, -346, 45
    a_wait_at -78, -348, 46
    a_wait_at -78, -350, 47
    a_wait_at -78, -352, 48
    a_wait_at -78, -354, 49
    a_wait_at -78, -356, 50
    a_wait_at -78, -358, 51
    a_wait_at -78, -360, 52
    a_wait_at -78, -362, 53
    a_wait_at -78, -364, 54
    a_wait_at -78, -366, 55
    a_wait_at -78, -368, 56
    a_wait_at -78, -370, 57
    a_wait_at -78, -372, 58
    a_wait_at -78, -374, 59
    a_wait_at -78, -376, 60
    a_wait_at -78, -378, 61
    a_wait_at -78, -380, 62
    a_wait_at -78, -382, 63
    a_wait_at -78, -384, 64
    a_wait_at -78, -386, 64
    a_wait_at -78, -388, 64
    a_wait_at -78, -390, 64
    a_wait_at -78, -392, 64
    a_wait_at -78, -394, 64
    a_wait_at -78, -396, 64
    a_wait_at -78, -398, 64
    a_wait_at -78, -400, 64
    a_wait_at -78, -402, 64
    a_wait_at -78, -404, 64
    a_wait_at -78, -406, 64
    a_wait_at -78, -408, 64
    a_wait_at -78, -410, 64
    a_wait_at -78, -412, 64
    a_wait_at -78, -414, 64
    a_wait_at -78, -416, 64
    a_wait_at -78, -418, 64
    a_set_sprite_frame 50
    a_stop

CSD_Entity_7:
    .word 0xFF

CSD_Cam_8:
    cam_set 64, 88, 0
    cam_move -64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_8:
    .word NPC_80232DC
    .word NPC_80233E8
    .word NPC_8023418
    .word NPC_8023440
    .word NPC_802345C
    .word 0xFF

    .align 2, 0

NPC_80232DC:
    a_init
    a_sprite_high_priority
    a_set_dialog 0x0
    a_set_sprite_at 24, 150, 0, SP_Overworld_PreschoolGirl, frame=3
    a_wait  30
    a_wait_f 5, 60
    a_wait_f 3, 45
    a_wait_f 5, 45
    a_wait_at 24, 150, 4
    a_wait_at 24, 150, 5
    a_wait_at 24, 150, 6
    a_wait_at 24, 150, 4
    a_wait_at 24, 150, 2
    a_wait_at 24, 150, 0, wait=10
    a_wait_at 24, 150, 4
    a_wait_at 24, 150, 5
    a_wait_at 24, 150, 6
    a_wait_at 24, 150, 4
    a_wait_at 24, 150, 2
    a_wait_at 24, 150, 0, wait=60
    a_move_f 9, d_se, 16, 8
    a_set_sprite_frame 7
    a_wait_at 24, 214, 4
    a_wait_at 24, 214, 5
    a_wait_at 24, 214, 6
    a_wait_at 24, 214, 4
    a_wait_at 24, 214, 2
    a_wait_at 24, 214, 0, wait=10
    a_wait_at 24, 214, 4
    a_wait_at 24, 214, 5
    a_wait_at 24, 214, 6
    a_wait_at 24, 214, 4
    a_wait_at 24, 214, 2
    a_wait_at 24, 214, 0, wait=30
    a_move_f 9, d_se, 16, 20
    a_stop

    .align 2, 0

NPC_80233E8:
    a_init
    a_sprite_high_priority
    a_set_dialog 0x0
    a_set_sprite_at 2, 8, 0, SP_Overworld_WomanSkirt, frame=12
    a_move d_se, 16, 18
    a_move_f 8, d_ne, 8, 1
    a_wait_f 1, 90
    a_wait_f 3, 30
    a_move_f 9, d_se, 8, 20
    a_stop

    .align 2, 0

NPC_8023418:
    a_init
    a_sprite_high_priority
    a_set_dialog 0x0
    a_set_sprite_at -6, 308, 0, SP_Overworld_Chaud, frame=11
    a_move d_nw, 8, 12
    a_wait_f 7, 90
    a_wait 60
    a_move_f 11, d_nw, 8, 12
    a_stop

    .align 2, 0

NPC_8023440:
    a_init
    a_sprite_low_priority
    a_set_dialog 0x0
    a_set_sprite_ex 0x104
    a_set_pos 68, 96
    a_set_sprite_frame 5
    a_set_palette 0x0
    a_stop

    .align 2, 0

NPC_802345C:
    a_init
    a_sprite_high_priority
    a_set_dialog 0x0
    a_set_sprite_at -54, -156, 0, SP_Overworld_BrownCar
    a_set_palette 0x1
    a_move_f 3, d_se, 32, 60
    a_set_pos -54, -156
    a_set_palette 0x0
    a_move_f 3, d_se, 32, 60
    a_stop

    .align 2, 0

CSD_Entity_8:
    entity Effect, EFI_MapObject, f(-26, -24, 0), 0x2D
    entity Effect, EFI_MapObject, f(-26, 232, 0), 0x2E
    entity Effect, EFI_MapObject, f(-202, 26, 0), 0x2F
    entity Effect, EFI_MapObject, f(-16, -32, 0), 0x22
    entity Effect, EFI_MapObject, f(-24, 130, 0), 0xFFFF004A
    entity Effect, EFI_MapObject, f(-20, 122, 8), 0x14B
    entity Effect, EFI_MapObject, f(14, 28, 8), 0x34C
    entity Effect, EFI_MapObject, f(-20, 162, 8), 0x14D
    entity Effect, EFI_MapObject, f(-130, 130, 8), 0x34E
    .word 0xFF

CSD_Cam_9:
    cam_set 284, 180, 0
    cam_move -64, 64, 0, 180
    cam_shake 2, 30
    cam_move -64, 64, 0, 60
    cam_wait 60
    cam_end

CSD_NPC_9:
    .word NPC_8023578
    .word NPC_802359C
    .word NPC_80235C0
    .word 0xFF

NPC_8023578:
    a_init_basic_npc_talk 240, 308, 0, SP_Overworld_GutsMan, dialog=0x0
    a_wait_f 7, 160
    a_wait_f 12, 10
    a_wait_f 13, 120
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_802359C:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x10F
    a_set_pos 242, 204
    a_wait_f 0, 1
    a_shadow_off
    a_wait 99
    a_set_palette 0x1
    a_wait 120
    a_set_palette 0x0
    a_stop

NPC_80235C0:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at 244, 160, 0, SP_Overworld_Prog, frame=9
    a_move d_se, 8, 7
    a_wait_at 244, 216, 4
    a_wait_at 244, 215, 5
    a_wait_at 244, 214, 6
    a_wait_at 244, 213, 4
    a_wait_at 244, 212, 2
    a_wait_at 244, 211, 0, wait=120
    a_move_f 9, d_se, 8, 3
    a_move_f 10, d_sw, 8, 4
    a_set_pos 120, 302
    a_move_f 8, d_ne, 8, 10
    a_stop

    .align 2, 0

NPC_802362C:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at 244, 144, 0, SP_Overworld_Prog
    a_wait 1
    a_move_f 9, d_se, 8, 7
    a_wait 5
    a_wait_at 244, 200, 4
    a_wait_at 244, 199, 5
    a_wait_at 244, 198, 6
    a_wait_at 244, 197, 4
    a_wait_at 244, 196, 2
    a_wait_at 244, 195, 0, wait=120
    a_move_f 9, d_se, 8, 5
    a_move_f 10, d_sw, 8, 4
    a_set_pos 120, 302
    a_move_f 8, d_ne, 8, 10
    a_stop

    .align 2, 0

NPC_802369C:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_at 244, 128, 0, SP_Overworld_Prog
    a_wait 2
    a_move_f 9, d_se, 8, 7
    a_wait 10
    a_wait_at 244, 184, 4
    a_wait_at 244, 183, 5
    a_wait_at 244, 182, 6
    a_wait_at 244, 181, 4
    a_wait_at 244, 180, 2
    a_wait_at 244, 179, 0, wait=120
    a_move_f 9, d_se, 8, 7
    a_move_f 10, d_sw, 8, 4
    a_set_pos 120, 302
    a_move_f 8, d_ne, 8, 10
    a_stop

    .align 2, 0

CSD_Entity_9:
    .word 0xFF

global_label CSD_Task_9_2
    task_direct slot=2, dst=gBgPalette0, len=0x18, delay=100
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 4
    task_direct_arg palette_078A834, 120
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 4, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_3
    task_direct slot=3, dst=gBgPalette4, len=0x10, delay=100
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0x84
    task_direct_arg palette_078A894, 120
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0x84, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_4
    task_direct slot=4, dst=gBgPalette7, len=0x8, delay=100
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0xE4
    task_direct_arg palette_078A9B4, 120
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0xE4, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_5
    task_direct slot=5, dst=gBgPalette3, len=0x8, delay=100
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0x64
    task_direct_arg palette_078A934_0, 120
    task_direct_arg BgData_Palette_Traffic_Light_Comp_1 + 0x64, 1
    task_stop

    .align 2, 0

CSD_Cam_10:
    cam_set 96, -56, 0
    cam_move -64, -64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_10:
    .word NPC_80237EC
    .word NPC_8023804
    .word NPC_8023828
    .word NPC_80238AC
    .word NPC_80238D0
    .word NPC_8023964
    .word NPC_802397C
    .word NPC_80239A0
    .word 0xFF

    .align 2, 0

NPC_80237EC:
    a_init_basic_npc_talk 30, -82, 0, SP_Overworld_Scientist, frame=3, dialog=0x0
    a_stop

    .align 2, 0

NPC_8023804:
    a_init_basic_npc_talk 30, -58, 0, SP_Overworld_YoungBoy, dialog=0x0
L_8023810:
    a_wait_f 1, 120
    a_wait_f 3, 90
    a_wait_f 1, 60
    a_wait_f 3, 120
    a_jump L_8023810

    .align 2, 0

NPC_8023828:
    a_init_basic_npc_talk 30, -40, 0, SP_Overworld_PreschoolBoy, dialog=0x0
    a_wait_f 0, 60
L_8023838:
    a_wait_at 30, -40, 4
    a_wait_at 30, -40, 5
    a_wait_at 30, -40, 6
    a_wait_at 30, -40, 4
    a_wait_at 30, -40, 2
    a_wait_at 30, -40, 0, wait=10
    a_wait_at 30, -40, 4
    a_wait_at 30, -40, 5
    a_wait_at 30, -40, 6
    a_wait_at 30, -40, 4
    a_wait_at 30, -40, 2
    a_wait_at 30, -40, 0, wait=120
    a_jump L_8023838

    .align 2, 0

NPC_80238AC:
    a_init_basic_npc_talk -18, -122, 0, SP_Overworld_Mari, dialog=0x0
L_80238B8:
    a_wait_f 5, 180
    a_wait_f 3, 60
    a_wait_f 5, 180
    a_wait_f 3, 180
    a_jump L_80238B8

    .align 2, 0

NPC_80238D0:
    a_init_basic_npc_talk -18, -104, 0, SP_Overworld_Yai, dialog=0x0
L_80238DC:
    a_move_f 9, d_se, 8, 3
    a_set_sprite_frame 10
    a_wait_at -18, -80, 4
    a_wait_at -18, -80, 5
    a_wait_at -18, -80, 6
    a_wait_at -18, -80, 4
    a_wait_at -18, -80, 2
    a_set_pos -18, -80
    a_wait_f 5, 90
    a_move_f 11, d_nw, 8, 3
    a_set_sprite_frame 10
    a_wait_at -18, -104, 4
    a_wait_at -18, -104, 5
    a_wait_at -18, -104, 6
    a_wait_at -18, -104, 4
    a_wait_at -18, -104, 2
    a_set_pos -18, -104
    a_wait_f 5, 90
    a_jump L_80238DC

    .align 2, 0

NPC_8023964:
    a_init_basic_npc_talk -18, -42, 0, SP_Overworld_Mayl, frame=16, dialog=0x0
    a_stop

    .align 2, 0

NPC_802397C:
    a_init
    a_set_dialog 0x0
    a_sprite_mask_set_flag 4
    a_set_sprite_at -18, -30, 0, SP_Overworld_YoungGirl
L_802398A:
    a_wait_f 7, 120
    a_wait_f 5, 90
    a_wait_f 7, 60
    a_wait_f 5, 120
    a_jump L_802398A

    .align 2, 0

NPC_80239A0:
    a_init
    a_set_dialog 0x0
    a_set_sprite_ex 0x111
    a_set_pos 8, -128
    a_set_sprite_frame 0
L_80239AF:
    a_shadow_off
    a_wait 1
    a_jump L_80239AF

CSD_Entity_10:
    .word 0xFF

CSD_Cam_11:
    cam_set -60, -60, 0
    cam_move -64, -64, 0, 120
    cam_shake 2, 30
    cam_wait 180
    cam_end

    .align 2, 0

CSD_NPC_11:
    .word NPC_8023A08
    .word NPC_8023A30
    .word NPC_8023A5C
    .word NPC_8023A88
    .word NPC_8023AB4
    .word NPC_8023ACC
    .word NPC_8023AE4
    .word NPC_8023AFC
    .word NPC_8023B20
    .word NPC_8023B44
    .word 0xFF

NPC_8023A08:
    a_init_basic_npc_talk -104, -48, 0, SP_Overworld_GutsMan, dialog=0x0
    a_wait_f 7, 100
    a_wait_f 12, 10
    a_wait_f 13, 120
    a_wait_f 1, 120
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_8023A30:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x116
    a_set_pos -126, -82
    a_set_palette 0x2
    a_wait 180
L_8023A43:
    a_wait_f 1, 15
    a_wait_f 0, 20
    a_wait_f 1, 15
    a_wait_f 0, 50
    a_wait_f 1, 30
    a_jump L_8023A43

    .align 2, 0

NPC_8023A5C:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x116
    a_set_pos -62, -82
    a_set_palette 0x1
    a_wait 180
L_8023A6F:
    a_wait_f 1, 15
    a_wait_f 0, 10
    a_wait_f 1, 15
    a_wait_f 0, 20
    a_wait_f 1, 40
    a_jump L_8023A6F

NPC_8023A88:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x116
    a_set_pos -22, -82
    a_set_palette 0x0
    a_wait 180
L_8023A9B:
    a_wait_f 1, 15
    a_wait_f 0, 20
    a_wait_f 1, 30
    a_wait_f 0, 20
    a_wait_f 1, 15
    a_jump L_8023A9B

NPC_8023AB4:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x11C
    a_set_pos -52, 22
    a_set_sprite_frame 1
    a_stop

NPC_8023ACC:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x11C
    a_set_pos 44, -26
    a_set_sprite_frame 1
    a_stop

NPC_8023AE4:
    a_init
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x11C
    a_set_pos 44, 70
    a_set_sprite_frame 1
    a_stop

NPC_8023AFC:
    a_init_no_sprite
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x39
    a_set_pos 64, -48
    a_wait_f 10, 110
    a_init
    a_move d_sw, 16, 14
    a_set_sprite_frame 18
    a_stop

    .align 2, 0

NPC_8023B20:
    a_init_no_sprite
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0x8
    a_set_pos -76, 68
    a_wait_f 15, 120
    a_init
    a_move d_nw, 32, 10
    a_set_sprite_frame 49
    a_stop

    .align 2, 0

NPC_8023B44:
    a_init_no_sprite
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x0
    a_set_sprite_ex 0xCE
    a_set_pos -98, -22, 32
    a_wait_f 0, 130
    a_init
    a_set_sprite_ex 0xDA
    a_wait_f 0, 1
    a_shadow_off
    a_wait_at -98, -22, 32
    a_wait_at -98, -22, 32
    a_wait_at -98, -22, 33
    a_wait_at -98, -22, 33
    a_wait_at -98, -22, 34
    a_wait_at -98, -22, 34
    a_wait_at -98, -22, 35
    a_wait_at -98, -22, 35
    a_wait_at -98, -22, 36
    a_wait 20
    a_destroy

    .align 2, 0

CSD_Entity_11:
    entity Effect, EFI_MapObject, f(-94, -26, 0), 0x3D
    .word 0xFF

global_label CSD_Task_11_5
    task_direct slot=5, dst=gBgPaletteA, len=0x8, delay=180
    task_direct_arg BgData_Palette_Power_Plant_Comp_1 + 0x144
L_8023BE4:
    task_direct_arg palette_078B7D4, 10
    task_direct_arg palette_078B834, 20
    task_direct_arg palette_078B774, 5
    task_direct_arg palette_078B814, 10
    task_direct_arg palette_078B794, 20
    task_direct_arg palette_078B7F4, 5
    task_direct_arg palette_078B7B4, 10
    task_jump L_8023BE4

    .align 2, 0

CSD_Cam_12:
    cam_set 180, 4, 0
    cam_move -64, -64, 0, 180
    cam_wait 60
    cam_end

CSD_NPC_12:
    .word NPC_8023C54
    .word NPC_8023C6F
    .word NPC_8023C82
    .word NPC_8023C95
    .word NPC_8023CA8
    .word 0xFF

    .align 2, 0

NPC_8023C54:
    a_init
    a_set_sprite_at 116, -42, 0, SP_Overworld_Wily
    a_wait_f 12, 60
    a_wait_f 13, 5
    a_set_sprite_frame 14
    a_stop

NPC_8023C6F:
    a_init_basic_npc 114, -68, 0, SP_Overworld_Yahoot, frame=5
    a_stop

NPC_8023C82:
    a_init_basic_npc 54, -36, 0, SP_Overworld_CountZap, frame=1
    a_stop

NPC_8023C95:
    a_init_basic_npc 54, -54, 0, SP_Overworld_Madd, frame=1
    a_stop

NPC_8023CA8:
    a_init_basic_npc 54, -14, 0, SP_Overworld_Match, frame=1
    a_stop

    .align 2, 0

CSD_Entity_12:
    entity Effect, EFI_MapObject, f(100, -104, 32), 0x41
    entity Effect, EFI_MapObject, f(52, -104, 32), 0x42
    entity Effect, EFI_MapObject, f(4, -104, 32), 0x43
    entity Effect, EFI_MapObject, f(-44, -104, 32), 0x44
    .word 0xFF

CSD_Cam_13:
    cam_set -64, -64, 0
    cam_move 64, 64, 0, 360
    cam_end

CSD_NPC_13:
    .word NPC_8023D34
    .word NPC_8023D4A
    .word NPC_8023D64
    .word 0xFF

    .align 2, 0

NPC_8023D34:
    a_init_basic_npc_talk 34, 70, 8, SP_Overworld_PET, frame=0, dialog=0x0
L_8023D42:
    a_set_no_z_clip
    a_wait 1
    a_jump L_8023D42

NPC_8023D4A:
    a_init_basic_npc_talk -56, -12, 0, SP_Overworld_LanBed, frame=0, dialog=0x0
    a_set_no_z_clip
    a_wait 120
    a_set_sprite_frame 1
    a_stop

NPC_8023D64:
    a_init_no_sprite
    a_set_dialog 0x0
    a_set_sprite_at 0, -16, 0, SP_Overworld_MegaMan
    a_wait 120
    a_init
    a_wait_f 40, 64
    a_set_sprite_frame 5
    a_move_f 13, d_sw, 4, 2
    a_set_sprite_frame 5
    a_stop

CSD_Entity_13:
    .word 0xFF

