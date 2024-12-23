#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BattleResult
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_BattleResult_0_Init_0807ce48
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    mov        r7,r10
    ldr        r7,[r7,#0x10]
    ldrh       r0,[r5,#0x2a]
    strh       r0,[r7,#0x18]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BattleResult_0_Init_0807ce48:
    .word PTR_E_BattleResult_0_Init_0807ce4c

PTR_E_BattleResult_0_Init_0807ce4c:
    .word E_BattleResult_0_Init
    .word E_BattleResult_1_Main
    .word E_BattleResult_2_Free


_ts E_BattleResult_0_Init
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    ldr        r7,PTR_tsListBattleResultUiNumbers_0807ceb0
LAB_0807ce60:
    push       {r0,r7}
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r0,r7}
    add        r7,#0xc
    sub        r0,#0x1
    bne        LAB_0807ce60
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_tsListBattleResultUi_0807ceb4
    ldrb       r0,[r5,#0x4]
    lsl        r1,r0,#0x2
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    add        r7,r7,r0
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0xf0
    strh       r0,[r5,#0x2a]
    mov        r0,#0x20
    bl         E_BattleResult_ClearResultUI
    bl         Effect_BattleResult_CalculateRank
    strb       r0,[r5,#0xc]
    str        r1,[r5,#0x60]
    strb       r2,[r5,#0xd]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    bne        LAB_0807ceae
LAB_0807ceae:
    pop        {pc}

PTR_tsListBattleResultUiNumbers_0807ceb0:
    .word tsListBattleResultUiNumbers

PTR_tsListBattleResultUi_0807ceb4:
    .word tsListBattleResultUi

tsListBattleResultUiNumbers:
    .byte 0x3C, 0x67, 0x64, 0x08, 0x50, 0x6E, 0x00, 0x02, 0x10, 0x00, 0x00, 0x00
    .byte 0xFC, 0x6D, 0x64, 0x08, 0x00, 0xA0, 0x00, 0x06, 0x60, 0x01, 0x00, 0x00

tsListBattleResultUi:
    .byte 0x8C, 0x28, 0x64, 0x08, 0x00, 0x8E, 0x00, 0x06, 0x98, 0x03, 0x00, 0x00
    .byte 0x9C, 0x3B, 0x64, 0x08, 0x00, 0x8E, 0x00, 0x06, 0x58, 0x04, 0x00, 0x00
    .byte 0xAC, 0x51, 0x64, 0x08, 0x00, 0x8E, 0x00, 0x06, 0x38, 0x04, 0x00, 0x00


_ts E_BattleResult_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_E_BattleResult_1_0_ShowUI_0807cf04
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BattleResult_1_0_ShowUI_0807cf04:
    .word PTR_E_BattleResult_1_0_ShowUI_0807cf08

PTR_E_BattleResult_1_0_ShowUI_0807cf08:
    .word E_BattleResult_1_0_ShowUI
    .word E_BattleResult_1_1_ShowReward
    .word E_BattleResult_1_2_ShowRewardMP


_ts E_BattleResult_1_0_ShowUI
    push       {lr}
    push       {r5}
    ldr        r0,[r5,#0x4]
    ldr        r7,PTR_layoutListBattleResultUi_0807cf70
    lsl        r0,r0,#0x2
    ldr        r3,[r7,r0]
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    mov        r4,#0x1e
    mov        r5,#0x14
    bl         Screen_CopyTileMapRect
    pop        {r5}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_BattleResult_1_0_0_Init_0807cf54
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    beq        LAB_0807cf48
    bl         E_BattleResult_PrintTime
    bl         E_BattleResult_DrawRank
LAB_0807cf48:
    ldrh       r0,[r5,#0x2a]
    lsr        r0,r0,#0x3
    bl         E_BattleResult_ClearResultUI
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BattleResult_1_0_0_Init_0807cf54:
    .word PTR_E_BattleResult_1_0_0_Init_0807cf58

PTR_E_BattleResult_1_0_0_Init_0807cf58:
    .word E_BattleResult_1_0_0_Init
    .word E_BattleResult_1_0_1_WaitForSlideIn
    .word E_BattleResult_1_0_2_WaitButton
    .word E_BattleResult_1_0_3_WaitButtonMP


_ts E_BattleResult_1_0_0_Init
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    pop        {pc}

PTR_layoutListBattleResultUi_0807cf70:
    .word layoutListBattleResultUi

layoutListBattleResultUi:
    .word layoutBattleResultUiRegular
    .word layoutBattleResultUiMpWinner
    .word layoutBattleResultUiMpLoser


_ts E_BattleResult_1_0_1_WaitForSlideIn
    push       {lr}
    ldrh       r0,[r5,#0x2a]
    sub        r0,#0x8
    bpl        LAB_0807cfa2
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    bge        LAB_0807cf9a
    mov        r1,#0x8
    strh       r1,[r5,#0xa]
    b          LAB_0807cfa2
LAB_0807cf9a:
    mov        r1,#0xc
    strh       r1,[r5,#0xa]
    mov        r1,#0x0
    strb       r1,[r5,#0x1b]
LAB_0807cfa2:
    strh       r0,[r5,#0x2a]
    pop        {pc}


_nt E_BattleResult_1_0_2_WaitButton
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807cfc4
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    bl         E_BattleResult_LoadAnimBattleResultUiPressA
    pop        {pc}
LAB_0807cfc4:
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    mov        r1,#0x8
    and        r0,r1
    lsr        r0,r0,#0x3
    bl         E_BattleResult_LoadAnimBattleResultUiPressA
    pop        {pc}


_nt E_BattleResult_1_0_3_WaitButtonMP
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    mov        r1,#0x8
    and        r0,r1
    lsr        r0,r0,#0x3
    bl         E_BattleResult_LoadAnimBattleResultUiPressA
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_E_BattleResult_1_0_3_0_0807cff4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_BattleResult_1_0_3_0_0807cff4:
    .word PTR_E_BattleResult_1_0_3_0_0807cff8

PTR_E_BattleResult_1_0_3_0_0807cff8:
    .word E_BattleResult_1_0_3_0
    .word E_BattleResult_1_0_3_1
    .word E_BattleResult_1_0_3_2_RewardGiveTakeChip


_ts E_BattleResult_1_0_3_0
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x1e]
    cmp        r1,#0x4
    bne        LAB_0807d024
    bl         GetCompleteMPState
    ldrb       r2,[r1,#0x2]
    cmp        r2,#0x1
    bne        LAB_0807d024
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    b          LAB_0807d038
LAB_0807d024:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807d038
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
LAB_0807d038:
    ldrb       r0,[r5,#0x1b]
    ldrb       r1,[r5,#0xc]
    bl         FUN_08007a98
    pop        {pc}


_nt E_BattleResult_1_0_3_1
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x1e]
    cmp        r0,#0x4
    bne        LAB_0807d086
    bl         GetCompleteMPState
    ldrb       r2,[r0,#0x2]
    ldrb       r3,[r1,#0x2]
    cmp        r2,r3
    bne        LAB_0807d086
    cmp        r2,#0x2
    bne        LAB_0807d086
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r2,[r7,#0x10]
    cmp        r2,#0x0
    beq        LAB_0807d074
    ldrb       r0,[r1,#0x3]
    strb       r0,[r5,#0xc]
    bl         FUN_0807d97c
    strb       r0,[r5,#0xe]
    strb       r1,[r5,#0xf]
LAB_0807d074:
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x4
    ldrb       r1,[r5,#0xc]
    ldrb       r2,[r5,#0xe]
    ldrb       r3,[r5,#0xf]
    bl         FUN_08007a98
    b          LAB_0807d08e
LAB_0807d086:
    mov        r0,#0x2
    ldrb       r1,[r5,#0xc]
    bl         FUN_08007a98
LAB_0807d08e:
    pop        {pc}


_ts E_BattleResult_1_0_3_2_RewardGiveTakeChip
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x1e]
    cmp        r0,#0x4
    bne        LAB_0807d0f6
    bl         GetCompleteMPState
    ldrb       r2,[r0,#0x2]
    ldrb       r3,[r1,#0x2]
    cmp        r2,r3
    bne        LAB_0807d0f6
    cmp        r2,#0x4
    bne        LAB_0807d0f6
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r2,[r7,#0x10]
    cmp        r2,#0x0
    beq        LAB_0807d0c2
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xf]
    mov        r2,#0x1
    bl         Inventory_SubtractChip
    b          LAB_0807d0d0
LAB_0807d0c2:
    ldrb       r0,[r1,#0x4]
    strb       r0,[r5,#0xe]
    ldrb       r1,[r1,#0x5]
    strb       r1,[r5,#0xf]
    mov        r2,#0x1
    bl         Inventory_AddChip
LAB_0807d0d0:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0x10]
    mov        r1,#0x1
    eor        r0,r1
    bl         IncrementMPCounters
    push       {r5}
    bl         Save_SaveGame
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    mov        r0,#0x0
    bl         E_BattleResult_LoadAnimBattleResultUiPressA
    b          LAB_0807d102
LAB_0807d0f6:
    mov        r0,#0x4
    ldrb       r1,[r5,#0xc]
    ldrb       r2,[r5,#0xe]
    ldrb       r3,[r5,#0xf]
    bl         FUN_08007a98
LAB_0807d102:
    pop        {pc}


_ts E_BattleResult_1_1_ShowReward
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_BattleResult_1_1_0_ScrambleRewardReveal_0807d114
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BattleResult_1_1_0_ScrambleRewardReveal_0807d114:
    .word PTR_E_BattleResult_1_1_0_ScrambleRewardReveal_0807d118

PTR_E_BattleResult_1_1_0_ScrambleRewardReveal_0807d118:
    .word E_BattleResult_1_1_0_ScrambleRewardReveal
    .word E_BattleResult_1_1_1_RewardReveal
    .word E_BattleResult_1_1_2_RewardWaitInput


_ts E_BattleResult_1_1_0_ScrambleRewardReveal
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_E_BattleResult_1_1_0_0_SetupRandomBuffer_0807d134
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BattleResult_1_1_0_0_SetupRandomBuffer_0807d134:
    .word PTR_E_BattleResult_1_1_0_0_SetupRandomBuffer_0807d138

PTR_E_BattleResult_1_1_0_0_SetupRandomBuffer_0807d138:
    .word E_BattleResult_1_1_0_0_SetupRandomBuffer
    .word E_BattleResult_1_1_0_1_CopyRandomBufferTiles


_ts E_BattleResult_1_1_0_0_SetupRandomBuffer
    push       {lr}
    mov        r0,#0x0
    ldr        r7,PTR_iwBufferUITextTile_0807d164
LAB_0807d146:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x38
    bmi        LAB_0807d146
    add        r0,r7,#0x0
    mov        r1,#0x38
    mov        r2,#0x38
    bl         ArrayShuffle
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    pop        {pc}

    .align 2, 0


PTR_iwBufferUITextTile_0807d164:
    .word iwBufferUITextTile


_ts E_BattleResult_1_1_0_1_CopyRandomBufferTiles
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x38
    bmi        LAB_0807d17e
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    b          LAB_0807d19e
LAB_0807d17e:
    push       {r0,r5}
    ldr        r7,PTR_iwBufferUITextTile_0807d1a0
    ldrb       r0,[r7,r0]
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    add        r0,#0x10
    add        r1,#0xa
    mov        r2,#0x3
    ldr        r3,PTR_TilemapEntry_0807d1a4
    mov        r4,#0x1
    bl         Screen_CopyTileMapH
    pop        {r0,r5}
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_0807d19e:
    pop        {pc}

PTR_iwBufferUITextTile_0807d1a0:
    .word iwBufferUITextTile

PTR_TilemapEntry_0807d1a4:
    .word TilemapEntry_0807d1a8

TilemapEntry_0807d1a8:
    .byte 0x18, 0xC3


_nt E_BattleResult_1_1_1_RewardReveal
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_E_BattleResult_1_1_1_0_SetReward_0807d1b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_BattleResult_1_1_1_0_SetReward_0807d1b8:
    .word PTR_E_BattleResult_1_1_1_0_SetReward_0807d1bc

PTR_E_BattleResult_1_1_1_0_SetReward_0807d1bc:
    .word E_BattleResult_1_1_1_0_SetReward
    .word E_BattleResult_1_1_1_1_RewardReveal
    .word E_BattleResult_1_1_1_2_RewardText


_ts E_BattleResult_1_1_1_0_SetReward
    push       {lr}
    mov        r0,#0x0
    ldr        r7,PTR_iwBufferUITextTile_0807d270
LAB_0807d1ce:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x38
    bmi        LAB_0807d1ce
    add        r0,r7,#0x0
    mov        r1,#0x38
    mov        r2,#0x38
    bl         ArrayShuffle
    bl         Rng_RandomInt
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0xb]
    bl         SWI_Div
    mov        r3,#0x64
    add        r3,r3,r1
    ldrb       r0,[r7,r3]
    ldrb       r1,[r5,#0xc]
    bl         E_BattleResult_GetEnemyDrop
    tst        r0,r0
    bne        LAB_0807d228
    strb       r1,[r5,#0xe]
    strb       r2,[r5,#0xf]
    mov        r3,#0x0
    str        r3,[r5,#0x64]
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    mov        r2,#0x1
    push       {r0,r1}
    bl         Inventory_AddChip
    pop        {r0,r1}
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    ldr        r0,[r7,#0x14]
    ldr        r1,[r7,#0x18]
    push       {r0,r1}
    bl         Battle_IncrementRewardChipCounter
    pop        {r0,r1}
    b          LAB_0807d23a
LAB_0807d228:
    str        r1,[r5,#0x64]
    add        r0,r1,#0x0
    bl         Inventory_AddZenny
    mov        r3,#0x0
    strb       r3,[r5,#0xe]
    strb       r3,[r5,#0xf]
    ldr        r0,PTR_tilesetZenny_0807d268
    ldr        r1,PTR_paletteZenny_0807d26c
LAB_0807d23a:
    push       {r5}
    push       {r1}
    ldr        r1,PTR_DAT_0807d260
    mov        r2,#0x7
    lsl        r2,r2,#0x6
    bl         Dma_TransferListAdd
    pop        {r1}
    add        r0,r1,#0x0
    ldr        r1,PTR_eBgPaletteE_0807d264
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    pop        {pc}

PTR_DAT_0807d260:
    .word 0x600AF00

PTR_eBgPaletteE_0807d264:
    .word eBgPaletteE

PTR_tilesetZenny_0807d268:
    .word tilesetZenny

PTR_paletteZenny_0807d26c:
    .word paletteZenny

PTR_iwBufferUITextTile_0807d270:
    .word iwBufferUITextTile


_ts E_BattleResult_1_1_1_1_RewardReveal
    push       {lr}
    sub        sp,#0x74
    mov        r6,sp
    add        r0,r6,#0x4
    bl         FUN_0807d738
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x38
    bmi        LAB_0807d290
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    b          LAB_0807d2c6
LAB_0807d290:
    push       {r0,r5}
    ldr        r7,PTR_iwBufferUITextTile_0807d2cc
    ldrb       r0,[r7,r0]
    lsl        r1,r0,#0x1
    add        r1,#0x4
    ldrh       r1,[r6,r1]
    strh       r1,[r6,#0x0]
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    add        r0,#0x10
    add        r1,#0xa
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x1
    bl         Screen_CopyTileMapH
    pop        {r0,r5}
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    mov        r1,#0x3
    and        r0,r1
    cmp        r0,#0x3
    bne        LAB_0807d2c6
    mov        r0,#0xca
    bl         Sound_PlaySongImmediate
LAB_0807d2c6:
    add        sp,#0x74
    pop        {pc}

    .align 2, 0


PTR_iwBufferUITextTile_0807d2cc:
    .word iwBufferUITextTile


_ts E_BattleResult_1_1_1_2_RewardText
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807d302
    ldr        r0,[r5,#0x64]
    tst        r0,r0
    beq        LAB_0807d2ec
    bl         E_BattleResult_LoadZennyDetailText
    mov        r0,#0xcb
    bl         Sound_PlaySongImmediate
    b          LAB_0807d2fa
LAB_0807d2ec:
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xf]
    bl         E_BattleResult_LoadChipDetailText
    mov        r0,#0xcc
    bl         Sound_PlaySongImmediate
LAB_0807d2fa:
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
LAB_0807d302:
    pop        {pc}


_ts E_BattleResult_1_1_2_RewardWaitInput
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x9
    tst        r0,r1
    beq        LAB_0807d314
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
LAB_0807d314:
    mov        pc,lr


_nt E_BattleResult_1_2_ShowRewardMP
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_BattleResult_1_2_0_0807d324
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_BattleResult_1_2_0_0807d324:
    .word PTR_E_BattleResult_1_2_0_0807d328

PTR_E_BattleResult_1_2_0_0807d328:
    .word E_BattleResult_1_2_0
    .word E_BattleResult_1_2_1
    .word E_BattleResult_1_2_2


_ts E_BattleResult_1_2_0
    mov        lr,pc


_nt E_BattleResult_1_2_1
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_E_BattleResult_1_2_1_0_0807d344
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_BattleResult_1_2_1_0_0807d344:
    .word PTR_E_BattleResult_1_2_1_0_0807d348

PTR_E_BattleResult_1_2_1_0_0807d348:
    .word E_BattleResult_1_2_1_0
    .word E_BattleResult_1_2_1_1
    .word E_BattleResult_1_2_1_2


_ts E_BattleResult_1_2_1_0
    push       {lr}
    mov        r0,#0x0
    ldr        r7,PTR_iwBufferUITextTile_0807d3b4
LAB_0807d35a:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x38
    bmi        LAB_0807d35a
    add        r0,r7,#0x0
    mov        r1,#0x38
    mov        r2,#0x38
    bl         ArrayShuffle
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xf]
    bl         BattleChip_GetChipData
    add        r7,r0,#0x0
    ldr        r0,[r7,#0x14]
    ldr        r1,[r7,#0x18]
    push       {r5}
    push       {r1}
    ldr        r1,PTR_DAT_0807d3ac
    mov        r2,#0x7
    lsl        r2,r2,#0x6
    bl         Dma_TransferListAdd
    pop        {r1}
    add        r0,r1,#0x0
    ldr        r1,PTR_eBgPaletteE_0807d3b0
    mov        r2,#0x8
    bl         Dma_TransferListAdd
    pop        {r5}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    bne        LAB_0807d3aa
    mov        r0,#0x15
    bl         Sound_ChangeSong
LAB_0807d3aa:
    pop        {pc}

PTR_DAT_0807d3ac:
    .word 0x600AF00

PTR_eBgPaletteE_0807d3b0:
    .word eBgPaletteE

PTR_iwBufferUITextTile_0807d3b4:
    .word iwBufferUITextTile


_ts E_BattleResult_1_2_1_1
    push       {lr}
    sub        sp,#0x74
    mov        r6,sp
    add        r0,r6,#0x4
    bl         FUN_0807d738
    ldrh       r0,[r5,#0x1c]
    cmp        r0,#0x38
    bmi        LAB_0807d3d4
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    b          LAB_0807d3fc
LAB_0807d3d4:
    push       {r0,r5}
    ldr        r7,PTR_iwBufferUITextTile_0807d400
    ldrb       r0,[r7,r0]
    lsl        r1,r0,#0x1
    add        r1,#0x4
    ldrh       r1,[r6,r1]
    strh       r1,[r6,#0x0]
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    add        r0,#0x10
    add        r1,#0xa
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x1
    bl         Screen_CopyTileMapH
    pop        {r0,r5}
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
LAB_0807d3fc:
    add        sp,#0x74
    pop        {pc}

PTR_iwBufferUITextTile_0807d400:
    .word iwBufferUITextTile


_ts E_BattleResult_1_2_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807d420
    ldrb       r0,[r5,#0xe]
    ldrb       r1,[r5,#0xf]
    bl         E_BattleResult_LoadChipDetailText
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
    strb       r0,[r5,#0x1b]
LAB_0807d420:
    pop        {pc}


_nt E_BattleResult_1_2_2
    push       {lr}
    ldrb       r0,[r5,#0xb]
    ldr        r7,PTR_PTR_E_BattleResult_1_2_2_0_0807d430
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_BattleResult_1_2_2_0_0807d430:
    .word PTR_E_BattleResult_1_2_2_0_0807d434

PTR_E_BattleResult_1_2_2_0_0807d434:
    .word E_BattleResult_1_2_2_0
    .word E_BattleResult_1_2_2_1
    .word E_BattleResult_1_2_2_2


_ts E_BattleResult_1_2_2_0
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x1e]
    cmp        r1,#0x4
    bne        LAB_0807d460
    bl         GetCompleteMPState
    ldrb       r2,[r1,#0x2]
    cmp        r2,#0x1
    bne        LAB_0807d460
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    b          LAB_0807d474
LAB_0807d460:
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r0,[r7,#0x2]
    mov        r1,#0x9
    tst        r0,r1
    beq        LAB_0807d474
    mov        r0,#0x1
    strb       r0,[r5,#0x1b]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
LAB_0807d474:
    ldrb       r0,[r5,#0x1b]
    bl         FUN_08007a98
    pop        {pc}


_ts E_BattleResult_1_2_2_1
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x1e]
    cmp        r0,#0x4
    bne        LAB_0807d4a4
    bl         GetCompleteMPState
    ldrb       r2,[r0,#0x2]
    ldrb       r3,[r1,#0x2]
    cmp        r2,r3
    bne        LAB_0807d4a4
    cmp        r2,#0x2
    bne        LAB_0807d4a4
    mov        r0,#0x8
    strb       r0,[r5,#0xb]
    mov        r0,#0x4
    bl         FUN_08007a98
    b          LAB_0807d4aa
LAB_0807d4a4:
    mov        r0,#0x2
    bl         FUN_08007a98
LAB_0807d4aa:
    pop        {pc}


_ts E_BattleResult_1_2_2_2
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x1e]
    cmp        r0,#0x4
    bne        LAB_0807d4d2
    bl         GetCompleteMPState
    ldrb       r2,[r0,#0x2]
    ldrb       r3,[r1,#0x2]
    cmp        r2,r3
    bne        LAB_0807d4d2
    cmp        r2,#0x4
    bne        LAB_0807d4d2
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807d4d8
LAB_0807d4d2:
    mov        r0,#0x4
    bl         FUN_08007a98
LAB_0807d4d8:
    pop        {pc}


_nt E_BattleResult_2_Free
    push       {lr}
    mov        r0,#0x1
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    strb       r0,[r7,#0x3]
    bl         Effect_Free
    pop        {pc}


_nt E_BattleResult_PrintTime
    push       {r5,lr}
    sub        sp,#0x4
    mov        r6,sp
    ldr        r0,[r5,#0x60]
    ldrb       r3,[r5,#0xd]
    mov        r2,#0xc
    tst        r3,r3
    bne        LAB_0807d4fc
    mov        r2,#0xd
LAB_0807d4fc:
    lsl        r2,r2,#0xc
    ldr        r4,DAT_0807d540
    orr        r4,r2
    mov        r3,#0x0
    ldr        r7,PTR_BYTE_ARRAY_0807d53c
LAB_0807d506:
    mov        r1,#0xf
    and        r1,r0
    add        r1,r1,r1
    add        r2,r4,#0x0
    add        r2,r2,r1
    strh       r2,[r6,#0x0]
    add        r2,#0x1
    strh       r2,[r6,#0x2]
    push       {r0,r3,r4,r6,r7}
    ldrb       r0,[r7,r3]
    mov        r1,#0x4
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x2
    bl         Screen_CopyTileMapV
    pop        {r0,r3,r4,r6,r7}
    lsr        r0,r0,#0x4
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        LAB_0807d506
    add        sp,#0x4
    pop        {r5,pc}

BYTE_ARRAY_0807d534:
    .byte 0x17
    .byte 0x16
    .byte 0x14
    .byte 0x13
    .byte 0x11

    .align 2, 0


PTR_BYTE_ARRAY_0807d53c:
    .word BYTE_ARRAY_0807d534

DAT_0807d540:
    .word 0x300


_ts E_BattleResult_DrawRank
    push       {r5,lr}
    sub        sp,#0x4
    mov        r6,sp
    ldrb       r0,[r5,#0xc]
    push       {r6}
    cmp        r0,#0xb
    bmi        LAB_0807d556
    mov        r0,#0xb
    b          LAB_0807d55a
LAB_0807d556:
    bl         ConvertNumToBCD
LAB_0807d55a:
    push       {r0}
    bl         GetWidthOfBcdNumber
    add        r1,r0,#0x0
    pop        {r0}
    pop        {r6}
    mov        r4,#0xc3
    lsl        r4,r4,#0x8
    mov        r3,#0x0
    ldr        r7,PTR_BYTE_ARRAY_0807d5ac
LAB_0807d56e:
    push       {r1}
    tst        r1,r1
    beq        LAB_0807d57c
    mov        r1,#0xf
    and        r1,r0
    add        r1,r1,r1
    b          LAB_0807d57e
LAB_0807d57c:
    mov        r1,#0x14
LAB_0807d57e:
    add        r2,r4,#0x0
    add        r2,r2,r1
    strh       r2,[r6,#0x0]
    add        r2,#0x1
    strh       r2,[r6,#0x2]
    push       {r0,r3,r4,r6,r7}
    ldrb       r0,[r7,r3]
    mov        r1,#0x7
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x2
    bl         Screen_CopyTileMapV
    pop        {r0,r3,r4,r6,r7}
    pop        {r1}
    sub        r1,#0x1
    lsr        r0,r0,#0x4
    add        r3,#0x1
    cmp        r3,#0x2
    bmi        LAB_0807d56e
    add        sp,#0x4
    pop        {r5,pc}

BYTE_ARRAY_0807d5aa:
    .byte 0x17
    .byte 0x16

PTR_BYTE_ARRAY_0807d5ac:
    .word BYTE_ARRAY_0807d5aa


@@ Calculates the rank given at the end of a battle.
@@ Out:
@@ r0: The rank, ranging from 1 to 11 (S) inclusive
@@ r1: The busting time, as a BCD number
@@ r2: The score given to the busting time
_ts Effect_BattleResult_CalculateRank
    push       { lr }
    sub        sp,#0xc
    @ Figure out which scoring to use based on the type of battle
    @ Virus busting uses different thresholds than boss busting
    mov        r1,#0x0
    LoadStateTo r4, Main_world, r4
    ldrb       r0,[r4,#World_battleType]
    cmp        r0,#BattleType_5_Boss
    beq        LAB_0807d5ca
    cmp        r0,#BattleType_7
    beq        LAB_0807d5ca
    cmp        r0,#BattleType_8_NetworkReal
    bge        LAB_0807d5ca
    b          LAB_0807d5cc
LAB_0807d5ca:
    mov        r1,#0x1
LAB_0807d5cc:
    str        r1,[sp,#0x8]
    @ Figure out the score for battle time
    @ First, get time and cap it at 9 minutes, 59.99 seconds
    LoadStateTo r7, Main_battle
    push       { r7 }
    ldrh       r0,[r7,#Battle_m_possibleBattleTime]
    bl         FrameTimeToBcdRealTime
    pop        { r7 }
    ldr        r1,maxTime
    cmp        r0,r1
    bmi        LAB_0807d5e4
    add        r0,r1,#0x0
LAB_0807d5e4:
    str        r0,[sp,#0x0]
    @ Select the time threshold array for either viruses or
    @ bosses
    ldr        r6,PTR_timeScoreThresholdVirus_0807d674
    ldr        r3,[sp,#0x8]
    tst        r3,r3
    beq        LAB_0807d5f0
    ldr        r6,PTR_timeScoreThresholdBoss_0807d678
    @ Calculate points for the time threshold
LAB_0807d5f0:
    mov        r3,#0x0
LAB_0807d5f2:
    add        r4,r3,r3
    ldrh       r1,[r6,r4]
    cmp        r0,r1
    ble        LAB_0807d600
    add        r3,#0x1
    cmp        r3,#0x3
    bmi        LAB_0807d5f2
LAB_0807d600:
    ldr        r6,PTR_scoreVirusBustingTime_0807d668
    ldr        r0,[sp,#0x8]
    tst        r0,r0
    beq        LAB_0807d60a
    ldr        r6,PTR_scoreBossBustingTime_0807d66c
LAB_0807d60a:
    ldrb       r0,[r6,r3]
    str        r3,[sp,#0x4]
    ldrb       r2,[r7,#Battle_multiDeleteCount]
    @ Calculate points for multiple deletion - double delete
    @ is +2, triple delete is +4
    ldr        r6,PTR_scoreMultipleDeletion_0807d670
    ldrb       r2,[r6,r2]
    add        r0,r0,r2
    @ Calculate points for hits taken - start off at +1
    @ and subtract 1 for every hit taken up to 4
    LoadStateTo r7, Main_playerBattleState
    mov        r2,#0x1
    ldrb       r1,[r7,#PlayerBattleState_m_hitsTaken]
    tst        r1,r1
    beq        LAB_0807d636
    mov        r2,#0x0
    cmp        r1,#0x1
    beq        LAB_0807d636
    sub        r2,#0x1
    cmp        r1,#0x2
    beq        LAB_0807d636
    sub        r2,#0x1
    cmp        r1,#0x3
    beq        LAB_0807d636
    sub        r2,#0x1
LAB_0807d636:
    add        r0,r0,r2
    @ Calculate points for steps taken - +1 for less than
    @ 3 steps
    mov        r2,#0x1
    ldrb       r1,[r7,#PlayerBattleState_m_moveCount]
    cmp        r1,#0x3
    bmi        LAB_0807d642
    mov        r2,#0x0
LAB_0807d642:
    add        r0,r0,r2
    @ Clamp rank between 1 and S (11)
    cmp        r0,#0x1
    bge        LAB_0807d64a
    mov        r0,#0x1
LAB_0807d64a:
    cmp        r0,#0xb
    ble        LAB_0807d650
    mov        r0,#0xb
    @ Return rank in R0, time points in R1, and battle time
    @ in R2
LAB_0807d650:
    ldr        r1,[sp,#0x0]
    ldr        r2,[sp,#0x4]
    add        sp,#0xc
    pop        { pc }

scoreVirusBustingTime:
    .byte 7,  6,  5,  4
scoreBossBustingTime:
    .byte 10,  8,  6,  4
scoreMultipleDeletion:
    .byte 0, 0, 2, 4
maxTime:
    time_msf 09 59 99


PTR_scoreVirusBustingTime_0807d668:     .word scoreVirusBustingTime
PTR_scoreBossBustingTime_0807d66c:      .word scoreBossBustingTime
PTR_scoreMultipleDeletion_0807d670:     .word scoreMultipleDeletion
PTR_timeScoreThresholdVirus_0807d674:   .word timeScoreThresholdVirus
PTR_timeScoreThresholdBoss_0807d678:    .word timeScoreThresholdBoss

timeScoreThresholdVirus:
    time_sf 05 00
    time_sf 12 00
    time_sf 36 00

timeScoreThresholdBoss:
    time_sf 30 00
    time_sf 40 00
    time_sf 50 00


_ts Effect_BattleResult_Create
    push       {r5,lr}
    add        r4,r0,#0x0
    mov        r0,#0xf
    bl         Effect_Alloc
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
    add        r0,r5,#0x0
    pop        {r5,pc}


_nt E_BattleResult_LoadChipDetailText
    push       {r5,lr}
    sub        sp,#0x70
    mov        r6,sp
    push       {r0,r1,r6}
    add        r1,r0,#0x0
    ldr        r0,PTR_TextData_BattleChip_Names_0807d70c
    ldr        r2,PTR_iwBufferUITextTile_0807d704
    ldr        r3,PTR_DAT_0807d708
    mov        r4,#0x8
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0807d710
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    mov        r0,#0x5
    mov        r1,#0xe
    mov        r2,#0x3
    ldr        r3,PTR_TilemapEntry_ARRAY_0807d714
    mov        r4,#0x8
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r0,r1,r6}
    push       {r0,r1,r6}
    ldr        r2,TilemapEntry_0807d700
    strh       r2,[r6,#0x0]
    add        r2,#0x1
    strh       r2,[r6,#0x2]
    mov        r0,#0xe
    mov        r1,#0xe
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x2
    bl         Screen_CopyTileMapV
    pop        {r0,r1,r6}
    push       {r0,r1,r6}
    ldr        r0,PTR_tilesetChipCodes_0807d6fc
    lsl        r1,r1,#0x6
    add        r0,r0,r1
    ldr        r1,PTR_DAT_0807d6f8
    mov        r2,#0x10
    bl         Dma_TransferListAdd
    pop        {r0,r1,r6}
    add        sp,#0x70
    pop        {r5,pc}

PTR_DAT_0807d6f8:
    .word 0x600ACC0

PTR_tilesetChipCodes_0807d6fc:
    .word tilesetChipCodes

TilemapEntry_0807d700:
    .byte 0x66, 0xC3

    .align 2, 0


PTR_iwBufferUITextTile_0807d704:
    .word iwBufferUITextTile

PTR_DAT_0807d708:
    .word 0x600AD00

PTR_TextData_BattleChip_Names_0807d70c:
    .word TextData_BattleChip_Names

PTR_tilesetDialogueText_0807d710:
    .word tilesetDialogueText

PTR_TilemapEntry_ARRAY_0807d714:
    .word TilemapEntry_ARRAY_0807d718

TilemapEntry_ARRAY_0807d718:
    .byte 0x68, 0xC3
    .byte 0x6A, 0xC3
    .byte 0x6C, 0xC3
    .byte 0x6E, 0xC3
    .byte 0x70, 0xC3
    .byte 0x72, 0xC3
    .byte 0x74, 0xC3
    .byte 0x76, 0xC3
    .byte 0x69, 0xC3
    .byte 0x6B, 0xC3
    .byte 0x6D, 0xC3
    .byte 0x6F, 0xC3
    .byte 0x71, 0xC3
    .byte 0x73, 0xC3
    .byte 0x75, 0xC3
    .byte 0x77, 0xC3


_ts FUN_0807d738
    ldr        r1,DAT_0807d748
    mov        r2,#0x38
LAB_0807d73c:
    strh       r1,[r0,#0x0]
    add        r1,#0x1
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_0807d73c
    mov        pc,lr

DAT_0807d748:
    .word 0xE378


_ts FUN_0807d74c
    ldr        r7,SHORT_ARRAY_0807d760
    lsl        r1,r1,#0x1
    ldrh       r1,[r7,r1]
    mov        r2,#0x38
LAB_0807d754:
    strh       r1,[r0,#0x0]
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_0807d754
    mov        pc,lr

    .align 2, 0


SHORT_ARRAY_0807d760:
    .short 0xD764
    .short 0x807

DAT_0807d764:
    .byte 0x19
    .byte 0xC3
    .byte 0x18
    .byte 0xC3


_ts E_BattleResult_LoadZennyDetailText
    push       {r5,lr}
    sub        sp,#0x70
    mov        r6,sp
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    str        r0,[r7,#0x4]
    push       {r6}
    ldr        r0,PTR_TextData_BattleMessages_0807d7a4
    mov        r1,#0x5
    ldr        r2,PTR_iwBufferUITextTile_0807d7a0
    ldr        r3,PTR_DAT_0807d7ac
    mov        r4,#0xa
    mov        r5,#0x1
    ldr        r6,PTR_tilesetDialogueText_0807d7a8
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    mov        r0,#0x5
    mov        r1,#0xe
    mov        r2,#0x3
    ldr        r3,PTR_TilemapEntry_ARRAY_0807d7b0
    mov        r4,#0xa
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r6}
    add        sp,#0x70
    pop        {r5,pc}

PTR_iwBufferUITextTile_0807d7a0:
    .word iwBufferUITextTile

PTR_TextData_BattleMessages_0807d7a4:
    .word TextData_BattleMessages

PTR_tilesetDialogueText_0807d7a8:
    .word tilesetDialogueText

PTR_DAT_0807d7ac:
    .word 0x600AC80

PTR_TilemapEntry_ARRAY_0807d7b0:
    .word TilemapEntry_ARRAY_0807d7b4

TilemapEntry_ARRAY_0807d7b4:
    .byte 0x64, 0xC3
    .byte 0x66, 0xC3
    .byte 0x68, 0xC3
    .byte 0x6A, 0xC3
    .byte 0x6C, 0xC3
    .byte 0x6E, 0xC3
    .byte 0x70, 0xC3
    .byte 0x72, 0xC3
    .byte 0x74, 0xC3
    .byte 0x76, 0xC3
    .byte 0x65, 0xC3
    .byte 0x67, 0xC3
    .byte 0x69, 0xC3
    .byte 0x6B, 0xC3
    .byte 0x6D, 0xC3
    .byte 0x6F, 0xC3
    .byte 0x71, 0xC3
    .byte 0x73, 0xC3
    .byte 0x75, 0xC3
    .byte 0x77, 0xC3


_ts E_BattleResult_ClearResultUI
    push       {r5,lr}
    sub        sp,#0x28
    mov        r6,sp
    push       {r0}
    add        r0,r6,#0x0
    mov        r1,#0x28
    bl         memset0_32
    pop        {r0}
    mov        r3,#0x0
    add        r4,r0,#0x0
LAB_0807d7f2:
    push       {r3,r4,r6}
    add        r0,r3,#0x0
    mov        r1,#0x0
    mov        r2,#0x3
    add        r3,r6,#0x0
    mov        r4,#0x14
    bl         Screen_CopyTileMapV
    pop        {r3,r4,r6}
    add        r3,#0x1
    cmp        r3,r4
    bmi        LAB_0807d7f2
    add        sp,#0x28
    pop        {r5,pc}


@@ Returns an item drop from an enemy.
@@ r0: 1 if zenny, 0 if a chip
@@ r1: The amount of zenny, or the chip ID
@@ r2: The chip code
@ E_BattleResult_GetEnemyDrop(byte enemyId, byte bustingLevel)
_nt E_BattleResult_GetEnemyDrop
    push       { lr }
    push       { r1 }
    bl         Enemy_GetEnemyDetail
    @ r0 = enemy detail ptr
    pop        { r1 }
    .byte 0x0E, 0x4F @ ldr        r7,PTR_arrayBustingLevelToRollChance_0807d854
    lsl        r1,r1,#0x4
    add        r7,r7,r1
    @ r7 = roll chance array for given busting level
    push       { r0 }
    push       { r7 }
    bl         Rng_RandomUint
    @ r0 = randnum
    mov        r1,#0xf
    and        r1,r0
    @ r1 = random number from 0 to 15
    pop        { r7 }
    ldrb       r1,[r7,r1]
    @ r1 = random index picked from roll chance array
    lsl        r1,r1,#0x2
    mov        r2,#0x10
    and        r2,r0
    lsr        r2,r2,#0x3
    @ r2 = 0 or 2
    add        r1,r1,r2
    add        r1,#0xc
    pop        { r0 }
    @ Enemy drop table is 5 groups of 2 rewards each
    @ Index selects the group, and the reward is
    @ picked at random from the group
    ldrsh      r0,[r0,r1]
    @ r0 = short from the enemy's drop table
    tst        r0,r0
    bmi        LAB_0807d84c
    @ Highest bit is 0, so it's a battle chip
    mov        r1,#0xff
    and        r1,r0
    @ r1 = chip ID
    lsr        r2,r0,#0x8
    @ r2 = chip code
    mov        r0,#0x0
    b          LAB_0807d852
LAB_0807d84c:
    @ If the highest bit is 1, then it's zenny
    @ Max zenny reward is 0x7FFF, or 32767 zenny
    lsl        r1,r0,#0x11
    lsr        r1,r1,#0x11
    mov        r0,#0x1
LAB_0807d852:
    pop        { pc }
PTR_arrayBustingLevelToRollChance_0807d854:
    .word arrayBustingLevelToRollChance

arrayBustingLevelToRollChance:
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 0
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 1
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 2
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 3
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1  @ Lv. 4
        .byte 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2  @ Lv. 5
        .byte 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2  @ Lv. 6
        .byte 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3  @ Lv. 7
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3  @ Lv. 8
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4  @ Lv. 9
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4  @ Lv. 10
        .byte 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4  @ Lv. S


_ts E_BattleResult_LoadAnimBattleResultUiPressA
    push       {r5,lr}
    ldr        r3,PTR_layoutListBattleResultUiPressAFrames_0807d930
    lsl        r0,r0,#0x2
    ldr        r3,[r3,r0]
    mov        r0,#0x6
    mov        r1,#0x10
    mov        r2,#0x3
    mov        r4,#0x8
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    pop        {r5,pc}

PTR_layoutListBattleResultUiPressAFrames_0807d930:
    .word layoutListBattleResultUiPressAFrames

layoutListBattleResultUiPressAFrames:
    .word layoutBattleResultUiPressAInvisible
    .word layoutBattleResultUiPressAVisible

layoutBattleResultUiPressAInvisible:
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1A, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3
    .byte 0x1B, 0xC3

layoutBattleResultUiPressAVisible:
    .byte 0x1C, 0xC3
    .byte 0x1D, 0xC3
    .byte 0x1E, 0xC3
    .byte 0x1F, 0xC3
    .byte 0x20, 0xC3
    .byte 0x21, 0xC3
    .byte 0x22, 0xC3
    .byte 0x23, 0xC3
    .byte 0x24, 0xC3
    .byte 0x25, 0xC3
    .byte 0x26, 0xC3
    .byte 0x27, 0xC3
    .byte 0x28, 0xC3
    .byte 0x29, 0xC3
    .byte 0x2A, 0xC3
    .byte 0x2B, 0xC3


_ts FUN_0807d97c
    push       {lr}
    sub        sp,#0x8
    push       {r0}
    bl         FUN_0807da8c
    pop        {r0}
    mov        r1,sp
    push       {r0}
    add        r0,r1,#0x0
    bl         FUN_0807da54
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r1,r0
    pop        {r0}
    ldr        r7,PTR_arrayBustingLevelToRollChance_0807d9e0
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    ldrb       r1,[r7,r1]
    mov        r4,sp
    mov        r2,#0x0
    add        r3,r1,#0x0
LAB_0807d9aa:
    ldrb       r0,[r4,r1]
    tst        r0,r0
    bne        LAB_0807d9c8
    tst        r2,r2
    beq        LAB_0807d9be
    add        r1,#0x1
    cmp        r1,#0x4
    ble        LAB_0807d9aa
    mov        r1,#0x0
.dead:
    b          .dead
LAB_0807d9be:
    sub        r1,#0x1
    bge        LAB_0807d9aa
    mov        r2,#0x1
    add        r1,r3,#0x0
    b          LAB_0807d9aa
LAB_0807d9c8:
    add        r4,r0,#0x0
    add        r6,r1,#0x0
    bl         Rng_RandomInt
    add        r1,r0,#0x0
    bl         SWI_Div
    add        r0,r6,#0x0
    bl         FUN_0807d9e4
    add        sp,#0x8
    pop        {pc}

PTR_arrayBustingLevelToRollChance_0807d9e0:
    .word arrayBustingLevelToRollChance


_ts FUN_0807d9e4
    push       {lr}
    sub        sp,#0x8
    ldr        r6,PTR_DAT_0807da50
    add        r3,r0,#0x0
    add        r4,r1,#0x0
    mov        r2,#0x0
LAB_0807d9f0:
    ldr        r0,[r6,#0x0]
    ldrb       r1,[r6,#0x4]
    add        r0,r0,r1
    beq        LAB_0807da08
    add        r0,r2,#0x0
    bl         BattleChip_GetChipData
    ldrb       r1,[r0,#0x8]
    cmp        r1,r3
    bne        LAB_0807da08
    sub        r4,#0x1
    blt        LAB_0807da10
LAB_0807da08:
    add        r6,#0x10
    add        r2,#0x1
    cmp        r2,#0xf0
    bmi        LAB_0807d9f0
LAB_0807da10:
    add        r7,r0,#0x0
    ldr        r6,PTR_DAT_0807da50
    lsl        r0,r2,#0x4
    add        r6,r6,r0
    mov        r4,sp
    mov        r1,#0x0
    mov        r3,#0x0
LAB_0807da1e:
    ldrb       r0,[r6,r3]
    tst        r0,r0
    beq        LAB_0807da2a
    strb       r3,[r4,#0x0]
    add        r4,#0x1
    add        r1,#0x1
LAB_0807da2a:
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        LAB_0807da1e
    push       {r2,r7}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    pop        {r2,r7}
    mov        r4,sp
    ldrb       r0,[r4,r1]
    mov        r1,#0x0
    add        r1,r1,r0
    ldrb       r1,[r7,r1]
    add        r0,r2,#0x0
    add        sp,#0x8
    pop        {pc}

PTR_DAT_0807da50:
    .word 0x2009AE0


_ts FUN_0807da54
    push       {lr}
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    strb       r1,[r0,#0x4]
    add        r7,r0,#0x0
    ldr        r6,PTR_DAT_0807da88
    mov        r2,#0x0
LAB_0807da62:
    ldr        r0,[r6,#0x0]
    ldrb       r1,[r6,#0x4]
    add        r0,r0,r1
    beq        LAB_0807da7c
    add        r0,r2,#0x0
    bl         BattleChip_GetChipData
    ldrb       r1,[r0,#0x8]
    cmp        r1,#0xff
    beq        LAB_0807da7c
    ldrb       r0,[r7,r1]
    add        r0,#0x1
    strb       r0,[r7,r1]
LAB_0807da7c:
    add        r6,#0x10
    add        r2,#0x1
    cmp        r2,#0xf0
    bmi        LAB_0807da62
    pop        {pc}

    .align 2, 0


PTR_DAT_0807da88:
    .word 0x2009AE0


_ts FUN_0807da8c
    push       {lr}
    ldr        r7,PTR_gFolder_0807dad4
    mov        r3,#0x1e
LAB_0807da92:
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x1
    push       {r3,r7}
    bl         Inventory_SubtractChip
    pop        {r3,r7}
    add        r7,#0x2
    sub        r3,#0x1
    bne        LAB_0807da92
    ldr        r0,PTR_gBattleChipInventory_0807dad0
    ldr        r1,PTR_DAT_0807dacc
    mov        r2,#0xf
    lsl        r2,r2,#0x8
    bl         memcpy_32
    ldr        r7,PTR_gFolder_0807dad4
    mov        r3,#0x1e
LAB_0807dab6:
    ldrb       r0,[r7,#0x0]
    ldrb       r1,[r7,#0x1]
    mov        r2,#0x1
    push       {r3,r7}
    bl         Inventory_AddChip
    pop        {r3,r7}
    add        r7,#0x2
    sub        r3,#0x1
    bne        LAB_0807dab6
    pop        {pc}

PTR_DAT_0807dacc:
    .word 0x2009AE0

PTR_gBattleChipInventory_0807dad0:
    .word gBattleChipInventory

PTR_gFolder_0807dad4:
    .word gFolder
