#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set BuildChipSack, 0x3007518+1
    .set listDefaultSort, 0x30072b0

    .text

_ts InitChipTraderFromScript
    push       { lr }
    push       { r0 }
    bl         InitChipTrader
    pop        { r0 }
    ldr        r5,PTR_gChipTrader_08020108
    strh       r0,[r5,#0x4]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrh       r0,[r7,#0x4]
    strh       r0,[r7,#0xc]
    pop        { pc }

_ts InitChipTrader
    push       { lr }
    ldr        r0,PTR_gChipTrader_08020108
    mov        r1,#0x40
    bl         memset0_32
    pop        { pc }

_ts ChipTrader_Main
    push       { lr }
    ldr        r5,PTR_gChipTrader_08020108
    ldr        r0,PTR_JT_R5_2007530_20110_0802010c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

PTR_gChipTrader_08020108:
    .word gChipTrader
PTR_JT_R5_2007530_20110_0802010c:
    .word JT_R5_2007530_20110
JT_R5_2007530_20110:
    .word ChipTrader_0_Init
    .word ChipTrader_1_Main
    .word ChipTrader_1_Main
    .word ChipTrader_3_CloseAndPullChip
    .word ChipTrader_4_Sort
    .word ChipTrader_3_CloseAndPullChip
    .word ChipTrader_6_ConfirmTrade


_ts ChipTrader_0_Init
    push       {lr}
    bl         ChipTrader_LoadGraphicData
    ldr        r0,PTR_BuildChipSack_080201c4
    mov        lr,pc
    bx         r0
    strh       r0,[r5,#0x18]
    mov        r0,#0x0
    ldr        r1,PTR_gChipBag_080201c0
    bl         Menu_LoadSackPageInfo
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapChipTrader_080201bc
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    mov        r2,#0x80
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    ldr        r2,DAT_080201b8
    bl         Dma_TransferListAdd
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,INT_080201b4
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
    bl         BgUpdate_Init
    bl         InitBgTask
    bl         Text_DisableDialogue
    mov        r0,#0x6
    bl         Flag_Clear400
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#0x6]
    strh       r0,[r5,#0x8]
    strh       r0,[r5,#0xa]
    strh       r0,[r5,#0xc]
    strh       r0,[r5,#0x10]
    strh       r0,[r5,#0x12]
    strh       r0,[r5,#0x14]
    strh       r0,[r5,#0x16]
    strh       r0,[r5,#0xe]
    mov        r0,#0x6
    strh       r0,[r5,#0x38]
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

INT_080201b4:
    .word 0x1F40
DAT_080201b8:
    .word 0x140
PTR_tilemapChipTrader_080201bc:
    .word tilemapChipTrader
PTR_gChipBag_080201c0:
    .word gChipBag
PTR_BuildChipSack_080201c4:
    .word BuildChipSack


_ts ChipTrader_1_Main
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080201e6
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080201e6
    bl         ChipTrader_HandleInput
LAB_080201e6:
    bl         ChipTrader_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts ChipTrader_4_Sort
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0802020e
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0802020e
    bl         ChipTrader_HandleInputSort
LAB_0802020e:
    bl         ChipTrader_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts ChipTrader_3_CloseAndPullChip
    push       {lr}
    bl         ChipTrader_DrawUI
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08020286
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0802023e
    mov        r1,#0x4
LAB_0802023e:
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    push       {r5}
    ldr        r0,PTR_paletteKeyboardNumberChars_080205e8
    ldr        r1,PTR_eBgPaletteF_080205ec
    mov        r2,#0x20
    bl         memcpy_32
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x14
    bne        LAB_08020270
    mov        r0,#0xff
    strh       r0,[r5,#0x4]
    strh       r0,[r5,#0x3a]
    strh       r0,[r5,#0x3c]
    mov        r0,#0x1
    pop        {pc}
LAB_08020270:
    bl         ChipTrader_PullChip
    strh       r0,[r5,#0x3a]
    strh       r1,[r5,#0x3c]
    mov        r2,#0x1
    push       {r5}
    bl         Inventory_AddChip
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_08020286:
    mov        r0,#0x0
    pop        {pc}


_ts ChipTrader_DrawUI
    push       {r5,lr}
    ldrh       r0,[r5,#0x14]
    ldrh       r1,[r5,#0x10]
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0xff
    beq        LAB_080202a6
    ldrh       r2,[r5,#0x16]
    cmp        r0,r2
    bne        LAB_080202a6
    ldrh       r2,[r5,#0x12]
    cmp        r1,r2
    bne        LAB_080202a6
    b          LAB_080202b0
LAB_080202a6:
    push       {r0,r1}
    ldr        r1,PTR_gChipBag_080205f0
    bl         Menu_LoadSackPageInfo
    pop        {r0,r1}
LAB_080202b0:
    ldrh       r0,[r5,#0xa]
    ldrh       r1,[r5,#0x6]
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0xff
    beq        LAB_080202c8
    ldrh       r2,[r5,#0xc]
    cmp        r0,r2
    bne        LAB_080202c8
    ldrh       r2,[r5,#0x8]
    cmp        r1,r2
    bne        LAB_080202c8
    b          LAB_080202d2
LAB_080202c8:
    push       {r0,r1}
    ldr        r1,PTR_DAT_080205f4
    bl         Menu_Folder_PrintChips
    pop        {r0,r1}
LAB_080202d2:
    mov        r3,#0x0
    strb       r3,[r5,#0x5]
    bl         ChipTrader_DrawFrame
    bl         ChipTrader_DrawInsertedChips
    ldrh       r0,[r5,#0x14]
    bl         ChipTrader_PrintSackList
    ldrh       r0,[r5,#0xa]
    bl         ChipTrader_DrawInsertList
    ldrb       r0,[r5,#0x3]
    add        r0,#0x1
    cmp        r0,#0x12
    blt        LAB_080202f4
    mov        r0,#0x0
LAB_080202f4:
    strb       r0,[r5,#0x3]
    bl         ChipTrader_PrintSackArrows
    bl         ChipTrader_PrintInsertArrows
    bl         ChipTrader_DrawSortArrow
    bl         ChipTrader_PrintInsertedAmount
    pop        {r5,pc}


_ts ChipTrader_6_ConfirmTrade
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08020352
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08020352
    bl         TextOption_GetDefaultOption
    tst        r0,r0
    beq        LAB_08020342
    ldrb       r0,[r5,#0x1]
    strb       r0,[r5,#0x0]
    ldr        r2,PTR_DAT_080205f4
    ldrh       r3,[r5,#0xe]
    sub        r3,#0x1
    lsl        r3,r3,#0x1
    add        r2,r2,r3
    bl         ChipTrader_MoveFromInsertToSack
    mov        r0,#0xff
    strb       r0,[r5,#0x5]
    b          LAB_08020352
LAB_08020342:
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_08020352:
    bl         ChipTrader_DrawUI
    mov        r0,#0x0
    pop        {pc}


_ts ChipTrader_PullChip
    push       {lr}
    ldr        r7,PTR_DAT_080205f4
    ldrh       r6,[r5,#0xe]
    mov        r4,#0x0
LAB_08020364:
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x1
    push       {r4,r5,r6,r7}
    bl         Inventory_SubtractChip
    pop        {r4,r5,r6,r7}
    add        r7,#0x2
    add        r4,#0x1
    cmp        r4,r6
    blt        LAB_08020364
    ldrh       r1,[r5,#0x4]
    cmp        r1,#0xa
    beq        LAB_080203ae
    bl         Rng_RandomInt
    mov        r1,#0x7
    and        r1,r0
    ldr        r7,PTR_listChipTrader3IsNewChipDraw_080205f8
    ldrb       r1,[r7,r1]
    tst        r1,r1
    bne        LAB_0802039c
    ldr        r7,PTR_DAT_080205fc
    bl         FUN_080204e8
    bl         ChipTrader_BuildObtainedChipSack
    b          LAB_080203dc
LAB_0802039c:
    bl         Rng_RandomInt
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,PTR_listRarity3_08020600
    ldrb       r0,[r7,r0]
    bl         ChipTrader_BuildBasicSack
    b          LAB_080203dc
LAB_080203ae:
    bl         Rng_RandomInt
    mov        r1,#0x7
    and        r1,r0
    ldr        r7,PTR_listChipTrader10IsNewChip_08020604
    ldrb       r1,[r7,r1]
    tst        r1,r1
    bne        LAB_080203ca
    ldr        r7,PTR_DAT_08020608
    bl         FUN_080204e8
    bl         ChipTrader_BuildObtainedChipSack
    b          LAB_080203dc
LAB_080203ca:
    bl         Rng_RandomInt
    mov        r1,#0xf
    and        r0,r1
    ldr        r7,PTR_listRarity10_0802060c
    ldrb       r0,[r7,r0]
    bl         ChipTrader_BuildFullChipSack
    b          LAB_080203dc
LAB_080203dc:
    push       {r4}
    bl         Rng_RandomInt
    bl         Rng_RandomInt
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    lsl        r1,r1,#0x1
    ldr        r6,PTR_gChipBag_080205f0
    add        r1,r1,r6
    ldrb       r0,[r1,#0x0]
    ldrb       r1,[r1,#0x1]
    pop        {pc}


_ts ChipTrader_BuildBasicSack
    push       {r5,lr}
    mov        r8,r0
    ldr        r7,PTR_listChipTrader3Stock_08020610
    ldr        r6,PTR_gChipBag_080205f0
    mov        r4,#0x0
LAB_08020406:
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0x0
    beq        LAB_0802044e
    cmp        r0,#0x54
    beq        LAB_0802041c
    cmp        r0,#0xc7
    beq        LAB_0802041c
    cmp        r0,#0x94
    blt        LAB_08020426
    cmp        r0,#0x9f
    bgt        LAB_08020426
LAB_0802041c:
    push       {r0,r4,r6,r7}
    bl         Flag_GetLibrary
    pop        {r0,r4,r6,r7}
    beq        LAB_0802044a
LAB_08020426:
    mov        r9,r0
    bl         BattleChip_GetChipData
    ldrb       r1,[r0,#0x8]
    mov        r0,r9
    cmp        r1,r8
    bne        LAB_0802044a
    mov        r3,#0x1
LAB_08020436:
    ldrb       r2,[r7,r3]
    cmp        r2,#0xff
    beq        LAB_08020444
    strb       r0,[r6,#0x0]
    strb       r2,[r6,#0x1]
    add        r6,#0x2
    add        r4,#0x1
LAB_08020444:
    add        r3,#0x1
    cmp        r3,#0x6
    blt        LAB_08020436
LAB_0802044a:
    add        r7,#0x8
    b          LAB_08020406
LAB_0802044e:
    pop        {r5,pc}


_ts ChipTrader_BuildFullChipSack
    push       {r5,lr}
    mov        r8,r0
    ldr        r6,PTR_gChipBag_080205f0
    mov        r0,#0x0
    mov        r4,#0x0
LAB_0802045a:
    cmp        r0,#0x54
    beq        LAB_0802046a
    cmp        r0,#0xc7
    beq        LAB_0802046a
    cmp        r0,#0x94
    blt        LAB_08020474
    cmp        r0,#0x9f
    bgt        LAB_08020474
LAB_0802046a:
    push       {r0,r4,r6}
    bl         Flag_GetLibrary
    pop        {r0,r4,r6}
    beq        LAB_0802049a
LAB_08020474:
    push       {r0}
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    pop        {r0}
    ldrb       r1,[r7,#0x8]
    cmp        r1,r8
    bne        LAB_0802049a
    mov        r3,#0x0
LAB_08020486:
    ldrb       r2,[r7,r3]
    cmp        r2,#0xff
    beq        LAB_08020494
    strb       r0,[r6,#0x0]
    strb       r2,[r6,#0x1]
    add        r6,#0x2
    add        r4,#0x1
LAB_08020494:
    add        r3,#0x1
    cmp        r3,#0x4
    ble        LAB_08020486
LAB_0802049a:
    add        r0,#0x1
    cmp        r0,#0xf0
    blt        LAB_0802045a
    pop        {r5,pc}


_ts ChipTrader_BuildObtainedChipSack
    push       {r5,lr}
    mov        r8,r0
    ldr        r6,PTR_gChipBag_080205f0
    mov        r0,#0x0
    mov        r4,#0x0
LAB_080204ae:
    push       {r0,r4,r6}
    bl         Flag_GetLibrary
    pop        {r0,r4,r6}
    beq        LAB_080204de
    push       {r0}
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    pop        {r0}
    ldrb       r1,[r7,#0x8]
    cmp        r1,r8
    bne        LAB_080204de
    mov        r3,#0x0
LAB_080204ca:
    ldrb       r2,[r7,r3]
    cmp        r2,#0xff
    beq        LAB_080204d8
    strb       r0,[r6,#0x0]
    strb       r2,[r6,#0x1]
    add        r6,#0x2
    add        r4,#0x1
LAB_080204d8:
    add        r3,#0x1
    cmp        r3,#0x4
    ble        LAB_080204ca
LAB_080204de:
    add        r0,#0x1
    cmp        r0,#0xf0
    blt        LAB_080204ae
    pop        {r5,pc}


_ts FUN_080204e8
    push       {r5,lr}
    push       {r7}
    mov        r0,#0x0
    mov        r6,#0x0
LAB_080204f0:
    push       {r0,r6}
    bl         Flag_GetLibrary
    pop        {r0,r6}
    beq        LAB_0802050c
    push       {r0,r6}
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    pop        {r0,r6}
    ldrb       r1,[r7,#0x8]
    mov        r2,#0x80
    lsr        r2,r1
    orr        r6,r2
LAB_0802050c:
    add        r0,#0x1
    cmp        r0,#0xf0
    blt        LAB_080204f0
    pop        {r7}
    mov        r0,#0x0
    mov        r4,#0x0
LAB_08020518:
    mov        r2,#0x80
    lsr        r2,r0
    tst        r6,r2
    beq        LAB_08020524
    ldrb       r2,[r7,r0]
    add        r4,r4,r2
LAB_08020524:
    add        r0,#0x1
    cmp        r0,#0x5
    blt        LAB_08020518
    push       {r7}
    push       {r4}
    bl         Rng_RandomInt
    mov        r1,#0xff
    and        r0,r1
    pop        {r1}
    bl         SWI_Div
    pop        {r7}
    mov        r0,#0x0
    mov        r4,#0x0
LAB_08020542:
    mov        r2,#0x80
    lsr        r2,r0
    tst        r6,r2
    beq        LAB_08020552
    ldrb       r2,[r7,r0]
    add        r4,r4,r2
    cmp        r1,r4
    blt        LAB_08020556
LAB_08020552:
    add        r0,#0x1
    b          LAB_08020542
LAB_08020556:
    pop        {r5,pc}


_ts ChipTrader_LoadGraphicData
    push       {r5,lr}
    ldr        r0,PTR_tilesetMenuDesign_08020614
    ldr        r1,PTR_DAT_08020618
    ldr        r2,DAT_0802061c
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_08020620
    ldr        r1,PTR_eBgPalette4_08020624
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_08020628
    ldr        r1,PTR_DAT_0802062c
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuUpDownArrow_08020630
    ldr        r1,PTR_DAT_08020634
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetChipLibraryNumbers_08020638
    ldr        r1,PTR_DAT_0802063c
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_08020640
    ldr        r1,PTR_eBgPaletteF_08020644
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_08020628
    ldr        r1,PTR_DAT_08020648
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_08020620
    ldr        r1,PTR_eObjPalette0_0802064c
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_gFillValue_08020650
    ldr        r1,PTR_gChipBag_080205f0
    ldr        r2,uint32_t_08020654
    mov        r3,#0x3
    ldr        r4,DAT_08020658
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_textDict_MenuMessages_0802065c
    mov        r1,#0x1
    ldr        r2,PTR_DAT_08020660
    ldr        r3,PTR_DAT_08020664
    mov        r4,#0x1
    mov        r5,#0x1
    mov        r7,#0x0
    ldr        r6,PTR_tilesetDialogueText_08020668
    bl         Text_CopyCharTileUI
    ldr        r0,PTR_textDict_MenuMessages_0802065c
    mov        r1,#0x4
    ldr        r2,PTR_gSpriteDecompLocation1_0802066c
    ldr        r3,PTR_DAT_08020670
    mov        r4,#0x8
    mov        r5,#0x8
    mov        r7,#0x0
    ldr        r6,PTR_tilesetDialogueText_08020668
    bl         Text_CopyCharTileUI
    pop        {r5,pc}
PTR_paletteKeyboardNumberChars_080205e8:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_080205ec:
    .word eBgPaletteF
PTR_gChipBag_080205f0:
    .word gChipBag
PTR_DAT_080205f4:
    .word 0x2023000
PTR_listChipTrader3IsNewChipDraw_080205f8:
    .word listChipTrader3IsNewChipDraw
PTR_DAT_080205fc:
    .word 0x8021070
PTR_listRarity3_08020600:
    .word listRarity3
PTR_listChipTrader10IsNewChip_08020604:
    .word listChipTrader10IsNewChip
PTR_DAT_08020608:
    .word 0x8021090
PTR_listRarity10_0802060c:
    .word listRarity10
PTR_listChipTrader3Stock_08020610:
    .word listChipTrader3Stock
PTR_tilesetMenuDesign_08020614:
    .word tilesetMenuDesign
PTR_DAT_08020618:
    .word 0x6000020
DAT_0802061c:
    .word 0x540
PTR_paletteMenuDesign_08020620:
    .word paletteMenuDesign
PTR_eBgPalette4_08020624:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_08020628:
    .word tilesetMenuSideArrow
PTR_DAT_0802062c:
    .word 0x6004020
PTR_tilesetMenuUpDownArrow_08020630:
    .word tilesetMenuUpDownArrow
PTR_DAT_08020634:
    .word 0x6004240
PTR_tilesetChipLibraryNumbers_08020638:
    .word tilesetChipLibraryNumbers
PTR_DAT_0802063c:
    .word 0x6003c00
PTR_paletteMenuSideArrow_08020640:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_08020644:
    .word eBgPaletteF
PTR_DAT_08020648:
    .word 0x6010020
PTR_eObjPalette0_0802064c:
    .word eObjPalette0
PTR_gFillValue_08020650:
    .word gFillValue
uint32_t_08020654:
    .word 0x2900
DAT_08020658:
    .word 0x85000000
PTR_textDict_MenuMessages_0802065c:
    .word textDict_MenuMessages
PTR_DAT_08020660:
    .word 0x2012200
PTR_DAT_08020664:
    .word 0x6005c00
PTR_tilesetDialogueText_08020668:
    .word tilesetDialogueText
PTR_gSpriteDecompLocation1_0802066c:
    .word gSpriteDecompLocation1
PTR_DAT_08020670:
    .word 0x6002c00
tilemapChipTraderInsertList:
    .incbin "images/chip_trader/list_inserted.tilemap"
tilemapChipTraderBlankEntry:
    .incbin "images/chip_trader/entry_blank.tilemap"
tilemapChipEntrySlash:
    .incbin "images/chip_trader/slash.tilemap"


_ts ChipTrader_DrawFrame
    push       {r5,lr}
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapChipTrader_08020808
    mov        r4,#0x20
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}
PTR_tilemapChipTrader_08020808:
    .word tilemapChipTrader


_ts ChipTrader_PrintSackList
    push       {r5,lr}
    ldr        r7,PTR_gChipBag_08020858
    lsl        r0,r0,#0x5
    add        r7,r7,r0
    push       {r7}
    mov        r0,#0xf
    mov        r1,#0x4
    mov        r2,#0x1
    ldr        r3,PTR_tilemapFolderSackList_0802085c
    mov        r4,#0xe
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r7}
    mov        r1,#0x0
LAB_0802082a:
    ldr        r2,[r7,#0x18]
    tst        r2,r2
    bne        LAB_0802084e
    push       {r1,r7}
    mov        r3,#0x1
    and        r3,r1
    lsl        r3,r3,#0x6
    ldr        r2,PTR_tilemapChipTraderBlankEntry_08020860
    add        r3,r3,r2
    mov        r0,#0xf
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x1
    mov        r4,#0xe
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r1,r7}
LAB_0802084e:
    add        r7,#0x20
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_0802082a
    pop        {r5,pc}
PTR_gChipBag_08020858:
    .word gChipBag
PTR_tilemapFolderSackList_0802085c:
    .word tilemapFolderSackList
PTR_tilemapChipTraderBlankEntry_08020860:
    .word tilemapChipTraderBlankEntry


_ts ChipTrader_PrintSackArrows
    push       {lr}
    push       {r5}
    mov        r0,#0xd
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0802091c
    mov        r4,#0x2
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r5}
    push       {r5}
    mov        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0802091c
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    push       {r5}
    mov        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_0802091c
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x10
    beq        LAB_080208d2
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x8
    beq        LAB_080208d2
    ldrh       r0,[r5,#0x18]
    tst        r0,r0
    beq        LAB_0802091a
    ldrb       r1,[r5,#0x3]
    ldr        r3,PTR_tilemapListSideArrow_08020920
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0xd
    ldrh       r1,[r5,#0x10]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_080208d2:
    ldrh       r0,[r5,#0x18]
    cmp        r0,#0x7
    ble        LAB_0802091a
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    ldrh       r0,[r5,#0x14]
    ldr        r3,PTR_tilemapUpDownArrows_08020924
    add        r3,r3,r1
    cmp        r0,#0x0
    beq        LAB_080208fe
    push       {r0,r3,r5}
    mov        r0,#0x14
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r0,r3,r5}
LAB_080208fe:
    ldrh       r1,[r5,#0x18]
    sub        r1,#0x7
    cmp        r0,r1
    beq        LAB_0802091a
    push       {r5}
    mov        r0,#0x14
    mov        r1,#0x12
    mov        r2,#0x2
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_0802091a:
    pop        {pc}
PTR_tilemapFolderBlank_0802091c:
    .word tilemapFolderBlank
PTR_tilemapListSideArrow_08020920:
    .word tilemapListSideArrow
PTR_tilemapUpDownArrows_08020924:
    .word tilemapUpDownArrows


_ts ChipTrader_PrintInsertArrows
    push       {lr}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x4
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_08020cd0
    mov        r4,#0x2
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r5}
    push       {r5}
    mov        r0,#0x5
    mov        r1,#0x2
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_08020cd4
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    push       {r5}
    mov        r0,#0x5
    mov        r1,#0x12
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_08020cd8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x10
    beq        LAB_080209de
    ldrb       r0,[r5,#0x1]
    cmp        r0,#0x4
    beq        LAB_08020996
    ldrh       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_080209de
    ldrb       r1,[r5,#0x3]
    ldr        r3,PTR_tilemapListSideArrow_08020cdc
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    ldrh       r1,[r5,#0x6]
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_08020996:
    ldrh       r0,[r5,#0xe]
    cmp        r0,#0x7
    ble        LAB_080209de
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    ldrh       r0,[r5,#0xa]
    ldr        r3,PTR_tilemapUpDownArrows_08020ce0
    add        r3,r3,r1
    cmp        r0,#0x0
    beq        LAB_080209c2
    push       {r0,r3,r5}
    mov        r0,#0x5
    mov        r1,#0x2
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r0,r3,r5}
LAB_080209c2:
    ldrh       r1,[r5,#0xe]
    sub        r1,#0x7
    cmp        r0,r1
    beq        LAB_080209de
    push       {r5}
    mov        r0,#0x5
    mov        r1,#0x12
    mov        r2,#0x2
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_080209de:
    pop        {pc}


_ts ChipTrader_DrawInsertList
    push       {r5,lr}
    ldr        r7,PTR_DAT_08020ce4
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x10
    beq        LAB_08020a32
    push       {r7}
    mov        r0,#0x3
    mov        r1,#0x4
    mov        r2,#0x1
    ldr        r3,PTR_tilemapChipTraderInsertList_08020ce8
    mov        r4,#0x9
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r7}
    mov        r1,#0x0
LAB_08020a04:
    ldrb       r2,[r7,#0x0]
    tst        r2,r2
    bne        LAB_08020a28
    push       {r1,r7}
    mov        r3,#0x1
    and        r3,r1
    lsl        r3,r3,#0x6
    ldr        r2,PTR_tilemapChipTraderBlankEntry_08020cec
    add        r3,r3,r2
    mov        r0,#0x3
    lsl        r1,r1,#0x1
    add        r1,#0x4
    mov        r2,#0x1
    mov        r4,#0x9
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r1,r7}
LAB_08020a28:
    add        r7,#0x2
    add        r1,#0x1
    cmp        r1,#0x7
    blt        LAB_08020a04
    pop        {r5,pc}
LAB_08020a32:
    pop        {r5,pc}


_ts ChipTrader_DrawInsertedChips
    push       {r5,lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x10
    bne        LAB_08020a5c
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    ldr        r3,PTR_tilemapChipTraderFrameLeft_08020cf0
    mov        r4,#0xd
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    mov        r0,#0x3
    mov        r1,#0x3
    mov        r2,#0x1
    ldr        r3,PTR_tilemapSmallList_08020cf4
    mov        r4,#0x8
    mov        r5,#0xf
    bl         Screen_CopyTileMapRect
LAB_08020a5c:
    pop        {r5,pc}


_ts ChipTrader_DrawSortArrow
    push       {lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x10
    bne        LAB_08020a9a
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x6
    mov        r2,#0x2
    ldr        r3,PTR_tilemapFolderBlank_08020cf8
    mov        r4,#0x2
    mov        r5,#0xe
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrb       r1,[r5,#0x3]
    ldr        r3,PTR_tilemapListSideArrow_08020cfc
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    ldrh       r1,[r5,#0x30]
    lsl        r1,r1,#0x1
    add        r1,#0x6
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
LAB_08020a9a:
    pop        {pc}


_ts ChipTrader_PrintInsertedAmount
    push       {r5,lr}
    mov        r7,#0x0
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0xa
    blt        LAB_08020aa8
    mov        r7,#0x1
LAB_08020aa8:
    mov        r12,r7
    mov        r1,#0x4
    bl         ChipTrader_PrintToBuffer
    push       {r5}
    mov        r0,#0x8
    mov        r1,#0x0
    mov        r2,#0x2
    add        r3,r5,#0x0
    add        r3,#0x20
    mov        r4,#0x4
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrh       r0,[r5,#0xe]
    mov        r1,#0x4
    bl         ChipTrader_PrintToBuffer
    mov        r0,#0x6
    mov        r7,r12
    sub        r0,r0,r7
    mov        r1,#0x0
    mov        r2,#0x2
    add        r3,r5,#0x0
    add        r3,#0x20
    mov        r4,#0x4
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    mov        r0,#0xa
    mov        r7,r12
    sub        r0,r0,r7
    mov        r1,#0x0
    mov        r2,#0x2
    ldr        r3,PTR_tilemapChipEntrySlash_08020afc
    mov        r4,#0x1
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapChipEntrySlash_08020afc:
    .word tilemapChipEntrySlash


_ts ChipTrader_PrintToBuffer
    push       {r5,lr}
    mov        r8,r0
    lsl        r1,r1,#0xc
    mov        r9,r1
    add        r0,r5,#0x0
    add        r0,#0x20
    mov        r1,#0x10
    mov        r2,#0x80
    lsl        r2,r2,#0x8
    bl         memset_16
    mov        r0,r8
    mov        r1,r9
    tst        r0,r0
    beq        LAB_08020b58
    bl         ConvertNumToBCD
    mov        r8,r0
    ldr        r5,PTR_gChipTrader_08020d00
    mov        r0,#0xc
    add        r1,r5,#0x0
    add        r1,#0x20
    mov        r2,#0xf
    ldr        r3,DAT_08020d04
    add        r3,r9
    mov        r9,r3
    mov        r6,#0x0
LAB_08020b36:
    mov        r7,r8
    lsr        r7,r0
    and        r7,r2
    tst        r6,r6
    bne        LAB_08020b44
    tst        r7,r7
    beq        LAB_08020b50
LAB_08020b44:
    lsl        r7,r7,#0x1
    add        r7,r9
    add        r6,#0x1
    strh       r7,[r1,#0x0]
    add        r7,#0x1
    strh       r7,[r1,#0x8]
LAB_08020b50:
    add        r1,#0x2
    sub        r0,#0x4
    bge        LAB_08020b36
    b          LAB_08020b68
LAB_08020b58:
    ldr        r5,PTR_gChipTrader_08020d08
    add        r1,r5,#0x0
    add        r1,#0x20
    ldr        r3,DAT_08020d04
    add        r3,r9
    strh       r3,[r1,#0x6]
    add        r3,#0x1
    strh       r3,[r1,#0xe]
LAB_08020b68:
    pop        {r5,pc}


_ts ChipTrader_HandleInput
    push       {lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x4
    beq        LAB_08020b78
    mov        r0,#0x0
    b          LAB_08020b7a
LAB_08020b78:
    mov        r0,#0xa
LAB_08020b7a:
    mov        r8,r0
    mov        r0,#0x6
    add        r0,r8
    ldrh       r1,[r5,r0]
    mov        r0,#0x8
    add        r0,r8
    strh       r1,[r5,r0]
    mov        r0,#0xa
    add        r0,r8
    ldrh       r1,[r5,r0]
    mov        r0,#0xc
    add        r0,r8
    strh       r1,[r5,r0]
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_08020ba6
    bl         ChipTrader_StartClose
    b          LAB_08020c2a
LAB_08020ba6:
    mov        r1,#0x8
    tst        r1,r0
    beq        LAB_08020bb2
    bl         ChipTrader_StartSort
    b          LAB_08020c2a
LAB_08020bb2:
    mov        r1,#0x20
    tst        r1,r0
    beq        LAB_08020be4
    ldrh       r2,[r5,#0xe]
    tst        r2,r2
    beq        LAB_08020be4
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x8
    beq        LAB_08020c2a
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    strb       r0,[r5,#0x1]
    ldrh       r0,[r5,#0x10]
    ldrh       r1,[r5,#0xe]
    ldrh       r2,[r5,#0xa]
    sub        r1,r1,r2
    cmp        r0,r1
    blt        LAB_08020be0
    add        r0,r1,#0x0
    sub        r0,#0x1
LAB_08020be0:
    strh       r0,[r5,#0x6]
    b          LAB_08020c2a
LAB_08020be4:
    mov        r1,#0x10
    tst        r1,r0
    beq        LAB_08020c10
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x4
    beq        LAB_08020c2a
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    strb       r0,[r5,#0x1]
    ldrh       r0,[r5,#0x6]
    ldrh       r1,[r5,#0x18]
    ldrh       r2,[r5,#0x14]
    sub        r1,r1,r2
    cmp        r0,r1
    blt        LAB_08020c0c
    add        r0,r1,#0x0
    sub        r0,#0x1
LAB_08020c0c:
    strh       r0,[r5,#0x10]
    b          LAB_08020c2a
LAB_08020c10:
    mov        r6,#0xe
    add        r6,r8
    ldrh       r6,[r5,r6]
    tst        r6,r6
    beq        LAB_08020c2a
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_08020c26
    bl         ChipTrader_MoveChip
    b          LAB_08020c2a
LAB_08020c26:
    bl         ChipTrader_HandleListInput
LAB_08020c2a:
    pop        {pc}


_ts ChipTrader_HandleListInput
    push       {lr}
    mov        r2,#0x6
    add        r2,r8
    ldrh       r2,[r5,r2]
    mov        r3,#0xa
    add        r3,r8
    ldrh       r3,[r5,r3]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_08020d0c
    tst        r4,r1
    beq        LAB_08020c4a
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_08020c4a:
    mov        r4,#0x7
    ldr        r1,DAT_08020d10
    tst        r1,r0
    bne        LAB_08020c60
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_08020c68
    sub        r2,r2,r4
    bge        LAB_08020c68
    mov        r2,#0x0
LAB_08020c60:
    sub        r3,r3,r4
    bgt        LAB_08020ca4
    mov        r3,#0x0
    b          LAB_08020ca4
LAB_08020c68:
    mov        r6,#0xe
    add        r6,r8
    ldrh       r6,[r5,r6]
    sub        r6,#0x1
    mov        r4,#0x7
    ldr        r1,DAT_08020d14
    tst        r1,r0
    bne        LAB_08020c8e
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_08020ca4
    cmp        r6,#0x6
    blt        LAB_08020c86
    mov        r6,#0x6
LAB_08020c86:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_08020ca4
    add        r2,r6,#0x0
LAB_08020c8e:
    cmp        r6,#0x6
    blt        LAB_08020ca4
    mov        r6,#0xe
    add        r6,r8
    ldrh       r6,[r5,r6]
    sub        r6,#0x7
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_08020ca4
    add        r3,r6,#0x0
    b          LAB_08020ca4
LAB_08020ca4:
    mov        r4,#0x6
    add        r4,r8
    ldrh       r4,[r5,r4]
    cmp        r2,r4
    bne        LAB_08020cba
    mov        r4,#0xa
    add        r4,r8
    ldrh       r4,[r5,r4]
    cmp        r3,r4
    bne        LAB_08020cba
    b          LAB_08020cc0
LAB_08020cba:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_08020cc0:
    mov        r0,#0x6
    add        r0,r8
    strh       r2,[r5,r0]
    mov        r0,#0xa
    add        r0,r8
    strh       r3,[r5,r0]
    pop        {pc}

    .align 2, 0

PTR_tilemapFolderBlank_08020cd0:
    .word tilemapFolderBlank
PTR_tilemapFolderBlank_08020cd4:
    .word tilemapFolderBlank
PTR_tilemapFolderBlank_08020cd8:
    .word tilemapFolderBlank
PTR_tilemapListSideArrow_08020cdc:
    .word tilemapListSideArrow
PTR_tilemapUpDownArrows_08020ce0:
    .word tilemapUpDownArrows
PTR_DAT_08020ce4:
    .word 0x2023000
PTR_tilemapChipTraderInsertList_08020ce8:
    .word tilemapChipTraderInsertList
PTR_tilemapChipTraderBlankEntry_08020cec:
    .word tilemapChipTraderBlankEntry
PTR_tilemapChipTraderFrameLeft_08020cf0:
    .word tilemapChipTraderFrameLeft
PTR_tilemapSmallList_08020cf4:
    .word tilemapSmallList
PTR_tilemapFolderBlank_08020cf8:
    .word tilemapFolderBlank
PTR_tilemapListSideArrow_08020cfc:
    .word tilemapListSideArrow
PTR_gChipTrader_08020d00:
    .word gChipTrader
DAT_08020d04:
    .word 0x1E0
PTR_gChipTrader_08020d08:
    .word gChipTrader
DAT_08020d0c:
    .word 0x300
DAT_08020d10:
    .word 0x200
DAT_08020d14:
    .word 0x100


_ts ChipTrader_MoveChip
    push       {r5,lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x4
    bne        LAB_08020d4c
    ldr        r2,PTR_DAT_08021058
    ldr        r7,PTR_gChipBag_0802105c
    ldrh       r3,[r5,#0x14]
    ldrh       r4,[r5,#0x10]
    add        r3,r3,r4
    lsl        r3,r3,#0x5
    add        r3,r3,r7
    add        r7,r2,#0x0
    add        r2,r3,#0x0
    bl         ChipTrader_MoveFromSackToInsert
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0xff
    strb       r0,[r5,#0x5]
    ldrh       r0,[r5,#0xe]
    sub        r0,#0x7
    cmp        r0,#0x0
    ble        LAB_08020d4a
    strh       r0,[r5,#0xa]
LAB_08020d4a:
    pop        {r5,pc}
LAB_08020d4c:
    ldr        r2,PTR_DAT_08021058
    ldrh       r3,[r5,#0xa]
    ldrh       r4,[r5,#0x6]
    add        r3,r3,r4
    lsl        r3,r3,#0x1
    add        r2,r2,r3
    bl         ChipTrader_MoveFromInsertToSack
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0xff
    strb       r0,[r5,#0x5]
    pop        {r5,pc}


_ts ChipTrader_MoveFromInsertToSack
    push       {lr}
    mov        r4,#0x0
    mov        r12,r4
    ldr        r7,PTR_gChipBag_0802105c
    ldrb       r0,[r2,#0x0]
    ldrb       r1,[r2,#0x1]
    ldrh       r6,[r5,#0x18]
    tst        r6,r6
    beq        LAB_08020daa
LAB_08020d7a:
    ldr        r6,[r7,#0x18]
    tst        r6,r6
    bne        LAB_08020d88
    mov        r3,r12
    tst        r3,r3
    bne        LAB_08020d88
    mov        r12,r7
LAB_08020d88:
    cmp        r0,r6
    bne        LAB_08020da0
    ldr        r6,[r7,#0x8]
    lsr        r6,r6,#0x10
    cmp        r1,r6
    bne        LAB_08020da0
    ldr        r6,[r7,#0x14]
    mov        r3,#0x1
    lsl        r3,r3,#0x10
    add        r6,r6,r3
    str        r6,[r7,#0x14]
    b          LAB_08020df4
LAB_08020da0:
    add        r7,#0x20
    add        r4,#0x1
    ldrh       r6,[r5,#0x18]
    cmp        r4,r6
    blt        LAB_08020d7a
LAB_08020daa:
    mov        r3,r12
    tst        r3,r3
    beq        LAB_08020db2
    mov        r7,r12
LAB_08020db2:
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
    ldrh       r6,[r5,#0x18]
    add        r6,#0x1
    strh       r6,[r5,#0x18]
LAB_08020df4:
    mov        r0,#0x0
    strb       r0,[r2,#0x0]
    strb       r0,[r2,#0x1]
    ldrh       r6,[r5,#0xe]
    sub        r6,#0x1
    strh       r6,[r5,#0xe]
    lsl        r6,r6,#0x1
    add        r6,r6,r2
    mov        r0,#0x0
LAB_08020e06:
    cmp        r2,r6
    beq        LAB_08020e16
    ldrb       r0,[r2,#0x2]
    ldrb       r1,[r2,#0x3]
    strb       r0,[r2,#0x0]
    strb       r1,[r2,#0x1]
    add        r2,#0x2
    b          LAB_08020e06
LAB_08020e16:
    mov        r0,#0x0
    strb       r0,[r2,#0x0]
    strb       r0,[r2,#0x1]
    ldrh       r6,[r5,#0xe]
    tst        r6,r6
    bne        LAB_08020e2c
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x10]
LAB_08020e2c:
    mov        r7,#0x0
    bl         ChipTrader_AdjustPageIndexOffset
    pop        {pc}


_ts ChipTrader_MoveFromSackToInsert
    push       {lr}
    mov        r4,#0x0
    ldr        r0,[r2,#0x18]
    ldr        r1,[r2,#0x8]
    lsr        r1,r1,#0x10
    ldrh       r6,[r5,#0xe]
    lsl        r6,r6,#0x1
    add        r7,r7,r6
    strb       r0,[r7,#0x0]
    strb       r1,[r7,#0x1]
    ldr        r1,[r2,#0x14]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    str        r1,[r2,#0x14]
    lsr        r1,r1,#0x10
    tst        r1,r1
    bne        LAB_08020e86
    mov        r0,#0x0
    str        r0,[r2,#0x0]
    str        r0,[r2,#0x4]
    str        r0,[r2,#0x8]
    str        r0,[r2,#0xc]
    str        r0,[r2,#0x10]
    str        r0,[r2,#0x14]
    str        r0,[r2,#0x18]
    str        r0,[r2,#0x1c]
    ldrh       r6,[r5,#0x18]
    sub        r6,#0x1
    strh       r6,[r5,#0x18]
    ldrh       r3,[r5,#0xe]
    add        r3,#0x1
    ldrh       r0,[r5,#0x4]
    cmp        r3,r0
    bge        LAB_08020e86
    add        r3,r6,#0x0
    bl         Menu_Folder_OptimizeSackList
    mov        r7,#0xa
    bl         ChipTrader_AdjustPageIndexOffset
LAB_08020e86:
    ldrh       r6,[r5,#0xe]
    add        r6,#0x1
    strh       r6,[r5,#0xe]
    ldrh       r0,[r5,#0x4]
    cmp        r6,r0
    blt        LAB_08020eaa
    push       {r5}
    mov        r1,#0x2
    ldrh       r0,[r5,#0x4]
    cmp        r0,#0x3
    beq        LAB_08020e9e
    mov        r1,#0x8
LAB_08020e9e:
    ldr        r0,PTR_textDict_ChipTrader_08021060
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
LAB_08020eaa:
    pop        {pc}


_ts ChipTrader_AdjustPageIndexOffset
    push       {lr}
    mov        r2,#0xe
    add        r2,r2,r7
    ldrh       r0,[r5,r2]
    cmp        r0,#0x6
    ble        LAB_08020eca
    mov        r2,#0xa
    add        r2,r2,r7
    ldrh       r1,[r5,r2]
    add        r1,#0x7
    cmp        r0,r1
    bge        LAB_08020edc
    sub        r0,#0x7
    strh       r0,[r5,r2]
    b          LAB_08020edc
LAB_08020eca:
    tst        r0,r0
    beq        LAB_08020edc
    mov        r2,#0x6
    add        r2,r2,r7
    sub        r0,#0x1
    ldrh       r1,[r5,r2]
    cmp        r0,r1
    bgt        LAB_08020edc
    strh       r0,[r5,r2]
LAB_08020edc:
    pop        {pc}


_ts ChipTrader_StartSort
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x78]
    ldrb       r1,[r0,#0x2]
    strh       r1,[r5,#0x30]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    push       {r5}
    bl         SetSortDefault
    pop        {r5}
    pop        {pc}


_ts ChipTrader_HandleInputSort
    push       {lr}
    ldrh       r1,[r5,#0x30]
    strh       r1,[r5,#0x32]
    ldrh       r1,[r5,#0x34]
    strh       r1,[r5,#0x36]
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0xa
    tst        r1,r0
    beq        LAB_08020f22
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x1]
    strb       r0,[r5,#0x0]
    b          LAB_08020f90
LAB_08020f22:
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_08020f2e
    bl         ChipTrader_ApplySort
    b          LAB_08020f90
LAB_08020f2e:
    ldrh       r2,[r5,#0x30]
    ldrh       r3,[r5,#0x34]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_08020f4c
    sub        r2,r2,r4
    bge        LAB_08020f4c
    mov        r2,#0x5
    sub        r3,r3,r4
    bgt        LAB_08020f78
    mov        r3,#0x0
    b          LAB_08020f78
LAB_08020f4c:
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_08020f78
    mov        r6,#0x6
    sub        r6,#0x1
    cmp        r6,#0x5
    blt        LAB_08020f5e
    mov        r6,#0x5
LAB_08020f5e:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_08020f78
    mov        r2,#0x0
    cmp        r6,#0x5
    blt        LAB_08020f78
    mov        r6,#0x6
    sub        r6,#0x6
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_08020f78
    add        r3,r6,#0x0
    b          LAB_08020f78
LAB_08020f78:
    ldrh       r4,[r5,#0x30]
    cmp        r2,r4
    bne        LAB_08020f86
    ldrh       r4,[r5,#0x34]
    cmp        r3,r4
    bne        LAB_08020f86
    b          LAB_08020f8c
LAB_08020f86:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_08020f8c:
    strh       r2,[r5,#0x30]
    strh       r3,[r5,#0x34]
LAB_08020f90:
    pop        {pc}


_ts ChipTrader_ApplySort
    push       {lr}
    ldrh       r0,[r5,#0x30]
    mov        r1,r10
    ldr        r1,[r1,#0x78]
    ldrb       r2,[r1,#0x2]
    cmp        r0,r2
    beq        LAB_08020fac
    strb       r0,[r1,#0x2]
    ldr        r2,PTR_listDefaultSort_08021064
    ldrb       r0,[r2,r0]
    strb       r0,[r1,#0x3]
    b          LAB_08020fb6
LAB_08020fac:
    strb       r0,[r1,#0x2]
    ldrb       r0,[r1,#0x3]
    mov        r2,#0x4
    eor        r0,r2
    strb       r0,[r1,#0x3]
LAB_08020fb6:
    bl         Menu_Folder_SortSack
    strh       r0,[r5,#0x18]
    bl         ChipTrader_OptimizeSackAfterInsert
    mov        r0,#0xff
    strb       r0,[r5,#0x5]
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    pop        {pc}


_ts ChipTrader_StartClose
    push       {r5,lr}
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5,pc}


_ts ChipTrader_OptimizeSackAfterInsert
    push       {lr}
    ldr        r7,PTR_DAT_08021058
    mov        r4,#0x0
LAB_08020fea:
    ldrh       r6,[r5,#0xe]
    cmp        r4,r6
    bgt        LAB_08021056
    push       {r4}
    mov        r4,#0x0
    ldr        r2,PTR_gChipBag_0802105c
LAB_08020ff6:
    ldrh       r6,[r5,#0x18]
    cmp        r4,r6
    bge        LAB_0802104e
    ldr        r0,[r2,#0x18]
    ldrb       r1,[r7,#0x0]
    cmp        r0,r1
    bne        LAB_08021048
    ldr        r0,[r2,#0x8]
    lsr        r0,r0,#0x10
    ldrb       r1,[r7,#0x1]
    cmp        r0,r1
    bne        LAB_08021048
    ldr        r1,[r2,#0x14]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    sub        r1,r1,r0
    str        r1,[r2,#0x14]
    lsr        r1,r1,#0x10
    tst        r1,r1
    bne        LAB_08021048
    mov        r0,#0x0
    str        r0,[r2,#0x0]
    str        r0,[r2,#0x4]
    str        r0,[r2,#0x8]
    str        r0,[r2,#0xc]
    str        r0,[r2,#0x10]
    str        r0,[r2,#0x14]
    str        r0,[r2,#0x18]
    str        r0,[r2,#0x1c]
    ldrh       r6,[r5,#0x18]
    sub        r6,#0x1
    strh       r6,[r5,#0x18]
    push       {r7}
    add        r3,r6,#0x0
    bl         Menu_Folder_OptimizeSackList
    mov        r7,#0xa
    bl         ChipTrader_AdjustPageIndexOffset
    pop        {r7}
    b          LAB_0802104e
LAB_08021048:
    add        r2,#0x20
    add        r4,#0x1
    b          LAB_08020ff6
LAB_0802104e:
    pop        {r4}
    add        r7,#0x2
    add        r4,#0x1
    b          LAB_08020fea
LAB_08021056:
    pop        {pc}
PTR_DAT_08021058:
    .word 0x2023000
PTR_gChipBag_0802105c:
    .word gChipBag
PTR_textDict_ChipTrader_08021060:
    .word textDict_ChipTrader
PTR_listDefaultSort_08021064:
    .word listDefaultSort
listChipTrader3IsNewChipDraw:
    .byte 0, 0, 0, 0
    .byte 0, 0, 1, 1
DAT_08021070:
    .byte 0xCA, 0x20, 0x10, 0x5, 0x1

    .align 2, 0

listRarity3:
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 0, 0, 0
    .byte 0, 1, 1, 2
listChipTrader10IsNewChip:
    .byte 0, 0, 0, 0
    .byte 0, 0, 1, 1
DAT_08021090:
    .byte 0x10, 0xB0, 0x20, 0x10, 0x10

    .align 2, 0

listRarity10:
    .byte 0, 1, 1, 1
    .byte 1, 1, 1, 1
    .byte 1, 1, 1, 1
    .byte 2, 2, 3, 4
listChipTrader3Stock:
    chip_trader_stock Cannon, C, E
    chip_trader_stock HiCannon, I, J
    chip_trader_stock M_Cannon, L, N
    chip_trader_stock Sword, S
    chip_trader_stock WideSwrd, C, K, M, N, S
    chip_trader_stock LongSwrd, E, N, S
    chip_trader_stock LilBomb, B, T
    chip_trader_stock CrosBomb, B, J
    chip_trader_stock BigBomb, B, G, S
    chip_trader_stock Spreader, H, I, J, K, L
    chip_trader_stock Bubbler, K, L
    chip_trader_stock Heater, C, O
    chip_trader_stock MiniBomb, E, J
    chip_trader_stock Shotgun, K, M, Q, R
    chip_trader_stock CrossGun, C, E, F, K
    chip_trader_stock ShokWave, C, L, N
    chip_trader_stock SoniWave, C, J
    chip_trader_stock DynaWave, C, E, R
    chip_trader_stock FireTowr, L, T
    chip_trader_stock AquaTowr, A, C
    chip_trader_stock WoodTowr, H, N
    chip_trader_stock Quake1, A, Q
    chip_trader_stock Quake2, I, K, Q
    chip_trader_stock Quake3, C, H, Q
    chip_trader_stock FireSwrd, F, G, P
    chip_trader_stock ElecSwrd, E, G, L, O
    chip_trader_stock AquaSwrd, A, M, O
    chip_trader_stock GutsPnch, B, H, N, T
    chip_trader_stock IcePunch, B, H, N, T
    chip_trader_stock FtrSword, B, K, L, P, S
    chip_trader_stock Dash, B, G, L, O
    chip_trader_stock KngtSwrd, B, C, E, G, H
    chip_trader_stock HeroSwrd, B, D, F, I, J
    chip_trader_stock MetGuard, C, E, G
    chip_trader_stock TriArrow, A
    chip_trader_stock TriSpear, J
    chip_trader_stock TriLance, M
    chip_trader_stock Typhoon, D, E
    chip_trader_stock Huricane, K, L
    chip_trader_stock Cyclone, E, I
    chip_trader_stock Howitzer, A, C, G, O
    chip_trader_stock Thunder1, E, H
    chip_trader_stock Thunder2, B, C
    chip_trader_stock Thunder3, G, K
    chip_trader_stock Snakegg1, G, N
    chip_trader_stock Snakegg2, H, N
    chip_trader_stock Snakegg3, F, L
    chip_trader_stock Hammer, A, I, Q
    chip_trader_stock BodyBurn, F, M, N
    chip_trader_stock Ratton1, D, E
    chip_trader_stock Ratton2, G, J
    chip_trader_stock Ratton3, K, M
    chip_trader_stock Lockon1, C, L
    chip_trader_stock Lockon2, B, M
    chip_trader_stock Lockon3, A, O
    chip_trader_stock X_Panel1, B, D
    chip_trader_stock X_Panel3, D, L
    chip_trader_stock Recov30, E, L
    chip_trader_stock Recov50, C, G, L
    chip_trader_stock Recov80, E, G
    chip_trader_stock Recov120, E, G
    chip_trader_stock Recov150, A
    chip_trader_stock Recov200, E
    chip_trader_stock Recov300, A, C, E, G, L
    chip_trader_stock Steal, A, E, L, P
    chip_trader_stock Geddon1, F, H, J, L, N
    chip_trader_stock Geddon2, A, B, E, I, K
    chip_trader_stock Escape, F, H, J, L, N
    chip_trader_stock Interupt, F, H, J, L, N
    chip_trader_stock AquaAura, D, E
    chip_trader_stock FireAura, G, N, T
    chip_trader_stock WoodAura, C, J, O, Q
    chip_trader_stock Repair, A, H, K, S
    chip_trader_stock Cloud, G
    chip_trader_stock Cloudier, A, D
    chip_trader_stock Cloudest, F, J
    chip_trader_stock IceCube, I
    chip_trader_stock RockCube, E, G
    chip_trader_stock TimeBom1, E, G, Q
    chip_trader_stock TimeBom2, F, L, S
    chip_trader_stock TimeBom3, A, P
    chip_trader_stock Invis1, O, Q
    chip_trader_stock Invis2, A, F, M
    chip_trader_stock Invis3, B, D, H, K
    chip_trader_stock IronBody, D, L
    chip_trader_stock Remobit1, F, N
    chip_trader_stock Remobit2, B, H
    chip_trader_stock Remobit3, J, K
    chip_trader_stock BstrGard, A, G, K, N, R
    chip_trader_stock BstrBomb, D, H, J, O, T
    chip_trader_stock BstrSwrd, B, E, L, P, S
    chip_trader_stock BstrPnch, C, F, I, M, Q
    chip_trader_stock RingZap1, H, M
    chip_trader_stock RingZap2, E, G
    chip_trader_stock RingZap3, O, R
    chip_trader_stock Candle1, F, I
    chip_trader_stock Candle2, J, L
    chip_trader_stock Candle3, D, K
    chip_trader_stock SloGauge, H, K, N, O, Q
    chip_trader_stock FstGauge, A, C, E, L, N
    chip_trader_stock Drain1, B, D
    chip_trader_stock Drain2, C, H
    chip_trader_stock Drain3, E, L
    chip_trader_stock Mine1, N, P
    chip_trader_stock Mine2, E, G
    chip_trader_stock Mine3, O, R
    chip_trader_stock Gaia1, O
    chip_trader_stock Gaia2, F
    chip_trader_stock Gaia3, G
    chip_trader_stock BblWrap1, C, M
    chip_trader_stock BblWrap2, K
    chip_trader_stock BblWrap3, A
    chip_trader_stock Wave, D, M, L
    chip_trader_stock RedWave, B, E, J
    chip_trader_stock BigWave, C, K, L
    chip_trader_stock Muramasa, C, E, G, J
    chip_trader_stock Dropdown, A, O, R, T
    chip_trader_stock Popup, C, D, H, K, N
    chip_trader_stock Dynamyt1, G, S
    chip_trader_stock Dynamyt2, M, N
    chip_trader_stock Dynamyt3, O, P
    chip_trader_stock Anubis, C, N, Q, T
    chip_trader_stock IronShld, A, B, O, R, T
    chip_trader_stock LeafShld, D, F, K
    chip_trader_stock Barrier, D, F, M, R, S
    chip_trader_stock_end
