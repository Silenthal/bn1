#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listHandlerAttack:
    .word Attack_AnimationOnly
    .word Attack_IceManBeetankBomb
    .word Attack_WoodTower
    .word Attack_Sword
    .word Attack_Cannon
    .word Attack_Unk05
    .word Attack_Unk06
    .word Attack_MetGuard
    .word Attack_Aura
    .word Attack_Unk09
    .word Attack_Bomb
    .word Attack_Charging
    .word Attack_Shotgun
    .word Attack_BurnerBomb
    .word Attack_Shockwave
    .word Attack_Unk0F
    .word Attack_Tower
    .word Attack_FireArm
    .word Attack_Buster
    .word Attack_ShotgunBurst
    .word Attack_Meteor
    .word Attack_Meteor_Fire
    .word Attack_PoweredCannon
    .word Attack_Steal
    .word Attack_QuickAttack
    .word Attack_SharpStrike
    .word Attack_CanodumbTarget
    .word Attack_Howitzer
    .word Attack_Seed
    .word Attack_NumberBall
    .word Attack_TimeBomb
    .word Attack_SwordySlash
    .word Attack_DieBomb
    .word Attack_PuffyBubble
    .word Attack_Arrow
    .word Attack_Quake
    .word Attack_Cloudy
    .word Attack_Cube
    .word Attack_Stone
    .word Attack_StoneManLaser
    .word Attack_DieBomb_Chip
    .word Attack_FloshellShield
    .word Attack_FloshellMiniBomb
    .word Attack_IceManSpikes
    .word Attack_Wave
    .word Attack_Ratton
    .word Attack_MagicFire
    .word Attack_BoneCrush
    .word Attack_Skull
    .word Attack_ColorManBall
    .word Attack_SparkStrike
    .word Attack_ColumnCurrentH
    .word Attack_ColumnCurrentV
    .word Attack_Mine
    .word Attack_AmmoniculeBubbleWrap
    .word Attack_ProgThunder
    .word Attack_Thunder
    .word Attack_Remobit
    .word Attack_MegalianHead
    .word Attack_Anubis
    .word Attack_Candle
    .word Attack_IronShield
    .word Attack_Remobit_Chip
    .word Attack_BodyBurn
    .word Attack_Battery
    .word Attack_BigStraight
    .word Attack_Tornado
    .word Attack_Tornado_Chip
    .word Attack_BombManBomb
    .word Attack_LifeVirusSword
    .word Attack_LifeVirusMeteorExplosion
    .word Attack_Scuttlest
    .word Attack_Sarcophagus
    .word Attack_PharaohTrap
    .word Attack_Dynamyte
    .word Attack_Bakufu
    .word Attack_Shuriken
    .word Attack_Bunshin
    .word Attack_SnakeEgg
    .word Attack_AirBurst
    .word Attack_GaiaExplosion
    .word Attack_BassExplosionYellow
    .word Attack_BassExplosionBlue
    .word Attack_LockonTarget
    .word Attack_PharaohManCoffin
    .word Attack_Shuriken_Chip
    .word Attack_MagicFire_Chip
    .word Attack_BombShoot
    .word Attack_BassExplosion_Chip
    .word Attack_LockOn
    .word Attack_BloodSuckSyringe
    .word Attack_MoleHole

_ts Attack_Alloc
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetAttack_080037e4
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_080037e8
    ldr        r5,PTR_gEntityListAttack_080037ec
    ldr        r3,PTR_gCurMapEventData_080037f0
LAB_08003680:
    tst        r2,r1
    beq        LAB_0800368e
    lsr        r1,r1,#0x1
    add        r5,#0xb0
    cmp        r5,r3
    bge        LAB_080036b4
    b          LAB_08003680
LAB_0800368e:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r0,r5
    mov        r1,#0x7c
    mov        r2,#0x0
    bl         memset_8
    mov        r0,#0x9
    strb       r0,[r5,#Attack_header_entityFlags]
    pop        { r0, r1, r2, r3, r4 }
    strb       r0,[r5,#Attack_header_routineType]
    str        r1,[r5,#Attack_pos_curr_x]
    str        r2,[r5,#Attack_pos_curr_y]
    str        r3,[r5,#Attack_pos_curr_z]
    str        r4,[r5,#Attack_family_family]
    mov        r0,#0x0
    str        r0,[r5,#Attack_state_s0]
    pop        { pc }
LAB_080036b4:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }

_ts Attack_Free
    push       { lr }
    ldr        r0,DAT_080037e8
    ldrb       r1,[r5,#Attack_header_listIndex]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetAttack_080037f4
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#Attack_header_entityFlags]
    bl         SpritePtr_AffineFree
    pop        { pc }

_ts Attack_UpdateAll
    push       { lr }
    ldr        r5,PTR_gEntityListAttack_080037f8
LAB_080036d8:
    mov        r1,#0x1
    ldrb       r0,[r5,#Attack_header_entityFlags]
    tst        r0,r1
    beq        LAB_0800370e
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080036f0
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_0800370e
LAB_080036f0:
    LoadMain screenDim, r7, r7
    ldrb       r1,[r7,#0x7]
    tst        r1,r1
    beq        LAB_08003700
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_0800370e
LAB_08003700:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_listHandlerAttack_080037fc
    ldrb       r1,[r5,#Attack_header_routineType]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_0800370e:
    LoadMain battle, r7, r7
    ldrb       r1,[r7,#0x18]
    tst        r1,r1
    bne        LAB_0800372c
    LoadMain screenDim, r6, r6
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_0800372c
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_0800372c
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_0800372c:
    add        r5,#0xb0
    ldr        r0,PTR_gEntityListAttack_08003800
    ldr        r1,INT_08003804
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_0800373a
    b          LAB_080036d8
LAB_0800373a:
    LoadMain world, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }

_ts Attack_Init
    push       { lr }
    ldr        r0,PTR_gFillValue_08003808
    ldr        r1,PTR_gEntityListAttack_0800380c
    ldr        r2,DAT_08003810
    mov        r3,#0x3
    ldr        r4,DAT_08003814
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListAttack_08003818
LAB_08003760:
    mov        r3,#0x82
    strb       r3,[r5,#Attack_header_tag]
    strb       r1,[r5,#Attack_header_listIndex]
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003760
    ldr        r0,PTR_gBitsetAttack_0800381c
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }

_ts Attack_LoadAll
    push       { lr }
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListAttack_08003820
LAB_08003780:
    ldrb       r2,[r5,#Attack_header_entityFlags]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_080037a6
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x2
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_08003824
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x80
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_080037c0
LAB_080037a6:
    add        r4,r5,#0x0
    add        r4,#0x80
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_080037c0
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_080037c0:
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003780
    pop        { pc }

_ts Attack_UnloadAll
    mov        r0,#0x20
    ldr        r5,PTR_gEntityListAttack_08003828
LAB_080037d0:
    add        r1,r5,#0x0
    add        r1,#0x80
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xb0
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_080037d0
    mov        pc,lr

    .align 2, 0

PTR_gBitsetAttack_080037e4:             .word gBitsetAttack
DAT_080037e8:                           .word 0x80000000
PTR_gEntityListAttack_080037ec:         .word gEntityListAttack
PTR_gCurMapEventData_080037f0:          .word gCurMapEventData
PTR_gBitsetAttack_080037f4:             .word gBitsetAttack
PTR_gEntityListAttack_080037f8:         .word gEntityListAttack
PTR_listHandlerAttack_080037fc:         .word listHandlerAttack
PTR_gEntityListAttack_08003800:         .word gEntityListAttack
INT_08003804:                           .word 0x1600
PTR_gFillValue_08003808:                .word gFillValue
PTR_gEntityListAttack_0800380c:         .word gEntityListAttack
DAT_08003810:                           .word 0x580
DAT_08003814:                           .word 0x85000000
PTR_gEntityListAttack_08003818:         .word gEntityListAttack
PTR_gBitsetAttack_0800381c:             .word gBitsetAttack
PTR_gEntityListAttack_08003820:         .word gEntityListAttack
PTR_SpriteFrame_LoadTileset_1_08003824: .word SpriteFrame_LoadTileset_far
PTR_gEntityListAttack_08003828:         .word gEntityListAttack
