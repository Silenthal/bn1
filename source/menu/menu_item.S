#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc+1

tilemapItemListLeft:
    .incbin "images/start_menu/item/list_left.tilemap"
tilemapItemListRight:
    .incbin "images/start_menu/item/list_right.tilemap"


_ts Menu_4_Item
    push       {lr}
    ldr        r0,PTR_PTR_Menu_Item_0_Init_0801ca78
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_Menu_Item_0_Init_0801c700:
    .word Menu_Item_0_Init
    .word Menu_Item_1_Main
    .word Menu_Item_2_Close


_ts Menu_Item_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801ca7c
    ldr        r1,PTR_DAT_0801ca80
    ldr        r2,DAT_0801ca84
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801ca88
    ldr        r1,PTR_eBgPalette4_0801ca8c
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801ca90
    ldr        r1,PTR_DAT_0801ca94
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuUpDownArrow_0801ca98
    ldr        r1,PTR_DAT_0801ca9c
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801caa0
    ldr        r1,PTR_eBgPaletteF_0801caa4
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuItem_0801caa8
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801caac
    add        r1,r1,r2
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    mov        r0,#0x4
    mov        r1,#0x3
    mov        r2,#0x2
    ldr        r3,PTR_tilemapItemListLeft_0801cab0
    mov        r4,#0x8
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    mov        r0,#0x12
    mov        r1,#0x3
    mov        r2,#0x2
    ldr        r3,PTR_tilemapItemListRight_0801cab4
    mov        r4,#0x8
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801cab8
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
    ldr        r0,PTR_DAT_0801cabc
    mov        r1,#0x40
    mov        r2,#0x60
    bl         memset
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    push       {r5}
    mov        r0,#0x0
    mov        r9,r0
LAB_0801c7b4:
    mov        r8,r0
    bl         KeyItem_IsPresent
    beq        LAB_0801c7ca
    mov        r0,r9
    ldr        r1,PTR_DAT_0801cabc
    add        r1,r1,r0
    mov        r2,r8
    strb       r2,[r1,#0x0]
    add        r0,#0x1
    mov        r9,r0
LAB_0801c7ca:
    mov        r0,r8
    add        r0,#0x1
    cmp        r0,#0x40
    blt        LAB_0801c7b4
    pop        {r5}
    mov        r0,r9
    strb       r0,[r5,#0x10]
    push       {r2,r3,r5}
    ldr        r0,PTR_DialogueData_Item_Descriptions_0801cac0
    ldr        r3,PTR_DAT_0801cabc
    ldrb       r1,[r3,#0x0]
    bl         Text_LoadDialogue
    pop        {r2,r3,r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Item_1_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801c802
    bl         Menu_Item_HandleInput
LAB_0801c802:
    bl         Menu_DrawUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Item_2_Close
    push       {lr}
    bl         Menu_DrawUi
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801c864
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801c832
    mov        r1,#0x4
LAB_0801c832:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801cac4
    ldr        r1,PTR_eBgPaletteF_0801cac8
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801c864:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_DrawUi
    push       {lr}
    bl         Menu_Item_LoadNames
    bl         Menu_Item_DrawArrows
    pop        {pc}


_ts Menu_Item_HandleInput
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
    beq        LAB_0801c8a2
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801c97a
LAB_0801c8a2:
    ldrb       r2,[r5,#0xc]
    ldrb       r3,[r5,#0xe]
    ldrb       r6,[r5,#0x10]
    tst        r6,r6
    beq        LAB_0801c97a
    mov        r1,#0x20
    tst        r1,r0
    beq        LAB_0801c8b8
    mov        r4,#0xfe
    and        r2,r4
    b          LAB_0801c8c2
LAB_0801c8b8:
    mov        r1,#0x10
    tst        r1,r0
    beq        LAB_0801c8d2
    mov        r4,#0x1
    orr        r2,r4
LAB_0801c8c2:
    ldr        r4,PTR_DAT_0801cabc
    add        r4,r4,r2
    ldrb       r1,[r4,r3]
    cmp        r1,#0x60
    bne        LAB_0801c952
    sub        r2,#0x2
    ble        LAB_0801c97a
    b          LAB_0801c952
LAB_0801c8d2:
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_0801cacc
    tst        r4,r1
    beq        LAB_0801c8e2
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_0801c8e2:
    mov        r4,#0x8
    ldr        r1,DAT_0801cad0
    tst        r1,r0
    bne        LAB_0801c8fa
    mov        r4,#0x2
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801c902
    sub        r2,r2,r4
    bge        LAB_0801c902
    mov        r6,#0x1
    and        r2,r6
LAB_0801c8fa:
    sub        r3,r3,r4
    bgt        LAB_0801c952
    mov        r3,#0x0
    b          LAB_0801c952
LAB_0801c902:
    mov        r4,#0x8
    ldr        r1,DAT_0801cad4
    tst        r1,r0
    bne        LAB_0801c930
    mov        r4,#0x2
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801c952
    ldrb       r6,[r5,#0x10]
    sub        r6,#0x1
    sub        r6,r6,r3
    cmp        r6,#0x7
    blt        LAB_0801c91e
    mov        r6,#0x7
LAB_0801c91e:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801c952
    mov        r1,#0x1
    tst        r2,r1
    beq        LAB_0801c92e
    add        r2,r6,#0x0
    b          LAB_0801c930
LAB_0801c92e:
    sub        r2,r2,r4
LAB_0801c930:
    cmp        r6,#0x7
    blt        LAB_0801c952
    ldrb       r1,[r5,#0x10]
    sub        r1,#0x8
    add        r3,r3,r4
    cmp        r3,r1
    ble        LAB_0801c952
    add        r3,r1,#0x0
    add        r3,#0x1
    mov        r1,#0xfe
    and        r3,r1
    ldr        r4,PTR_DAT_0801cabc
    add        r4,r4,r2
    ldrb       r1,[r4,r3]
    cmp        r1,#0x60
    bne        LAB_0801c952
    sub        r2,#0x1
LAB_0801c952:
    ldrb       r4,[r5,#0xc]
    cmp        r2,r4
    bne        LAB_0801c960
    ldrb       r4,[r5,#0xe]
    cmp        r3,r4
    bne        LAB_0801c960
    b          LAB_0801c976
LAB_0801c960:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    push       {r2,r3,r5}
    ldr        r0,PTR_DialogueData_Item_Descriptions_0801cac0
    add        r2,r2,r3
    ldr        r3,PTR_DAT_0801cabc
    ldrb       r1,[r3,r2]
    bl         Text_LoadDialogue
    pop        {r2,r3,r5}
LAB_0801c976:
    strb       r2,[r5,#0xc]
    strb       r3,[r5,#0xe]
LAB_0801c97a:
    pop        {pc}


_ts Menu_Item_LoadNames
    push       {r5,lr}
    ldrb       r0,[r5,#0xe]
    ldr        r2,PTR_DAT_0801cad8
    ldr        r3,PTR_DAT_0801cadc
    add        r1,r0,#0x0
    mov        r0,#0x0
LAB_0801c988:
    push       {r0,r1,r2,r3}
    ldr        r0,PTR_DialogueData_Item_Names_0801cae0
    ldr        r4,PTR_DAT_0801cabc
    ldrb       r1,[r4,r1]
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801cae4
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3}
    mov        r4,#0x2
    lsl        r4,r4,#0x8
    add        r2,r2,r4
    add        r3,r3,r4
    add        r0,#0x1
    add        r1,#0x1
    cmp        r0,#0x8
    blt        LAB_0801c988
    pop        {r5,pc}


_ts Menu_Item_DrawArrows
    push       {r5,lr}
    mov        r8,r5
    ldrb       r1,[r5,#0xd]
    mov        r0,#0x1
    and        r0,r1
    ldr        r2,PTR_itemOffsetArrowX_0801cae8
    ldrb       r0,[r2,r0]
    mov        r2,#0xfe
    and        r1,r2
    add        r1,#0x3
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r1,[r5,#0x11]
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801c9dc
    mov        r1,#0x0
LAB_0801c9dc:
    strb       r1,[r5,#0x11]
    ldr        r3,PTR_tilemapListSideArrow_0801caec
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    ldrb       r1,[r5,#0xc]
    mov        r0,#0x1
    and        r0,r1
    ldr        r2,PTR_itemOffsetArrowX_0801caf0
    ldrb       r0,[r2,r0]
    mov        r2,#0xfe
    and        r1,r2
    add        r1,#0x3
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,#0xd
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r0,#0xd
    mov        r1,#0xa
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r0,[r5,#0x10]
    cmp        r0,#0x8
    ble        LAB_0801ca74
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    mov        r5,r8
    ldrb       r0,[r5,#0xe]
    ldr        r3,PTR_tilemapUpDownArrows_0801caf4
    add        r3,r3,r1
    mov        r8,r3
    cmp        r0,#0x0
    beq        LAB_0801ca54
    push       {r5}
    mov        r9,r0
    mov        r0,#0xd
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,r9
    pop        {r5}
LAB_0801ca54:
    ldrb       r5,[r5,#0x10]
    add        r5,#0x1
    mov        r1,#0xfe
    and        r5,r1
    sub        r5,#0x8
    cmp        r0,r5
    beq        LAB_0801ca74
    mov        r0,#0xd
    mov        r1,#0xa
    mov        r2,#0x2
    mov        r3,r8
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801ca74:
    pop        {r5,pc}
itemOffsetArrowX:
    .byte 0x1, 0xF
PTR_PTR_Menu_Item_0_Init_0801ca78:
    .word PTR_Menu_Item_0_Init_0801c700
PTR_tilesetMenuDesign_0801ca7c:
    .word tilesetMenuDesign
PTR_DAT_0801ca80:
    .word 0x6000020
DAT_0801ca84:
    .word 0x540
PTR_paletteMenuDesign_0801ca88:
    .word paletteMenuDesign
PTR_eBgPalette4_0801ca8c:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801ca90:
    .word tilesetMenuSideArrow
PTR_DAT_0801ca94:
    .word 0x6004020
PTR_tilesetMenuUpDownArrow_0801ca98:
    .word tilesetMenuUpDownArrow
PTR_DAT_0801ca9c:
    .word 0x6004240
PTR_paletteMenuSideArrow_0801caa0:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801caa4:
    .word eBgPaletteF
PTR_tilemapMenuItem_0801caa8:
    .word tilemapMenuItem
DAT_0801caac:
    .word 0x800
PTR_tilemapItemListLeft_0801cab0:
    .word tilemapItemListLeft
PTR_tilemapItemListRight_0801cab4:
    .word tilemapItemListRight
PTR_DAT_0801cab8:
    .word 0x1f40
PTR_DAT_0801cabc:
    .word 0x2013400
PTR_DialogueData_Item_Descriptions_0801cac0:
    .word DialogueData_Item_Descriptions
PTR_paletteKeyboardNumberChars_0801cac4:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801cac8:
    .word eBgPaletteF
DAT_0801cacc:
    .word 0x300
DAT_0801cad0:
    .word 0x200
DAT_0801cad4:
    .word 0x100
PTR_DAT_0801cad8:
    .word 0x2011400
PTR_DAT_0801cadc:
    .word 0x6004400
PTR_DialogueData_Item_Names_0801cae0:
    .word DialogueData_Item_Names
PTR_tilesetDialogueText_0801cae4:
    .word tilesetDialogueText
PTR_itemOffsetArrowX_0801cae8:
    .word itemOffsetArrowX
PTR_tilemapListSideArrow_0801caec:
    .word tilemapListSideArrow
PTR_itemOffsetArrowX_0801caf0:
    .word itemOffsetArrowX
PTR_tilemapUpDownArrows_0801caf4:
    .word tilemapUpDownArrows
