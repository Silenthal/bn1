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
    .word CSD_Cam_0
    .word CSD_NPC_0
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
    .word CSD_Cam_1
    .word CSD_NPC_1
    .word 0x80431AC
    .word CSD_Entity_1
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
    .word CSD_Cam_2
    .word CSD_NPC_2
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
    .word CSD_Cam_3
    .word CSD_NPC_3
    .word 0x804056C
    .word CSD_Entity_3
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word CSD_Task_3_0
    .word CSD_Task_3_1
    .word 0x803ECF8 @ BgTask_803ECF8
    .word 0x803ED68 @ BgTask_803ED68
    .word 0x803F138 @ BgTask_803F138
    .word  0xFF

CreditsSceneData_4:
    .short Map_Govt_Complex_Front
    .byte 0
    .byte 3
    .word CSD_Cam_4
    .word CSD_NPC_4
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
    .word CSD_Cam_5
    .word CSD_NPC_5
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
    .word CSD_Cam_6
    .word CSD_NPC_6
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
    .word CSD_Cam_7
    .word CSD_NPC_7
    .word 0x8051D5C
    .word CSD_Entity_7
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
    .word CSD_Cam_8
    .word CSD_NPC_8
    .word 0x8035F40
    .word CSD_Entity_8
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word  0xFF

CreditsSceneData_9:
    .short Map_Traffic_Light_Comp_5
    .byte 0
    .byte 3
    .word CSD_Cam_9
    .word CSD_NPC_9
    .word 0x8047EC0
    .word CSD_Entity_9
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x80475A4 @ BgTask_80475A4
    .word 0x80475F4 @ BgTask_80475F4
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
    .word 0x803BDF4
    .word CSD_Entity_10
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
    .word CSD_Cam_11
    .word CSD_NPC_11
    .word 0x804A17C
    .word CSD_Entity_11
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x8049C00 @ BgTask_8049C00
    .word 0x8049C70 @ BgTask_8049C70
    .word 0x8049CE0 @ BgTask_8049CE0
    .word 0x8049D50 @ BgTask_8049D50
    .word 0x8049D68 @ BgTask_8049D68
    .word CSD_Task_11_5
    .word  0xFF

CreditsSceneData_12:
    .short Map_WWW_Wily_Lab
    .byte 1
    .byte 3
    .word CSD_Cam_12
    .word CSD_NPC_12
    .word 0x803D8E0
    .word CSD_Entity_12
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x803D7E4 @ BgTask_803D7E4
    .word  0xFF

CreditsSceneData_13:
    .short Map_ACDC_Lan_Room
    .byte 0
    .byte 3
    .word CSD_Cam_13
    .word CSD_NPC_13
    .word 0x802A578
    .word CSD_Entity_13
    .word dummy_1cb8
    .word dummy_1cb8
    .word dummy_6928_far
    .word 0x802A15C @ BgTask_802A15C
    .word 0x802A204 @ BgTask_802A204
    .word  0xFF

CSD_Cam_0:
    cam_set 116, 52, 0
    cam_move 64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_0:
    .word NPC_080220B0
    .word NPC_080220C8
    .word NPC_080220F4
    .word NPC_08022120
    .word 0xFF

NPC_080220B0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x18
    a_set_pos_16 180, 82
    a_set_sprite_frame 5
L_80220BE:
    a_wait 1
    a_jump L_80220BE

    .align 2, 0

NPC_080220C8:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x1C
    a_set_pos_16 148, 84
L_80220D4:
    a_set_sprite_frame 10
    a_dir d_sw, 16, 9
    a_set_sprite_frame 9
    a_dir d_se, 16, 9
    a_set_sprite_frame 8
    a_dir d_ne, 16, 9
    a_set_sprite_frame 11
    a_dir d_nw, 16, 9
    a_jump L_80220D4

    .align 2, 0

NPC_080220F4:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xC
    a_set_pos_16 76, 156
L_8022100:
    a_set_sprite_frame 8
    a_dir d_ne, 16, 9
    a_set_sprite_frame 11
    a_dir d_nw, 16, 9
    a_set_sprite_frame 10
    a_dir d_sw, 16, 9
    a_set_sprite_frame 9
    a_dir d_se, 16, 9
    a_jump L_8022100

    .align 2, 0

NPC_08022120:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x40
    a_set_pos_16 180, 98
    a_set_sprite_frame 5
L_802212E:
    a_wait 1
    a_jump L_802212E

    .align 2, 0

CSD_Cam_1:
    cam_set -130, -276, 0
    cam_move -128, 128, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_1:
    .word NPC_08022170
    .word NPC_080221A8
    .word NPC_080221D0
    .word NPC_080221F8
    .word NPC_08022220
    .word NPC_08022248
    .word NPC_08022270
    .word 0xFF

NPC_08022170:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -332, -144
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 7
    a_wait 60
    a_set_sprite_frame 3
    a_wait 240
    a_wait 30
    a_set_sprite_frame 7
    a_wait 45
L_8022190:
    a_set_sprite_frame 1
    a_wait 60
    a_set_sprite_frame 7
    a_wait 90
    a_set_sprite_frame 1
    a_wait 60
    a_set_sprite_frame 7
    a_wait 45
    a_jump L_8022190

    .align 2, 0

NPC_080221A8:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -344, -168
L_80221B6:
    a_set_sprite_frame 3
    a_wait 60
    a_set_sprite_frame 1
    a_wait 80
    a_set_sprite_frame 3
    a_wait 60
    a_set_sprite_frame 1
    a_wait 40
    a_wait 1
    a_jump L_80221B6

    .align 2, 0

NPC_080221D0:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -322, -198
L_80221DE:
    a_set_sprite_frame 1
    a_wait 120
    a_set_sprite_frame 3
    a_wait 80
    a_set_sprite_frame 1
    a_wait 20
    a_set_sprite_frame 3
    a_wait 60
    a_wait 1
    a_jump L_80221DE

    .align 2, 0

NPC_080221F8:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -304, -200
L_8022206:
    a_set_sprite_frame 3
    a_wait 60
    a_set_sprite_frame 5
    a_wait 40
    a_set_sprite_frame 3
    a_wait 60
    a_set_sprite_frame 5
    a_wait 120
    a_wait 1
    a_jump L_8022206

    .align 2, 0

NPC_08022220:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -278, -174
L_802222E:
    a_set_sprite_frame 5
    a_wait 30
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 5
    a_wait 30
    a_set_sprite_frame 3
    a_wait 30
    a_wait 1
    a_jump L_802222E

    .align 2, 0

NPC_08022248:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -286, -148
L_8022256:
    a_set_sprite_frame 7
    a_wait 60
    a_set_sprite_frame 5
    a_wait 60
    a_set_sprite_frame 7
    a_wait 60
    a_set_sprite_frame 5
    a_wait 60
    a_wait 1
    a_jump L_8022256

    .align 2, 0

NPC_08022270:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -320, -24
    a_wait 60
    a_set_sprite_frame 11
    a_dir d_nw, 8, 13
    a_wait 90
    a_set_sprite_frame 8
    a_dir d_ne, 8, 2
    a_set_sprite_frame 9
    a_dir d_se, 8, 13
L_8022294:
    a_wait 1
    a_jump L_8022294

    .align 2, 0

CSD_Entity_1:
    .word 0xFF

CSD_Cam_2:
    cam_set 16, -48, 0
    cam_move 64, 64, 0, 180
    cam_wait 120
    cam_end

CSD_NPC_2:
    .word NPC_080222E4
    .word NPC_0802230C
    .word NPC_08022320
    .word NPC_08022334
    .word NPC_08022348
    .word NPC_0802235C
    .word NPC_08022374
    .word NPC_0802238C
    .word NPC_080223A0
    .word NPC_080223C4
    .word 0xFF

NPC_080222E4:
    a_init
    a_enable_dialog
    a_set_sprite 0x5
    a_set_pos_16 -48, 32, 18
    a_set_sprite_frame 12
L_80222F1:
    a_wait 1
    a_jump L_80222F1

    .align 2, 0

NPC_080222F8:
    a_init
    a_enable_dialog
    a_set_sprite 0xF
    a_set_pos_16 0, 32, 18
    a_set_sprite_frame 12
L_8022305:
    a_wait 1
    a_jump L_8022305

NPC_0802230C:
    a_init
    a_enable_dialog
    a_set_sprite 0x4
    a_set_pos_16 -96, -16, 18
    a_set_sprite_frame 12
L_8022319:
    a_wait 1
    a_jump L_8022319

    .align 2, 0

NPC_08022320:
    a_init
    a_enable_dialog
    a_set_sprite 0xB
    a_set_pos_16 0, 80, 18
    a_set_sprite_frame 12
L_802232D:
    a_wait 1
    a_jump L_802232D

    .align 2, 0

NPC_08022334:
    a_init
    a_enable_dialog
    a_set_sprite 0xB
    a_set_pos_16 -96, 32, 18
    a_set_sprite_frame 12
L_8022341:
    a_wait 1
    a_jump L_8022341

    .align 2, 0

NPC_08022348:
    a_init
    a_enable_dialog
    a_set_sprite 0xB
    a_set_pos_16 -48, 80, 18
    a_set_sprite_frame 12
L_8022355:
    a_wait 1
    a_jump L_8022355

    .align 2, 0

NPC_0802235C:
    a_init
    a_enable_dialog
    ax_set_flag_64 4
    a_set_sprite 0x1D
    a_set_pos_16 -48, -16, 18
    a_set_sprite_frame 12
L_802236B:
    a_wait 1
    a_jump L_802236B

    .align 2, 0

NPC_08022374:
    a_init
    a_enable_dialog
    ax_set_flag_64 4
    a_set_sprite 0x1D
    a_set_pos_16 -96, 80, 18
    a_set_sprite_frame 12
L_8022383:
    a_wait 1
    a_jump L_8022383

    .align 2, 0

NPC_0802238C:
    a_init
    a_set_sprite 0x3
    a_set_pos_16 0, -16, 18
    a_set_sprite_frame 25
L_8022398:
    a_wait 1
    a_jump L_8022398

    .align 2, 0

NPC_080223A0:
    a_init
    a_set_sprite 0x6
    a_set_pos_16 48, 92
    a_set_sprite_frame 5
    a_wait 120
    a_set_sprite_frame 7
    a_wait 120
    a_set_sprite_frame 5
    a_wait 120
    a_set_sprite_frame 7
    a_wait 120
L_80223BA:
    a_wait 1
    a_jump L_80223BA

    .align 2, 0

NPC_080223C4:
    a_init
    a_set_sprite 0xF
    a_set_pos_16 88, 32, 4
    a_set_sprite_frame 1
    a_wait 120
    a_set_sprite_frame 11
    a_dir d_nw, 8, 4
    a_set_sprite_frame 1
    a_wait 120
    a_set_sprite_frame 9
    a_dir d_se, 8, 4
    a_set_sprite_frame 1
L_80223E4:
    a_wait 1
    a_jump L_80223E4

    .align 2, 0

EntityAllocParams_080223EC:
    .word 0xFF

CSD_Cam_3:
    cam_set 200, -34, 0
    cam_move -64, -64, 0, 120
    cam_wait 180
    cam_end

CSD_NPC_3:
    .word NPC_08022418
    .word NPC_08022450
    .word NPC_080224E8
    .word 0xFF

NPC_08022418:
    a_init_nosprite
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x23
    a_set_pos_16 130, -66
    a_set_sprite_frame 7
    a_wait 120
    a_init
    a_set_sprite_frame 12
    a_wait 10
    a_set_sprite_frame 7
    a_wait 50
    a_set_sprite_frame 5
    a_wait 30
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 13
    a_wait 60
    a_set_sprite_frame 14
    a_wait 30
    a_set_sprite_frame 7
    a_wait 60
    a_set_sprite_frame 3
L_8022449:
    a_wait 1
    a_jump L_8022449

    .align 2, 0

NPC_08022450:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x32
    ax_set_flag_64 3
    a_set_pos_16 108, -66
    a_set_sprite_frame 1
    a_wait 40
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 1
    a_wait 20
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 1
    a_set_pos_16 108, -66, 4
    a_wait 1
    a_set_pos_16 108, -66, 5
    a_wait 1
    a_set_pos_16 108, -66, 6
    a_wait 1
    a_set_pos_16 108, -66, 4
    a_wait 1
    a_set_pos_16 108, -66, 2
    a_wait 1
    a_set_pos_16 108, -66
    a_wait 240
    a_wait 55
    a_wait 30
L_80224AC:
    a_set_pos_16 108, -66, 4
    a_wait 1
    a_set_pos_16 108, -66, 5
    a_wait 1
    a_set_pos_16 108, -66, 6
    a_wait 1
    a_set_pos_16 108, -66, 4
    a_wait 1
    a_set_pos_16 108, -66, 2
    a_wait 1
    a_set_pos_16 108, -66
    a_wait 30
    a_jump L_80224AC

    .align 2, 0

NPC_080224E8:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x32
    ax_set_flag_64 3
    a_set_pos_16 148, -66
    a_set_sprite_frame 7
    a_wait 40
    a_set_sprite_frame 5
    a_wait 30
    a_set_sprite_frame 7
    a_wait 20
    a_set_sprite_frame 5
    a_wait 30
    a_set_sprite_frame 5
    a_set_pos_16 148, -66, 4
    a_wait 1
    a_set_pos_16 148, -66, 5
    a_wait 1
    a_set_pos_16 148, -66, 6
    a_wait 1
    a_set_pos_16 148, -66, 4
    a_wait 1
    a_set_pos_16 148, -66, 2
    a_wait 1
    a_set_pos_16 148, -66
    a_wait 240
    a_wait 40
    a_wait 30
L_8022544:
    a_set_pos_16 148, -66, 4
    a_wait 1
    a_set_pos_16 148, -66, 5
    a_wait 1
    a_set_pos_16 148, -66, 6
    a_wait 1
    a_set_pos_16 148, -66, 4
    a_wait 1
    a_set_pos_16 148, -66, 2
    a_wait 1
    a_set_pos_16 148, -66
    a_wait 30
    a_jump L_8022544

    .align 2, 0

NPC_08022580:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 118, -42
    a_set_sprite_frame 8
    a_dir d_ne, 8, 3
    a_set_sprite_frame 10
    a_dir d_sw, 8, 3
    a_set_sprite_frame 8
    a_dir d_ne, 8, 1
    a_wait 5
    a_set_sprite_frame 7
    a_set_pos_16 126, -42, 4
    a_wait 1
    a_set_pos_16 126, -42, 5
    a_wait 1
    a_set_pos_16 126, -42, 6
    a_wait 1
    a_set_pos_16 126, -42, 4
    a_wait 1
    a_set_pos_16 126, -42, 2
    a_wait 1
    a_set_pos_16 126, -42
    a_wait 240
    a_wait 30
    a_wait 30
L_80225DE:
    a_set_pos_16 126, -42, 4
    a_wait 1
    a_set_pos_16 126, -42, 5
    a_wait 1
    a_set_pos_16 126, -42, 6
    a_wait 1
    a_set_pos_16 126, -42, 4
    a_wait 1
    a_set_pos_16 126, -42, 2
    a_wait 1
    a_set_pos_16 126, -42
    a_wait 30
    a_jump L_80225DE

    .align 2, 0

CSD_Entity_3:
    entity Effect, 0x1, f(300), f(-68), 0, 0xD
    entity Effect, 0x1, f(300), f(-52), 0, 0xD
    entity Effect, 0x1, f(300), f(-4), 0, 0xD
    entity Effect, 0x1, f(300), f(12), 0, 0xD
    entity Effect, 0x1, f(252), f(-68), 0, 0xD
    entity Effect, 0x1, f(252), f(-52), 0, 0xD
    entity Effect, 0x1, f(252), f(-4), 0, 0xD
    entity Effect, 0x1, f(252), f(12), 0, 0xD
    entity Effect, 0x1, f(306), f(70), 0, 0x49
    .word 0xFF

global_label CSD_Task_3_0
    task_direct 0, 0x2006E50, 0x8, 5
    task_direct_arg 0x877FBF4
    task_direct_arg 0x877FC14
    task_direct_arg 0x877FC34
    task_direct_arg 0x877FC54
    task_direct_arg 0x877FC74
    task_direct_arg 0x877FC94
    task_direct_arg 0x877FCB4
    task_repeat

    .align 2, 0

global_label CSD_Task_3_1
    task_direct 4, 0x2006E50, 0x8, 5
    task_direct_arg 0x877FBF4, 370
L_8022730:
    task_direct_arg 0x877FCD4
    task_direct_arg 0x877FCF4
    task_direct_arg 0x877FD14
    task_direct_arg 0x877FD34
    task_direct_arg 0x877FD54
    task_direct_arg 0x877FD74
    task_direct_arg 0x877FD94
    task_jump L_8022730

    .align 2, 0

CSD_Cam_4:
    cam_set 364, -76, 0
    cam_move 64, -64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_4:
    .word NPC_080227A8
    .word NPC_080227C9
    .word NPC_08022884
    .word NPC_08022899
    .word NPC_080228AE
    .word NPC_080228C3
    .word NPC_080228D8
    .word 0xFF

NPC_080227A8:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2C
    a_set_pos_16 472, -132
L_80227B4:
    a_set_sprite_frame 5
    a_wait 45
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 5
    a_wait 45
    a_set_sprite_frame 3
    a_wait 60
    a_jump L_80227B4

NPC_080227C9:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x7
    a_set_pos_16 408, -146
    a_set_sprite_frame 3
    a_wait 90
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 5
    a_wait 1
    a_set_pos_16 408, -146, 6
    a_wait 1
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 2
    a_wait 1
    a_set_pos_16 408, -146
    a_wait 1
L_802280F:
    a_wait 90
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 5
    a_wait 1
    a_set_pos_16 408, -146, 6
    a_wait 1
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 2
    a_wait 1
    a_set_pos_16 408, -146
    a_wait 1
    a_wait 10
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 5
    a_wait 1
    a_set_pos_16 408, -146, 6
    a_wait 1
    a_set_pos_16 408, -146, 4
    a_wait 1
    a_set_pos_16 408, -146, 2
    a_wait 1
    a_set_pos_16 408, -146
    a_wait 1
    a_jump L_802280F

NPC_08022884:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2F
    a_set_pos_16 442, -110
    a_set_sprite_frame 1
L_8022892:
    a_wait 1
    a_jump L_8022892

NPC_08022899:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x40
    a_set_pos_16 444, -90
    a_set_sprite_frame 7
L_80228A7:
    a_wait 1
    a_jump L_80228A7

NPC_080228AE:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x30
    a_set_pos_16 420, -90
    a_set_sprite_frame 1
L_80228BC:
    a_wait 1
    a_jump L_80228BC

NPC_080228C3:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x2F
    a_set_pos_16 418, -64
    a_set_sprite_frame 7
L_80228D1:
    a_wait 1
    a_jump L_80228D1

NPC_080228D8:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_pos_16 348, -64
    a_set_sprite_frame 8
    a_dir d_ne, 8, 6
    a_set_sprite_frame 1
L_80228EC:
    a_wait 1
    a_jump L_80228EC

    .align 2, 0

EntityAllocParams_080228F4:
    .word 0xFF

CSD_Cam_5:
    cam_set -174, -38, 64
    cam_move -64, 64, 0, 120
    cam_shake 2, 30
    cam_wait 180
    cam_end

    .align 2, 0

CSD_NPC_5:
    .word NPC_08022930
    .word NPC_08022951
    .word NPC_080229F9
    .word NPC_08022B03
    .word NPC_08022C0D
    .word 0xFF

NPC_08022930:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x5D
    a_set_pos_16 -234, 72, 64
    a_set_sprite_frame 7
    a_wait 100
    a_set_sprite_frame 12
    a_wait 15
    a_set_sprite_frame 13
    a_wait 60
    a_set_sprite_frame 7
L_802294A:
    a_wait 1
    a_jump L_802294A

NPC_08022951:
    a_init
    a_set_sprite 0x35
    a_set_pos_16 -242, -50, 64
    a_set_sprite_frame 8
    a_dir d_ne, 4, 2
    a_set_sprite_frame 1
    a_wait 60
    a_set_pos_16 -226, -50, 68
    a_wait 1
    a_set_pos_16 -225, -50, 69
    a_wait 1
    a_set_pos_16 -224, -50, 70
    a_wait 1
    a_set_pos_16 -223, -50, 68
    a_wait 1
    a_set_pos_16 -222, -50, 66
    a_wait 1
    a_set_pos_16 -221, -50, 64
    a_set_no_z_clip
    a_clear_z_clip
    a_set_sprite_frame 1
    a_dir d_ne, 32, 22
    a_wait 90
    a_set_sprite_frame 5
    a_dir d_sw, 32, 22
    a_set_z_clip
    a_set_pos_16 -221, -50, 68
    a_wait 1
    a_set_pos_16 -222, -50, 69
    a_wait 1
    a_set_pos_16 -223, -50, 70
    a_wait 1
    a_set_pos_16 -224, -50, 68
    a_wait 1
    a_set_pos_16 -225, -50, 66
    a_wait 1
    a_set_pos_16 -226, -50, 64
    a_set_sprite_frame 10
    a_dir d_sw, 4, 1
    a_set_sprite_frame 1
    a_set_sprite_frame 3
    a_wait 20
    a_set_sprite_frame 7
    a_wait 20
    a_set_sprite_frame 3
    a_wait 20
L_80229F2:
    a_wait 1
    a_jump L_80229F2

NPC_080229F9:
    a_init
    a_set_sprite 0x16
    a_set_pos_16 -242, -18, 64
    a_set_sprite_frame 8
    a_dir d_ne, 4, 2
    a_set_sprite_frame 1
    a_wait 60
    a_set_pos_16 -226, -18, 68
    a_wait 1
    a_set_pos_16 -225, -18, 69
    a_wait 1
    a_set_pos_16 -224, -18, 70
    a_wait 1
    a_set_pos_16 -223, -18, 68
    a_wait 1
    a_set_pos_16 -222, -18, 66
    a_wait 1
    a_set_pos_16 -221, -18, 64
    a_set_no_z_clip
    a_clear_z_clip
    a_set_sprite_frame 1
    a_dir d_ne, 32, 22
    a_wait 120
    ax_set_flag_64 3
    a_set_sprite 0x32
    a_set_sprite_frame 5
    a_dir d_sw, 32, 22
    a_set_z_clip
    a_set_pos_16 -221, -18, 68
    a_wait 1
    a_set_pos_16 -222, -18, 69
    a_wait 1
    a_set_pos_16 -223, -18, 70
    a_wait 1
    a_set_pos_16 -224, -18, 68
    a_wait 1
    a_set_pos_16 -225, -18, 66
    a_wait 1
    a_set_pos_16 -226, -18, 64
    a_set_sprite_frame 5
    a_dir d_sw, 4, 1
    a_set_sprite_frame 1
L_8022A92:
    a_set_pos_16 -234, -18, 68
    a_wait 1
    a_set_pos_16 -234, -18, 69
    a_wait 1
    a_set_pos_16 -234, -18, 70
    a_wait 1
    a_set_pos_16 -234, -18, 68
    a_wait 1
    a_set_pos_16 -234, -18, 66
    a_wait 1
    a_set_pos_16 -234, -18, 64
    a_wait 10
    a_set_pos_16 -234, -18, 68
    a_wait 1
    a_set_pos_16 -234, -18, 69
    a_wait 1
    a_set_pos_16 -234, -18, 70
    a_wait 1
    a_set_pos_16 -234, -18, 68
    a_wait 1
    a_set_pos_16 -234, -18, 66
    a_wait 1
    a_set_pos_16 -234, -18, 64
    a_wait 30
    a_jump L_8022A92

NPC_08022B03:
    a_init
    a_set_sprite 0x16
    a_set_pos_16 -242, 14, 64
    a_set_sprite_frame 8
    a_dir d_ne, 4, 2
    a_set_sprite_frame 1
    a_wait 60
    a_set_pos_16 -226, 14, 68
    a_wait 1
    a_set_pos_16 -225, 14, 69
    a_wait 1
    a_set_pos_16 -224, 14, 70
    a_wait 1
    a_set_pos_16 -223, 14, 68
    a_wait 1
    a_set_pos_16 -222, 14, 66
    a_wait 1
    a_set_pos_16 -221, 14, 64
    a_set_no_z_clip
    a_clear_z_clip
    a_set_sprite_frame 1
    a_dir d_ne, 32, 22
    a_wait 100
    ax_set_flag_64 3
    a_set_sprite 0x32
    a_set_sprite_frame 5
    a_dir d_sw, 32, 22
    a_set_z_clip
    a_set_pos_16 -221, 14, 68
    a_wait 1
    a_set_pos_16 -222, 14, 69
    a_wait 1
    a_set_pos_16 -223, 14, 70
    a_wait 1
    a_set_pos_16 -224, 14, 68
    a_wait 1
    a_set_pos_16 -225, 14, 66
    a_wait 1
    a_set_pos_16 -226, 14, 64
    a_set_sprite_frame 5
    a_dir d_sw, 4, 1
    a_set_sprite_frame 1
L_8022B9C:
    a_set_pos_16 -234, 14, 68
    a_wait 1
    a_set_pos_16 -234, 14, 69
    a_wait 1
    a_set_pos_16 -234, 14, 70
    a_wait 1
    a_set_pos_16 -234, 14, 68
    a_wait 1
    a_set_pos_16 -234, 14, 66
    a_wait 1
    a_set_pos_16 -234, 14, 64
    a_wait 10
    a_set_pos_16 -234, 14, 68
    a_wait 1
    a_set_pos_16 -234, 14, 69
    a_wait 1
    a_set_pos_16 -234, 14, 70
    a_wait 1
    a_set_pos_16 -234, 14, 68
    a_wait 1
    a_set_pos_16 -234, 14, 66
    a_wait 1
    a_set_pos_16 -234, 14, 64
    a_wait 30
    a_jump L_8022B9C

NPC_08022C0D:
    a_init
    a_set_sprite 0x16
    a_set_pos_16 -242, -82, 64
    a_set_sprite_frame 8
    a_dir d_ne, 4, 2
    a_set_sprite_frame 1
    a_wait 60
    a_set_pos_16 -226, -82, 68
    a_wait 1
    a_set_pos_16 -225, -82, 69
    a_wait 1
    a_set_pos_16 -224, -82, 70
    a_wait 1
    a_set_pos_16 -223, -82, 68
    a_wait 1
    a_set_pos_16 -222, -82, 66
    a_wait 1
    a_set_pos_16 -221, -82, 64
    a_set_no_z_clip
    a_clear_z_clip
    a_set_sprite_frame 1
    a_dir d_ne, 32, 22
    a_wait 130
    ax_set_flag_64 3
    a_set_sprite 0x32
    a_set_sprite_frame 5
    a_dir d_sw, 32, 22
    a_set_z_clip
    a_set_pos_16 -221, -82, 68
    a_wait 1
    a_set_pos_16 -222, -82, 69
    a_wait 1
    a_set_pos_16 -223, -82, 70
    a_wait 1
    a_set_pos_16 -224, -82, 68
    a_wait 1
    a_set_pos_16 -225, -82, 66
    a_wait 1
    a_set_pos_16 -226, -82, 64
    a_set_sprite_frame 5
    a_dir d_sw, 4, 1
    a_set_sprite_frame 1
L_8022CA6:
    a_set_pos_16 -234, -82, 68
    a_wait 1
    a_set_pos_16 -234, -82, 69
    a_wait 1
    a_set_pos_16 -234, -82, 70
    a_wait 1
    a_set_pos_16 -234, -82, 68
    a_wait 1
    a_set_pos_16 -234, -82, 66
    a_wait 1
    a_set_pos_16 -234, -82, 64
    a_wait 10
    a_set_pos_16 -234, -82, 68
    a_wait 1
    a_set_pos_16 -234, -82, 69
    a_wait 1
    a_set_pos_16 -234, -82, 70
    a_wait 1
    a_set_pos_16 -234, -82, 68
    a_wait 1
    a_set_pos_16 -234, -82, 66
    a_wait 1
    a_set_pos_16 -234, -82, 64
    a_wait 30
    a_jump L_8022CA6

NPC_08022D17:
    a_init
    a_set_sprite 0x37
    a_set_pos_16 -270, -18, 64
    a_set_sprite_frame 8
L_8022D23:
    a_wait 1
    a_jump L_8022D23

    .align 2, 0

EntityAllocParams_08022D2C:
    .word 0xFF

CSD_Cam_6:
    cam_set -52, -48, 0
    cam_move 64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_6:
    .word NPC_08022D60
    .word NPC_08022D80
    .word NPC_08022DA8
    .word NPC_08022DC0
    .word NPC_08022DE0
    .word 0xFF

NPC_08022D60:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x9
    a_set_pos_16 48, 2
    a_set_sprite_frame 5
    a_wait 60
    a_set_sprite_frame 9
    a_dir d_se, 8, 4
    a_set_sprite_frame 5
L_8022D78:
    a_wait 1
    a_jump L_8022D78

    .align 2, 0

NPC_08022D80:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xB
    a_set_pos_16 -46, 2
L_8022D8C:
    a_set_sprite_frame 7
    a_wait 120
    a_set_sprite_frame 10
    a_dir d_sw, 4, 2
    a_set_sprite_frame 7
    a_wait 120
    a_set_sprite_frame 8
    a_dir d_ne, 4, 2
    a_jump L_8022D8C

    .align 2, 0

NPC_08022DA8:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x5
    a_set_pos_16 -28, 112
    a_set_sprite_frame 14
L_8022DB6:
    a_wait 1
    a_jump L_8022DB6

    .align 2, 0

NPC_08022DC0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x1C
    a_set_pos_16 -148, 32
    a_set_sprite_frame 8
    a_dir d_ne, 8, 20
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 3
L_8022DD8:
    a_wait 90
    a_jump L_8022DD8

    .align 2, 0

NPC_08022DE0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xC
    a_set_pos_16 -148, 50
    a_set_sprite_frame 8
    a_dir d_ne, 16, 20
    a_set_sprite_frame 1
    a_wait 150
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 5
    a_wait 1
    a_set_pos_16 12, 50, 6
    a_wait 1
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 2
    a_wait 1
    a_set_pos_16 12, 50
    a_wait 10
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 5
    a_wait 1
    a_set_pos_16 12, 50, 6
    a_wait 1
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 2
    a_wait 1
    a_set_pos_16 12, 50
    a_wait 60
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 5
    a_wait 1
    a_set_pos_16 12, 50, 6
    a_wait 1
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 2
    a_wait 1
    a_set_pos_16 12, 50
    a_wait 10
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 5
    a_wait 1
    a_set_pos_16 12, 50, 6
    a_wait 1
    a_set_pos_16 12, 50, 4
    a_wait 1
    a_set_pos_16 12, 50, 2
    a_wait 1
    a_set_pos_16 12, 50
L_8022ECC:
    a_wait 1
    a_jump L_8022ECC

    .align 2, 0

EntityAllocParams_08022ED4:
    .word 0xFF

CSD_Cam_7:
    cam_set -160, -300, 64
    cam_move 128, -128, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_7:
    .word NPC_08022F00
    .word NPC_08022F28
    .word NPC_08022F50
    .word 0xFF

NPC_08022F00:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x38
    a_set_pos_16 -86, -442, 64
    a_set_sprite_frame 2
    a_wait 120
    a_set_sprite_frame 0
    a_wait 60
    a_set_sprite_frame 2
    a_wait 120
    a_set_sprite_frame 0
    a_wait 30
    a_set_sprite_frame 2
L_8022F1E:
    a_wait 1
    a_jump L_8022F1E

    .align 2, 0

NPC_08022F28:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 -66, -442, 64
    a_set_sprite_frame 2
    a_wait 140
    a_set_sprite_frame 4
    a_wait 60
    a_set_sprite_frame 2
    a_wait 80
    a_set_sprite_frame 4
    a_wait 60
    a_set_sprite_frame 2
L_8022F46:
    a_wait 1
    a_jump L_8022F46

    .align 2, 0

NPC_08022F50:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x8
    a_set_pos_16 -278, -268, 32
    a_set_sprite_frame 17
    a_set_pos_16 -278, -268, 40
    a_wait 1
    a_set_pos_16 -276, -268, 41
    a_wait 1
    a_set_pos_16 -274, -268, 42
    a_wait 1
    a_set_pos_16 -272, -268, 43
    a_wait 1
    a_set_pos_16 -270, -268, 44
    a_wait 1
    a_set_pos_16 -268, -268, 45
    a_wait 1
    a_set_pos_16 -266, -268, 46
    a_wait 1
    a_set_pos_16 -264, -268, 47
    a_wait 1
    a_set_pos_16 -262, -268, 48
    a_wait 1
    a_set_pos_16 -260, -268, 49
    a_wait 1
    a_set_pos_16 -258, -268, 50
    a_wait 1
    a_set_pos_16 -256, -268, 51
    a_wait 1
    a_set_pos_16 -254, -268, 52
    a_wait 1
    a_set_pos_16 -252, -268, 53
    a_wait 1
    a_set_pos_16 -250, -268, 54
    a_wait 1
    a_set_pos_16 -248, -268, 55
    a_wait 1
    a_set_pos_16 -246, -268, 56
    a_wait 1
    a_set_pos_16 -244, -268, 57
    a_wait 1
    a_set_pos_16 -242, -268, 58
    a_wait 1
    a_set_pos_16 -240, -268, 59
    a_wait 1
    a_set_pos_16 -238, -268, 60
    a_wait 1
    a_set_pos_16 -236, -268, 61
    a_wait 1
    a_set_pos_16 -234, -268, 62
    a_wait 1
    a_set_pos_16 -232, -268, 63
    a_wait 1
    a_set_pos_16 -230, -268, 64
    a_wait 1
    a_set_pos_16 -228, -268, 64
    a_wait 1
    a_set_pos_16 -226, -268, 64
    a_wait 1
    a_set_pos_16 -224, -268, 64
    a_wait 1
    a_set_pos_16 -222, -268, 64
    a_wait 1
    a_set_pos_16 -220, -268, 64
    a_wait 1
    a_set_pos_16 -218, -268, 64
    a_wait 1
    a_set_pos_16 -216, -268, 64
    a_wait 1
    a_set_pos_16 -214, -268, 64
    a_wait 1
    a_set_pos_16 -212, -268, 64
    a_wait 1
    a_set_pos_16 -210, -268, 64
    a_wait 1
    a_set_pos_16 -208, -268, 64
    a_wait 1
    a_set_pos_16 -206, -268, 64
    a_set_sprite_frame 19
    a_dir d_se, 32, 8
    a_wait 30
    a_set_pos_16 -78, -244, 64
    a_set_sprite_frame 23
    a_dir d_nw, 32, 6
    a_set_sprite_frame 17
    a_dir d_ne, 32, 8
    a_wait 30
    a_set_pos_16 162, -452
    a_set_sprite_frame 21
    a_dir d_sw, 32, 13
    a_set_sprite_frame 17
    a_dir d_ne, 32, 13
    a_wait 30
    a_set_sprite_frame 23
    a_set_pos_16 -78, -320, 32
    a_wait 1
    a_set_pos_16 -78, -322, 33
    a_wait 1
    a_set_pos_16 -78, -324, 34
    a_wait 1
    a_set_pos_16 -78, -326, 35
    a_wait 1
    a_set_pos_16 -78, -328, 36
    a_wait 1
    a_set_pos_16 -78, -330, 37
    a_wait 1
    a_set_pos_16 -78, -332, 38
    a_wait 1
    a_set_pos_16 -78, -334, 39
    a_wait 1
    a_set_pos_16 -78, -336, 40
    a_wait 1
    a_set_pos_16 -78, -338, 41
    a_wait 1
    a_set_pos_16 -78, -340, 42
    a_wait 1
    a_set_pos_16 -78, -342, 43
    a_wait 1
    a_set_pos_16 -78, -344, 44
    a_wait 1
    a_set_pos_16 -78, -346, 45
    a_wait 1
    a_set_pos_16 -78, -348, 46
    a_wait 1
    a_set_pos_16 -78, -350, 47
    a_wait 1
    a_set_pos_16 -78, -352, 48
    a_wait 1
    a_set_pos_16 -78, -354, 49
    a_wait 1
    a_set_pos_16 -78, -356, 50
    a_wait 1
    a_set_pos_16 -78, -358, 51
    a_wait 1
    a_set_pos_16 -78, -360, 52
    a_wait 1
    a_set_pos_16 -78, -362, 53
    a_wait 1
    a_set_pos_16 -78, -364, 54
    a_wait 1
    a_set_pos_16 -78, -366, 55
    a_wait 1
    a_set_pos_16 -78, -368, 56
    a_wait 1
    a_set_pos_16 -78, -370, 57
    a_wait 1
    a_set_pos_16 -78, -372, 58
    a_wait 1
    a_set_pos_16 -78, -374, 59
    a_wait 1
    a_set_pos_16 -78, -376, 60
    a_wait 1
    a_set_pos_16 -78, -378, 61
    a_wait 1
    a_set_pos_16 -78, -380, 62
    a_wait 1
    a_set_pos_16 -78, -382, 63
    a_wait 1
    a_set_pos_16 -78, -384, 64
    a_wait 1
    a_set_pos_16 -78, -386, 64
    a_wait 1
    a_set_pos_16 -78, -388, 64
    a_wait 1
    a_set_pos_16 -78, -390, 64
    a_wait 1
    a_set_pos_16 -78, -392, 64
    a_wait 1
    a_set_pos_16 -78, -394, 64
    a_wait 1
    a_set_pos_16 -78, -396, 64
    a_wait 1
    a_set_pos_16 -78, -398, 64
    a_wait 1
    a_set_pos_16 -78, -400, 64
    a_wait 1
    a_set_pos_16 -78, -402, 64
    a_wait 1
    a_set_pos_16 -78, -404, 64
    a_wait 1
    a_set_pos_16 -78, -406, 64
    a_wait 1
    a_set_pos_16 -78, -408, 64
    a_wait 1
    a_set_pos_16 -78, -410, 64
    a_wait 1
    a_set_pos_16 -78, -412, 64
    a_wait 1
    a_set_pos_16 -78, -414, 64
    a_wait 1
    a_set_pos_16 -78, -416, 64
    a_wait 1
    a_set_pos_16 -78, -418, 64
    a_wait 1
    a_set_sprite_frame 50
L_80232A1:
    a_wait 1
    a_jump L_80232A1

CSD_Entity_7:
    .word 0xFF

CSD_Cam_8:
    cam_set 64, 88, 0
    cam_move -64, 64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_8:
    .word NPC_080232DC
    .word NPC_080233E8
    .word NPC_08023418
    .word NPC_08023440
    .word NPC_0802345C
    .word 0xFF

    .align 2, 0

NPC_080232DC:
    a_init
    a_cmd_1A_set_priority_1
    a_set_dialog 0x0
    a_set_sprite 0x1C
    a_set_pos_16 24, 150
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 5
    a_wait 60
    a_set_sprite_frame 3
    a_wait 45
    a_set_sprite_frame 5
    a_wait 45
    a_set_pos_16 24, 150, 4
    a_wait 1
    a_set_pos_16 24, 150, 5
    a_wait 1
    a_set_pos_16 24, 150, 6
    a_wait 1
    a_set_pos_16 24, 150, 4
    a_wait 1
    a_set_pos_16 24, 150, 2
    a_wait 1
    a_set_pos_16 24, 150
    a_wait 10
    a_set_pos_16 24, 150, 4
    a_wait 1
    a_set_pos_16 24, 150, 5
    a_wait 1
    a_set_pos_16 24, 150, 6
    a_wait 1
    a_set_pos_16 24, 150, 4
    a_wait 1
    a_set_pos_16 24, 150, 2
    a_wait 1
    a_set_pos_16 24, 150
    a_wait 60
    a_set_sprite_frame 9
    a_dir d_se, 16, 8
    a_set_sprite_frame 7
    a_set_pos_16 24, 214, 4
    a_wait 1
    a_set_pos_16 24, 214, 5
    a_wait 1
    a_set_pos_16 24, 214, 6
    a_wait 1
    a_set_pos_16 24, 214, 4
    a_wait 1
    a_set_pos_16 24, 214, 2
    a_wait 1
    a_set_pos_16 24, 214
    a_wait 10
    a_set_pos_16 24, 214, 4
    a_wait 1
    a_set_pos_16 24, 214, 5
    a_wait 1
    a_set_pos_16 24, 214, 6
    a_wait 1
    a_set_pos_16 24, 214, 4
    a_wait 1
    a_set_pos_16 24, 214, 2
    a_wait 1
    a_set_pos_16 24, 214
    a_wait 30
    a_set_sprite_frame 9
    a_dir d_se, 16, 20
L_80233DF:
    a_wait 1
    a_jump L_80233DF

    .align 2, 0

NPC_080233E8:
    a_init
    a_cmd_1A_set_priority_1
    a_set_dialog 0x0
    a_set_sprite 0x1B
    a_set_pos_16 2, 8
    a_set_sprite_frame 12
    a_dir d_se, 16, 18
    a_set_sprite_frame 8
    a_dir d_ne, 8, 1
    a_set_sprite_frame 1
    a_wait 90
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 9
    a_dir d_se, 8, 20
L_802340F:
    a_wait 1
    a_jump L_802340F

    .align 2, 0

NPC_08023418:
    a_init
    a_cmd_1A_set_priority_1
    a_set_dialog 0x0
    a_set_sprite 0xA
    a_set_pos_16 -6, 308
    a_set_sprite_frame 11
    a_dir d_nw, 8, 12
    a_set_sprite_frame 7
    a_wait 90
    a_wait 60
    a_set_sprite_frame 11
    a_dir d_nw, 8, 12
L_8023437:
    a_wait 1
    a_jump L_8023437

    .align 2, 0

NPC_08023440:
    a_init
    a_cmd_1B_set_priority_2
    a_set_dialog 0x0
    a_set_sprite_long 0x104
    a_set_pos_16 68, 96
    a_set_sprite_frame 5
    a_set_palette 0x0
L_8023452:
    a_wait 1
    a_jump L_8023452

    .align 2, 0

NPC_0802345C:
    a_init
    a_cmd_1A_set_priority_1
    a_set_dialog 0x0
    a_set_sprite 0xD
    a_set_pos_16 -54, -156
    a_set_palette 0x1
    a_set_sprite_frame 3
    a_dir d_se, 32, 60
    a_set_pos_16 -54, -156
    a_set_palette 0x0
    a_set_sprite_frame 3
    a_dir d_se, 32, 60
L_8023480:
    a_wait 1
    a_jump L_8023480

    .align 2, 0

CSD_Entity_8:
    entity Effect, 0x1, f(-26), f(-24), 0, 0x2D
    entity Effect, 0x1, f(-26), f(232), 0, 0x2E
    entity Effect, 0x1, f(-202), f(26), 0, 0x2F
    entity Effect, 0x1, f(-16), f(-32), 0, 0x22
    entity Effect, 0x1, f(-24), f(130), 0, 0xFFFF004A
    entity Effect, 0x1, f(-20), f(122), f(8), 0x14B
    entity Effect, 0x1, f(14), f(28), f(8), 0x34C
    entity Effect, 0x1, f(-20), f(162), f(8), 0x14D
    entity Effect, 0x1, f(-130), f(130), f(8), 0x34E
    .word 0xFF

CSD_Cam_9:
    cam_set 284, 180, 0
    cam_move -64, 64, 0, 180
    cam_shake 2, 30
    cam_move -64, 64, 0, 60
    cam_wait 60
    cam_end

CSD_NPC_9:
    .word NPC_08023578
    .word NPC_0802359C
    .word NPC_080235C0
    .word 0xFF

NPC_08023578:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x5D
    a_set_pos_16 240, 308
    a_set_sprite_frame 7
    a_wait 160
    a_set_sprite_frame 12
    a_wait 10
    a_set_sprite_frame 13
    a_wait 120
    a_set_sprite_frame 5
L_8023592:
    a_wait 1
    a_jump L_8023592

    .align 2, 0

NPC_0802359C:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x10F
    a_set_pos_16 242, 204
    a_set_sprite_frame 0
    a_wait 1
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 99
    a_set_palette 0x1
    a_wait 120
    a_set_palette 0x0
L_80235B9:
    a_wait 1
    a_jump L_80235B9

NPC_080235C0:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 244, 160
    a_set_sprite_frame 9
    a_dir d_se, 8, 7
    a_set_pos_16 244, 216, 4
    a_wait 1
    a_set_pos_16 244, 215, 5
    a_wait 1
    a_set_pos_16 244, 214, 6
    a_wait 1
    a_set_pos_16 244, 213, 4
    a_wait 1
    a_set_pos_16 244, 212, 2
    a_wait 1
    a_set_pos_16 244, 211
    a_wait 120
    a_set_sprite_frame 9
    a_dir d_se, 8, 3
    a_set_sprite_frame 10
    a_dir d_sw, 8, 4
    a_set_pos_16 120, 302
    a_set_sprite_frame 8
    a_dir d_ne, 8, 10
L_8023623:
    a_wait 1
    a_jump L_8023623

    .align 2, 0

NPC_0802362C:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 244, 144
    a_wait 1
    a_set_sprite_frame 9
    a_dir d_se, 8, 7
    a_wait 5
    a_set_pos_16 244, 200, 4
    a_wait 1
    a_set_pos_16 244, 199, 5
    a_wait 1
    a_set_pos_16 244, 198, 6
    a_wait 1
    a_set_pos_16 244, 197, 4
    a_wait 1
    a_set_pos_16 244, 196, 2
    a_wait 1
    a_set_pos_16 244, 195
    a_wait 120
    a_set_sprite_frame 9
    a_dir d_se, 8, 5
    a_set_sprite_frame 10
    a_dir d_sw, 8, 4
    a_set_pos_16 120, 302
    a_set_sprite_frame 8
    a_dir d_ne, 8, 10
L_8023693:
    a_wait 1
    a_jump L_8023693

    .align 2, 0

NPC_0802369C:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite 0x16
    a_set_pos_16 244, 128
    a_wait 2
    a_set_sprite_frame 9
    a_dir d_se, 8, 7
    a_wait 10
    a_set_pos_16 244, 184, 4
    a_wait 1
    a_set_pos_16 244, 183, 5
    a_wait 1
    a_set_pos_16 244, 182, 6
    a_wait 1
    a_set_pos_16 244, 181, 4
    a_wait 1
    a_set_pos_16 244, 180, 2
    a_wait 1
    a_set_pos_16 244, 179
    a_wait 120
    a_set_sprite_frame 9
    a_dir d_se, 8, 7
    a_set_sprite_frame 10
    a_dir d_sw, 8, 4
    a_set_pos_16 120, 302
    a_set_sprite_frame 8
    a_dir d_ne, 8, 10
L_8023703:
    a_wait 1
    a_jump L_8023703

    .align 2, 0

CSD_Entity_9:
    .word 0xFF

global_label CSD_Task_9_2
    task_direct 2, 0x2006CD0, 0x18, 100
    task_direct_arg 0x84BDB34
    task_direct_arg 0x878A834, 120
    task_direct_arg 0x84BDB34, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_3
    task_direct 3, 0x2006D50, 0x10, 100
    task_direct_arg 0x84BDBB4
    task_direct_arg 0x878A894, 120
    task_direct_arg 0x84BDBB4, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_4
    task_direct 4, 0x2006DB0, 0x8, 100
    task_direct_arg 0x84BDC14
    task_direct_arg 0x878A9B4, 120
    task_direct_arg 0x84BDC14, 1
    task_stop

    .align 2, 0

global_label CSD_Task_9_5
    task_direct 5, 0x2006D30, 0x8, 100
    task_direct_arg 0x84BDB94
    task_direct_arg 0x878A934, 120
    task_direct_arg 0x84BDB94, 1
    task_stop

    .align 2, 0

CSD_Cam_10:
    cam_set 96, -56, 0
    cam_move -64, -64, 0, 240
    cam_wait 60
    cam_end

CSD_NPC_10:
    .word NPC_080237EC
    .word NPC_08023804
    .word NPC_08023828
    .word NPC_080238AC
    .word NPC_080238D0
    .word NPC_08023964
    .word NPC_0802397C
    .word NPC_080239A0
    .word 0xFF

    .align 2, 0

NPC_080237EC:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x31
    a_set_pos_16 30, -82
    a_set_sprite_frame 3
L_80237FA:
    a_wait 1
    a_jump L_80237FA

    .align 2, 0

NPC_08023804:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xB
    a_set_pos_16 30, -58
L_8023810:
    a_set_sprite_frame 1
    a_wait 120
    a_set_sprite_frame 3
    a_wait 90
    a_set_sprite_frame 1
    a_wait 60
    a_set_sprite_frame 3
    a_wait 120
    a_jump L_8023810

    .align 2, 0

NPC_08023828:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xC
    a_set_pos_16 30, -40
    a_set_sprite_frame 0
    a_wait 60
L_8023838:
    a_set_pos_16 30, -40, 4
    a_wait 1
    a_set_pos_16 30, -40, 5
    a_wait 1
    a_set_pos_16 30, -40, 6
    a_wait 1
    a_set_pos_16 30, -40, 4
    a_wait 1
    a_set_pos_16 30, -40, 2
    a_wait 1
    a_set_pos_16 30, -40
    a_wait 10
    a_set_pos_16 30, -40, 4
    a_wait 1
    a_set_pos_16 30, -40, 5
    a_wait 1
    a_set_pos_16 30, -40, 6
    a_wait 1
    a_set_pos_16 30, -40, 4
    a_wait 1
    a_set_pos_16 30, -40, 2
    a_wait 1
    a_set_pos_16 30, -40
    a_wait 120
    a_jump L_8023838

    .align 2, 0

NPC_080238AC:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x6
    a_set_pos_16 -18, -122
L_80238B8:
    a_set_sprite_frame 5
    a_wait 180
    a_set_sprite_frame 3
    a_wait 60
    a_set_sprite_frame 5
    a_wait 180
    a_set_sprite_frame 3
    a_wait 180
    a_jump L_80238B8

    .align 2, 0

NPC_080238D0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x4
    a_set_pos_16 -18, -104
L_80238DC:
    a_set_sprite_frame 9
    a_dir d_se, 8, 3
    a_set_sprite_frame 10
    a_set_pos_16 -18, -80, 4
    a_wait 1
    a_set_pos_16 -18, -80, 5
    a_wait 1
    a_set_pos_16 -18, -80, 6
    a_wait 1
    a_set_pos_16 -18, -80, 4
    a_wait 1
    a_set_pos_16 -18, -80, 2
    a_wait 1
    a_set_pos_16 -18, -80
    a_set_sprite_frame 5
    a_wait 90
    a_set_sprite_frame 11
    a_dir d_nw, 8, 3
    a_set_sprite_frame 10
    a_set_pos_16 -18, -104, 4
    a_wait 1
    a_set_pos_16 -18, -104, 5
    a_wait 1
    a_set_pos_16 -18, -104, 6
    a_wait 1
    a_set_pos_16 -18, -104, 4
    a_wait 1
    a_set_pos_16 -18, -104, 2
    a_wait 1
    a_set_pos_16 -18, -104
    a_set_sprite_frame 5
    a_wait 90
    a_jump L_80238DC

    .align 2, 0

NPC_08023964:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xF
    a_set_pos_16 -18, -42
    a_set_sprite_frame 16
L_8023972:
    a_wait 1
    a_jump L_8023972

    .align 2, 0

NPC_0802397C:
    a_init
    a_set_dialog 0x0
    ax_set_flag_64 4
    a_set_sprite 0x1D
    a_set_pos_16 -18, -30
L_802398A:
    a_set_sprite_frame 7
    a_wait 120
    a_set_sprite_frame 5
    a_wait 90
    a_set_sprite_frame 7
    a_wait 60
    a_set_sprite_frame 5
    a_wait 120
    a_jump L_802398A

    .align 2, 0

NPC_080239A0:
    a_init
    a_set_dialog 0x0
    a_set_sprite_long 0x111
    a_set_pos_16 8, -128
    a_set_sprite_frame 0
L_80239AF:
    a_set_no_z_clip
    a_clear_z_clip
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
    .word NPC_08023A08
    .word NPC_08023A30
    .word NPC_08023A5C
    .word NPC_08023A88
    .word NPC_08023AB4
    .word NPC_08023ACC
    .word NPC_08023AE4
    .word NPC_08023AFC
    .word NPC_08023B20
    .word NPC_08023B44
    .word 0xFF

NPC_08023A08:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x5D
    a_set_pos_16 -104, -48
    a_set_sprite_frame 7
    a_wait 100
    a_set_sprite_frame 12
    a_wait 10
    a_set_sprite_frame 13
    a_wait 120
    a_set_sprite_frame 1
    a_wait 120
    a_set_sprite_frame 5
L_8023A26:
    a_wait 1
    a_jump L_8023A26

    .align 2, 0

NPC_08023A30:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x116
    a_set_pos_16 -126, -82
    a_set_palette 0x2
    a_wait 180
L_8023A43:
    a_set_sprite_frame 1
    a_wait 15
    a_set_sprite_frame 0
    a_wait 20
    a_set_sprite_frame 1
    a_wait 15
    a_set_sprite_frame 0
    a_wait 50
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_8023A43

    .align 2, 0

NPC_08023A5C:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x116
    a_set_pos_16 -62, -82
    a_set_palette 0x1
    a_wait 180
L_8023A6F:
    a_set_sprite_frame 1
    a_wait 15
    a_set_sprite_frame 0
    a_wait 10
    a_set_sprite_frame 1
    a_wait 15
    a_set_sprite_frame 0
    a_wait 20
    a_set_sprite_frame 1
    a_wait 40
    a_jump L_8023A6F

NPC_08023A88:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x116
    a_set_pos_16 -22, -82
    a_set_palette 0x0
    a_wait 180
L_8023A9B:
    a_set_sprite_frame 1
    a_wait 15
    a_set_sprite_frame 0
    a_wait 20
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 0
    a_wait 20
    a_set_sprite_frame 1
    a_wait 15
    a_jump L_8023A9B

NPC_08023AB4:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x11C
    a_set_pos_16 -52, 22
    a_set_sprite_frame 1
L_8023AC5:
    a_wait 1
    a_jump L_8023AC5

NPC_08023ACC:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x11C
    a_set_pos_16 44, -26
    a_set_sprite_frame 1
L_8023ADD:
    a_wait 1
    a_jump L_8023ADD

NPC_08023AE4:
    a_init
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x11C
    a_set_pos_16 44, 70
    a_set_sprite_frame 1
L_8023AF5:
    a_wait 1
    a_jump L_8023AF5

NPC_08023AFC:
    a_init_nosprite
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x39
    a_set_pos_16 64, -48
    a_set_sprite_frame 10
    a_wait 110
    a_init
    a_dir d_sw, 16, 14
    a_set_sprite_frame 18
L_8023B16:
    a_wait 1
    a_jump L_8023B16

    .align 2, 0

NPC_08023B20:
    a_init_nosprite
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0x8
    a_set_pos_16 -76, 68
    a_set_sprite_frame 15
    a_wait 120
    a_init
    a_dir d_nw, 32, 10
    a_set_sprite_frame 49
L_8023B3A:
    a_wait 1
    a_jump L_8023B3A

    .align 2, 0

NPC_08023B44:
    a_init_nosprite
    a_cmd_0E_set_flag_1
    a_enable_dialog
    a_set_dialog 0x0
    a_set_sprite_long 0xCE
    a_set_pos_16 -98, -22, 32
    a_set_sprite_frame 0
    a_wait 130
    a_init
    a_set_sprite_long 0xDA
    a_set_sprite_frame 0
    a_wait 1
    a_set_no_z_clip
    a_clear_z_clip
    a_set_pos_16 -98, -22, 32
    a_wait 1
    a_set_pos_16 -98, -22, 32
    a_wait 1
    a_set_pos_16 -98, -22, 33
    a_wait 1
    a_set_pos_16 -98, -22, 33
    a_wait 1
    a_set_pos_16 -98, -22, 34
    a_wait 1
    a_set_pos_16 -98, -22, 34
    a_wait 1
    a_set_pos_16 -98, -22, 35
    a_wait 1
    a_set_pos_16 -98, -22, 35
    a_wait 1
    a_set_pos_16 -98, -22, 36
    a_wait 1
    a_wait 20
    a_destroy

    .align 2, 0

CSD_Entity_11:
    entity Effect, 0x1, f(-94.0), f(-26.0), f(0.0), 0x3D
    .word 0xFF

global_label CSD_Task_11_5
    task_direct 5, 0x2006E10, 0x8, 180
    task_direct_arg 0x84D39AC
L_8023BE4:
    task_direct_arg 0x878B7D4, 10
    task_direct_arg 0x878B834, 20
    task_direct_arg 0x878B774, 5
    task_direct_arg 0x878B814, 10
    task_direct_arg 0x878B794, 20
    task_direct_arg 0x878B7F4, 5
    task_direct_arg 0x878B7B4, 10
    task_jump L_8023BE4

    .align 2, 0

CSD_Cam_12:
    cam_set 180, 4, 0
    cam_move -64, -64, 0, 180
    cam_wait 60
    cam_end

CSD_NPC_12:
    .word NPC_08023C54
    .word NPC_08023C6F
    .word NPC_08023C82
    .word NPC_08023C95
    .word NPC_08023CA8
    .word 0xFF

    .align 2, 0

NPC_08023C54:
    a_init
    a_set_sprite 0x4E
    a_set_pos_16 116, -42
    a_set_sprite_frame 12
    a_wait 60
    a_set_sprite_frame 13
    a_wait 5
    a_set_sprite_frame 14
L_8023C68:
    a_wait 1
    a_jump L_8023C68

NPC_08023C6F:
    a_init
    a_set_sprite 0x4F
    a_set_pos_16 114, -68
    a_set_sprite_frame 5
L_8023C7B:
    a_wait 1
    a_jump L_8023C7B

NPC_08023C82:
    a_init
    a_set_sprite 0x50
    a_set_pos_16 54, -36
    a_set_sprite_frame 1
L_8023C8E:
    a_wait 1
    a_jump L_8023C8E

NPC_08023C95:
    a_init
    a_set_sprite 0x2E
    a_set_pos_16 54, -54
    a_set_sprite_frame 1
L_8023CA1:
    a_wait 1
    a_jump L_8023CA1

NPC_08023CA8:
    a_init
    a_set_sprite 0x15
    a_set_pos_16 54, -14
    a_set_sprite_frame 1
L_8023CB4:
    a_wait 1
    a_jump L_8023CB4

    .align 2, 0

CSD_Entity_12:
    entity Effect, 0x1, f(100.0), f(-104.0), f(32.0), 0x41
    entity Effect, 0x1, f(52.0), f(-104.0), f(32.0), 0x42
    entity Effect, 0x1, f(4.0), f(-104.0), f(32.0), 0x43
    entity Effect, 0x1, f(-44.0), f(-104.0), f(32.0), 0x44
    .word 0xFF

CSD_Cam_13:
    cam_set -64, -64, 0
    cam_move 64, 64, 0, 360
    cam_end

CSD_NPC_13:
    .word NPC_08023D34
    .word NPC_08023D4A
    .word NPC_08023D64
    .word 0xFF

    .align 2, 0

NPC_08023D34:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xE0
    a_set_pos_16 34, 70, 8
    a_set_sprite_frame 0
L_8023D42:
    a_set_no_z_clip
    a_wait 1
    a_jump L_8023D42

NPC_08023D4A:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x12
    a_set_pos_16 -56, -12
    a_set_sprite_frame 0
    a_set_no_z_clip
    a_wait 120
    a_set_sprite_frame 1
L_8023D5D:
    a_wait 1
    a_jump L_8023D5D

NPC_08023D64:
    a_init_nosprite
    a_set_dialog 0x0
    a_set_sprite 0x8
    a_set_pos_16 0, -16
    a_wait 120
    a_init
    a_set_sprite_frame 40
    a_wait 64
    a_set_sprite_frame 5
    a_set_sprite_frame 13
    a_dir d_sw, 4, 2
    a_set_sprite_frame 5
L_8023D81:
    a_wait 1
    a_jump L_8023D81

CSD_Entity_13:
    .word 0xFF

