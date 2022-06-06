#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start Battle_InitChipDeck
Battle_InitChipDeck:
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
thumb_func_end Battle_InitChipDeck

    .pool

Inventory_InitDefaultChipFolder:
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

thumb_func_start BattleChip_GetChipData
BattleChip_GetChipData:
    mov        r1,#0x1c
    mul        r0,r1
    ldr        r1,=dataChipDetailList
    add        r0,r0,r1
    mov        pc,lr
thumb_func_end BattleChip_GetChipData

    .align 2, 0
    .pool

dataChipDetailList:
    _0: @ Buster
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
    _1: @ Cannon
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
    _2: @ HiCannon
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
    _3: @ M_Cannon
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
    _4: @ Sword
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
    _5: @ WideSwrd
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
    _6: @ LongSwrd
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
    _7: @ LilBomb
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
    _8: @ CrosBomb
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
    _9: @ BigBomb
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
    _10: @ Spreader
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
    _11: @ Bubbler
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
    _12: @ Heater
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
    _13: @ MiniBomb
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
    _14: @ Shotgun
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
    _15: @ CrossGun
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
    _16: @ ShokWave
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
    _17: @ SoniWave
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
    _18: @ DynaWave
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
    _19: @ FireTowr
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
    _20: @ AquaTowr
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
    _21: @ WoodTowr
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
    _22: @ Quake1
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
    _23: @ Quake2
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
    _24: @ Quake3
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
    _25: @ FireSwrd
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
    _26: @ ElecSwrd
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
    _27: @ AquaSwrd
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
    _28: @ GutsPnch
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
    _29: @ IcePunch
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
    _30: @ FtrSword
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
    _31: @ Dash
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
    _32: @ KngtSwrd
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
    _33: @ HeroSwrd
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
    _34: @ MetGuard
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
    _35: @ $23
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
    _36: @ $24
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
    _37: @ TriArrow
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
    _38: @ TriSpear
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
    _39: @ TriLance
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
    _40: @ Typhoon
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
    _41: @ Huricane
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
    _42: @ Cyclone
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
    _43: @ Howitzer
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
    _44: @ Thunder1
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
    _45: @ Thunder2
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
    _46: @ Thunder3
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
    _47: @ $2F
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
    _48: @ $30
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
    _49: @ Snakegg1
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
    _50: @ Snakegg2
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
    _51: @ Snakegg3
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
    _52: @ Hammer
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
    _53: @ $35
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
    _54: @ $36
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
    _55: @ BodyBurn
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
    _56: @ $38
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
    _57: @ $39
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
    _58: @ Ratton1
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
    _59: @ Ratton2
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
    _60: @ Ratton3
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
    _61: @ Lockon1
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
    _62: @ Lockon2
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
    _63: @ Lockon3
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
    _64: @ XーPanel1
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
    _65: @ XーPanel3
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
    _66: @ $42
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
    _67: @ Recov10
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
    _68: @ Recov30
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
    _69: @ Recov50
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
    _70: @ Recov80
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
    _71: @ Recov120
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
    _72: @ Recov150
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
    _73: @ Recov200
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
    _74: @ Recov300
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
    _75: @ $4B
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
    _76: @ Steal
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
    _77: @ $4D
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
    _78: @ $4E
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
    _79: @ Geddon1
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
    _80: @ Geddon2
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
    _81: @ $51
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
    _82: @ Escape
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
    _83: @ Interupt
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
    _84: @ LifeAura
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
    _85: @ AquaAura
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
    _86: @ FireAura
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
    _87: @ WoodAura
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
    _88: @ Repair
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
    _89: @ $59
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
    _90: @ $5A
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
    _91: @ Cloud
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
    _92: @ Cloudier
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
    _93: @ Cloudest
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
    _94: @ IceCube
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
    _95: @ RockCube
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
    _96: @ $60
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
    _97: @ TimeBom1
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
    _98: @ TimeBom2
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
    _99: @ TimeBom3
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
    _100: @ Invis1
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
    _101: @ Invis2
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
    _102: @ Invis3
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
    _103: @ IronBody
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
    _104: @ $68
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
    _105: @ Remobit1
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
    _106: @ Remobit2
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
    _107: @ Remobit3
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
    _108: @ BstrGard
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
    _109: @ BstrBomb
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
    _110: @ BstrSwrd
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
    _111: @ BstrPnch
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
    _112: @ RingZap1
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
    _113: @ RingZap2
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
    _114: @ RingZap3
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
    _115: @ Candle1
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
    _116: @ Candle2
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
    _117: @ Candle3
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
    _118: @ SloGauge
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
    _119: @ FstGauge
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
    _120: @ $78
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
    _121: @ Drain1
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
    _122: @ Drain2
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
    _123: @ Drain3
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
    _124: @ Mine1
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
    _125: @ Mine2
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
    _126: @ Mine3
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
    _127: @ Gaia1
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
    _128: @ Gaia2
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
    _129: @ Gaia3
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
    _130: @ BblWrap1
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
    _131: @ BblWrap2
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
    _132: @ BblWrap3
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
    _133: @ Wave
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
    _134: @ RedWave
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
    _135: @ BigWave
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
    _136: @ Muramasa
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
    _137: @ Dropdown
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
    _138: @ Popup
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
    _139: @ Dynamyt1
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
    _140: @ Dynamyt2
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
    _141: @ Dynamyt3
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
    _142: @ Anubis
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
    _143: @ $8F
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
    _144: @ $90
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
    _145: @ IronShld
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
    _146: @ LeafShld
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
    _147: @ Barrier
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
    _148: @ PharoMan
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
    _149: @ PharoMn2
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
    _150: @ PharoMn3
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
    _151: @ ShadoMan
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
    _152: @ ShadoMn2
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
    _153: @ ShadoMn3
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
    _154: @ $9A
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
    _155: @ $9B
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
    _156: @ $9C
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
    _157: @ MagicMan
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
    _158: @ MagicMn2
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
    _159: @ MagicMn3
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
    _160: @ Roll
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
    _161: @ Roll2
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
    _162: @ Roll3
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
    _163: @ GutsMan
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
    _164: @ GutsMan2
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
    _165: @ GutsMan3
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
    _166: @ ProtoMan
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
    _167: @ ProtoMn2
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
    _168: @ ProtoMn3
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
    _169: @ WoodMan
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
    _170: @ WoodMan2
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
    _171: @ WoodMan3
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
    _172: @ FireMan
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
    _173: @ FireMan2
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
    _174: @ FireMan3
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
    _175: @ NumbrMan
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
    _176: @ NumbrMn2
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
    _177: @ NumbrMn3
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
    _178: @ StoneMan
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
    _179: @ StoneMn2
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
    _180: @ StoneMn3
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
    _181: @ IceMan
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
    _182: @ IceMan2
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
    _183: @ IceMan3
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
    _184: @ SkullMan
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
    _185: @ SkullMn2
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
    _186: @ SkullMn3
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
    _187: @ ColorMan
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
    _188: @ ColorMn2
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
    _189: @ ColorMn3
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
    _190: @ BombMan
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
    _191: @ BombMan2
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
    _192: @ BombMan3
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
    _193: @ SharkMan
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
    _194: @ SharkMn2
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
    _195: @ SharkMn3
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
    _196: @ ElecMan
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
    _197: @ ElecMan2
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
    _198: @ ElecMan3
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
    _199: @ Bass
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
    _200: @ $C8
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
    _201: @ $C9
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
    _202: @ $CA
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
    _203: @ $CB
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
    _204: @ $CC
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
    _205: @ $CD
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
    _206: @ $CE
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
    _207: @ $CF
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
    _208: @ $D0
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
    _209: @ $D1
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
    _210: @ $D2
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
    _211: @ $D3
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
    _212: @ $D4
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
    _213: @ $D5
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
    _214: @ $D6
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
    _215: @ $D7
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
    _216: @ $D8
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
    _217: @ $D9
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
    _218: @ $DA
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
    _219: @ $DB
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
    _220: @ $DC
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
    _221: @ $DD
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
    _222: @ $DE
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
    _223: @ $DF
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
    _224: @ $E0
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
    _225: @ $E1
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
    _226: @ $E2
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
    _227: @ $E3
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
    _228: @ $E4
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
    _229: @ $E5
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
    _230: @ $E6
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
    _231: @ $E7
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
    _232: @ $E8
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
    _233: @ $E9
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
    _234: @ $EA
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
    _235: @ $EB
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
    _236: @ $EC
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
    _237: @ $ED
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
    _238: @ $EE
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
    _239: @ $EF
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

    .end
