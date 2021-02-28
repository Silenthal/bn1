
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Battle_GetChipDetailFromDeck, 0x801666a
    .set BattleChipSelect_CopyTilemap, 0x8015eec
    .set AddObject, 0x8009810

    .text

    .thumb

thumb_func_start BattleChipSelect_LoadDamageTilemap
BattleChipSelect_LoadDamageTilemap:
    push       { lr }
    sub        sp,#0x10
    tst        r0,r0
    beq        LAB_080166dc
    mov        r1,#0x5
    mov        r2,#0xa
    mov        r3,#0x4
    bl         BattleChipSelect_LoadNumberDamageTilemap
    b          LAB_080166f4
LAB_080166dc:
    ldr        r0,TilemapEntry_080166f8
    str        r0,[sp,#0x0]
    str        r0,[sp,#0x4]
    str        r0,[sp,#0x8]
    str        r0,[sp,#0xc]
    mov        r0,#0x5
    mov        r1,#0xa
    mov        r2,sp
    mov        r3,#0x4
    mov        r4,#0x2
    bl         BattleChipSelect_CopyTilemap
LAB_080166f4:
    add        sp,#0x10
    pop        { pc }
thumb_func_end BattleChipSelect_LoadDamageTilemap
TilemapEntry_080166f8:
    tilemap_entry 0x314, 0, 0xC
    tilemap_entry 0x314, 0, 0xC

thumb_func_start BattleChipSelect_LoadNumberDamageTilemap
BattleChipSelect_LoadNumberDamageTilemap:
    push       { lr }
    sub        sp,#0x10
    mov        r8,sp
    push       { r1, r2, r3 }
    push       { r3 }
    mov        r1,#0x8
    mov        r2,r8
    ldr        r3,TilemapEntry_08016760
LAB_0801670c:
    strh       r3,[r2,#0x0]
    add        r2,#0x2
    sub        r1,#0x1
    bne        LAB_0801670c
    push       { r5 }
    bl         ConvertNumToBCD
    pop        { r5 }
    pop        { r3 }
    mov        r6,r8
    sub        r2,r3,#0x1
    add        r2,r2,r2
    add        r6,r6,r2
    add        r4,r3,r3
    push       { r0 }
    bl         GetWidthOfBcdNumber
    add        r3,r0,#0x0
    pop        { r0 }
    ldr        r7,tilemapDamageNumberStart
LAB_08016734:
    mov        r1,#0xf
    and        r1,r0
    add        r1,r1,r1
    add        r1,r1,r7
    strh       r1,[r6,#0x0]
    add        r1,#0x1
    strh       r1,[r6,r4]
    lsr        r0,r0,#0x4
    sub        r6,#0x2
    sub        r3,#0x1
    bne        LAB_08016734
    pop        { r1, r2, r3 }
    add        r0,r1,#0x0
    add        r1,r2,#0x0
    mov        r2,r8
    mov        r4,#0x2
    bl         BattleChipSelect_CopyTilemap
    add        sp,#0x10
    pop        { pc }
thumb_func_end BattleChipSelect_LoadNumberDamageTilemap
tilemapDamageNumberStart:
    tilemap_entry 0x300, 0, 0xC
    .align 2, 0
TilemapEntry_08016760:
    tilemap_entry 0x314, 0, 0xC

thumb_func_start BattleChipSelect_DrawChipElement
BattleChipSelect_DrawChipElement:
    push       { lr }
    push       { r5 }
    lsl        r0,r0,#0x7
    ldr        r1,PTR_tilesetBattleChipElements_08016790
    add        r0,r0,r1
    ldr        r1,PTR_DAT_0801678c
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    pop        { r5 }
    mov        r0,#0x3
    mov        r1,#0xa
    ldr        r2,PTR_TilemapEntry_08016788
    mov        r3,#0x2
    mov        r4,#0x2
    bl         BattleChipSelect_CopyTilemap
    pop        { pc }
thumb_func_end BattleChipSelect_DrawChipElement
PTR_TilemapEntry_08016788: .word TilemapEntry_08016794
PTR_DAT_0801678c: .word 0x600aa00
PTR_tilesetBattleChipElements_08016790: .word tilesetBattleChipElements
TilemapEntry_08016794:
    tilemap_entry 0x350, 0, 0xC
    tilemap_entry 0x351, 0, 0xC
    tilemap_entry 0x352, 0, 0xC
    tilemap_entry 0x353, 0, 0xC

thumb_func_start BattleChipSelect_DrawChipCode
BattleChipSelect_DrawChipCode:
    push       { r5, lr }
    push       { r5 }
    lsl        r0,r0,#0x6
    ldr        r1,PTR_tilesetBattleChipCodes_080167c0
    add        r0,r0,r1
    ldr        r1,PTR_DAT_080167c4
    mov        r2,#0x10
    bl         Dma_TransferListAdd
    pop        { r5 }
    mov        r0,#0x1
    mov        r1,#0xa
    ldr        r2,PTR_TilemapEntry_ARRAY_080167c8
    mov        r3,#0x1
    mov        r4,#0x2
    bl         BattleChipSelect_CopyTilemap
    pop        { r5, pc }
thumb_func_end BattleChipSelect_DrawChipCode

PTR_tilesetBattleChipCodes_080167c0:    .word tilesetBattleChipCodes
PTR_DAT_080167c4:                       .word 0x600a9c0
PTR_TilemapEntry_ARRAY_080167c8:         .word TilemapEntry_ARRAY_080167cc
TilemapEntry_ARRAY_080167cc:
    tilemap_entry 0x34E, 0, 0xC
    tilemap_entry 0x34F, 0, 0xC


dummy_167d0:
    push       { r5, lr }
    pop        { r5, pc }


FUN_080167d4:
    ldrb       r0,[r5,#0x12]
    add        r0,#0x1
    strb       r0,[r5,#0x12]
    mov        r1,#0xe
    bl         SWI_Div
    cmp        r0,#0x6
    bmi        LAB_080167e8
    mov        r0,#0x0
    strb       r0,[r5,#0x12]
LAB_080167e8:
    ldr        r1,PTR_BYTE_ARRAY_08016840
    ldrb       r0,[r1,r0]
    cmp        r0,#0x2
    beq        LAB_0801682e
    push       { r0, r5 }
    ldr        r0,DAT_08016834
    mov        r1,#0x20
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x0
    mov        r5,#0x1
    mov        r6,#0x0
    bl         AddObject
    ldr        r0,DAT_08016830
    mov        r1,#0x0
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x1
    mov        r5,#0x1
    mov        r6,#0x0
    bl         AddObject
    pop        { r0, r5 }
    cmp        r0,#0x1
    bne        LAB_0801682e
    ldr        r0,DAT_08016838
    mov        r1,#0x18
    mov        r2,#0x56
    mov        r3,#0xd
    mov        r4,#0x0
    mov        r5,#0x1
    mov        r6,#0x0
    bl         AddObject
LAB_0801682e:
    pop        { r5, pc }
DAT_08016830: .word 0x3B4
DAT_08016834: .word 0x3B8
DAT_08016838: .word 0x3BA
    .word 0x20064A0
PTR_BYTE_ARRAY_08016840: .word BYTE_ARRAY_08016844

BYTE_ARRAY_08016844:
    .byte 0, 1, 0, 1, 0, 2


non_word_aligned_thumb_func_start BattleChipSelect_LoadChipTilemap
BattleChipSelect_LoadChipTilemap:
    push       { lr }
    ldr        r1,TilemapEntry_0801685c
    mov        r2,#0x38
LAB_08016850:
    strh       r1,[r0,#0x0]
    add        r1,#0x1
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_08016850
    pop        { pc }
thumb_func_end BattleChipSelect_LoadChipTilemap
TilemapEntry_0801685c:
    tilemap_entry 0x378, 0, 0xB

thumb_func_start BattleChipSelect_LoadBlankChipTilemap
BattleChipSelect_LoadBlankChipTilemap:
    push       { lr }
    ldr        r1,tilemapBlank
    mov        r2,#0x38
LAB_08016866:
    strh       r1,[r0,#0x0]
    add        r0,#0x2
    sub        r2,#0x1
    bne        LAB_08016866
    pop        { pc }
thumb_func_end BattleChipSelect_LoadBlankChipTilemap
tilemapBlank:
    tilemap_entry 0x315, 0x0, 0xC


@@ Moves up chip IDs in a chip list to eliminate empty spaces.
@@ In: 
@@ r0: deckPtr: The pointer to the group to optimize.
@@ r1: deckSz: The size of the group.
thumb_func_start BattleChipSelect_NormalizeChipGroup
BattleChipSelect_NormalizeChipGroup:
    push       { r5, r6, lr }
    add        r5,r0,r1
    add        r6,r0,#0x0
    add        r7,r0,#0x0
LAB_0801687c:
    ldrb       r2,[r6,#0x0]
    cmp        r2,#0xff
    beq        LAB_08016886
    strb       r2,[r7,#0x0]
    add        r7,#0x1
LAB_08016886:
    add        r6,#0x1
    sub        r1,#0x1
    bne        LAB_0801687c
    mov        r1,#0xff
LAB_0801688e:
    cmp        r7,r5
    beq        LAB_08016898
    strb       r1,[r7,#0x0]
    add        r7,#0x1
    b          LAB_0801688e
LAB_08016898:
    pop        { r5, r6, pc }
thumb_func_end BattleChipSelect_NormalizeChipGroup

@@ Removes the selected battle chips from the active battle deck.
non_word_aligned_thumb_func_start BattleChipSelect_TakeSelectedChipsFromDeck
BattleChipSelect_TakeSelectedChipsFromDeck:
    push       { lr }
    mov        r6,#0x40
    add        r6,r6,r5
    ldr        r7,PTR_gBattleFolder_080168c0
    mov        r4,#0x0
LAB_080168a4:
    ldrb       r0,[r6,r4]
    tst        r0,r0
    beq        LAB_080168ae
    mov        r0,#0xff
    strb       r0,[r7,r4]
LAB_080168ae:
    add        r4,#0x1
    cmp        r4,#0xf
    bmi        LAB_080168a4
    ldr        r0,PTR_gBattleFolder_080168c0
    @ 
    mov        r1,#30
    bl         BattleChipSelect_NormalizeChipGroup
    pop        { pc }
thumb_func_end BattleChipSelect_TakeSelectedChipsFromDeck
    .align 2,0
PTR_gBattleFolder_080168c0: .word gBattleFolder

thumb_func_start BattleChipSelect_ValidateSelection
BattleChipSelect_ValidateSelection:
    push       { lr }
    mov        r6,#0x3
    @ First, check if there are any chips selected at all
    @ If none, then chip can be selected, with "all flags"
    ldrb       r1,[r5,#0xb]
    tst        r1,r1
    beq        LAB_08016920
    @ Check if chip selection is full - if so, then play the
    @ "you can't select more chips" sound and return
    @ false
    cmp        r1,#0x5
    beq        LAB_08016914
    @ Based on the given chip folder ID in r0, look at
    @ the corresponding area in the chip selection list
    @ and see if it was selected already (has a value
    @ greater than 0).
    @ If it has an order (it was selected), then play the
    @ rejection sound and return false.
    mov        r2,#0x40
    add        r2,r2,r0
    ldrb       r2,[r5,r2]
    tst        r2,r2
    bne        LAB_08016914
    @ At this point, there are between 1 and 4 chips selected,
    @ inclusive.
    push       { r0 }
    mov        r2,#0x6
    add        r2,r2,r1
    sub        r2,#0x1
    @ Get the last chip folder ID selected, and get the details
    @ about the chip.
    ldrb       r0,[r5,r2]
    bl         Battle_GetChipDetailFromDeck
    add        r2,r0,#0x0
    add        r3,r1,#0x0
    pop        { r0 }
    bl         Battle_GetChipDetailFromDeck
    mov        r6,#0x0
    @ If the last chip selected has the same chip ID
    @ as the chip being checked, set the "same chip ID"
    @ flag
    cmp        r0,r2
    bne        LAB_080168fc
    add        r6,#0x1
    @ If the code of the last selected chip matches the code
    @ of the chip being checked, set the "same code" flag
LAB_080168fc:
    cmp        r1,r3
    bne        LAB_08016902
    add        r6,#0x2
    @ If no flags are set (both chips have different
    @ IDs and different codes), then play the reject
    @ sound and return false
LAB_08016902:
    tst        r6,r6
    beq        LAB_08016914
    @ If there are no flags shared between the last chip
    @ selected and the current chip, play reject sound
    @ and return false.
    @ This encodes the "rules" of the hand selection:
    @ - There are two flags: Flag 1 = same ID, Flag 2 = same code 
    @ - When a chip is selected, the corresponding flag that
    @ shows its relationship with the prior selected chip
    @ is saved.
    @ - The next chip you select must share a relation flag
    @ with the prior chip in some way.
    @ - The first chip you select is "free" (flag 2 | flag 1)
    @ - Selecting chips with the same ID and code after the
    @ "free" chip will keep both flags.
    @ - Picking a chip after a free chip that has only one
    @ of the relation flags "locks" that property for
    @ future chip selections. For example:
    @ - Cannon A
    @ - Cannon A
    @ - Cannon B
    @  ^ After this, the "same ID" flag is the most current,
    @    and future chip selections for the same hand have
    @    to match this relation flag.
    ldrb       r1,[r5,#0xb]
    mov        r2,#0x15
    add        r2,r2,r1
    sub        r2,#0x1
    ldrb       r0,[r5,r2]
    and        r6,r0
    bne        LAB_08016920
LAB_08016914:
    mov        r0,#0x6c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    mov        r1,#0x0
    pop        { pc }
    @ Return true, along with the
    @ appropriate relation flags
LAB_08016920:
    add        r1,r6,#0x0
    mov        r0,#0x1
    pop        { pc }
thumb_func_end BattleChipSelect_ValidateSelection

FUN_08016926:
    ldr        r7,PTR_gBattleChipSelect_08016930
    mov        r0,#0x1
    strb       r0,[r7,#0x1a]
    mov        pc,lr

    .align 2,0
PTR_gBattleChipSelect_08016930: .word gBattleChipSelect

FUN_08016934:
    ldr        r7,PTR_gBattleChipSelect_0801693c
    mov        r0,#0x0
    strb       r0,[r7,#0x1a]
    mov        pc,lr
PTR_gBattleChipSelect_0801693c: .word gBattleChipSelect

thumb_func_start BattleChipSelect_AnimateLogo
BattleChipSelect_AnimateLogo:
    push       { lr }
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    bne        LAB_0801694e
    mov        r0,#0x0
    strb       r0,[r5,#0x1c]
    pop        { pc }
LAB_0801694e:
    ldrb       r0,[r5,#0x1c]
    add        r0,#0x1
    cmp        r0,#0x0
    cmp        r0,#0x10
    bmi        LAB_0801695c
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
LAB_0801695c:
    strb       r0,[r5,#0x1c]
    ldr        r7,PTR_framesLogoAnimation_080169cc
    ldrb       r0,[r7,r0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_logoFrameList_080169c8
    ldr        r2,[r7,r0]
    mov        r0,#0xc
    mov        r1,#0x0
    mov        r3,#0x2
    mov        r4,#0x3
    bl         BattleChipSelect_CopyTilemap
    pop        { pc }
thumb_func_end BattleChipSelect_AnimateLogo

framesLogoAnimation:
    .byte 0, 1, 2, 3
    .byte 3, 0, 0, 1
    .byte 1, 1, 2, 2
    .byte 2, 3, 3, 3

    .align 2, 0
tilemapBattleChipSelectLogoFrame0:
    tilemap_entry 0x331, 0, 0xC
    tilemap_entry 0x332, 0, 0xC
    tilemap_entry 0x333, 0, 0xC
    tilemap_entry 0x334, 0, 0xC
    tilemap_entry 0x335, 0, 0xC
    tilemap_entry 0x336, 0, 0xC
tilemapBattleChipSelectLogoFrame1:
    tilemap_entry 0x337, 0, 0xC
    tilemap_entry 0x338, 0, 0xC
    tilemap_entry 0x339, 0, 0xC
    tilemap_entry 0x33A, 0, 0xC
    tilemap_entry 0x33B, 0, 0xC
    tilemap_entry 0x33C, 0, 0xC
tilemapBattleChipSelectLogoFrame2:
    tilemap_entry 0x332, 1, 0xC
    tilemap_entry 0x331, 1, 0xC
    tilemap_entry 0x334, 1, 0xC
    tilemap_entry 0x333, 1, 0xC
    tilemap_entry 0x336, 1, 0xC
    tilemap_entry 0x335, 1, 0xC
tilemapBattleChipSelectLogoFrame3:
    tilemap_entry 0x33D, 0, 0xC
    tilemap_entry 0x33E, 0, 0xC
    tilemap_entry 0x33F, 0, 0xC
    tilemap_entry 0x340, 0, 0xC
    tilemap_entry 0x341, 0, 0xC
    tilemap_entry 0x342, 0, 0xC
logoFrameList:
    .word tilemapBattleChipSelectLogoFrame0
    .word tilemapBattleChipSelectLogoFrame1
    .word tilemapBattleChipSelectLogoFrame2
    .word tilemapBattleChipSelectLogoFrame3
PTR_logoFrameList_080169c8: .word logoFrameList
PTR_framesLogoAnimation_080169cc: .word framesLogoAnimation

thumb_func_start GetChipFolderSize
GetChipFolderSize:
    push       { r1, r7, lr }
    mov        r0,#0x0
    ldr        r7,PTR_gBattleFolder_080169e4
LAB_080169d6:
    ldrb       r1,[r7,r0]
    cmp        r1,#0xff
    beq        LAB_080169e2
    add        r0,#0x1
    cmp        r0,#0x1e
    blt        LAB_080169d6
LAB_080169e2:
    pop        { r1, r7, pc }
thumb_func_end GetChipFolderSize
PTR_gBattleFolder_080169e4: .word gBattleFolder

    .end
