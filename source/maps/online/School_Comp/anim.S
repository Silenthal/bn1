#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_803EC68
    task_direct slot=0, dst=eBgPaletteC, len=0x8, delay=5
    task_direct_arg 0x877FBF4
    task_direct_arg 0x877FC14
    task_direct_arg 0x877FC34
    task_direct_arg 0x877FC54
    task_direct_arg 0x877FC74
    task_direct_arg 0x877FC94
    task_direct_arg 0x877FCB4
    task_repeat

global_label BgTask_803ECB0
    task_direct slot=0, dst=eBgPaletteC, len=0x8, delay=5
    task_direct_arg 0x877FCD4
    task_direct_arg 0x877FCF4
    task_direct_arg 0x877FD14
    task_direct_arg 0x877FD34
    task_direct_arg 0x877FD54
    task_direct_arg 0x877FD74
    task_direct_arg 0x877FD94
    task_repeat

global_label BgTask_803ECF8
    task_direct slot=1, dst=eBgPalette6, len=0x8, delay=15
    task_direct_arg 0x877FDB4
    task_direct_arg 0x877FDD4
    task_direct_arg 0x877FDF4
    task_direct_arg 0x877FE14
    task_direct_arg 0x877FE34
    task_direct_arg 0x877FE14
    task_direct_arg 0x877FDF4
    task_direct_arg 0x877FE54
    task_direct_arg 0x877FE74
    task_direct_arg 0x877FE54
    task_direct_arg 0x877FDF4
    task_direct_arg 0x877FDD4
    task_repeat

global_label BgTask_803ED68
    task_tileset slot=2, src=0x877EBF4, dst=0x6000000, count=0x20, bufIndex=14, delay=4
    task_tileset_arg TilemapEntry_803F208
    task_tileset_arg TilemapEntry_803F248
    task_tileset_arg TilemapEntry_803F288
    task_tileset_arg TilemapEntry_803F2C8
    task_tileset_arg TilemapEntry_803F308
    task_tileset_arg TilemapEntry_803F348
    task_tileset_arg TilemapEntry_803F388
    task_tileset_arg TilemapEntry_803F3C8
    task_tileset_arg TilemapEntry_803F408
    task_tileset_arg TilemapEntry_803F448
    task_tileset_arg TilemapEntry_803F488
    task_tileset_arg TilemapEntry_803F4C8
    task_tileset_arg TilemapEntry_803F508
    task_tileset_arg TilemapEntry_803F548
    task_tileset_arg TilemapEntry_803F588
    task_tileset_arg TilemapEntry_803F5C8
    task_tileset_arg TilemapEntry_803F608
    task_tileset_arg TilemapEntry_803F648
    task_tileset_arg TilemapEntry_803F688
    task_tileset_arg TilemapEntry_803F6C8
    task_tileset_arg TilemapEntry_803F708
    task_tileset_arg TilemapEntry_803F748
    task_tileset_arg TilemapEntry_803F788
    task_tileset_arg TilemapEntry_803F7C8
    task_tileset_arg TilemapEntry_803F208
    task_tileset_arg TilemapEntry_803F808
    task_tileset_arg TilemapEntry_803F848
    task_tileset_arg TilemapEntry_803F888
    task_tileset_arg TilemapEntry_803F8C8
    task_tileset_arg TilemapEntry_803F908
    task_tileset_arg TilemapEntry_803F948
    task_tileset_arg TilemapEntry_803F988
    task_tileset_arg TilemapEntry_803F9C8
    task_tileset_arg TilemapEntry_803FA08
    task_tileset_arg TilemapEntry_803FA48
    task_tileset_arg TilemapEntry_803FA88
    task_tileset_arg TilemapEntry_803FAC8
    task_tileset_arg TilemapEntry_803FB08
    task_tileset_arg TilemapEntry_803F588
    task_tileset_arg TilemapEntry_803F5C8
    task_tileset_arg TilemapEntry_803F608
    task_tileset_arg TilemapEntry_803F648
    task_tileset_arg TilemapEntry_803F688
    task_tileset_arg TilemapEntry_803F6C8
    task_tileset_arg TilemapEntry_803F708
    task_tileset_arg TilemapEntry_803F748
    task_tileset_arg TilemapEntry_803F788
    task_tileset_arg TilemapEntry_803F7C8
    task_tileset_arg TilemapEntry_803F208
    task_tileset_arg TilemapEntry_803FB48
    task_tileset_arg TilemapEntry_803FB88
    task_tileset_arg TilemapEntry_803FBC8
    task_tileset_arg TilemapEntry_803FC08
    task_tileset_arg TilemapEntry_803FC48
    task_tileset_arg TilemapEntry_803FC88
    task_tileset_arg TilemapEntry_803FCC8
    task_tileset_arg TilemapEntry_803FD08
    task_tileset_arg TilemapEntry_803FD48
    task_tileset_arg TilemapEntry_803FD88
    task_tileset_arg TilemapEntry_803FDC8
    task_tileset_arg TilemapEntry_803FE08
    task_tileset_arg TilemapEntry_803FE48
    task_tileset_arg TilemapEntry_803F588
    task_tileset_arg TilemapEntry_803F5C8
    task_tileset_arg TilemapEntry_803F608
    task_tileset_arg TilemapEntry_803F648
    task_tileset_arg TilemapEntry_803F688
    task_tileset_arg TilemapEntry_803F6C8
    task_tileset_arg TilemapEntry_803F708
    task_tileset_arg TilemapEntry_803F748
    task_tileset_arg TilemapEntry_803F788
    task_tileset_arg TilemapEntry_803F7C8
    task_tileset_arg TilemapEntry_803F208
    task_tileset_arg TilemapEntry_803FE88
    task_tileset_arg TilemapEntry_803FEC8
    task_tileset_arg TilemapEntry_803FF08
    task_tileset_arg TilemapEntry_803FF48
    task_tileset_arg TilemapEntry_803FF88
    task_tileset_arg TilemapEntry_803FFC8
    task_tileset_arg TilemapEntry_8040008
    task_tileset_arg TilemapEntry_8040048
    task_tileset_arg TilemapEntry_8040088
    task_tileset_arg TilemapEntry_80400C8
    task_tileset_arg TilemapEntry_8040108
    task_tileset_arg TilemapEntry_8040148
    task_tileset_arg TilemapEntry_8040188
    task_tileset_arg TilemapEntry_803F588
    task_tileset_arg TilemapEntry_803F5C8
    task_tileset_arg TilemapEntry_803F608
    task_tileset_arg TilemapEntry_803F648
    task_tileset_arg TilemapEntry_803F688
    task_tileset_arg TilemapEntry_803F6C8
    task_tileset_arg TilemapEntry_803F708
    task_tileset_arg TilemapEntry_803F748
    task_tileset_arg TilemapEntry_803F788
    task_tileset_arg TilemapEntry_803F7C8
    task_tileset_arg TilemapEntry_803F208
    task_tileset_arg TilemapEntry_80401C8
    task_tileset_arg TilemapEntry_8040208
    task_tileset_arg TilemapEntry_8040248
    task_tileset_arg TilemapEntry_8040288
    task_tileset_arg TilemapEntry_80402C8
    task_tileset_arg TilemapEntry_8040308
    task_tileset_arg TilemapEntry_8040348
    task_tileset_arg TilemapEntry_8040388
    task_tileset_arg TilemapEntry_80403C8
    task_tileset_arg TilemapEntry_8040408
    task_tileset_arg TilemapEntry_8040448
    task_tileset_arg TilemapEntry_8040488
    task_tileset_arg TilemapEntry_80404C8
    task_tileset_arg TilemapEntry_803F588
    task_tileset_arg TilemapEntry_803F5C8
    task_tileset_arg TilemapEntry_803F608
    task_tileset_arg TilemapEntry_803F648
    task_tileset_arg TilemapEntry_803F688
    task_tileset_arg TilemapEntry_803F6C8
    task_tileset_arg TilemapEntry_803F708
    task_tileset_arg TilemapEntry_803F748
    task_tileset_arg TilemapEntry_803F788
    task_tileset_arg TilemapEntry_803F7C8
    task_repeat

global_label BgTask_803F138
    task_direct slot=3, dst=eBgPalette0, len=0x8, delay=22
    task_direct_arg 0x877FE94
    task_direct_arg 0x877FEB4
    task_direct_arg 0x877FED4
    task_direct_arg 0x877FEF4
    task_direct_arg 0x877FF14
    task_direct_arg 0x877FF34
    task_direct_arg 0x877FF54
    task_direct_arg 0x877FF34
    task_direct_arg 0x877FF14
    task_direct_arg 0x877FEF4
    task_direct_arg 0x877FF74
    task_direct_arg 0x877FF94
    task_direct_arg 0x877FFB4
    task_direct_arg 0x877FF94
    task_direct_arg 0x877FF74
    task_direct_arg 0x877FEF4
    task_direct_arg 0x877FFD4
    task_direct_arg 0x877FFF4
    task_direct_arg 0x8780014
    task_direct_arg 0x877FFF4
    task_direct_arg 0x877FFD4
    task_direct_arg 0x877FEF4
    task_direct_arg 0x877FED4
    task_direct_arg 0x877FEB4
    task_repeat

TilemapEntry_803F208:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_00.tilemap"

TilemapEntry_803F248:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_01.tilemap"

TilemapEntry_803F288:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_02.tilemap"

TilemapEntry_803F2C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_03.tilemap"

TilemapEntry_803F308:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_04.tilemap"

TilemapEntry_803F348:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_05.tilemap"

TilemapEntry_803F388:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_06.tilemap"

TilemapEntry_803F3C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_07.tilemap"

TilemapEntry_803F408:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_08.tilemap"

TilemapEntry_803F448:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_09.tilemap"

TilemapEntry_803F488:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_10.tilemap"

TilemapEntry_803F4C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_11.tilemap"

TilemapEntry_803F508:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_12.tilemap"

TilemapEntry_803F548:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_13.tilemap"

TilemapEntry_803F588:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_14.tilemap"

TilemapEntry_803F5C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_15.tilemap"

TilemapEntry_803F608:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_16.tilemap"

TilemapEntry_803F648:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_17.tilemap"

TilemapEntry_803F688:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_18.tilemap"

TilemapEntry_803F6C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_19.tilemap"

TilemapEntry_803F708:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_20.tilemap"

TilemapEntry_803F748:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_21.tilemap"

TilemapEntry_803F788:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_22.tilemap"

TilemapEntry_803F7C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_23.tilemap"

TilemapEntry_803F808:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_24.tilemap"

TilemapEntry_803F848:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_25.tilemap"

TilemapEntry_803F888:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_26.tilemap"

TilemapEntry_803F8C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_27.tilemap"

TilemapEntry_803F908:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_28.tilemap"

TilemapEntry_803F948:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_29.tilemap"

TilemapEntry_803F988:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_30.tilemap"

TilemapEntry_803F9C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_31.tilemap"

TilemapEntry_803FA08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_32.tilemap"

TilemapEntry_803FA48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_33.tilemap"

TilemapEntry_803FA88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_34.tilemap"

TilemapEntry_803FAC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_35.tilemap"

TilemapEntry_803FB08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_36.tilemap"

TilemapEntry_803FB48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_37.tilemap"

TilemapEntry_803FB88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_38.tilemap"

TilemapEntry_803FBC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_39.tilemap"

TilemapEntry_803FC08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_40.tilemap"

TilemapEntry_803FC48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_41.tilemap"

TilemapEntry_803FC88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_42.tilemap"

TilemapEntry_803FCC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_43.tilemap"

TilemapEntry_803FD08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_44.tilemap"

TilemapEntry_803FD48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_45.tilemap"

TilemapEntry_803FD88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_46.tilemap"

TilemapEntry_803FDC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_47.tilemap"

TilemapEntry_803FE08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_48.tilemap"

TilemapEntry_803FE48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_49.tilemap"

TilemapEntry_803FE88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_50.tilemap"

TilemapEntry_803FEC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_51.tilemap"

TilemapEntry_803FF08:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_52.tilemap"

TilemapEntry_803FF48:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_53.tilemap"

TilemapEntry_803FF88:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_54.tilemap"

TilemapEntry_803FFC8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_55.tilemap"

TilemapEntry_8040008:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_56.tilemap"

TilemapEntry_8040048:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_57.tilemap"

TilemapEntry_8040088:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_58.tilemap"

TilemapEntry_80400C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_59.tilemap"

TilemapEntry_8040108:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_60.tilemap"

TilemapEntry_8040148:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_61.tilemap"

TilemapEntry_8040188:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_62.tilemap"

TilemapEntry_80401C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_63.tilemap"

TilemapEntry_8040208:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_64.tilemap"

TilemapEntry_8040248:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_65.tilemap"

TilemapEntry_8040288:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_66.tilemap"

TilemapEntry_80402C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_67.tilemap"

TilemapEntry_8040308:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_68.tilemap"

TilemapEntry_8040348:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_69.tilemap"

TilemapEntry_8040388:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_70.tilemap"

TilemapEntry_80403C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_71.tilemap"

TilemapEntry_8040408:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_72.tilemap"

TilemapEntry_8040448:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_73.tilemap"

TilemapEntry_8040488:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_74.tilemap"

TilemapEntry_80404C8:
    .incbin "data/maps/areas/School_Comp/3F208/3F208_75.tilemap"

