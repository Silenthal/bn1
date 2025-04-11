#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listHandlerActor:
    .word Routine_Player
    .word Routine_Woodman
    .word Routine_Canodumb
    .word Routine_FireMan
    .word Routine_Mettaur
    .word Routine_Vulgear
    .word Routine_Mayl
    .word Routine_LanBed
    .word Routine_BrownCar
    .word Routine_Beetank
    .word Routine_Spooky
    .word Routine_PoweredCannon
    .word Routine_GutsMan
    .word Routine_HardHead
    .word Routine_Fishy
    .word Routine_NumberMan
    .word Routine_Swordy
    .word Routine_Puffy
    .word Routine_Flappy
    .word Routine_Piranha
    .word Routine_Cloudy
    .word Routine_StoneMan
    .word Routine_FireMan_Chip
    .word Routine_NumberMan_Chip
    .word Routine_Floshell
    .word Routine_GutsMan_Chip
    .word Routine_Handy_Main
    .word Routine_IceMan
    .word Routine_ColdBear
    .word Routine_IceMan_Chip
    .word Routine_StoneMan_Chip
    .word Routine_Jelly
    .word Routine_Ratty
    .word Routine_Popper
    .word Routine_SkullMan
    .word Routine_ColorMan
    .word Routine_MiniColorMan
    .word Routine_ElecMan
    .word Routine_ProtoMan
    .word Routine_Miney
    .word Routine_Ammonicule
    .word Routine_SharkMan
    .word Routine_Prog
    .word Routine_Billy
    .word Routine_Megalian
    .word Routine_Remobit
    .word Routine_BombMan
    .word Routine_SkullMan_Chip
    .word Routine_Roll_Chip
    .word Routine_BigStraight
    .word Routine_GutsShoot_GutsMan
    .word Routine_GutsShoot_MegaMan
    .word Routine_Fanner
    .word Routine_CanDevil
    .word Routine_DeathStorm
    .word Routine_Mosqurito
    .word Routine_Drain
    .word Routine_LifeVirus
    .word Routine_ColorMan_Chip
    .word Routine_MiniColorMan_Chip
    .word Routine_ProtoMan_Chip
    .word Routine_SharkMan_Chip
    .word Routine_ElecMan_Chip
    .word Routine_MagicMan
    .word Routine_PharaohMan
    .word Routine_Poitton
    .word Routine_ShadowMan
    .word Routine_BigSnake
    .word Routine_BigSnakeBody
    .word Routine_Gaia
    .word Routine_Bass
    .word Routine_Satella
    .word Routine_PharaohMan_Chip
    .word Routine_ShadowMan_Chip
    .word Routine_MagicMan_Chip
    .word Routine_BombMan_Chip
    .word Routine_Bass_Chip
    .word Routine_LifeSaver
    .word Routine_2xHeroMegaMan
    .word Routine_2xHeroProtoMan
    .word Routine_HeavyStamp
    .word Routine_BloodSuck
    .word Routine_Mole


@@ Allocates a new Actor object.
@@ In:
@@ r0: int routineType: The type of routine to perform.
@@ r1: int x - The current X position.
@@ r2: int y - The current Y position.
@@ r3: int z - The current Z position.
@@ r4: int family - The family detail.
@@ Out:
@@ r5: Actor* actor - The created Actor object, or null if allocation failed.
_ts Actor_Alloc
    push       {r0,r1,r2,r3,r4,lr}
    ldr        r0,PTR_gBitsetActor_080034bc
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_080034c0
    ldr        r5,PTR_gEntityListActor_080034c4
    ldr        r3,PTR_gFadeSettings_080034c8
LAB_08003358:
    tst        r2,r1
    beq        LAB_08003366
    lsr        r1,r1,#0x1
    add        r5,#0xc0
    cmp        r5,r3
    bge        LAB_0800338c
    b          LAB_08003358
LAB_08003366:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r5
    mov        r1,#0xbc
    mov        r2,#0x0
    bl         memset_8
    mov        r0,#0x9
    strb       r0,[r5,#Actor_header_entityFlags]
    pop        {r0,r1,r2,r3,r4}
    strb       r0,[r5,#Actor_header_routineType]
    str        r1,[r5,#Actor_pos_curr_x]
    str        r2,[r5,#Actor_pos_curr_y]
    str        r3,[r5,#Actor_pos_curr_z]
    str        r4,[r5,#Actor_family_family]
    mov        r0,#0x0
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}
LAB_0800338c:
    mov        r5,#0x0
    pop        {r0,r1,r2,r3,r4,pc}


@@ Frees an allocated Actor object.
@@ In:
@@ r5: Actor* actor - The Actor object to free.
_ts Actor_Free
    push       {lr}
    ldr        r0,DAT_080034c0
    ldrb       r1,[r5,#Actor_header_listIndex]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetActor_080034cc
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#Actor_header_entityFlags]
    bl         SpritePtr_AffineFree
    pop        {pc}


@@ Updates all active Actor objects.
_ts Actor_UpdateAll
    push       {lr}
    ldr        r5,PTR_gEntityListActor_080034d0
LAB_080033b0:
    mov        r1,#0x1
    ldrb       r0,[r5,#Actor_header_entityFlags]
    tst        r0,r1
    beq        LAB_080033e6
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_IsBattleTimePaused]
    tst        r1,r1
    beq        LAB_080033c8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080033e6
LAB_080033c8:
    LoadMain screenDim, r7, r7
    ldrb       r1,[r7,#World_fadeType]
    tst        r1,r1
    beq        LAB_080033d8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080033e6
LAB_080033d8:
    str        r5,[r7,#World_updatingEntity]
    ldr        r0,PTR_PTR_Routine_Player_1_080034d4
    ldrb       r1,[r5,#Actor_header_routineType]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_080033e6:
    LoadMain battle, r7, r7
    ldrb       r1,[r7,#World_currentSongId]
    tst        r1,r1
    bne        LAB_08003404
    LoadMain screenDim, r6, r6
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_08003404
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_08003404
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_08003404:
    add        r5,#0xc0
    ldr        r0,PTR_gEntityListActor_080034d8
    ldr        r1,DAT_080034dc
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003412
    b          LAB_080033b0
LAB_08003412:
    LoadMain world, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#World_updatingEntity]
    pop        {pc}


@@ Initializes the Actor object list.
_ts Actor_Init
    push       {lr}
    ldr        r0,PTR_gFillValue_080034e0
    ldr        r1,PTR_gEntityListActor_080034e4
    ldr        r2,DAT_080034e8
    mov        r3,#0x3
    ldr        r4,DAT_080034ec
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x8
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListActor_080034f0
LAB_08003438:
    mov        r3,#0x91
    strb       r3,[r5,#Actor_header_tag]
    strb       r1,[r5,#Actor_header_listIndex]
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003438
    ldr        r0,PTR_gBitsetActor_080034f4
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        {pc}


@@ Calculates occlusion and visibility for sprites attached to Actor objects.
_ts Actor_LoadAll
    push       {lr}
    mov        r0,#0x8
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListActor_080034f8
LAB_08003458:
    ldrb       r2,[r5,#Actor_header_entityFlags]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_0800347e
    push       {r0,r1,r5}
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x1
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_080034fc
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x90
    bl         Sprite_AddSpriteToOam
    pop        {r0,r1,r5}
    b          LAB_08003498
LAB_0800347e:
    add        r4,r5,#0x0
    add        r4,#0x90
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08003498
    push       {r0,r1,r5}
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        {r0,r1,r5}
LAB_08003498:
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003458
    pop        {pc}


@@ Clears tileset headers from all sprites associated with Actor objects.
_ts Actor_UnloadAll
    mov        r0,#0x0
    ldr        r5,PTR_gEntityListActor_08003500
LAB_080034a8:
    add        r1,r5,#0x0
    add        r1,#0x90
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xc0
    add        r0,#0x1
    cmp        r0,#0x8
    blt        LAB_080034a8
    mov        pc,lr

    .align 2, 0

PTR_gBitsetActor_080034bc:              .word gBitsetActor
DAT_080034c0:                           .word 0x80000000
PTR_gEntityListActor_080034c4:          .word gEntityListActor
PTR_gFadeSettings_080034c8:             .word gFadeSettings
PTR_gBitsetActor_080034cc:              .word gBitsetActor
PTR_gEntityListActor_080034d0:          .word gEntityListActor
PTR_PTR_Routine_Player_1_080034d4:      .word listHandlerActor
PTR_gEntityListActor_080034d8:          .word gEntityListActor
DAT_080034dc:                           .word 0x600
PTR_gFillValue_080034e0:                .word gFillValue
PTR_gEntityListActor_080034e4:          .word gEntityListActor
DAT_080034e8:                           .word 0x180
DAT_080034ec:                           .word 0x85000000
PTR_gEntityListActor_080034f0:          .word gEntityListActor
PTR_gBitsetActor_080034f4:              .word gBitsetActor
PTR_gEntityListActor_080034f8:          .word gEntityListActor
PTR_SpriteFrame_LoadTileset_1_080034fc: .word SpriteFrame_LoadTileset_far
PTR_gEntityListActor_08003500:          .word gEntityListActor
