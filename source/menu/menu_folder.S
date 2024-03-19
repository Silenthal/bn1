#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc
    .set BuildChipSack, 0x3007518+1
    .set Menu_PrintToBuffer, 0x801bdec
    .set tilemapUpDownArrows, 0x801c148
    .set SortSack, 0x30072b8+1
    .set SortSackReverse, 0x3007360+1
    .set listDefaultSort, 0x30072b0

tilemapFolderList:
    .incbin "images/start_menu/folder/folder_list.tilemap"
global_label tilemapFolderBlank
    .incbin "images/start_menu/folder/blank.tilemap"
global_label tilemapFolderSackList
    .incbin "images/start_menu/folder/sack_list.tilemap"
tilemapFolderListBlank:
    .incbin "images/start_menu/folder/list_blank.tilemap"
global_label tilemapSmallList
    .incbin "images/start_menu/folder/small_list.tilemap"


_ts Menu_0_Folder
    push       {lr}
    ldr        r0,PTR_PTR_M_Folder_0_Init_0801a1d4
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0
PTR_M_Folder_0_Init_08019eb4:
    .word M_Folder_0_Init
    .word M_Folder_1_Main
    .word M_Folder_2_Close
    .word M_Folder_3_MoveToFolder
    .word M_Folder_4_MoveToSack
    .word M_Folder_5_Sort


_ts M_Folder_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801a1d8
    ldr        r1,PTR_DAT_0801a1dc
    ldr        r2,DAT_0801a1e0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801a1e4
    ldr        r1,PTR_eBgPalette4_0801a1e8
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801a1ec
    ldr        r1,PTR_DAT_0801a1f0
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuUpDownArrow_0801a1f4
    ldr        r1,PTR_DAT_0801a1f8
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetChipLibraryNumbers_0801a1fc
    ldr        r1,PTR_DAT_0801a200
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801a204
    ldr        r1,PTR_eBgPaletteF_0801a208
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801a1ec
    ldr        r1,PTR_DAT_0801a20c
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801a1e4
    ldr        r1,PTR_eObjPalette0_0801a210
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_gFillValue_0801a214
    ldr        r1,PTR_gChipBag_0801a218
    ldr        r2,PTR_DAT_0801a21c
    mov        r3,#0x3
    ldr        r4,DAT_0801a220
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_textDict_MenuMessages_0801a224
    mov        r1,#0x1
    ldr        r2,PTR_DAT_0801a228
    ldr        r3,PTR_DAT_0801a22c
    mov        r4,#0x1
    mov        r5,#0x1
    mov        r7,#0x0
    ldr        r6,PTR_tilesetDialogueText_0801a230
    bl         Text_CopyCharTileUI
    ldr        r0,PTR_textDict_MenuMessages_0801a224
    mov        r1,#0x4
    ldr        r2,PTR_gSpriteDecompLocation1_0801a234
    ldr        r3,PTR_DAT_0801a238
    mov        r4,#0x8
    mov        r5,#0x8
    mov        r7,#0x0
    ldr        r6,PTR_tilesetDialogueText_0801a230
    bl         Text_CopyCharTileUI
    pop        {r5}
    ldr        r0,PTR_BuildChipSack_0801a23c
    mov        lr,pc
    bx         r0
    strh       r0,[r5,#0x24]
    mov        r0,#0x0
    ldr        r1,PTR_gFolder_0801a240
    bl         Menu_Folder_PrintChips
    mov        r0,#0x0
    ldr        r1,PTR_gChipBag_0801a218
    bl         Menu_LoadSackPageInfo
    push       {r5}
    ldr        r7,PTR_gFolder_0801a244
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Menu_LoadChipData
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapFolderFrameFolder_0801a248
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801a24c
    add        r1,r1,r2
    ldr        r2,DAT_0801a250
    bl         Dma_TransferListAdd
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DispCnt_0801a254
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
    bl         Video_ClearAllTile0Maps
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#0x12]
    strh       r0,[r5,#0x14]
    strh       r0,[r5,#0x16]
    strh       r0,[r5,#0x18]
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1a]
    strh       r0,[r5,#0x10]
    mov        r0,#0x20
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    mov        r0,#0x6
    mov        r6,#0x44
    strh       r0,[r5,r6]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    push       {r5}
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x5
    bl         Flag_Clear400
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}


_ts M_Folder_1_Main
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0801a01a
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801a01a
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    bl         Menu_Folder_HandleInput
LAB_0801a01a:
    bl         Menu_Folder_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts M_Folder_2_Close
    push       {lr}
    bl         Menu_Folder_DrawUI
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801a08e
    push       {r5,r7}
    bl         Inventory_InitChecksum
    bl         Inventory_InitChecksumIndex
    ldrh       r0,[r5,#0x24]
    bl         InitInventoryChecksumFromChipBag
    pop        {r5,r7}
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801a05c
    mov        r1,#0x4
LAB_0801a05c:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801a258
    ldr        r1,PTR_eBgPaletteF_0801a25c
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801a08e:
    mov        r0,#0x0
    pop        {pc}


_ts M_Folder_3_MoveToFolder
    push       {lr}
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    add        r0,#0x2
    strb       r0,[r5,#0xc]
    cmp        r0,#0x20
    bne        LAB_0801a0a6
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0801a0a6:
    bl         Menu_Folder_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts M_Folder_4_MoveToSack
    push       {lr}
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    sub        r0,#0x2
    strb       r0,[r5,#0xc]
    cmp        r0,#0x2
    bne        LAB_0801a0c2
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_0801a0c2:
    bl         Menu_Folder_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Folder_DrawUI
    push       {r5,lr}
    ldrb       r2,[r5,#0xc]
    cmp        r2,#0x10
    blt        LAB_0801a116
    ldrh       r0,[r5,#0x16]
    ldrh       r1,[r5,#0x12]
    ldrb       r3,[r5,#0x11]
    cmp        r3,#0xff
    bne        LAB_0801a0e4
    mov        r3,#0x0
    strb       r3,[r5,#0x11]
    b          LAB_0801a0f6
LAB_0801a0e4:
    cmp        r2,#0x10
    beq        LAB_0801a0f6
    ldrh       r2,[r5,#0x18]
    cmp        r0,r2
    bne        LAB_0801a0f6
    ldrh       r2,[r5,#0x14]
    cmp        r1,r2
    bne        LAB_0801a0f6
    b          LAB_0801a158
LAB_0801a0f6:
    push       {r0,r1}
    ldr        r1,PTR_gFolder_0801a260
    bl         Menu_Folder_PrintChips
    pop        {r0,r1}
    push       {r5}
    add        r0,r0,r1
    ldr        r7,PTR_gFolder_0801a264
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    bl         Menu_LoadChipData
    pop        {r5}
    b          LAB_0801a158
LAB_0801a116:
    ldrh       r0,[r5,#0x20]
    ldrh       r1,[r5,#0x1c]
    ldrb       r3,[r5,#0x11]
    cmp        r3,#0xff
    bne        LAB_0801a126
    mov        r3,#0x0
    strb       r3,[r5,#0x11]
    b          LAB_0801a138
LAB_0801a126:
    cmp        r2,#0xe
    beq        LAB_0801a138
    ldrh       r2,[r5,#0x22]
    cmp        r0,r2
    bne        LAB_0801a138
    ldrh       r2,[r5,#0x1e]
    cmp        r1,r2
    bne        LAB_0801a138
    b          LAB_0801a158
LAB_0801a138:
    push       {r0,r1}
    ldr        r1,PTR_gChipBag_0801a218
    bl         Menu_LoadSackPageInfo
    pop        {r0,r1}
    push       {r5}
    add        r0,r0,r1
    ldr        r7,PTR_gChipBag_0801a218
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    ldr        r0,[r7,#0x18]
    ldr        r1,[r7,#0x8]
    lsr        r1,r1,#0x10
    bl         Menu_LoadChipData
    pop        {r5}
LAB_0801a158:
    bl         Menu_Folder_DrawFolderSackList
    bl         Menu_Folder_DrawSortList
    ldrh       r0,[r5,#0x16]
    bl         Menu_Folder_DrawFolderList
    ldrh       r0,[r5,#0x20]
    bl         Menu_Folder_DrawSackList
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x14
    beq        LAB_0801a1aa
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0xf
    bge        LAB_0801a18c
    sub        r0,#0x1f
    add        r0,#0x30
    ldrh       r2,[r5,#0x20]
    ldrh       r3,[r5,#0x1c]
    add        r2,r2,r3
    ldr        r7,PTR_gChipBag_0801a218
    lsl        r2,r2,#0x5
    add        r7,r7,r2
    ldr        r2,[r7,#0x18]
    b          LAB_0801a19c
LAB_0801a18c:
    sub        r0,#0x1f
    ldrh       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x12]
    add        r2,r2,r3
    ldr        r7,PTR_gFolder_0801a268
    lsl        r2,r2,#0x1
    add        r7,r7,r2
    ldrb       r2,[r7,#0x0]
LAB_0801a19c:
    tst        r2,r2
    beq        LAB_0801a1aa
    mov        r1,#0x0
    push       {r5}
    bl         Menu_ShowChipDetail
    pop        {r5}
LAB_0801a1aa:
    ldrb       r0,[r5,#0xf]
    add        r0,#0x1
    cmp        r0,#0x12
    blt        LAB_0801a1b4
    mov        r0,#0x0
LAB_0801a1b4:
    strb       r0,[r5,#0xf]
    mov        r0,#0x0
    mov        r1,#0x0
    bl         Menu_Folder_DrawUpDownArrows
    mov        r0,#0xa
    mov        r1,#0x12
    bl         Menu_Folder_DrawUpDownArrows
    bl         Menu_Folder_DrawSortMenuArrow
    bl         Menu_Folder_DrawDeckCount
    bl         Menu_Folder_DrawSwitchArrow
    pop        {r5,pc}

    .align 2, 0
PTR_PTR_M_Folder_0_Init_0801a1d4:
    .word PTR_M_Folder_0_Init_08019eb4
PTR_tilesetMenuDesign_0801a1d8:
    .word tilesetMenuDesign
PTR_DAT_0801a1dc:
    .word 0x6000020
DAT_0801a1e0:
    .word 0x540
PTR_paletteMenuDesign_0801a1e4:
    .word paletteMenuDesign
PTR_eBgPalette4_0801a1e8:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801a1ec:
    .word tilesetMenuSideArrow
PTR_DAT_0801a1f0:
    .word 0x6004020
PTR_tilesetMenuUpDownArrow_0801a1f4:
    .word tilesetMenuUpDownArrow
PTR_DAT_0801a1f8:
    .word 0x6004240
PTR_tilesetChipLibraryNumbers_0801a1fc:
    .word tilesetChipLibraryNumbers
PTR_DAT_0801a200:
    .word 0x6003c00
PTR_paletteMenuSideArrow_0801a204:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801a208:
    .word eBgPaletteF
PTR_DAT_0801a20c:
    .word 0x6010020
PTR_eObjPalette0_0801a210:
    .word eObjPalette0
PTR_gFillValue_0801a214:
    .word gFillValue
PTR_gChipBag_0801a218:
    .word gChipBag
PTR_DAT_0801a21c:
    .word 0x2900
DAT_0801a220:
    .word 0x85000000
PTR_textDict_MenuMessages_0801a224:
    .word textDict_MenuMessages
PTR_DAT_0801a228:
    .word 0x2012200
PTR_DAT_0801a22c:
    .word 0x6005c00
PTR_tilesetDialogueText_0801a230:
    .word tilesetDialogueText
PTR_gSpriteDecompLocation1_0801a234:
    .word gSpriteDecompLocation1
PTR_DAT_0801a238:
    .word 0x6002c00
PTR_BuildChipSack_0801a23c:
    .word BuildChipSack
PTR_gFolder_0801a240:
    .word gFolder
PTR_gFolder_0801a244:
    .word gFolder
PTR_tilemapFolderFrameFolder_0801a248:
    .word tilemapFolderFrameFolder
DAT_0801a24c:
    .word 0x800
DAT_0801a250:
    .word 0x140
DispCnt_0801a254:
    .word 0x1F40
PTR_paletteKeyboardNumberChars_0801a258:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801a25c:
    .word eBgPaletteF
PTR_gFolder_0801a260:
    .word gFolder
PTR_gFolder_0801a264:
    .word gFolder
PTR_gFolder_0801a268:
    .word gFolder


_ts Menu_Folder_DrawFolderSackList
    push       {r5,lr}
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    push       {r0}
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderFrameFolder_0801a660
    mov        r4,#0x20
    mov        r5,#0x14
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0}
    add        r0,#0x1e
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderFrameSack_0801a664
    mov        r4,#0x20
    mov        r5,#0x14
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5,pc}


_ts Menu_Folder_PrintChips
    push       {r5,lr}
    add        r5,r1,#0x0
    lsl        r0,r0,#0x1
    add        r5,r5,r0
    push       {r5}
    ldr        r0,PTR_TextData_BattleChip_Names_0801a668
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801a66c
    ldr        r3,PTR_DAT_0801a670
    ldr        r6,PTR_tilesetDialogueText_0801a674
LAB_0801a2ac:
    push       {r0,r1,r2,r3,r5,r6}
    ldrb       r1,[r5,#0x0]
    mov        r4,#0x8
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x4
    add        r2,r2,r4
    add        r3,r3,r4
    add        r5,#0x2
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a2ac
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_TextData_BattleChip_Codes_0801a678
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801a67c
    ldr        r3,PTR_DAT_0801a680
    ldr        r6,PTR_tilesetDialogueText_0801a674
LAB_0801a2da:
    push       {r0,r1,r2,r3,r5,r6}
    ldrb       r1,[r5,#0x1]
    cmp        r1,#0xff
    bne        LAB_0801a2e4
    mov        r1,#0x0
LAB_0801a2e4:
    mov        r4,#0x2
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x3
    add        r2,r2,r4
    add        r3,r3,r4
    add        r5,#0x2
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a2da
    pop        {r5}
    ldr        r1,PTR_DAT_0801a684
    mov        r7,#0x0
LAB_0801a306:
    push       {r1,r5,r7}
    ldrb       r0,[r5,#0x0]
    bl         BattleChip_GetChipData
    pop        {r1,r5,r7}
    push       {r1,r5,r7}
    ldrb       r2,[r0,#0x5]
    lsl        r2,r2,#0x7
    ldr        r0,PTR_tilesetElements_0801a688
    add        r0,r0,r2
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        {r1,r5,r7}
    add        r1,#0x80
    add        r1,#0x80
    add        r5,#0x2
    add        r7,#0x1
    cmp        r7,#0x7
    blt        LAB_0801a306
    pop        {r5,pc}


_ts Menu_Folder_DrawFolderList
    push       {r5,lr}
    ldr        r7,PTR_gFolder_0801a68c
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    push       {r0,r7}
    add        r0,#0xf
    mov        r1,#0x4
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderList_0801a690
    mov        r4,#0xb
    mov        r5,#0xe
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r7}
    mov        r1,#0x0
LAB_0801a352:
    ldrb       r2,[r7,#0x0]
    tst        r2,r2
    bne        LAB_0801a376
    push       {r0,r1,r7}
    mov        r3,#0x1
    and        r3,r1
    lsl        r3,r3,#0x6
    ldr        r2,PTR_tilemapFolderListBlank_0801a694
    add        r3,r3,r2
    add        r0,#0xf
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x1
    mov        r4,#0xe
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r1,r7}
LAB_0801a376:
    add        r7,#0x2
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a352
    pop        {r5,pc}


_ts Menu_Folder_DrawUpDownArrows
    push       {lr}
    mov        r8,r0
    mov        r9,r1
    push       {r5}
    ldrb       r0,[r5,#0xd]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0xd
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0801a698
    mov        r4,#0x2
    mov        r5,#0xe
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#0xd]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0801a69c
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#0xd]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0801a6a0
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x14
    beq        LAB_0801a40c
    mov        r0,#0x1a
    add        r0,r8
    ldrh       r0,[r5,r0]
    tst        r0,r0
    beq        LAB_0801a46c
    ldrb       r1,[r5,#0xf]
    ldr        r3,PTR_tilemapListSideArrow_0801a6a4
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0xd
    mov        r1,#0x12
    add        r1,r8
    ldrh       r1,[r5,r1]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
LAB_0801a40c:
    mov        r0,#0x1a
    add        r0,r8
    ldrh       r0,[r5,r0]
    cmp        r0,#0x7
    ble        LAB_0801a46c
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    mov        r0,#0x16
    add        r0,r8
    ldrh       r0,[r5,r0]
    ldr        r3,PTR_tilemapUpDownArrows_0801a6a8
    add        r3,r3,r1
    cmp        r0,#0x0
    beq        LAB_0801a446
    push       {r0,r3,r5}
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r3,r5}
LAB_0801a446:
    mov        r1,#0x1a
    add        r1,r8
    ldrh       r1,[r5,r1]
    sub        r1,#0x7
    cmp        r0,r1
    beq        LAB_0801a46c
    push       {r5}
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    add        r0,r9
    add        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
LAB_0801a46c:
    pop        {pc}


_ts Menu_Folder_DrawDeckCount
    push       {lr}
    ldrb       r0,[r5,#0xd]
    sub        r0,#0x20
    push       {r0,r5}
    add        r0,#0x13
    mov        r1,#0x0
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0801a6ac
    mov        r4,#0x4
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r5}
    ldrb       r0,[r5,#0x10]
    mov        r1,#0x4
    cmp        r0,#0x1e
    beq        LAB_0801a494
    mov        r1,#0x5
LAB_0801a494:
    bl         Menu_PrintToBuffer
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    push       {r0,r5}
    add        r0,#0x13
    mov        r1,#0x0
    mov        r2,#0x2
    add        r3,r5,#0x0
    add        r3,#0x2c
    mov        r4,#0x4
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r5}
    pop        {pc}


_ts Menu_LoadSackPageInfo
    push       {r5,lr}
    add        r5,r1,#0x0
    lsl        r0,r0,#0x5
    add        r5,r5,r0
    push       {r5}
    ldr        r0,PTR_TextData_BattleChip_Names_0801a668
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801a6b0
    ldr        r3,PTR_DAT_0801a6b4
    ldr        r6,PTR_tilesetDialogueText_0801a674
LAB_0801a4c8:
    push       {r0,r1,r2,r3,r5,r6}
    ldr        r1,[r5,#0x18]
    mov        r4,#0x8
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x4
    add        r2,r2,r4
    add        r3,r3,r4
    add        r5,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a4c8
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_TextData_BattleChip_Codes_0801a678
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801a6b8
    ldr        r3,PTR_DAT_0801a6bc
    ldr        r6,PTR_tilesetDialogueText_0801a674
LAB_0801a4f6:
    push       {r0,r1,r2,r3,r5,r6}
    ldr        r1,[r5,#0x8]
    lsr        r1,r1,#0x10
    cmp        r1,#0xff
    bne        LAB_0801a502
    mov        r1,#0x0
LAB_0801a502:
    mov        r4,#0x2
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x3
    add        r2,r2,r4
    add        r3,r3,r4
    add        r5,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a4f6
    pop        {r5}
    push       {r5}
    ldr        r1,PTR_DAT_0801a6c0
    mov        r7,#0x0
LAB_0801a526:
    push       {r1,r5,r7}
    ldr        r2,[r5,#0x10]
    lsr        r2,r2,#0x10
    lsl        r2,r2,#0x7
    ldr        r0,PTR_tilesetElements_0801a688
    add        r0,r0,r2
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        {r1,r5,r7}
    add        r1,#0x80
    add        r1,#0x80
    add        r5,#0x20
    add        r7,#0x1
    cmp        r7,#0x7
    blt        LAB_0801a526
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801a6c4
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801a6c8
    ldr        r3,PTR_DAT_0801a6cc
    ldr        r6,PTR_tilesetDialogueText_0801a674
LAB_0801a554:
    push       {r0,r1,r2,r3,r5,r6}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    ldr        r4,[r5,#0x14]
    lsr        r4,r4,#0x10
    str        r4,[r7,#0x4]
    mov        r1,#0x0
    mov        r4,#0x2
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x2
    add        r2,r2,r4
    add        r3,r3,r4
    add        r5,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a554
    pop        {r5}
    pop        {r5,pc}


_ts Menu_Folder_DrawSackList
    push       {r5,lr}
    ldr        r7,PTR_gChipBag_0801a6d0
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    add        r0,#0x12
    push       {r0,r7}
    add        r0,#0xf
    mov        r1,#0x4
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderSackList_0801a6d4
    mov        r4,#0xe
    mov        r5,#0xe
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r7}
    mov        r1,#0x0
LAB_0801a5a8:
    ldr        r2,[r7,#0x18]
    tst        r2,r2
    bne        LAB_0801a5cc
    push       {r0,r1,r7}
    mov        r3,#0x1
    and        r3,r1
    lsl        r3,r3,#0x6
    ldr        r2,PTR_tilemapFolderListBlank_0801a6d8
    add        r3,r3,r2
    add        r0,#0xf
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x1
    mov        r4,#0xe
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r1,r7}
LAB_0801a5cc:
    add        r7,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801a5a8
    pop        {r5,pc}


_ts Menu_Folder_DrawSwitchArrow
    push       {lr}
    ldrb       r0,[r5,#0x11]
    tst        r0,r0
    beq        LAB_0801a63a
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x2
    and        r1,r7
    cmp        r1,#0x0
    beq        LAB_0801a63a
    add        r7,r5,#0x0
    add        r7,#0x26
    ldrh       r1,[r7,#0x0]
    ldrh       r2,[r7,#0x2]
    ldrh       r3,[r7,#0x4]
    add        r2,r2,r3
    add        r7,r5,#0x0
    add        r7,r7,r1
    ldrh       r1,[r7,#0x4]
    sub        r2,r2,r1
    blt        LAB_0801a63a
    cmp        r2,#0x7
    bge        LAB_0801a63a
    add        r2,#0x2
    lsl        r2,r2,#0x4
    ldr        r3,PTR_DAT_0801a6dc
    ldrb       r1,[r3,r0]
    ldrb       r0,[r5,#0xc]
    sub        r0,#0x20
    add        r0,r0,r1
    lsl        r0,r0,#0x3
    mov        r1,#0x10
    lsl        r1,r1,#0x4
    add        r1,#0xff
    and        r1,r0
    push       {r5}
    add        r1,#0x2
    sub        r2,#0x2
    ldr        r0,DAT_0801a6e0
    lsl        r1,r1,#0x10
    orr        r0,r1
    orr        r0,r2
    ldr        r1,DAT_0801a6e4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
LAB_0801a63a:
    pop        {pc}

    .align 2, 0

DAT_0801a63c:
    .byte 0xFF, 0x0D, 0x1F, 0x00


_ts Folder_GetChipCount
    lsl        r1,r1,#0x8
    orr        r0,r1
    ldr        r7,PTR_gFolder_0801a6e8
    mov        r6,#0x0
    mov        r4,#0x0
LAB_0801a64a:
    ldrh       r2,[r7,#0x0]
    cmp        r0,r2
    bne        LAB_0801a652
    add        r6,#0x1
LAB_0801a652:
    add        r7,#0x2
    add        r4,#0x1
    cmp        r4,#0x1e
    blt        LAB_0801a64a
    add        r0,r6,#0x0
    mov        pc,lr

    .align 2, 0

PTR_tilemapFolderFrameFolder_0801a660:
    .word tilemapFolderFrameFolder
PTR_tilemapFolderFrameSack_0801a664:
    .word tilemapFolderFrameSack
PTR_TextData_BattleChip_Names_0801a668:
    .word TextData_BattleChip_Names
PTR_DAT_0801a66c:
    .word 0x2011400
PTR_DAT_0801a670:
    .word 0x6004400
PTR_tilesetDialogueText_0801a674:
    .word tilesetDialogueText
PTR_TextData_BattleChip_Codes_0801a678:
    .word TextData_BattleChip_Codes
PTR_DAT_0801a67c:
    .word 0x2012400
PTR_DAT_0801a680:
    .word 0x6005400
PTR_DAT_0801a684:
    .word 0x6005480
PTR_tilesetElements_0801a688:
    .word tilesetElements
PTR_gFolder_0801a68c:
    .word gFolder
PTR_tilemapFolderList_0801a690:
    .word tilemapFolderList
PTR_tilemapFolderListBlank_0801a694:
    .word tilemapFolderListBlank
PTR_tilemapFolderBlank_0801a698:
    .word tilemapFolderBlank
PTR_tilemapFolderBlank_0801a69c:
    .word tilemapFolderBlank
PTR_tilemapFolderBlank_0801a6a0:
    .word tilemapFolderBlank
PTR_tilemapListSideArrow_0801a6a4:
    .word tilemapListSideArrow
PTR_tilemapUpDownArrows_0801a6a8:
    .word tilemapUpDownArrows
PTR_tilemapFolderBlank_0801a6ac:
    .word tilemapFolderBlank
PTR_DAT_0801a6b0:
    .word 0x2013400
PTR_DAT_0801a6b4:
    .word 0x6005e00
PTR_DAT_0801a6b8:
    .word 0x2014400
PTR_DAT_0801a6bc:
    .word 0x6006e00
PTR_DAT_0801a6c0:
    .word 0x6006e80
PTR_textDict_MenuMessages_0801a6c4:
    .word textDict_MenuMessages
PTR_DAT_0801a6c8:
    .word 0x2015200
PTR_DAT_0801a6cc:
    .word 0x6007600
PTR_gChipBag_0801a6d0:
    .word gChipBag
PTR_tilemapFolderSackList_0801a6d4:
    .word tilemapFolderSackList
PTR_tilemapFolderListBlank_0801a6d8:
    .word tilemapFolderListBlank
PTR_DAT_0801a6dc:
    .word 0x801a63c
DAT_0801a6e0:
    .word 0x40000000
DAT_0801a6e4:
    .word 0xC01
PTR_gFolder_0801a6e8:
    .word gFolder


_ts Menu_Folder_SelectChip
    push       {lr}
    ldrb       r0,[r5,#0x11]
    tst        r0,r0
    bne        LAB_0801a720
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x20
    bne        LAB_0801a70a
    mov        r0,#0x1
    mov        r1,#0x12
    ldrh       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x12]
    b          LAB_0801a712
LAB_0801a70a:
    mov        r0,#0x2
    mov        r1,#0x1c
    ldrh       r2,[r5,#0x20]
    ldrh       r3,[r5,#0x1c]
LAB_0801a712:
    strb       r0,[r5,#0x11]
    add        r7,r5,#0x0
    add        r7,#0x26
    strh       r1,[r7,#0x0]
    strh       r2,[r7,#0x2]
    strh       r3,[r7,#0x4]
    pop        {pc}
LAB_0801a720:
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x20
    bne        LAB_0801a72a
    mov        r0,#0x1
    b          LAB_0801a72c
LAB_0801a72a:
    mov        r0,#0x2
LAB_0801a72c:
    ldrb       r1,[r5,#0x11]
    add        r0,r0,r1
    sub        r0,#0x2
    lsl        r0,r0,#0x2
    ldr        r1,PTR_PTR_Menu_Folder_Select_0_FolderToFolder
    ldr        r0,[r1,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_Menu_Folder_Select_0_FolderToFolder:
    .word PTR_Menu_Folder_Select_0_FolderToFolder
PTR_Menu_Folder_Select_0_FolderToFolder:
    .word Menu_Folder_Select_0_FolderToFolder
    .word Menu_Folder_Select_1_FolderSackSwap
    .word Menu_Folder_Select_2_SackToSack


_ts Menu_Folder_Cancel
    push       {lr}
    ldrb       r0,[r5,#0x11]
    tst        r0,r0
    bne        LAB_0801a770
    ldrb       r0,[r5,#0x10]
    cmp        r0,#0x1e
    blt        LAB_0801a77c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801a774
LAB_0801a770:
    mov        r0,#0x0
    strb       r0,[r5,#0x11]
LAB_0801a774:
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    pop        {pc}
LAB_0801a77c:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801aa74
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}


_ts Menu_Folder_Select_0_FolderToFolder
    push       {lr}
    ldr        r6,PTR_gFolder_0801aa78
    ldrh       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x12]
    add        r2,r2,r3
    lsl        r2,r2,#0x1
    add        r2,r2,r6
    add        r7,r5,#0x0
    add        r7,#0x26
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
    add        r0,r0,r1
    lsl        r0,r0,#0x1
    add        r0,r0,r6
    cmp        r0,r2
    beq        LAB_0801a7c0
    ldrh       r6,[r0,#0x0]
    ldrh       r7,[r2,#0x0]
    strh       r7,[r0,#0x0]
    strh       r6,[r2,#0x0]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    b          LAB_0801a7cc
LAB_0801a7c0:
    bl         Menu_Folder_HandleSameChipSelect
    cmp        r0,#0xff
    beq        LAB_0801a7cc
    bl         Sound_PlaySongImmediate
LAB_0801a7cc:
    mov        r0,#0xff
    strb       r0,[r5,#0x11]
    pop        {pc}


_ts Menu_Folder_Select_2_SackToSack
    push       {lr}
    ldr        r6,PTR_gChipBag_0801aa7c
    ldrh       r2,[r5,#0x20]
    ldrh       r3,[r5,#0x1c]
    add        r2,r2,r3
    lsl        r2,r2,#0x5
    add        r2,r2,r6
    add        r7,r5,#0x0
    add        r7,#0x26
    ldrh       r0,[r7,#0x2]
    ldrh       r1,[r7,#0x4]
    add        r0,r0,r1
    lsl        r0,r0,#0x5
    add        r0,r0,r6
    cmp        r0,r2
    beq        LAB_0801a83c
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
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    b          LAB_0801a860
LAB_0801a83c:
    push       {r2}
    ldr        r7,[r2,#0x18]
    mov        r6,#0x0
    bl         Menu_Folder_CheckFolderRules
    pop        {r2}
    beq        LAB_0801a85a
    ldr        r7,PTR_gFolder_0801aa80
    bl         Menu_Folder_MoveFromSackToFolder
    cmp        r0,#0xff
    beq        LAB_0801a860
    bl         Sound_PlaySongImmediate
    b          LAB_0801a860
LAB_0801a85a:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
LAB_0801a860:
    mov        r0,#0xff
    strb       r0,[r5,#0x11]
    pop        {pc}


_ts Menu_Folder_HandleSameChipSelect
    push       {lr}
    mov        r4,#0x0
    ldr        r7,PTR_gChipBag_0801aa7c
    ldrb       r0,[r2,#0x0]
    ldrb       r1,[r2,#0x1]
    tst        r0,r0
    beq        LAB_0801a8f2
    ldrh       r6,[r5,#0x24]
    tst        r6,r6
    beq        LAB_0801a8a0
LAB_0801a87c:
    ldr        r6,[r7,#0x18]
    cmp        r0,r6
    bne        LAB_0801a896
    ldr        r6,[r7,#0x8]
    lsr        r6,r6,#0x10
    cmp        r1,r6
    bne        LAB_0801a896
    ldr        r6,[r7,#0x14]
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    add        r6,r6,r3
    str        r6,[r7,#0x14]
    b          LAB_0801a8e2
LAB_0801a896:
    add        r7,#0x20
    add        r4,#0x1
    ldrh       r6,[r5,#0x24]
    cmp        r4,r6
    blt        LAB_0801a87c
LAB_0801a8a0:
    str        r0,[r7,#0x18]
    push       {r1,r2,r5,r7}
    bl         BattleChip_GetChipData
    pop        {r1,r2,r5,r7}
    ldrb       r4,[r0,#0x9]
    lsl        r6,r4,#0x8
    orr        r6,r1
    lsl        r3,r1,#0x10
    orr        r3,r6
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r6
    str        r3,[r7,#0x0]
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    orr        r3,r6
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r6
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r6
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r6
    str        r3,[r7,#0x10]
    ldrh       r6,[r5,#0x24]
    add        r6,#0x1
    strh       r6,[r5,#0x24]
LAB_0801a8e2:
    mov        r0,#0x0
    strb       r0,[r2,#0x0]
    strb       r0,[r2,#0x1]
    ldrb       r6,[r5,#0x10]
    sub        r6,#0x1
    strb       r6,[r5,#0x10]
    mov        r0,#0x67
    pop        {pc}
LAB_0801a8f2:
    mov        r0,#0x6c
    pop        {pc}


_ts Menu_Folder_MoveFromSackToFolder
    push       {lr}
    mov        r4,#0x0
    ldr        r0,[r2,#0x18]
    ldr        r1,[r2,#0x8]
    lsr        r1,r1,#0x10
    tst        r0,r0
    beq        LAB_0801a95a
LAB_0801a906:
    ldrb       r6,[r7,#0x0]
    tst        r6,r6
    bne        LAB_0801a912
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    b          LAB_0801a91e
LAB_0801a912:
    add        r7,#0x2
    add        r4,#0x1
    ldrh       r6,[r5,#0x1a]
    cmp        r4,r6
    blt        LAB_0801a906
    b          LAB_0801a95a
LAB_0801a91e:
    ldr        r1,[r2,#0x14]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    str        r1,[r2,#0x14]
    lsr        r1,r1,#0x10
    tst        r1,r1
    bne        LAB_0801a950
    mov        r0,#0x0
    str        r0,[r2,#0x0]
    str        r0,[r2,#0x4]
    str        r0,[r2,#0x8]
    str        r0,[r2,#0xc]
    str        r0,[r2,#0x10]
    str        r0,[r2,#0x14]
    str        r0,[r2,#0x18]
    str        r0,[r2,#0x1c]
    ldrh       r6,[r5,#0x24]
    sub        r6,#0x1
    strh       r6,[r5,#0x24]
    add        r3,r6,#0x0
    bl         Menu_Folder_OptimizeSackList
    bl         Menu_Folder_UpdateSackIndices
LAB_0801a950:
    ldrb       r6,[r5,#0x10]
    add        r6,#0x1
    strb       r6,[r5,#0x10]
    mov        r0,#0x67
    pop        {pc}
LAB_0801a95a:
    mov        r0,#0x6c
    pop        {pc}


_ts Menu_Folder_OptimizeSackList
    push       {r5,lr}
    mov        r0,#0x0
    ldr        r6,PTR_gChipBag_0801aa7c
LAB_0801a966:
    ldr        r4,[r6,#0x18]
    tst        r4,r4
    bne        LAB_0801a998
    add        r1,r0,#0x0
    add        r7,r6,#0x0
LAB_0801a970:
    ldr        r4,[r7,#0x20]
    str        r4,[r7,#0x0]
    ldr        r4,[r7,#0x24]
    str        r4,[r7,#0x4]
    ldr        r4,[r7,#0x28]
    str        r4,[r7,#0x8]
    ldr        r4,[r7,#0x2c]
    str        r4,[r7,#0xc]
    ldr        r4,[r7,#0x30]
    str        r4,[r7,#0x10]
    ldr        r4,[r7,#0x34]
    str        r4,[r7,#0x14]
    ldr        r4,[r7,#0x38]
    str        r4,[r7,#0x18]
    ldr        r4,[r7,#0x3c]
    str        r4,[r7,#0x1c]
    add        r1,#0x1
    add        r7,#0x20
    cmp        r1,r3
    blt        LAB_0801a970
LAB_0801a998:
    add        r0,#0x1
    add        r6,#0x20
    cmp        r0,r3
    blt        LAB_0801a966
    mov        r0,#0x0
    str        r0,[r6,#0x0]
    str        r0,[r6,#0x4]
    str        r0,[r6,#0x8]
    str        r0,[r6,#0xc]
    str        r0,[r6,#0x10]
    str        r0,[r6,#0x14]
    str        r0,[r6,#0x18]
    str        r0,[r6,#0x1c]
    pop        {r5,pc}


_ts Menu_Folder_UpdateSackIndices
    push       {lr}
    ldrh       r0,[r5,#0x24]
    cmp        r0,#0x6
    ble        LAB_0801a9ca
    ldrh       r1,[r5,#0x20]
    add        r1,#0x7
    cmp        r0,r1
    bge        LAB_0801a9d8
    sub        r0,#0x7
    strh       r0,[r5,#0x20]
    b          LAB_0801a9d8
LAB_0801a9ca:
    tst        r0,r0
    beq        LAB_0801a9d8
    sub        r0,#0x1
    ldrh       r1,[r5,#0x1c]
    cmp        r0,r1
    bgt        LAB_0801a9d8
    strh       r0,[r5,#0x1c]
LAB_0801a9d8:
    pop        {pc}


_ts Menu_Folder_Select_1_FolderSackSwap
    push       {lr}
    ldrb       r0,[r5,#0x11]
    cmp        r0,#0x1
    beq        LAB_0801aa22
    ldr        r6,PTR_gFolder_0801aa84
    ldrh       r2,[r5,#0x16]
    ldrh       r3,[r5,#0x12]
    add        r2,r2,r3
    lsl        r2,r2,#0x1
    add        r2,r2,r6
    ldr        r7,PTR_gChipBag_0801aa7c
    add        r4,r5,#0x0
    add        r4,#0x26
    ldrh       r3,[r4,#0x4]
    ldrh       r4,[r4,#0x2]
    add        r4,r4,r3
    lsl        r4,r4,#0x5
    add        r4,r4,r7
    ldrb       r6,[r2,#0x0]
    ldr        r7,[r4,#0x18]
    cmp        r6,r7
    beq        LAB_0801aa12
    push       {r2,r4}
    bl         Menu_Folder_CheckFolderRules
    pop        {r2,r4}
    beq        LAB_0801aa6a
LAB_0801aa12:
    push       {r2,r4}
    bl         Menu_Folder_HandleSameChipSelect
    pop        {r0,r2}
    add        r7,r0,#0x0
    bl         Menu_Folder_MoveFromSackToFolder
    b          LAB_0801aa5e
LAB_0801aa22:
    ldr        r6,PTR_gFolder_0801aa88
    add        r2,r5,#0x0
    add        r2,#0x26
    ldrh       r1,[r2,#0x4]
    ldrh       r2,[r2,#0x2]
    add        r2,r2,r1
    lsl        r2,r2,#0x1
    add        r2,r2,r6
    ldr        r7,PTR_gChipBag_0801aa7c
    ldrh       r3,[r5,#0x20]
    ldrh       r4,[r5,#0x1c]
    add        r3,r3,r4
    lsl        r3,r3,#0x5
    add        r3,r3,r7
    ldrb       r6,[r2,#0x0]
    ldr        r7,[r3,#0x18]
    cmp        r6,r7
    beq        LAB_0801aa50
    push       {r2,r3}
    bl         Menu_Folder_CheckFolderRules
    pop        {r2,r3}
    beq        LAB_0801aa6a
LAB_0801aa50:
    push       {r2,r3}
    bl         Menu_Folder_HandleSameChipSelect
    pop        {r0,r2}
    add        r7,r0,#0x0
    bl         Menu_Folder_MoveFromSackToFolder
LAB_0801aa5e:
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0xff
    strb       r0,[r5,#0x11]
    pop        {pc}
LAB_0801aa6a:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    pop        {pc}

    .align 2, 0

PTR_textDict_MenuMessages_0801aa74:
    .word textDict_MenuMessages
PTR_gFolder_0801aa78:
    .word gFolder
PTR_gChipBag_0801aa7c:
    .word gChipBag
PTR_gFolder_0801aa80:
    .word gFolder
PTR_gFolder_0801aa84:
    .word gFolder
PTR_gFolder_0801aa88:
    .word gFolder


_ts Menu_Folder_CheckFolderRules
    push       {r5,lr}
    add        r5,r6,#0x0
    ldr        r6,PTR_gFolder_0801ac1c
    mov        r0,#0x0
    mov        r2,#0x0
    mov        r3,#0x0
LAB_0801aa98:
    ldrb       r4,[r6,#0x0]
    cmp        r7,#0x94
    blt        LAB_0801aaae
    cmp        r4,#0x94
    blt        LAB_0801aaae
    cmp        r5,#0x94
    bge        LAB_0801aaae
    mov        r1,#0x5
    add        r0,#0x1
    cmp        r0,#0x5
    bge        LAB_0801aac6
LAB_0801aaae:
    cmp        r7,r4
    bne        LAB_0801aaba
    mov        r1,#0x2
    add        r3,#0x1
    cmp        r3,#0xa
    bge        LAB_0801aac6
LAB_0801aaba:
    add        r6,#0x2
    add        r2,#0x1
    cmp        r2,#0x1e
    blt        LAB_0801aa98
    mov        r0,#0x1
    b          LAB_0801aace
LAB_0801aac6:
    ldr        r0,PTR_textDict_MenuMessages_0801ac20
    bl         Text_LoadDialogue
    mov        r0,#0x0
LAB_0801aace:
    tst        r0,r0
    pop        {r5,pc}


_ts Menu_Folder_HandleInput
    push       {lr}
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x20
    bne        LAB_0801aae0
    mov        r0,#0x0
    b          LAB_0801aae2
LAB_0801aae0:
    mov        r0,#0xa
LAB_0801aae2:
    mov        r8,r0
    mov        r0,#0x12
    add        r0,r8
    ldrh       r1,[r5,r0]
    mov        r0,#0x14
    add        r0,r8
    strh       r1,[r5,r0]
    mov        r0,#0x16
    add        r0,r8
    ldrh       r1,[r5,r0]
    mov        r0,#0x18
    add        r0,r8
    strh       r1,[r5,r0]
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Get400
    mov        r5,r9
    beq        LAB_0801ab0e
    mov        r0,#0x8
    strb       r0,[r5,#0xe]
    b          LAB_0801ac1a
LAB_0801ab0e:
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_0801ab1a
    sub        r0,#0x1
    strb       r0,[r5,#0xe]
    b          LAB_0801ac1a
LAB_0801ab1a:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801ab2c
    bl         Menu_Folder_Cancel
    b          LAB_0801ac1a
LAB_0801ab2c:
    mov        r1,#0x8
    tst        r1,r0
    beq        LAB_0801ab38
    bl         Menu_Folder_Sort_Open
    b          LAB_0801ac1a
LAB_0801ab38:
    ldrb       r2,[r5,#0xc]
    mov        r1,#0x20
    tst        r1,r0
    beq        LAB_0801ab50
    cmp        r2,#0x20
    beq        LAB_0801ab50
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0xda
    bl         Sound_PlaySongImmediate
    b          LAB_0801ac1a
LAB_0801ab50:
    mov        r1,#0x10
    tst        r1,r0
    beq        LAB_0801ab66
    cmp        r2,#0x2
    beq        LAB_0801ab66
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0xda
    bl         Sound_PlaySongImmediate
    b          LAB_0801ac1a
LAB_0801ab66:
    mov        r6,#0x1a
    add        r6,r8
    ldrh       r6,[r5,r6]
    tst        r6,r6
    beq        LAB_0801ac1a
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801ab7c
    bl         Menu_Folder_SelectChip
    b          LAB_0801ac1a
LAB_0801ab7c:
    mov        r2,#0x12
    add        r2,r8
    ldrh       r2,[r5,r2]
    mov        r3,#0x16
    add        r3,r8
    ldrh       r3,[r5,r3]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_0801ac24
    tst        r4,r1
    beq        LAB_0801ab98
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_0801ab98:
    mov        r4,#0x7
    ldr        r1,DAT_0801ac28
    tst        r1,r0
    bne        LAB_0801abae
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801abb6
    sub        r2,r2,r4
    bge        LAB_0801abb6
    mov        r2,#0x0
LAB_0801abae:
    sub        r3,r3,r4
    bgt        LAB_0801abf2
    mov        r3,#0x0
    b          LAB_0801abf2
LAB_0801abb6:
    mov        r6,#0x1a
    add        r6,r8
    ldrh       r6,[r5,r6]
    sub        r6,#0x1
    mov        r4,#0x7
    ldr        r1,DAT_0801ac2c
    tst        r1,r0
    bne        LAB_0801abdc
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801abf2
    cmp        r6,#0x6
    blt        LAB_0801abd4
    mov        r6,#0x6
LAB_0801abd4:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801abf2
    add        r2,r6,#0x0
LAB_0801abdc:
    cmp        r6,#0x6
    blt        LAB_0801abf2
    mov        r6,#0x1a
    add        r6,r8
    ldrh       r6,[r5,r6]
    sub        r6,#0x7
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801abf2
    add        r3,r6,#0x0
    b          LAB_0801abf2
LAB_0801abf2:
    mov        r4,#0x12
    add        r4,r8
    ldrh       r4,[r5,r4]
    cmp        r2,r4
    bne        LAB_0801ac08
    mov        r4,#0x16
    add        r4,r8
    ldrh       r4,[r5,r4]
    cmp        r3,r4
    bne        LAB_0801ac08
    b          LAB_0801ac0e
LAB_0801ac08:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801ac0e:
    mov        r0,#0x12
    add        r0,r8
    strh       r2,[r5,r0]
    mov        r0,#0x16
    add        r0,r8
    strh       r3,[r5,r0]
LAB_0801ac1a:
    pop        {pc}
PTR_gFolder_0801ac1c:
    .word gFolder
PTR_textDict_MenuMessages_0801ac20:
    .word textDict_MenuMessages
DAT_0801ac24:
    .word 0x300
DAT_0801ac28:
    .word 0x200
DAT_0801ac2c:
    .word 0x100


_ts M_Folder_5_Sort
    push       {lr}
    bl         Menu_Folder_Sort_HandleInput
    bl         Menu_Folder_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Folder_Sort_Open
    push       {lr}
    mov        r2,#0x0
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0x20
    beq        LAB_0801ac4c
    mov        r2,#0x2
LAB_0801ac4c:
    mov        r0,r10
    ldr        r0,[r0,#0x78]
    ldrb       r1,[r0,r2]
    mov        r0,#0x3c
    strh       r1,[r5,r0]
    mov        r0,#0x0
    strb       r0,[r5,#0x11]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    push       {r5}
    bl         SetSortDefault
    pop        {r5}
    pop        {pc}


_ts Menu_Folder_DrawSortList
    push       {r5,lr}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x14
    bne        LAB_0801aca4
    mov        r0,#0x0
    ldrb       r2,[r5,#0xc]
    cmp        r2,#0x20
    beq        LAB_0801ac82
    mov        r0,#0x12
LAB_0801ac82:
    push       {r0}
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderSortList_0801aca8
    mov        r4,#0xc
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    pop        {r0}
    add        r0,#0x3
    mov        r1,#0x2
    mov        r2,#0x1
    ldr        r3,PTR_tilemapSmallList_0801b060
    mov        r4,#0x8
    mov        r5,#0xf
    bl         Screen_CopyTileMapRect
LAB_0801aca4:
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapFolderSortList_0801aca8:
    .word tilemapFolderSortList


_ts Menu_Folder_SortSack
    push       {lr}
    push       {r5}
    ldr        r6,PTR_gBattleChipInventory_0801b064
    ldr        r7,PTR_gChipBag_0801b068
    mov        r0,#0x0
    mov        r1,#0x0
LAB_0801acb8:
    mov        r2,#0x0
    mov        r8,r2
LAB_0801acbc:
    ldrb       r3,[r6,#0x0]
    tst        r3,r3
    beq        LAB_0801ad9e
    ldr        r5,PTR_gFolder_0801b06c
    mov        r2,#0x0
LAB_0801acc6:
    ldrb       r4,[r5,#0x0]
    cmp        r0,r4
    bne        LAB_0801ace8
    push       {r0}
    push       {r1,r2,r5,r7}
    bl         BattleChip_GetChipData
    pop        {r1,r2,r5,r7}
    mov        r4,#0x0
    add        r4,r8
    ldrb       r4,[r0,r4]
    ldrb       r0,[r5,#0x1]
    cmp        r0,r4
    pop        {r0}
    bne        LAB_0801ace8
    sub        r3,#0x1
    ble        LAB_0801ad9e
LAB_0801ace8:
    add        r5,#0x2
    add        r2,#0x1
    cmp        r2,#0x1e
    blt        LAB_0801acc6
    mov        r12,r0
    push       {r1,r3,r7}
    bl         BattleChip_GetChipData
    pop        {r1,r3,r7}
    mov        r2,r10
    ldr        r2,[r2,#0x78]
    ldrb       r2,[r2,#0x3]
    tst        r2,r2
    bne        LAB_0801ad4c
    mov        r4,r12
    str        r4,[r7,#0x18]
    ldrb       r4,[r0,#0x9]
    lsl        r2,r4,#0x8
    mov        r9,r3
    mov        r3,#0x0
    add        r3,r8
    ldrb       r3,[r0,r3]
    orr        r2,r3
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
    mov        r3,r9
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    b          LAB_0801ad98
LAB_0801ad4c:
    mov        r4,r12
    str        r4,[r7,#0x18]
    ldrb       r4,[r0,#0x9]
    lsl        r2,r4,#0x8
    mov        r9,r3
    mov        r3,#0x0
    add        r3,r8
    ldrb       r3,[r0,r3]
    orr        r2,r3
    mvn        r2,r2
    lsl        r2,r2,#0x10
    lsr        r2,r2,#0x10
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
    mov        r3,r9
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
LAB_0801ad98:
    mov        r0,r12
    add        r1,#0x1
    add        r7,#0x20
LAB_0801ad9e:
    add        r6,#0x1
    mov        r2,r8
    add        r2,#0x1
    mov        r8,r2
    cmp        r2,#0x5
    blt        LAB_0801acbc
    add        r6,#0xb
    add        r0,#0x1
    cmp        r0,#0xef
    ble        LAB_0801acb8
    pop        {r5}
    push       {r1}
    push       {r5}
    mov        r2,r10
    ldr        r2,[r2,#0x78]
    ldrb       r4,[r2,#0x3]
    ldr        r0,PTR_gChipBag_0801b068
    ldrb       r2,[r2,#0x2]
    ldr        r3,PTR_PTR_SortSack_0801b070
    ldr        r3,[r3,r4]
    mov        lr,pc
    bx         r3
    pop        {r5}
    pop        {r0}
    pop        {pc}
PTR_SortSack_0801add0:
    .word SortSack
    .word SortSackReverse


_ts Menu_Folder_SortFolder
    push       {r5,lr}
    ldr        r7,PTR_DAT_0801b074
    ldr        r6,PTR_gFolder_0801b078
    mov        r0,#0x0
    mov        r1,#0x0
LAB_0801ade2:
    push       {r0}
    ldrb       r4,[r6,#0x0]
    tst        r4,r4
    beq        LAB_0801aeb4
    ldr        r0,PTR_DAT_0801b074
    mov        r2,#0x0
LAB_0801adee:
    cmp        r2,r1
    bge        LAB_0801ae14
    ldr        r3,[r0,#0x18]
    cmp        r3,r4
    bne        LAB_0801ae0e
    ldr        r3,[r0,#0x8]
    lsr        r3,r3,#0x10
    ldrb       r5,[r6,#0x1]
    cmp        r3,r5
    bne        LAB_0801ae0e
    ldr        r3,[r0,#0x14]
    mov        r5,#0x1
    lsl        r5,r5,#0x10
    add        r3,r3,r5
    str        r3,[r0,#0x14]
    b          LAB_0801aeb4
LAB_0801ae0e:
    add        r0,#0x20
    add        r2,#0x1
    b          LAB_0801adee
LAB_0801ae14:
    push       {r1}
    push       {r4,r6,r7}
    add        r0,r4,#0x0
    bl         BattleChip_GetChipData
    pop        {r4,r6,r7}
    mov        r2,r10
    ldr        r2,[r2,#0x78]
    ldrb       r2,[r2,#0x1]
    tst        r2,r2
    bne        LAB_0801ae6a
    str        r4,[r7,#0x18]
    ldrb       r4,[r0,#0x9]
    lsl        r2,r4,#0x8
    ldrb       r3,[r6,#0x1]
    orr        r2,r3
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    b          LAB_0801aeae
LAB_0801ae6a:
    str        r4,[r7,#0x18]
    ldrb       r4,[r0,#0x9]
    lsl        r2,r4,#0x8
    ldrb       r3,[r6,#0x1]
    orr        r2,r3
    mvn        r2,r2
    lsl        r2,r2,#0x10
    lsr        r2,r2,#0x10
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
LAB_0801aeae:
    pop        {r1}
    add        r1,#0x1
    add        r7,#0x20
LAB_0801aeb4:
    pop        {r0}
    add        r6,#0x2
    add        r0,#0x1
    cmp        r0,#0x1e
    blt        LAB_0801ade2
    push       {r1,r5}
    mov        r2,r10
    ldr        r2,[r2,#0x78]
    ldrb       r4,[r2,#0x1]
    ldr        r0,PTR_DAT_0801b074
    ldrb       r2,[r2,#0x0]
    ldr        r3,PTR_PTR_SortSack_0801b07c
    ldr        r3,[r3,r4]
    mov        lr,pc
    bx         r3
    ldr        r0,PTR_gFolder_0801b080
    mov        r1,#0x3c
    bl         memset0_32
    pop        {r1,r5}
    ldr        r7,PTR_DAT_0801b074
    ldr        r6,PTR_gFolder_0801b084
    mov        r0,r10
    ldr        r0,[r0,#0x78]
    ldrb       r0,[r0,#0x1]
LAB_0801aee6:
    cmp        r1,#0x0
    ble        LAB_0801af04
    ldr        r2,[r7,#0x14]
    ldr        r3,[r7,#0x18]
    ldr        r4,[r7,#0x8]
    lsr        r2,r2,#0x10
    lsr        r4,r4,#0x10
LAB_0801aef4:
    strb       r3,[r6,#0x0]
    strb       r4,[r6,#0x1]
    add        r6,#0x2
    sub        r2,#0x1
    bgt        LAB_0801aef4
    add        r7,#0x20
    sub        r1,#0x1
    b          LAB_0801aee6
LAB_0801af04:
    pop        {r5,pc}



_ts Menu_Folder_Sort_HandleInput
    push       {lr}
    ldrh       r1,[r5,#0x3c]
    strh       r1,[r5,#0x3e]
    mov        r0,#0x40
    ldrh       r1,[r5,r0]
    mov        r0,#0x42
    strh       r1,[r5,r0]
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Get400
    mov        r5,r9
    beq        LAB_0801af28
    mov        r0,#0x8
    strb       r0,[r5,#0xe]
    b          LAB_0801afca
LAB_0801af28:
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_0801af34
    sub        r0,#0x1
    strb       r0,[r5,#0xe]
    b          LAB_0801afca
LAB_0801af34:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0xa
    tst        r1,r0
    beq        LAB_0801af4c
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    b          LAB_0801afca
LAB_0801af4c:
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801af58
    bl         Menu_Folder_CheckSortSelection
    b          LAB_0801afca
LAB_0801af58:
    mov        r2,#0x3c
    ldrh       r2,[r5,r2]
    mov        r3,#0x40
    ldrh       r3,[r5,r3]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801af7a
    sub        r2,r2,r4
    bge        LAB_0801af7a
    mov        r2,#0x5
    sub        r3,r3,r4
    bgt        LAB_0801afaa
    mov        r3,#0x0
    b          LAB_0801afaa
LAB_0801af7a:
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801afaa
    mov        r6,#0x44
    ldrh       r6,[r5,r6]
    sub        r6,#0x1
    cmp        r6,#0x5
    blt        LAB_0801af8e
    mov        r6,#0x5
LAB_0801af8e:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801afaa
    mov        r2,#0x0
    cmp        r6,#0x5
    blt        LAB_0801afaa
    mov        r6,#0x44
    ldrh       r6,[r5,r6]
    sub        r6,#0x6
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801afaa
    add        r3,r6,#0x0
    b          LAB_0801afaa
LAB_0801afaa:
    mov        r4,#0x3c
    ldrh       r4,[r5,r4]
    cmp        r2,r4
    bne        LAB_0801afbc
    mov        r4,#0x40
    ldrh       r4,[r5,r4]
    cmp        r3,r4
    bne        LAB_0801afbc
    b          LAB_0801afc2
LAB_0801afbc:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801afc2:
    mov        r0,#0x3c
    strh       r2,[r5,r0]
    mov        r0,#0x40
    strh       r3,[r5,r0]
LAB_0801afca:
    pop        {pc}


_ts Menu_Folder_DrawSortMenuArrow
    push       {lr}
    mov        r0,#0x1
    ldrb       r2,[r5,#0xc]
    cmp        r2,#0x20
    beq        LAB_0801afd8
    mov        r0,#0x13
LAB_0801afd8:
    mov        r8,r0
    push       {r5}
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0801b088
    mov        r4,#0x2
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x14
    bne        LAB_0801b012
    ldrb       r1,[r5,#0xf]
    ldr        r3,PTR_tilemapListSideArrow_0801b08c
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    mov        r0,r8
    mov        r1,#0x3c
    ldrh       r1,[r5,r1]
    lsl        r1,r1,#0x1
    add        r1,#0x5
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_0801b012:
    pop        {pc}


_ts Menu_Folder_CheckSortSelection
    push       {lr}
    mov        r0,#0x3c
    ldrh       r0,[r5,r0]
    mov        r7,#0x2
    ldrb       r2,[r5,#0xc]
    cmp        r2,#0x20
    bne        LAB_0801b024
    mov        r7,#0x0
LAB_0801b024:
    mov        r1,r10
    ldr        r1,[r1,#0x78]
    add        r1,r1,r7
    ldrb       r2,[r1,#0x0]
    cmp        r0,r2
    beq        LAB_0801b03a
    strb       r0,[r1,#0x0]
    ldr        r2,PTR_listDefaultSort_0801b090
    ldrb       r0,[r2,r0]
    strb       r0,[r1,#0x1]
    b          LAB_0801b044
LAB_0801b03a:
    strb       r0,[r1,#0x0]
    ldrb       r0,[r1,#0x1]
    mov        r2,#0x4
    eor        r0,r2
    strb       r0,[r1,#0x1]
LAB_0801b044:
    tst        r7,r7
    bne        LAB_0801b04e
    bl         Menu_Folder_SortFolder
    b          LAB_0801b054
LAB_0801b04e:
    bl         Menu_Folder_SortSack
    strh       r0,[r5,#0x24]
LAB_0801b054:
    mov        r0,#0xff
    strb       r0,[r5,#0x11]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    pop        {pc}
PTR_tilemapSmallList_0801b060:
    .word tilemapSmallList
PTR_gBattleChipInventory_0801b064:
    .word gBattleChipInventory
PTR_gChipBag_0801b068:
    .word gChipBag
PTR_gFolder_0801b06c:
    .word gFolder
PTR_PTR_SortSack_0801b070:
    .word PTR_SortSack_0801add0
PTR_DAT_0801b074:
    .word 0x2023000
PTR_gFolder_0801b078:
    .word gFolder
PTR_PTR_SortSack_0801b07c:
    .word PTR_SortSack_0801add0
PTR_gFolder_0801b080:
    .word gFolder
PTR_gFolder_0801b084:
    .word gFolder
PTR_tilemapFolderBlank_0801b088:
    .word tilemapFolderBlank
PTR_tilemapListSideArrow_0801b08c:
    .word tilemapListSideArrow
PTR_listDefaultSort_0801b090:
    .word listDefaultSort


_ts InitInventoryChecksumFromChipBag
    push       {r5,lr}
    add        r6,r0,#0x0
    ldr        r7,PTR_gChipBag_0801b114
LAB_0801b09a:
    cmp        r6,#0x0
    ble        LAB_0801b0ba
    ldr        r0,[r7,#0x18]
    ldr        r1,[r7,#0x8]
    lsr        r1,r1,#0x10
    mov        r8,r6
    mov        r9,r7
    bl         Inventory_GetChipCountChecksum
    mov        r6,r8
    mov        r7,r9
    mvn        r1,r6
    strh       r1,[r0,#0x0]
    sub        r6,#0x1
    add        r7,#0x20
    b          LAB_0801b09a
LAB_0801b0ba:
    pop        {r5,pc}


_ts Inventory_InitChecksum
    ldr        r7,PTR_gBattleChipInventory_0801b118
    mov        r0,#0x0
    mvn        r1,r0
LAB_0801b0c2:
    strh       r1,[r7,#0x6]
    str        r1,[r7,#0x8]
    str        r1,[r7,#0xc]
    add        r7,#0x10
    add        r0,#0x1
    cmp        r0,#0xef
    ble        LAB_0801b0c2
    mov        pc,lr


_ts Inventory_SetChecksum
    add        r1,r0,#0x0
    mov        r2,#0x7
    and        r1,r2
    mvn        r2,r2
    and        r0,r2
    lsl        r1,r1,#0x1
    add        r1,#0x6
    ldr        r7,PTR_gInventoryChecksumIndex_0801b11c
    ldrh       r2,[r7,#0x0]
    strh       r2,[r0,r1]
    sub        r2,#0x1
    strh       r2,[r7,#0x0]
    mov        pc,lr


_ts Inventory_ClearChecksum
    add        r1,r0,#0x0
    mov        r2,#0x7
    and        r1,r2
    mvn        r2,r2
    and        r0,r2
    lsl        r1,r1,#0x1
    add        r1,#0x6
    mov        r2,#0x0
    mvn        r2,r2
    strh       r2,[r0,r1]
    mov        pc,lr


_ts Inventory_InitChecksumIndex
    ldr        r7,PTR_gInventoryChecksumIndex_0801b120
    mov        r0,#0x80
    lsl        r0,r0,#0x8
    strh       r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0

PTR_gChipBag_0801b114:
    .word gChipBag
PTR_gBattleChipInventory_0801b118:
    .word gBattleChipInventory
PTR_gInventoryChecksumIndex_0801b11c:
    .word gInventoryChecksumIndex
PTR_gInventoryChecksumIndex_0801b120:
    .word gInventoryChecksumIndex
