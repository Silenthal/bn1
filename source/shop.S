#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts Shop_Main
    push       { lr }
    ldr        r5,=gShop
    ldr        r7,=jumpTableShopMain
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        { pc }

    .pool

jumpTableShopMain:
    .word Shop_0_Init
    .word Shop_1_Main
    .word Shop_2_Free


_ts Shop_0_Init
    push       {lr}
    push       {r5}
    bl         Video_ClearScreen
    bl         Video_InitPaletteColor0
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x74]
    str        r0,[r5,#0x10]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x7]
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Shop_SetupInventory
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_0801e90a
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801e944
LAB_0801e90a:
    push       {r5}
    bl         Video_ClearAllTile0Maps
    mov        r0,#0x5
    ldr        r7,PTR_TransferStruct_ARRAY_0801e948
LAB_0801e914:
    push       {r0,r7}
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r0,r7}
    add        r7,#0xc
    sub        r0,#0x1
    bne        LAB_0801e914
    bl         Shop_CreateBg
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    mov        r0,#0x0
    strh       r0,[r7,#0x1a]
    strh       r0,[r7,#0x18]
LAB_0801e944:
    pop        {pc}

    .align 2, 0

PTR_TransferStruct_ARRAY_0801e948:
    .word TransferStruct_ARRAY_0801e94c
TransferStruct_ARRAY_0801e94c:
    @ 0
    .word tilesetMenuShopUi
    .word 0x6004020
    .word 0xB0
    @ 1
    .word paletteMenuShopUi
    .word eBgPaletteC
    .word 0x18
    @ 2
    .word paletteMenuShopBg
    .word eBgPaletteB
    .word 0x8
    @ 3
    .word tilesetShopNumbers
    .word 0x6006000
    .word 0x350
    @ 4
    .word paletteMenuSideArrow
    .word eBgPaletteF
    .word 0x8


_ts Shop_1_Main
    push       {lr}
    ldr        r7,PTR_JT_R5_70_1E9A4_0801e9a0
    ldrb       r0,[r5,#0x1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_PrintItemList
    bl         Shop_ScrollBackground
    pop        {pc}

    .align 2, 0

PTR_JT_R5_70_1E9A4_0801e9a0:
    .word JT_R5_70_1E9A4
JT_R5_70_1E9A4:
    .word Shop_1_0_Init
    .word Shop_1_1_Main
    .word Shop_1_2_TryLeave
    .word Shop_1_3_NotEnoughZenny
    .word Shop_1_4_SoldOut
    .word Shop_1_5_Buy
    .word Shop_1_6_MenuSlideOut
    .word Shop_1_7_ShowItemDescription
    .word Shop_1_8_StartClose


_ts Shop_1_0_Init
    push       {lr}
    ldr        r7,PTR_PTR_Shop_1_0_0_PlayShopMusic_0801e9d8
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_1_0_0_PlayShopMusic_0801e9d8:
    .word PTR_Shop_1_0_0_PlayShopMusic_0801e9dc
PTR_Shop_1_0_0_PlayShopMusic_0801e9dc:
    .word Shop_1_0_0_PlayShopMusic
    .word Shop_1_0_1_SlideInMenu
    .word Shop_1_0_2_ChangeState1


_ts Shop_1_0_0_PlayShopMusic
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ea04
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x0
    strh       r0,[r5,#0xc]
    mov        r0,#0x2
    bl         Sound_ChangeSong
LAB_0801ea04:
    pop        {pc}


_nt Shop_1_0_1_SlideInMenu
    push       {lr}
    sub        sp,#0x48
    mov        r6,sp
    ldrh       r0,[r5,#0xc]
    add        r0,#0x1
    strh       r0,[r5,#0xc]
    cmp        r0,#0x15
    bne        LAB_0801ea1a
    mov        r1,#0x8
    strb       r1,[r5,#0x2]
LAB_0801ea1a:
    push       {r0,r5,r6}
    sub        r0,#0x15
    mov        r1,#0x0
    mov        r2,#0x3
    ldr        r3,PTR_tilemapShopMenu_0801ea58
    mov        r4,#0x15
    mov        r5,#0xc
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r5,r6}
    cmp        r0,#0xc
    bmi        LAB_0801ea52
    push       {r0,r5,r6}
    add        r0,r6,#0x0
    bl         Shop_LoadTilemapZennyDisplay
    pop        {r0,r5,r6}
    push       {r5}
    mov        r1,#0x2a
    sub        r0,r1,r0
    mov        r1,#0x0
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x9
    mov        r5,#0x4
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r5}
LAB_0801ea52:
    add        sp,#0x48
    pop        {pc}

    .align 2, 0

PTR_tilemapShopMenu_0801ea58:
    .word tilemapShopMenu
    .word tilemapShopZennyDefault


_ts Shop_1_0_2_ChangeState1
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x8
    strh       r0,[r5,#0x2]
    pop        {pc}


_ts Shop_1_1_Main
    push       {lr}
    bl         Shop_LoadShopMenuLeftEdgeDefault
    ldr        r7,PTR_PTR_Shop_1_1_0_WhatWillYouBuy_0801ea8c
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_DrawMenuArrow
    bl         Shop_DrawZennyDisplay
    bl         Shop_DrawUpDownArrows
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_1_1_0_WhatWillYouBuy_0801ea8c:
    .word PTR_Shop_1_1_0_WhatWillYouBuy_0801ea90
PTR_Shop_1_1_0_WhatWillYouBuy_0801ea90:
    .word Shop_1_1_0_WhatWillYouBuy
    .word Shop_1_1_1_HandleInput
    .word Shop_1_1_2_WhatWillYouBuy


_ts Shop_1_1_0_WhatWillYouBuy
    push       {lr}
    mov        r0,#0x7
    bl         Shop_SetClerkDialogue
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts Shop_1_1_1_HandleInput
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801eb2c
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0801ead0
    mov        r0,#0x20
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801eb2c
LAB_0801ead0:
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0801eb04
    push       {r7}
    bl         Shop_CheckPurchase
    pop        {r7}
    cmp        r0,#0x1
    bne        LAB_0801eaec
    mov        r0,#0xc
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801eb2c
LAB_0801eaec:
    cmp        r0,#0x2
    bne        LAB_0801eafa
    mov        r0,#0x10
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801eb2c
LAB_0801eafa:
    mov        r0,#0x14
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801eb2c
LAB_0801eb04:
    mov        r1,#0x1
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_0801eb16
    mov        r0,#0x1c
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    b          LAB_0801eb2c
LAB_0801eb16:
    ldrh       r0,[r7,#0x4]
    mov        r1,#0x40
    tst        r0,r1
    beq        LAB_0801eb22
    bl         Shop_MoveArrowUp
LAB_0801eb22:
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0801eb2c
    bl         Shop_MoveArrowDown
LAB_0801eb2c:
    pop        {pc}


_nt Shop_1_1_2_WhatWillYouBuy
    push       {lr}
    mov        r0,#0x0
    bl         Shop_SetClerkDialogue
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt Shop_1_2_TryLeave
    push       {lr}
    bl         Shop_LoadShopMenuLeftEdgeDefault
    ldrb       r0,[r5,#0x2]
    ldr        r7,PTR_PTR_Shop_1_2_0_ConfirmLeaveShop_0801eb54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_PTR_Shop_1_2_0_ConfirmLeaveShop_0801eb54:
    .word PTR_Shop_1_2_0_ConfirmLeaveShop_0801eb58
PTR_Shop_1_2_0_ConfirmLeaveShop_0801eb58:
    .word Shop_1_2_0_ConfirmLeaveShop
    .word Shop_1_2_1_CloseOrCancel


_ts Shop_1_2_0_ConfirmLeaveShop
    push       {lr}
    mov        r0,#0x4
    bl         Shop_SetClerkDialogue
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x5
    bl         Flag_Clear400
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_nt Shop_1_2_1_CloseOrCancel
    push       {lr}
    mov        r0,#0x5
    bl         Flag_Get400
    beq        LAB_0801eb8c
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801eb8c:
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801eb9c
    mov        r0,#0x18
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801eb9c:
    pop        {pc}


_nt Shop_1_3_NotEnoughZenny
    push       {lr}
    ldr        r7,PTR_PTR_Shop_1_3_0_NotEnoughZenny_0801ebb0
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_DrawMenuArrow
    pop        {pc}
PTR_PTR_Shop_1_3_0_NotEnoughZenny_0801ebb0:
    .word PTR_Shop_1_3_0_NotEnoughZenny_0801ebb4
PTR_Shop_1_3_0_NotEnoughZenny_0801ebb4:
    .word Shop_1_3_0_NotEnoughZenny
    .word Shop_1_3_1


_ts Shop_1_3_0_NotEnoughZenny
    push       {lr}
    mov        r0,#0x2
    bl         Shop_SetClerkDialogue
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    pop        {pc}


_nt Shop_1_3_1
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801ebf4
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x3
    tst        r0,r1
    beq        LAB_0801ebf4
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ebf4:
    pop        {pc}


_nt Shop_1_4_SoldOut
    push       {lr}
    bl         Shop_LoadShopMenuLeftEdgeDefault
    ldr        r7,PTR_PTR_Shop_1_4_0_SorrySoldOut_0801ec0c
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_DrawMenuArrow
    pop        {pc}
PTR_PTR_Shop_1_4_0_SorrySoldOut_0801ec0c:
    .word PTR_Shop_1_4_0_SorrySoldOut_0801ec10
PTR_Shop_1_4_0_SorrySoldOut_0801ec10:
    .word Shop_1_4_0_SorrySoldOut
    .word Shop_1_4_1


_ts Shop_1_4_0_SorrySoldOut
    push       {lr}
    mov        r0,#0x3
    bl         Shop_SetClerkDialogue
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    pop        {pc}


_nt Shop_1_4_1
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801ec50
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x3
    tst        r0,r1
    beq        LAB_0801ec50
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ec50:
    pop        {pc}


_nt Shop_1_5_Buy
    push       {lr}
    bl         Shop_LoadShopMenuLeftEdgeDefault
    ldr        r7,PTR_PTR_Shop_1_5_0_ConfirmPurchase_0801ec70
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_DrawMenuArrow
    bl         Shop_DrawZennyDisplay
    bl         Shop_DrawUpDownArrows
    pop        {pc}
PTR_PTR_Shop_1_5_0_ConfirmPurchase_0801ec70:
    .word PTR_Shop_1_5_0_ConfirmPurchase_0801ec74
PTR_Shop_1_5_0_ConfirmPurchase_0801ec74:
    .word Shop_1_5_0_ConfirmPurchase
    .word Shop_1_5_1_AttemptPurchase
    .word Shop_1_5_2_SuccessMessage
    .word Shop_1_5_3_ReturnToItemList


_ts Shop_1_5_0_ConfirmPurchase
    push       {lr}
    mov        r0,#0x9
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    mov        r7,#0x14
    add        r7,r7,r5
    add        r7,r7,r1
    ldrb       r1,[r7,#0x0]
    tst        r1,r1
    bne        LAB_0801ec9a
    mov        r0,#0xa
LAB_0801ec9a:
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r7,#0x2]
    mov        r6,r10
    ldr        r6,[r6,#0x48]
    str        r1,[r6,#0x30]
    str        r2,[r6,#0x34]
    push       {r7}
    bl         Shop_SetClerkDialogue
    pop        {r7}
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x6
    bl         Flag_Clear400
    mov        r0,#0x5
    bl         Flag_Clear400
    pop        {pc}


_ts Shop_1_5_1_AttemptPurchase
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801ecd4
    bl         Shop_AttemptPurchase
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    b          LAB_0801ece4
LAB_0801ecd4:
    mov        r0,#0x5
    bl         Flag_Get400
    beq        LAB_0801ece4
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ece4:
    pop        {pc}


_nt Shop_1_5_2_SuccessMessage
    push       {lr}
    mov        r0,#0x1
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    mov        r7,#0x14
    add        r7,r7,r5
    add        r7,r7,r1
    ldrb       r1,[r7,#0x0]
    tst        r1,r1
    bne        LAB_0801ecfc
    mov        r0,#0x8
LAB_0801ecfc:
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r7,#0x2]
    mov        r6,r10
    ldr        r6,[r6,#0x48]
    str        r1,[r6,#0x30]
    str        r2,[r6,#0x34]
    push       {r7}
    bl         Shop_SetClerkDialogue
    pop        {r7}
    mov        r0,#0xc
    strb       r0,[r5,#0x2]
    mov        r0,#0x6
    bl         Flag_Clear400
    pop        {pc}


_ts Shop_1_5_3_ReturnToItemList
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801ed3a
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0xf3
    tst        r0,r1
    beq        LAB_0801ed3a
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ed3a:
    pop        {pc}


_ts Shop_1_6_MenuSlideOut
    push       {lr}
    ldr        r7,PTR_PTR_Shop_1_6_0_Start_0801ed4c
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_1_6_0_Start_0801ed4c:
    .word PTR_Shop_1_6_0_Start_0801ed50
PTR_Shop_1_6_0_Start_0801ed50:
    .word Shop_1_6_0_Start
    .word Shop_1_6_1_SlideOut
    .word Shop_1_6_2_Finish


_ts Shop_1_6_0_Start
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x15
    strh       r0,[r5,#0xc]
    mov        pc,lr


_nt Shop_1_6_1_SlideOut
    push       {lr}
    ldrh       r0,[r5,#0xc]
    sub        r0,#0x1
    strh       r0,[r5,#0xc]
    bne        LAB_0801ed74
    mov        r1,#0x8
    strb       r1,[r5,#0x2]
LAB_0801ed74:
    push       {r0}
    ldr        r0,PTR_gScreens_screen3_tileIndex_0801edbc
    mov        r1,#0x41
    lsl        r1,r1,#0x4
    bl         memset0_32
    pop        {r0}
    push       {r0,r5}
    sub        r0,#0x15
    mov        r1,#0x0
    mov        r2,#0x3
    ldr        r3,PTR_tilemapShopMenu_0801edb4
    mov        r4,#0x15
    mov        r5,#0xc
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r5}
    cmp        r0,#0xc
    bmi        LAB_0801edb0
    push       {r0,r5}
    mov        r1,#0x2a
    sub        r0,r1,r0
    mov        r1,#0x0
    mov        r2,#0x3
    ldr        r3,PTR_tilemapShopZennyDefault_0801edb8
    mov        r4,#0x9
    mov        r5,#0x4
    bl         LC_Screen_SafeCopyTileMapRect
    pop        {r0,r5}
LAB_0801edb0:
    pop        {pc}

    .align 2, 0

PTR_tilemapShopMenu_0801edb4:
    .word tilemapShopMenu
PTR_tilemapShopZennyDefault_0801edb8:
    .word tilemapShopZennyDefault
PTR_gScreens_screen3_tileIndex_0801edbc:
    .word 0x3001800


_ts Shop_1_6_2_Finish
    push       {lr}
    mov        r0,#0x8
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    pop        {pc}


_ts Shop_1_8_StartClose
    push       {lr}
    ldr        r7,PTR_PTR_Shop_1_8_0_ComeAgainSoon_0801ede0
    ldrb       r0,[r5,#0x2]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Shop_DrawMenuArrow
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_1_8_0_ComeAgainSoon_0801ede0:
    .word PTR_Shop_1_8_0_ComeAgainSoon_0801ede4
PTR_Shop_1_8_0_ComeAgainSoon_0801ede4:
    .word Shop_1_8_0_ComeAgainSoon
    .word Shop_1_8_1_PrepareClose


_ts Shop_1_8_0_ComeAgainSoon
    push       {lr}
    mov        r0,#0x5
    bl         Shop_SetClerkDialogue
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    mov        r0,#0x6
    bl         Flag_Clear400
    pop        {pc}


_ts Shop_1_8_1_PrepareClose
    push       {lr}
    mov        r0,#0x6
    bl         Flag_Get400
    beq        LAB_0801ee1e
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x3
    tst        r0,r1
    beq        LAB_0801ee1e
    mov        r0,#0x18
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ee1e:
    pop        {pc}


_ts Shop_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_Shop_2_0_Close_0801ee30
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_2_0_Close_0801ee30:
    .word PTR_Shop_2_0_Close_0801ee34
PTR_Shop_2_0_Close_0801ee34:
    .word Shop_2_0_Close
    .word Shop_2_1_Free


_ts Shop_2_0_Close
    push       {lr}
    ldrb       r0,[r5,#0x2]
    ldr        r7,PTR_PTR_Shop_2_0_0_UpdateFinalInventory_0801
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_2_0_0_UpdateFinalInventory_0801:
    .word PTR_Shop_2_0_0_UpdateFinalInventory_0801ee50
PTR_Shop_2_0_0_UpdateFinalInventory_0801ee50:
    .word Shop_2_0_0_UpdateFinalInventory
    .word Shop_2_0_1_Next


_ts Shop_2_0_0_UpdateFinalInventory
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    bl         Shop_UpdateFinalInventory
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    pop        {pc}


_ts Shop_2_0_1_Next
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801ee86
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ee86:
    pop        {pc}


_ts Shop_1_7_ShowItemDescription
    push       {lr}
    ldrb       r0,[r5,#0x2]
    ldr        r7,PTR_PTR_Shop_1_7_0_ShowTextDescription_0801ee9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_PTR_Shop_1_7_0_ShowTextDescription_0801ee9c:
    .word PTR_Shop_1_7_0_ShowTextDescription_0801ee9c
PTR_Shop_1_7_0_ShowTextDescription_0801ee9c:
    .word Shop_1_7_0_ShowTextDescription
    .word Shop_1_7_1_ShowChipDetail
    .word Shop_1_7_2_ShowNothing


_ts Shop_1_7_0_ShowTextDescription
    push       {lr}
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x3
    mov        r7,#0x14
    add        r7,r7,r0
    add        r7,r7,r5
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0801eece
    mov        r0,#0x4
    strb       r0,[r5,#0x2]
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    push       {r7}
    bl         Menu_LoadChipData
    pop        {r7}
    ldrb       r0,[r7,#0x1]
    b          LAB_0801eed6
LAB_0801eece:
    mov        r0,#0x8
    strb       r0,[r5,#0x2]
    ldrb       r0,[r7,#0x1]
    add        r0,#0xb0
LAB_0801eed6:
    bl         Shop_PrintItemDescription
    pop        {pc}


_ts Shop_1_7_1_ShowChipDetail
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldr        r1,DAT_0801ef14
    tst        r0,r1
    beq        LAB_0801eef2
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801eef2:
    mov        r0,#0xa
    mov        r1,#0x0
    bl         Menu_ShowChipDetail
    pop        {pc}


_ts Shop_1_7_2_ShowNothing
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    ldr        r1,DAT_0801ef14
    tst        r0,r1
    beq        LAB_0801ef12
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_0801ef12:
    pop        {pc}
DAT_0801ef14:
    .word 0x102


_ts Shop_2_1_Free
    push       {lr}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801ef2a
    mov        r1,#0x4
LAB_0801ef2a:
    strb       r1,[r0,#0x0]
    ldrb       r1,[r0,#0x4]
    strb       r1,[r0,#0xc]
    ldrb       r1,[r0,#0x5]
    strb       r1,[r0,#0xd]
    ldr        r1,[r5,#0x10]
    str        r1,[r0,#0x74]
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    push       {r5}
    ldr        r7,PTR_PTR_paletteKeyboardNumberChars_0801ef64
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_PTR_paletteKeyboardNumberChars_0801ef64:
    .word PTR_paletteKeyboardNumberChars_0801ef68
PTR_paletteKeyboardNumberChars_0801ef68:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801ef6c:
    .word eBgPaletteF
DAT_0801ef70:
    .word 0x8


_ts Shop_Init
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x70]
    strb       r0,[r7,#0xa]
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    pop        {pc}


_nt Shop_SetClerkDialogue
    push       {r5,lr}
    add        r1,r0,#0x0
    ldr        r0,PTR_PTR_textDictShopClerkStandard_0801ef9c
    ldrb       r2,[r5,#0xa]
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    bl         Text_LoadDialogue
    mov        r0,#0x40
    bl         Text_DisableOption
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_textDictShopClerkStandard_0801ef9c:
    .word PTR_textDictShopClerkStandard_0801efa0
PTR_textDictShopClerkStandard_0801efa0:
    .word textDictShopClerkStandard
    .word textDictShopClerkRobotic
    .word textDictShopClerkRobotic
    .word textDictShopClerkRobotic
    .word textDictShopClerkRude
    .word textDictShopClerkRude
    .word textDictShopClerkRude
    .word textDictShopClerkRude


_ts Shop_PrintItemDescription
    push       {r5,lr}
    add        r1,r0,#0x0
    ldr        r0,PTR_PTR_textDictShopDescription_0801efd4
    ldrb       r2,[r5,#0xa]
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    bl         Text_LoadDialogue
    pop        {r5,pc}

    .align 2, 0

PTR_PTR_textDictShopDescription_0801efd4:
    .word PTR_textDictShopDescription_0801efd8
PTR_textDictShopDescription_0801efd8:
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription
    .word textDictShopDescription


_ts Shop_DrawMenuArrow
    push       {lr}
    ldrb       r0,[r5,#0x8]
    add        r0,#0x1
    cmp        r0,#0x6
    bmi        LAB_0801f010
    mov        r0,#0x0
    ldrb       r1,[r5,#0x7]
    add        r1,#0x1
    cmp        r1,#0x3
    bmi        LAB_0801f00e
    mov        r1,#0x0
LAB_0801f00e:
    strb       r1,[r5,#0x7]
LAB_0801f010:
    strb       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x7]
    push       {r5}
    ldr        r7,PTR_PTR_TilemapEntry_ARRAY_0801f038
    lsl        r1,r1,#0x2
    ldr        r3,[r7,r1]
    ldrb       r1,[r5,#0x6]
    add        r1,r1,r1
    add        r1,#0x2
    mov        r0,#0x0
    mov        r2,#0x3
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    pop        {pc}

    .align 2, 0

    .word 0xC120

    .align 2, 0

PTR_PTR_TilemapEntry_ARRAY_0801f038:
    .word PTR_TilemapEntry_ARRAY_0801f03c
PTR_TilemapEntry_ARRAY_0801f03c:
    .word TilemapEntry_ARRAY_0801f048
    .word TilemapEntry_ARRAY_0801f050
    .word TilemapEntry_ARRAY_0801f058
TilemapEntry_ARRAY_0801f048:
    .incbin "images/shop/arrow_0.tilemap"
TilemapEntry_ARRAY_0801f050:
    .incbin "images/shop/arrow_1.tilemap"
TilemapEntry_ARRAY_0801f058:
    .incbin "images/shop/arrow_2.tilemap"


_ts Shop_LoadShopMenuLeftEdgeDefault
    push       {r5,lr}
    mov        r0,#0x0
    mov        r1,#0x2
    mov        r2,#0x3
    ldr        r3,PTR_tilemapShopMenuLeftEdgeDefault_0801f074
    mov        r4,#0x2
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}
PTR_tilemapShopMenuLeftEdgeDefault_0801f074:
    .word tilemapShopMenuLeftEdgeDefault
tilemapShopMenuLeftEdgeDefault:
    .incbin "images/shop/left_edge.tilemap"


_ts Shop_LoadTilemapZennyDisplay
    push       {r5,lr}
    add        r6,r0,#0x0
    ldr        r0,[r5,#0x10]
    push       {r0}
    ldr        r0,PTR_tilemapShopZennyDefault_0801f0dc
    add        r1,r6,#0x0
    mov        r2,#0x48
    bl         memcpy_16
    pop        {r0}
    bl         ConvertNumToBCD
    push       {r0}
    bl         GetWidthOfBcdNumber
    add        r1,r0,#0x0
    pop        {r0}
    add        r7,r6,#0x0
    add        r7,#0x20
LAB_0801f0be:
    mov        r2,#0xf
    and        r2,r0
    add        r2,r2,r2
    mov        r3,#0xc1
    lsl        r3,r3,#0x8
    add        r2,r2,r3
    strh       r2,[r7,#0x0]
    add        r2,#0x1
    strh       r2,[r7,#0x12]
    sub        r7,#0x2
    lsr        r0,r0,#0x4
    sub        r1,#0x1
    bne        LAB_0801f0be
    pop        {r5,pc}

    .align 2, 0

PTR_tilemapShopZennyDefault_0801f0dc:
    .word tilemapShopZennyDefault


_ts Shop_DrawZennyDisplay
    push       {r5,lr}
    sub        sp,#0x48
    mov        r6,sp
    push       {r6}
    add        r0,r6,#0x0
    bl         Shop_LoadTilemapZennyDisplay
    pop        {r6}
    add        r3,r6,#0x0
    mov        r0,#0x15
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r4,#0x9
    mov        r5,#0x4
    bl         LC_Screen_SafeCopyTileMapRect
    add        sp,#0x48
    pop        {r5,pc}


_ts Shop_PrintItemList
    push       {lr}
    ldrb       r2,[r5,#0x4]
    cmp        r2,#0x5
    bmi        LAB_0801f10e
    mov        r2,#0x4
LAB_0801f10e:
    ldrb       r0,[r5,#0x9]
    lsl        r0,r0,#0x3
    add        r0,#0x14
    add        r0,r0,r5
    mov        r1,#0x0
LAB_0801f118:
    push       {r0,r1,r2}
    bl         Shop_PrintItem
    pop        {r0,r1,r2}
    add        r0,#0x8
    add        r1,#0x1
    cmp        r1,r2
    bmi        LAB_0801f118
LAB_0801f128:
    cmp        r1,#0x4
    bpl        LAB_0801f13a
    add        r0,r1,#0x0
    push       {r1}
    bl         Shop_PrintBlankEntry
    pop        {r1}
    add        r1,#0x1
    b          LAB_0801f128
LAB_0801f13a:
    pop        {pc}


_ts Shop_PrintItem
    push       {r5,lr}
    add        r7,r0,#0x0
    mov        r0,#0x0
    ldrb       r2,[r7,#0x3]
    tst        r2,r2
    bne        LAB_0801f14a
    mov        r0,#0x4
LAB_0801f14a:
    ldr        r6,PTR_iwBufferUITextTile_0801f1c4
    lsl        r2,r1,#0xa
    add        r6,r6,r2
    ldr        r3,PTR_DAT_0801f1e0
    add        r3,r3,r2
    push       {r0,r2,r6,r7}
    ldrb       r1,[r7,#0x1]
    ldrb       r2,[r7,#0x0]
    ldr        r4,PTR_PTR_TextData_BattleChip_Names_0801f1c8
    lsl        r2,r2,#0x2
    add        r7,r0,#0x0
    ldr        r0,[r4,r2]
    add        r2,r6,#0x0
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801f1dc
    bl         Text_CopyCharTileUI
    pop        {r0,r2,r6,r7}
    mov        r4,r10
    ldr        r4,[r4,#0x68]
    ldr        r1,[r7,#0x4]
    str        r1,[r4,#0x4]
    mov        r1,#0x2
    lsl        r1,r1,#0x8
    add        r6,r6,r1
    ldr        r3,PTR_DAT_0801f1e4
    add        r3,r3,r2
    push       {r0,r2,r6,r7}
    add        r7,r0,#0x0
    ldr        r0,PTR_textDictShopClerkStandard_0801f1d4
    mov        r1,#0x6
    add        r2,r6,#0x0
    mov        r4,#0x7
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801f1dc
    bl         Text_CopyCharTileUI
    pop        {r0,r2,r6,r7}
    mov        r1,#0x1a
    ldrb       r4,[r7,#0x0]
    tst        r4,r4
    bne        LAB_0801f1a2
    ldrb       r1,[r7,#0x2]
LAB_0801f1a2:
    mov        r4,#0x1c
    lsl        r4,r4,#0x4
    add        r6,r6,r4
    ldr        r3,PTR_DAT_0801f1e8
    add        r3,r3,r2
    push       {r6,r7}
    add        r7,r0,#0x0
    ldr        r0,PTR_TextData_BattleChip_Codes_0801f1d8
    add        r2,r6,#0x0
    mov        r4,#0x1
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801f1dc
    bl         Text_CopyCharTileUI
    pop        {r6,r7}
    pop        {r5,pc}

    .align 2, 0

PTR_iwBufferUITextTile_0801f1c4:
    .word iwBufferUITextTile
PTR_PTR_TextData_BattleChip_Names_0801f1c8:
    .word PTR_TextData_BattleChip_Names_0801f1cc
PTR_TextData_BattleChip_Names_0801f1cc:
    .word TextData_BattleChip_Names
    .word DialogueData_Item_Names
PTR_textDictShopClerkStandard_0801f1d4:
    .word textDictShopClerkStandard
PTR_TextData_BattleChip_Codes_0801f1d8:
    .word TextData_BattleChip_Codes
PTR_tilesetDialogueText_0801f1dc:
    .word tilesetDialogueText
PTR_DAT_0801f1e0:
    .word 0x6007000
PTR_DAT_0801f1e4:
    .word 0x6007200
PTR_DAT_0801f1e8:
    .word 0x60073c0
tilemapShopMenu:
    .incbin "images/shop/menu.tilemap"


_ts Shop_PrintBlankEntry
    push       {lr}
    sub        sp,#0x4
    ldr        r1,DAT_0801f404
    str        r1,[sp,#0x0]
    ldr        r2,PTR_DAT_0801f400
    lsl        r1,r0,#0xa
    add        r1,r1,r2
    mov        r0,sp
    ldr        r2,CpuSetControl_0801f408
    bl         SWI_CpuSet
    add        sp,#0x4
    pop        {pc}

    .align 2, 0

PTR_DAT_0801f400:
    .word 0x6007000
DAT_0801f404:
    .word 0x11111111
CpuSetControl_0801f408:
   .word 0x5000100


_ts Shop_MoveArrowUp
    push       {lr}
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_0801f430
    sub        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_0801f42a
    sub        r0,#0x1
    strb       r0,[r5,#0x6]
    b          LAB_0801f430
LAB_0801f42a:
    ldrb       r0,[r5,#0x9]
    sub        r0,#0x1
    strb       r0,[r5,#0x9]
LAB_0801f430:
    pop        {pc}


_nt Shop_MoveArrowDown
    push       {lr}
    ldrb       r0,[r5,#0x5]
    ldrb       r1,[r5,#0x4]
    sub        r1,#0x1
    cmp        r0,r1
    bpl        LAB_0801f45a
    add        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    ldrb       r0,[r5,#0x6]
    cmp        r0,#0x3
    beq        LAB_0801f454
    add        r0,#0x1
    strb       r0,[r5,#0x6]
    b          LAB_0801f45a
LAB_0801f454:
    ldrb       r0,[r5,#0x9]
    add        r0,#0x1
    strb       r0,[r5,#0x9]
LAB_0801f45a:
    pop        {pc}


_ts Shop_DrawUpDownArrows
    push       {lr}
    ldr        r3,PTR_tilemapShopUpEdge_0801f4a4
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    beq        LAB_0801f468
    ldr        r3,PTR_tilemapShopUpArrow_0801f49c
LAB_0801f468:
    push       {r5}
    mov        r0,#0xa
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldr        r3,PTR_tilemapShopDownEdge_0801f4a8
    ldrb       r0,[r5,#0x9]
    add        r0,#0x4
    ldrb       r1,[r5,#0x4]
    cmp        r0,r1
    bpl        LAB_0801f488
    ldr        r3,PTR_tilemapShopDownArrow_0801f4a0
LAB_0801f488:
    push       {r5}
    mov        r0,#0xa
    mov        r1,#0xa
    mov        r2,#0x3
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5}
    pop        {pc}
PTR_tilemapShopUpArrow_0801f49c:
    .word tilemapShopUpArrow
PTR_tilemapShopDownArrow_0801f4a0:
    .word tilemapShopDownArrow
PTR_tilemapShopUpEdge_0801f4a4:
    .word tilemapShopUpEdge
PTR_tilemapShopDownEdge_0801f4a8:
    .word tilemapShopDownEdge
tilemapShopUpArrow:
    .incbin "images/shop/up_arrow.tilemap"
tilemapShopDownArrow:
    .incbin "images/shop/down_arrow.tilemap"
tilemapShopUpEdge:
    .incbin "images/shop/up_edge.tilemap"
tilemapShopDownEdge:
    .incbin "images/shop/down_edge.tilemap"


_ts Shop_CheckPurchase
    push       {lr}
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x3
    add        r0,#0x14
    add        r7,r0,r5
    ldr        r0,[r5,#0x10]
    ldr        r1,[r7,#0x4]
    cmp        r0,r1
    bmi        LAB_0801f4ec
    ldrb       r2,[r7,#0x3]
    tst        r2,r2
    beq        LAB_0801f4f0
    cmp        r2,#0xff
    beq        LAB_0801f4e8
LAB_0801f4e8:
    mov        r0,#0x0
    b          LAB_0801f4f2
LAB_0801f4ec:
    mov        r0,#0x1
    b          LAB_0801f4f2
LAB_0801f4f0:
    mov        r0,#0x2
LAB_0801f4f2:
    pop        {pc}


_ts Shop_AttemptPurchase
    push       {lr}
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x3
    add        r0,#0x14
    add        r7,r0,r5
    ldr        r0,[r5,#0x10]
    ldr        r1,[r7,#0x4]
    cmp        r0,r1
    bmi        LAB_0801f586
    ldrb       r2,[r7,#0x3]
    tst        r2,r2
    beq        LAB_0801f58a
    cmp        r2,#0xff
    beq        LAB_0801f514
    sub        r2,#0x1
    strb       r2,[r7,#0x3]
LAB_0801f514:
    sub        r0,r0,r1
    str        r0,[r5,#0x10]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0801f52c
    ldrb       r0,[r7,#0x1]
    ldrb       r1,[r7,#0x2]
    mov        r2,#0x1
    bl         Inventory_AddChip
    mov        r0,#0x0
    b          LAB_0801f58c
LAB_0801f52c:
    ldrb       r0,[r7,#0x1]
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    ldrb       r0,[r7,#0x1]
    cmp        r0,#0x40
    bne        LAB_0801f55c
    ldrb       r1,[r5,#0xa]
    ldr        r6,PTR_gShopHpMemoryBuyCount_0801f5d8
    mov        r2,#0x0
    add        r6,r6,r2
    ldrb       r2,[r6,r1]
    add        r2,#0x1
    strb       r2,[r6,r1]
    ldr        r6,PTR_listHpMemPrice_0801f590
    lsl        r3,r1,#0x2
    ldr        r6,[r6,r3]
    lsl        r2,r2,#0x2
    ldr        r0,[r6,r2]
    tst        r0,r0
    beq        LAB_0801f55c
    str        r0,[r7,#0x4]
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0801f55c:
    cmp        r0,#0x41
    bne        LAB_0801f582
    ldrb       r1,[r5,#0xa]
    ldr        r6,PTR_gShopHpMemoryBuyCount_0801f5d8
    mov        r2,#0x8
    add        r6,r6,r2
    ldrb       r2,[r6,r1]
    add        r2,#0x1
    strb       r2,[r6,r1]
    ldr        r6,PTR_listPowUpPrice_0801f5b4
    lsl        r3,r1,#0x2
    ldr        r6,[r6,r3]
    lsl        r2,r2,#0x2
    ldr        r0,[r6,r2]
    tst        r0,r0
    beq        LAB_0801f582
    str        r0,[r7,#0x4]
    mov        r0,#0x1
    strb       r0,[r7,#0x3]
LAB_0801f582:
    mov        r0,#0x0
    b          LAB_0801f58c
LAB_0801f586:
    mov        r0,#0x1
    b          LAB_0801f58c
LAB_0801f58a:
    mov        r0,#0x2
LAB_0801f58c:
    pop        {pc}

    .align 2, 0

PTR_listHpMemPrice_0801f590:
    .word listHpMemPrice
listHpMemPrice:
    .word listHpMemPrice0
    .word listHpMemPrice1
    .word listHpMemPrice2
    .word listHpMemPrice3
    .word listHpMemPrice4
    .word listHpMemPrice5
    .word listHpMemPrice6
    .word listHpMemPrice7
PTR_listPowUpPrice_0801f5b4:
    .word listPowUpPrice
listPowUpPrice:
    .word listPowUpPrice0
    .word listPowUpPrice1
    .word listPowUpPrice2
    .word listPowUpPrice3
    .word listPowUpPrice4
    .word listPowUpPrice5
    .word listPowUpPrice6
    .word listPowUpPrice7
PTR_gShopHpMemoryBuyCount_0801f5d8:
    .word gShopHpMemoryBuyCount
listHpMemPrice0:
    .word 0
    .word 0
listHpMemPrice1:
    .word 500, 1000, 2000, 3000, 5000
    .word 0
listHpMemPrice2:
    .word 4000, 6000, 9000, 12000, 15000
    .word 0
listHpMemPrice3:
    .word 6000, 8000, 10000, 12000, 15000
    .word 0
listHpMemPrice4:
    .word 8000, 10000, 12000, 15000
    .word 0
listHpMemPrice5:
    .word 12000, 15000, 20000, 25000
    .word 0
listHpMemPrice6:
    .word 12000, 15000, 20000, 25000
    .word 0
listHpMemPrice7:
    .word 20000, 20000, 25000, 40000
    .word 0
listPowUpPrice0:
    .word 0
    .word 0
listPowUpPrice1:
    .word 2000, 5000
    .word 0
listPowUpPrice2:
    .word 0
    .word 0
listPowUpPrice3:
    .word 0
    .word 0
listPowUpPrice4:
    .word 0
    .word 0
listPowUpPrice5:
    .word 0
    .word 0
listPowUpPrice6:
    .word 25000, 50000
    .word 0
listPowUpPrice7:
    .word 0
    .word 0


_ts Shop_InitializeDefaultInventory
    push       {lr}
    mov        r6,#0x0
    ldr        r7,PTR_TransferDetail_1F700_ARRAY_0801f6fc
LAB_0801f6ca:
    ldr        r3,[r7,#0x0]
    ldr        r4,[r7,#0x4]
LAB_0801f6ce:
    ldrb       r0,[r3,#0x0]
    strb       r0,[r4,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801f6e4
    ldr        r0,[r3,#0x0]
    str        r0,[r4,#0x0]
    ldr        r1,[r3,#0x4]
    str        r1,[r4,#0x4]
    add        r3,#0x8
    add        r4,#0x8
    b          LAB_0801f6ce
LAB_0801f6e4:
    add        r7,#0x8
    add        r6,#0x1
    cmp        r6,#0x8
    bmi        LAB_0801f6ca
    ldr        r0,PTR_gShopHpMemoryBuyCount_0801f6f8
    mov        r1,#0x10
    bl         memset0_16
    pop        {pc}

    .align 2, 0

PTR_gShopHpMemoryBuyCount_0801f6f8:
    .word gShopHpMemoryBuyCount
PTR_TransferDetail_1F700_ARRAY_0801f6fc:
    .word TransferDetail_1F700_ARRAY_0801f700
TransferDetail_1F700_ARRAY_0801f700:
    @ 0
    .word listShopInventory0
    .word gShopInventory0
    @ 1
    .word listShopInventory1
    .word gShopInventory1
    @ 2
    .word listShopInventory2
    .word gShopInventory2
    @ 3
    .word listShopInventory3
    .word gShopInventory3
    @ 4
    .word listShopInventory4
    .word gShopInventory4
    @ 5
    .word listShopInventory5
    .word gShopInventory5
    @ 6
    .word listShopInventory6
    .word gShopInventory6
    @ 7
    .word listShopInventory7
    .word gShopInventory7

listShopInventory0:
    shop_item Cannon E, 3, 1000
    shop_item Spreader K, 3, 1000
    shop_item Recov80 E, 3, 3000
    shop_item X_Panel3 L, 3, 3000
    shop_item Repair G, 3, 3000
    shop_item Barrier F, 3, 3000
    shop_item ElecSwrd E, 3, 5000
    shop_item Steal L, 3, 5000
    .word 0xFF

listShopInventory1:
    shop_item_key HPmemory, 1, 500
    shop_item_key PowerUP, 1, 2000
    shop_item WideSwrd K, 3, 1000
    shop_item Spreader I, 3, 1000
    shop_item Hammer A, 3, 2000
    shop_item Recov50 C, 3, 2000
    shop_item Cannon C, 3, 3000
    .word 0xFF

listShopInventory2:
    shop_item_key HPmemory, 1, 4000
    shop_item_key WoodArmr, 1, 15000
    shop_item WideSwrd S, 3, 3000
    shop_item Hammer I, 3, 3000
    shop_item X_Panel3 G, 3, 3000
    shop_item M_Cannon L, 3, 10000
    .word 0xFF

listShopInventory3:
    shop_item_key HPmemory, 1, 6000
    shop_item_key HeatArmr, 1, 20000
    shop_item IceCube I, 3, 3000
    shop_item Cloudier A, 3, 5000
    .word 0xFF

listShopInventory4:
    shop_item_key HPmemory, 1, 8000
    shop_item_key PowerUP, 1, 20000
    shop_item X_Panel1 S, 3, 1000
    shop_item Invis1 Q, 3, 5000
    shop_item TimeBom2 S, 3, 8000
    shop_item TriSpear J, 3, 10000
    shop_item Recov150 C, 3, 10000
    shop_item Ratton2 G, 3, 10000
    .word 0xFF

listShopInventory5:
    shop_item_key HPmemory, 1, 12000
    shop_item_key PowerUP, 1, 25000
    shop_item_key AquaArmr, 1, 30000
    shop_item LongSwrd E, 3, 5000
    shop_item M_Cannon L, 3, 10000
    shop_item Steal A, 3, 10000
    .word 0xFF

listShopInventory6:
    shop_item_key HPmemory, 1, 12000
    shop_item_key PowerUP, 1, 25000
    shop_item IcePunch M, 3, 5000
    shop_item Geddon1 L, 3, 5000
    shop_item Geddon2 A, 3, 8000
    .word 0xFF

listShopInventory7:
    shop_item_key HPmemory, 1, 15000
    shop_item_key PowerUP, 1, 100000
    shop_item Dash G, 3, 3000
    shop_item Repair G, 3, 3000
    shop_item Wave A, 3, 10000
    shop_item BblWrap3 R, 3, 10000
    .word 0xFF


_ts Shop_SetupInventory
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_listShopInventory_0801f920
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        r6,#0x14
    add        r6,r6,r5
    mov        r4,#0x0
LAB_0801f900:
    ldrb       r0,[r7,#0x0]
    strb       r0,[r6,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801f918
    ldr        r0,[r7,#0x0]
    str        r0,[r6,#0x0]
    ldr        r0,[r7,#0x4]
    str        r0,[r6,#0x4]
    add        r6,#0x8
    add        r7,#0x8
    add        r4,#0x1
    b          LAB_0801f900
LAB_0801f918:
    strb       r4,[r5,#0x4]
    add        r0,r4,#0x0
    pop        {pc}

    .align 2, 0

PTR_listShopInventory_0801f920:
    .word listShopInventory
listShopInventory:
    .word gShopInventory0
    .word gShopInventory1
    .word gShopInventory2
    .word gShopInventory3
    .word gShopInventory4
    .word gShopInventory5
    .word gShopInventory6
    .word gShopInventory7


_ts Shop_UpdateFinalInventory
    push       {lr}
    mov        r6,#0x14
    add        r6,r6,r5
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_listShopInventory_0801f970
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
LAB_0801f952:
    ldrb       r0,[r6,#0x0]
    strb       r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801f96e
    ldrb       r0,[r6,#0x3]
    tst        r0,r0
    beq        LAB_0801f96a
    ldr        r0,[r6,#0x0]
    str        r0,[r7,#0x0]
    ldr        r0,[r6,#0x4]
    str        r0,[r7,#0x4]
    add        r7,#0x8
LAB_0801f96a:
    add        r6,#0x8
    b          LAB_0801f952
LAB_0801f96e:
    pop        {pc}
PTR_listShopInventory_0801f970:
    .word listShopInventory


_ts Shop_GetUniqueStockCount
    push       {lr}
    ldr        r7,PTR_listShopInventory_0801f98c
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        r0,#0x0
LAB_0801f97e:
    ldrb       r1,[r7,#0x0]
    cmp        r1,#0xff
    beq        LAB_0801f98a
    add        r0,#0x1
    add        r7,#0x8
    b          LAB_0801f97e
LAB_0801f98a:
    pop        {pc}
PTR_listShopInventory_0801f98c:
    .word listShopInventory


_ts Shop_CreateBg
    push       {lr}
    sub        sp,#0x80
    mov        r0,sp
    bl         Shop_CopyBgTilemap
    mov        r6,#0x0
LAB_0801f99c:
    mov        r7,#0x3
    and        r7,r6
    lsl        r7,r7,#0x3
    add        r0,r7,#0x0
    mov        r7,#0xc
    and        r7,r6
    lsl        r1,r7,#0x2
    mov        r2,#0x1
    mov        r3,sp
    mov        r4,#0x8
    mov        r5,#0x8
    push       {r6}
    bl         Screen_CopyTileMapRect
    pop        {r6}
    add        r6,#0x1
    cmp        r6,#0x8
    bmi        LAB_0801f99c
    mov        r0,sp
    bl         Shop_ShiftBgTilemap
    mov        r6,#0x0
LAB_0801f9c8:
    mov        r7,#0x3
    and        r7,r6
    lsl        r7,r7,#0x3
    add        r0,r7,#0x0
    mov        r7,#0xc
    and        r7,r6
    lsl        r1,r7,#0x2
    add        r1,#0x8
    mov        r2,#0x1
    mov        r3,sp
    mov        r4,#0x8
    mov        r5,#0x8
    push       {r6}
    bl         Screen_CopyTileMapRect
    pop        {r6}
    add        r6,#0x1
    cmp        r6,#0x8
    bmi        LAB_0801f9c8
    add        sp,#0x80
    pop        {pc}


_nt Shop_CopyBgTilemap
    push       {lr}
    ldr        r1,DAT_0801fa04
    mov        r3,#0x40
LAB_0801f9f8:
    strh       r1,[r0,#0x0]
    add        r1,#0x1
    add        r0,#0x2
    sub        r3,#0x1
    bne        LAB_0801f9f8
    pop        {pc}
DAT_0801fa04:
    .word 0xB32A


_ts Shop_ShiftBgTilemap
    push       {lr}
    mov        r3,#0x0
LAB_0801fa0c:
    ldr        r1,[r0,#0x0]
    ldr        r2,[r0,#0x8]
    str        r2,[r0,#0x0]
    str        r1,[r0,#0x8]
    ldr        r1,[r0,#0x4]
    ldr        r2,[r0,#0xc]
    str        r2,[r0,#0x4]
    str        r1,[r0,#0xc]
    add        r0,#0x10
    add        r3,#0x1
    cmp        r3,#0x8
    bmi        LAB_0801fa0c
    pop        {pc}


_nt Shop_ScrollBackground
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    ldrh       r0,[r7,#0x10]
    add        r0,#0x1
    strh       r0,[r7,#0x10]
    ldrh       r0,[r7,#0x12]
    add        r0,#0x1
    strh       r0,[r7,#0x12]
    pop        {pc}


_nt Shop_Restock
    push       {lr}
    mov        r2,#0x0
    ldr        r7,PTR_listShopInventory_0801fa70
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
LAB_0801fa44:
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801fa50
    add        r2,#0x1
    add        r7,#0x8
    b          LAB_0801fa44
LAB_0801fa50:
    ldrb       r0,[r1,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801fa68
    ldr        r0,[r1,#0x0]
    str        r0,[r7,#0x0]
    ldr        r0,[r1,#0x4]
    str        r0,[r7,#0x4]
    add        r1,#0x8
    add        r7,#0x8
    add        r2,#0x1
    cmp        r2,#0x10
    ble        LAB_0801fa50
LAB_0801fa68:
    mov        r0,#0xff
    strb       r0,[r7,#0x0]
    pop        {pc}

    .align 2, 0

PTR_listShopInventory_0801fa70:
    .word listShopInventory


_ts Shop_RestockHigsby1
    push       {lr}
    mov        r0,#0x0
    ldr        r1,PTR_listStockHigsby1_0801fa8c
    bl         Shop_Restock
    pop        {pc}


_ts Shop_RestockHigsby2
    push       {lr}
    mov        r0,#0x0
    ldr        r1,PTR_listStockHigsby2_0801fa90
    bl         Shop_Restock
    pop        {pc}
PTR_listStockHigsby1_0801fa8c:
    .word listStockHigsby1
PTR_listStockHigsby2_0801fa90:
    .word listStockHigsby2

listStockHigsby1:
    shop_item FstGauge A, 3, 3000
    shop_item Geddon1 H, 3, 3000
    shop_item Interrupt L, 3, 8000
    shop_item Recov150 L, 3, 10000
    .word 0xFF

listStockHigsby2:
    shop_item SloGauge Q, 3, 5000
    shop_item Geddon2 K, 3, 8000
    shop_item FtrSword S, 3, 12000
    shop_item BstrSwrd S, 3, 20000
    .word 0xFF
