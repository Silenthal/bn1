global_label arrayEnemyDetails

_0: @ Megaman
    hp 100
    element None
    .byte 0x32
    routine 0x0
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x22
    routine 0x4
    lzSprite 0x1
    .short 0 
    .word 0
    zenny 60
    zenny 60
    zenny 80
    battlechip MetGuard G
    zenny 100
    battlechip MetGuard A
    zenny 150
    battlechip ShokWave K
    zenny 200
    battlechip ShokWave C
_2: @ Mettaur2
    hp 60
    element None
    .byte 0x22
    routine 0x4
    lzSprite 0x1
    .short 0 
    .word 1
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    battlechip MetGuard G
    battlechip SoniWave M
    zenny 200
    battlechip SoniWave D
    zenny 250
    battlechip SoniWave C
_3: @ Mettaur3
    hp 100
    element None
    .byte 0x22
    routine 0x4
    lzSprite 0x1
    .short 0 
    .word 2
    zenny 160
    zenny 160
    zenny 180
    battlechip MetGuard L
    zenny 200
    battlechip DynaWave M
    zenny 250
    battlechip DynaWave S
    zenny 300
    battlechip DynaWave C
_4: @ Canodumb1
    hp 50
    element None
    .byte 0x36
    routine 0x2
    lzSprite 0x10
    .short 0 
    .word 0
    zenny 60
    zenny 60
    zenny 80
    zenny 80
    zenny 100
    battlechip Cannon A
    zenny 150
    battlechip Cannon B
    zenny 200
    battlechip Cannon D
_5: @ Canodumb2
    hp 80
    element None
    .byte 0x36
    routine 0x2
    lzSprite 0x10
    .short 0 
    .word 2
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    battlechip HiCannon F
    zenny 250
    battlechip HiCannon G
    zenny 300
    battlechip HiCannon H
_6: @ Canodumb3
    hp 100
    element None
    .byte 0x36
    routine 0x2
    lzSprite 0x10
    .short 0 
    .word 1
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    battlechip M_Cannon K
    zenny 250
    battlechip M_Cannon O
    zenny 300
    battlechip M_Cannon M
_7: @ Vulgear
    hp 80
    element Fire
    .byte 0x32
    routine 0x5
    lzSprite 0x14
    .short 0 
    .word 0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    zenny 150
    zenny 200
    battlechip FireTowr F
    battlechip FireTowr E
    battlechip FireTowr M
_8: @ Vatgear
    hp 120
    element Water
    .byte 0x32
    routine 0x5
    lzSprite 0x14
    .short 0 
    .word 1
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip AquaTowr R
    zenny 300
    battlechip AquaTowr H
    zenny 350
    battlechip AquaTowr G
_9: @ Vulgear_X
    hp 80
    element Fire
    .byte 0x32
    routine 0x5
    lzSprite 0x14
    .short 0 
    .word 0
    zenny 30
    zenny 30
    zenny 50
    zenny 50
    zenny 80
    zenny 80
    battlechip FireTowr F
    zenny 80
    battlechip FireTowr J
    zenny 100
_10: @ Spooky1
    hp 50
    element None
    .byte 0x3A
    routine 0xA
    lzSprite 0x20
    .short 0 
    .word 0
    zenny 110
    zenny 110
    zenny 130
    battlechip Recov10 G
    zenny 150
    battlechip Invis1 I
    zenny 200
    battlechip Invis1 L
    battlechip Invis1 J
    zenny 250
_11: @ Spooky2
    hp 100
    element None
    .byte 0x3A
    routine 0xA
    lzSprite 0x20
    .short 0 
    .word 1
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip Invis2 C
    battlechip Recov50 A
    battlechip Invis2 A
    battlechip Recov80 A
    battlechip Invis2 J
_12: @ Spooky3
    hp 120
    element None
    .byte 0x3A
    routine 0xA
    lzSprite 0x20
    .short 0 
    .word 2
    battlechip Recov10 C
    battlechip Recov10 L
    battlechip Recov30 C
    battlechip Recov50 E
    zenny 400
    battlechip Recov80 L
    battlechip Recov120 L
    battlechip Recov150 G
    battlechip Invis3 N
    battlechip Recov200 A
_13: @ Beetank1
    hp 80
    element None
    .byte 0x2E
    routine 0x9
    lzSprite 0x1F
    .short 0 
    .word 0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    battlechip LilBomb O
    zenny 200
    battlechip LilBomb B
    zenny 250
    battlechip LilBomb D
_14: @ Beetank2
    hp 120
    element None
    .byte 0x2E
    routine 0x9
    lzSprite 0x1F
    .short 0 
    .word 1
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip CrosBomb H
    zenny 300
    battlechip CrosBomb D
    zenny 350
    battlechip CrosBomb B
_15: @ Beetank3
    hp 150
    element None
    .byte 0x2E
    routine 0x9
    lzSprite 0x1F
    .short 0 
    .word 2
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip BigBomb T
    zenny 450
    battlechip BigBomb O
    zenny 500
    battlechip BigBomb B
_16: @ Handy1
    hp 80
    element None
    .byte 0x0
    routine 0x1A
    lzSprite 0x29
    .short 0 
    .word 0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    zenny 150
    zenny 200
    battlechip TimeBom1 J
    zenny 250
    battlechip TimeBom1 L
_17: @ Handy2
    hp 200
    element None
    .byte 0x0
    routine 0x1A
    lzSprite 0x29
    .short 0 
    .word 1
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    battlechip TimeBom2 J
    zenny 400
    battlechip TimeBom2 C
_18: @ Handy3
    hp 300
    element None
    .byte 0x0
    routine 0x1A
    lzSprite 0x29
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip TimeBom3 O
    zenny 550
    battlechip TimeBom3 G
    zenny 600
    battlechip TimeBom3 B
_19: @ Flappy1
    hp 60
    element None
    .byte 0x36
    routine 0x12
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 110
    zenny 110
    zenny 130
    zenny 130
    zenny 150
    battlechip Quake1 H
    zenny 200
    battlechip Quake1 A
    battlechip Quake1 K
    battlechip Quake1 Q
_20: @ Flappy2
    hp 120
    element None
    .byte 0x36
    routine 0x12
    lzSprite 0xFF
    .short 0 
    .word 1
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    battlechip Quake2 Q
    zenny 250
    battlechip Quake2 C
    zenny 300
    battlechip Quake2 B
_21: @ Flappy3
    hp 150
    element None
    .byte 0x36
    routine 0x12
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    battlechip Quake3 Q
    zenny 350
    battlechip Quake3 M
    zenny 400
    battlechip Quake3 D
_22: @ Floshell1
    hp 120
    element None
    .byte 0x0
    routine 0x18
    lzSprite 0x3F
    .short 0 
    .word 0
    zenny 460
    battlechip IronShld T
    zenny 480
    battlechip IronShld R
    zenny 500
    battlechip IronShld O
    zenny 550
    battlechip IronShld B
    zenny 600
    battlechip IronShld A
_23: @ Floshell2
    hp 200
    element None
    .byte 0x0
    routine 0x18
    lzSprite 0x3F
    .short 0 
    .word 1
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
    element None
    .byte 0x0
    routine 0x18
    lzSprite 0x3F
    .short 0 
    .word 2
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
    element None
    .byte 0x36
    routine 0xD
    lzSprite 0x25
    .short 0 
    .word 0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    zenny 200
    zenny 250
    zenny 250
    zenny 300
    battlechip Howitzer H
_26: @ HardHead2
    hp 70
    element None
    .byte 0x36
    routine 0xD
    lzSprite 0x25
    .short 0 
    .word 1
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
    element None
    .byte 0x36
    routine 0xD
    lzSprite 0x25
    .short 0 
    .word 2
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
    element None
    .byte 0x0
    routine 0x10
    lzSprite 0x28
    .short 0 
    .word 0
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    battlechip LongSwrd D
    zenny 250
    battlechip LongSwrd S
    zenny 300
    battlechip WideSwrd S
_29: @ Swordy2
    hp 120
    element Fire
    .byte 0x0
    routine 0x10
    lzSprite 0x28
    .short 0 
    .word 1
    zenny 160
    zenny 160
    zenny 180
    zenny 180
    zenny 200
    battlechip Sword K
    zenny 250
    battlechip FireSwrd B
    zenny 300
    battlechip FireSwrd N
_30: @ Swordy3
    hp 200
    element Water
    .byte 0x0
    routine 0x10
    lzSprite 0x28
    .short 0 
    .word 2
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    battlechip Sword L
    battlechip Sword P
    battlechip AquaSwrd P
    zenny 400
    battlechip AquaSwrd N
_31: @ Fishy1
    hp 80
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0x26
    .short 0 
    .word 0
    zenny 60
    zenny 60
    zenny 80
    zenny 80
    zenny 100
    battlechip Dash D
    zenny 150
    battlechip Dash B
    zenny 200
    battlechip Dash G
_32: @ Fishy2
    hp 150
    element Fire
    .byte 0x36
    routine 0xE
    lzSprite 0x26
    .short 0 
    .word 1
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    battlechip BodyBurn F
    battlechip BodyBurn K
    battlechip BodyBurn E
_33: @ Fishy3
    hp 100
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0x26
    .short 0 
    .word 0
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
    element Water
    .byte 0x36
    routine 0x13
    lzSprite 0x3B
    .short 0 
    .word 0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip TriArrow E
    battlechip TriArrow D
    battlechip TriArrow C
    battlechip TriArrow B
    battlechip TriArrow A
_35: @ Piranha2
    hp 150
    element Water
    .byte 0x36
    routine 0x13
    lzSprite 0x3B
    .short 0 
    .word 1
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip TriSpear F
    battlechip TriSpear J
    battlechip TriSpear G
    battlechip TriSpear H
    battlechip TriSpear I
_36: @ Piranha3
    hp 200
    element Water
    .byte 0x36
    routine 0x13
    lzSprite 0x3B
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip TriLance K
    zenny 550
    battlechip TriLance L
    battlechip TriLance N
    battlechip TriLance O
_37: @ AquaPuffy
    hp 100
    element Water
    .byte 0x3A
    routine 0x11
    lzSprite 0x27
    .short 0 
    .word 0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip Bubbler P
    zenny 300
    battlechip Bubbler A
    zenny 350
    battlechip Bubbler S
_38: @ HeatPuffy
    hp 100
    element Fire
    .byte 0x3A
    routine 0x11
    lzSprite 0x27
    .short 0 
    .word 1
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip Heater F
    zenny 300
    battlechip Heater G
    zenny 350
    battlechip Heater K
_39: @ 0x27
    hp 100
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0x27
    .short 0 
    .word 0
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
    element Water
    .byte 0x36
    routine 0x1C
    lzSprite 0x3D
    .short 0 
    .word 0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip IceCube A
    battlechip IceCube M
    battlechip IceCube C
    zenny 600
    battlechip IceCube L
_41: @ ColdBear2
    hp 250
    element Water
    .byte 0x36
    routine 0x1C
    lzSprite 0x3D
    .short 0 
    .word 1
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
    element Water
    .byte 0x36
    routine 0x1C
    lzSprite 0x3D
    .short 0 
    .word 2
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
    element Water
    .byte 0x36
    routine 0x14
    lzSprite 0x3C
    .short 0 
    .word 0
    zenny 210
    zenny 210
    zenny 230
    zenny 230
    zenny 250
    battlechip Cloud R
    zenny 300
    battlechip Cloud O
    zenny 350
    battlechip Cloud B
_44: @ Cloudy2
    hp 140
    element Water
    .byte 0x36
    routine 0x14
    lzSprite 0x3C
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Cloudier I
    zenny 550
    battlechip Cloudier M
    zenny 600
    battlechip Cloudier P
_45: @ Cloudy3
    hp 160
    element Water
    .byte 0x36
    routine 0x14
    lzSprite 0x3C
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Cloudest O
    zenny 550
    battlechip Cloudest K
    zenny 600
    battlechip Cloudest C
_46: @ Ratty1
    hp 60
    element None
    .byte 0x36
    routine 0x20
    lzSprite 0x41
    .short 0 
    .word 0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    battlechip Ratton1 A
    battlechip Ratton1 C
    battlechip Ratton1 B
    zenny 450
    battlechip Ratton1 D
_47: @ Ratty2
    hp 80
    element None
    .byte 0x36
    routine 0x20
    lzSprite 0x41
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Ratton2 F
    battlechip Ratton2 G
    battlechip Ratton2 H
    zenny 600
    battlechip Ratton2 I
_48: @ Ratty3
    hp 100
    element None
    .byte 0x36
    routine 0x20
    lzSprite 0x41
    .short 0 
    .word 2
    zenny 400
    zenny 400
    zenny 450
    zenny 450
    zenny 500
    battlechip Ratton3 L
    zenny 500
    battlechip Ratton3 N
    zenny 600
    battlechip Ratton3 O
_49: @ Miney1
    hp 100
    element None
    .byte 0x3E
    routine 0x27
    lzSprite 0x43
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    battlechip Mine1 G
    battlechip Mine1 H
    battlechip Mine1 M
_50: @ Miney2
    hp 120
    element None
    .byte 0x3E
    routine 0x27
    lzSprite 0x43
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Mine2 C
    zenny 550
    battlechip Mine2 J
    zenny 600
    battlechip Mine2 L
_51: @ Miney3
    hp 140
    element None
    .byte 0x3E
    routine 0x27
    lzSprite 0x43
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Mine3 T
    zenny 550
    battlechip Mine3 A
    zenny 600
    battlechip Mine3 B
_52: @ Ammonicule1
    hp 60
    element Water
    .byte 0x36
    routine 0x28
    lzSprite 0x44
    .short 0 
    .word 0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    battlechip BblWrap1 E
    battlechip BblWrap1 G
    battlechip BblWrap1 I
_53: @ Ammonicule2
    hp 90
    element Water
    .byte 0x36
    routine 0x28
    lzSprite 0x44
    .short 0 
    .word 1
    zenny 400
    zenny 400
    zenny 450
    zenny 450
    zenny 500
    zenny 500
    battlechip BblWrap2 D
    battlechip BblWrap2 F
    battlechip BblWrap2 H
    battlechip BblWrap2 N
_54: @ Ammonicule3
    hp 150
    element Water
    .byte 0x36
    routine 0x28
    lzSprite 0x44
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    battlechip BblWrap3 Q
    battlechip BblWrap3 L
    battlechip BblWrap3 B
    battlechip BblWrap3 R
_55: @ Jelly
    hp 120
    element Water
    .byte 0x36
    routine 0x1F
    lzSprite 0x42
    .short 0 
    .word 0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    zenny 350
    battlechip Wave I
    battlechip Wave A
_56: @ HeatJelly
    hp 150
    element Fire
    .byte 0x36
    routine 0x1F
    lzSprite 0x42
    .short 0 
    .word 1
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 300
    zenny 350
    zenny 350
    battlechip RedWave N
    battlechip RedWave P
_57: @ EarthJelly
    hp 200
    element Water
    .byte 0x36
    routine 0x1F
    lzSprite 0x42
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    battlechip BigWave H
    battlechip BigWave Q
_58: @ Gaia1
    hp 150
    element None
    .byte 0x48
    routine 0x45
    lzSprite 0x4D
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip IronBody R
    zenny 500
    battlechip Gaia1 D
    battlechip Gaia1 C
    battlechip Gaia1 T
_59: @ Gaia2
    hp 200
    element None
    .byte 0x48
    routine 0x45
    lzSprite 0x4D
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip IronBody Q
    zenny 600
    battlechip Gaia2 K
    battlechip Gaia2 C
    battlechip Gaia2 S
_60: @ Gaia3
    hp 300
    element None
    .byte 0x48
    routine 0x45
    lzSprite 0x4D
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip IronBody C
    zenny 600
    battlechip Gaia3 M
    battlechip Gaia3 C
    battlechip IronBody C
_61: @ Popper1
    hp 100
    element Wood
    .byte 0x0
    routine 0x21
    lzSprite 0x4C
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip WoodTowr K
    zenny 450
    battlechip WoodTowr C
    zenny 500
    battlechip WoodTowr B
_62: @ Popper2
    hp 250
    element Wood
    .byte 0x0
    routine 0x21
    lzSprite 0x4C
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    battlechip LeafShld Q
    battlechip LeafShld C
_63: @ Popper3
    hp 120
    element Wood
    .byte 0x0
    routine 0x21
    lzSprite 0x4C
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    zenny 600
    battlechip Dropdown B
_64: @ Satella1
    hp 200
    element None
    .byte 0x28
    routine 0x47
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Lockon1 I
    zenny 550
    battlechip Lockon1 H
    zenny 600
    battlechip Lockon1 D
_65: @ Satella2
    hp 240
    element None
    .byte 0x28
    routine 0x47
    lzSprite 0xFF
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Lockon2 H
    zenny 550
    battlechip Lockon2 G
    zenny 600
    battlechip Lockon2 E
_66: @ Satella3
    hp 300
    element None
    .byte 0x28
    routine 0x47
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Lockon3 N
    zenny 550
    battlechip Lockon3 K
    zenny 600
    battlechip Lockon3 D
_67: @ Fanner1
    hp 100
    element None
    .byte 0x40
    routine 0x34
    lzSprite 0x5F
    .short 0 
    .word 0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    battlechip Typhoon G
    zenny 400
    battlechip Typhoon B
    zenny 450
    battlechip Typhoon A
_68: @ Fanner2
    hp 140
    element None
    .byte 0x40
    routine 0x34
    lzSprite 0x5F
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Huricane G
    zenny 550
    battlechip Huricane I
    zenny 600
    battlechip Huricane J
_69: @ Fanner3
    hp 180
    element None
    .byte 0x40
    routine 0x34
    lzSprite 0x5F
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Cyclone G
    zenny 550
    battlechip Cyclone F
    zenny 600
    battlechip Cyclone H
_70: @ Remobit1
    hp 80
    element Elec
    .byte 0x36
    routine 0x2D
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    battlechip Remobit1 O
    zenny 400
    battlechip Remobit1 A
    zenny 450
    battlechip Remobit1 C
_71: @ Remobit2
    hp 100
    element Elec
    .byte 0x36
    routine 0x2D
    lzSprite 0xFF
    .short 0 
    .word 1
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip Remobit2 E
    zenny 450
    battlechip Remobit2 I
    zenny 500
    battlechip Remobit2 D
_72: @ Remobit3
    hp 120
    element Elec
    .byte 0x36
    routine 0x2D
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Remobit3 G
    zenny 550
    battlechip Remobit3 P
    zenny 600
    battlechip Remobit3 Q
_73: @ Billy
    hp 100
    element Elec
    .byte 0x36
    routine 0x2B
    lzSprite 0x49
    .short 0 
    .word 0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    battlechip Thunder1 S
    zenny 400
    battlechip Thunder1 A
    zenny 450
    battlechip Thunder1 G
_74: @ Silly
    hp 150
    element Elec
    .byte 0x36
    routine 0x2B
    lzSprite 0x49
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Thunder2 I
    zenny 550
    battlechip Thunder2 F
    zenny 600
    battlechip Thunder2 L
_75: @ Killy
    hp 200
    element Elec
    .byte 0x36
    routine 0x2B
    lzSprite 0x49
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Thunder3 F
    zenny 550
    battlechip Thunder3 N
    zenny 600
    battlechip Thunder3 D
_76: @ Prog1
    hp 150
    element Elec
    .byte 0x36
    routine 0x2A
    lzSprite 0x4A
    .short 0 
    .word 0
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    battlechip RingZap1 P
    zenny 400
    battlechip RingZap1 N
    zenny 450
    battlechip RingZap1 G
_77: @ Prog2
    hp 200
    element Elec
    .byte 0x36
    routine 0x2A
    lzSprite 0x4A
    .short 0 
    .word 1
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    zenny 400
    zenny 400
    battlechip RingZap2 L
    battlechip RingZap2 J
    battlechip RingZap2 C
_78: @ Prog3
    hp 250
    element Elec
    .byte 0x36
    routine 0x2A
    lzSprite 0x4A
    .short 0 
    .word 2
    zenny 310
    zenny 310
    zenny 330
    zenny 330
    zenny 350
    zenny 400
    zenny 400
    battlechip RingZap3 B
    battlechip RingZap3 A
    battlechip RingZap3 T
_79: @ MegalianA
    hp 200
    element None
    .byte 0x36
    routine 0x2C
    lzSprite 0x53
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    zenny 400
    zenny 450
    battlechip AquaAura L
    battlechip AquaAura R
    battlechip AquaAura S
_80: @ MegalianH
    hp 250
    element None
    .byte 0x36
    routine 0x2C
    lzSprite 0x53
    .short 0 
    .word 1
    zenny 560
    zenny 560
    zenny 580
    zenny 580
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    battlechip FireAura I
    battlechip FireAura B
_81: @ MegalianW
    hp 300
    element None
    .byte 0x36
    routine 0x2C
    lzSprite 0x53
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    zenny 550
    zenny 550
    zenny 600
    battlechip WoodAura F
_82: @ CanDevil1
    hp 160
    element Fire
    .byte 0x36
    routine 0x35
    lzSprite 0x60
    .short 0 
    .word 0
    zenny 260
    zenny 260
    zenny 280
    zenny 280
    zenny 300
    zenny 350
    zenny 350
    battlechip Candle1 P
    battlechip Candle1 C
    battlechip Candle1 S
_83: @ CanDevil2
    hp 200
    element Fire
    .byte 0x36
    routine 0x35
    lzSprite 0x60
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    battlechip Candle2 B
    battlechip Candle2 E
    zenny 600
    battlechip Candle2 G
_84: @ CanDevil3
    hp 300
    element Fire
    .byte 0x36
    routine 0x35
    lzSprite 0x60
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 500
    battlechip Candle3 M
    battlechip Candle3 H
    zenny 600
    battlechip Candle3 A
_85: @ BigSnake1
    hp 200
    element Wood
    .byte 0x2C
    routine 0x43
    lzSprite 0x64
    .short 0 
    .word 0
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Snakegg1 E
    zenny 550
    battlechip Snakegg1 B
    zenny 600
    battlechip Snakegg1 M
_86: @ BigSnake2
    hp 250
    element Elec
    .byte 0x2C
    routine 0x43
    lzSprite 0x64
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 550
    zenny 550
    battlechip Snakegg2 P
    battlechip Snakegg2 C
    battlechip Snakegg2 E
_87: @ BigSnake3
    hp 300
    element Fire
    .byte 0x2C
    routine 0x43
    lzSprite 0x64
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    zenny 550
    zenny 550
    battlechip Snakegg3 C
    battlechip Snakegg3 S
    battlechip Snakegg3 A
_88: @ Mosqurito1
    hp 200
    element None
    .byte 0x48
    routine 0x37
    lzSprite 0x69
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip Drain1 O
    zenny 450
    battlechip Drain1 K
    zenny 500
    battlechip Drain1 A
_89: @ Mosqurito2
    hp 200
    element None
    .byte 0x48
    routine 0x37
    lzSprite 0x69
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Drain2 T
    zenny 550
    battlechip Drain2 N
    zenny 600
    battlechip Drain2 A
_90: @ Mosqurito3
    hp 200
    element None
    .byte 0x48
    routine 0x37
    lzSprite 0x69
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Drain3 Q
    zenny 550
    battlechip Drain3 F
    zenny 600
    battlechip Drain3 A
_91: @ Poitton1
    hp 100
    element Wood
    .byte 0x36
    routine 0x41
    lzSprite 0x67
    .short 0 
    .word 0
    zenny 360
    zenny 360
    zenny 380
    zenny 380
    zenny 400
    battlechip Dynamyt1 Q
    zenny 450
    battlechip Dynamyt1 O
    zenny 500
    battlechip Dynamyt1 B
_92: @ Poitton2
    hp 250
    element Wood
    .byte 0x36
    routine 0x41
    lzSprite 0x67
    .short 0 
    .word 1
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Dynamyt2 K
    zenny 550
    battlechip Dynamyt2 C
    zenny 600
    battlechip Dynamyt2 A
_93: @ Poitton3
    hp 300
    element Wood
    .byte 0x36
    routine 0x41
    lzSprite 0x67
    .short 0 
    .word 2
    zenny 460
    zenny 460
    zenny 480
    zenny 480
    zenny 500
    battlechip Dynamyt3 G
    zenny 550
    battlechip Dynamyt3 K
    zenny 600
    battlechip Dynamyt3 M
_94: @ Mole
    hp 10
    element None
    .byte 0x36
    routine 0x52
    lzSprite 0x65
    .short 0 
    .word 0
    battlechip Popup N
    battlechip Popup K
    battlechip Popup H
    battlechip Popup D
    battlechip Popup C
    battlechip Popup N
    battlechip Popup K
    battlechip Popup H
    battlechip Popup D
    battlechip Popup C
_95: @ 0x5F
    hp 100
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0xC
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0xC
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0xC
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    battlechip GutsPnch M
    battlechip GutsPnch B
    battlechip GutsMan G
    zenny 1500
    battlechip GutsMan2 G
    zenny 2000
    battlechip GutsMan3 G
_99: @ ProtoManV1
    hp 500
    element None
    .byte 0x36
    routine 0x26
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x36
    routine 0x26
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
    battlechip ProtoMan B
_101: @ ProtoManV3
    hp 700
    element None
    .byte 0x36
    routine 0x26
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip ProtoMan B
    zenny 1500
    battlechip ProtoMn2 B
    zenny 2000
    battlechip ProtoMn3 B
_102: @ WoodManV1
    hp 500
    element Wood
    .byte 0x14
    routine 0x1
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Wood
    .byte 0x14
    routine 0x1
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
    battlechip WoodMan W
_104: @ WoodManV3
    hp 700
    element Wood
    .byte 0x14
    routine 0x1
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip WoodMan W
    zenny 1500
    battlechip WoodMan2 W
    zenny 2000
    battlechip WoodMan3 W
_105: @ FireManV1
    hp 300
    element Fire
    .byte 0x0
    routine 0x3
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Fire
    .byte 0x0
    routine 0x3
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
    battlechip FireMan F
_107: @ FireManV3
    hp 500
    element Fire
    .byte 0x0
    routine 0x3
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip FireMan F
    zenny 1500
    battlechip FireMan2 F
    zenny 2000
    battlechip FireMan3 F
_108: @ NumberManV1
    hp 500
    element None
    .byte 0x0
    routine 0xF
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0xF
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
    battlechip NumbrMan N
_110: @ NumberManV3
    hp 700
    element None
    .byte 0x0
    routine 0xF
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip NumbrMan N
    zenny 1500
    battlechip NumbrMn2 N
    zenny 2000
    battlechip NumbrMn3 N
_111: @ StoneManV1
    hp 600
    element None
    .byte 0x0
    routine 0x15
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x36
    routine 0x15
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
    battlechip StoneMan S
_113: @ StoneManV3
    hp 800
    element None
    .byte 0x36
    routine 0x15
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip StoneMan S
    zenny 1500
    battlechip StoneMn2 S
    zenny 2000
    battlechip StoneMn3 S
_114: @ IceManV1
    hp 500
    element Water
    .byte 0x30
    routine 0x1B
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Water
    .byte 0x30
    routine 0x1B
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
    battlechip IceMan I
_116: @ IceManV3
    hp 700
    element Water
    .byte 0x30
    routine 0x1B
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip IceMan I
    zenny 1500
    battlechip IceMan2 I
    zenny 2000
    battlechip IceMan3 I
_117: @ SkullManV1
    hp 600
    element None
    .byte 0x40
    routine 0x22
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x40
    routine 0x22
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
    battlechip SkullMan S
_119: @ SkullManV3
    hp 800
    element None
    .byte 0x40
    routine 0x22
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip SkullMan S
    zenny 1500
    battlechip SkullMn2 S
    zenny 2000
    battlechip SkullMn3 S
_120: @ ColorManV1
    hp 600
    element None
    .byte 0x0
    routine 0x23
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0x23
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
_122: @ ColorManV3
    hp 800
    element None
    .byte 0x0
    routine 0x23
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip ColorMan C
    zenny 1500
    battlechip ColorMn2 C
    zenny 2000
    battlechip ColorMn3 C
_123: @ BombManV1
    hp 800
    element None
    .byte 0x0
    routine 0x2E
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0x2E
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
    battlechip BombMan B
_125: @ BombManV3
    hp 1000
    element None
    .byte 0x0
    routine 0x2E
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip BombMan B
    zenny 1500
    battlechip BombMan2 B
    zenny 2000
    battlechip BombMan3 B
_126: @ SharkManV1
    hp 700
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
_128: @ SharkManV3
    hp 900
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip SharkMan S
    zenny 1500
    battlechip SharkMn2 S
    zenny 2000
    battlechip SharkMn3 S
_129: @ ElecManV1
    hp 600
    element Elec
    .byte 0x4E
    routine 0x25
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Elec
    .byte 0x4E
    routine 0x25
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
    battlechip ElecMan E
_131: @ ElecManV3
    hp 800
    element Elec
    .byte 0x4E
    routine 0x25
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip ElecMan E
    zenny 1500
    battlechip ElecMan2 E
    zenny 2000
    battlechip ElecMan3 E
_132: @ PharaohManV1
    hp 800
    element None
    .byte 0x0
    routine 0x40
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
_133: @ PharaohManV2
    hp 900
    element None
    .byte 0x0
    routine 0x40
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
    battlechip PharoMan P
_134: @ PharaohManV3
    hp 1000
    element None
    .byte 0x0
    routine 0x40
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 5000
    battlechip PharoMan P
    zenny 6000
    battlechip PharoMn2 P
    battlechip Anubis L
    battlechip PharoMn3 P
_135: @ ShadowManV1
    hp 800
    element None
    .byte 0x0
    routine 0x42
    lzSprite 0xFF
    .short 0 
    .word 0
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
_136: @ ShadowManV2
    hp 900
    element None
    .byte 0x0
    routine 0x42
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
    battlechip ShadoMan S
_137: @ ShadowManV3
    hp 1000
    element None
    .byte 0x0
    routine 0x42
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 4000
    zenny 5000
    battlechip ShadoMan S
    zenny 6000
    battlechip ShadoMn2 S
    battlechip Muramasa K
    battlechip ShadoMn3 S
_138: @ 0x8A
    hp 100
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0x3F
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0x3F
    lzSprite 0xFF
    .short 0 
    .word 1
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
    battlechip MagicMan M
_143: @ MagicManV3
    hp 900
    element None
    .byte 0x0
    routine 0x3F
    lzSprite 0xFF
    .short 0 
    .word 2
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip MagicMan M
    zenny 1500
    battlechip MagicMn2 M
    zenny 2000
    battlechip MagicMn3 M
_144: @ Bass
    hp 1000
    element None
    .byte 0x0
    routine 0x46
    lzSprite 0xFF
    .short 0 
    .word 0
    zenny 8000
    zenny 8000
    zenny 9000
    battlechip LifeAura H
    zenny 10000
    battlechip LifeAura K
    zenny 11000
    battlechip LifeAura M
    zenny 12000
    battlechip LifeAura P
_145: @ 0x91
    hp 100
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x36
    routine 0xE
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element None
    .byte 0x0
    routine 0x39
    lzSprite 0x68
    .short 0 
    .word 0
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
    element Water
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 0
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
    element Fire
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 1
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
    element Water
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 2
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
_151: @ RedDummyV2
    hp 100
    element Fire
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 3
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
    battlechip ColorMan C
_152: @ BlueDummyV3
    hp 100
    element Water
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 4
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip ColorMan C
    zenny 1500
    battlechip ColorMn2 C
    zenny 2000
    battlechip ColorMn3 C
_153: @ RedDummyV3
    hp 100
    element Fire
    .byte 0x36
    routine 0x24
    lzSprite 0xFF
    .short 0 
    .word 5
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip ColorMan C
    zenny 1500
    battlechip ColorMn2 C
    zenny 2000
    battlechip ColorMn3 C
_154: @ InvElecMan
    hp 600
    element Elec
    .byte 0x4E
    routine 0x25
    lzSprite 0xFF
    .short 0 
    .word 3
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
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x80
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
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x180
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
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x81
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
_158: @ SharkManFinV3_1
    hp 0
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x181
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
    battlechip SharkMan S
_159: @ SharkManFinV3_2
    hp 0
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x82
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip SharkMan S
    zenny 1500
    battlechip SharkMn2 S
    zenny 2000
    battlechip SharkMn3 S
_160: @ SharkManFinV3_3
    hp 0
    element Water
    .byte 0x40
    routine 0x29
    lzSprite 0xFF
    .short 0 
    .word 0x182
    zenny 500
    zenny 500
    zenny 500
    zenny 500
    zenny 1000
    battlechip SharkMan S
    zenny 1500
    battlechip SharkMn2 S
    zenny 2000
    battlechip SharkMn3 S
