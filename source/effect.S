#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


listHandlerEffect:
    .word Effect_QuickEffect
    .word Effect_MapObject
    .word Effect_BattleHP
    .word Effect_Unk03
    .word Effect_BombExplosion
    .word Effect_Tower
    .word Effect_Unk06
    .word Effect_SwordSlash
    .word Effect_FireColumn
    .word Effect_BattleChip
    .word Effect_TallExplosion
    .word Effect_WaterSpray
    .word Effect_ProgramAdvance
    .word Effect_MegaManDelete
    .word Effect_VirusDelete
    .word Effect_BattleResult
    .word Effect_WWWGate
    .word Effect_DieBombExplosion
    .word Effect_CloudyRain
    .word Effect_StonePiece
    .word Effect_Laser
    .word Effect_Boulders
    .word Effect_TeleportPortal
    .word Effect_CubeBreak
    .word Effect_JellyCharging
    .word Effect_AirBlowing
    .word Effect_TrafficLight
    .word Effect_TrafficBarrier
    .word Effect_Car
    .word Effect_TrafficBarrier_2
    .word Effect_TrafficLight_2
    .word Effect_Traffic
    .word Effect_TrafficExplosion
    .word Effect_TrafficCarParts
    .word Effect_TrafficLightToggle
    .word Effect_Pipe
    .word Effect_Pipe_2
    .word Effect_Pipe_3
    .word Effect_Nonstop_Bus
    .word Effect_ElectricField
    .word Effect_FloorBreak
    .word Effect_ColorMan
    .word Effect_RemobitThunder
    .word Effect_Chaud
    .word Effect_PoisonCloud
    .word Effect_TrafficSwitch
    .word Effect_CountZap
    .word Effect_ElecMan
    .word Effect_BarSwitch
    .word Effect_LightBulb
    .word Effect_RollHeart
    .word Effect_SmallElectrified
    .word Effect_BombManBombExplosion
    .word Effect_LifeVirusSeed
    .word Effect_BombMan
    .word Effect_LiveVirusAura
    .word Effect_WWWPass
    .word Effect_Scuttlest
    .word Effect_LifeVirusMeteor
    .word Effect_MagicMan
    .word Effect_LockProgram
    .word Effect_WWWIceWall
    .word Effect_WWWBoulder
    .word Effect_GutsMan
    .word Effect_DynamyteRedDot
    .word Effect_PharaohMan_Curse
    .word Effect_DynamyteExplosion
    .word Effect_MegaMan
    .word Effect_JackIn
    .word Effect_Sparks
    .word Effect_Bass
    .word Effect_GaiaBase
    .word Effect_GeneratorLightning
    .word Effect_PharaohManLaser
    .word Effect_BombShootExplosion
    .word Effect_NaviDelete

_ts Effect_Alloc
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetEffect_08003acc
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_08003ad0
    ldr        r5,PTR_gEntityListEffect_08003ad4
    ldr        r3,PTR_Struct_20062d0_Sized_08003ad8
LAB_08003968:
    tst        r2,r1
    beq        LAB_08003976
    lsr        r1,r1,#0x1
    add        r5,#0xb0
    cmp        r5,r3
    bge        LAB_0800399c
    b          LAB_08003968
LAB_08003976:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r0,r5
    mov        r1,#0x7c
    mov        r2,#0x0
    bl         memset_8
    mov        r0,#0x9
    strb       r0,[r5,#Effect_header_entityFlags]
    pop        { r0, r1, r2, r3, r4 }
    strb       r0,[r5,#Effect_header_routineType]
    str        r1,[r5,#Effect_pos_curr_x]
    str        r2,[r5,#Effect_pos_curr_y]
    str        r3,[r5,#Effect_pos_curr_z]
    str        r4,[r5,#Effect_family_family]
    mov        r0,#0x0
    str        r0,[r5,#Effect_state_s0]
    pop        { pc }
LAB_0800399c:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }

_ts Effect_Free
    push       { lr }
    ldr        r0,DAT_08003ad0
    ldrb       r1,[r5,#Effect_header_listIndex]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetEffect_08003adc
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#Effect_header_entityFlags]
    bl         SpritePtr_AffineFree
    pop        { pc }

_ts Effect_UpdateAll
    push       { lr }
    ldr        r5,PTR_gEntityListEffect_08003ae0
LAB_080039c0:
    mov        r1,#0x1
    ldrb       r0,[r5,#Effect_header_entityFlags]
    tst        r0,r1
    beq        LAB_080039f6
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080039d8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080039f6
LAB_080039d8:
    LoadMain screenDim, r7, r7
    ldrb       r1,[r7,#0x7]
    tst        r1,r1
    beq        LAB_080039e8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080039f6
LAB_080039e8:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_listHandlerEffect_08003ae4
    ldrb       r1,[r5,#Effect_header_routineType]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_080039f6:
    LoadMain battle, r7, r7
    ldrb       r1,[r7,#0x18]
    tst        r1,r1
    bne        LAB_08003a14
    LoadMain screenDim, r6, r6
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_08003a14
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_08003a14
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_08003a14:
    add        r5,#0xb0
    ldr        r0,PTR_gEntityListEffect_08003ae8
    ldr        r1,INT_08003aec
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003a22
    b          LAB_080039c0
LAB_08003a22:
    LoadMain world, r7, r7
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }

_ts Effect_Init
    push       { lr }
    ldr        r0,PTR_gFillValue_08003af0
    ldr        r1,PTR_gEntityListEffect_08003af4
    ldr        r2,DAT_08003af8
    mov        r3,#0x3
    ldr        r4,DAT_08003afc
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListEffect_08003b00
LAB_08003a48:
    mov        r3,#0x83
    strb       r3,[r5,#Effect_header_tag]
    strb       r1,[r5,#Effect_header_listIndex]
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003a48
    ldr        r0,PTR_gBitsetEffect_08003b04
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }

_ts Effect_LoadAll
    push       { lr }
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListEffect_08003b08
LAB_08003a68:
    ldrb       r2,[r5,#Effect_header_entityFlags]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08003a8e
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x3
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_08003b0c
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x80
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_08003aa8
LAB_08003a8e:
    add        r4,r5,#0x0
    add        r4,#0x80
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08003aa8
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_08003aa8:
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003a68
    pop        { pc }

_ts Effect_UnloadAll
    mov        r0,#0x0
    ldr        r5,PTR_gEntityListEffect_08003b10
LAB_08003ab8:
    add        r1,r5,#0x0
    add        r1,#0x80
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xb0
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_08003ab8
    mov        pc,lr

    .align 2, 0

PTR_gBitsetEffect_08003acc:             .word gBitsetEffect
DAT_08003ad0:                           .word 0x80000000
PTR_gEntityListEffect_08003ad4:               .word gEntityListEffect
PTR_Struct_20062d0_Sized_08003ad8:      .word 0x20062d0
PTR_gBitsetEffect_08003adc:             .word gBitsetEffect
PTR_gEntityListEffect_08003ae0:               .word gEntityListEffect
PTR_listHandlerEffect_08003ae4:         .word listHandlerEffect
PTR_gEntityListEffect_08003ae8:               .word gEntityListEffect
INT_08003aec:                           .word 0x1600
PTR_gFillValue_08003af0:                .word gFillValue
PTR_gEntityListEffect_08003af4:               .word gEntityListEffect
DAT_08003af8:                           .word 0x580
DAT_08003afc:                           .word 0x85000000
PTR_gEntityListEffect_08003b00:               .word gEntityListEffect
PTR_gBitsetEffect_08003b04:             .word gBitsetEffect
PTR_gEntityListEffect_08003b08:               .word gEntityListEffect
PTR_SpriteFrame_LoadTileset_1_08003b0c: .word SpriteFrame_LoadTileset_far
PTR_gEntityListEffect_08003b10:               .word gEntityListEffect
