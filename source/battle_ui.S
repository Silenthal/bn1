    .include "constants.inc"
    .include "macros.inc"

    .set tilesetBattleUi, 0x86346d4
    .set paletteBattleUi, 0x8634634
    .set paletteHpChange, 0x8634654
    .set Color_ARRAY_08634674, 0x8634674
    .set DAT_06008020, 0x6008020
    .set DAT_06008a00, 0x6008a00
    .set tilesetBoldAlphanumeric, 0x861bb08

    .text

_ts BattleUi_Init
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x1c]
    push       { r5 }
    add        r0,r5,#0x0
    mov        r1,#0x2c
    bl         memset0_32
    ldr        r0,PTR_tilesetBattleUi_080155ec
    ldr        r1,PTR_DAT_080155f0
    ldr        r2,DAT_080155f4
    bl         Dma_TransferListAdd
    pop        { r5 }
    pop        { pc }

_ts BattleUi_Update
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x1c]
    push       { r5 }
    ldr        r0,PTR_paletteBattleUi_080155f8
    ldr        r1,PTR_eBgPaletteA_080155fc
    mov        r2,#0x20
    bl         memcpy_32
    ldr        r0,PTR_paletteBattleUi_080155f8
    ldr        r1,PTR_eBgPalette9_08015600
    mov        r2,#0x20
    bl         memcpy_32
    pop        { r5 }
    bl         BattleUi_CheckDrawPlayerHp
    bl         BattleUi_CheckDrawCustomGauge
    bl         CheckDrawActiveChip
    pop        { pc }

_ts BattleUi_SetState
    push       { r1, r2, lr }
    mov        r2,r10
    ldr        r2,[r2,#0x1c]
    ldrb       r1,[r2,#0x4]
    orr        r1,r0
    strb       r1,[r2,#0x4]
    pop        { r1, r2, pc }

_ts BattleUi_ClearState
    push       { r1, r2, lr }
    mov        r2,r10
    ldr        r2,[r2,#0x1c]
    ldrb       r1,[r2,#0x4]
    bic        r1,r0
    strb       r1,[r2,#0x4]
    pop        { r1, r2, pc }

_ts BattleUi_CheckState
    push       { r1, r2, lr }
    mov        r2,r10
    ldr        r2,[r2,#0x1c]
    ldrb       r1,[r2,#0x4]
    and        r0,r1
    pop        { r1, r2, pc }

_ts BattleUi_CheckDrawPlayerHp
    push       { lr }
    mov        r3,r10
    ldr        r3,[r3,#0xc]
    ldr        r3,[r3,#0x40]
    ldrh       r0,[r3,#0x20]
    ldrh       r1,[r3,#0x22]
    lsr        r1,r1,#0x2
    cmp        r0,r1
    bgt        LAB_0801548a
    ldrb       r0,[r5,#0x3]
    add        r0,#0x1
    strb       r0,[r5,#0x3]
    cmp        r0,#0x2a
    blt        LAB_0801547c
    mov        r0,#0x0
    strb       r0,[r5,#0x3]
    push       { r3 }
    mov        r0,#0x80
    bl         BattleUi_CheckState
    pop        { r3 }
    beq        LAB_0801547c
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x9]
    tst        r7,r7
    bne        LAB_0801547c
    mov        r0,#0xd7
    bl         Sound_PlaySongImmediate
LAB_0801547c:
    push       { r3, r5 }
    ldr        r0,PTR_Color_ARRAY_08015604
    ldr        r1,PTR_eBgPaletteA_08015608
    mov        r2,#0x20
    bl         memcpy_32
    pop        { r3, r5 }
LAB_0801548a:
    push       { r3 }
    mov        r0,#0x80
    bl         BattleUi_CheckState
    pop        { r3 }
    beq        LAB_080154aa
    ldrh       r1,[r3,#0x20]
    ldrh       r2,[r5,#0xa]
    cmp        r1,r2
    beq        LAB_080154a0
    strh       r1,[r5,#0xa]
LAB_080154a0:
    push       { r3 }
    mov        r0,#0x0
    bl         DrawPlayerHp
    pop        { r3 }
LAB_080154aa:
    pop        { pc }

_ts DrawPlayerHp
    push       { r5, lr }
    bl         LoadHpTilemap
    mov        r2,#0xa0
    ldrh       r1,[r5,#0x8]
    ldrh       r3,[r5,#0xa]
    cmp        r1,r3
    beq        LAB_080154e2
    bgt        LAB_080154da
    add        r1,#0x4
    cmp        r1,r3
    ble        LAB_080154c6
    add        r1,r3,#0x0
LAB_080154c6:
    strh       r1,[r5,#0x8]
    mov        r2,#0xa0
    push       { r1, r2, r5 }
    ldr        r0,PTR_paletteHpChange_0801560c
    ldr        r1,PTR_eBgPaletteA_08015610
    mov        r2,#0x20
    bl         memcpy_32
    pop        { r1, r2, r5 }
    b          LAB_080154e2
LAB_080154da:
    sub        r1,#0x4
    cmp        r1,r3
    bge        LAB_080154e2
    add        r1,r3,#0x0
LAB_080154e2:
    strh       r1,[r5,#0x8]
    mov        r8,r2
    add        r0,r1,#0x0
    add        r1,r5,#0x0
    add        r1,#0xc
    bl         BattleUi_WriteBcdToBuffer
    add        r1,r5,#0x0
    add        r1,#0xc
    ldr        r3,DAT_08015614
    mov        r2,r8
    lsl        r2,r2,#0x8
    orr        r3,r2
    mov        r2,#0x0
    add        r6,r5,#0x0
    add        r6,#0x10
LAB_08015502:
    ldrb       r4,[r1,r2]
    lsl        r4,r4,#0x1
    add        r4,r4,r3
    strh       r4,[r6,#0x0]
    add        r4,#0x1
    mov        r8,r7
    lsl        r7,r7,#0x1
    strh       r4,[r6,r7]
    mov        r7,r8
    add        r2,#0x1
    add        r6,#0x2
    cmp        r2,r7
    blt        LAB_08015502
    sub        r0,r7,#0x5
    neg        r0,r0
    mov        r1,#0x0
    mov        r2,#0x3
    add        r3,r5,#0x0
    add        r3,#0x10
    add        r4,r7,#0x0
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        { r5, pc }

_ts LoadHpTilemap
    push       { r5, lr }
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    ldr        r3,PTR_TilemapEntry_ARRAY_08015618
    mov        r4,#0x6
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        { r5, pc }

TilemapEntry_ARRAY_08015548:
    tilemap_entry 0x219, 0, 0xA
    tilemap_entry 0x217, 0, 0xA
    tilemap_entry 0x217, 0, 0xA
    tilemap_entry 0x217, 0, 0xA
    tilemap_entry 0x217, 0, 0xA
    tilemap_entry 0x219, 1, 0xA
    tilemap_entry 0x21A, 0, 0xA
    tilemap_entry 0x218, 0, 0xA
    tilemap_entry 0x218, 0, 0xA
    tilemap_entry 0x218, 0, 0xA
    tilemap_entry 0x218, 0, 0xA
    tilemap_entry 0x21A, 1, 0xA

_ts BattleUi_InitHpDisplay
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x1c]
    mov        r0,#0x80
    bl         BattleUi_SetState
    mov        r3,r10
    ldr        r3,[r3,#0xc]
    ldr        r3,[r3,#0x40]
    ldrh       r1,[r3,#0x20]
    strh       r1,[r5,#0x8]
    strh       r1,[r5,#0xa]
    pop        { pc }

_ts BattleUi_ClearHpDisplay
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x1c]
    mov        r0,#0x80
    bl         BattleUi_ClearState
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r3,#0x6
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    pop        { pc }

_ts BattleUi_WriteBcdToBuffer
    push       { r5, lr }
    cmp        r0,#0x0
    beq        LAB_080155d4
    ldr        r2,PTR_num1000_0801561c
    mov        r6,#0x0
    mov        r7,#0x0
LAB_080155a8:
    ldr        r3,[r2,r6]
    mov        r4,#0x0
LAB_080155ac:
    cmp        r3,r0
    bgt        LAB_080155b6
    sub        r0,r0,r3
    add        r4,#0x1
    b          LAB_080155ac
LAB_080155b6:
    tst        r7,r7
    beq        LAB_080155c2
    add        r7,#0x1
    strb       r4,[r1,#0x0]
    add        r1,#0x1
    b          LAB_080155cc
LAB_080155c2:
    tst        r4,r4
    beq        LAB_080155cc
    add        r7,#0x1
    strb       r4,[r1,#0x0]
    add        r1,#0x1
LAB_080155cc:
    add        r6,#0x4
    cmp        r6,#0x10
    blt        LAB_080155a8
    pop        { r5, pc }
LAB_080155d4:
    mov        r4,#0x0
    strb       r4,[r1,#0x0]
    mov        r7,#0x1
    pop        { r5, pc }
num1000:
    .word 0x3E8
INT_080155e0:
    .word 0x64
    .word 0xA
    .word 0x1
PTR_tilesetBattleUi_080155ec:
    .word tilesetBattleUi
PTR_DAT_080155f0:
    .word DAT_06008020
DAT_080155f4:
    .word 0x238
PTR_paletteBattleUi_080155f8:
    .word paletteBattleUi
PTR_eBgPaletteA_080155fc:
    .word eBgPaletteA
PTR_eBgPalette9_08015600:
    .word eBgPalette9
PTR_Color_ARRAY_08015604:
    .word Color_ARRAY_08634674
PTR_eBgPaletteA_08015608:
    .word eBgPaletteA
PTR_paletteHpChange_0801560c:
    .word paletteHpChange
PTR_eBgPaletteA_08015610:
    .word eBgPaletteA
DAT_08015614:
    .word 0x201
PTR_TilemapEntry_ARRAY_08015618:
    .word TilemapEntry_ARRAY_08015548
PTR_num1000_0801561c:
    .word num1000

_ts BattleUi_CheckDrawCustomGauge
    push       { r5, lr }
    mov        r0,#0x40
    bl         BattleUi_CheckState
    tst        r0,r0
    beq        LAB_08015630
    bl         DrawCustomGauge
LAB_08015630:
    pop        { r5, pc }

_ts BattleUi_DrawFullCustomGauge
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x1c]
    bl         BattleUi_LoadCustomGaugeTileMap
    mov        r0,#0x40
    bl         BattleUi_SetState
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    bl         dummy_15678
    bl         BattleUi_LoadCustomMapTileMap
    pop        { pc }

_ts BattleUi_LoadCustomGaugeTileMap
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x1c]
    push       { r0 }
    mov        r0,#0x6
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r3,#0x12
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    pop        { r0 }
    mov        r0,#0x40
    bl         BattleUi_ClearState
    pop        { pc }

_ts dummy_15678
    push       { r5, lr }
    pop        { r5, pc }

_ts DrawCustomGauge
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0xc]
    ldrh       r0,[r0,#0x3e]
    ldr        r6,DAT_080157a4
    ldr        r7,DAT_080157a8
    cmp        r0,#0x0
    beq        LAB_080156ca
    lsr        r0,r0,#0x7
    add        r0,#0x1
    cmp        r0,#0x80
    blt        LAB_080156ca
    ldrb       r3,[r5,#0x7]
    tst        r3,r3
    beq        LAB_080156a4
    mov        r0,#0xc8
    bl         Sound_PlaySongImmediate
    mov        r3,#0x0
    strb       r3,[r5,#0x7]
LAB_080156a4:
    ldrb       r1,[r5,#0x6]
    add        r1,#0x1
    strb       r1,[r5,#0x6]
    mov        r2,#0xf
    and        r1,r2
    cmp        r1,#0x7
    bge        LAB_080156b6
    ldr        r3,PTR_tilemapCustomGaugeFullOrange_080157ac
    b          LAB_080156b8
LAB_080156b6:
    ldr        r3,PTR_tilemapCustomGaugeFullWhite_080157b0
LAB_080156b8:
    push       { r5 }
    mov        r0,#0x7
    mov        r1,#0x1
    mov        r2,#0x3
    mov        r4,#0x10
    bl         Screen_CopyTileMapH
    pop        { r5 }
    b          LAB_08015700
LAB_080156ca:
    mov        r3,#0x1
    strb       r3,[r5,#0x7]
    mov        r1,#0x0
    add        r3,r5,#0x0
    add        r3,#0xc
LAB_080156d4:
    cmp        r0,#0x8
    blt        LAB_080156de
    add        r2,r6,#0x0
    sub        r0,#0x8
    b          LAB_080156e2
LAB_080156de:
    add        r2,r0,r7
    sub        r0,r0,r0
LAB_080156e2:
    strh       r2,[r3,#0x0]
    add        r3,#0x2
    add        r1,#0x1
    cmp        r1,#0x10
    blt        LAB_080156d4
    push       { r5 }
    mov        r0,#0x7
    mov        r1,#0x1
    mov        r2,#0x3
    add        r3,r5,#0x0
    add        r3,#0xc
    mov        r4,#0x10
    bl         Screen_CopyTileMapH
    pop        { r5 }
LAB_08015700:
    pop        { pc }
    .align 2, 0
tilemapCustomGaugeFullOrange:
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22C, 0x0, 0xA
    tilemap_entry 0x22D, 0x0, 0xA
    tilemap_entry 0x22E, 0x0, 0xA
    tilemap_entry 0x22F, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA
    tilemap_entry 0x22B, 0x0, 0xA

tilemapCustomGaugeFullWhite:
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x230, 0x0, 0xA
    tilemap_entry 0x231, 0x0, 0xA
    tilemap_entry 0x232, 0x0, 0xA
    tilemap_entry 0x233, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA
    tilemap_entry 0x223, 0x0, 0xA


_ts BattleUi_LoadCustomMapTileMap
    push       { lr }
    push       { r5 }
    mov        r0,#0x6
    mov        r1,#0x0
    mov        r2,#0x3
    ldr        r3,PTR_TilemapEntry_ARRAY_080157b4
    mov        r4,#0x12
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        { r5 }
    pop        { pc }

TilemapEntry_ARRAY_0801575c:
    tilemap_entry 0x229, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x224, 0x0, 0xA
    tilemap_entry 0x225, 0x0, 0xA
    tilemap_entry 0x226, 0x0, 0xA
    tilemap_entry 0x227, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x228, 0x0, 0xA
    tilemap_entry 0x229, 0x1, 0xA
    tilemap_entry 0x22A, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x21B, 0x0, 0xA
    tilemap_entry 0x22A, 0x1, 0xA

DAT_080157a4:
    .word 0xA223
DAT_080157a8:
    .word 0xA21B
PTR_tilemapCustomGaugeFullOrange_080157ac:
    .word tilemapCustomGaugeFullOrange
PTR_tilemapCustomGaugeFullWhite_080157b0:
    .word tilemapCustomGaugeFullWhite
PTR_TilemapEntry_ARRAY_080157b4:
    .word TilemapEntry_ARRAY_0801575c

_ts CheckDrawActiveChip
    push       { lr }
    mov        r0,#0x20
    bl         BattleUi_CheckState
    tst        r0,r0
    beq        LAB_080157fc
    bl         BattleUi_InitActiveChipTileMap
    mov        r7,r10
    ldr        r6,[r7,#0x20]
    ldrb       r2,[r6,#0x1]
    add        r2,#0x6a
    ldrb       r0,[r6,r2]
    cmp        r0,#0xff
    beq        LAB_080157fc
    push       { r0 }
    bl         WriteActiveChipName
    strb       r0,[r5,#0x5]
    bl         BattleUi_LoadActiveChipName
    pop        { r0 }
    push       { r0, r5 }
    bl         BattleChip_GetChipData
    ldrh       r1,[r0,#0xc]
    pop        { r0, r5 }
    tst        r1,r1
    beq        LAB_080157fc
    ldrb       r0,[r5,#0x5]
    add        r0,#0x2
    bl         BattleUi_LoadActiveChipDamageTileMap
    pop        { pc }
LAB_080157fc:
    pop        { pc }

_ts BattleUi_DrawActiveChip
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x1c]
    bl         BattleUi_InitActiveChipTileMap
    mov        r0,#0x20
    bl         BattleUi_SetState
    bl         BattleUi_LoadActiveChipName
    pop        { pc }

_ts BattleUi_ClearActiveChip
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x1c]
    bl         BattleUi_InitActiveChipTileMap
    mov        r0,#0x20
    bl         BattleUi_ClearState
    pop        { pc }

_ts BattleUi_InitActiveChipTileMap
    push       { r5, lr }
    mov        r0,#0x1
    mov        r1,#0x12
    mov        r2,#0x3
    mov        r3,#0xc
    mov        r4,#0x2
    mov        r5,#0x0
    bl         Screen_SetTileMapRect
    pop        { r5, pc }

_ts WriteActiveChipName
    push       { r5, lr }
    add        r1,r0,#0x0
    ldr        r0,PTR_textDict_BattleChip_Names_080158d4
    ldr        r2,PTR_iwBufferUITextTile_080158d8
    ldr        r3,PTR_DAT_080158dc
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_080158e0
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        { r5, pc }

_ts BattleUi_LoadActiveChipName
    push       { r5, lr }
    mov        r0,#0x1
    mov        r1,#0x12
    mov        r2,#0x3
    ldr        r3,PTR_tilemapActiveChipName_080158e4
    mov        r4,#0x8
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        { r5, pc }

tilemapActiveChipName:
    tilemap_entry 0x250, 0x0, 0x9
    tilemap_entry 0x252, 0x0, 0x9
    tilemap_entry 0x254, 0x0, 0x9
    tilemap_entry 0x256, 0x0, 0x9
    tilemap_entry 0x258, 0x0, 0x9
    tilemap_entry 0x25A, 0x0, 0x9
    tilemap_entry 0x25C, 0x0, 0x9
    tilemap_entry 0x25E, 0x0, 0x9
    tilemap_entry 0x251, 0x0, 0x9
    tilemap_entry 0x253, 0x0, 0x9
    tilemap_entry 0x255, 0x0, 0x9
    tilemap_entry 0x257, 0x0, 0x9
    tilemap_entry 0x259, 0x0, 0x9
    tilemap_entry 0x25B, 0x0, 0x9
    tilemap_entry 0x25D, 0x0, 0x9
    tilemap_entry 0x25F, 0x0, 0x9

_ts BattleUi_LoadActiveChipDamageTileMap
    push       { r5, lr }
    push       { r0 }
    add        r0,r1,#0x0
    add        r1,r5,#0x0
    add        r1,#0xc
    bl         BattleUi_WriteBcdToBuffer
    pop        { r0 }
    add        r1,r5,#0x0
    add        r1,#0xc
    mov        r2,#0x0
    ldr        r3,DAT_080158e8
    add        r6,r5,#0x0
    add        r6,#0x10
LAB_080158a8:
    ldrb       r4,[r1,r2]
    lsl        r4,r4,#0x1
    add        r4,r4,r3
    strh       r4,[r6,#0x0]
    add        r4,#0x1
    mov        r8,r7
    lsl        r7,r7,#0x1
    strh       r4,[r6,r7]
    mov        r7,r8
    add        r2,#0x1
    add        r6,#0x2
    cmp        r2,r7
    blt        LAB_080158a8
    mov        r1,#0x12
    mov        r2,#0x3
    add        r3,r5,#0x0
    add        r3,#0x10
    add        r4,r7,#0x0
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        { r5, pc }

PTR_textDict_BattleChip_Names_080158d4:
    .word textDict_BattleChip_Names
PTR_iwBufferUITextTile_080158d8:
    .word iwBufferUITextTile
PTR_DAT_080158dc:
    .word DAT_06008a00
PTR_tilesetBoldAlphanumeric_080158e0:
    .word tilesetBoldAlphanumeric
PTR_tilemapActiveChipName_080158e4:
    .word tilemapActiveChipName
DAT_080158e8:
    .word 0x9234

    .end
