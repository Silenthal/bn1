#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc+1

tilemapMegaManStats:
    .incbin "images/start_menu/megaman/stat_1.tilemap"
    .incbin "images/start_menu/megaman/stat_2.tilemap"
    .incbin "images/start_menu/megaman/stat_3.tilemap"
    .incbin "images/start_menu/megaman/stat_4.tilemap"
    .incbin "images/start_menu/megaman/stat_5.tilemap"


_ts Menu_2_MegaMan
    push       {lr}
    ldr        r0,PTR_PTR_Menu_MegaMan_0_Init_0801b964
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_Menu_MegaMan_0_Init_0801b964:
    .word PTR_Menu_MegaMan_0_Init_0801b968
PTR_Menu_MegaMan_0_Init_0801b968:
    .word Menu_MegaMan_0_Init
    .word Menu_MegaMan_1_Main
    .word Menu_MegaMan_2_Close
    .word Menu_MegaMan_3_Armor
    .word Menu_MegaMan_4_Stats
    .word Menu_MegaMan_4_Stats
    .word Menu_MegaMan_4_Stats


_ts Menu_MegaMan_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801bce8
    ldr        r1,PTR_DAT_0801bcec
    ldr        r2,DAT_0801bcf0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801bcf4
    ldr        r1,PTR_eBgPalette4_0801bcf8
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuMegaManSideArrow_0801bcfc
    ldr        r1,PTR_DAT_0801bd00
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetChipLibraryNumbers_0801bd04
    ldr        r1,PTR_DAT_0801bd08
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetArmor_0801bd0c
    ldr        r1,PTR_DAT_0801bd10
    mov        r2,#0xb0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801bd14
    ldr        r1,PTR_eBgPaletteF_0801bd18
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuMegaMan_0801bd1c
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801bd20
    add        r1,r1,r2
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801bd24
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
    bl         Menu_MegaMan_LoadItemData
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
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


_ts Menu_MegaMan_1_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ba32
    bl         Menu_MegaMan_HandleInput
LAB_0801ba32:
    bl         Menu_MegaMan_PrintUI
    mov        r0,#0x0
    pop        {pc}


_ts Menu_MegaMan_2_Close
    push       {lr}
    bl         Menu_MegaMan_PrintUI
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ba94
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801ba62
    mov        r1,#0x4
LAB_0801ba62:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801bd28
    ldr        r1,PTR_eBgPaletteF_0801bd2c
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801ba94:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_MegaMan_PrintUI
    push       {lr}
    bl         Menu_MegaMan_PrintHP
    bl         Menu_MegaMan_PrintLevel
    bl         Menu_MegaMan_PrintArmor
    bl         Menu_MegaMan_PrintStatLines
    bl         Menu_MegaMan_PrintMenuArrow
    pop        {pc}


_ts Menu_MegaMan_3_Armor
    push       {lr}
    ldr        r0,PTR_PTR_Menu_MegaMan_3_0_ShowArmorChangeDialog
    ldrb       r1,[r5,#0x2]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Menu_MegaMan_PrintUI
    mov        r0,#0x0
    pop        {pc}
PTR_Menu_MegaMan_3_0_ShowArmorChangeDialogue:
    .word Menu_MegaMan_3_0_ShowArmorChangeDialogue
    .word Menu_MegaMan_3_1_ChangeArmor
    .word Menu_MegaMan_3_2_Close


_ts Menu_MegaMan_3_0_ShowArmorChangeDialogue
    push       {r5,lr}
    ldrb       r1,[r5,#0x12]
    tst        r1,r1
    bne        LAB_0801bade
    mov        r0,#0x8
    mov        r1,#0x35
    b          LAB_0801bae2
LAB_0801bade:
    mov        r0,#0x4
    add        r1,#0x35
LAB_0801bae2:
    strb       r0,[r5,#0x2]
    mov        r7,r10
    ldr        r7,[r7,#0x48]
    add        r7,#0x30
    add        r5,#0x17
    mov        r0,#0x3
LAB_0801baee:
    ldrb       r2,[r5,#0x0]
    str        r2,[r7,#0x0]
    add        r5,#0x1
    add        r7,#0x4
    sub        r0,#0x1
    bge        LAB_0801baee
    ldr        r0,PTR_textDict_MenuMessages_0801bd34
    bl         Text_LoadDialogue
    pop        {r5,pc}


_ts Menu_MegaMan_3_1_ChangeArmor
    push       {r5,lr}
    mov        r0,#0x20
    bl         Text_CheckOption
    beq        LAB_0801bb4c
    bl         TextOption_GetDefaultOption
    ldrb       r1,[r5,#0x12]
    cmp        r0,r1
    beq        LAB_0801bb3e
    add        r0,r0,r5
    ldrb       r1,[r0,#0x17]
    mov        r7,r10
    ldr        r7,[r7,#0x48]
    str        r1,[r7,#0x30]
    sub        r1,#0x42
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r1,[r7,#0x17]
    tst        r1,r1
    beq        LAB_0801bb30
    mov        r1,#0x1
LAB_0801bb30:
    ldr        r0,PTR_textDict_MenuMessages_0801bd34
    add        r1,#0x2b
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    b          LAB_0801bb48
LAB_0801bb3e:
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Set400
    mov        r5,r8
LAB_0801bb48:
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_0801bb4c:
    pop        {r5,pc}


_ts Menu_MegaMan_3_2_Close
    push       {lr}
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Get400
    mov        r5,r8
    beq        LAB_0801bb7c
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r5,r8
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r0,#0x10
    strb       r0,[r5,#0x13]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    bl         Menu_MegaMan_LoadItemData
LAB_0801bb7c:
    pop        {pc}


_ts Menu_MegaMan_4_Stats
    push       {lr}
    ldr        r0,PTR_PTR_Menu_MegaMan_4_0_CheckStatRaise_0801
    ldrb       r1,[r5,#0x2]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Menu_MegaMan_PrintUI
    mov        r0,#0x0
    pop        {pc}
PTR_Menu_MegaMan_4_0_CheckStatRaise_0801bb94:
    .word Menu_MegaMan_4_0_CheckStatRaise
    .word Menu_MegaMan_4_1_RaiseStat
    .word Menu_MegaMan_4_2_Close


_ts Menu_MegaMan_4_0_CheckStatRaise
    push       {r5,lr}
    push       {r5}
    mov        r0,#0x41
    bl         KeyItem_IsPresent
    pop        {r5}
    ldrb       r1,[r5,#0xc]
    sub        r1,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    add        r7,#0x14
    add        r7,r7,r1
    ldrb       r2,[r7,#0x0]
    cmp        r2,#0x4
    bge        LAB_0801bbc8
    tst        r0,r0
    bne        LAB_0801bbd4
    mov        r2,#0x8
    @ No powerups to use
    mov        r1,#0x34
    b          LAB_0801bbdc
LAB_0801bbc8:
    mov        r2,#0x8
    mov        r1,#0x33
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    b          LAB_0801bbdc
LAB_0801bbd4:
    mov        r2,#0x4
    ldrb       r1,[r5,#0xc]
    lsl        r1,r1,#0x1
    add        r1,#0x2b
LAB_0801bbdc:
    strb       r2,[r5,#0x2]
    mov        r7,r10
    ldr        r7,[r7,#0x48]
    ldr        r0,PTR_textDict_MenuMessages_0801bd34
    bl         Text_LoadDialogue
    pop        {r5,pc}


_ts Menu_MegaMan_4_1_RaiseStat
    push       {r5,lr}
    mov        r0,#0x20
    bl         Text_CheckOption
    beq        LAB_0801bc3a
    bl         TextOption_GetDefaultOption
    cmp        r0,#0x1
    beq        LAB_0801bc2c
    ldrb       r1,[r5,#0xc]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    add        r7,#0x14
    add        r7,r7,r1
    sub        r7,#0x1
    ldrb       r2,[r7,#0x0]
    add        r2,#0x1
    strb       r2,[r7,#0x0]
    push       {r1,r5}
    mov        r0,#0x41
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    pop        {r1,r5}
    lsl        r1,r1,#0x1
    add        r1,#0x2c
    ldr        r0,PTR_textDict_MenuMessages_0801bd34
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    b          LAB_0801bc36
LAB_0801bc2c:
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Set400
    mov        r5,r8
LAB_0801bc36:
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
LAB_0801bc3a:
    pop        {r5,pc}


_ts Menu_MegaMan_4_2_Close
    push       {lr}
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Get400
    mov        r5,r8
    beq        LAB_0801bc68
    mov        r8,r5
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r5,r8
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r0,#0x10
    strb       r0,[r5,#0x13]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    bl         Menu_MegaMan_LoadItemData
LAB_0801bc68:
    pop        {pc}


_ts Menu_MegaMan_LoadItemData
    push       {lr}
    push       {r5}
    mov        r0,#0x0
    mov        r8,r0
    add        r5,#0x17
    mov        r9,r5
    mov        r0,#0x42
    bl         Menu_MegaMan_AddArmorIfPresent
    mov        r0,#0x44
    bl         Menu_MegaMan_AddArmorIfPresent
    mov        r0,#0x45
    bl         Menu_MegaMan_AddArmorIfPresent
    mov        r0,#0x46
    bl         Menu_MegaMan_AddArmorIfPresent
    pop        {r5}
    mov        r0,r8
    strb       r0,[r5,#0x12]
    push       {r5}
    mov        r0,#0x41
    bl         KeyItem_IsPresent
    add        r8,r0
    mov        r0,r8
    cmp        r0,#0x0
    beq        LAB_0801bcac
    mov        r0,#0x1
    mov        r1,#0x29
    b          LAB_0801bcb0
LAB_0801bcac:
    mov        r0,#0x0
    mov        r1,#0x28
LAB_0801bcb0:
    pop        {r5}
    strb       r0,[r5,#0x11]
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801bd34
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}


_ts Menu_MegaMan_AddArmorIfPresent
    push       {lr}
    push       {r0}
    bl         KeyItem_IsPresent
    pop        {r0}
    beq        LAB_0801bce4
    mov        r5,r9
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x17]
    add        r1,#0x42
    cmp        r0,r1
    beq        LAB_0801bce4
    mov        r1,#0x1
    add        r8,r1
    strb       r0,[r5,#0x0]
    add        r5,#0x1
    mov        r9,r5
LAB_0801bce4:
    pop        {pc}

   .align 2, 0

PTR_tilesetMenuDesign_0801bce8:
    .word tilesetMenuDesign
PTR_DAT_0801bcec:
    .word 0x6000020
DAT_0801bcf0:
    .word 0x540
PTR_paletteMenuDesign_0801bcf4:
    .word paletteMenuDesign
PTR_eBgPalette4_0801bcf8:
    .word eBgPalette4
PTR_tilesetMenuMegaManSideArrow_0801bcfc:
    .word tilesetMenuMegaManSideArrow
PTR_DAT_0801bd00:
    .word 0x6004020
PTR_tilesetChipLibraryNumbers_0801bd04:
    .word tilesetChipLibraryNumbers
PTR_DAT_0801bd08:
    .word 0x6003c00
PTR_tilesetArmor_0801bd0c:
    .word tilesetArmor
PTR_DAT_0801bd10:
    .word 0x6003800
PTR_paletteMenuSideArrow_0801bd14:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801bd18:
    .word eBgPaletteF
PTR_tilemapMenuMegaMan_0801bd1c:
    .word tilemapMenuMegaMan
DAT_0801bd20:
    .word 0x800
PTR_DAT_0801bd24:
    .word 0x1F40
PTR_paletteKeyboardNumberChars_0801bd28:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801bd2c:
    .word eBgPaletteF
PTR_PTR_Menu_MegaMan_3_0_ShowArmorChangeDialog:
    .word PTR_Menu_MegaMan_3_0_ShowArmorChangeDialogue
PTR_textDict_MenuMessages_0801bd34:
    .word textDict_MenuMessages
PTR_PTR_Menu_MegaMan_4_0_CheckStatRaise_0801:
    .word PTR_Menu_MegaMan_4_0_CheckStatRaise_0801bb94


_ts Menu_MegaMan_HandleInput
    push       {lr}
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    ldrb       r0,[r5,#0x13]
    tst        r0,r0
    beq        LAB_0801bd4c
    sub        r0,#0x1
    strb       r0,[r5,#0x13]
LAB_0801bd4c:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801bd70
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801bdc0
LAB_0801bd70:
    ldrb       r1,[r5,#0x11]
    tst        r1,r1
    beq        LAB_0801bdc0
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801bd96
    ldrb       r2,[r5,#0x13]
    tst        r2,r2
    beq        LAB_0801bd84
    b          LAB_0801bdc0
LAB_0801bd84:
    ldrb       r0,[r5,#0xc]
    lsl        r0,r0,#0x2
    add        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strb       r0,[r5,#0x2]
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    b          LAB_0801bdc0
LAB_0801bd96:
    ldrb       r2,[r5,#0xc]
    ldrh       r0,[r7,#0x4]
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801bda4
    sub        r2,#0x1
    b          LAB_0801bdac
LAB_0801bda4:
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801bdac
    add        r2,#0x1
LAB_0801bdac:
    ldrb       r4,[r5,#0xc]
    cmp        r2,r4
    bne        LAB_0801bdb4
    b          LAB_0801bdba
LAB_0801bdb4:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801bdba:
    mov        r0,#0x3
    and        r2,r0
    strb       r2,[r5,#0xc]
LAB_0801bdc0:
    pop        {pc}


_ts Menu_MegaMan_PrintHP
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrh       r0,[r7,#0x1c]
    mov        r1,#0x4
    bl         Menu_PrintToBuffer
    push       {r5}
    mov        r0,#0x5
    mov        r1,#0x4
    mov        r2,#0x2
    add        r3,r5,#0x0
    add        r3,#0x2c
    mov        r4,#0x4
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    pop        {pc}


_ts Menu_PrintToBuffer
    push       {r5,lr}
    mov        r8,r0
    lsl        r1,r1,#0xc
    mov        r9,r1
    add        r0,r5,#0x0
    add        r0,#0x2c
    mov        r1,#0x10
    mov        r2,#0x80
    lsl        r2,r2,#0x8
    bl         memset_16
    mov        r0,r8
    mov        r1,r9
    tst        r0,r0
    beq        LAB_0801be46
    bl         ConvertNumToBCD
    mov        r8,r0
    mov        r5,r10
    ldr        r5,[r5,#0x74]
    mov        r0,#0xc
    add        r1,r5,#0x0
    add        r1,#0x2c
    mov        r2,#0xf
    ldr        r3,DAT_0801bfb0
    add        r3,r9
    mov        r9,r3
    mov        r6,#0x0
LAB_0801be24:
    mov        r7,r8
    lsr        r7,r0
    and        r7,r2
    tst        r6,r6
    bne        LAB_0801be32
    tst        r7,r7
    beq        LAB_0801be3e
LAB_0801be32:
    lsl        r7,r7,#0x1
    add        r7,r9
    add        r6,#0x1
    strh       r7,[r1,#0x0]
    add        r7,#0x1
    strh       r7,[r1,#0x8]
LAB_0801be3e:
    add        r1,#0x2
    sub        r0,#0x4
    bge        LAB_0801be24
    b          LAB_0801be58
LAB_0801be46:
    mov        r5,r10
    ldr        r5,[r5,#0x74]
    add        r1,r5,#0x0
    add        r1,#0x2c
    ldr        r3,DAT_0801bfb0
    add        r3,r9
    strh       r3,[r1,#0x6]
    add        r3,#0x1
    strh       r3,[r1,#0xe]
LAB_0801be58:
    pop        {r5,pc}


_ts Menu_MegaMan_PrintStatLines
    push       {r5,lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x14]
    ldr        r3,PTR_tilemapMegaManStats_0801bfb4
    mov        r1,#0x14
    mul        r0,r1
    add        r3,r3,r0
    mov        r0,#0x18
    mov        r1,#0x5
    mov        r2,#0x2
    mov        r4,#0x5
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x15]
    ldr        r3,PTR_tilemapMegaManStats_0801bfb8
    mov        r1,#0x14
    mul        r0,r1
    add        r3,r3,r0
    mov        r0,#0x18
    mov        r1,#0x7
    mov        r2,#0x2
    mov        r4,#0x5
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x16]
    ldr        r3,PTR_tilemapMegaManStats_0801bfbc
    mov        r1,#0x14
    mul        r0,r1
    add        r3,r3,r0
    mov        r0,#0x18
    mov        r1,#0x9
    mov        r2,#0x2
    mov        r4,#0x5
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}


_ts Menu_MegaMan_PrintMenuArrow
    push       {r5,lr}
    ldrb       r1,[r5,#0xd]
    lsl        r1,r1,#0x1
    add        r1,#0x3
    mov        r8,r5
    mov        r0,#0xf
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r0,[r5,#0x11]
    tst        r0,r0
    beq        LAB_0801befe
    ldrb       r1,[r5,#0x10]
    ldrb       r2,[r5,#0x14]
    tst        r2,r2
    bne        LAB_0801bee4
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801bee4
    mov        r1,#0x0
LAB_0801bee4:
    strb       r1,[r5,#0x10]
    ldr        r3,PTR_tilemapListSideArrow_0801bfc0
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    ldrb       r1,[r5,#0xc]
    lsl        r1,r1,#0x1
    add        r1,#0x3
    mov        r0,#0xf
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801befe:
    pop        {r5,pc}


_ts Menu_MegaMan_PrintLevel
    push       {r5,lr}
    bl         Status_GetLevel
    mov        r5,r10
    ldr        r5,[r5,#0x74]
    mov        r1,#0x4
    bl         Menu_PrintToBuffer
    mov        r0,#0x18
    mov        r1,#0x0
    mov        r2,#0x2
    add        r3,r5,#0x0
    add        r3,#0x2c
    mov        r4,#0x4
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}


_ts Menu_MegaMan_PrintArmor
    push       {r5,lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x17]
    ldr        r3,PTR_PTR_tilemapArmor_0801bfc4
    lsl        r0,r0,#0x2
    ldr        r3,[r3,r0]
    mov        r0,#0x12
    mov        r1,#0x3
    mov        r2,#0x2
    mov        r4,#0x8
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapArmorNone_0801bf44:
    .word tilemapArmorNone
    .word 0
    .word tilemapArmorHeat
    .word tilemapArmorAqua
    .word tilemapArmorWood


_ts Status_GetLevel
    push       {lr}
    mov        r0,#0x40
    bl         KeyItem_IsPresent
    add        r0,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x14]
    ldrb       r2,[r7,#0x15]
    ldrb       r3,[r7,#0x16]
    add        r1,r1,r2
    add        r1,r1,r3
    mov        r2,#0x3
    mul        r1,r2
    add        r0,r0,r1
    push       {r0}
    mov        r0,#0x45
    bl         KeyItem_IsPresent
    mov        r2,#0x6
    mul        r0,r2
    add        r1,r0,#0x0
    pop        {r0}
    add        r0,r0,r1
    push       {r0}
    mov        r0,#0x44
    bl         KeyItem_IsPresent
    mov        r2,#0x6
    mul        r0,r2
    add        r1,r0,#0x0
    pop        {r0}
    add        r0,r0,r1
    push       {r0}
    mov        r0,#0x46
    bl         KeyItem_IsPresent
    mov        r2,#0x6
    mul        r0,r2
    add        r1,r0,#0x0
    pop        {r0}
    add        r0,r0,r1
    pop        {pc}

    .align 2, 0

DAT_0801bfb0:
    .word 0x1E0
PTR_tilemapMegaManStats_0801bfb4:
    .word tilemapMegaManStats
PTR_tilemapMegaManStats_0801bfb8:
    .word tilemapMegaManStats
PTR_tilemapMegaManStats_0801bfbc:
    .word tilemapMegaManStats
PTR_tilemapListSideArrow_0801bfc0:
    .word tilemapListSideArrow
PTR_PTR_tilemapArmor_0801bfc4:
    .word PTR_tilemapArmorNone_0801bf44
