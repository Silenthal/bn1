#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080825cc, 0x80825cc+1

tilemapEmailList:
    .incbin "images/start_menu/email/list.tilemap"
tilemapEmailNewTag:
    .incbin "images/start_menu/email/new_tag.tilemap"
tilemapUpDownArrows:
    .incbin "images/start_menu/email/up_down_arrow.tilemap"


_ts Menu_3_Email
    push       {lr}
    ldr        r0,PTR_PTR_Menu_Email_0_Init_0801c178
    ldrb       r1,[r5,#0x1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_Menu_Email_0_Init_0801c178:
    .word PTR_Menu_Email_0_Init_0801c17c
PTR_Menu_Email_0_Init_0801c17c:
    .word Menu_Email_0_Init
    .word Menu_Email_1_Main
    .word Menu_Email_2_Free


_ts Menu_Email_0_Init
    push       {lr}
    push       {r5}
    ldr        r0,PTR_tilesetMenuDesign_0801c560
    ldr        r1,PTR_DAT_0801c564
    ldr        r2,DAT_0801c568
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuDesign_0801c56c
    ldr        r1,PTR_eBgPalette4_0801c570
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuSideArrow_0801c574
    ldr        r1,PTR_DAT_0801c578
    mov        r2,#0x60
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMenuUpDownArrow_0801c57c
    ldr        r1,PTR_DAT_0801c580
    mov        r2,#0x40
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetNewTag_0801c584
    ldr        r1,PTR_DAT_0801c588
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteMenuSideArrow_0801c58c
    ldr        r1,PTR_eBgPaletteF_0801c590
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    push       {r5}
    bl         Video_ClearScreen
    ldr        r0,PTR_tilemapMenuEmail_0801c594
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,DAT_0801c598
    add        r1,r1,r2
    mov        r2,#0xc0
    bl         Dma_TransferListAdd
    mov        r0,#0x5
    mov        r1,#0x3
    mov        r2,#0x2
    ldr        r3,PTR_tilemapEmailList_0801c59c
    mov        r4,#0x17
    mov        r5,#0x8
    bl         Screen_CopyTileMapRect
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,PTR_DAT_0801c5a0
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
    ldr        r0,PTR_DAT_0801c5a4
    mov        r1,#0x40
    mov        r2,#0x40
    bl         memset
    mov        r0,#0x5
    bl         Flag_Set400
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    ldr        r0,PTR_gEmailCount_0801c5a8
    ldr        r0,[r0,#0x0]
    strb       r0,[r5,#0x10]
    ldr        r6,PTR_gEmailIndexes_0801c5ac
    ldr        r7,PTR_DAT_0801c5a4
LAB_0801c234:
    sub        r0,#0x1
    cmp        r0,#0x0
    blt        LAB_0801c242
    ldrb       r3,[r6,r0]
    strb       r3,[r7,#0x0]
    add        r7,#0x1
    b          LAB_0801c234
LAB_0801c242:
    mov        r0,#0x0
    mov        r7,#0x0
LAB_0801c246:
    push       {r0,r5,r7}
    bl         Flag_GetEmailUnread
    pop        {r0,r5,r7}
    beq        LAB_0801c252
    add        r7,#0x1
LAB_0801c252:
    add        r0,#0x1
    cmp        r0,#0x40
    bge        LAB_0801c246
    strb       r7,[r5,#0x12]
    tst        r7,r7
    beq        LAB_0801c262
    mov        r1,#0x0
    b          LAB_0801c264
LAB_0801c262:
    mov        r1,#0x1
LAB_0801c264:
    push       {r5}
    ldr        r0,PTR_textDict_MenuMessages_0801c5b0
    add        r1,#0x3c
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Email_1_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801c28a
    bl         Menu_Email_HandleInput
LAB_0801c28a:
    bl         Menu_Email_PrintUi
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Email_2_Free
    push       {lr}
    bl         Menu_Email_PrintUi
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801c2ec
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,[r7,#0x8]
    mov        r1,#0x0
    ldrb       r2,[r0,#0x4]
    ldrb       r3,[r0,#0xc]
    cmp        r2,r3
    bne        LAB_0801c2ba
    mov        r1,#0x4
LAB_0801c2ba:
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
    ldr        r0,PTR_paletteKeyboardNumberChars_0801c5b4
    ldr        r1,PTR_eBgPaletteF_0801c5b8
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_0801c2ec:
    mov        r0,#0x0
    pop        {pc}


_ts Menu_Email_PrintUi
    push       {lr}
    bl         Menu_Email_PrintSubjects
    bl         Menu_Email_PrintNewTag
    bl         Menu_Email_PrintArrows
    pop        {pc}


_ts Menu_Email_HandleInput
    push       {lr}
    ldrb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    ldrb       r0,[r5,#0xe]
    strb       r0,[r5,#0xf]
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Get400
    mov        r5,r9
    beq        LAB_0801c31c
    mov        r0,#0x8
    strb       r0,[r5,#0x13]
    b          LAB_0801c3fa
LAB_0801c31c:
    ldrb       r0,[r5,#0x13]
    tst        r0,r0
    beq        LAB_0801c328
    sub        r0,#0x1
    strb       r0,[r5,#0x13]
    b          LAB_0801c3fa
LAB_0801c328:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x2
    tst        r1,r0
    beq        LAB_0801c34c
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
    b          LAB_0801c3fa
LAB_0801c34c:
    ldrb       r6,[r5,#0x10]
    tst        r6,r6
    beq        LAB_0801c3fa
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_0801c37c
    mov        r9,r5
    mov        r0,#0x5
    bl         Flag_Set400
    mov        r5,r9
    ldrb       r2,[r5,#0xc]
    ldrb       r1,[r5,#0xe]
    add        r1,r1,r2
    ldr        r2,PTR_DAT_0801c5a4
    ldrb       r1,[r2,r1]
    cmp        r1,#0x40
    beq        LAB_0801c3fa
    push       {r5}
    ldr        r0,PTR_textDict_MailBodies_0801c5bc
    bl         Text_LoadDialogue
    pop        {r5}
    b          LAB_0801c3fa
LAB_0801c37c:
    ldrb       r2,[r5,#0xc]
    ldrb       r3,[r5,#0xe]
    ldrh       r0,[r7,#0x4]
    ldrh       r4,[r7,#0x0]
    ldr        r1,DAT_0801c5c0
    tst        r4,r1
    beq        LAB_0801c390
    mov        r1,#0xc0
    mvn        r1,r1
    and        r0,r1
LAB_0801c390:
    mov        r4,#0x4
    ldr        r1,DAT_0801c5c4
    tst        r1,r0
    bne        LAB_0801c3a6
    mov        r4,#0x1
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_0801c3ae
    sub        r2,r2,r4
    bge        LAB_0801c3ae
    mov        r2,#0x0
LAB_0801c3a6:
    sub        r3,r3,r4
    bgt        LAB_0801c3e2
    mov        r3,#0x0
    b          LAB_0801c3e2
LAB_0801c3ae:
    mov        r4,#0x4
    ldr        r1,DAT_0801c5c8
    tst        r1,r0
    bne        LAB_0801c3d0
    mov        r4,#0x1
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_0801c3e2
    ldrb       r6,[r5,#0x10]
    sub        r6,#0x1
    cmp        r6,#0x3
    blt        LAB_0801c3c8
    mov        r6,#0x3
LAB_0801c3c8:
    add        r2,r2,r4
    cmp        r2,r6
    ble        LAB_0801c3e2
    add        r2,r6,#0x0
LAB_0801c3d0:
    cmp        r6,#0x3
    blt        LAB_0801c3e2
    ldrb       r6,[r5,#0x10]
    sub        r6,#0x4
    add        r3,r3,r4
    cmp        r3,r6
    ble        LAB_0801c3e2
    add        r3,r6,#0x0
    b          LAB_0801c3e2
LAB_0801c3e2:
    ldrb       r4,[r5,#0xc]
    cmp        r2,r4
    bne        LAB_0801c3f0
    ldrb       r4,[r5,#0xe]
    cmp        r3,r4
    bne        LAB_0801c3f0
    b          LAB_0801c3f6
LAB_0801c3f0:
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_0801c3f6:
    strb       r2,[r5,#0xc]
    strb       r3,[r5,#0xe]
LAB_0801c3fa:
    pop        {pc}


_ts Menu_Email_PrintSubjects
    push       {r5,lr}
    ldrb       r0,[r5,#0xe]
    ldr        r2,PTR_DAT_0801c5cc
    ldr        r3,PTR_DAT_0801c5d0
    add        r1,r0,#0x0
    mov        r0,#0x0
LAB_0801c408:
    push       {r0,r1,r2,r3}
    ldr        r0,PTR_textDict_MailSubjects_0801c5d4
    ldr        r4,PTR_DAT_0801c5a4
    ldrb       r1,[r4,r1]
    mov        r4,#0x17
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0801c5d8
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r0,r1,r2,r3}
    mov        r4,#0x8
    lsl        r4,r4,#0x8
    add        r2,r2,r4
    add        r3,r3,r4
    add        r0,#0x1
    add        r1,#0x1
    cmp        r0,#0x4
    blt        LAB_0801c408
    pop        {r5,pc}


_ts Menu_Email_PrintArrows
    push       {r5,lr}
    mov        r8,r5
    ldrb       r1,[r5,#0xd]
    lsl        r1,r1,#0x1
    add        r1,#0x3
    mov        r0,#0x1
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    mov        r5,r8
    ldrb       r1,[r5,#0x11]
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_0801c454
    mov        r1,#0x0
LAB_0801c454:
    strb       r1,[r5,#0x11]
    ldr        r3,PTR_tilemapListSideArrow_0801c5dc
    lsl        r4,r1,#0x3
    add        r3,r3,r4
    ldrb       r1,[r5,#0xc]
    lsl        r1,r1,#0x1
    add        r1,#0x3
    mov        r0,#0x1
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
    cmp        r0,#0x4
    ble        LAB_0801c4de
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x10
    and        r1,r7
    mov        r5,r8
    ldrb       r0,[r5,#0xe]
    ldr        r3,PTR_tilemapUpDownArrows_0801c5e0
    add        r3,r3,r1
    mov        r8,r3
    cmp        r0,#0x0
    beq        LAB_0801c4c4
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
LAB_0801c4c4:
    ldrb       r5,[r5,#0x10]
    sub        r5,#0x4
    cmp        r0,r5
    beq        LAB_0801c4de
    mov        r0,#0xd
    mov        r1,#0xa
    mov        r2,#0x2
    mov        r3,r8
    add        r3,#0x8
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
LAB_0801c4de:
    pop        {r5,pc}


_ts Menu_Email_PrintNewTag
    push       {r5,lr}
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r1,#0x20
    and        r7,r1
    lsr        r7,r7,#0x2
    ldrb       r1,[r5,#0xe]
    ldr        r3,PTR_tilemapEmailNewTag_0801c5e4
    add        r3,r3,r7
    mov        r0,#0x0
LAB_0801c4f6:
    mov        r8,r0
    add        r0,r0,r1
    ldr        r2,PTR_DAT_0801c5a4
    ldrb       r0,[r2,r0]
    cmp        r0,#0x40
    beq        LAB_0801c526
    push       {r1,r3}
    bl         Flag_GetEmailUnread
    pop        {r1,r3}
    beq        LAB_0801c526
    push       {r1,r3}
    mov        r1,#0x3
    mov        r0,r8
    lsl        r0,r0,#0x1
    add        r1,r1,r0
    mov        r0,#0x3
    mov        r2,#0x2
    mov        r4,#0x2
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r1,r3}
    b          LAB_0801c540
LAB_0801c526:
    push       {r1,r3}
    mov        r1,#0x3
    mov        r0,r8
    lsl        r0,r0,#0x1
    add        r1,r1,r0
    mov        r0,#0x3
    mov        r2,#0x2
    mov        r3,#0x2
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    pop        {r1,r3}
LAB_0801c540:
    mov        r0,r8
    add        r0,#0x1
    cmp        r0,#0x4
    blt        LAB_0801c4f6
    pop        {r5,pc}


_ts ClearEmailIndexes
    push       {r5,lr}
    ldr        r0,PTR_gEmailIndexes_0801c5e8
    mov        r1,#0x40
    mov        r2,#0x40
    bl         memset
    ldr        r0,PTR_gEmailCount_0801c5ec
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        {r5,pc}
PTR_tilesetMenuDesign_0801c560:
    .word tilesetMenuDesign
PTR_DAT_0801c564:
    .word 0x6000020
DAT_0801c568:
    .word 0x540
PTR_paletteMenuDesign_0801c56c:
    .word paletteMenuDesign
PTR_eBgPalette4_0801c570:
    .word eBgPalette4
PTR_tilesetMenuSideArrow_0801c574:
    .word tilesetMenuSideArrow
PTR_DAT_0801c578:
    .word 0x6004020
PTR_tilesetMenuUpDownArrow_0801c57c:
    .word tilesetMenuUpDownArrow
PTR_DAT_0801c580:
    .word 0x6004240
PTR_tilesetNewTag_0801c584:
    .word tilesetNewTag
PTR_DAT_0801c588:
    .word 0x60041a0
PTR_paletteMenuSideArrow_0801c58c:
    .word paletteMenuSideArrow
PTR_eBgPaletteF_0801c590:
    .word eBgPaletteF
PTR_tilemapMenuEmail_0801c594:
    .word tilemapMenuEmail
DAT_0801c598:
    .word 0x800
PTR_tilemapEmailList_0801c59c:
    .word tilemapEmailList
PTR_DAT_0801c5a0:
    .word 0x1f40
PTR_DAT_0801c5a4:
    .word 0x2013400
PTR_gEmailCount_0801c5a8:
    .word gEmailCount
PTR_gEmailIndexes_0801c5ac:
    .word gEmailIndexes
PTR_textDict_MenuMessages_0801c5b0:
    .word textDict_MenuMessages
PTR_paletteKeyboardNumberChars_0801c5b4:
    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_0801c5b8:
    .word eBgPaletteF
PTR_textDict_MailBodies_0801c5bc:
    .word textDict_MailBodies
DAT_0801c5c0:
    .word 0x300
DAT_0801c5c4:
    .word 0x200
DAT_0801c5c8:
    .word 0x100
PTR_DAT_0801c5cc:
    .word 0x2011400
PTR_DAT_0801c5d0:
    .word 0x6004400
PTR_textDict_MailSubjects_0801c5d4:
    .word textDict_MailSubjects
PTR_tilesetDialogueText_0801c5d8:
    .word tilesetDialogueText
PTR_tilemapListSideArrow_0801c5dc:
    .word tilemapListSideArrow
PTR_tilemapUpDownArrows_0801c5e0:
    .word tilemapUpDownArrows
PTR_tilemapEmailNewTag_0801c5e4:
    .word tilemapEmailNewTag
PTR_gEmailIndexes_0801c5e8:
    .word gEmailIndexes
PTR_gEmailCount_0801c5ec:
    .word gEmailCount
