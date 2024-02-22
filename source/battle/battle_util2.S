#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

.set Inventory_SetChecksum, 0x801b0d4
.set FUN_0801b0f0, 0x801b0f0

_ts Battle_IsActive
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x1
    ldrb       r1,[r7,#0xf]
    cmp        r1,#0x8
    blt        LAB_08007c3c
    ldrb       r0,[r5,#0x1f]
LAB_08007c3c:
    pop        {pc}


_nt GetToggledKeys
    mvn        r2,r1
    and        r2,r0
    mov        pc,lr


_ts Battle_InitChipDeck
    push       { r5, lr }
    mov        r0,#0x0
    ldr        r7,=gBattleFolder
LAB_08007c4a:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_08007c4a
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x11]
    tst        r1,r1
    beq        LAB_08007c66
    ldr        r0,=gBattleFolder
    mov        r1,#0x1e
    mov        r2,#0x3c
    bl         ArrayShuffle
LAB_08007c66:
    pop        { r5, pc }

    .pool

_ts Inventory_InitDefaultChipFolder
    push       { lr }
    ldr        r0,PTR_folderSrcInitialFolder_08007c9c
    ldr        r1,PTR_gFolder_08007ca0
    mov        r2,#0x3c
    bl         memcpy_32
    ldr        r0,PTR_gBattleChipInventory_08007ca4
    ldr        r1,INT_08007d5c
    bl         memset0_32
    mov        r4,#0x0
    ldr        r6,PTR_folderSrcInitialFolder_08007c9c
LAB_08007c84:
    push       { r4, r6 }
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    mov        r2,#0x1
    bl         Inventory_AddChip
    pop        { r4, r6 }
    add        r6,#0x2
    add        r4,#0x1
    cmp        r4,#0x1e
    bmi        LAB_08007c84
    pop        { pc }

PTR_folderSrcInitialFolder_08007c9c:    .word folderSrcInitialFolder
PTR_gFolder_08007ca0:                   .word gFolder
PTR_gBattleChipInventory_08007ca4:      .word gBattleChipInventory

folderSrcInitialFolder:
    battlechip Cannon A
    battlechip Cannon A
    battlechip Cannon B
    battlechip Cannon B
    battlechip Shotgun N
    battlechip Shotgun N
    battlechip Shotgun N
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip CrossGun J
    battlechip CrossGun J
    battlechip CrossGun J
    battlechip MiniBomb C
    battlechip MiniBomb C
    battlechip MiniBomb L
    battlechip MiniBomb L
    battlechip Sword S
    battlechip Sword S
    battlechip Sword S
    battlechip Sword S
    battlechip WideSwrd S
    battlechip X_Panel1 L
    battlechip X_Panel1 L
    battlechip Recov10 A
    battlechip Recov10 A
    battlechip Recov10 A
    battlechip Recov10 L
    battlechip Recov10 L
    battlechip Steal S
    battlechip Escape F

BattleChip_ARRAY_08007ce4:
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Cannon A
    battlechip MiniBomb L
    battlechip Cannon A
    battlechip Shotgun N
    battlechip CrossGun J
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L
    battlechip Steal S
    battlechip WideSwrd S
    battlechip Cannon A
    battlechip Shotgun N
    battlechip MiniBomb L

INT_08007d5c: .word 0xF00

_ts BattleChip_GetChipData
    mov        r1,#0x1c
    mul        r0,r1
    ldr        r1,=dataChipDetailList
    add        r0,r0,r1
    mov        pc,lr

    .align 2, 0
    .pool

dataChipDetailList:
    @ 0: Buster
        nocodes
        element None
        family 1, 0
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 9999
        .byte 0x0, 0x50
        chip_icon 0
        chip_art 0
    @ 1: Cannon
        codes A, B, C, D, E
        element None
        family 2, 0
        rarity 1
        library 1
        .byte 0x18, 0x0
        damage 40
        .byte 0x99, 0x1
        chip_icon 1
        chip_art 1
    @ 2: HiCannon
        codes F, G, H, I, J
        element None
        family 2, 1
        rarity 2
        library 2
        .byte 0x44, 0x0
        damage 80
        .byte 0x0, 0x50
        chip_icon 2
        chip_art 2
    @ 3: M_Cannon
        codes K, L, M, N, O
        element None
        family 2, 2
        rarity 3
        library 3
        .byte 0x5D, 0x0
        damage 120
        .byte 0x0, 0x50
        chip_icon 3
        chip_art 3
    @ 4: Sword
        codes B, K, L, P, S
        element None
        family 3, 0
        rarity 1
        library 13
        .byte 0x9D, 0x0
        damage 80
        .byte 0x0, 0x1
        chip_icon 4
        chip_art 4
    @ 5: WideSwrd
        codes C, K, M, N, S
        element None
        family 3, 1
        rarity 1
        library 14
        .byte 0xA9, 0x0
        damage 80
        .byte 0x0, 0x50
        chip_icon 5
        chip_art 5
    @ 6: LongSwrd
        codes D, E, N, O, S
        element None
        family 3, 2
        rarity 2
        library 15
        .byte 0x59, 0x0
        damage 80
        .byte 0x0, 0x50
        chip_icon 6
        chip_art 6
    @ 7: LilBomb
        codes B, D, G, O, T
        element None
        family 4, 0
        rarity 1
        library 10
        .byte 0x55, 0x0
        damage 50
        .byte 0x99, 0x1
        chip_icon 7
        chip_art 7
    @ 8: CrosBomb
        codes B, D, H, J, L
        element None
        family 4, 1
        rarity 2
        library 11
        .byte 0x1F, 0x0
        damage 70
        .byte 0x0, 0x50
        chip_icon 8
        chip_art 8
    @ 9: BigBomb
        codes B, G, O, S, T
        element None
        family 4, 2
        rarity 4
        library 12
        .byte 0xA, 0x0
        damage 90
        .byte 0x0, 0x50
        chip_icon 9
        chip_art 9
    @ 10: Spreader
        codes H, I, J, K, L
        element None
        family 5, 0
        rarity 2
        library 6
        .byte 0x98, 0x0
        damage 30
        .byte 0x99, 0x1
        chip_icon 10
        chip_art 10
    @ 11: Bubbler
        codes A, K, L, P, S
        element Water
        family 5, 1
        rarity 1
        library 7
        .byte 0x14, 0x0
        damage 50
        .byte 0x0, 0x50
        chip_icon 11
        chip_art 11
    @ 12: Heater
        codes C, F, G, K, O
        element Fire
        family 5, 2
        rarity 2
        library 8
        .byte 0x42, 0x0
        damage 70
        .byte 0x0, 0x50
        chip_icon 12
        chip_art 12
    @ 13: MiniBomb
        codes C, E, J, L, P
        element None
        family 4, 3
        rarity 1
        library 9
        .byte 0x62, 0x0
        damage 50
        .byte 0x0, 0x50
        chip_icon 13
        chip_art 13
    @ 14: Shotgun
        codes K, M, N, Q, R
        element None
        family 5, 3
        rarity 1
        library 4
        .byte 0x8F, 0x0
        damage 30
        .byte 0x0, 0x50
        chip_icon 14
        chip_art 14
    @ 15: CrossGun
        codes C, E, F, J, K
        element None
        family 5, 4
        rarity 1
        library 5
        .byte 0x20, 0x0
        damage 30
        .byte 0x0, 0x50
        chip_icon 15
        chip_art 15
    @ 16: ShokWave
        codes C, K, L, N, P
        element None
        family 8, 0
        rarity 1
        library 23
        .byte 0x8E, 0x0
        damage 60
        .byte 0x99, 0x1
        chip_icon 16
        chip_art 16
    @ 17: SoniWave
        codes C, D, J, M, S
        element None
        family 8, 1
        rarity 2
        library 24
        .byte 0x97, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 17
        chip_art 17
    @ 18: DynaWave
        codes C, E, M, S, R
        element None
        family 8, 2
        rarity 3
        library 25
        .byte 0x2A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 18
        chip_art 18
    @ 19: FireTowr
        codes E, F, L, M, T
        element Fire
        family 9, 0
        rarity 2
        library 26
        .byte 0x35, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 19
        chip_art 19
    @ 20: AquaTowr
        codes A, C, G, H, R
        element Water
        family 9, 1
        rarity 2
        library 27
        .byte 0x4, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 20
        chip_art 20
    @ 21: WoodTowr
        codes B, C, H, K, N
        element Wood
        family 9, 2
        rarity 2
        library 28
        .byte 0xAE, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 21
        chip_art 21
    @ 22: Quake1
        codes A, E, H, K, Q
        element None
        family 4, 5
        rarity 1
        library 29
        .byte 0x6E, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 22
        chip_art 22
    @ 23: Quake2
        codes B, C, I, K, Q
        element None
        family 4, 6
        rarity 2
        library 30
        .byte 0x6F, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 23
        chip_art 23
    @ 24: Quake3
        codes C, D, H, M, Q
        element None
        family 4, 7
        rarity 3
        library 31
        .byte 0x70, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 24
        chip_art 24
    @ 25: FireSwrd
        codes B, F, G, N, P
        element Fire
        family 3, 3
        rarity 2
        library 19
        .byte 0x34, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 25
        chip_art 25
    @ 26: ElecSwrd
        codes E, G, L, O, S
        element Elec
        family 3, 4
        rarity 3
        library 21
        .byte 0x2E, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 26
        chip_art 26
    @ 27: AquaSwrd
        codes A, M, N, O, P
        element Water
        family 3, 5
        rarity 3
        library 20
        .byte 0x3, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 27
        chip_art 27
    @ 28: GutsPnch
        codes B, H, M, N, T
        element None
        family 9, 3
        rarity 1
        library 32
        .byte 0x40, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 28
        chip_art 28
    @ 29: IcePunch
        codes B, H, M, N, T
        element Water
        family 9, 4
        rarity 2
        library 33
        .byte 0x4B, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 29
        chip_art 29
    @ 30: FtrSword
        codes B, K, L, P, S
        element None
        family 3, 6
        rarity 3
        library 16
        .byte 0x37, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 30
        chip_art 30
    @ 31: Dash
        codes B, D, G, L, O
        element None
        family 19, 0
        rarity 1
        library 34
        .byte 0x22, 0x0
        damage 50
        .byte 0xCC, 0x0
        chip_icon 31
        chip_art 31
    @ 32: KngtSwrd
        codes B, C, E, G, H
        element None
        family 3, 7
        rarity 4
        library 17
        .byte 0x52, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 32
        chip_art 32
    @ 33: HeroSwrd
        codes B, D, F, I, J
        element None
        family 3, 8
        rarity 5
        library 18
        .byte 0x43, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 33
        chip_art 33
    @ 34: MetGuard
        codes A, C, E, G, L
        element None
        family 6, 0
        rarity 1
        library 67
        .byte 0x5E, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 34
        chip_art 34
    @ 35: $23
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 35
        chip_art 0
    @ 36: $24
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 36
        chip_art 0
    @ 37: TriArrow
        codes A, B, C, D, E
        element None
        family 17, 0
        rarity 1
        library 36
        .byte 0xA4, 0x0
        damage 40
        .byte 0xCC, 0x0
        chip_icon 37
        chip_art 35
    @ 38: TriSpear
        codes F, G, H, I, J
        element None
        family 17, 1
        rarity 2
        library 37
        .byte 0xA6, 0x0
        damage 50
        .byte 0xCC, 0x0
        chip_icon 38
        chip_art 36
    @ 39: TriLance
        codes K, L, M, N, O
        element None
        family 17, 2
        rarity 4
        library 38
        .byte 0xA5, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 39
        chip_art 37
    @ 40: Typhoon
        codes A, B, D, E, G
        element None
        family 28, 0
        rarity 1
        library 54
        .byte 0xA7, 0x0
        damage 30
        .byte 0xCC, 0x0
        chip_icon 40
        chip_art 38
    @ 41: Huricane
        codes G, I, J, K, L
        element None
        family 28, 1
        rarity 2
        library 55
        .byte 0x46, 0x0
        damage 30
        .byte 0xCC, 0x0
        chip_icon 41
        chip_art 39
    @ 42: Cyclone
        codes E, F, G, H, I
        element None
        family 28, 2
        rarity 3
        library 56
        .byte 0x21, 0x0
        damage 30
        .byte 0xCC, 0x0
        chip_icon 42
        chip_art 40
    @ 43: Howitzer
        codes A, C, G, H, O
        element None
        family 4, 4
        rarity 4
        library 35
        .byte 0x45, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 43
        chip_art 41
    @ 44: Thunder1
        codes A, E, G, H, S
        element Elec
        family 25, 0
        rarity 1
        library 48
        .byte 0x9E, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 44
        chip_art 42
    @ 45: Thunder2
        codes B, C, F, I, L
        element Elec
        family 25, 1
        rarity 2
        library 49
        .byte 0x9F, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 45
        chip_art 43
    @ 46: Thunder3
        codes D, F, G, K, N
        element Elec
        family 25, 2
        rarity 3
        library 50
        .byte 0xA0, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 46
        chip_art 44
    @ 47: $2F
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 47
        chip_art 0
    @ 48: $30
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 48
        chip_art 0
    @ 49: Snakegg1
        codes B, E, G, M, N
        element Wood
        family 13, 36
        rarity 1
        library 57
        .byte 0x94, 0x0
        damage 130
        .byte 0xCC, 0x0
        chip_icon 49
        chip_art 45
    @ 50: Snakegg2
        codes C, E, H, N, P
        element Elec
        family 13, 37
        rarity 2
        library 58
        .byte 0x95, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 50
        chip_art 46
    @ 51: Snakegg3
        codes A, C, F, L, S
        element Fire
        family 13, 38
        rarity 3
        library 59
        .byte 0x96, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 51
        chip_art 47
    @ 52: Hammer
        codes A, F, I, M, Q
        element None
        family 18, 0
        rarity 2
        library 66
        .byte 0x41, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 52
        chip_art 48
    @ 53: $35
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 53
        chip_art 0
    @ 54: $36
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 54
        chip_art 0
    @ 55: BodyBurn
        codes E, F, K, M, N
        element Fire
        family 27, 0
        rarity 4
        library 63
        .byte 0xC, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 55
        chip_art 49
    @ 56: $38
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 56
        chip_art 0
    @ 57: $39
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 57
        chip_art 0
    @ 58: Ratton1
        codes A, B, C, D, E
        element None
        family 23, 3
        rarity 1
        library 39
        .byte 0x71, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 58
        chip_art 50
    @ 59: Ratton2
        codes F, G, H, I, J
        element None
        family 23, 4
        rarity 2
        library 40
        .byte 0x72, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 59
        chip_art 51
    @ 60: Ratton3
        codes K, L, M, N, O
        element None
        family 23, 5
        rarity 3
        library 41
        .byte 0x73, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 60
        chip_art 52
    @ 61: Lockon1
        codes C, D, H, I, L
        element None
        family 13, 42
        rarity 1
        library 98
        .byte 0x56, 0x0
        damage 10
        .byte 0xCC, 0x0
        chip_icon 61
        chip_art 53
    @ 62: Lockon2
        codes B, E, G, H, M
        element None
        family 13, 43
        rarity 2
        library 99
        .byte 0x57, 0x0
        damage 15
        .byte 0xCC, 0x0
        chip_icon 62
        chip_art 54
    @ 63: Lockon3
        codes A, D, K, N, O
        element None
        family 13, 44
        rarity 3
        library 100
        .byte 0x58, 0x0
        damage 20
        .byte 0xCC, 0x0
        chip_icon 63
        chip_art 55
    @ 64: XーPanel1
        codes B, D, G, L, S
        element None
        family 11, 0
        rarity 2
        library 64
        .byte 0xAF, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 64
        chip_art 56
    @ 65: XーPanel3
        codes B, D, G, L, S
        element None
        family 11, 1
        rarity 3
        library 65
        .byte 0xB0, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 65
        chip_art 57
    @ 66: $42
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 66
        chip_art 0
    @ 67: Recov10
        codes A, C, E, G, L
        element None
        family 12, 0
        rarity 1
        library 69
        .byte 0x74, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 67
        chip_art 58
    @ 68: Recov30
        codes A, C, E, G, L
        element None
        family 12, 1
        rarity 1
        library 70
        .byte 0x78, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 68
        chip_art 59
    @ 69: Recov50
        codes A, C, E, G, L
        element None
        family 12, 2
        rarity 1
        library 71
        .byte 0x7A, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 69
        chip_art 60
    @ 70: Recov80
        codes A, C, E, G, L
        element None
        family 12, 3
        rarity 1
        library 72
        .byte 0x7B, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 70
        chip_art 61
    @ 71: Recov120
        codes A, C, E, G, L
        element None
        family 12, 4
        rarity 2
        library 73
        .byte 0x75, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 71
        chip_art 62
    @ 72: Recov150
        codes A, C, E, G, L
        element None
        family 12, 5
        rarity 2
        library 74
        .byte 0x76, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 72
        chip_art 63
    @ 73: Recov200
        codes A, C, E, G, L
        element None
        family 12, 6
        rarity 3
        library 75
        .byte 0x77, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 73
        chip_art 64
    @ 74: Recov300
        codes A, C, E, G, L
        element None
        family 12, 7
        rarity 4
        library 76
        .byte 0x79, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 74
        chip_art 65
    @ 75: $4B
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 75
        chip_art 0
    @ 76: Steal
        codes A, E, L, P, S
        element None
        family 13, 0
        rarity 3
        library 77
        .byte 0x99, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 76
        chip_art 66
    @ 77: $4D
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 10
        .byte 0xCC, 0x0
        chip_icon 77
        chip_art 0
    @ 78: $4E
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 78
        chip_art 0
    @ 79: Geddon1
        codes F, H, J, L, N
        element None
        family 22, 0
        rarity 3
        library 78
        .byte 0x3B, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 79
        chip_art 67
    @ 80: Geddon2
        codes A, B, E, I, K
        element None
        family 22, 1
        rarity 4
        library 79
        .byte 0x3C, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 80
        chip_art 68
    @ 81: $51
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 81
        chip_art 0
    @ 82: Escape
        codes F, H, J, L, N
        element None
        family 13, 1
        rarity 3
        library 80
        .byte 0x2F, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 82
        chip_art 69
    @ 83: Interupt
        codes F, H, J, L, N
        element None
        family 13, 29
        rarity 3
        library 81
        .byte 0x4C, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 83
        chip_art 70
    @ 84: LifeAura
        codes A, H, K, M, P
        element None
        family 10, 4
        rarity 5
        library 127
        .byte 0x54, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 84
        chip_art 71
    @ 85: AquaAura
        codes D, E, L, R, S
        element Water
        family 10, 5
        rarity 2
        library 124
        .byte 0x2, 0x0
        damage 0
        .byte 0x0, 0x50
        chip_icon 85
        chip_art 72
    @ 86: FireAura
        codes B, G, I, N, T
        element Fire
        family 10, 6
        rarity 3
        library 125
        .byte 0x30, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 86
        chip_art 73
    @ 87: WoodAura
        codes C, F, J, O, Q
        element Wood
        family 10, 7
        rarity 4
        library 126
        .byte 0xAA, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 87
        chip_art 74
    @ 88: Repair
        codes A, G, H, K, S
        element None
        family 13, 2
        rarity 1
        library 82
        .byte 0x80, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 88
        chip_art 75
    @ 89: $59
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 89
        chip_art 0
    @ 90: $5A
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 90
        chip_art 0
    @ 91: Cloud
        codes B, G, H, O, R
        element Water
        family 13, 16
        rarity 1
        library 86
        .byte 0x19, 0x0
        damage 30
        .byte 0xCC, 0x0
        chip_icon 91
        chip_art 76
    @ 92: Cloudier
        codes A, D, I, M, P
        element Water
        family 13, 17
        rarity 2
        library 87
        .byte 0x1B, 0x0
        damage 50
        .byte 0xCC, 0x0
        chip_icon 92
        chip_art 77
    @ 93: Cloudest
        codes C, F, J, K, O
        element Water
        family 13, 18
        rarity 3
        library 88
        .byte 0x1A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 93
        chip_art 78
    @ 94: IceCube
        codes A, C, I, L, M
        element Water
        family 13, 3
        rarity 2
        library 105
        .byte 0x47, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 94
        chip_art 79
    @ 95: RockCube
        codes B, E, G, M, O
        element None
        family 13, 4
        rarity 3
        library 106
        .byte 0x84, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 95
        chip_art 80
    @ 96: $60
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 96
        chip_art 0
    @ 97: TimeBom1
        codes E, G, J, L, Q
        element None
        family 13, 5
        rarity 2
        library 83
        .byte 0xA1, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 97
        chip_art 81
    @ 98: TimeBom2
        codes C, F, J, L, S
        element None
        family 13, 6
        rarity 3
        library 84
        .byte 0xA2, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 98
        chip_art 82
    @ 99: TimeBom3
        codes A, B, G, O, P
        element None
        family 13, 7
        rarity 4
        library 85
        .byte 0xA3, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 99
        chip_art 83
    @ 100: Invis1
        codes I, J, L, O, Q
        element None
        family 13, 8
        rarity 2
        library 113
        .byte 0x4D, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 100
        chip_art 84
    @ 101: Invis2
        codes A, C, F, J, M
        element None
        family 13, 9
        rarity 3
        library 114
        .byte 0x4E, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 101
        chip_art 85
    @ 102: Invis3
        codes B, D, H, K, N
        element None
        family 13, 10
        rarity 4
        library 115
        .byte 0x4F, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 102
        chip_art 86
    @ 103: IronBody
        codes C, D, L, Q, R
        element None
        family 13, 20
        rarity 2
        library 118
        .byte 0x50, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 103
        chip_art 87
    @ 104: $68
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 104
        chip_art 0
    @ 105: Remobit1
        codes A, C, F, N, O
        element Elec
        family 13, 26
        rarity 1
        library 95
        .byte 0x7D, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 105
        chip_art 88
    @ 106: Remobit2
        codes B, D, E, H, I
        element Elec
        family 13, 27
        rarity 1
        library 96
        .byte 0x7E, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 106
        chip_art 89
    @ 107: Remobit3
        codes G, J, K, P, Q
        element Elec
        family 13, 28
        rarity 1
        library 97
        .byte 0x7F, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 107
        chip_art 90
    @ 108: BstrGard
        codes A, G, K, N, R
        element None
        family 21, 0
        rarity 3
        library 107
        .byte 0x11, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 108
        chip_art 91
    @ 109: BstrBomb
        codes D, H, J, O, T
        element None
        family 21, 1
        rarity 4
        library 108
        .byte 0x10, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 109
        chip_art 92
    @ 110: BstrSwrd
        codes B, E, L, P, S
        element None
        family 21, 2
        rarity 4
        library 109
        .byte 0x13, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 110
        chip_art 93
    @ 111: BstrPnch
        codes C, F, I, M, Q
        element None
        family 21, 3
        rarity 4
        library 110
        .byte 0x12, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 111
        chip_art 94
    @ 112: RingZap1
        codes G, H, M, N, P
        element Elec
        family 26, 1
        rarity 1
        library 51
        .byte 0x81, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 112
        chip_art 95
    @ 113: RingZap2
        codes C, E, G, J, L
        element Elec
        family 26, 2
        rarity 2
        library 52
        .byte 0x82, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 113
        chip_art 96
    @ 114: RingZap3
        codes A, B, O, R, T
        element Elec
        family 26, 3
        rarity 3
        library 53
        .byte 0x83, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 114
        chip_art 97
    @ 115: Candle1
        codes C, F, I, P, S
        element None
        family 13, 21
        rarity 2
        library 101
        .byte 0x15, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 115
        chip_art 98
    @ 116: Candle2
        codes B, E, G, J, L
        element None
        family 13, 22
        rarity 3
        library 102
        .byte 0x16, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 116
        chip_art 99
    @ 117: Candle3
        codes A, D, H, K, M
        element None
        family 13, 23
        rarity 4
        library 103
        .byte 0x17, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 117
        chip_art 100
    @ 118: SloGauge
        codes H, K, N, O, Q
        element None
        family 13, 24
        rarity 2
        library 111
        .byte 0x93, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 118
        chip_art 101
    @ 119: FstGauge
        codes A, C, E, L, N
        element None
        family 13, 25
        rarity 2
        library 112
        .byte 0x36, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 119
        chip_art 102
    @ 120: $78
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 120
        chip_art 0
    @ 121: Drain1
        codes A, B, D, K, O
        element None
        family 13, 33
        rarity 2
        library 60
        .byte 0x23, 0x0
        damage 50
        .byte 0xCC, 0x0
        chip_icon 121
        chip_art 103
    @ 122: Drain2
        codes A, C, H, N, T
        element None
        family 13, 34
        rarity 2
        library 61
        .byte 0x24, 0x0
        damage 70
        .byte 0xCC, 0x0
        chip_icon 122
        chip_art 104
    @ 123: Drain3
        codes A, E, F, L, Q
        element None
        family 13, 35
        rarity 3
        library 62
        .byte 0x25, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 123
        chip_art 105
    @ 124: Mine1
        codes G, H, M, N, P
        element None
        family 13, 13
        rarity 2
        library 89
        .byte 0x5F, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 124
        chip_art 106
    @ 125: Mine2
        codes C, E, G, J, L
        element None
        family 13, 14
        rarity 3
        library 90
        .byte 0x60, 0x0
        damage 180
        .byte 0xCC, 0x0
        chip_icon 125
        chip_art 107
    @ 126: Mine3
        codes A, B, O, R, T
        element None
        family 13, 15
        rarity 4
        library 91
        .byte 0x61, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 126
        chip_art 108
    @ 127: Gaia1
        codes C, D, L, O, T
        element None
        family 29, 0
        rarity 3
        library 45
        .byte 0x38, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 127
        chip_art 109
    @ 128: Gaia2
        codes C, F, K, P, S
        element None
        family 29, 1
        rarity 4
        library 46
        .byte 0x39, 0x0
        damage 130
        .byte 0xCC, 0x0
        chip_icon 128
        chip_art 110
    @ 129: Gaia3
        codes C, G, M, R, T
        element None
        family 29, 2
        rarity 5
        library 47
        .byte 0x3A, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 129
        chip_art 111
    @ 130: BblWrap1
        codes C, E, G, I, M
        element Water
        family 10, 1
        rarity 2
        library 120
        .byte 0x7, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 130
        chip_art 112
    @ 131: BblWrap2
        codes D, F, H, K, N
        element Water
        family 10, 2
        rarity 2
        library 121
        .byte 0x8, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 131
        chip_art 113
    @ 132: BblWrap3
        codes A, B, L, Q, R
        element Water
        family 10, 3
        rarity 3
        library 122
        .byte 0x9, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 132
        chip_art 114
    @ 133: Wave
        codes A, D, I, L, M
        element Water
        family 23, 0
        rarity 3
        library 42
        .byte 0xA8, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 133
        chip_art 115
    @ 134: RedWave
        codes B, E, J, N, P
        element Fire
        family 23, 1
        rarity 3
        library 43
        .byte 0x7C, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 134
        chip_art 116
    @ 135: BigWave
        codes C, H, K, L, Q
        element Water
        family 23, 2
        rarity 4
        library 44
        .byte 0xB, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 135
        chip_art 117
    @ 136: Muramasa
        codes C, E, G, J, K
        element None
        family 3, 9
        rarity 5
        library 22
        .byte 0x63, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 136
        chip_art 118
    @ 137: Dropdown
        codes A, B, O, R, T
        element None
        family 13, 11
        rarity 5
        library 116
        .byte 0x26, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 137
        chip_art 119
    @ 138: Popup
        codes C, D, H, K, N
        element None
        family 13, 12
        rarity 5
        library 117
        .byte 0x6A, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 138
        chip_art 120
    @ 139: Dynamyt1
        codes B, G, O, Q, S
        element None
        family 13, 39
        rarity 3
        library 92
        .byte 0x27, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 139
        chip_art 121
    @ 140: Dynamyt2
        codes A, C, K, M, N
        element None
        family 13, 40
        rarity 3
        library 93
        .byte 0x28, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 140
        chip_art 122
    @ 141: Dynamyt3
        codes G, K, M, O, P
        element None
        family 13, 41
        rarity 3
        library 94
        .byte 0x29, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 141
        chip_art 123
    @ 142: Anubis
        codes C, L, N, Q, T
        element None
        family 13, 19
        rarity 5
        library 104
        .byte 0x1, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 142
        chip_art 124
    @ 143: $8F
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 143
        chip_art 0
    @ 144: $90
        nocodes
        element None
        family 8, 0
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 144
        chip_art 0
    @ 145: IronShld
        codes A, B, O, R, T
        element None
        family 24, 0
        rarity 2
        library 68
        .byte 0x51, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 145
        chip_art 125
    @ 146: LeafShld
        codes C, D, F, K, Q
        element Wood
        family 10, 8
        rarity 3
        library 123
        .byte 0x53, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 146
        chip_art 126
    @ 147: Barrier
        codes D, F, M, R, S
        element None
        family 10, 0
        rarity 2
        library 119
        .byte 0x5, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 147
        chip_art 127
    @ 148: PharoMan
        codes P
        element None
        family 16, 36
        rarity 5
        library 170
        .byte 0x67, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 148
        chip_art 128
    @ 149: PharoMn2
        codes P
        element None
        family 16, 37
        rarity 5
        library 171
        .byte 0x68, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 149
        chip_art 129
    @ 150: PharoMn3
        codes P
        element None
        family 16, 38
        rarity 5
        library 172
        .byte 0x69, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 150
        chip_art 130
    @ 151: ShadoMan
        codes S
        element None
        family 16, 39
        rarity 5
        library 173
        .byte 0x88, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 151
        chip_art 131
    @ 152: ShadoMn2
        codes S
        element None
        family 16, 40
        rarity 5
        library 174
        .byte 0x89, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 152
        chip_art 132
    @ 153: ShadoMn3
        codes S
        element None
        family 16, 41
        rarity 5
        library 175
        .byte 0x8A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 153
        chip_art 133
    @ 154: $9A
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 154
        chip_art 0
    @ 155: $9B
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 155
        chip_art 0
    @ 156: $9C
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 156
        chip_art 0
    @ 157: MagicMan
        codes M
        element None
        family 16, 42
        rarity 3
        library 158
        .byte 0x5A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 157
        chip_art 134
    @ 158: MagicMn2
        codes M
        element None
        family 16, 43
        rarity 4
        library 159
        .byte 0x5B, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 158
        chip_art 135
    @ 159: MagicMn3
        codes M
        element None
        family 16, 44
        rarity 5
        library 160
        .byte 0x5C, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 159
        chip_art 136
    @ 160: Roll
        codes R
        element None
        family 16, 21
        rarity 3
        library 128
        .byte 0x85, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 160
        chip_art 137
    @ 161: Roll2
        codes R
        element None
        family 16, 22
        rarity 4
        library 129
        .byte 0x86, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 161
        chip_art 138
    @ 162: Roll3
        codes R
        element None
        family 16, 23
        rarity 5
        library 130
        .byte 0x87, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 162
        chip_art 139
    @ 163: GutsMan
        codes G
        element None
        family 16, 9
        rarity 3
        library 131
        .byte 0x3D, 0x0
        damage 40
        .byte 0xCC, 0x0
        chip_icon 163
        chip_art 140
    @ 164: GutsMan2
        codes G
        element None
        family 16, 10
        rarity 4
        library 132
        .byte 0x3E, 0x0
        damage 70
        .byte 0xCC, 0x0
        chip_icon 164
        chip_art 141
    @ 165: GutsMan3
        codes G
        element None
        family 16, 11
        rarity 5
        library 133
        .byte 0x3F, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 165
        chip_art 142
    @ 166: ProtoMan
        codes B
        element None
        family 16, 27
        rarity 3
        library 134
        .byte 0x6B, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 166
        chip_art 143
    @ 167: ProtoMn2
        codes B
        element None
        family 16, 28
        rarity 4
        library 135
        .byte 0x6C, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 167
        chip_art 144
    @ 168: ProtoMn3
        codes B
        element None
        family 16, 29
        rarity 5
        library 136
        .byte 0x6D, 0x0
        damage 180
        .byte 0xCC, 0x0
        chip_icon 168
        chip_art 145
    @ 169: WoodMan
        codes W
        element Wood
        family 16, 0
        rarity 3
        library 161
        .byte 0xAB, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 169
        chip_art 146
    @ 170: WoodMan2
        codes W
        element Wood
        family 16, 1
        rarity 4
        library 162
        .byte 0xAC, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 170
        chip_art 147
    @ 171: WoodMan3
        codes W
        element Wood
        family 16, 2
        rarity 5
        library 163
        .byte 0xAD, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 171
        chip_art 148
    @ 172: FireMan
        codes F
        element Fire
        family 16, 3
        rarity 3
        library 137
        .byte 0x31, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 172
        chip_art 149
    @ 173: FireMan2
        codes F
        element Fire
        family 16, 4
        rarity 4
        library 138
        .byte 0x32, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 173
        chip_art 150
    @ 174: FireMan3
        codes F
        element Fire
        family 16, 5
        rarity 5
        library 139
        .byte 0x33, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 174
        chip_art 151
    @ 175: NumbrMan
        codes N
        element None
        family 16, 6
        rarity 3
        library 140
        .byte 0x64, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 175
        chip_art 152
    @ 176: NumbrMn2
        codes N
        element None
        family 16, 7
        rarity 4
        library 141
        .byte 0x65, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 176
        chip_art 153
    @ 177: NumbrMn3
        codes N
        element None
        family 16, 8
        rarity 5
        library 142
        .byte 0x66, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 177
        chip_art 154
    @ 178: StoneMan
        codes S
        element None
        family 16, 15
        rarity 3
        library 143
        .byte 0x9A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 178
        chip_art 155
    @ 179: StoneMn2
        codes S
        element None
        family 16, 16
        rarity 4
        library 144
        .byte 0x9B, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 179
        chip_art 156
    @ 180: StoneMn3
        codes S
        element None
        family 16, 17
        rarity 5
        library 145
        .byte 0x9C, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 180
        chip_art 157
    @ 181: IceMan
        codes I
        element Water
        family 16, 12
        rarity 3
        library 146
        .byte 0x48, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 181
        chip_art 158
    @ 182: IceMan2
        codes I
        element Water
        family 16, 13
        rarity 4
        library 147
        .byte 0x49, 0x0
        damage 80
        .byte 0xCC, 0x0
        chip_icon 182
        chip_art 159
    @ 183: IceMan3
        codes I
        element Water
        family 16, 14
        rarity 5
        library 148
        .byte 0x4A, 0x0
        damage 100
        .byte 0xCC, 0x0
        chip_icon 183
        chip_art 160
    @ 184: SkullMan
        codes S
        element None
        family 16, 18
        rarity 3
        library 164
        .byte 0x90, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 184
        chip_art 161
    @ 185: SkullMn2
        codes S
        element None
        family 16, 19
        rarity 4
        library 165
        .byte 0x91, 0x0
        damage 180
        .byte 0xCC, 0x0
        chip_icon 185
        chip_art 162
    @ 186: SkullMn3
        codes S
        element None
        family 16, 20
        rarity 5
        library 166
        .byte 0x92, 0x0
        damage 210
        .byte 0xCC, 0x0
        chip_icon 186
        chip_art 163
    @ 187: ColorMan
        codes C
        element None
        family 16, 24
        rarity 3
        library 149
        .byte 0x1C, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 187
        chip_art 164
    @ 188: ColorMn2
        codes C
        element None
        family 16, 25
        rarity 4
        library 150
        .byte 0x1D, 0x0
        damage 110
        .byte 0xCC, 0x0
        chip_icon 188
        chip_art 165
    @ 189: ColorMn3
        codes C
        element None
        family 16, 26
        rarity 5
        library 151
        .byte 0x1E, 0x0
        damage 130
        .byte 0xCC, 0x0
        chip_icon 189
        chip_art 166
    @ 190: BombMan
        codes B
        element Fire
        family 16, 45
        rarity 3
        library 155
        .byte 0xD, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 190
        chip_art 167
    @ 191: BombMan2
        codes B
        element Fire
        family 16, 46
        rarity 4
        library 156
        .byte 0xE, 0x0
        damage 140
        .byte 0xCC, 0x0
        chip_icon 191
        chip_art 168
    @ 192: BombMan3
        codes B
        element Fire
        family 16, 47
        rarity 5
        library 157
        .byte 0xF, 0x0
        damage 160
        .byte 0xCC, 0x0
        chip_icon 192
        chip_art 169
    @ 193: SharkMan
        codes S
        element Water
        family 16, 30
        rarity 3
        library 167
        .byte 0x8B, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 193
        chip_art 170
    @ 194: SharkMn2
        codes S
        element Water
        family 16, 31
        rarity 4
        library 168
        .byte 0x8C, 0x0
        damage 110
        .byte 0xCC, 0x0
        chip_icon 194
        chip_art 171
    @ 195: SharkMn3
        codes S
        element Water
        family 16, 32
        rarity 5
        library 169
        .byte 0x8D, 0x0
        damage 130
        .byte 0xCC, 0x0
        chip_icon 195
        chip_art 172
    @ 196: ElecMan
        codes E
        element Elec
        family 16, 33
        rarity 3
        library 152
        .byte 0x2B, 0x0
        damage 90
        .byte 0xCC, 0x0
        chip_icon 196
        chip_art 173
    @ 197: ElecMan2
        codes E
        element Elec
        family 16, 34
        rarity 4
        library 153
        .byte 0x2C, 0x0
        damage 120
        .byte 0xCC, 0x0
        chip_icon 197
        chip_art 174
    @ 198: ElecMan3
        codes E
        element Elec
        family 16, 35
        rarity 5
        library 154
        .byte 0x2D, 0x0
        damage 150
        .byte 0xCC, 0x0
        chip_icon 198
        chip_art 175
    @ 199: Bass
        codes F
        element None
        family 16, 48
        rarity 5
        library 176
        .byte 0x6, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 199
        chip_art 176
    @ 200: $C8
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 200
        chip_art 0
    @ 201: $C9
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 60
        .byte 0xCC, 0x0
        chip_icon 201
        chip_art 0
    @ 202: Zeta Cannon 1
        nocodes
        element None
        family 15, 0
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 202
        chip_art 0
    @ 203: Zeta Cannon 2
        nocodes
        element None
        family 15, 1
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 203
        chip_art 0
    @ 204: Zeta Cannon 3
        nocodes
        element None
        family 15, 2
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 204
        chip_art 0
    @ 205: Zeta Spread
        nocodes
        element None
        family 15, 3
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 205
        chip_art 0
    @ 206: Zeta Ratton 1
        nocodes
        element None
        family 15, 4
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 206
        chip_art 0
    @ 207: Zeta Ratton 2
        nocodes
        element None
        family 15, 5
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 207
        chip_art 0
    @ 208: Zeta Ratton 3
        nocodes
        element None
        family 15, 6
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 208
        chip_art 0
    @ 209: Zeta Arrow
        nocodes
        element None
        family 15, 7
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 209
        chip_art 0
    @ 210: Zeta Spear
        nocodes
        element None
        family 15, 8
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 210
        chip_art 0
    @ 211: Zeta Lance
        nocodes
        element None
        family 15, 9
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 211
        chip_art 0
    @ 212: Omega Cannon 1
        nocodes
        element None
        family 15, 10
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 212
        chip_art 0
    @ 213: Omega Cannon 2
        nocodes
        element None
        family 15, 11
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 213
        chip_art 0
    @ 214: Omega Cannon 3
        nocodes
        element None
        family 15, 12
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 214
        chip_art 0
    @ 215: Omega Spread
        nocodes
        element None
        family 15, 13
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 215
        chip_art 0
    @ 216: Omega Ratton 1
        nocodes
        element None
        family 15, 14
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 216
        chip_art 0
    @ 217: Omega Ratton 2
        nocodes
        element None
        family 15, 15
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 217
        chip_art 0
    @ 218: Omega Ratton 3
        nocodes
        element None
        family 15, 16
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 218
        chip_art 0
    @ 219: Omega Arrow
        nocodes
        element None
        family 15, 17
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 219
        chip_art 0
    @ 220: Omega Spear
        nocodes
        element None
        family 15, 18
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 220
        chip_art 0
    @ 221: Omega Lance
        nocodes
        element None
        family 15, 19
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 221
        chip_art 0
    @ 222: Beta Bomb
        nocodes
        element None
        family 20, 0
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 222
        chip_art 0
    @ 223: Beta Sword
        nocodes
        element None
        family 20, 1
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 223
        chip_art 0
    @ 224: Beta Wave
        nocodes
        element None
        family 20, 2
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 224
        chip_art 0
    @ 225: Beta Quake
        nocodes
        element None
        family 20, 3
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 225
        chip_art 0
    @ 226: Sigma Bomb
        nocodes
        element None
        family 20, 4
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 226
        chip_art 0
    @ 227: Sigma Sword
        nocodes
        element None
        family 20, 5
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 227
        chip_art 0
    @ 228: Sigma Wave
        nocodes
        element None
        family 20, 6
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 228
        chip_art 0
    @ 229: Sigma Quake
        nocodes
        element None
        family 20, 7
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 229
        chip_art 0
    @ 230: Powered Cannon
        nocodes
        element None
        family 14, 0
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 230
        chip_art 0
    @ 231: Heavy Stamp
        nocodes
        element None
        family 13, 47
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 400
        .byte 0xCC, 0x0
        chip_icon 231
        chip_art 0
    @ 232: Big Straight
        nocodes
        element None
        family 13, 30
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 250
        .byte 0xCC, 0x0
        chip_icon 232
        chip_art 0
    @ 233: Blood Suck
        nocodes
        element None
        family 13, 48
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 233
        chip_art 0
    @ 234: Death Storm
        nocodes
        element None
        family 13, 32
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 200
        .byte 0xCC, 0x0
        chip_icon 234
        chip_art 0
    @ 235: Guts Shoot
        nocodes
        element None
        family 13, 31
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 500
        .byte 0xCC, 0x0
        chip_icon 235
        chip_art 0
    @ 236: Life Saver
        nocodes
        element None
        family 13, 45
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 236
        chip_art 0
    @ 237: Double Hero
        nocodes
        element None
        family 13, 46
        rarity 1
        nolibrary
        .byte 0x0, 0x0
        damage 400
        .byte 0xCC, 0x0
        chip_icon 237
        chip_art 0
    @ 238: $EE
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 238
        chip_art 0
    @ 239: $EF
        nocodes
        element None
        nofamily
        norarity
        nolibrary
        .byte 0x0, 0x0
        damage 0
        .byte 0xCC, 0x0
        chip_icon 239
        chip_art 0


_ts Battle_GetEntryState
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x8]
    mov        pc,lr


_ts Battle_EntitySpriteCoordsToCell
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    pop        {pc}


_ts Battle_SpriteCoordsToCell
    push       {r5,lr}
    mov        r8,r1
    asr        r0,r0,#0x10
    add        r0,#0xa0
    mov        r1,#0x28
    bl         SWI_Div
    push       {r0}
    mov        r0,r8
    asr        r0,r0,#0x10
    add        r0,#0x30
    mov        r1,#0x18
    bl         SWI_Div
    add        r1,r0,#0x0
    pop        {r0}
    pop        {r5,pc}


_nt Battle_CellCoordsToSprite
    push       {lr}
    mov        r2,#0x28
    lsl        r0,r0,#0x18
    asr        r0,r0,#0x18
    mul        r0,r2
    lsl        r0,r0,#0x10
    mov        r2,#0x18
    lsl        r1,r1,#0x18
    asr        r1,r1,#0x18
    mul        r1,r2
    lsl        r1,r1,#0x10
    ldr        r2,=f(-140)
    add        r0,r0,r2
    ldr        r2,=f(-36)
    add        r1,r1,r2
    pop        {pc}

    .align 2, 0
    .pool


_nt Battle_AddObject
    push       {r5,lr}
    mov        r7,#0xff
    and        r1,r7
    lsl        r4,r4,#0xe
    orr        r1,r4
    and        r2,r7
    lsl        r5,r5,#0xe
    orr        r2,r5
    lsl        r1,r1,#0x10
    orr        r2,r1
    lsl        r6,r6,#0xa
    lsl        r3,r3,#0xc
    orr        r3,r6
    orr        r0,r3
    add        r1,r0,#0x0
    add        r0,r2,#0x0
    mov        r2,#0x0
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5,pc}


_nt Battle_PriorityQueueIsEntityNext
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r3,#0x4c
    mov        r2,#0x0
    ldrb       r0,[r7,r3]
    ldrb       r1,[r5,#0x12]
    cmp        r0,r1
    bne        LAB_0800984e
    mov        r2,#0x1
LAB_0800984e:
    add        r0,r2,#0x0
    pop        {pc}


_nt Battle_PriorityQueueEnqueue
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x4c
    add        r7,r7,r0
    ldrb       r2,[r5,#0x12]
    mov        r0,#0x0
LAB_0800985e:
    ldrb       r1,[r7,r0]
    cmp        r1,r2
    beq        LAB_08009872
    cmp        r1,#0xff
    bne        LAB_0800986c
    strb       r2,[r7,r0]
    b          LAB_08009876
LAB_0800986c:
    add        r0,#0x1
    cmp        r0,#0x8
    bne        LAB_0800985e
LAB_08009872:
    mov        r0,#0x0
    mov        pc,lr
LAB_08009876:
    mov        r0,#0x1
    mov        pc,lr


_nt Battle_PriorityQueueRemove
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x4c
    add        r7,r7,r0
    ldrb       r2,[r5,#0x12]
    mov        r0,#0x0
LAB_08009888:
    ldrb       r1,[r7,r0]
    cmp        r2,r1
    bne        LAB_08009892
    mov        r1,#0xff
    strb       r1,[r7,r0]
LAB_08009892:
    add        r0,#0x1
    cmp        r0,#0x8
    bne        LAB_08009888
    bl         Battle_PriorityQueueMinimize
    pop        {pc}


_nt Battle_PriorityQueueMinimize
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x4c
    add        r7,r7,r0
    add        r6,r7,#0x0
    mov        r4,#0x8
    add        r4,r4,r7
    mov        r0,#0x0
LAB_080098ae:
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_080098b8
    strb       r0,[r6,#0x0]
    add        r6,#0x1
LAB_080098b8:
    add        r7,#0x1
    cmp        r7,r4
    bne        LAB_080098ae
LAB_080098be:
    cmp        r6,r4
    beq        LAB_080098ca
    mov        r0,#0xff
    strb       r0,[r6,#0x0]
    add        r6,#0x1
    b          LAB_080098be
LAB_080098ca:
    mov        pc,lr


_nt Battle_GetRandomEncounter
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    str        r0,[r7,#0x2c]
    pop        {pc}


_nt Battle_IsRandomEncounter
    push       {lr}
    mov        r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r6,r10
    ldr        r6,[r6,#0x78]
    ldrb       r3,[r7,#0x4]
    cmp        r3,#0x80
    bmi        LAB_0800992a
    @ Only continue if the area is one that has random encounters
    sub        r3,#0x80
    ldr        r1,[r6,#0x24]
    ldr        r2,[r6,#0x28]
    sub        r1,r1,r2
    cmp        r1,#0x40
    bmi        LAB_0800992a
    @ Only continue if at least 64 steps have been taken since the 
    add        r1,r1,r2
    str        r1,[r6,#0x28]
    ldrb       r2,[r7,#0x5]
    lsl        r3,r3,#0x4
    add        r3,r3,r2
    ldr        r4,PTR_tblAreaToEncounterSensitivity_08009930
    ldrb       r2,[r4,r3]
    ldr        r3,[r6,#0x24]
    lsr        r3,r3,#0x6
    cmp        r3,#0x11
    bmi        LAB_0800990c
    mov        r3,#0x10
LAB_0800990c:
    ldr        r4,PTR_tblStepUnitsToThresholds_0800992c
    lsl        r3,r3,#0x3
    add        r4,r4,r3
    ldrb       r3,[r4,r2]
    push       {r0,r3,r7}
    bl         Rng_RandomUint
    add        r2,r0,#0x0
    pop        {r0,r3,r7}
    mov        r1,#0x1f
    and        r2,r1
    cmp        r2,r3
    bge        LAB_0800992a
    mov        r0,#0x1
    pop        {pc}
LAB_0800992a:
    pop        {pc}
PTR_tblStepUnitsToThresholds_0800992c: .word tblStepUnitsToThresholds
PTR_tblAreaToEncounterSensitivity_08009930: .word tblAreaToEncounterSensitivity
tblStepUnitsToThresholds:
    @ 0
    .byte 0x0,  0x0,  0x0,  0x0
    .byte 0x0,  0x0,  0x0,  0x0
    @ 1
    .byte 0x1,  0x0,  0x0,  0x0
    .byte 0x0,  0x0,  0x0,  0x0
    @ 2
    .byte 0x2,  0x1,  0x0,  0x0
    .byte 0x0,  0x0,  0x0,  0x0
    @ 3
    .byte 0x3,  0x2,  0x1,  0x0
    .byte 0x0,  0x0,  0x0,  0x0
    @ 4
    .byte 0x4,  0x3,  0x2,  0x1
    .byte 0x0,  0x0,  0x0,  0x0
    @ 5
    .byte 0x5,  0x4,  0x3,  0x2
    .byte 0x1,  0x0,  0x0,  0x0
    @ 6
    .byte 0x6,  0x5,  0x4,  0x3
    .byte 0x2,  0x1,  0x0,  0x0
    @ 7
    .byte 0x8,  0x6,  0x5,  0x4
    .byte 0x3,  0x2,  0x0,  0x0
    @ 8
    .byte 0xA,  0x8,  0x6,  0x5
    .byte 0x4,  0x3,  0x1,  0x0
    @ 9
    .byte 0xC,  0xA,  0x8,  0x6
    .byte 0x5,  0x4,  0x2,  0x0
    @ 10
    .byte 0xE,  0xC,  0xA,  0x8
    .byte 0x6,  0x5,  0x3,  0x0
    @ 11
    .byte 0x10, 0xE,  0xC,  0xA
    .byte 0x8,  0x6,  0x4,  0x0
    @ 12
    .byte 0x12, 0x10, 0xE,  0xC
    .byte 0xA,  0x8,  0x5,  0x0
    @ 13
    .byte 0x14, 0x12, 0x10, 0xE
    .byte 0xC,  0xA,  0x6,  0x0
    @ 14
    .byte 0x1A, 0x14, 0x12, 0x10
    .byte 0xE,  0xC,  0x8,  0x2
    @ 15
    .byte 0x1C, 0x1A, 0x14, 0x12
    .byte 0x10, 0xE,  0xA,  0x6
    @ 16
    .byte 0x1C, 0x1C, 0x1A, 0x14
    .byte 0x12, 0x10, 0xC,  0xC
tblAreaToEncounterSensitivity:
    @ 0
    .byte 5,  5,  5,  5
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 1
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3

    @ 2
    .byte 5,  5,  5,  5
    .byte 7,  5,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 3
    .byte 6,  6,  6,  6
    .byte 6,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 4
    .byte 7,  7,  7,  7
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 5
    .byte 3,  5,  5,  5
    .byte 6,  4,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 6
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 7
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 8
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 9
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 10
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 11
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 12
    .byte 5,  5,  5,  5
    .byte 5,  5,  5,  5
    .byte 5,  5,  5,  5
    .byte 5,  3,  3,  3
    @ 13
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 14
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 15
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    .byte 3,  3,  3,  3
    @ 16
    .byte 5,  6,  5,  5
    .byte 5,  5,  5,  5
    .byte 5,  5,  5,  5
    .byte 5,  5,  5,  5


_nt ResetBattleSpawnAnimationState
    mov        r6,#0x80
    add        r6,r6,r5
    mov        r0,#0x0
    strb       r0,[r6,#0x0]
    mov        pc,lr


_nt BattleSpawnAnimation_Main
    push       {lr}
    mov        r6,#0x80
    add        r6,r6,r5
    ldr        r7,=PTR_BattleSpawnAnimation_0_Init
    ldrb       r0,[r6,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}
PTR_BattleSpawnAnimation_0_Init:
    .word BattleSpawnAnimation_0_Init
    .word BattleSpawnAnimation_1_Main
    .word BattleSpawnAnimation_2_Free

    .pool


_nt BattleSpawnAnimation_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    bl         SpritePtr_ObjModeSemiTransparent
    mov        r0,#0x2
    strh       r0,[r6,#0x2]
    mov        r0,#0x0
    strh       r0,[r6,#0x4]
    mov        r0,#0x4
    strb       r0,[r6,#0x0]
    mov        r0,#0x92
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1
    pop        {pc}


_nt BattleSpawnAnimation_1_Main
    push       {lr}
    ldrh       r0,[r6,#0x2]
    sub        r0,#0x1
    strh       r0,[r6,#0x2]
    bne        LAB_08009b5a
    mov        r0,#0x2
    strh       r0,[r6,#0x2]
    ldrh       r0,[r6,#0x4]
    add        r0,#0x1
    strh       r0,[r6,#0x4]
    cmp        r0,#0x10
    bne        LAB_08009b56
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_08009b44
    ldrb       r0,[r7,#0x6]
    add        r0,#0x1
    strb       r0,[r7,#0x6]
    b          LAB_08009b4a
LAB_08009b44:
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
LAB_08009b4a:
    mov        r0,#0x8
    strb       r0,[r6,#0x0]
    bl         SpritePtr_ObjModeNormal
    mov        r0,#0x1
    pop        {pc}
LAB_08009b56:
    bl         SpritePtr_ObjModeSemiTransparent
LAB_08009b5a:
    mov        r0,#0x1
    pop        {pc}


_nt BattleSpawnAnimation_2_Free
    push       {lr}
    mov        r0,#0x0
    pop        {pc}


_nt Battle_LoadEnemyHp
    push       {lr}
    ldrb       r0,[r5,#0x13]
    bl         Enemy_GetEnemyDetail
    ldrh       r0,[r0,#0x0]
    strh       r0,[r5,#0x20]
    strh       r0,[r5,#0x22]
    pop        {pc}


_nt Battle_RemoveFromEnemyList
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    beq        LAB_08009b8e
    mov        r3,#0x54
    lsl        r0,r0,#0x2
    add        r0,r0,r3
    mov        r1,#0x0
    str        r1,[r7,r0]
    ldrb       r0,[r7,#0x5]
    sub        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_08009b8e:
    mov        pc,lr


_nt Battle_RegisterVirusDelete
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x16]
    add        r0,#0x1
    strb       r0,[r7,#0x16]
    mov        r0,#0xa
    strb       r0,[r7,#0x15]
    pop        {pc}


_nt Inventory_AddChip
    push       { lr }
    push       { r0, r1, r2 }
    bl         Flag_SetLibrary
    pop        { r0, r1, r2 }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    mov        r3,#0x1
    ldrb       r1,[r0,#0x0]
    cmp        r1,#0x63
    beq        LAB_08009bc8
    mov        r3,#0x0
    add        r1,r1,r2
    cmp        r1,#0x63
    ble        LAB_08009bc8
    mov        r1,#0x63
    mov        r3,#0x2
LAB_08009bc8:
    strb       r1,[r0,#0x0]
    push       { r3 }
    bl         Inventory_SetChecksum
    pop        { r3 }
    add        r0,r3,#0x0
    pop        { pc }

_nt Inventory_SetChip
    push       { lr }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    str        r2,[r0,#0x0]
    tst        r2,r2
    bne        LAB_08009bea
    bl         Inventory_SetChecksum
LAB_08009bea:
    pop        { pc }

_ts Inventory_SubtractChip
    push       { lr }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    mov        r3,#0x1
    ldrb       r1,[r0,#0x0]
    tst        r1,r1
    beq        LAB_08009bc8
    mov        r3,#0x0
    sub        r1,r1,r2
    bpl        LAB_08009c08
    mov        r3,#0x2
    add        r1,r1,r2
LAB_08009c08:
    strb       r1,[r0,#0x0]
    tst        r1,r1
    bne        LAB_08009c16
    push       { r3 }
    bl         FUN_0801b0f0
    pop        { r3 }
LAB_08009c16:
    add        r0,r3,#0x0
    pop        { pc }


@@ Gets the location of the amount of the battle chip specified, from the battle chip inventory.
@@ In:
@@ r0: chipID - The chip ID to check.
@@ r1: chipCode - The chip code to check.
@@
@@ Out:
@@ r0: chipCountLoc - The memory location containing the amount of the chip specified.
_nt Inventory_GetChipCountLocation
    push       { lr }
    add        r2,r0,#0x0
    push       { r1, r2 }
    bl         BattleChip_GetChipData
    pop        { r1, r2 }
    add        r0,#0x0
    mov        r3,#0x0
1: @ Code checking loop
    ldrb       r4,[r0,r3]
    cmp        r1,r4
    beq        2f
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        1b
    mov        r3,#0x0
2: @ Code found
    ldr        r7,=gBattleChipInventory
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    add        r0,r7,r3
    pop        { pc }

    .align 2, 0
    .pool


@@ Gets the location of the amount of the battle chip specified, from the battle chip inventory.
@@ In:
@@ r0: chipID - The chip ID to check.
@@ r1: chipCode - The chip code to check.
@@
@@ Out:
@@ r0: chipCountLoc - The memory location containing the checksum for the specified chip.
_ts Inventory_GetChipCountChecksum
    push       { lr }
    add        r2,r0,#0x0
    push       { r1, r2 }
    bl         BattleChip_GetChipData
    pop        { r1, r2 }
    add        r0,#0x0
    mov        r3,#0x0
1:
    ldrb       r4,[r0,r3]
    cmp        r1,r4
    beq        2f
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        1b
    mov        r3,#0x0
2:
    ldr        r7,=gBattleChipInventory
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    lsl        r3,r3,#0x1
    add        r3,#0x6
    add        r0,r7,r3
    pop        { pc }

    .align 2, 0
    .pool

_ts Inventory_GetChipCount
    push       { lr }
    bl         Inventory_GetChipCountLocation
    ldrb       r0,[r0,#0x0]
    pop        { pc }

_nt Inventory_AddZenny
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r1,[r7,#0x74]
    add        r0,r0,r1
    ldr        r1,=999999
    cmp        r0,r1
    ble        LAB_08009c94
    add        r0,r1,#0x0
LAB_08009c94:
    str        r0,[r7,#0x74]
    pop        { pc }

    .align 2, 0
    .pool

_ts Inventory_SubtractZenny
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r1,[r7,#0x74]
    sub        r1,r1,r0
    bpl        LAB_08009c94
    mov        r1,#0x0
    str        r1,[r7,#0x74]
    pop        { pc }


_nt Battle_CheckCellPosOutOfBounds
    sub        r0,#0x1
    cmp        r0,#0x5
    bhi        LAB_08009cbe
    sub        r1,#0x1
    cmp        r1,#0x2
    bhi        LAB_08009cbe
    mov        r0,#0x0
    mov        pc,lr
LAB_08009cbe:
    mov        r0,#0x1
    mov        pc,lr


_nt Battle_DecreaseOpponentCount
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    beq        LAB_08009cec
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_08009ce0
    ldrh       r0,[r7,#0x22]
    sub        r0,#0x1
    strh       r0,[r7,#0x22]
    bne        LAB_08009cec
    mov        r1,#0x1
    strb       r1,[r7,#0x13]
    b          LAB_08009cec
LAB_08009ce0:
    ldrh       r0,[r7,#0x24]
    sub        r0,#0x1
    strh       r0,[r7,#0x24]
    bne        LAB_08009cec
    mov        r1,#0x1
    strb       r1,[r7,#0x13]
LAB_08009cec:
    mov        pc,lr


_nt Battle_IsInputLocked
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x13]
    tst        r0,r0
    mov        pc,lr


_nt Battle_AdvanceTimer
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_08009d16
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldr        r0,[r7,#0x1c]
    add        r0,#0x1
    ldr        r1,DAT_08009d18
    cmp        r0,r1
    ble        LAB_08009d14
    add        r0,r1,#0x0
LAB_08009d14:
    str        r0,[r7,#0x1c]
LAB_08009d16:
    pop        {pc}

    .align 2, 0
DAT_08009d18: .word 60 * 359999


_nt Battle_IncreaseBattleCount
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_08009d44
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrh       r0,[r7,#0x12]
    add        r0,#0x1
    ldr        r1,DAT_08009d48
    cmp        r0,r1
    ble        LAB_08009d36
    add        r0,r1,#0x0
LAB_08009d36:
    strh       r0,[r7,#0x12]
    ldrb       r0,[r7,#0xf]
    add        r0,#0x1
    cmp        r0,#0xff
    ble        LAB_08009d42
    mov        r0,#0xff
LAB_08009d42:
    strb       r0,[r7,#0xf]
LAB_08009d44:
    mov        pc,lr

    .align 2, 0
DAT_08009d48: .word 0xFFFF


_ts Battle_IncrementRewardChipCounter
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_08009d66
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0xe]
    add        r0,#0x1
    cmp        r0,#0xff
    ble        LAB_08009d64
    mov        r0,#0xff
LAB_08009d64:
    strb       r0,[r7,#0xe]
LAB_08009d66:
    mov        pc,lr


_ts BattleSpriteQueue_Add
    ldr        r6,PTR_gBattleSpriteArgsArrayCount_08009d88
    ldr        r4,[r6,#0x0]
    ldr        r7,PTR_gBattleSpriteArgsArray_08009d84
    lsl        r4,r4,#0x4
    add        r7,r7,r4
    str        r0,[r7,#0x0]
    str        r1,[r7,#0x4]
    str        r2,[r7,#0x8]
    str        r3,[r7,#0xc]
    lsr        r4,r4,#0x4
    add        r4,#0x1
    str        r4,[r6,#0x0]
    mov        pc,lr

    .align 2, 0

PTR_gBattleSpriteArgsArray_08009d84:        .word gBattleSpriteArgsArray
PTR_gBattleSpriteArgsArrayCount_08009d88:   .word gBattleSpriteArgsArrayCount


_nt BattleSpriteQueue_TransferAll
    push       {r5,lr}
    ldr        r6,PTR_gBattleSpriteArgsArrayCount_08009db4
    ldr        r6,[r6,#0x0]
    ldr        r7,PTR_gBattleSpriteArgsArray_08009db0
LAB_08009d94:
    tst        r6,r6
    beq        LAB_08009dae
    sub        r6,#0x1
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    push       {r6,r7}
    bl         Oam_AddObject
    pop        {r6,r7}
    add        r7,#0x10
    b          LAB_08009d94
LAB_08009dae:
    pop        {r5,pc}

    .align 2, 0
PTR_gBattleSpriteArgsArray_08009db0:        .word gBattleSpriteArgsArray
PTR_gBattleSpriteArgsArrayCount_08009db4:   .word gBattleSpriteArgsArrayCount

_ts BattleSpriteQueue_Clear
    mov        r0,#0x0
    ldr        r7,=gBattleSpriteArgsArrayCount
    str        r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0
    .pool
