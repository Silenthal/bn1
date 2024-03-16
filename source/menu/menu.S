#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080194c8, 0x80194c8

    .text

tilemapChipDetailFG:
    .incbin "images/menu/chip_detail_fg.tilemap"
tilemapChipDetailText:
    .incbin "images/menu/chip_detail_text.tilemap"
TilemapEntry_ARRAY_08019668:
    .incbin "images/menu/00019668.tilemap"
TilemapEntry_ARRAY_08019718:
    .incbin "images/menu/00019718.tilemap"

_ts InitMenu
    mov        r0,#0x0
    b          _InitMenu

_nt InitMenu_MP
    mov        r0,#0x1

_nt _InitMenu
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    push       { r0, r5 }
    add        r0,r5,#0x0
    mov        r1,#0x54
    bl         memset0_32
    pop        { r0, r5 }
    strb       r0,[r5,#0x3]
    mov        r7,r10
    ldr        r7,[r7,#0x6c]
    ldrb       r0,[r7,#0x6]
    lsl        r0,r0,#0x2
    strb       r0,[r5,#0x0]
    mov        r0,#0x40
    bl         FUN_080194c8
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrh       r0,[r7,#0x4]
    strh       r0,[r7,#0xc]
    push       { r5 }
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        { r5 }
    pop        { pc }

_ts Menu_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    ldr        r0,PTR_JT_R5_74_19820_0801981c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

    .align 2, 0

PTR_JT_R5_74_19820_0801981c:
    .word JT_R5_74_19820
JT_R5_74_19820:
    .word 0x8019ea4+1 @ Menu_Folder_Main
    .word 0x801b404+1 @ Menu_Library_Main
    .word 0x801b954+1 @ Menu_MegaMan_Main
    .word 0x801c168+1 @ Menu_Email_Main
    .word 0x801c6f0+1 @ Menu_Item_Main
    .word 0x801cc88+1 @ Menu_Network_Main
    .word 0x801e4f4+1 @ Menu_Save_Main


_ts Menu_LoadChipData
    ldr        r2,PTR_DAT_080199c8
    ldr        r3,PTR_DAT_080199cc
    mov        r4,#0x0


_nt Menu_LoadChipDataCustom
    mov        r12,r2
    push       {r5,lr}
    push       {r4}
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    strb       r0,[r5,#0x4]
    strb       r1,[r5,#0x5]
    push       {r3,r5}
    ldr        r0,PTR_tilesetChipFrame_080199d0
    mov        r1,r12
    mov        r2,#0xc0
    bl         memcpy_32
    pop        {r3,r5}
    push       {r3,r5}
    ldrb       r1,[r5,#0x4]
    ldr        r0,PTR_TextData_BattleChip_Names_080199d4
    ldr        r2,DAT_080199d8
    add        r2,r2,r3
    ldr        r3,DAT_080199d8
    add        r3,r12
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_080199dc
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r3,r5}
    push       {r3,r5}
    ldrb       r0,[r5,#0x4]
    bl         BattleChip_GetChipData
    pop        {r3,r5}
    str        r0,[r5,#0x8]
    push       {r3,r5}
    ldr        r0,[r0,#0x14]
    ldr        r1,DAT_080199e0
    add        r1,r12
    ldr        r2,DAT_080199e4
    bl         Dma_TransferListAdd
    pop        {r3,r5}
    push       {r3,r5}
    ldrb       r1,[r5,#0x5]
    cmp        r1,#0xff
    beq        LAB_080198b0
    ldr        r0,PTR_tilesetBattleChipCodes_080199e8
    lsl        r1,r1,#0x6
    add        r0,r0,r1
    ldr        r1,DAT_080199ec
    add        r1,r12
    mov        r2,#0x40
    bl         memcpy_32
    b          LAB_080198bc
LAB_080198b0:
    ldr        r0,PTR_tilesetNumbers_080199f0
    ldr        r1,DAT_080199ec
    add        r1,r12
    mov        r2,#0x40
    bl         memcpy_32
LAB_080198bc:
    ldr        r0,PTR_tilesetNumbers_080199f0
    ldr        r1,DAT_080199f4
    add        r1,r12
    mov        r2,#0x40
    bl         memcpy_32
    pop        {r3,r5}
    ldr        r0,[r5,#0x8]
    ldrb       r1,[r0,#0x5]
    lsl        r1,r1,#0x7
    ldr        r0,PTR_tilesetBattleChipElements_080199f8
    add        r0,r0,r1
    push       {r3,r5}
    ldr        r1,DAT_080199fc
    add        r1,r12
    mov        r2,#0x80
    bl         memcpy_32
    pop        {r3,r5}
    mov        r1,#0x17
    ldr        r0,[r5,#0x8]
    ldrh       r0,[r0,#0xc]
    tst        r0,r0
    beq        LAB_080198f4
    mov        r1,#0x16
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    str        r0,[r7,#0x4]
LAB_080198f4:
    push       {r3,r5}
    ldr        r0,PTR_textDict_MenuMessages_08019a00
    ldr        r2,DAT_08019a04
    add        r2,r2,r3
    ldr        r3,DAT_08019a04
    add        r3,r12
    mov        r4,#0x4
    mov        r5,#0x1
    ldr        r6,PTR_tilesetNumbers_080199f0
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r3,r5}
    push       {r3,r5}
    ldrb       r1,[r5,#0x4]
    ldr        r0,PTR_TextData_BattleChip_Descriptions_08019a08
    ldr        r2,DAT_08019a0c
    add        r2,r2,r3
    ldr        r3,DAT_08019a0c
    add        r3,r12
    mov        r4,#0xa
    mov        r5,#0x3
    ldr        r6,PTR_tilesetDialogueText_080199dc
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r3,r5}
    pop        {r0}
    mov        r12,r0
    push       {r5}
    ldr        r0,[r5,#0x8]
    ldr        r0,[r0,#0x18]
    ldr        r1,PTR_eBgPalette0_08019a10
    add        r1,r12
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_paletteFolder1_08019a14
    ldr        r1,PTR_eBgPalette1_08019a18
    add        r1,r12
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_paletteFolder2_08019a1c
    ldr        r1,PTR_eBgPalette2_08019a20
    add        r1,r12
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_paletteCustomScreenBg_1_08019a24
    ldr        r1,PTR_eBgPalette3_08019a28
    add        r1,r12
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    pop        {r5,pc}


_ts Menu_LoadChipDetail
    push       {r5,lr}
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    ldrb       r0,[r5,#0x7]
    tst        r0,r0
    beq        LAB_080199b6
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    ldr        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x50]
    mov        r8,r0
    mov        r9,r1
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipDetailBG_08019a2c
    mov        r4,#0xa
    mov        r5,#0xd
    bl         LC_Screen_SafeCopyTileMapRect
    mov        r0,#0x1
    add        r0,r8
    mov        r1,#0x1
    add        r1,r9
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipDetailFG_08019a30
    mov        r4,#0x8
    mov        r5,#0xb
    bl         LC_Screen_SafeCopyTileMapRect
    mov        r0,r8
    mov        r1,#0xd
    add        r1,r9
    mov        r2,#0x0
    ldr        r3,PTR_tilemapChipDetailText_08019a34
    mov        r4,#0xa
    mov        r5,#0x6
    bl         LC_Screen_SafeCopyTileMapRect
LAB_080199b6:
    pop        {r5,pc}


_ts Menu_ShowChipDetail
    push       {r5,lr}
    mov        r7,r10
    ldr        r5,[r7,#0x74]
    str        r0,[r5,#0x4c]
    str        r1,[r5,#0x50]
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    pop        {r5,pc}
PTR_DAT_080199c8:
    .word 0x600a000
PTR_DAT_080199cc:
    .word 0x2029000
PTR_tilesetChipFrame_080199d0:
    .word tilesetChipFrame
PTR_TextData_BattleChip_Names_080199d4:
    .word TextData_BattleChip_Names
DAT_080199d8:
    .word 0x200
PTR_tilesetDialogueText_080199dc:
    .word tilesetDialogueText
DAT_080199e0:
    .word 0x400
DAT_080199e4:
    .word 0x1C0
PTR_tilesetBattleChipCodes_080199e8:
    .word tilesetBattleChipCodes
DAT_080199ec:
    .word 0xC00
PTR_tilesetNumbers_080199f0:
    .word tilesetNumbers
DAT_080199f4:
    .word 0xC40
PTR_tilesetBattleChipElements_080199f8:
    .word tilesetBattleChipElements
DAT_080199fc:
    .word 0xC80
PTR_textDict_MenuMessages_08019a00:
    .word textDict_MenuMessages
DAT_08019a04:
    .word 0xD00
PTR_TextData_BattleChip_Descriptions_08019a08:
    .word TextData_BattleChip_Descriptions
DAT_08019a0c:
    .word 0xE00
PTR_eBgPalette0_08019a10:
    .word eBgPalette0
PTR_paletteFolder1_08019a14:
    .word paletteFolder1
PTR_eBgPalette1_08019a18:
    .word eBgPalette1
PTR_paletteFolder2_08019a1c:
    .word paletteFolder2
PTR_eBgPalette2_08019a20:
    .word eBgPalette2
PTR_paletteCustomScreenBg_1_08019a24:
    .word paletteCustomScreenBg_1
PTR_eBgPalette3_08019a28:
    .word eBgPalette3
PTR_tilemapChipDetailBG_08019a2c:
    .word tilemapChipDetailBG
PTR_tilemapChipDetailFG_08019a30:
    .word tilemapChipDetailFG
PTR_tilemapChipDetailText_08019a34:
    .word tilemapChipDetailText
