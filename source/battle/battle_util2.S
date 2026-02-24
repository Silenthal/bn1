#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Battle_InitChipDeck
    push       {r5,lr}
    mov        r0,#0x0
    ldr        r7,=gBattleFolder
LAB_08007c4a:
    strb       r0,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_08007c4a
    LoadMain world, r7, r7
    ldrb       r1,[r7,#World_isShuffleFolder]
    tst        r1,r1
    beq        LAB_08007c66
    ldr        r0,=gBattleFolder
    mov        r1,#0x1e
    mov        r2,#0x3c
    bl         ArrayShuffle
LAB_08007c66:
    pop        {r5,pc}

    .pool

_ts Inventory_InitDefaultChipFolder
    push       {lr}
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
    push       {r4,r6}
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    mov        r2,#0x1
    bl         Inventory_AddChip
    pop        {r4,r6}
    add        r6,#0x2
    add        r4,#0x1
    cmp        r4,#0x1e
    bmi        LAB_08007c84
    pop        {pc}

PTR_folderSrcInitialFolder_08007c9c:    .word folderSrcInitialFolder
PTR_gFolder_08007ca0:                   .word gFolder
PTR_gBattleChipInventory_08007ca4:      .word gBattleChipInventory

global_label folderSrcInitialFolder
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

global_label folderTutorial1
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

global_label folderTutorial2
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
        noelement
        family 1, 0
        rarity 1
        nolibrary
        no_abc
        damage 9999
        .byte 0x0, 0x50
        chip_icon 0
        chip_art 0
    @ 1: Cannon
        codes A, B, C, D, E
        noelement
        family 2, 0
        rarity 1
        library 1
        abc 24
        damage 40
        .byte 0x99, 0x1
        chip_icon 1
        chip_art 1
    @ 2: HiCannon
        codes F, G, H, I, J
        noelement
        family 2, 1
        rarity 2
        library 2
        abc 68
        damage 80
        .byte 0x0, 0x50
        chip_icon 2
        chip_art 2
    @ 3: M_Cannon
        codes K, L, M, N, O
        noelement
        family 2, 2
        rarity 3
        library 3
        abc 93
        damage 120
        .byte 0x0, 0x50
        chip_icon 3
        chip_art 3
    @ 4: Sword
        codes B, K, L, P, S
        noelement
        family 3, 0
        rarity 1
        library 13
        abc 157
        damage 80
        .byte 0x0, 0x1
        chip_icon 4
        chip_art 4
    @ 5: WideSwrd
        codes C, K, M, N, S
        noelement
        family 3, 1
        rarity 1
        library 14
        abc 169
        damage 80
        .byte 0x0, 0x50
        chip_icon 5
        chip_art 5
    @ 6: LongSwrd
        codes D, E, N, O, S
        noelement
        family 3, 2
        rarity 2
        library 15
        abc 89
        damage 80
        .byte 0x0, 0x50
        chip_icon 6
        chip_art 6
    @ 7: LilBomb
        codes B, D, G, O, T
        noelement
        family 4, 0
        rarity 1
        library 10
        abc 85
        damage 50
        .byte 0x99, 0x1
        chip_icon 7
        chip_art 7
    @ 8: CrosBomb
        codes B, D, H, J, L
        noelement
        family 4, 1
        rarity 2
        library 11
        abc 31
        damage 70
        .byte 0x0, 0x50
        chip_icon 8
        chip_art 8
    @ 9: BigBomb
        codes B, G, O, S, T
        noelement
        family 4, 2
        rarity 4
        library 12
        abc 10
        damage 90
        .byte 0x0, 0x50
        chip_icon 9
        chip_art 9
    @ 10: Spreader
        codes H, I, J, K, L
        noelement
        family 5, 0
        rarity 2
        library 6
        abc 152
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
        abc 20
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
        abc 66
        damage 70
        .byte 0x0, 0x50
        chip_icon 12
        chip_art 12
    @ 13: MiniBomb
        codes C, E, J, L, P
        noelement
        family 4, 3
        rarity 1
        library 9
        abc 98
        damage 50
        .byte 0x0, 0x50
        chip_icon 13
        chip_art 13
    @ 14: Shotgun
        codes K, M, N, Q, R
        noelement
        family 5, 3
        rarity 1
        library 4
        abc 143
        damage 30
        .byte 0x0, 0x50
        chip_icon 14
        chip_art 14
    @ 15: CrossGun
        codes C, E, F, J, K
        noelement
        family 5, 4
        rarity 1
        library 5
        abc 32
        damage 30
        .byte 0x0, 0x50
        chip_icon 15
        chip_art 15
    @ 16: ShokWave
        codes C, K, L, N, P
        noelement
        family 8, 0
        rarity 1
        library 23
        abc 142
        damage 60
        .byte 0x99, 0x1
        chip_icon 16
        chip_art 16
    @ 17: SoniWave
        codes C, D, J, M, S
        noelement
        family 8, 1
        rarity 2
        library 24
        abc 151
        damage 80
        .byte 0xCC, 0x0
        chip_icon 17
        chip_art 17
    @ 18: DynaWave
        codes C, E, M, S, R
        noelement
        family 8, 2
        rarity 3
        library 25
        abc 42
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
        abc 53
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
        abc 4
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
        abc 174
        damage 140
        .byte 0xCC, 0x0
        chip_icon 21
        chip_art 21
    @ 22: Quake1
        codes A, E, H, K, Q
        noelement
        family 4, 5
        rarity 1
        library 29
        abc 110
        damage 90
        .byte 0xCC, 0x0
        chip_icon 22
        chip_art 22
    @ 23: Quake2
        codes B, C, I, K, Q
        noelement
        family 4, 6
        rarity 2
        library 30
        abc 111
        damage 120
        .byte 0xCC, 0x0
        chip_icon 23
        chip_art 23
    @ 24: Quake3
        codes C, D, H, M, Q
        noelement
        family 4, 7
        rarity 3
        library 31
        abc 112
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
        abc 52
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
        abc 46
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
        abc 3
        damage 150
        .byte 0xCC, 0x0
        chip_icon 27
        chip_art 27
    @ 28: GutsPnch
        codes B, H, M, N, T
        noelement
        family 9, 3
        rarity 1
        library 32
        abc 64
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
        abc 75
        damage 80
        .byte 0xCC, 0x0
        chip_icon 29
        chip_art 29
    @ 30: FtrSword
        codes B, K, L, P, S
        noelement
        family 3, 6
        rarity 3
        library 16
        abc 55
        damage 100
        .byte 0xCC, 0x0
        chip_icon 30
        chip_art 30
    @ 31: Dash
        codes B, D, G, L, O
        noelement
        family 19, 0
        rarity 1
        library 34
        abc 34
        damage 50
        .byte 0xCC, 0x0
        chip_icon 31
        chip_art 31
    @ 32: KngtSwrd
        codes B, C, E, G, H
        noelement
        family 3, 7
        rarity 4
        library 17
        abc 82
        damage 150
        .byte 0xCC, 0x0
        chip_icon 32
        chip_art 32
    @ 33: HeroSwrd
        codes B, D, F, I, J
        noelement
        family 3, 8
        rarity 5
        library 18
        abc 67
        damage 200
        .byte 0xCC, 0x0
        chip_icon 33
        chip_art 33
    @ 34: MetGuard
        codes A, C, E, G, L
        noelement
        family 6, 0
        rarity 1
        library 67
        abc 94
        damage 0
        .byte 0xCC, 0x0
        chip_icon 34
        chip_art 34
    @ 35: 0x23
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 35
        chip_art 0
    @ 36: 0x24
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 36
        chip_art 0
    @ 37: TriArrow
        codes A, B, C, D, E
        noelement
        family 17, 0
        rarity 1
        library 36
        abc 164
        damage 40
        .byte 0xCC, 0x0
        chip_icon 37
        chip_art 35
    @ 38: TriSpear
        codes F, G, H, I, J
        noelement
        family 17, 1
        rarity 2
        library 37
        abc 166
        damage 50
        .byte 0xCC, 0x0
        chip_icon 38
        chip_art 36
    @ 39: TriLance
        codes K, L, M, N, O
        noelement
        family 17, 2
        rarity 4
        library 38
        abc 165
        damage 60
        .byte 0xCC, 0x0
        chip_icon 39
        chip_art 37
    @ 40: Typhoon
        codes A, B, D, E, G
        noelement
        family 28, 0
        rarity 1
        library 54
        abc 167
        damage 30
        .byte 0xCC, 0x0
        chip_icon 40
        chip_art 38
    @ 41: Huricane
        codes G, I, J, K, L
        noelement
        family 28, 1
        rarity 2
        library 55
        abc 70
        damage 30
        .byte 0xCC, 0x0
        chip_icon 41
        chip_art 39
    @ 42: Cyclone
        codes E, F, G, H, I
        noelement
        family 28, 2
        rarity 3
        library 56
        abc 33
        damage 30
        .byte 0xCC, 0x0
        chip_icon 42
        chip_art 40
    @ 43: Howitzer
        codes A, C, G, H, O
        noelement
        family 4, 4
        rarity 4
        library 35
        abc 69
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
        abc 158
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
        abc 159
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
        abc 160
        damage 150
        .byte 0xCC, 0x0
        chip_icon 46
        chip_art 44
    @ 47: 0x2F
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 47
        chip_art 0
    @ 48: 0x30
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
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
        abc 148
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
        abc 149
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
        abc 150
        damage 150
        .byte 0xCC, 0x0
        chip_icon 51
        chip_art 47
    @ 52: Hammer
        codes A, F, I, M, Q
        noelement
        family 18, 0
        rarity 2
        library 66
        abc 65
        damage 100
        .byte 0xCC, 0x0
        chip_icon 52
        chip_art 48
    @ 53: 0x35
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 53
        chip_art 0
    @ 54: 0x36
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
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
        abc 12
        damage 100
        .byte 0xCC, 0x0
        chip_icon 55
        chip_art 49
    @ 56: 0x38
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 56
        chip_art 0
    @ 57: 0x39
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 57
        chip_art 0
    @ 58: Ratton1
        codes A, B, C, D, E
        noelement
        family 23, 3
        rarity 1
        library 39
        abc 113
        damage 80
        .byte 0xCC, 0x0
        chip_icon 58
        chip_art 50
    @ 59: Ratton2
        codes F, G, H, I, J
        noelement
        family 23, 4
        rarity 2
        library 40
        abc 114
        damage 100
        .byte 0xCC, 0x0
        chip_icon 59
        chip_art 51
    @ 60: Ratton3
        codes K, L, M, N, O
        noelement
        family 23, 5
        rarity 3
        library 41
        abc 115
        damage 120
        .byte 0xCC, 0x0
        chip_icon 60
        chip_art 52
    @ 61: Lockon1
        codes C, D, H, I, L
        noelement
        family 13, 42
        rarity 1
        library 98
        abc 86
        damage 10
        .byte 0xCC, 0x0
        chip_icon 61
        chip_art 53
    @ 62: Lockon2
        codes B, E, G, H, M
        noelement
        family 13, 43
        rarity 2
        library 99
        abc 87
        damage 15
        .byte 0xCC, 0x0
        chip_icon 62
        chip_art 54
    @ 63: Lockon3
        codes A, D, K, N, O
        noelement
        family 13, 44
        rarity 3
        library 100
        abc 88
        damage 20
        .byte 0xCC, 0x0
        chip_icon 63
        chip_art 55
    @ 64: X_Panel1
        codes B, D, G, L, S
        noelement
        family 11, 0
        rarity 2
        library 64
        abc 175
        damage 0
        .byte 0x0, 0x50
        chip_icon 64
        chip_art 56
    @ 65: X_Panel3
        codes B, D, G, L, S
        noelement
        family 11, 1
        rarity 3
        library 65
        abc 176
        damage 0
        .byte 0x0, 0x50
        chip_icon 65
        chip_art 57
    @ 66: 0x42
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 66
        chip_art 0
    @ 67: Recov10
        codes A, C, E, G, L
        noelement
        family 12, 0
        rarity 1
        library 69
        abc 116
        damage 0
        .byte 0x0, 0x50
        chip_icon 67
        chip_art 58
    @ 68: Recov30
        codes A, C, E, G, L
        noelement
        family 12, 1
        rarity 1
        library 70
        abc 120
        damage 0
        .byte 0x0, 0x50
        chip_icon 68
        chip_art 59
    @ 69: Recov50
        codes A, C, E, G, L
        noelement
        family 12, 2
        rarity 1
        library 71
        abc 122
        damage 0
        .byte 0x0, 0x50
        chip_icon 69
        chip_art 60
    @ 70: Recov80
        codes A, C, E, G, L
        noelement
        family 12, 3
        rarity 1
        library 72
        abc 123
        damage 0
        .byte 0xCC, 0x0
        chip_icon 70
        chip_art 61
    @ 71: Recov120
        codes A, C, E, G, L
        noelement
        family 12, 4
        rarity 2
        library 73
        abc 117
        damage 0
        .byte 0xCC, 0x0
        chip_icon 71
        chip_art 62
    @ 72: Recov150
        codes A, C, E, G, L
        noelement
        family 12, 5
        rarity 2
        library 74
        abc 118
        damage 0
        .byte 0xCC, 0x0
        chip_icon 72
        chip_art 63
    @ 73: Recov200
        codes A, C, E, G, L
        noelement
        family 12, 6
        rarity 3
        library 75
        abc 119
        damage 0
        .byte 0xCC, 0x0
        chip_icon 73
        chip_art 64
    @ 74: Recov300
        codes A, C, E, G, L
        noelement
        family 12, 7
        rarity 4
        library 76
        abc 121
        damage 0
        .byte 0xCC, 0x0
        chip_icon 74
        chip_art 65
    @ 75: 0x4B
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 75
        chip_art 0
    @ 76: Steal
        codes A, E, L, P, S
        noelement
        family 13, 0
        rarity 3
        library 77
        abc 153
        damage 0
        .byte 0x0, 0x50
        chip_icon 76
        chip_art 66
    @ 77: 0x4D
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 10
        .byte 0xCC, 0x0
        chip_icon 77
        chip_art 0
    @ 78: 0x4E
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 78
        chip_art 0
    @ 79: Geddon1
        codes F, H, J, L, N
        noelement
        family 22, 0
        rarity 3
        library 78
        abc 59
        damage 0
        .byte 0x0, 0x50
        chip_icon 79
        chip_art 67
    @ 80: Geddon2
        codes A, B, E, I, K
        noelement
        family 22, 1
        rarity 4
        library 79
        abc 60
        damage 0
        .byte 0xCC, 0x0
        chip_icon 80
        chip_art 68
    @ 81: 0x51
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 81
        chip_art 0
    @ 82: Escape
        codes F, H, J, L, N
        noelement
        family 13, 1
        rarity 3
        library 80
        abc 47
        damage 0
        .byte 0x0, 0x50
        chip_icon 82
        chip_art 69
    @ 83: Interupt
        codes F, H, J, L, N
        noelement
        family 13, 29
        rarity 3
        library 81
        abc 76
        damage 0
        .byte 0xCC, 0x0
        chip_icon 83
        chip_art 70
    @ 84: LifeAura
        codes A, H, K, M, P
        noelement
        family 10, 4
        rarity 5
        library 127
        abc 84
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
        abc 2
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
        abc 48
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
        abc 170
        damage 0
        .byte 0xCC, 0x0
        chip_icon 87
        chip_art 74
    @ 88: Repair
        codes A, G, H, K, S
        noelement
        family 13, 2
        rarity 1
        library 82
        abc 128
        damage 0
        .byte 0xCC, 0x0
        chip_icon 88
        chip_art 75
    @ 89: 0x59
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 89
        chip_art 0
    @ 90: 0x5A
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
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
        abc 25
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
        abc 27
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
        abc 26
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
        abc 71
        damage 0
        .byte 0xCC, 0x0
        chip_icon 94
        chip_art 79
    @ 95: RockCube
        codes B, E, G, M, O
        noelement
        family 13, 4
        rarity 3
        library 106
        abc 132
        damage 0
        .byte 0xCC, 0x0
        chip_icon 95
        chip_art 80
    @ 96: 0x60
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 96
        chip_art 0
    @ 97: TimeBom1
        codes E, G, J, L, Q
        noelement
        family 13, 5
        rarity 2
        library 83
        abc 161
        damage 80
        .byte 0xCC, 0x0
        chip_icon 97
        chip_art 81
    @ 98: TimeBom2
        codes C, F, J, L, S
        noelement
        family 13, 6
        rarity 3
        library 84
        abc 162
        damage 120
        .byte 0xCC, 0x0
        chip_icon 98
        chip_art 82
    @ 99: TimeBom3
        codes A, B, G, O, P
        noelement
        family 13, 7
        rarity 4
        library 85
        abc 163
        damage 160
        .byte 0xCC, 0x0
        chip_icon 99
        chip_art 83
    @ 100: Invis1
        codes I, J, L, O, Q
        noelement
        family 13, 8
        rarity 2
        library 113
        abc 77
        damage 0
        .byte 0xCC, 0x0
        chip_icon 100
        chip_art 84
    @ 101: Invis2
        codes A, C, F, J, M
        noelement
        family 13, 9
        rarity 3
        library 114
        abc 78
        damage 0
        .byte 0xCC, 0x0
        chip_icon 101
        chip_art 85
    @ 102: Invis3
        codes B, D, H, K, N
        noelement
        family 13, 10
        rarity 4
        library 115
        abc 79
        damage 0
        .byte 0xCC, 0x0
        chip_icon 102
        chip_art 86
    @ 103: IronBody
        codes C, D, L, Q, R
        noelement
        family 13, 20
        rarity 2
        library 118
        abc 80
        damage 0
        .byte 0xCC, 0x0
        chip_icon 103
        chip_art 87
    @ 104: 0x68
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
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
        abc 125
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
        abc 126
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
        abc 127
        damage 120
        .byte 0xCC, 0x0
        chip_icon 107
        chip_art 90
    @ 108: BstrGard
        codes A, G, K, N, R
        noelement
        family 21, 0
        rarity 3
        library 107
        abc 17
        damage 0
        .byte 0xCC, 0x0
        chip_icon 108
        chip_art 91
    @ 109: BstrBomb
        codes D, H, J, O, T
        noelement
        family 21, 1
        rarity 4
        library 108
        abc 16
        damage 0
        .byte 0xCC, 0x0
        chip_icon 109
        chip_art 92
    @ 110: BstrSwrd
        codes B, E, L, P, S
        noelement
        family 21, 2
        rarity 4
        library 109
        abc 19
        damage 0
        .byte 0xCC, 0x0
        chip_icon 110
        chip_art 93
    @ 111: BstrPnch
        codes C, F, I, M, Q
        noelement
        family 21, 3
        rarity 4
        library 110
        abc 18
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
        abc 129
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
        abc 130
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
        abc 131
        damage 100
        .byte 0xCC, 0x0
        chip_icon 114
        chip_art 97
    @ 115: Candle1
        codes C, F, I, P, S
        noelement
        family 13, 21
        rarity 2
        library 101
        abc 21
        damage 0
        .byte 0xCC, 0x0
        chip_icon 115
        chip_art 98
    @ 116: Candle2
        codes B, E, G, J, L
        noelement
        family 13, 22
        rarity 3
        library 102
        abc 22
        damage 0
        .byte 0xCC, 0x0
        chip_icon 116
        chip_art 99
    @ 117: Candle3
        codes A, D, H, K, M
        noelement
        family 13, 23
        rarity 4
        library 103
        abc 23
        damage 0
        .byte 0xCC, 0x0
        chip_icon 117
        chip_art 100
    @ 118: SloGauge
        codes H, K, N, O, Q
        noelement
        family 13, 24
        rarity 2
        library 111
        abc 147
        damage 0
        .byte 0xCC, 0x0
        chip_icon 118
        chip_art 101
    @ 119: FstGauge
        codes A, C, E, L, N
        noelement
        family 13, 25
        rarity 2
        library 112
        abc 54
        damage 0
        .byte 0xCC, 0x0
        chip_icon 119
        chip_art 102
    @ 120: 0x78
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 120
        chip_art 0
    @ 121: Drain1
        codes A, B, D, K, O
        noelement
        family 13, 33
        rarity 2
        library 60
        abc 35
        damage 50
        .byte 0xCC, 0x0
        chip_icon 121
        chip_art 103
    @ 122: Drain2
        codes A, C, H, N, T
        noelement
        family 13, 34
        rarity 2
        library 61
        abc 36
        damage 70
        .byte 0xCC, 0x0
        chip_icon 122
        chip_art 104
    @ 123: Drain3
        codes A, E, F, L, Q
        noelement
        family 13, 35
        rarity 3
        library 62
        abc 37
        damage 90
        .byte 0xCC, 0x0
        chip_icon 123
        chip_art 105
    @ 124: Mine1
        codes G, H, M, N, P
        noelement
        family 13, 13
        rarity 2
        library 89
        abc 95
        damage 160
        .byte 0xCC, 0x0
        chip_icon 124
        chip_art 106
    @ 125: Mine2
        codes C, E, G, J, L
        noelement
        family 13, 14
        rarity 3
        library 90
        abc 96
        damage 180
        .byte 0xCC, 0x0
        chip_icon 125
        chip_art 107
    @ 126: Mine3
        codes A, B, O, R, T
        noelement
        family 13, 15
        rarity 4
        library 91
        abc 97
        damage 200
        .byte 0xCC, 0x0
        chip_icon 126
        chip_art 108
    @ 127: Gaia1
        codes C, D, L, O, T
        noelement
        family 29, 0
        rarity 3
        library 45
        abc 56
        damage 100
        .byte 0xCC, 0x0
        chip_icon 127
        chip_art 109
    @ 128: Gaia2
        codes C, F, K, P, S
        noelement
        family 29, 1
        rarity 4
        library 46
        abc 57
        damage 130
        .byte 0xCC, 0x0
        chip_icon 128
        chip_art 110
    @ 129: Gaia3
        codes C, G, M, R, T
        noelement
        family 29, 2
        rarity 5
        library 47
        abc 58
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
        abc 7
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
        abc 8
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
        abc 9
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
        abc 168
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
        abc 124
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
        abc 11
        damage 160
        .byte 0xCC, 0x0
        chip_icon 135
        chip_art 117
    @ 136: Muramasa
        codes C, E, G, J, K
        noelement
        family 3, 9
        rarity 5
        library 22
        abc 99
        damage 0
        .byte 0xCC, 0x0
        chip_icon 136
        chip_art 118
    @ 137: Dropdown
        codes A, B, O, R, T
        noelement
        family 13, 11
        rarity 5
        library 116
        abc 38
        damage 0
        .byte 0xCC, 0x0
        chip_icon 137
        chip_art 119
    @ 138: Popup
        codes C, D, H, K, N
        noelement
        family 13, 12
        rarity 5
        library 117
        abc 106
        damage 0
        .byte 0xCC, 0x0
        chip_icon 138
        chip_art 120
    @ 139: Dynamyt1
        codes B, G, O, Q, S
        noelement
        family 13, 39
        rarity 3
        library 92
        abc 39
        damage 100
        .byte 0xCC, 0x0
        chip_icon 139
        chip_art 121
    @ 140: Dynamyt2
        codes A, C, K, M, N
        noelement
        family 13, 40
        rarity 3
        library 93
        abc 40
        damage 120
        .byte 0xCC, 0x0
        chip_icon 140
        chip_art 122
    @ 141: Dynamyt3
        codes G, K, M, O, P
        noelement
        family 13, 41
        rarity 3
        library 94
        abc 41
        damage 150
        .byte 0xCC, 0x0
        chip_icon 141
        chip_art 123
    @ 142: Anubis
        codes C, L, N, Q, T
        noelement
        family 13, 19
        rarity 5
        library 104
        abc 1
        damage 0
        .byte 0xCC, 0x0
        chip_icon 142
        chip_art 124
    @ 143: 0x8F
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 143
        chip_art 0
    @ 144: 0x90
        nocodes
        noelement
        family 8, 0
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 144
        chip_art 0
    @ 145: IronShld
        codes A, B, O, R, T
        noelement
        family 24, 0
        rarity 2
        library 68
        abc 81
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
        abc 83
        damage 0
        .byte 0xCC, 0x0
        chip_icon 146
        chip_art 126
    @ 147: Barrier
        codes D, F, M, R, S
        noelement
        family 10, 0
        rarity 2
        library 119
        abc 5
        damage 0
        .byte 0xCC, 0x0
        chip_icon 147
        chip_art 127
    @ 148: PharoMan
        codes P
        noelement
        family 16, 36
        rarity 5
        library 170
        abc 103
        damage 100
        .byte 0xCC, 0x0
        chip_icon 148
        chip_art 128
    @ 149: PharoMn2
        codes P
        noelement
        family 16, 37
        rarity 5
        library 171
        abc 104
        damage 120
        .byte 0xCC, 0x0
        chip_icon 149
        chip_art 129
    @ 150: PharoMn3
        codes P
        noelement
        family 16, 38
        rarity 5
        library 172
        abc 105
        damage 140
        .byte 0xCC, 0x0
        chip_icon 150
        chip_art 130
    @ 151: ShadoMan
        codes S
        noelement
        family 16, 39
        rarity 5
        library 173
        abc 136
        damage 80
        .byte 0xCC, 0x0
        chip_icon 151
        chip_art 131
    @ 152: ShadoMn2
        codes S
        noelement
        family 16, 40
        rarity 5
        library 174
        abc 137
        damage 90
        .byte 0xCC, 0x0
        chip_icon 152
        chip_art 132
    @ 153: ShadoMn3
        codes S
        noelement
        family 16, 41
        rarity 5
        library 175
        abc 138
        damage 100
        .byte 0xCC, 0x0
        chip_icon 153
        chip_art 133
    @ 154: 0x9A
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 154
        chip_art 0
    @ 155: 0x9B
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 155
        chip_art 0
    @ 156: 0x9C
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 156
        chip_art 0
    @ 157: MagicMan
        codes M
        noelement
        family 16, 42
        rarity 3
        library 158
        abc 90
        damage 100
        .byte 0xCC, 0x0
        chip_icon 157
        chip_art 134
    @ 158: MagicMn2
        codes M
        noelement
        family 16, 43
        rarity 4
        library 159
        abc 91
        damage 120
        .byte 0xCC, 0x0
        chip_icon 158
        chip_art 135
    @ 159: MagicMn3
        codes M
        noelement
        family 16, 44
        rarity 5
        library 160
        abc 92
        damage 140
        .byte 0xCC, 0x0
        chip_icon 159
        chip_art 136
    @ 160: Roll
        codes R
        noelement
        family 16, 21
        rarity 3
        library 128
        abc 133
        damage 60
        .byte 0xCC, 0x0
        chip_icon 160
        chip_art 137
    @ 161: Roll2
        codes R
        noelement
        family 16, 22
        rarity 4
        library 129
        abc 134
        damage 80
        .byte 0xCC, 0x0
        chip_icon 161
        chip_art 138
    @ 162: Roll3
        codes R
        noelement
        family 16, 23
        rarity 5
        library 130
        abc 135
        damage 100
        .byte 0xCC, 0x0
        chip_icon 162
        chip_art 139
    @ 163: GutsMan
        codes G
        noelement
        family 16, 9
        rarity 3
        library 131
        abc 61
        damage 40
        .byte 0xCC, 0x0
        chip_icon 163
        chip_art 140
    @ 164: GutsMan2
        codes G
        noelement
        family 16, 10
        rarity 4
        library 132
        abc 62
        damage 70
        .byte 0xCC, 0x0
        chip_icon 164
        chip_art 141
    @ 165: GutsMan3
        codes G
        noelement
        family 16, 11
        rarity 5
        library 133
        abc 63
        damage 100
        .byte 0xCC, 0x0
        chip_icon 165
        chip_art 142
    @ 166: ProtoMan
        codes B
        noelement
        family 16, 27
        rarity 3
        library 134
        abc 107
        damage 140
        .byte 0xCC, 0x0
        chip_icon 166
        chip_art 143
    @ 167: ProtoMn2
        codes B
        noelement
        family 16, 28
        rarity 4
        library 135
        abc 108
        damage 160
        .byte 0xCC, 0x0
        chip_icon 167
        chip_art 144
    @ 168: ProtoMn3
        codes B
        noelement
        family 16, 29
        rarity 5
        library 136
        abc 109
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
        abc 171
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
        abc 172
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
        abc 173
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
        abc 49
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
        abc 50
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
        abc 51
        damage 150
        .byte 0xCC, 0x0
        chip_icon 174
        chip_art 151
    @ 175: NumbrMan
        codes N
        noelement
        family 16, 6
        rarity 3
        library 140
        abc 100
        damage 0
        .byte 0xCC, 0x0
        chip_icon 175
        chip_art 152
    @ 176: NumbrMn2
        codes N
        noelement
        family 16, 7
        rarity 4
        library 141
        abc 101
        damage 0
        .byte 0xCC, 0x0
        chip_icon 176
        chip_art 153
    @ 177: NumbrMn3
        codes N
        noelement
        family 16, 8
        rarity 5
        library 142
        abc 102
        damage 0
        .byte 0xCC, 0x0
        chip_icon 177
        chip_art 154
    @ 178: StoneMan
        codes S
        noelement
        family 16, 15
        rarity 3
        library 143
        abc 154
        damage 100
        .byte 0xCC, 0x0
        chip_icon 178
        chip_art 155
    @ 179: StoneMn2
        codes S
        noelement
        family 16, 16
        rarity 4
        library 144
        abc 155
        damage 100
        .byte 0xCC, 0x0
        chip_icon 179
        chip_art 156
    @ 180: StoneMn3
        codes S
        noelement
        family 16, 17
        rarity 5
        library 145
        abc 156
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
        abc 72
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
        abc 73
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
        abc 74
        damage 100
        .byte 0xCC, 0x0
        chip_icon 183
        chip_art 160
    @ 184: SkullMan
        codes S
        noelement
        family 16, 18
        rarity 3
        library 164
        abc 144
        damage 150
        .byte 0xCC, 0x0
        chip_icon 184
        chip_art 161
    @ 185: SkullMn2
        codes S
        noelement
        family 16, 19
        rarity 4
        library 165
        abc 145
        damage 180
        .byte 0xCC, 0x0
        chip_icon 185
        chip_art 162
    @ 186: SkullMn3
        codes S
        noelement
        family 16, 20
        rarity 5
        library 166
        abc 146
        damage 210
        .byte 0xCC, 0x0
        chip_icon 186
        chip_art 163
    @ 187: ColorMan
        codes C
        noelement
        family 16, 24
        rarity 3
        library 149
        abc 28
        damage 90
        .byte 0xCC, 0x0
        chip_icon 187
        chip_art 164
    @ 188: ColorMn2
        codes C
        noelement
        family 16, 25
        rarity 4
        library 150
        abc 29
        damage 110
        .byte 0xCC, 0x0
        chip_icon 188
        chip_art 165
    @ 189: ColorMn3
        codes C
        noelement
        family 16, 26
        rarity 5
        library 151
        abc 30
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
        abc 13
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
        abc 14
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
        abc 15
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
        abc 139
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
        abc 140
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
        abc 141
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
        abc 43
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
        abc 44
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
        abc 45
        damage 150
        .byte 0xCC, 0x0
        chip_icon 198
        chip_art 175
    @ 199: Bass
        codes F
        noelement
        family 16, 48
        rarity 5
        library 176
        abc 6
        damage 200
        .byte 0xCC, 0x0
        chip_icon 199
        chip_art 176
    @ 200: 0xC8
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 200
        chip_art 0
    @ 201: 0xC9
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 60
        .byte 0xCC, 0x0
        chip_icon 201
        chip_art 0
    @ 202: Zeta Cannon 1
        nocodes
        noelement
        family 15, 0
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 202
        chip_art 0
    @ 203: Zeta Cannon 2
        nocodes
        noelement
        family 15, 1
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 203
        chip_art 0
    @ 204: Zeta Cannon 3
        nocodes
        noelement
        family 15, 2
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 204
        chip_art 0
    @ 205: Zeta Spread
        nocodes
        noelement
        family 15, 3
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 205
        chip_art 0
    @ 206: Zeta Ratton 1
        nocodes
        noelement
        family 15, 4
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 206
        chip_art 0
    @ 207: Zeta Ratton 2
        nocodes
        noelement
        family 15, 5
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 207
        chip_art 0
    @ 208: Zeta Ratton 3
        nocodes
        noelement
        family 15, 6
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 208
        chip_art 0
    @ 209: Zeta Arrow
        nocodes
        noelement
        family 15, 7
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 209
        chip_art 0
    @ 210: Zeta Spear
        nocodes
        noelement
        family 15, 8
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 210
        chip_art 0
    @ 211: Zeta Lance
        nocodes
        noelement
        family 15, 9
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 211
        chip_art 0
    @ 212: Omega Cannon 1
        nocodes
        noelement
        family 15, 10
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 212
        chip_art 0
    @ 213: Omega Cannon 2
        nocodes
        noelement
        family 15, 11
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 213
        chip_art 0
    @ 214: Omega Cannon 3
        nocodes
        noelement
        family 15, 12
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 214
        chip_art 0
    @ 215: Omega Spread
        nocodes
        noelement
        family 15, 13
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 215
        chip_art 0
    @ 216: Omega Ratton 1
        nocodes
        noelement
        family 15, 14
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 216
        chip_art 0
    @ 217: Omega Ratton 2
        nocodes
        noelement
        family 15, 15
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 217
        chip_art 0
    @ 218: Omega Ratton 3
        nocodes
        noelement
        family 15, 16
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 218
        chip_art 0
    @ 219: Omega Arrow
        nocodes
        noelement
        family 15, 17
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 219
        chip_art 0
    @ 220: Omega Spear
        nocodes
        noelement
        family 15, 18
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 220
        chip_art 0
    @ 221: Omega Lance
        nocodes
        noelement
        family 15, 19
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 221
        chip_art 0
    @ 222: Beta Bomb
        nocodes
        noelement
        family 20, 0
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 222
        chip_art 0
    @ 223: Beta Sword
        nocodes
        noelement
        family 20, 1
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 223
        chip_art 0
    @ 224: Beta Wave
        nocodes
        noelement
        family 20, 2
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 224
        chip_art 0
    @ 225: Beta Quake
        nocodes
        noelement
        family 20, 3
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 225
        chip_art 0
    @ 226: Sigma Bomb
        nocodes
        noelement
        family 20, 4
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 226
        chip_art 0
    @ 227: Sigma Sword
        nocodes
        noelement
        family 20, 5
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 227
        chip_art 0
    @ 228: Sigma Wave
        nocodes
        noelement
        family 20, 6
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 228
        chip_art 0
    @ 229: Sigma Quake
        nocodes
        noelement
        family 20, 7
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 229
        chip_art 0
    @ 230: Powered Cannon
        nocodes
        noelement
        family 14, 0
        rarity 1
        nolibrary
        no_abc
        damage 200
        .byte 0xCC, 0x0
        chip_icon 230
        chip_art 0
    @ 231: Heavy Stamp
        nocodes
        noelement
        family 13, 47
        rarity 1
        nolibrary
        no_abc
        damage 400
        .byte 0xCC, 0x0
        chip_icon 231
        chip_art 0
    @ 232: Big Straight
        nocodes
        noelement
        family 13, 30
        rarity 1
        nolibrary
        no_abc
        damage 250
        .byte 0xCC, 0x0
        chip_icon 232
        chip_art 0
    @ 233: Blood Suck
        nocodes
        noelement
        family 13, 48
        rarity 1
        nolibrary
        no_abc
        damage 200
        .byte 0xCC, 0x0
        chip_icon 233
        chip_art 0
    @ 234: Death Storm
        nocodes
        noelement
        family 13, 32
        rarity 1
        nolibrary
        no_abc
        damage 200
        .byte 0xCC, 0x0
        chip_icon 234
        chip_art 0
    @ 235: Guts Shoot
        nocodes
        noelement
        family 13, 31
        rarity 1
        nolibrary
        no_abc
        damage 500
        .byte 0xCC, 0x0
        chip_icon 235
        chip_art 0
    @ 236: Life Saver
        nocodes
        noelement
        family 13, 45
        rarity 1
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 236
        chip_art 0
    @ 237: Double Hero
        nocodes
        noelement
        family 13, 46
        rarity 1
        nolibrary
        no_abc
        damage 400
        .byte 0xCC, 0x0
        chip_icon 237
        chip_art 0
    @ 238: 0xEE
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 238
        chip_art 0
    @ 239: 0xEF
        nocodes
        noelement
        nofamily
        norarity
        nolibrary
        no_abc
        damage 0
        .byte 0xCC, 0x0
        chip_icon 239
        chip_art 0


_ts Battle_GetEntryState
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_battleEntryState]
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
    bl         Div
    push       {r0}
    mov        r0,r8
    asr        r0,r0,#0x10
    add        r0,#0x30
    mov        r1,#0x18
    bl         Div
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
    LoadMain battle, r7, r7
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
    LoadMain battle, r7, r7
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
    LoadMain battle, r7, r7
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
    LoadMain battle, r7, r7
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


_nt Battle_SetEncounter
    push       {lr}
    LoadMain world, r7, r7
    str        r0,[r7,#World_enemyList]
    pop        {pc}


_nt Battle_IsRandomEncounter
    push       {lr}
    mov        r0,#0x0
    LoadMain world, r7, r7
    LoadMain gameStats, r6, r6
    ldrb       r3,[r7,#World_currentArea]
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
    bl         Sound_PlaySE
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
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_08009b44
    ldrb       r0,[r7,#Battle_initialActorsSpawned]
    add        r0,#0x1
    strb       r0,[r7,#Battle_initialActorsSpawned]
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
    LoadMain battle, r7, r7
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
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_multiDeleteTempCounter]
    add        r0,#0x1
    strb       r0,[r7,#Battle_multiDeleteTempCounter]
    mov        r0,#0xa
    strb       r0,[r7,#Battle_multiDeleteBufferTimer]
    pop        {pc}


_nt Inventory_AddChip
    push       {lr}
    push       {r0,r1,r2}
    bl         Flag_SetLibrary
    pop        {r0,r1,r2}
    push       {r2}
    bl         Inventory_GetChipCountLocation
    pop        {r2}
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
    push       {r3}
    bl         Inventory_SetChecksum
    pop        {r3}
    add        r0,r3,#0x0
    pop        {pc}

_nt Inventory_SetChip
    push       {lr}
    push       {r2}
    bl         Inventory_GetChipCountLocation
    pop        {r2}
    str        r2,[r0,#0x0]
    tst        r2,r2
    bne        LAB_08009bea
    bl         Inventory_SetChecksum
LAB_08009bea:
    pop        {pc}

_ts Inventory_SubtractChip
    push       {lr}
    push       {r2}
    bl         Inventory_GetChipCountLocation
    pop        {r2}
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
    push       {r3}
    bl         Inventory_ClearChecksum
    pop        {r3}
LAB_08009c16:
    add        r0,r3,#0x0
    pop        {pc}


@@ Gets the location of the amount of the battle chip specified, from the battle chip inventory.
@@ In:
@@ r0: chipID - The chip ID to check.
@@ r1: chipCode - The chip code to check.
@@
@@ Out:
@@ r0: chipCountLoc - The memory location containing the amount of the chip specified.
_nt Inventory_GetChipCountLocation
    push       {lr}
    add        r2,r0,#0x0
    push       {r1,r2}
    bl         BattleChip_GetChipData
    pop        {r1,r2}
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
    pop        {pc}

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
    push       {lr}
    add        r2,r0,#0x0
    push       {r1,r2}
    bl         BattleChip_GetChipData
    pop        {r1,r2}
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
    pop        {pc}

    .align 2, 0
    .pool

_ts Inventory_GetChipCount
    push       {lr}
    bl         Inventory_GetChipCountLocation
    ldrb       r0,[r0,#0x0]
    pop        {pc}

_nt Inventory_AddZenny
    push       {lr}
    LoadMain world, r7, r7
    ldr        r1,[r7,#World_zenny]
    add        r0,r0,r1
    ldr        r1,=999999
    cmp        r0,r1
    ble        LAB_08009c94
    add        r0,r1,#0x0
LAB_08009c94:
    str        r0,[r7,#World_zenny]
    pop        {pc}

    .align 2, 0
    .pool

_ts Inventory_SubtractZenny
    push       {lr}
    LoadMain world, r7, r7
    ldr        r1,[r7,#World_zenny]
    sub        r1,r1,r0
    bpl        LAB_08009c94
    mov        r1,#0x0
    str        r1,[r7,#World_zenny]
    pop        {pc}


_nt Battle_IsOutOfBounds
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
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x16]
    tst        r0,r0
    bne        LAB_08009ce0
    ldrh       r0,[r7,#Battle_curPlayerCount]
    sub        r0,#0x1
    strh       r0,[r7,#Battle_curPlayerCount]
    bne        LAB_08009cec
    mov        r1,#0x1
    strb       r1,[r7,#Battle_isInputLocked]
    b          LAB_08009cec
LAB_08009ce0:
    ldrh       r0,[r7,#Battle_curEnemyCount]
    sub        r0,#0x1
    strh       r0,[r7,#Battle_curEnemyCount]
    bne        LAB_08009cec
    mov        r1,#0x1
    strb       r1,[r7,#Battle_isInputLocked]
LAB_08009cec:
    mov        pc,lr


_nt Battle_IsInputLocked
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#Battle_isInputLocked]
    tst        r0,r0
    mov        pc,lr


_nt Battle_AdvanceTimer
    push       {lr}
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_battleType]
    cmp        r0,#0x8
    bge        LAB_08009d16
    LoadMain gameStats, r7, r7
    ldr        r0,[r7,#World_hpCurrent]
    add        r0,#0x1
    ldr        r1,DAT_08009d18
    cmp        r0,r1
    ble        LAB_08009d14
    add        r0,r1,#0x0
LAB_08009d14:
    str        r0,[r7,#World_hpCurrent]
LAB_08009d16:
    pop        {pc}

    .align 2, 0

DAT_08009d18: .word 60 * 359999


_nt Battle_IncreaseBattleCount
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_battleType]
    cmp        r0,#0x8
    bge        LAB_08009d44
    LoadMain gameStats, r7, r7
    ldrh       r0,[r7,#World_commentaryTextIndex]
    add        r0,#0x1
    ldr        r1,DAT_08009d48
    cmp        r0,r1
    ble        LAB_08009d36
    add        r0,r1,#0x0
LAB_08009d36:
    strh       r0,[r7,#World_commentaryTextIndex]
    ldrb       r0,[r7,#World_battleType]
    add        r0,#0x1
    cmp        r0,#0xff
    ble        LAB_08009d42
    mov        r0,#0xff
LAB_08009d42:
    strb       r0,[r7,#World_battleType]
LAB_08009d44:
    mov        pc,lr

    .align 2, 0


DAT_08009d48: .word 0xFFFF


_ts Battle_IncrementRewardChipCounter
    LoadMain world, r7, r7
    ldrb       r0,[r7,#World_battleType]
    cmp        r0,#0x8
    bge        LAB_08009d66
    LoadMain gameStats, r7, r7
    ldrb       r0,[r7,#World_curEventFlag]
    add        r0,#0x1
    cmp        r0,#0xff
    ble        LAB_08009d64
    mov        r0,#0xff
LAB_08009d64:
    strb       r0,[r7,#World_curEventFlag]
LAB_08009d66:
    mov        pc,lr


_ts Battle_SpriteQueueAdd
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


_nt Battle_SpriteQueueTransferAll
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

_ts Battle_SpriteQueueInit
    mov        r0,#0x0
    ldr        r7,=gBattleSpriteArgsArrayCount
    str        r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0
    .pool
