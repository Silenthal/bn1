#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts InitStartMenu
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x6c]
    push       {r5}
    add        r0,r5,#0x0
    mov        r1,#0x14
    bl         memset0_32
    pop        {r5}
    mov        r0,#0x80
    bl         StartMenu_SetState
    bl         StartMenu_LoadTileset
    mov        r0,#0x4
    bl         Flag_Set400
    mov        r0,#0xbe
    bl         Sound_PlaySongImmediate
    pop        {pc}


_ts InitStartMenuFromSubMenu
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x6c]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         StartMenu_LoadTileset
    mov        r0,#0x4
    bl         Flag_Set400
    pop        {pc}


_ts InitStartMenuState
    push       {lr}
    mov        r0,#0x80
    bl         StartMenu_ClearState
    mov        r0,#0x40
    bl         StartMenu_ClearState
    mov        r0,#0x20
    bl         StartMenu_ClearState
    mov        r0,#0x4
    bl         Flag_Clear400
    pop        {pc}


_ts StartMenu_LoadTileset
    push       {r5,lr}
    ldr        r0,srcTextTileStart
    ldr        r1,dstTextTileStart
    ldr        r2,tileWordCount
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetStartMenuArrowNumbers_08019500
    ldr        r1,PTR_DAT_08019504
    ldr        r2,DAT_08019508
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetStartMenuZenny_0801950c
    ldr        r1,PTR_DAT_08019510
    mov        r2,#0x68
    bl         Dma_TransferListAdd
    mov        r2,#0x40
    push       {r2}
    mov        r0,#0x26
    bl         Flag_Get420
    pop        {r2}
    beq        LAB_08019214
    mov        r2,#0x0
LAB_08019214:
    ldr        r0,PTR_paletteStartMenuNoSave_08019514
    add        r0,r0,r2
    ldr        r1,PTR_eBgPaletteD_08019518
    mov        r2,#0x10
    bl         Dma_TransferListAdd
    pop        {r5,pc}


_ts StartMenu_Main
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x6c]
    ldr        r0,PTR_PTR_StartMenu_0_Open_0801951c
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r0}
    bl         StartMenu_LoadTilemap
    pop        {r0}
    pop        {pc}
    .align 2, 0
PTR_StartMenu_0_Open_08019240:
    .word StartMenu_0_Open
    .word StartMenu_1_HandleInput
    .word StartMenu_2_Close
    .word StartMenu_3_OpenSubMenu


_ts StartMenu_LoadTilemap
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x6c]
    bl         StartMenu_LoadMenuTilemap
    bl         StartMenu_LoadZennyTilemap
    bl         StartMenu_LoadCursorTilemap
    pop        {pc}


_ts StartMenu_0_Open
    ldrb       r0,[r5,#0x4]
    add        r0,#0x1
    strb       r0,[r5,#0x4]
    cmp        r0,#0xd
    blt        LAB_08019272
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08019272:
    mov        r0,#0x0
    mov        pc,lr


_ts StartMenu_1_HandleInput
    push       {lr}
    ldr        r7,[r7,#0x18]
    ldrb       r0,[r7,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0801930a
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0xa
    tst        r1,r0
    beq        LAB_0801929c
LAB_08019290:
    mov        r0,#0x68
    bl         Sound_PlaySongImmediate
    mov        r0,#0x2
    strb       r0,[r5,#0x5]
    b          LAB_08019300
LAB_0801929c:
    mov        r1,#0x1
    tst        r1,r0
    beq        LAB_080192d6
    ldrb       r0,[r5,#0x6]
    cmp        r0,#0x7
    beq        LAB_08019290
    push       {r0,r5}
    mov        r0,#0x26
    bl         Flag_Get420
    pop        {r0,r5}
    beq        LAB_080192c6
    cmp        r0,#0x5
    beq        LAB_080192be
    cmp        r0,#0x6
    beq        LAB_080192be
    b          LAB_080192c6
LAB_080192be:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    b          LAB_0801930a
LAB_080192c6:
    mov        r0,#0x67
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    strb       r0,[r5,#0x5]
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    b          LAB_0801930a
LAB_080192d6:
    ldrb       r2,[r5,#0x6]
    ldrh       r0,[r7,#0x4]
    mov        r1,#0x40
    tst        r1,r0
    beq        LAB_080192ea
    sub        r2,#0x1
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
    b          LAB_080192f8
LAB_080192ea:
    mov        r1,#0x80
    tst        r1,r0
    beq        LAB_080192f8
    add        r2,#0x1
    mov        r0,#0x66
    bl         Sound_PlaySongImmediate
LAB_080192f8:
    mov        r1,#0x7
    and        r2,r1
    strb       r2,[r5,#0x6]
    b          LAB_0801930a
LAB_08019300:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    mov        r0,#0xbe
    bl         Sound_PlaySongImmediate
LAB_0801930a:
    mov        r0,#0x0
    pop        {pc}


_ts StartMenu_2_Close
    push       {lr}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x1
    strb       r0,[r5,#0x4]
    cmp        r0,#0x0
    bgt        LAB_08019332
    mov        r0,#0x80
    bl         StartMenu_ClearState
    mov        r0,#0x20
    bl         StartMenu_ClearState
    mov        r0,#0x4
    bl         Flag_Clear400
    ldrb       r0,[r5,#0x5]
    pop        {pc}
LAB_08019332:
    mov        r0,#0x0
    pop        {pc}


_ts StartMenu_LoadMenuTilemap
    push       {r5,lr}
    ldrb       r1,[r5,#0x4]
    tst        r1,r1
    beq        LAB_08019352
    sub        r1,#0xd
    add        r0,r1,#0x0
    mov        r1,#0x0
    mov        r2,#0x0
    ldr        r3,PTR_tilemapStartMenu_08019520
    mov        r4,#0xd
    mov        r5,#0x14
    bl         LC_Screen_SafeCopyTileMapRect
LAB_08019352:
    pop        {r5,pc}


_ts StartMenu_LoadCursorTilemap
    push       {r5,lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_08019380
    sub        r0,#0xc
    ldrb       r1,[r5,#0x7]
    add        r1,#0x1
    cmp        r1,#0x12
    blt        LAB_08019368
    mov        r1,#0x0
LAB_08019368:
    strb       r1,[r5,#0x7]
    ldr        r3,PTR_tilemapStartMenuCursor_08019524
    lsl        r1,r1,#0x3
    add        r3,r3,r1
    ldrb       r1,[r5,#0x6]
    lsl        r1,r1,#0x1
    add        r1,#0x2
    mov        r2,#0x0
    mov        r4,#0x2
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
LAB_08019380:
    pop        {r5,pc}

    .align 2, 0

tilemapStartMenuCursor:
    @ 0
    .short 0xD290 
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 1
    .short 0xD290
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 2
    .short 0xD290
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 3
    .short 0xD290
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 4
    .short 0xD290
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 5
    .short 0xD290
    .short 0xD291
    .short 0xD292
    .short 0xD293
    @ 6
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 7
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 8
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 9
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 10
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 11
    .short 0xD294
    .short 0xD295
    .short 0xD296
    .short 0xD297
    @ 12
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B
    @ 13
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B
    @ 14
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B
    @ 15
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B
    @ 16
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B
    @ 17
    .short 0xD298
    .short 0xD299
    .short 0xD29A
    .short 0xD29B



_ts StartMenu_LoadZennyTilemap
    push       {r5,lr}
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x4
    cmp        r0,#0x0
    ble        LAB_0801949a
    mov        r1,#0x1e
    sub        r0,r1,r0
    mov        r1,#0x0
    mov        r2,#0x0
    ldr        r3,PTR_tilemapStartMenuZennyUi_08019528
    mov        r4,#0x9
    mov        r5,#0x4
    bl         LC_Screen_SafeCopyTileMapRect
    ldr        r0,PTR_tilemapStartMenuZennyText_0801952c
    mov        r1,r10
    ldr        r1,[r1,#0x6c]
    add        r1,#0x8
    mov        r2,#0x18
    bl         memcpy_32
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x74]
    bl         ConvertNumToBCD
    mov        r8,r0
    bl         GetWidthOfBcdNumber
    mov        r5,r10
    ldr        r5,[r5,#0x6c]
    mov        r0,#0x14
    add        r1,r5,#0x0
    add        r1,#0x8
    mov        r2,#0xf
    mov        r2,#0xf
    ldr        r3,TilemapEntry_08019530
    mov        r4,#0x0
    mov        r9,r3
LAB_08019462:
    mov        r7,r8
    lsr        r7,r0
    and        r7,r2
    tst        r7,r7
    bne        LAB_08019470
    tst        r4,r4
    beq        LAB_0801947c
LAB_08019470:
    lsl        r7,r7,#0x1
    add        r7,r9
    strh       r7,[r1,#0x0]
    add        r7,#0x1
    strh       r7,[r1,#0xc]
    mov        r4,#0x1
LAB_0801947c:
    add        r1,#0x2
    sub        r0,#0x4
    bge        LAB_08019462
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x6
    mov        r1,#0x1e
    sub        r0,r1,r0
    mov        r1,#0x1
    mov        r2,#0x0
    add        r3,r5,#0x0
    add        r3,#0x8
    mov        r4,#0x6
    mov        r5,#0x2
    bl         LC_Screen_SafeCopyTileMapRect
LAB_0801949a:
    pop        {r5,pc}

    .align 2, 0

tilemapStartMenuZennyText:
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD29C
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD2B6
    .short 0xD29D


_ts StartMenu_3_OpenSubMenu
    push       {lr}
    mov        r0,#0x80
    bl         StartMenu_ClearState
    mov        r0,#0x20
    bl         StartMenu_SetState
    ldrb       r0,[r5,#0x5]
    pop        {pc}


_ts StartMenu_SetState
    push       {r1,r2}
    ldr        r1,PTR_gStartMenuState_08019534
    ldr        r2,[r1,#0x0]
    orr        r2,r0
    str        r2,[r1,#0x0]
    pop        {r1,r2}
    mov        pc,lr


_ts StartMenu_ClearState
    push       {r1,r2}
    ldr        r1,PTR_gStartMenuState_08019538
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    pop        {r1,r2}
    mov        pc,lr


_ts StartMenu_GetState
    push       {r1}
    ldr        r1,PTR_gStartMenuState_0801953c
    ldr        r1,[r1,#0x0]
    and        r0,r1
    pop        {r1}
    mov        pc,lr

    .align 2, 0

srcTextTileStart:
    .word tilesetStartMenuText
dstTextTileStart:
    .word 0x600c800
tileWordCount:
    .word 0x1B0
PTR_tilesetStartMenuArrowNumbers_08019500:
    .word tilesetStartMenuArrowNumbers
PTR_DAT_08019504:
    .word 0x600d200
DAT_08019508:
    .word 0x100
PTR_tilesetStartMenuZenny_0801950c:
    .word tilesetStartMenuZenny
PTR_DAT_08019510:
    .word 0x600d600
PTR_paletteStartMenuNoSave_08019514:
    .word paletteStartMenuNoSave
PTR_eBgPaletteD_08019518:
    .word eBgPaletteD
PTR_PTR_StartMenu_0_Open_0801951c:
    .word PTR_StartMenu_0_Open_08019240
PTR_tilemapStartMenu_08019520:
    .word tilemapStartMenu
PTR_tilemapStartMenuCursor_08019524:
    .word tilemapStartMenuCursor
PTR_tilemapStartMenuZennyUi_08019528:
    .word tilemapStartMenuZennyUi
PTR_tilemapStartMenuZennyText_0801952c:
    .word tilemapStartMenuZennyText
TilemapEntry_08019530:
    .word 0xD29C
PTR_gStartMenuState_08019534:
    .word gStartMenuState
PTR_gStartMenuState_08019538:
    .word gStartMenuState
PTR_gStartMenuState_0801953c:
    .word gStartMenuState
