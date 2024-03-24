#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts InitCredits
    push       { lr }
    ldr        r0,PTR_gCredits_0802188c
    mov        r1,#0x10
    bl         memset0_32
    pop        { pc }

_ts Credits_Main
    push       { lr }
    ldr        r5,PTR_gCredits_08021890
    ldr        r0,PTR_jumpTableCreditsMain_08021894
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

jumpTableCreditsMain:
    .word Credits_0_Init
    .word Credits_1_Main
    .word Credits_2_Free


_ts Credits_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_paletteCreditsText_08021898
    ldr        r1,PTR_eBgPaletteF_0802189c
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_tilesetDialogueText_080218a0
    ldr        r1,PTR_DAT_080218a4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r0,[r7,#0x18]
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
    mov        r0,#0xc7
    bl         Flag_GetLibrary
    pop        {r0,r5}
    beq        LAB_08021514
    mov        r0,#0xb0
LAB_08021514:
    strb       r0,[r5,#0xd]
    push       {r5}
    bl         Status_GetLevel
    pop        {r5}
    strb       r0,[r5,#0xe]
    mov        r0,#0x13
    bl         Sound_ChangeSong
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
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x14
    strb       r1,[r0,#0x0]
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    pop        {pc}


_ts Credits_1_0_StartScene
    push       {lr}
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    bl         FUN_080102fc
    bl         FUN_08010310
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
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,INT_080215d4
    strh       r1,[r0,#0x0]
    mov        r0,#0x3
    ldrb       r1,[r5,#0x8]
    cmp        r1,#0x0
    bne        LAB_080215c4
    mov        r0,#0x1
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
    mov        r0,#0xe
    mov        r1,#0xff
    bl         Fade_Request
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
    bl         Song_FadeOut
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
    mov        r0,#0xd
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_080216c4:
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_080216dc
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
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
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
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
    mov        r0,#0x9
    bl         Flag_Clear400
    push       {r5}
    bl         Save_LoadGame
    bl         Save_ChecksumCheck
    pop        {r5}
    bne        LAB_080217fa
    push       {r5}
    bl         Save_CheckBuildId
    pop        {r5}
    bne        LAB_080217fa
    mov        r0,#0x9
    bl         Flag_Set400
    push       {r5}
    mov        r0,#0x5
    bl         Flag_SetBase
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
    mov        r0,#0xd
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_08021860:
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_0802186c
    sub        r0,#0x1
    strh       r0,[r5,#0x4]
    bgt        LAB_08021888
LAB_0802186c:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldr        r1,DAT_080218d8
    tst        r1,r0
    beq        LAB_08021888
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x2
    bl         Fade_Request
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
PTR_eBgPaletteF_0802189c:
    .word eBgPaletteF
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
    mov        r6,r10
    ldr        r6,[r6,#0x14]
    ldr        r0,[r6,#0x2c]
    ldr        r1,[r6,#0x30]
    ldr        r2,[r6,#0x34]
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
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x34]
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    mov        r0,#0x3
    bl         Video_SetBgControl
    mov        r5,r10
    ldr        r0,[r5,#0x10]
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
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    mov        r0,#0x0
    str        r0,[r7,#0x4]
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
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    str        r0,[r7,#0x4]
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
    ldr        r1,PTR_eBgPaletteE_08021da4
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
PTR_eBgPaletteE_08021da4:
    .word eBgPaletteE
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
    .word 0x8022084
    .word 0x802209C
    .word 0x802A578
    .word 0x8030D50
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x8029F14 @ BgTask_8029F14
    .word 0x8029F2C @ BgTask_8029F2C
    .word 0x8029F8C @ BgTask_8029F8C
    .word 0x8029FA4 @ BgTask_8029FA4
    .word  0xFF

CreditsSceneData_1:
    .short Map_Oven_Comp_2
    .byte 1
    .byte 3
    .word 0x8022138
    .word 0x8022150
    .word 0x80431AC
    .word 0x802229C
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x80423F8 @ BgTask_80423F8
    .word 0x8042418 @ BgTask_8042418
    .word 0x8042448 @ BgTask_8042448
    .word 0x8042498 @ BgTask_8042498
    .word 0x80424D8 @ BgTask_80424D8
    .word 0x8042528 @ BgTask_8042528
    .word  0xFF

CreditsSceneData_2:
    .short Map_School_Class_5A
    .byte 0
    .byte 3
    .word 0x80222A0
    .word 0x80222B8
    .word 0x80242CC
    .word 0x8029B18
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x8024030 @ BgTask_8024030
    .word 0x80240D0 @ BgTask_80240D0
    .word  0xFF

CreditsSceneData_3:
    .short Map_School_Comp_5
    .byte 1
    .byte 3
    .word 0x80223F0
    .word 0x8022408
    .word 0x804056C
    .word 0x802261C
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x80226D4 @ BgTask_80226D4
    .word 0x802271C @ BgTask_802271C
    .word 0x803ECF8 @ BgTask_803ECF8
    .word 0x803ED68 @ BgTask_803ED68
    .word 0x803F138 @ BgTask_803F138
    .word  0xFF

CreditsSceneData_4:
    .short Map_Govt_Complex_Front
    .byte 0
    .byte 3
    .word 0x8022770
    .word 0x8022788
    .word 0x803137C
    .word 0x8035C18
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word  0xFF

CreditsSceneData_5:
    .short Map_Waterworks_Comp_5
    .byte 1
    .byte 3
    .word 0x80228F8
    .word 0x8022918
    .word 0x802A578
    .word 0x8031024
    .word dummy_1cb8
    .word BgUpdate_MoveUp
    .word dummy_6928_far
    .word 0x8044198 @ BgTask_8044198
    .word  0xFF

CreditsSceneData_6:
    .short Map_ACDC_Higsby
    .byte 0
    .byte 3
    .word 0x8022D30
    .word 0x8022D48
    .word 0x802A578
    .word 0x8031024
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word  0xFF

CreditsSceneData_7:
    .short Map_Internet_2
    .byte 1
    .byte 3
    .word 0x8022ED8
    .word 0x8022EF0
    .word 0x8051D5C
    .word 0x80232A8
    .word dummy_1cb8
    .word BgUpdate_MoveUpLeft
    .word dummy_6928_far
    .word 0x80515C8 @ BgTask_80515C8
    .word 0x8051618 @ BgTask_8051618
    .word 0x8051668 @ BgTask_8051668
    .word 0x80516B8 @ BgTask_80516B8
    .word 0x80516F8 @ BgTask_80516F8
    .word 0x8051780 @ BgTask_8051780
    .word 0x8051820 @ BgTask_8051820
    .word  0xFF

CreditsSceneData_8:
    .short Map_DenTown_Block_2
    .byte 0
    .byte 3
    .word 0x80232AC
    .word 0x80232C4
    .word 0x8035F40
    .word 0x8023488
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word  0xFF

CreditsSceneData_9:
    .short Map_Traffic_Light_Comp_5
    .byte 0
    .byte 3
    .word 0x8023540
    .word 0x8023568
    .word 0x8047EC0
    .word 0x802370C
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x80475A4 @ BgTask_80475A4
    .word 0x80475F4 @ BgTask_80475F4
    .word 0x8023710 @ BgTask_8023710
    .word 0x8023738 @ BgTask_8023738
    .word 0x8023760 @ BgTask_8023760
    .word 0x8023788 @ BgTask_8023788
    .word  0xFF

CreditsSceneData_10:
    .short Map_SciLab_Generator_Room
    .byte 1
    .byte 3
    .word 0x80237B0
    .word 0x80237C8
    .word 0x803BDF4
    .word 0x80239B8
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x803BD78 @ BgTask_803BD78
    .word 0x803BB84 @ BgTask_803BB84
    .word  0xFF

CreditsSceneData_11:
    .short Map_Power_Plant_Comp_4
    .byte 0
    .byte 3
    .word 0x80239BC
    .word 0x80239DC
    .word 0x804A17C
    .word 0x8023BB8
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x8049C00 @ BgTask_8049C00
    .word 0x8049C70 @ BgTask_8049C70
    .word 0x8049CE0 @ BgTask_8049CE0
    .word 0x8049D50 @ BgTask_8049D50
    .word 0x8049D68 @ BgTask_8049D68
    .word 0x8023BD0 @ BgTask_8023BD0
    .word  0xFF

CreditsSceneData_12:
    .short Map_WWW_Wily_Lab
    .byte 1
    .byte 3
    .word 0x8023C24
    .word 0x8023C3C
    .word 0x803D8E0
    .word 0x8023CBC
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x803D7E4 @ BgTask_803D7E4
    .word  0xFF

CreditsSceneData_13:
    .short Map_ACDC_Lan_Room
    .byte 0
    .byte 3
    .word 0x8023D10
    .word 0x8023D24
    .word 0x802A578
    .word 0x8023D88
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x802A15C @ BgTask_802A15C
    .word 0x802A204 @ BgTask_802A204
    .word  0xFF

