#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts BattleMessage_Load
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x4c]
    lsl        r7,r0,#0x4
    add        r5,r5,r7
    push       {r0,r1,r2,r5}
    add        r0,r5,#0x0
    mov        r1,#0x10
    bl         memset0_32
    pop        {r0,r1,r2,r5}
    strb       r0,[r5,#0x5]
    strb       r1,[r5,#0x2]
    strb       r2,[r5,#0x3]
    mov        r1,#0x1
    strb       r1,[r5,#0x4]
    ldr        r1,PTR_PTR_BattleMessage_LoadTiles_08017964
    lsl        r0,r0,#0x2
    ldr        r0,[r1,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BattleMessage_LoadTiles_080178b0:
    .word BattleMessage_LoadTiles
    .word BattleMessage_LoadTiles
    .word BattleMessage_LoadTiles
    .word BattleMessage_LoadTiles
    .word BattleMessage_CopyChipText
    .word BattleMessage_CopyChipText
    .word BattleMessage_LoadDieBomb
    .word BattleMessage_LoadDieBomb
    .word BattleMessage_LoadZetaOmegaPA
    .word BattleMessage_LoadZetaOmegaPA
    .word BattleMessage_LoadBetaSigmaPA
    .word BattleMessage_LoadBetaSigmaPA
    .word BattleMessage_LoadTiles
    .word BattleMessage_LoadTiles
    .word BattleMessage_LoadTiles


_ts BattleMessage_Main
    mov        r1,#0x1


_nt BattleMessage_Main_2
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x4c]
    lsl        r7,r0,#0x4
    add        r5,r5,r7
    strb       r1,[r5,#0xa]
    strh       r2,[r5,#0xc]
    strh       r3,[r5,#0xe]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x0
    beq        LAB_08017912
    ldr        r0,PTR_PTR_BattleMessage_StaticMessage_08017968
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
LAB_08017912:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_BattleMessage_StaticMessage_08017918:
    .word BattleMessage_StaticMessage
    .word BattleMessage_StaticMessage
    .word BattleMessage_StaticMessage
    .word BattleMessage_StaticMessage
    .word BattleMessage_BattleChip
    .word BattleMessage_BattleChip
    .word BattleMessage_DieBomb
    .word BattleMessage_DieBomb
    .word BattleMessage_ZetaOmega
    .word BattleMessage_ZetaOmega
    .word BattleMessage_BetaSigma
    .word BattleMessage_BetaSigma
    .word BattleMessage_StaticMessage
    .word BattleMessage_BusyOk
    .word BattleMessage_BusyOk


_ts BattleMessage_Disable
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x4c]
    lsl        r7,r0,#0x4
    add        r5,r5,r7
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    pop        {pc}
PTR_PTR_BattleMessage_LoadTiles_08017964:
    .word PTR_BattleMessage_LoadTiles_080178b0
PTR_PTR_BattleMessage_StaticMessage_08017968:
    .word PTR_BattleMessage_StaticMessage_08017918


_ts BattleMessage_LoadTiles
    push       {lr}
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x4
    ldr        r2,PTR_TransferDetail_1799C_ARRAY_08017998
    add        r2,r2,r1
    push       {r5}
    push       {r2}
    ldr        r0,[r2,#0x0]
    ldr        r1,[r2,#0xc]
    ldr        r2,[r2,#0x4]
    bl         Dma_TransferListAdd
    pop        {r2}
    ldr        r0,[r2,#0x8]
    ldr        r1,PTR_eObjPaletteA_08017994
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}
PTR_eObjPaletteA_08017994:
    .word eObjPaletteA
PTR_TransferDetail_1799C_ARRAY_08017998:
    .word TransferDetail_1799C_ARRAY_0801799c
TransferDetail_1799C_ARRAY_0801799c:
    @ 0
    .word tilesetBattleStart
    .word 0x100
    .word paletteBattleMessage
    .word 0x6016a00
    @ 1
    .word tilesetEnemyDeleted
    .word 0x100
    .word paletteBattleMessage
    .word 0x6016a00
    @ 2
    .word tilesetMegaManDeleted
    .word 0x100
    .word paletteBattleMessage
    .word 0x6016a00
    @ 3
    .word tilesetProgramAdvance
    .word 0x100
    .word paletteBattleMessage
    .word 0x6016a00
    @ 4
    .word 0
    .word 0
    .word 0
    .word 0
    @ 5
    .word 0
    .word 0
    .word 0
    .word 0
    @ 6
    .word 0
    .word 0
    .word 0
    .word 0
    @ 7
    .word 0
    .word 0
    .word 0
    .word 0
    @ 8
    .word 0
    .word 0
    .word 0
    .word 0
    @ 9
    .word 0
    .word 0
    .word 0
    .word 0
    @ 10
    .word 0
    .word 0
    .word 0
    .word 0
    @ 11
    .word 0
    .word 0
    .word 0
    .word 0
    @ 12
    .word tilesetMaxMode
    .word 0x100
    .word paletteBattleMessage
    .word 0x6016a00
    @ 13
    .word tilesetBusy
    .word 0x80
    .word paletteBusyOk
    .word 0x6016800
    @ 14
    .word tilesetOk
    .word 0x80
    .word paletteBusyOk
    .word 0x6016800


_ts BattleMessage_StaticMessage
    push       {lr}
    ldr        r0,PTR_PTR_BM_StaticMessage_0_Init_08017d90
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BM_StaticMessage_0_Init_08017a9c:
    .word BM_StaticMessage_0_Init
    .word BM_StaticMessage_1_ScaleIn
    .word BM_StaticMessage_2_ScaleOut
    .word BM_StaticMessage_2_Free


_ts BM_StaticMessage_0_Init
    push       {lr}
    push       {r5}
    bl         Oam_AffineTransformAlloc
    pop        {r5}
    strb       r0,[r5,#0x8]
    ldr        r7,PTR_messageDelayList_08017d94
    ldrb       r0,[r5,#0x5]
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x4
    strb       r1,[r5,#0x0]
    mov        r0,#0x1
    pop        {pc}
messageDelayList:
    .byte 0x14, 0x3C, 0x3C, 0x3C
    .byte 0x3C, 0x3C, 0xFF, 0xFF
    .byte 0xFF, 0xFF, 0xFF, 0xFF
    .byte 0x3C, 0xFF, 0xFF, 0x00



_ts BM_StaticMessage_1_ScaleIn
    push       {lr}
    ldr        r3,PTR_scaleListBounceIn_08017d98
    bl         BM_BattleChip_ScaleMessage
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_08017afa
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x3
    beq        LAB_08017b02
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    strb       r0,[r5,#0x7]
    ble        LAB_08017afa
    b          LAB_08017b02
LAB_08017afa:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x8
    strb       r1,[r5,#0x0]
LAB_08017b02:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListBounceIn:
    .byte 0x40, 0x30, 0x20, 0x10
    .byte 0x0E, 0x0C, 0x0C, 0x0E
    .byte 0x10, 0xFF


_ts BM_StaticMessage_2_ScaleOut
    push       {lr}
    ldr        r3,PTR_scaleListBounceOut_08017d9c
    bl         BM_BattleChip_ScaleMessage
    tst        r7,r7
    beq        LAB_08017b22
    b          LAB_08017b26
LAB_08017b22:
    mov        r1,#0xc
    strb       r1,[r5,#0x0]
LAB_08017b26:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListBounceOut:
    .byte 0x0E, 0x0C, 0x0C, 0x0E
    .byte 0x10, 0x20, 0x30, 0x40
    .byte 0xFF


_ts BM_StaticMessage_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x8]
    push       {r5}
    bl         Oam_AffineTransformFree
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    pop        {pc}


_ts BM_BattleChip_ScaleMessage
    push       {lr}
    ldrb       r0,[r5,#0x8]
    lsl        r0,r0,#0x19
    ldrb       r1,[r5,#0x6]
    add        r2,r1,#0x1
    mov        r7,#0x0
    ldrb       r4,[r3,r2]
    cmp        r4,#0xff
    beq        LAB_08017b64
    add        r1,#0x1
    strb       r1,[r5,#0x6]
    mov        r7,#0x1
LAB_08017b64:
    ldrb       r1,[r3,r1]
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0x3
    beq        LAB_08017bc6
    push       {r5,r7}
    push       {r0}
    mov        r0,#0x0
    add        r2,r1,#0x0
    mov        r1,#0x10
    ldrb       r3,[r5,#0x8]
    bl         Oam_AffineTransformSetParams
    pop        {r1}
    push       {r1}
    ldr        r0,DAT_08017da0
    orr        r0,r1
    ldr        r1,DAT_08017da4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1}
    push       {r1}
    ldr        r0,DAT_08017da8
    orr        r0,r1
    ldr        r1,DAT_08017dac
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1}
    push       {r1}
    ldr        r0,DAT_08017db0
    orr        r0,r1
    ldr        r1,DAT_08017db4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1}
    ldr        r0,DAT_08017db8
    orr        r0,r1
    ldr        r1,DAT_08017dbc
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r5,r7}
    pop        {pc}
LAB_08017bc6:
    push       {r5,r7}
    push       {r0}
    mov        r0,#0x0
    add        r2,r1,#0x0
    mov        r1,#0x10
    ldrb       r3,[r5,#0x8]
    bl         Oam_AffineTransformSetParams
    pop        {r1}
    push       {r1}
    ldr        r0,DAT_08017dc0
    orr        r0,r1
    ldr        r1,DAT_08017da4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1}
    push       {r1}
    ldr        r0,DAT_08017dc4
    orr        r0,r1
    ldr        r1,DAT_08017dac
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1}
    ldr        r0,DAT_08017dc8
    orr        r0,r1
    ldr        r1,DAT_08017db4
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r5,r7}
    pop        {pc}


_ts BattleMessage_CopyChipText
    push       {lr}
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_08017dcc
    add        r7,r7,r1
    push       {r5,r7}
    ldr        r0,PTR_TextData_BattleChip_Names_08017dd0
    ldrb       r1,[r5,#0x2]
    ldr        r2,[r7,#0x0]
    ldr        r3,[r7,#0x4]
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_08017dd4
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,r7}
    lsl        r0,r0,#0x3
    strb       r0,[r5,#0x2]
    push       {r5}
    ldr        r0,PTR_paletteUIBoldText_08017dd8
    ldr        r1,PTR_eObjPaletteA_08017ddc
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}


_ts BattleMessage_BattleChip
    push       {lr}
    ldr        r0,PTR_PTR_BM_StaticMessage_0_Init_08017de0
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BM_StaticMessage_0_Init_08017c58:
    .word BM_StaticMessage_0_Init
    .word BM_BattleChip_1_ScaleIn
    .word BM_BattleChip_2_ScaleOut
    .word BM_StaticMessage_2_Free


_ts BM_BattleChip_1_ScaleIn
    push       {lr}
    ldr        r3,PTR_listBCScaleIn_08017de4
    bl         BM_BattleChip_ScaleY
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_08017c80
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    strb       r0,[r5,#0x7]
    ble        LAB_08017c80
    b          LAB_08017c88
LAB_08017c80:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x8
    strb       r1,[r5,#0x0]
LAB_08017c88:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

listBCScaleIn:
    .byte 0x80, 0x40, 0x20, 0x10
    .byte 0xFF


_ts BM_BattleChip_2_ScaleOut
    push       {lr}
    ldr        r3,PTR_listBCScaleOut_08017de8
    bl         BM_BattleChip_ScaleY
    tst        r7,r7
    beq        LAB_08017ca2
    b          LAB_08017ca6
LAB_08017ca2:
    mov        r1,#0xc
    strb       r1,[r5,#0x0]
LAB_08017ca6:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

listBCScaleOut:
    .byte 0x20, 0x40, 0x80, 0xFF


_ts BM_BattleChip_ScaleY
    push       {lr}
    ldrb       r1,[r5,#0x6]
    add        r2,r1,#0x1
    mov        r7,#0x0
    ldrb       r4,[r3,r2]
    cmp        r4,#0xff
    beq        LAB_08017cc4
    add        r1,#0x1
    strb       r1,[r5,#0x6]
    mov        r7,#0x1
LAB_08017cc4:
    ldrb       r1,[r3,r1]
    push       {r5,r7}
    mov        r0,#0x0
    add        r2,r1,#0x0
    mov        r1,#0x10
    ldrb       r3,[r5,#0x8]
    bl         Oam_AffineTransformSetParams
    pop        {r5,r7}
    mov        r2,#0x0
    ldr        r1,DAT_08017dec
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0x4
    beq        LAB_08017ce4
    mov        r2,#0x70
    ldr        r1,DAT_08017df0
LAB_08017ce4:
    ldrb       r0,[r5,#0x2]
    mov        r6,#0x78
    sub        r0,r6,r0
    lsr        r0,r0,#0x1
    add        r0,r0,r2
    mov        r6,#0x0
    ldr        r4,DAT_08017df4
    lsl        r0,r0,#0x10
    orr        r4,r0
    ldrb       r0,[r5,#0x8]
    lsl        r0,r0,#0x19
    orr        r4,r0
LAB_08017cfc:
    push       {r1,r4,r5,r6,r7}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r4,r5,r6,r7}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x8
    blt        LAB_08017cfc
    pop        {pc}


_ts BattleMessage_BusyOk
    push       {lr}
    ldr        r0,PTR_PTR_BM_BusyOk_0_08017df8
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BM_BusyOk_0_08017d28:
    .word BM_BusyOk_0
    .word BM_BusyOk_1


_ts BM_BusyOk_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x4
    strb       r1,[r5,#0x0]
    bl         BM_BusyOk_1
    pop        {pc}


_ts BM_BusyOk_1
    push       {lr}
    bl         BM_BusyOk_ShowMessage
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08017d52
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    pop        {pc}
LAB_08017d52:
    mov        r0,#0x1
    pop        {pc}


_ts BM_BusyOk_ShowMessage
    push       {lr}
    ldrb       r0,[r5,#0x5]
    cmp        r0,#0xd
    bne        LAB_08017d6e
    ldrb       r0,[r5,#0x6]
    add        r0,#0x1
    strb       r0,[r5,#0x6]
    mov        r1,#0x1f
    and        r0,r1
    cmp        r0,#0x14
    bge        LAB_08017d8a
LAB_08017d6e:
    push       {r5}
    ldr        r0,DAT_08017dfc
    ldr        r1,DAT_08017e00
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    ldr        r0,DAT_08017e04
    ldr        r1,DAT_08017e08
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r5}
LAB_08017d8a:
    mov        r7,#0x1
    pop        {pc}

    .align 2, 0

PTR_PTR_BM_StaticMessage_0_Init_08017d90:
    .word PTR_BM_StaticMessage_0_Init_08017a9c
PTR_messageDelayList_08017d94:
    .word messageDelayList
PTR_scaleListBounceIn_08017d98:
    .word scaleListBounceIn
PTR_scaleListBounceOut_08017d9c:
    .word scaleListBounceOut
DAT_08017da0:
    .word 0x80284338
DAT_08017da4:
    .word 0xA350
DAT_08017da8:
    .word 0x80484338
DAT_08017dac:
    .word 0xA358
DAT_08017db0:
    .word 0x80684338
DAT_08017db4:
    .word 0xA360
DAT_08017db8:
    .word 0x80884338
DAT_08017dbc:
    .word 0xA368
DAT_08017dc0:
    .word 0x80044310
DAT_08017dc4:
    .word 0x80244310
DAT_08017dc8:
    .word 0x80444310
PTR_TextDst_ARRAY_08017dcc:
    .word TextDst_ARRAY_08017e0c
PTR_TextData_BattleChip_Names_08017dd0:
    .word TextData_BattleChip_Names
PTR_tilesetBoldAlphanumeric_08017dd4:
    .word tilesetBoldAlphanumeric
PTR_paletteUIBoldText_08017dd8:
    .word paletteUIBoldText
PTR_eObjPaletteA_08017ddc:
    .word eObjPaletteA
PTR_PTR_BM_StaticMessage_0_Init_08017de0:
    .word PTR_BM_StaticMessage_0_Init_08017c58
PTR_listBCScaleIn_08017de4:
    .word listBCScaleIn
PTR_listBCScaleOut_08017de8:
    .word listBCScaleOut
DAT_08017dec:
    .word 0xA330
DAT_08017df0:
    .word 0xA300
DAT_08017df4:
    .word 0x8310
PTR_PTR_BM_BusyOk_0_08017df8:
    .word PTR_BM_BusyOk_0_08017d28
DAT_08017dfc:
    .word 0x80944040
DAT_08017e00:
    .word 0xA340
DAT_08017e04:
    .word 0x80B44040
DAT_08017e08:
    .word 0xA348

TextDst_ARRAY_08017e0c:
    @ 0
    .word 0
    .word 0
    @ 1
    .word 0
    .word 0
    @ 2
    .word 0
    .word 0
    @ 3
    .word 0
    .word 0
    @ 4
    .word 0x203c600
    .word 0x6016600
    @ 5
    .word gDstCompressedSpriteData
    .word 0x6016000
    @ 6
    .word 0x203c600
    .word 0x6016600
    @ 7
    .word gDstCompressedSpriteData
    .word 0x6016000
    @ 8
    .word 0x203c600
    .word 0x6016600
    @ 9
    .word gDstCompressedSpriteData
    .word 0x6016000
    @ 10
    .word 0x203c600
    .word 0x6016600
    @ 11
    .word gDstCompressedSpriteData
    .word 0x6016000
    @ 12
    .word 0
    .word 0
    @ 13
    .word 0
    .word 0
    @ 14
    .word 0
    .word 0


_ts BattleMessage_LoadDieBomb
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    ldrb       r0,[r5,#0x2]
    str        r0,[r7,#0x4]
    ldrb       r1,[r5,#0x3]
    str        r1,[r7,#0x8]
    mul        r0,r1
    str        r0,[r7,#0xc]
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_08018028
    add        r7,r7,r1
    push       {r5,r7}
    ldr        r0,PTR_textDict_MenuMessages_08017ee8
    mov        r1,#0x8f
    ldr        r2,[r7,#0x0]
    ldr        r3,[r7,#0x4]
    mov        r4,#0x6
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_08017eec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,r7}
    push       {r5,r7}
    mov        r6,#0x20
    lsl        r6,r6,#0x4
    ldr        r0,PTR_textDict_MenuMessages_08017ee8
    mov        r1,#0x8c
    ldr        r2,[r7,#0x0]
    add        r2,r2,r6
    ldr        r3,[r7,#0x4]
    add        r3,r3,r6
    mov        r4,#0xc
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_08017eec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,r7}
    strb       r0,[r5,#0x2]
    push       {r5}
    ldr        r0,PTR_paletteUIBoldText_08017ef0
    ldr        r1,PTR_eObjPaletteA_08017ef4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_textDict_MenuMessages_08017ee8:
    .word textDict_MenuMessages
PTR_tilesetBoldAlphanumeric_08017eec:
    .word tilesetBoldAlphanumeric
PTR_paletteUIBoldText_08017ef0:
    .word paletteUIBoldText
PTR_eObjPaletteA_08017ef4:
    .word eObjPaletteA


_ts BattleMessage_DieBomb
    push       {lr}
    ldr        r0,PTR_PTR_BM_DieBomb_0_08017f08
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PTR_BM_DieBomb_0_08017f08:
    .word PTR_BM_DieBomb_0_08017f0c
PTR_BM_DieBomb_0_08017f0c:
    .word BM_DieBomb_0
    .word BM_DieBomb_1
    .word BM_DieBomb_2
    .word BM_DieBomb_3


_ts BM_DieBomb_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    strb       r0,[r5,#0x7]
    mov        r1,#0x4
    strb       r1,[r5,#0x0]
    mov        r0,#0x1
    pop        {pc}


_ts BM_DieBomb_1
    push       {lr}
    ldr        r3,PTR_scaleListDBBounceIn_080182c8
    bl         FUN_08017cb0
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_08017f42
    ldrb       r0,[r5,#0x7]
    strb       r0,[r5,#0x7]
    ble        LAB_08017f42
    b          LAB_08017f4a
LAB_08017f42:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x8
    strb       r1,[r5,#0x0]
LAB_08017f4a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListDBBounceIn:
    .byte 0x80, 0x40, 0x20, 0x10
    .byte 0xFF


_ts BM_DieBomb_2
    push       {lr}
    ldr        r3,PTR_scaleListDBBounceOut_080182cc
    bl         FUN_08017cb0
    tst        r7,r7
    beq        LAB_08017f66
    b          LAB_08017f6a
LAB_08017f66:
    mov        r1,#0xc
    strb       r1,[r5,#0x0]
LAB_08017f6a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListDBBounceOut:
    .byte 0x20, 0x40, 0x80, 0xFF



_ts BM_DieBomb_3
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    pop        {pc}


_ts FUN_08017cb0
    push       {lr}
    mov        r2,#0x24
    ldr        r1,DAT_080182d0
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0x6
    beq        LAB_08017f8c
    mov        r2,#0x9c
    ldr        r1,DAT_080182d4
LAB_08017f8c:
    push       {r5}
    mov        r6,#0x0
    ldr        r4,DAT_080182d8
    lsl        r2,r2,#0x10
    orr        r4,r2
LAB_08017f96:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x6
    blt        LAB_08017f96
    pop        {r5}
    mov        r2,#0x0
    ldr        r1,DAT_080182dc
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0x6
    beq        LAB_08017fc0
    mov        r2,#0x78
    ldr        r1,DAT_080182e0
LAB_08017fc0:
    push       {r5,r7}
    ldrb       r0,[r5,#0x2]
    lsl        r0,r0,#0x3
    mov        r6,#0x78
    sub        r0,r6,r0
    lsr        r0,r0,#0x1
    add        r0,r0,r2
    mov        r6,#0x0
    ldr        r4,DAT_080182e4
    lsl        r0,r0,#0x10
    add        r4,r4,r0
LAB_08017fd6:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0xc
    blt        LAB_08017fd6
    pop        {r5,r7}
    pop        {pc}


_ts BattleMessage_LoadZetaOmegaPA
    push       {lr}
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_08018028
    add        r7,r7,r1
    push       {r5,r7}
    ldr        r0,PTR_TextData_BattleChip_Names_080182e8
    ldrb       r1,[r5,#0x2]
    ldr        r2,[r7,#0x0]
    ldr        r3,[r7,#0x4]
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_080182ec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,r7}
    strb       r0,[r5,#0x2]
    push       {r5}
    ldr        r0,PTR_paletteUIBoldText_080182f0
    ldr        r1,PTR_eObjPaletteA_080182f4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_TextDst_ARRAY_08018028:
    .word TextDst_ARRAY_08017e0c


_ts BattleMessage_ZetaOmega
    push       {lr}
    ldr        r0,PTR_PTR_BM_DieBomb_0_080182f8
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BM_DieBomb_0_0801803c:
    .word BM_DieBomb_0
    .word BM_ZetaOmega_1
    .word BM_ZetaOmega_2
    .word BM_DieBomb_3


_ts BM_ZetaOmega_1
    push       {lr}
    ldr        r3,PTR_scaleListZOBounceIn_080182fc
    bl         BM_ZetaOmega_ShowMessage
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_08018062
    ldrb       r0,[r5,#0x7]
    strb       r0,[r5,#0x7]
    ble        LAB_08018062
    b          LAB_0801806a
LAB_08018062:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x8
    strb       r1,[r5,#0x0]
LAB_0801806a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListZOBounceIn:
    .byte 0x80, 0x40, 0x20, 0x10
    .byte 0xFF


_ts BM_ZetaOmega_2
    push       {lr}
    ldr        r3,PTR_scaleListZOBounceOut_08018300
    bl         BM_ZetaOmega_ShowMessage
    tst        r7,r7
    beq        LAB_08018086
    b          LAB_0801808a
LAB_08018086:
    mov        r1,#0xc
    strb       r1,[r5,#0x0]
LAB_0801808a:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListZOBounceOut:
    .byte  0x20, 0x40, 0x80, 0xFF


_ts BM_ZetaOmega_ShowMessage
    push       {lr}
    mov        r2,#0x0
    ldr        r1,DAT_080182d0
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0x8
    beq        LAB_080180a4
    mov        r2,#0x78
    ldr        r1,DAT_080182d4
LAB_080180a4:
    push       {r5}
    ldrb       r0,[r5,#0x2]
    add        r0,#0x6
    lsl        r0,r0,#0x3
    mov        r6,#0x78
    sub        r0,r6,r0
    lsr        r0,r0,#0x1
    add        r0,r0,r2
    strh       r0,[r5,#0xe]
    mov        r6,#0x0
    ldr        r4,DAT_08018304
    lsl        r0,r0,#0x10
    orr        r4,r0
LAB_080180be:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x8
    blt        LAB_080180be
    pop        {r5}
    push       {r5}
    ldrh       r0,[r5,#0xc]
    bl         FrameTimeToBcdRealTime
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    mov        r2,#0xf
    lsr        r1,r0,#0xc
    and        r1,r2
    str        r1,[r7,#0x4]
    lsr        r1,r0,#0x8
    and        r1,r2
    str        r1,[r7,#0x8]
    lsr        r1,r0,#0x4
    and        r1,r2
    str        r1,[r7,#0xc]
    .byte 0x01, 0x00 @ mov        r1,r0
    and        r1,r2
    str        r1,[r7,#0x10]
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_08018308
    add        r7,r7,r1
    push       {r5}
    mov        r6,#0x20
    lsl        r6,r6,#0x4
    ldr        r0,PTR_textDict_MenuMessages_0801830c
    mov        r1,#0x8d
    ldr        r2,[r7,#0x0]
    add        r2,r2,r6
    ldr        r3,[r7,#0x4]
    add        r3,r3,r6
    mov        r4,#0xe
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_080182ec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    ldr        r0,PTR_paletteUIBoldText_080182f0
    ldr        r1,PTR_eObjPaletteA_08018310
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    ldr        r1,DAT_080182dc
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0x8
    beq        LAB_0801813e
    ldr        r1,DAT_080182e0
LAB_0801813e:
    push       {r5}
    mov        r6,#0x0
    ldr        r4,DAT_08018314
    ldrh       r0,[r5,#0xe]
    ldrb       r7,[r5,#0x2]
    lsl        r7,r7,#0x3
    add        r0,r0,r7
    lsl        r0,r0,#0x10
    add        r4,r4,r0
LAB_08018150:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x5
    blt        LAB_08018150
    pop        {r5}
    mov        r7,#0x0
    pop        {pc}


_ts BattleMessage_LoadBetaSigmaPA
    push       {lr}
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_08018318
    add        r7,r7,r1
    push       {r5,r7}
    ldr        r0,PTR_TextData_BattleChip_Names_080182e8
    ldrb       r1,[r5,#0x2]
    ldr        r2,[r7,#0x0]
    ldr        r3,[r7,#0x4]
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_080182ec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5,r7}
    strb       r0,[r5,#0x2]
    push       {r5}
    ldr        r0,PTR_paletteUIBoldText_080182f0
    ldr        r1,PTR_eObjPaletteA_0801831c
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}


_ts BattleMessage_BetaSigma
    push       {lr}
    ldr        r0,PTR_PTR_BM_DieBomb_0_08018320
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_BM_DieBomb_0_080181b4:
    .word BM_DieBomb_0
    .word BM_BetaSigma_1
    .word BM_BetaSigma_2
    .word BM_DieBomb_3


_ts BM_BetaSigma_1
    push       {lr}
    ldr        r3,PTR_scaleListBSBounceIn_08018324
    bl         BM_BetaSigma_ShowMessage
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_080181da
    ldrb       r0,[r5,#0x7]
    strb       r0,[r5,#0x7]
    ble        LAB_080181da
    b          LAB_080181e2
LAB_080181da:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r1,#0x8
    strb       r1,[r5,#0x0]
LAB_080181e2:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListBSBounceIn:
    .byte 0x80, 0x40, 0x20, 0x10
    .byte 0xFF


_ts BM_BetaSigma_2
    push       {lr}
    ldr        r3,PTR_scaleListBSBounceOut_08018328
    bl         BM_BetaSigma_ShowMessage
    tst        r7,r7
    beq        LAB_080181fe
    b          LAB_08018202
LAB_080181fe:
    mov        r1,#0xc
    strb       r1,[r5,#0x0]
LAB_08018202:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

scaleListBSBounceOut:
    .byte 0x20, 0x40, 0x80, 0xFF


_ts BM_BetaSigma_ShowMessage
    push       {lr}
    mov        r2,#0x0
    ldr        r1,DAT_080182d0
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0xa
    beq        LAB_0801821c
    mov        r2,#0x78
    ldr        r1,DAT_080182d4
LAB_0801821c:
    push       {r5}
    ldrb       r0,[r5,#0x2]
    add        r0,#0x2
    lsl        r0,r0,#0x3
    mov        r6,#0x78
    sub        r0,r6,r0
    lsr        r0,r0,#0x1
    add        r0,r0,r2
    strh       r0,[r5,#0xe]
    mov        r6,#0x0
    ldr        r4,DAT_08018304
    lsl        r0,r0,#0x10
    orr        r4,r0
LAB_08018236:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x8
    blt        LAB_08018236
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    ldrh       r0,[r5,#0xc]
    str        r0,[r7,#0x4]
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_TextDst_ARRAY_0801832c
    add        r7,r7,r1
    push       {r5}
    mov        r6,#0x20
    lsl        r6,r6,#0x4
    ldr        r0,PTR_textDict_MenuMessages_0801830c
    mov        r1,#0x8e
    ldr        r2,[r7,#0x0]
    add        r2,r2,r6
    ldr        r3,[r7,#0x4]
    add        r3,r3,r6
    mov        r4,#0xe
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_080182ec
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    ldr        r0,PTR_paletteUIBoldText_080182f0
    ldr        r1,PTR_eObjPaletteA_08018330
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    ldr        r1,DAT_080182dc
    ldrb       r3,[r5,#0x5]
    cmp        r3,#0xa
    beq        LAB_08018296
    ldr        r1,DAT_080182e0
LAB_08018296:
    push       {r5}
    mov        r6,#0x0
    ldr        r4,DAT_08018314
    ldrh       r0,[r5,#0xe]
    ldrb       r7,[r5,#0x2]
    lsl        r7,r7,#0x3
    add        r0,r0,r7
    lsl        r0,r0,#0x10
    add        r4,r4,r0
LAB_080182a8:
    push       {r1,r2,r4,r6}
    lsl        r2,r6,#0x13
    add        r0,r4,#0x0
    add        r0,r0,r2
    mov        r2,#0x0
    mov        r3,#0x0
    bl         BattleSpriteQueue_Add
    pop        {r1,r2,r4,r6}
    add        r1,#0x2
    add        r6,#0x1
    cmp        r6,#0x1
    blt        LAB_080182a8
    pop        {r5}
    mov        r7,#0x0
    pop        {pc}

    .align 2, 0

PTR_scaleListDBBounceIn_080182c8:
    .word scaleListDBBounceIn
PTR_scaleListDBBounceOut_080182cc:
    .word scaleListDBBounceOut
DAT_080182d0:
    .word 0xA330
DAT_080182d4:
    .word 0xA300
DAT_080182d8:
    .word 0x8010
DAT_080182dc:
    .word 0xA340
DAT_080182e0:
    .word 0xA310
DAT_080182e4:
    .word 0x8020
PTR_TextData_BattleChip_Names_080182e8:
    .word TextData_BattleChip_Names
PTR_tilesetBoldAlphanumeric_080182ec:
    .word tilesetBoldAlphanumeric
PTR_paletteUIBoldText_080182f0:
    .word paletteUIBoldText
PTR_eObjPaletteA_080182f4:
    .word eObjPaletteA
PTR_PTR_BM_DieBomb_0_080182f8:
    .word PTR_BM_DieBomb_0_0801803c
PTR_scaleListZOBounceIn_080182fc:
    .word scaleListZOBounceIn
PTR_scaleListZOBounceOut_08018300:
    .word scaleListZOBounceOut
DAT_08018304:
    .word 0x8018
PTR_TextDst_ARRAY_08018308:
    .word TextDst_ARRAY_08017e0c
PTR_textDict_MenuMessages_0801830c:
    .word textDict_MenuMessages
PTR_eObjPaletteA_08018310:
    .word eObjPaletteA
DAT_08018314:
    .word 0x88018
PTR_TextDst_ARRAY_08018318:
    .word TextDst_ARRAY_08017e0c
PTR_eObjPaletteA_0801831c:
    .word eObjPaletteA
PTR_PTR_BM_DieBomb_0_08018320:
    .word PTR_BM_DieBomb_0_080181b4
PTR_scaleListBSBounceIn_08018324:
    .word scaleListBSBounceIn
PTR_scaleListBSBounceOut_08018328:
    .word scaleListBSBounceOut
PTR_TextDst_ARRAY_0801832c:
    .word TextDst_ARRAY_08017e0c
PTR_eObjPaletteA_08018330:
    .word eObjPaletteA
