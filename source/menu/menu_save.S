#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc

tilemapSaveCategories:
    .incbin "images/start_menu/save/categories.tilemap"
tilemapSaveCategoryValues:
    .incbin "images/start_menu/save/category_values.tilemap"


_ts Menu_6_Save
    push       {lr}
    ldr        r0,PTR_PTR_Menu_Save_0_Init_0801e83c
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_Menu_Save_0_Init_0801e504:
    .word Menu_Save_0_Init
    .word Menu_Save_1_CheckDialogResult
    .word Menu_Save_2_Close
    .word Menu_Save_3_ConfirmSave
    .word Menu_Save_4_StartClose


_ts Menu_Save_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801e840
    ldr        r1,PTR_DAT_0801e844
    ldr        r2,DAT_0801e848
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801e84c
    ldr        r1,PTR_eBgPalette4_0801e850
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801e854
    ldr        r1,PTR_eBgPaletteF_0801e858
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    bl         FUN_0801e6ec
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuSave_0801e85c
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801e860
    add        r1,r1,r2
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    mov        r0,#0x4
    mov        r1,#0x3
    mov        r2,#0x2
    ldr        r3,PTR_tilemapSaveCategories_0801e864
    mov        r4,#0xc
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    mov        r0,#0x13
    mov        r1,#0x3
    mov        r2,#0x2
    ldr        r3,PTR_tilemapSaveCategoryValues_0801e868
    mov        r4,#0x7
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    pop        {r5}
    bl         GetBattleChipTotalCount
    str        r0,[r5,#0x10]
    push       {r5}
    bl         Library_GetStandardChipCount
    pop        {r5}
    strb       r1,[r5,#0xc]
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801e86c
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    bl         Video_ClearAllTile0Maps
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x78
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    push       {r5}
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x5
    bl         Flag_Clear400
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Save_1_CheckDialogResult
    push       {lr}
    push       {r5}
    mov        r0,#0x20
    bl         Text_CheckOption
    pop        {r5}
    beq        LAB_0801e61e
    bl         TextOption_GetDefaultOption
    cmp        r0,#0x0
    beq        LAB_0801e600
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801e61e
LAB_0801e600:
    mov        r0,#0x9
    bl         Flag_Get400
    beq        LAB_0801e614
    ldrb       r0,[r5,#0xd]
    tst        r0,r0
    bne        LAB_0801e614
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    b          LAB_0801e61e
LAB_0801e614:
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    b          LAB_0801e61e
LAB_0801e61e:
    bl         Menu_Save_PrintUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Save_2_Close
    push       {lr}
    bl         Menu_Save_PrintUi
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801e680
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801e64e
    mov        r1,#0x4
LAB_0801e64e:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801e874
    ldr        r1,PTR_eBgPaletteF_0801e878
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801e680:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Save_3_ConfirmSave
    push       {lr}
    push       {r5}
    bl         Save_SaveGame
    pop        {r5}
    beq        LAB_0801e6a2
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x83
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    b          LAB_0801e6b2
LAB_0801e6a2:
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x7a
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
LAB_0801e6b2:
    bl         Menu_Save_PrintUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Save_4_StartClose
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801e6dc
    mov        r0,#0x6
    bl         Flag_Clear400
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_0801e6dc:
    bl         Menu_Save_PrintUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Save_PrintUi
    push       {lr}
    bl         Menu_Save_PrintData
    pop        {pc}


_ts FUN_0801e6ec
    push       {r5,lr}
    mov        r0,#0x0
    ldr        r2,PTR_DAT_0801e87c
    mov        r1,#0x7b
    ldr        r3,PTR_DAT_0801e880
LAB_0801e6f6:
    push       {r0,r1,r2,r3}
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r4,#0x10
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801e884
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3}
    mov        r4,#0x4
    lsl        r4,r4,#0x8
    add        r2,r2,r4
    add        r3,r3,r4
    add        r0,#0x1
    add        r1,#0x1
    cmp        r0,#0x4
    blt        LAB_0801e6f6
    pop        {r5,pc}


_ts Menu_Save_PrintData
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r6,[r7,#0x78]
    ldr        r5,[r7,#0x68]
    ldr        r0,[r6,#0x18]
    push       {r5}
    bl         FrameTimeToBcdRealTime
    pop        {r5}
    lsr        r0,r0,#0x10
    mov        r1,#0xf
    and        r1,r0
    lsr        r0,r0,#0x4
    mov        r2,#0xf
    and        r2,r0
    lsl        r3,r2,#0x3
    lsl        r2,r2,#0x1
    add        r2,r2,r3
    add        r2,r2,r1
    str        r2,[r5,#0x8]
    lsr        r0,r0,#0x4
    mov        r1,#0xf
    and        r1,r0
    lsr        r0,r0,#0x4
    mov        r2,#0xf
    and        r2,r0
    lsl        r3,r2,#0x3
    lsl        r2,r2,#0x1
    add        r2,r2,r3
    add        r2,r2,r1
    str        r2,[r5,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x7f
    ldr        r2,PTR_DAT_0801e888
    ldr        r3,PTR_DAT_0801e88c
    mov        r4,#0x7
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801e884
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    ldrb       r1,[r5,#0xc]
    push       {r5}
    mov        r7,r10
    ldr        r5,[r7,#0x68]
    str        r1,[r5,#0x4]
    mov        r1,#0x80
    push       {r1}
    mov        r0,#0xc7
    bl         Flag_GetLibrary
    pop        {r1}
    beq        LAB_0801e78c
    mov        r1,#0x84
LAB_0801e78c:
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    ldr        r2,PTR_DAT_0801e890
    ldr        r3,PTR_DAT_0801e894
    mov        r4,#0x7
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801e884
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    ldr        r1,[r5,#0x10]
    push       {r5}
    mov        r7,r10
    ldr        r5,[r7,#0x68]
    str        r1,[r5,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x81
    ldr        r2,PTR_DAT_0801e898
    ldr        r3,PTR_DAT_0801e89c
    mov        r4,#0x7
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801e884
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r6,[r7,#0x8]
    ldr        r5,[r7,#0x68]
    ldr        r0,[r6,#0x74]
    str        r0,[r5,#0x4]
    ldr        r0,PTR_textDict_MenuMessages_0801e870
    mov        r1,#0x82
    ldr        r2,PTR_DAT_0801e8a0
    ldr        r3,PTR_DAT_0801e8a4
    mov        r4,#0x7
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801e884
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    pop        {pc}


_ts GetBattleChipTotalCount
    push       {lr}
    mov        r4,#0x0
    mov        r0,#0x0
    ldr        r7,PTR_gBattleChipInventory_0801e8a8
LAB_0801e7ec:
    push       {r0,r7}
    bl         BattleChip_GetChipData
    add        r2,r0,#0x0
    pop        {r0,r7}
    mov        r6,#0x0
LAB_0801e7f8:
    ldrb       r3,[r2,r6]
    cmp        r3,#0xff
    beq        LAB_0801e802
    ldrb       r1,[r7,r6]
    add        r4,r4,r1
LAB_0801e802:
    add        r6,#0x1
    cmp        r6,#0x5
    blt        LAB_0801e7f8
    add        r7,#0x10
    add        r0,#0x1
    cmp        r0,#0xf0
    blt        LAB_0801e7ec
    add        r0,r4,#0x0
    pop        {pc}


_ts Library_GetStandardChipCount
    push       {lr}
    mov        r0,#0x10
    lsl        r0,r0,#0x4
    mov        r1,#0x0
    mov        r7,#0xf0
    add        r7,r7,r0
LAB_0801e820:
    mov        r8,r0
    mov        r9,r7
    mov        r12,r1
    bl         Flag_GetBase
    mov        r1,r12
    mov        r0,r8
    mov        r7,r9
    beq        LAB_0801e834
    add        r1,#0x1
LAB_0801e834:
    add        r0,#0x1
    cmp        r0,r7
    blt        LAB_0801e820
    pop        {pc}

    .align 2, 0

PTR_PTR_Menu_Save_0_Init_0801e83c:
    .word PTR_Menu_Save_0_Init_0801e504
PTR_tilesetMenuDesign_0801e840:
    .word tilesetMenuDesign
PTR_DAT_0801e844:
    .word 0x6000020
DAT_0801e848:
    .word 0x540
PTR_paletteMenuDesign_0801e84c:
    .word paletteMenuDesign
PTR_eBgPalette4_0801e850:
    .word eBgPalette4
PTR_paletteMenuSideArrow_0801e854:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801e858:
    .word eBgPaletteF
PTR_tilemapMenuSave_0801e85c:
    .word tilemapMenuSave
DAT_0801e860:
    .word 0x800
PTR_tilemapSaveCategories_0801e864:
    .word tilemapSaveCategories
PTR_tilemapSaveCategoryValues_0801e868:
    .word tilemapSaveCategoryValues
PTR_DAT_0801e86c:
    .word 0x1f40
PTR_textDict_MenuMessages_0801e870:
    .word textDict_MenuMessages
PTR_paletteKeyboardNumberChars_0801e874:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801e878:
    .word eBgPaletteF
PTR_DAT_0801e87c:
    .word 0x2011400
PTR_DAT_0801e880:
    .word 0x6004400
PTR_tilesetDialogueText_0801e884:
    .word tilesetDialogueText
PTR_DAT_0801e888:
    .word 0x2012400
PTR_DAT_0801e88c:
    .word 0x6005400
PTR_DAT_0801e890:
    .word 0x2012600
PTR_DAT_0801e894:
    .word 0x6005600
PTR_DAT_0801e898:
    .word 0x2012800
PTR_DAT_0801e89c:
    .word 0x6005800
PTR_DAT_0801e8a0:
    .word 0x2012a00
PTR_DAT_0801e8a4:
    .word 0x6005a00
PTR_gBattleChipInventory_0801e8a8:
    .word gBattleChipInventory
