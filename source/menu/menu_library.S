#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc+1

tilemapLibraryChipEntry:
    .incbin "images/start_menu/library/entry.tilemap"
tilemapLibraryUnknownChipEntry:
    .incbin "images/start_menu/library/entry_unknown.tilemap"
global_label tilemapListSideArrow
    .incbin "images/menu/side_arrow.tilemap"
tilemapRarityStars:
    .incbin "images/start_menu/library/rarity.tilemap"
tilemapLibraryUpDownArrow:
    .incbin "images/start_menu/library/up_down_arrow.tilemap"


_ts Menu_1_Library
    push       {lr}
    ldr        r0,PTR_PTR_Menu_Library_0_Init_0801b414
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_Menu_Library_0_Init_0801b414:
    .word PTR_Menu_Library_0_Init_0801b418
PTR_Menu_Library_0_Init_0801b418:
    .word Menu_Library_0_Init
    .word Menu_Library_1_Main
    .word Menu_Library_2_Close


_ts Menu_Library_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801b468
    ldr        r1,PTR_DAT_0801b46c
    ldr        r2,DAT_0801b470
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801b474
    ldr        r1,PTR_eBgPalette4_0801b478
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801b47c
    ldr        r1,PTR_DAT_0801b480
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuUpDownArrow_0801b484
    ldr        r1,PTR_DAT_0801b488
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetRarityStars_0801b48c
    ldr        r1,PTR_DAT_0801b490
    mov        r2,#0xf0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801b494
    ldr        r1,PTR_eBgPaletteF_0801b498
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    b          LAB_0801b49c
PTR_tilesetMenuDesign_0801b468:
    .word tilesetMenuDesign
PTR_DAT_0801b46c:
    .word 0x6000020
DAT_0801b470:
    .word 0x540
PTR_paletteMenuDesign_0801b474:
    .word paletteMenuDesign
PTR_eBgPalette4_0801b478:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801b47c:
    .word tilesetMenuSideArrow
PTR_DAT_0801b480:
    .word 0x6004020
PTR_tilesetMenuUpDownArrow_0801b484:
    .word tilesetMenuUpDownArrow
PTR_DAT_0801b488:
    .word 0x6005800
PTR_tilesetRarityStars_0801b48c:
    .word tilesetRarityStars
PTR_DAT_0801b490:
    .word 0x6008600
PTR_paletteMenuSideArrow_0801b494:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801b498:
    .word eBgPaletteF
LAB_0801b49c:
    mov        r0,#0x0
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
LAB_0801b4a0:
    push       {r0,r7}
    bl         BattleChip_GetChipData
    ldrb       r6,[r0,#0x9]
    pop        {r0,r7}
    push       {r0,r6,r7}
    bl         Flag_GetLibrary
    add        r2,r0,#0x0
    pop        {r0,r6,r7}
    add        r1,r0,#0x0
    tst        r2,r2
    bne        LAB_0801b4bc
    mov        r1,#0x0
LAB_0801b4bc:
    strb       r1,[r7,r6]
    add        r0,#0x1
    cmp        r0,#0xef
    ble        LAB_0801b4a0
    mov        r0,#0x1
    bl         Menu_Library_CopyChipNameNumberTiles
    bl         Menu_Library_CopyUnobtainedChipEntryTiles
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r0,[r7,#0x1]
    mov        r1,#0xff
    bl         Menu_LoadChipData
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuLibrary_0801b894
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801b898
    add        r1,r1,r2
    ldr        r2,DAT_0801b89c
    bl         Dma_TransferListAdd
    mov        r0,#0xe
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapLibraryChipEntry_0801b8a0
    mov        r4,#0xc
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801b8a4
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
    mov        r0,#0x1
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r0,#0xb0
    push       {r0}
    mov        r0,#0xc7
    bl         Flag_GetLibrary
    pop        {r0}
    bne        LAB_0801b538
    sub        r0,#0x1
LAB_0801b538:
    strb       r0,[r5,#0x11]
    bl         Menu_Library_PrintRarityStars
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Library_1_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801b55a
    bl         Menu_Library_HandleInput
LAB_0801b55a:
    bl         Menu_Library_PrintUI
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Library_2_Close
    push       {lr}
    bl         Menu_Library_PrintUI
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801b5b8
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801b58a
    mov        r1,#0x4
LAB_0801b58a:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801b8a8
    ldr        r1,PTR_eBgPaletteF_0801b8ac
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801b5b8:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Library_CopyChipNameNumberTiles
    push       {r5,lr}
    push       {r0}
    add        r1,r0,#0x0
    add        r5,r0,#0x0
    add        r5,#0x7
    ldr        r0,PTR_TextData_BattleChip_Names_0801b8b0
    ldr        r2,PTR_DAT_0801b8b4
    ldr        r3,PTR_DAT_0801b8b8
    ldr        r6,PTR_tilesetDialogueText_0801b8bc
LAB_0801b5ce:
    push       {r0,r1,r2,r3,r5,r6}
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r1,[r7,r1]
    mov        r4,#0x8
    mov        r5,#0x1
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3,r5,r6}
    mov        r4,#0x20
    lsl        r4,r4,#0x4
    add        r2,r2,r4
    add        r3,r3,r4
    add        r1,#0x1
    cmp        r1,r5
    blt        LAB_0801b5ce
    pop        {r0}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    str        r0,[r7,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801b8c0
    mov        r1,#0x0
    ldr        r2,PTR_DAT_0801b8c4
    ldr        r3,PTR_DAT_0801b8c8
    ldr        r6,PTR_tilesetDialogueText_0801b8bc
LAB_0801b600:
    push       {r1}
    mov        r1,#0x15
    mov        r4,#0x4
    mov        r5,#0x1
    mov        r7,#0x0
    push       {r0,r2,r3,r6}
    bl         Text_CopyCharTileUI
    pop        {r0,r2,r3,r6}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    ldr        r4,[r7,#0x4]
    add        r4,#0x1
    str        r4,[r7,#0x4]
    mov        r4,#0x10
    lsl        r4,r4,#0x4
    add        r2,r2,r4
    add        r3,r3,r4
    pop        {r1}
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0801b600
    pop        {r5,pc}


_ts Menu_Library_CopyUnobtainedChipEntryTiles
    push       {r5,lr}
    ldr        r0,PTR_textDict_MenuMessages_0801b8c0
    mov        r1,#0x14
    ldr        r2,PTR_DAT_0801b8cc
    ldr        r3,PTR_DAT_0801b8d0
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801b8bc
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,pc}


_ts Menu_Library_PrintUnknownChipEntry
    push       {r5,lr}
    mov        r9,r5
    mov        r0,#0x0
LAB_0801b64e:
    mov        r8,r0
    mov        r5,r9
    ldrb       r1,[r5,#0xe]
    add        r0,r0,r1
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r0,[r7,r0]
    cmp        r0,#0x0
    bne        LAB_0801b680
    mov        r0,#0x12
    mov        r1,#0x2
    add        r1,r8
    lsl        r1,r1,#0x1
    mov        r2,#0x3
    ldr        r3,PTR_tilemapLibraryUnknownChipEntry_0801b8d4
    mov        r5,r9
    mov        r4,r8
    mov        r5,#0x1
    and        r4,r5
    lsl        r4,r4,#0x5
    add        r3,r3,r4
    mov        r4,#0x8
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    b          LAB_0801b694
LAB_0801b680:
    mov        r0,#0x12
    mov        r1,#0x2
    add        r1,r8
    lsl        r1,r1,#0x1
    mov        r2,#0x3
    mov        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
LAB_0801b694:
    mov        r0,r8
    add        r0,#0x1
    cmp        r0,#0x7
    blt        LAB_0801b64e
    pop        {r5,pc}


_ts Menu_Library_PrintUI
    push       {lr}
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xf]
    cmp        r0,r1
    bne        LAB_0801b6b4
    ldrb       r2,[r5,#0xc]
    ldrb       r3,[r5,#0xd]
    cmp        r2,r3
    bne        LAB_0801b6b4
    b          LAB_0801b6c8
LAB_0801b6b4:
    bl         Menu_Library_CopyChipNameNumberTiles
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xc]
    add        r0,r0,r1
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r0,[r7,r0]
    mov        r1,#0xff
    bl         Menu_LoadChipData
LAB_0801b6c8:
    bl         Menu_Library_PrintRarityStars
    bl         Menu_Library_PrintUnknownChipEntry
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xc]
    add        r0,r0,r1
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r0,[r7,r0]
    cmp        r0,#0x0
    beq        LAB_0801b6e6
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Menu_ShowChipDetail
LAB_0801b6e6:
    bl         Menu_Library_PrintArrows
    pop        {pc}


_ts Menu_Library_HandleInput
    push       {lr}
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    ldrb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801b71a
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801b78a
LAB_0801b71a:
    ldrb       r2,[r5,#0xc]
    ldrb       r3,[r5,#0xe]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_0801b8d8
    tst        r4,r1
    beq        LAB_0801b72e
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_0801b72e:
    mov        r4,#0x7
    ldr        r1,DAT_0801b8dc
    tst        r1,r0
    bne        LAB_0801b744
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801b74c
    sub        r2,r2,r4
    bge        LAB_0801b74c
    mov        r2,#0x0
LAB_0801b744:
    sub        r3,r3,r4
    bgt        LAB_0801b772
    mov        r3,#0x1
    b          LAB_0801b772
LAB_0801b74c:
    mov        r4,#0x7
    ldr        r1,DAT_0801b8e0
    tst        r1,r0
    bne        LAB_0801b764
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801b772
    add        r2,r2,r4
    cmp        r2,#0x6
    ble        LAB_0801b772
    mov        r2,#0x6
LAB_0801b764:
    ldrb       r6,[r5,#0x11]
    sub        r6,#0x6
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801b772
    add        r3,r6,#0x0
    b          LAB_0801b772
LAB_0801b772:
    ldrb       r4,[r5,#0xc]
    cmp        r2,r4
    bne        LAB_0801b780
    ldrb       r4,[r5,#0xe]
    cmp        r3,r4
    bne        LAB_0801b780
    b          LAB_0801b786
LAB_0801b780:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801b786:
    strb       r2,[r5,#0xc]
    strb       r3,[r5,#0xe]
LAB_0801b78a:
    pop        {pc}


_ts Menu_Library_PrintArrows
    push       {r5,lr}
    mov        r12,r5
    ldrb       r1,[r5,#0xd]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r0,#0xc
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r12
    ldrb       r1,[r5,#0x10]
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801b7b0
    mov        r1,#0x0
LAB_0801b7b0:
    strb       r1,[r5,#0x10]
    ldr        r3,PTR_tilemapListSideArrow_0801b8e4
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    ldrb       r1,[r5,#0xc]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r0,#0xc
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
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
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    mov        r5,r12
    ldrb       r0,[r5,#0xe]
    ldr        r3,PTR_tilemapLibraryUpDownArrow_0801b8e8
    add        r3,r3,r1
    mov        r8,r3
    cmp        r0,#0x1
    beq        LAB_0801b814
    mov        r9,r0
    mov        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,r9
LAB_0801b814:
    mov        r5,r12
    ldrb       r6,[r5,#0x11]
    sub        r6,#0x6
    ldrb       r0,[r5,#0xe]
    cmp        r0,r6
    beq        LAB_0801b832
    mov        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    mov        r3,r8
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801b832:
    pop        {r5,pc}


_ts Menu_Library_PrintRarityStars
    push       {r5,lr}
    mov        r0,#0x0
    ldrb       r1,[r5,#0xe]
    mov        r9,r1
LAB_0801b83c:
    mov        r8,r0
    add        r0,r9
    ldr        r7,PTR_gLibraryChipIndexList_0801b890
    ldrb       r0,[r7,r0]
    cmp        r0,#0x0
    beq        LAB_0801b872
    bl         BattleChip_GetChipData
    ldrb       r0,[r0,#0x8]
    lsl        r0,r0,#0x5
    ldr        r3,PTR_tilemapRarityStars_0801b8ec
    add        r3,r3,r0
    mov        r0,r8
    mov        r1,#0x1
    and        r1,r0
    lsl        r1,r1,#0x4
    add        r3,r3,r1
    mov        r1,r8
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r0,#0x1a
    mov        r2,#0x3
    mov        r4,#0x3
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    b          LAB_0801b886
LAB_0801b872:
    mov        r1,r8
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r0,#0x1a
    mov        r2,#0x3
    mov        r3,#0x3
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
LAB_0801b886:
    mov        r0,r8
    add        r0,#0x1
    cmp        r0,#0x7
    blt        LAB_0801b83c
    pop        {r5,pc}
PTR_gLibraryChipIndexList_0801b890:
    .word gLibraryChipIndexList
PTR_tilemapMenuLibrary_0801b894:
    .word tilemapMenuLibrary
DAT_0801b898:
    .word 0x800
DAT_0801b89c:
    .word 0x140
PTR_tilemapLibraryChipEntry_0801b8a0:
    .word tilemapLibraryChipEntry
PTR_DAT_0801b8a4:
    .word 0x1f40
PTR_paletteKeyboardNumberChars_0801b8a8:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801b8ac:
    .word eBgPaletteF
PTR_TextData_BattleChip_Names_0801b8b0:
    .word TextData_BattleChip_Names
PTR_DAT_0801b8b4:
    .word 0x2011200
PTR_DAT_0801b8b8:
    .word 0x6004200
PTR_tilesetDialogueText_0801b8bc:
    .word tilesetDialogueText
PTR_textDict_MenuMessages_0801b8c0:
    .word textDict_MenuMessages
PTR_DAT_0801b8c4:
    .word 0x2012000
PTR_DAT_0801b8c8:
    .word 0x6005000
PTR_DAT_0801b8cc:
    .word 0x2012700
PTR_DAT_0801b8d0:
    .word 0x6008200
PTR_tilemapLibraryUnknownChipEntry_0801b8d4:
    .word tilemapLibraryUnknownChipEntry
DAT_0801b8d8:
    .word 0x300
DAT_0801b8dc:
    .word 0x200
DAT_0801b8e0:
    .word 0x100
PTR_tilemapListSideArrow_0801b8e4:
    .word tilemapListSideArrow
PTR_tilemapLibraryUpDownArrow_0801b8e8:
    .word tilemapLibraryUpDownArrow
PTR_tilemapRarityStars_0801b8ec:
    .word tilemapRarityStars
