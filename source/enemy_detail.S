#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"
    .include "macros/enemy_detail.inc"
    .text

    .thumb

thumb_func_start Enemy_GetEnemyDetail
Enemy_GetEnemyDetail:
    mov        r1,#0x20
    mul        r1,r0
    ldr        r0,=arrayEnemyDetails
    add        r0,r0,r1
    mov        pc,lr
thumb_func_end Enemy_GetEnemyDetail

    .align 2, 0

    .pool

arrayEnemyDetails:
_0: @ Megaman
    hp 100
    element EL_None
    .byte 0x32, 0x0, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_1: @ Mettaur1
    hp 40
    element EL_None
    .byte 0x22, 0x4, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 60
    zenny 60
    zenny 80
    chip CD_MetGuard CC_G
    zenny 100
    chip CD_MetGuard CC_A
    zenny 150
    chip CD_ShokWave CC_K
    zenny 200
    chip CD_ShokWave CC_C
_2: @ Mettaur2
    hp 60
    element EL_None
    .byte 0x22, 0x4, 0x1, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    chip CD_MetGuard CC_G
    chip CD_SoniWave CC_M
    zenny 200
    chip CD_SoniWave CC_D
    zenny 250
    chip CD_SoniWave CC_C
_3: @ Mettaur3
    hp 100
    element EL_None
    .byte 0x22, 0x4, 0x1, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    chip CD_MetGuard CC_L
    zenny 200
    chip CD_DynaWave CC_M
    zenny 250
    chip CD_DynaWave CC_S
    zenny 300
    chip CD_DynaWave CC_C
_4: @ Canodumb1
    hp 50
    element EL_None
    .byte 0x36, 0x2, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 60
    zenny 60
    zenny 80
    zenny 80
    zenny 100
    chip CD_Cannon CC_A
    zenny 150
    chip CD_Cannon CC_B
    zenny 200
    chip CD_Cannon CC_D
_5: @ Canodumb2
    hp 80
    element EL_None
    .byte 0x36, 0x2, 0x10, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    chip CD_HiCannon CC_F
    zenny 250
    chip CD_HiCannon CC_G
    zenny 300
    chip CD_HiCannon CC_H
_6: @ Canodumb3
    hp 100
    element EL_None
    .byte 0x36, 0x2, 0x10, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    chip CD_M_Cannon CC_K
    zenny 250
    chip CD_M_Cannon CC_O
    zenny 300
    chip CD_M_Cannon CC_M
_7: @ Vulgear
    hp 80
    element EL_Fire
    .byte 0x32, 0x5, 0x14, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    zenny 150
    zenny 200
    chip CD_FireTowr CC_F
    chip CD_FireTowr CC_E
    chip CD_FireTowr CC_M
_8: @ Vatgear
    hp 120
    element EL_Water
    .byte 0x32, 0x5, 0x14, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_AquaTowr CC_R
    zenny 300
    chip CD_AquaTowr CC_H
    zenny 350
    chip CD_AquaTowr CC_G
_9: @ Vulgear_X
    hp 80
    element EL_Fire
    .byte 0x32, 0x5, 0x14, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 30
    zenny 30
    zenny 50
    zenny 50
    zenny 80
    zenny 80
    chip CD_FireTowr CC_F
    zenny 80
    chip CD_FireTowr CC_J
    zenny 100
_10: @ Spooky1
    hp 50
    element EL_None
    .byte 0x3A, 0xA, 0x20, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    chip CD_Recov10 CC_G
    zenny 150
    chip CD_Invis1 CC_I
    zenny 200
    chip CD_Invis1 CC_L
    chip CD_Invis1 CC_J
    zenny 250
_11: @ Spooky2
    hp 100
    element EL_None
    .byte 0x3A, 0xA, 0x20, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_Invis2 CC_C
    chip CD_Recov50 CC_A
    chip CD_Invis2 CC_A
    chip CD_Recov80 CC_A
    chip CD_Invis2 CC_J
_12: @ Spooky3
    hp 120
    element EL_None
    .byte 0x3A, 0xA, 0x20, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    chip CD_Recov10 CC_C
    chip CD_Recov10 CC_L
    chip CD_Recov30 CC_C
    chip CD_Recov50 CC_E
    zenny 400
    chip CD_Recov80 CC_L
    chip CD_Recov120 CC_L
    chip CD_Recov150 CC_G
    chip CD_Invis3 CC_N
    chip CD_Recov200 CC_A
_13: @ Beetank1
    hp 80
    element EL_None
    .byte 0x2E, 0x9, 0x1F, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    chip CD_LilBomb CC_O
    zenny 200
    chip CD_LilBomb CC_B
    zenny 250
    chip CD_LilBomb CC_D
_14: @ Beetank2
    hp 120
    element EL_None
    .byte 0x2E, 0x9, 0x1F, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_CrosBomb CC_H
    zenny 300
    chip CD_CrosBomb CC_D
    zenny 350
    chip CD_CrosBomb CC_B
_15: @ Beetank3
    hp 150
    element EL_None
    .byte 0x2E, 0x9, 0x1F, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_BigBomb CC_T
    zenny 450
    chip CD_BigBomb CC_O
    zenny 500
    chip CD_BigBomb CC_B
_16: @ Handy1
    hp 80
    element EL_None
    .byte 0x0, 0x1A, 0x29, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    zenny 150
    zenny 200
    chip CD_TimeBom1 CC_J
    zenny 250
    chip CD_TimeBom1 CC_L
_17: @ Handy2
    hp 200
    element EL_None
    .byte 0x0, 0x1A, 0x29, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    chip CD_TimeBom2 CC_J
    zenny 400
    chip CD_TimeBom2 CC_C
_18: @ Handy3
    hp 300
    element EL_None
    .byte 0x0, 0x1A, 0x29, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_TimeBom3 CC_O
    zenny 550
    chip CD_TimeBom3 CC_G
    zenny 600
    chip CD_TimeBom3 CC_B
_19: @ Flappy1
    hp 60
    element EL_None
    .byte 0x36, 0x12, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    chip CD_Quake1 CC_H
    zenny 200
    chip CD_Quake1 CC_A
    chip CD_Quake1 CC_K
    chip CD_Quake1 CC_Q
_20: @ Flappy2
    hp 120
    element EL_None
    .byte 0x36, 0x12, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    chip CD_Quake2 CC_Q
    zenny 250
    chip CD_Quake2 CC_C
    zenny 300
    chip CD_Quake2 CC_B
_21: @ Flappy3
    hp 150
    element EL_None
    .byte 0x36, 0x12, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    chip CD_Quake3 CC_Q
    zenny 350
    chip CD_Quake3 CC_M
    zenny 400
    chip CD_Quake3 CC_D
_22: @ Floshell1
    hp 120
    element EL_None
    .byte 0x0, 0x18, 0x3F, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 460
    chip CD_IronShld CC_T
    zenny 480
    chip CD_IronShld CC_R
    zenny 500
    chip CD_IronShld CC_O
    zenny 550
    chip CD_IronShld CC_B
    zenny 600
    chip CD_IronShld CC_A
_23: @ Floshell2
    hp 200
    element EL_None
    .byte 0x0, 0x18, 0x3F, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_24: @ Floshell3
    hp 250
    element EL_None
    .byte 0x0, 0x18, 0x3F, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_25: @ HardHead1
    hp 60
    element EL_None
    .byte 0x36, 0xD, 0x25, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    zenny 200
    zenny 250
    zenny 250
    zenny 300
    chip CD_Howitzer CC_H
_26: @ HardHead2
    hp 70
    element EL_None
    .byte 0x36, 0xD, 0x25, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_27: @ HardHead3
    hp 80
    element EL_None
    .byte 0x36, 0xD, 0x25, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_28: @ Swordy1
    hp 90
    element EL_None
    .byte 0x0, 0x10, 0x28, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    chip CD_LongSwrd CC_D
    zenny 250
    chip CD_LongSwrd CC_S
    zenny 300
    chip CD_WideSwrd CC_S
_29: @ Swordy2
    hp 120
    element EL_Fire
    .byte 0x0, 0x10, 0x28, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    chip CD_Sword CC_K
    zenny 250
    chip CD_FireSwrd CC_B
    zenny 300
    chip CD_FireSwrd CC_N
_30: @ Swordy3
    hp 200
    element EL_Water
    .byte 0x0, 0x10, 0x28, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    chip CD_Sword CC_L
    chip CD_Sword CC_P
    chip CD_AquaSwrd CC_P
    zenny 400
    chip CD_AquaSwrd CC_N
_31: @ Fishy1
    hp 80
    element EL_None
    .byte 0x36, 0xE, 0x26, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 60
    zenny 60
    zenny 80
    zenny 80
    zenny 100
    chip CD_Dash CC_D
    zenny 150
    chip CD_Dash CC_B
    zenny 200
    chip CD_Dash CC_G
_32: @ Fishy2
    hp 150
    element EL_Fire
    .byte 0x36, 0xE, 0x26, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    chip CD_BodyBurn CC_F
    chip CD_BodyBurn CC_K
    chip CD_BodyBurn CC_E
_33: @ Fishy3
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0x26, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_34: @ Piranha1
    hp 100
    element EL_Water
    .byte 0x36, 0x13, 0x3B, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_TriArrow CC_E
    chip CD_TriArrow CC_D
    chip CD_TriArrow CC_C
    chip CD_TriArrow CC_B
    chip CD_TriArrow CC_A
_35: @ Piranha2
    hp 150
    element EL_Water
    .byte 0x36, 0x13, 0x3B, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_TriSpear CC_F
    chip CD_TriSpear CC_J
    chip CD_TriSpear CC_G
    chip CD_TriSpear CC_H
    chip CD_TriSpear CC_I
_36: @ Piranha3
    hp 200
    element EL_Water
    .byte 0x36, 0x13, 0x3B, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_TriLance CC_K
    zenny 550
    chip CD_TriLance CC_L
    chip CD_TriLance CC_N
    chip CD_TriLance CC_O
_37: @ AquaPuffy
    hp 100
    element EL_Water
    .byte 0x3A, 0x11, 0x27, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_Bubbler CC_P
    zenny 300
    chip CD_Bubbler CC_A
    zenny 350
    chip CD_Bubbler CC_S
_38: @ HeatPuffy
    hp 100
    element EL_Fire
    .byte 0x3A, 0x11, 0x27, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_Heater CC_F
    zenny 300
    chip CD_Heater CC_G
    zenny 350
    chip CD_Heater CC_K
_39: @ 0x27
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0x27, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_40: @ ColdBear1
    hp 200
    element EL_Water
    .byte 0x36, 0x1C, 0x3D, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_IceCube CC_A
    chip CD_IceCube CC_M
    chip CD_IceCube CC_C
    zenny 600
    chip CD_IceCube CC_L
_41: @ ColdBear2
    hp 250
    element EL_Water
    .byte 0x36, 0x1C, 0x3D, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_42: @ ColdBear3
    hp 300
    element EL_Water
    .byte 0x36, 0x1C, 0x3D, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_43: @ Cloudy1
    hp 120
    element EL_Water
    .byte 0x36, 0x14, 0x3C, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    chip CD_Cloud CC_R
    zenny 300
    chip CD_Cloud CC_O
    zenny 350
    chip CD_Cloud CC_B
_44: @ Cloudy2
    hp 140
    element EL_Water
    .byte 0x36, 0x14, 0x3C, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Cloudier CC_I
    zenny 550
    chip CD_Cloudier CC_M
    zenny 600
    chip CD_Cloudier CC_P
_45: @ Cloudy3
    hp 160
    element EL_Water
    .byte 0x36, 0x14, 0x3C, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Cloudest CC_O
    zenny 550
    chip CD_Cloudest CC_K
    zenny 600
    chip CD_Cloudest CC_C
_46: @ Ratty1
    hp 60
    element EL_None
    .byte 0x36, 0x20, 0x41, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    chip CD_Ratton1 CC_A
    chip CD_Ratton1 CC_C
    chip CD_Ratton1 CC_B
    zenny 450
    chip CD_Ratton1 CC_D
_47: @ Ratty2
    hp 80
    element EL_None
    .byte 0x36, 0x20, 0x41, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Ratton2 CC_F
    chip CD_Ratton2 CC_G
    chip CD_Ratton2 CC_H
    zenny 600
    chip CD_Ratton2 CC_I
_48: @ Ratty3
    hp 100
    element EL_None
    .byte 0x36, 0x20, 0x41, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 400
    zenny 400
    zenny 450
    zenny 450
    zenny 500
    chip CD_Ratton3 CC_L
    zenny 500
    chip CD_Ratton3 CC_N
    zenny 600
    chip CD_Ratton3 CC_O
_49: @ Miney1
    hp 100
    element EL_None
    .byte 0x3E, 0x27, 0x43, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    chip CD_Mine1 CC_G
    chip CD_Mine1 CC_H
    chip CD_Mine1 CC_M
_50: @ Miney2
    hp 120
    element EL_None
    .byte 0x3E, 0x27, 0x43, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Mine2 CC_C
    zenny 550
    chip CD_Mine2 CC_J
    zenny 600
    chip CD_Mine2 CC_L
_51: @ Miney3
    hp 140
    element EL_None
    .byte 0x3E, 0x27, 0x43, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Mine3 CC_T
    zenny 550
    chip CD_Mine3 CC_A
    zenny 600
    chip CD_Mine3 CC_B
_52: @ Ammonicule1
    hp 60
    element EL_Water
    .byte 0x36, 0x28, 0x44, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    chip CD_BblWrap1 CC_E
    chip CD_BblWrap1 CC_G
    chip CD_BblWrap1 CC_I
_53: @ Ammonicule2
    hp 90
    element EL_Water
    .byte 0x36, 0x28, 0x44, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 400
    zenny 400
    zenny 450
    zenny 450
    zenny 500
    zenny 500
    chip CD_BblWrap2 CC_D
    chip CD_BblWrap2 CC_F
    chip CD_BblWrap2 CC_H
    chip CD_BblWrap2 CC_N
_54: @ Ammonicule3
    hp 150
    element EL_Water
    .byte 0x36, 0x28, 0x44, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    chip CD_BblWrap3 CC_Q
    chip CD_BblWrap3 CC_L
    chip CD_BblWrap3 CC_B
    chip CD_BblWrap3 CC_R
_55: @ Jelly
    hp 120
    element EL_Water
    .byte 0x36, 0x1F, 0x42, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    zenny 350
    chip CD_Wave CC_I
    chip CD_Wave CC_A
_56: @ HeatJelly
    hp 150
    element EL_Fire
    .byte 0x36, 0x1F, 0x42, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    zenny 350
    chip CD_RedWave CC_N
    chip CD_RedWave CC_P
_57: @ EarthJelly
    hp 200
    element EL_Water
    .byte 0x36, 0x1F, 0x42, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    chip CD_BigWave CC_H
    chip CD_BigWave CC_Q
_58: @ Gaia1
    hp 150
    element EL_None
    .byte 0x48, 0x45, 0x4D, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_IronBody CC_R
    zenny 500
    chip CD_Gaia1 CC_D
    chip CD_Gaia1 CC_C
    chip CD_Gaia1 CC_T
_59: @ Gaia2
    hp 200
    element EL_None
    .byte 0x48, 0x45, 0x4D, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_IronBody CC_Q
    zenny 600
    chip CD_Gaia2 CC_K
    chip CD_Gaia2 CC_C
    chip CD_Gaia2 CC_S
_60: @ Gaia3
    hp 300
    element EL_None
    .byte 0x48, 0x45, 0x4D, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_IronBody CC_C
    zenny 600
    chip CD_Gaia3 CC_M
    chip CD_Gaia3 CC_C
    chip CD_IronBody CC_C
_61: @ Popper1
    hp 100
    element EL_Wood
    .byte 0x0, 0x21, 0x4C, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_WoodTowr CC_K
    zenny 450
    chip CD_WoodTowr CC_C
    zenny 500
    chip CD_WoodTowr CC_B
_62: @ Popper2
    hp 250
    element EL_Wood
    .byte 0x0, 0x21, 0x4C, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    chip CD_LeafShld CC_Q
    chip CD_LeafShld CC_C
_63: @ Popper3
    hp 120
    element EL_Wood
    .byte 0x0, 0x21, 0x4C, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    zenny 600
    chip CD_Dropdown CC_B
_64: @ Satella1
    hp 200
    element EL_None
    .byte 0x28, 0x47, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Lockon1 CC_I
    zenny 550
    chip CD_Lockon1 CC_H
    zenny 600
    chip CD_Lockon1 CC_D
_65: @ Satella2
    hp 240
    element EL_None
    .byte 0x28, 0x47, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Lockon2 CC_H
    zenny 550
    chip CD_Lockon2 CC_G
    zenny 600
    chip CD_Lockon2 CC_E
_66: @ Satella3
    hp 300
    element EL_None
    .byte 0x28, 0x47, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Lockon3 CC_N
    zenny 550
    chip CD_Lockon3 CC_K
    zenny 600
    chip CD_Lockon3 CC_D
_67: @ Fanner1
    hp 100
    element EL_None
    .byte 0x40, 0x34, 0x5F, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    chip CD_Typhoon CC_G
    zenny 400
    chip CD_Typhoon CC_B
    zenny 450
    chip CD_Typhoon CC_A
_68: @ Fanner2
    hp 140
    element EL_None
    .byte 0x40, 0x34, 0x5F, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Huricane CC_G
    zenny 550
    chip CD_Huricane CC_I
    zenny 600
    chip CD_Huricane CC_J
_69: @ Fanner3
    hp 180
    element EL_None
    .byte 0x40, 0x34, 0x5F, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Cyclone CC_G
    zenny 550
    chip CD_Cyclone CC_F
    zenny 600
    chip CD_Cyclone CC_H
_70: @ Remobit1
    hp 80
    element EL_Elec
    .byte 0x36, 0x2D, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    chip CD_Remobit1 CC_O
    zenny 400
    chip CD_Remobit1 CC_A
    zenny 450
    chip CD_Remobit1 CC_C
_71: @ Remobit2
    hp 100
    element EL_Elec
    .byte 0x36, 0x2D, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_Remobit2 CC_E
    zenny 450
    chip CD_Remobit2 CC_I
    zenny 500
    chip CD_Remobit2 CC_D
_72: @ Remobit3
    hp 120
    element EL_Elec
    .byte 0x36, 0x2D, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Remobit3 CC_G
    zenny 550
    chip CD_Remobit3 CC_P
    zenny 600
    chip CD_Remobit3 CC_Q
_73: @ Billy
    hp 100
    element EL_Elec
    .byte 0x36, 0x2B, 0x49, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    chip CD_Thunder1 CC_S
    zenny 400
    chip CD_Thunder1 CC_A
    zenny 450
    chip CD_Thunder1 CC_G
_74: @ Silly
    hp 150
    element EL_Elec
    .byte 0x36, 0x2B, 0x49, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Thunder2 CC_I
    zenny 550
    chip CD_Thunder2 CC_F
    zenny 600
    chip CD_Thunder2 CC_L
_75: @ Killy
    hp 200
    element EL_Elec
    .byte 0x36, 0x2B, 0x49, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Thunder3 CC_F
    zenny 550
    chip CD_Thunder3 CC_N
    zenny 600
    chip CD_Thunder3 CC_D
_76: @ Prog1
    hp 150
    element EL_Elec
    .byte 0x36, 0x2A, 0x4A, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    chip CD_RingZap1 CC_P
    zenny 400
    chip CD_RingZap1 CC_N
    zenny 450
    chip CD_RingZap1 CC_G
_77: @ Prog2
    hp 200
    element EL_Elec
    .byte 0x36, 0x2A, 0x4A, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    zenny 400
    zenny 400
    chip CD_RingZap2 CC_L
    chip CD_RingZap2 CC_J
    chip CD_RingZap2 CC_C
_78: @ Prog3
    hp 250
    element EL_Elec
    .byte 0x36, 0x2A, 0x4A, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    zenny 400
    zenny 400
    chip CD_RingZap3 CC_B
    chip CD_RingZap3 CC_A
    chip CD_RingZap3 CC_T
_79: @ MegalianA
    hp 200
    element EL_None
    .byte 0x36, 0x2C, 0x53, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    chip CD_AquaAura CC_L
    chip CD_AquaAura CC_R
    chip CD_AquaAura CC_S
_80: @ MegalianH
    hp 250
    element EL_None
    .byte 0x36, 0x2C, 0x53, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 560
    zenny 560
    zenny 580
    zenny 580
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    chip CD_FireAura CC_I
    chip CD_FireAura CC_B
_81: @ MegalianW
    hp 300
    element EL_None
    .byte 0x36, 0x2C, 0x53, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    zenny 600
    chip CD_WoodAura CC_F
_82: @ CanDevil1
    hp 160
    element EL_Fire
    .byte 0x36, 0x35, 0x60, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 350
    zenny 350
    chip CD_Candle1 CC_P
    chip CD_Candle1 CC_C
    chip CD_Candle1 CC_S
_83: @ CanDevil2
    hp 200
    element EL_Fire
    .byte 0x36, 0x35, 0x60, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    chip CD_Candle2 CC_B
    chip CD_Candle2 CC_E
    zenny 600
    chip CD_Candle2 CC_G
_84: @ CanDevil3
    hp 300
    element EL_Fire
    .byte 0x36, 0x35, 0x60, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    chip CD_Candle3 CC_M
    chip CD_Candle3 CC_H
    zenny 600
    chip CD_Candle3 CC_A
_85: @ BigSnake1
    hp 200
    element EL_Wood
    .byte 0x2C, 0x43, 0x64, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Snakegg1 CC_E
    zenny 550
    chip CD_Snakegg1 CC_B
    zenny 600
    chip CD_Snakegg1 CC_M
_86: @ BigSnake2
    hp 250
    element EL_Elec
    .byte 0x2C, 0x43, 0x64, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 550
    zenny 550
    chip CD_Snakegg2 CC_P
    chip CD_Snakegg2 CC_C
    chip CD_Snakegg2 CC_E
_87: @ BigSnake3
    hp 300
    element EL_Fire
    .byte 0x2C, 0x43, 0x64, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 550
    zenny 550
    chip CD_Snakegg3 CC_C
    chip CD_Snakegg3 CC_S
    chip CD_Snakegg3 CC_A
_88: @ Mosqurito1
    hp 200
    element EL_None
    .byte 0x48, 0x37, 0x69, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_Drain1 CC_O
    zenny 450
    chip CD_Drain1 CC_K
    zenny 500
    chip CD_Drain1 CC_A
_89: @ Mosqurito2
    hp 200
    element EL_None
    .byte 0x48, 0x37, 0x69, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Drain2 CC_T
    zenny 550
    chip CD_Drain2 CC_N
    zenny 600
    chip CD_Drain2 CC_A
_90: @ Mosqurito3
    hp 200
    element EL_None
    .byte 0x48, 0x37, 0x69, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Drain3 CC_Q
    zenny 550
    chip CD_Drain3 CC_F
    zenny 600
    chip CD_Drain3 CC_A
_91: @ Poitton1
    hp 100
    element EL_Wood
    .byte 0x36, 0x41, 0x67, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    chip CD_Dynamyt1 CC_Q
    zenny 450
    chip CD_Dynamyt1 CC_O
    zenny 500
    chip CD_Dynamyt1 CC_B
_92: @ Poitton2
    hp 250
    element EL_Wood
    .byte 0x36, 0x41, 0x67, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Dynamyt2 CC_K
    zenny 550
    chip CD_Dynamyt2 CC_C
    zenny 600
    chip CD_Dynamyt2 CC_A
_93: @ Poitton3
    hp 300
    element EL_Wood
    .byte 0x36, 0x41, 0x67, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    chip CD_Dynamyt3 CC_G
    zenny 550
    chip CD_Dynamyt3 CC_K
    zenny 600
    chip CD_Dynamyt3 CC_M
_94: @ Mole
    hp 10
    element EL_None
    .byte 0x36, 0x52, 0x65, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_Popup CC_N
    chip CD_Popup CC_K
    chip CD_Popup CC_H
    chip CD_Popup CC_D
    chip CD_Popup CC_C
    chip CD_Popup CC_N
    chip CD_Popup CC_K
    chip CD_Popup CC_H
    chip CD_Popup CC_D
    chip CD_Popup CC_C
_95: @ 0x5F
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_96: @ GutsManV1
    hp 200
    element EL_None
    .byte 0x0, 0xC, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_97: @ GutsManV2
    hp 400
    element EL_None
    .byte 0x0, 0xC, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_98: @ GutsManV3
    hp 600
    element EL_None
    .byte 0x0, 0xC, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    chip CD_GutsPnch CC_M
    chip CD_GutsPnch CC_B
    chip CD_GutsMan CC_G
    zenny 1500
    chip CD_GutsMan2 CC_G
    zenny 2000
    chip CD_GutsMan3 CC_G
_99: @ ProtoManV1
    hp 500
    element EL_None
    .byte 0x36, 0x26, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_100: @ ProtoManV2
    hp 600
    element EL_None
    .byte 0x36, 0x26, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
    chip CD_ProtoMan CC_B
_101: @ ProtoManV3
    hp 700
    element EL_None
    .byte 0x36, 0x26, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_ProtoMan CC_B
    zenny 1500
    chip CD_ProtoMn2 CC_B
    zenny 2000
    chip CD_ProtoMn3 CC_B
_102: @ WoodManV1
    hp 500
    element EL_Wood
    .byte 0x14, 0x1, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_103: @ WoodManV2
    hp 600
    element EL_Wood
    .byte 0x14, 0x1, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
    chip CD_WoodMan CC_W
_104: @ WoodManV3
    hp 700
    element EL_Wood
    .byte 0x14, 0x1, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_WoodMan CC_W
    zenny 1500
    chip CD_WoodMan2 CC_W
    zenny 2000
    chip CD_WoodMan3 CC_W
_105: @ FireManV1
    hp 300
    element EL_Fire
    .byte 0x0, 0x3, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
    zenny 1000
_106: @ FireManV2
    hp 400
    element EL_Fire
    .byte 0x0, 0x3, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
    chip CD_FireMan CC_F
_107: @ FireManV3
    hp 500
    element EL_Fire
    .byte 0x0, 0x3, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_FireMan CC_F
    zenny 1500
    chip CD_FireMan2 CC_F
    zenny 2000
    chip CD_FireMan3 CC_F
_108: @ NumberManV1
    hp 500
    element EL_None
    .byte 0x0, 0xF, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
    zenny 1500
_109: @ NumberManV2
    hp 600
    element EL_None
    .byte 0x0, 0xF, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
    chip CD_NumbrMan CC_N
_110: @ NumberManV3
    hp 700
    element EL_None
    .byte 0x0, 0xF, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_NumbrMan CC_N
    zenny 1500
    chip CD_NumbrMn2 CC_N
    zenny 2000
    chip CD_NumbrMn3 CC_N
_111: @ StoneManV1
    hp 600
    element EL_None
    .byte 0x0, 0x15, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
    zenny 2000
_112: @ StoneManV2
    hp 700
    element EL_None
    .byte 0x36, 0x15, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
    chip CD_StoneMan CC_S
_113: @ StoneManV3
    hp 800
    element EL_None
    .byte 0x36, 0x15, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_StoneMan CC_S
    zenny 1500
    chip CD_StoneMn2 CC_S
    zenny 2000
    chip CD_StoneMn3 CC_S
_114: @ IceManV1
    hp 500
    element EL_Water
    .byte 0x30, 0x1B, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
_115: @ IceManV2
    hp 600
    element EL_Water
    .byte 0x30, 0x1B, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
    chip CD_IceMan CC_I
_116: @ IceManV3
    hp 700
    element EL_Water
    .byte 0x30, 0x1B, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_IceMan CC_I
    zenny 1500
    chip CD_IceMan2 CC_I
    zenny 2000
    chip CD_IceMan3 CC_I
_117: @ SkullManV1
    hp 600
    element EL_None
    .byte 0x40, 0x22, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
    zenny 2500
_118: @ SkullManV2
    hp 700
    element EL_None
    .byte 0x40, 0x22, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
    chip CD_SkullMan CC_S
_119: @ SkullManV3
    hp 800
    element EL_None
    .byte 0x40, 0x22, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_SkullMan CC_S
    zenny 1500
    chip CD_SkullMn2 CC_S
    zenny 2000
    chip CD_SkullMn3 CC_S
_120: @ ColorManV1
    hp 600
    element EL_None
    .byte 0x0, 0x23, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_121: @ ColorManV2
    hp 700
    element EL_None
    .byte 0x0, 0x23, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
_122: @ ColorManV3
    hp 800
    element EL_None
    .byte 0x0, 0x23, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_ColorMan CC_C
    zenny 1500
    chip CD_ColorMn2 CC_C
    zenny 2000
    chip CD_ColorMn3 CC_C
_123: @ BombManV1
    hp 800
    element EL_None
    .byte 0x0, 0x2E, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
_124: @ BombManV2
    hp 900
    element EL_None
    .byte 0x0, 0x2E, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
    chip CD_BombMan CC_B
_125: @ BombManV3
    hp 1000
    element EL_None
    .byte 0x0, 0x2E, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_BombMan CC_B
    zenny 1500
    chip CD_BombMan2 CC_B
    zenny 2000
    chip CD_BombMan3 CC_B
_126: @ SharkManV1
    hp 700
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_127: @ SharkManV2
    hp 800
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
_128: @ SharkManV3
    hp 900
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_SharkMan CC_S
    zenny 1500
    chip CD_SharkMn2 CC_S
    zenny 2000
    chip CD_SharkMn3 CC_S
_129: @ ElecManV1
    hp 600
    element EL_Elec
    .byte 0x4E, 0x25, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
    zenny 3500
_130: @ ElecManV2
    hp 700
    element EL_Elec
    .byte 0x4E, 0x25, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
    chip CD_ElecMan CC_E
_131: @ ElecManV3
    hp 800
    element EL_Elec
    .byte 0x4E, 0x25, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_ElecMan CC_E
    zenny 1500
    chip CD_ElecMan2 CC_E
    zenny 2000
    chip CD_ElecMan3 CC_E
_132: @ PharaohManV1
    hp 800
    element EL_None
    .byte 0x0, 0x40, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
_133: @ PharaohManV2
    hp 900
    element EL_None
    .byte 0x0, 0x40, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
    chip CD_PharoMan CC_P
_134: @ PharaohManV3
    hp 1000
    element EL_None
    .byte 0x0, 0x40, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 5000
    chip CD_PharoMan CC_P
    zenny 6000
    chip CD_PharoMn2 CC_P
    chip CD_Anubis CC_L
    chip CD_PharoMn3 CC_P
_135: @ ShadowManV1
    hp 800
    element EL_None
    .byte 0x0, 0x42, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
_136: @ ShadowManV2
    hp 900
    element EL_None
    .byte 0x0, 0x42, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
    chip CD_ShadoMan CC_S
_137: @ ShadowManV3
    hp 1000
    element EL_None
    .byte 0x0, 0x42, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 5000
    chip CD_ShadoMan CC_S
    zenny 6000
    chip CD_ShadoMn2 CC_S
    chip CD_Muramasa CC_K
    chip CD_ShadoMn3 CC_S
_138: @ 0x8A
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_139: @ 0x8B
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_140: @ 0x8C
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_141: @ MagicManV1
    hp 700
    element EL_None
    .byte 0x0, 0x3F, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
    zenny 5000
_142: @ MagicManV2
    hp 800
    element EL_None
    .byte 0x0, 0x3F, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
    chip CD_MagicMan CC_M
_143: @ MagicManV3
    hp 900
    element EL_None
    .byte 0x0, 0x3F, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_MagicMan CC_M
    zenny 1500
    chip CD_MagicMn2 CC_M
    zenny 2000
    chip CD_MagicMn3 CC_M
_144: @ Bass
    hp 1000
    element EL_None
    .byte 0x0, 0x46, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 8000
    zenny 8000
    zenny 9000
    chip CD_LifeAura CC_H
    zenny 10000
    chip CD_LifeAura CC_K
    zenny 11000
    chip CD_LifeAura CC_M
    zenny 12000
    chip CD_LifeAura CC_P
_145: @ 0x91
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_146: @ 0x92
    hp 100
    element EL_None
    .byte 0x36, 0xE, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_147: @ LifeVirus
    hp 1000
    element EL_None
    .byte 0x0, 0x39, 0x68, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_148: @ BlueDummyV1
    hp 100
    element EL_Water
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_149: @ RedDummyV1
    hp 100
    element EL_Fire
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x1, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_150: @ BlueDummyV2
    hp 100
    element EL_Water
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x2, 0x0, 0x0, 0x0
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
_151: @ RedDummyV2
    hp 100
    element EL_Fire
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x3, 0x0, 0x0, 0x0
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
    chip CD_ColorMan CC_C
_152: @ BlueDummyV3
    hp 100
    element EL_Water
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x4, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_ColorMan CC_C
    zenny 1500
    chip CD_ColorMn2 CC_C
    zenny 2000
    chip CD_ColorMn3 CC_C
_153: @ RedDummyV3
    hp 100
    element EL_Fire
    .byte 0x36, 0x24, 0xFF, 0x0, 0x0, 0x5, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_ColorMan CC_C
    zenny 1500
    chip CD_ColorMn2 CC_C
    zenny 2000
    chip CD_ColorMn3 CC_C
_154: @ InvElecMan
    hp 600
    element EL_Elec
    .byte 0x4E, 0x25, 0xFF, 0x0, 0x0, 0x3, 0x0, 0x0, 0x0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
    zenny 0
_155: @ SharkManFinV1
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x80, 0x0, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_156: @ SharkManFinV2
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x80, 0x1, 0x0, 0x0
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
    zenny 3000
_157: @ SharkManFinV3_0
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x81, 0x0, 0x0, 0x0
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
_158: @ SharkManFinV3_1
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x81, 0x1, 0x0, 0x0
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
    chip CD_SharkMan CC_S
_159: @ SharkManFinV3_2
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x82, 0x0, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_SharkMan CC_S
    zenny 1500
    chip CD_SharkMn2 CC_S
    zenny 2000
    chip CD_SharkMn3 CC_S
_160: @ SharkManFinV3_3
    hp 0
    element EL_Water
    .byte 0x40, 0x29, 0xFF, 0x0, 0x0, 0x82, 0x1, 0x0, 0x0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    chip CD_SharkMan CC_S
    zenny 1500
    chip CD_SharkMn2 CC_S
    zenny 2000
    chip CD_SharkMn3 CC_S

    .end
