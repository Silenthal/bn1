    .include "constants.inc"
    .include "macros.inc"

    .text

global_label bgDataDir_Offline
    .word BGArchive_ARRAY_08012c54
    .word BGArchive_ARRAY_08012d08
    .word BGArchive_ARRAY_08012db0
    .word BGArchive_ARRAY_08012e40
    .word BGArchive_ARRAY_08012ea0
    .word BGArchive_ARRAY_08012ee8

global_label bgDataDir_Online
    .word BGArchive_ARRAY_08012f30
    .word BGArchive_ARRAY_08012f6c
    .word BGArchive_ARRAY_08012f84
    .word BGArchive_ARRAY_08012fcc
    .word BGArchive_ARRAY_08013008
    .word BGArchive_ARRAY_08013038
    .word 0
    .word 0
    .word BGArchive_ARRAY_08013080
    .word BGArchive_ARRAY_080130b0
    .word BGArchive_ARRAY_080130c8
    .word BGArchive_ARRAY_080130d4
    .word BGArchive_ARRAY_080130e0
    .word 0
    .word 0
    .word 0
    .word BGArchive_ARRAY_0801317c

global_label PTR_ARRAY_08012c50
    .word BGArchive_ARRAY_0801323c

BGArchive_ARRAY_08012c54:
   .word 0x83b0298
   .word 0x83b3230
   .word 0x83b33d4
    
   .word 0x83b0298
   .word 0x83b3230
   .word 0x83b4054
    
   .word 0x83b4e98
   .word 0x83b4cf4
   .word 0x83b7980
    
   .word 0x83b9148
   .word 0x83bbec0
   .word 0x83bc064
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x83b0298
   .word 0x83bf0b4
   .word 0x83bf258
    
   .word 0x83b0298
   .word 0x83bfef0
   .word 0x83c0094
    
   .word 0x83b0298
   .word 0x83c0d04
   .word 0x83c0ea8
    
   .word 0x83c1ca8
   .word 0x83c434c
   .word 0x83c44f0
    
   .word 0x83b9148
   .word 0x83bbec0
   .word 0x83c51d4
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x83b9148
   .word 0x83c8280
   .word 0x83c8424
    
   .word 0x83c8f94
   .word 0x83cbf18
   .word 0x83cc0bc
    
   .word 0x83cd220
   .word 0x83cfbd0
   .word 0x83cfd74
    
   .word 0x83b9148
   .word 0x83d10cc
   .word 0x83d1270

BGArchive_ARRAY_08012d08:
   .word 0x83d22f0
   .word 0x83d8104
   .word 0x83d82a8
    
   .word 0x83dd8fc
   .word 0x83e1fc0
   .word 0x83e2164
    
   .word 0x83e3cc4
   .word 0x83e6678
   .word 0x83e681c
    
   .word 0x83e7718
   .word 0x83e9500
   .word 0x83e96a4
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x83ea180
   .word 0x83ec5f0
   .word 0x83ec794
    
   .word 0x83ed76c
   .word 0x83ef004
   .word 0x83ef1a8
    
   .word 0x83efbd4
   .word 0x83f2310
   .word 0x83f24b4
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x83f308c
   .word 0x83f600c
   .word 0x83f61b0
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x83f715c
   .word 0x83f9d04
   .word 0x83f9ea8
    
   .word 0x83face4
   .word 0x83fee84
   .word 0x83ff028
    
   .word 0x83face4
   .word 0x84005b0
   .word 0x8400754

BGArchive_ARRAY_08012db0:
   .word 0x8401abc
   .word 0x8405374
   .word 0x8405518
    
   .word 0x83face4
   .word 0x840a4a0
   .word 0x840a644
    
   .word 0x840bdd0
   .word 0x840e520
   .word 0x840e6c4
    
   .word 0x8410fa4
   .word 0x841338c
   .word 0x8413530
    
   .word 0x8415d74
   .word 0x841640c
   .word 0x84165b0
    
   .word 0x84176b8
   .word 0x8419d04
   .word 0x8419ea8
    
   .word 0x841c27c
   .word 0x841d8f0
   .word 0x841da94
    
   .word 0x841f390
   .word 0x8420b50
   .word 0x8420cf4
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x842344c
   .word 0x8426324
   .word 0x84264c8
    
   .word 0x0
   .word 0x0
   .word 0x0
    
   .word 0x842344c
   .word 0x8428498
   .word 0x842863c

BGArchive_ARRAY_08012e40:
   .word 0x842bdb8
   .word 0x842ed5c
   .word 0x842ef00
    
   .word 0x83face4
   .word 0x8432970
   .word 0x8432b14
    
   .word 0x843423c
   .word 0x8438430
   .word 0x84385d4
    
   .word 0x843423c
   .word 0x843a984
   .word 0x843ab28
    
   .word 0x843423c
   .word 0x843ce70
   .word 0x843d014
    
   .word 0x843423c
   .word 0x843f534
   .word 0x843f6d8
    
   .word 0x8441810
   .word 0x8443618
   .word 0x84437bc
    
   .word 0x84442b0
   .word 0x844531c
   .word 0x84454c0

BGArchive_ARRAY_08012ea0:
   .word 0x8445f98
   .word 0x8447bb8
   .word 0x8447d5c
    
   .word 0x844a1c4
   .word 0x844cb4c
   .word 0x844ccf0
    
   .word 0x8445f98
   .word 0x844f584
   .word 0x844f728
    
   .word 0x8445f98
   .word 0x8451afc
   .word 0x8451ca0
    
   .word 0x841f390
   .word 0x84537d8
   .word 0x845397c
    
   .word 0x8454eec
   .word 0x845673c
   .word 0x84568e0

BGArchive_ARRAY_08012ee8:
   .word 0x8458d1c
   .word 0x845c3ec
   .word 0x845c590
    
   .word 0x845e93c
   .word 0x8462cc4
   .word 0x8462e68
    
   .word 0x8465260
   .word 0x8468e34
   .word 0x8468fd8
    
   .word 0x846b200
   .word 0x846c410
   .word 0x846c5b4
    
   .word 0x846b200
   .word 0x846d578
   .word 0x846d71c
    
   .word 0x846b200
   .word 0x846e6b0
   .word 0x846e854

BGArchive_ARRAY_08012f30:
   .word 0x846f8a8
   .word 0x8472b84
   .word 0x8472d28
    
   .word 0x8475a74
   .word 0x8478820
   .word 0x84789c4
    
   .word 0x846f8a8
   .word 0x847b634
   .word 0x847b7d8
    
   .word 0x846f8a8
   .word 0x847e290
   .word 0x847e434
    
   .word 0x846f8a8
   .word 0x8481450
   .word 0x84815f4

BGArchive_ARRAY_08012f6c:
   .word 0x8483f78
   .word 0x8487718
   .word 0x84878bc
    
   .word 0x8483f78
   .word 0x8487718
   .word 0x848bb6c

BGArchive_ARRAY_08012f84:
   .word 0x848ee68
   .word 0x84955c4
   .word 0x8495768
    
   .word 0x848ee68
   .word 0x84955c4
   .word 0x849a91c
    
   .word 0x848ee68
   .word 0x84955c4
   .word 0x849ec7c
    
   .word 0x84a4264
   .word 0x84a99d0
   .word 0x84a9b74
    
   .word 0x84af050
   .word 0x84b26c4
   .word 0x84b2868
    
   .word 0x84a4264
   .word 0x84b6ee0
   .word 0x84b7084

BGArchive_ARRAY_08012fcc:
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84bdcd4
    
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84c16f0
    
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84c5284
    
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84c9438
    
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84ccc70

BGArchive_ARRAY_08013008:
   .word 0x84d16fc
   .word 0x84d3868
   .word 0x84d3a0c
    
   .word 0x84d16fc
   .word 0x84d3868
   .word 0x84d8530
    
   .word 0x84d16fc
   .word 0x84d3868
   .word 0x84dcf48
    
   .word 0x84d16fc
   .word 0x84d3868
   .word 0x84e1ae8

BGArchive_ARRAY_08013038:
   .word 0x8483f78
   .word 0x8487718
   .word 0x84e63ac
    
   .word 0x8475a74
   .word 0x84eafbc
   .word 0x84eb160
    
   .word 0x848ee68
   .word 0x84955c4
   .word 0x84eefc0
    
   .word 0x84bbfb0
   .word 0x84bdb30
   .word 0x84f3de0
    
   .word 0x84d16fc
   .word 0x84d3868
   .word 0x84f8438
    
   .word 0x84fcba4
   .word 0x84fdcfc
   .word 0x84fdea0

BGArchive_ARRAY_08013080:
   .word 0x8500fd4
   .word 0x8502c60
   .word 0x8502e04
    
   .word 0x8500fd4
   .word 0x8506384
   .word 0x8503934
    
   .word 0x8500fd4
   .word 0x85087d4
   .word 0x8506528
    
   .word 0x8500fd4
   .word 0x850c900
   .word 0x8508978

BGArchive_ARRAY_080130b0:
   .word 0x850caa4
   .word 0x850dc6c
   .word 0x850de10
    
   .word 0x850caa4
   .word 0x8511580
   .word 0x850f498

BGArchive_ARRAY_080130c8:
   .word 0x850caa4
   .word 0x851398c
   .word 0x8511724

BGArchive_ARRAY_080130d4:
   .word 0x850caa4
   .word 0x8517c78
   .word 0x8513b30

BGArchive_ARRAY_080130e0:
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c
    
   .word 0x850caa4
   .word 0x851a1c4
   .word 0x8517e1c

BGArchive_ARRAY_0801317c:
   .word 0x851a368
   .word 0x851e23c
   .word 0x851e3e0
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8523568
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8528ae8
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x852d57c
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8531ed4
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x853614c
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x853a4c8
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x853e484
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8542204
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8545c3c
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8549a60
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x854df24
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8551d84
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x855564c
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x8559694
    
   .word 0x851a368
   .word 0x851e23c
   .word 0x855cf88

BGArchive_ARRAY_0801323c:
   .word 0x8561434
   .word 0x8561650
   .word 0x8561774
    
   .word 0x8561c78
   .word 0x8561e84
   .word 0x8561fa8
    
   .word 0x8562478
   .word 0x8562674
   .word 0x8562798
    
   .word 0x8562c6c
   .word 0x8562ee4
   .word 0x8563008
    
   .word 0x8563500
   .word 0x85637a8
   .word 0x85638cc
    
   .word 0x8563e24
   .word 0x8563fec
   .word 0x8564110
    
   .word 0x8564654
   .word 0x85648d0
   .word 0x85649f4
    
   .word 0x8564ef4
   .word 0x8565124
   .word 0x8565248
    
   .word 0x8565750
   .word 0x85659ac
   .word 0x8565ad0
    
   .word 0x8565fd8
   .word 0x8566260
   .word 0x8566384
    
   .word 0x8566898
   .word 0x8566a7c
   .word 0x8566ba0
    
   .word 0x85670b0
   .word 0x8567410
   .word 0x8567534
    
   .word 0x8567aa4
   .word 0x8567cd4
   .word 0x8567df8
    
   .word 0x8568300
   .word 0x85684c0
   .word 0x85685e4
    
   .word 0x8568af0
   .word 0x8568cb4
   .word 0x8568dd8
    
   .word 0x85692e8
   .word 0x856939c
   .word 0x85694c0
    
   .word 0x856999c
   .word 0x8569a40
   .word 0x8569b64

global_label bgPropDir_Offline
   .word PTR_BYTE_ARRAY_08013368
   .word PTR_MapDataHeader_080133a4
   .word PTR_MapDataHeader_080133dc
   .word PTR_MapDataHeader_0801340c
   .word PTR_MapDataHeader_0801342c
   .word PTR_MapDataHeader_08013444

global_label bgPropDir_Online
   .word PTR_MapDataHeader_0801345c
   .word PTR_MapDataHeader_08013470
   .word PTR_MapDataHeader_08013478
   .word PTR_MapDataHeader_08013490
   .word PTR_MapDataHeader_080134a4
   .word PTR_MapDataHeader_080134b4
   .word 0
   .word 0
   .word PTR_MapDataHeader_080134cc
   .word PTR_MapDataHeader_080134dc
   .word PTR_MapDataHeader_080134e4
   .word PTR_MapDataHeader_080134e8
   .word PTR_MapDataHeader_080134ec
   .word 0
   .word 0
   .word 0
   .word PTR_MapDataHeader_08013520

global_label PTR_08013364
   .word 0

PTR_BYTE_ARRAY_08013368:
   .word 0x856a038
   .word 0x856aad4
   .word 0x856b55c
   .word 0x856c38c
   .word 0
   .word 0x856c880
   .word 0x856d314
   .word 0x856dd8c
   .word 0x856e684
   .word 0x856e94c
   .word 0
   .word 0x856eea0
   .word 0x856f084
   .word 0x856f604
   .word 0x85707ec

PTR_MapDataHeader_080133a4:
   .word 0x8570a60
   .word 0x8574080
   .word 0x8574a2c
   .word 0x85751d0
   .word 0
   .word 0x85754a8
   .word 0x8575c98
   .word 0x85761a8
   .word 0
   .word 0x857663c
   .word 0
   .word 0x8576c60
   .word 0x8577280
   .word 0x8577770

PTR_MapDataHeader_080133dc:
   .word 0x857793c
   .word 0x8578bb8
   .word 0x8578fb0
   .word 0x857a3b0
   .word 0x857b814
   .word 0x857c4a0
   .word 0x857d2a8
   .word 0x857daa8
   .word 0
   .word 0x857e6dc
   .word 0
   .word 0x857e994

PTR_MapDataHeader_0801340c:
   .word 0x857f160
   .word 0x8581924
   .word 0x8581d30
   .word 0x8583404
   .word 0x8584cc0
   .word 0x85864d0
   .word 0x8587acc
   .word 0x8587e00

PTR_MapDataHeader_0801342c:
   .word 0x858853c
   .word 0x8588c00
   .word 0x858a988
   .word 0x858aff0
   .word 0x858b330
   .word 0x858bcb0

PTR_MapDataHeader_08013444:
   .word 0x858bff8
   .word 0x858d42c
   .word 0x858dca8
   .word 0x858e4d4
   .word 0x858eaa4
   .word 0x858f058

PTR_MapDataHeader_0801345c:
   .word 0x858f5c8
   .word 0x8590ff8
   .word 0x8593d9c
   .word 0x85949d8
   .word 0x8595f10

PTR_MapDataHeader_08013470:
   .word 0x8596c9c
   .word 0x85985c4

PTR_MapDataHeader_08013478:
   .word 0x8599a28
   .word 0x859bd44
   .word 0x859eba0
   .word 0x85a427c
   .word 0x85a9f50
   .word 0x85b1478

PTR_MapDataHeader_08013490:
   .word 0x85b64d0
   .word 0x85b82f4
   .word 0x85ba740
   .word 0x85be13c
   .word 0x85c05dc

PTR_MapDataHeader_080134a4:
   .word 0x85c2a2c
   .word 0x85c7b08
   .word 0x85c9ff8
   .word 0x85cd228

PTR_MapDataHeader_080134b4:
   .word 0x85cff6c
   .word 0x85d1b54
   .word 0x85d57a8
   .word 0x85d9f4c
   .word 0x85db4a8
   .word 0x85de704

PTR_MapDataHeader_080134cc:
   .word 0x85ded58
   .word 0x85defe4
   .word 0x85e0c24
   .word 0x85e1c18

PTR_MapDataHeader_080134dc:
   .word 0x85e22a8
   .word 0x85e27d8

PTR_MapDataHeader_080134e4:
   .word 0x85e2f20

PTR_MapDataHeader_080134e8:
   .word 0x85e384c

PTR_MapDataHeader_080134ec:
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8
   .word 0x85e41f8

PTR_MapDataHeader_08013520:
   .word 0x85e4604
   .word 0x85e774c
   .word 0x85ed608
   .word 0x85f1e54
   .word 0x85f5548
   .word 0x85f8100
   .word 0x85fa53c
   .word 0x85fcb14
   .word 0x85ffee0
   .word 0x86017a8
   .word 0x8604ab4
   .word 0x86074e0
   .word 0x8609b64
   .word 0x860ad44
   .word 0x860de5c
   .word 0x86109c0
