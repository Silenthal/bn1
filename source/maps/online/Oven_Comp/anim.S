#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80423F8
    task_direct 0, eBgPalette0, 0x8, 10
    task_direct_arg 0x848771C
    task_direct_arg 0x8784034
    task_repeat

global_label BgTask_8042418
    task_direct 1, eBgPalette3, 0x8, 10
    task_direct_arg 0x848777C
    task_direct_arg 0x8784054
    task_direct_arg 0x8784074
    task_direct_arg 0x8784094
    task_repeat

global_label BgTask_8042448
    task_direct 2, eBgPalette4, 0x8, 10
    task_direct_arg 0x848779C
    task_direct_arg 0x87840B4
    task_direct_arg 0x87840D4
    task_direct_arg 0x87840F4
    task_direct_arg 0x8784114
    task_direct_arg 0x87840F4
    task_direct_arg 0x87840D4
    task_direct_arg 0x87840B4
    task_repeat

global_label BgTask_8042498
    task_direct 3, eBgPalette5, 0x8, 20
    task_direct_arg 0x84877BC
    task_direct_arg 0x8784134
    task_direct_arg 0x8784154
    task_direct_arg 0x8784174
    task_direct_arg 0x8784154
    task_direct_arg 0x8784134
    task_repeat

global_label BgTask_80424D8
    task_direct 4, eBgPaletteA, 0x8, 10
    task_direct_arg 0x848785C
    task_direct_arg 0x8784194
    task_direct_arg 0x87841B4
    task_direct_arg 0x87841D4
    task_direct_arg 0x87841F4
    task_direct_arg 0x87841D4
    task_direct_arg 0x87841B4
    task_direct_arg 0x8784194
    task_repeat

global_label BgTask_8042528
    task_tileset 5, 0x8780034, 0x6000020, 0x10, 0
    task_tileset_arg TilemapEntry_8042B08
    task_tileset_arg TilemapEntry_8042B28
    task_tileset_arg TilemapEntry_8042B48
    task_tileset_arg TilemapEntry_8042B68
    task_tileset_arg TilemapEntry_8042B88
    task_tileset_arg TilemapEntry_8042BA8
    task_tileset_arg TilemapEntry_8042BC8
    task_tileset_arg TilemapEntry_8042BE8
    task_tileset_arg TilemapEntry_8042C08
    task_tileset_arg TilemapEntry_8042C28
    task_tileset_arg TilemapEntry_8042C48
    task_tileset_arg TilemapEntry_8042C68
    task_tileset_arg TilemapEntry_8042C88
    task_tileset_arg TilemapEntry_8042CA8
    task_tileset_arg TilemapEntry_8042CC8
    task_tileset_arg TilemapEntry_8042CE8
    task_tileset_arg TilemapEntry_8042D08
    task_tileset_arg TilemapEntry_8042D28
    task_tileset_arg TilemapEntry_8042D48
    task_tileset_arg TilemapEntry_8042D68
    task_tileset_arg TilemapEntry_8042D88
    task_tileset_arg TilemapEntry_8042DA8
    task_tileset_arg TilemapEntry_8042DC8
    task_tileset_arg TilemapEntry_8042DE8
    task_tileset_arg TilemapEntry_8042E08
    task_tileset_arg TilemapEntry_8042E28
    task_tileset_arg TilemapEntry_8042E48
    task_tileset_arg TilemapEntry_8042E68
    task_tileset_arg TilemapEntry_8042E88
    task_tileset_arg TilemapEntry_8042EA8
    task_tileset_arg TilemapEntry_8042EC8
    task_tileset_arg TilemapEntry_8042EE8
    task_tileset_arg TilemapEntry_8042F08
    task_tileset_arg TilemapEntry_8042F28
    task_tileset_arg TilemapEntry_8042F48
    task_tileset_arg TilemapEntry_8042F68
    task_tileset_arg TilemapEntry_8042F88
    task_tileset_arg TilemapEntry_8042FA8
    task_tileset_arg TilemapEntry_8042FC8
    task_tileset_arg TilemapEntry_8042FE8
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043008
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043048
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043088
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430E8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_8043128
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043048
    task_repeat

global_label BgTask_80426F8
    task_tileset 5, 0x8782034, 0x6000020, 0x10, 0
    task_tileset_arg TilemapEntry_8042B08
    task_tileset_arg TilemapEntry_8042B28
    task_tileset_arg TilemapEntry_8042B48
    task_tileset_arg TilemapEntry_8042B68
    task_tileset_arg TilemapEntry_8042B88
    task_tileset_arg TilemapEntry_8042BA8
    task_tileset_arg TilemapEntry_8042BC8
    task_tileset_arg TilemapEntry_8042BE8
    task_tileset_arg TilemapEntry_8042C08
    task_tileset_arg TilemapEntry_8042C28
    task_tileset_arg TilemapEntry_8042C48
    task_tileset_arg TilemapEntry_8042C68
    task_tileset_arg TilemapEntry_8042C88
    task_tileset_arg TilemapEntry_8042CA8
    task_tileset_arg TilemapEntry_8042CC8
    task_tileset_arg TilemapEntry_8042CE8
    task_tileset_arg TilemapEntry_8042D08
    task_tileset_arg TilemapEntry_8042D28
    task_tileset_arg TilemapEntry_8042D48
    task_tileset_arg TilemapEntry_8042D68
    task_tileset_arg TilemapEntry_8042D88
    task_tileset_arg TilemapEntry_8042DA8
    task_tileset_arg TilemapEntry_8042DC8
    task_tileset_arg TilemapEntry_8042DE8
    task_tileset_arg TilemapEntry_8042E08
    task_tileset_arg TilemapEntry_8042E28
    task_tileset_arg TilemapEntry_8042E48
    task_tileset_arg TilemapEntry_8042E68
    task_tileset_arg TilemapEntry_8042E88
    task_tileset_arg TilemapEntry_8042EA8
    task_tileset_arg TilemapEntry_8042EC8
    task_tileset_arg TilemapEntry_8042EE8
    task_tileset_arg TilemapEntry_8042F08
    task_tileset_arg TilemapEntry_8042F28
    task_tileset_arg TilemapEntry_8042F48
    task_tileset_arg TilemapEntry_8042F68
    task_tileset_arg TilemapEntry_8042F88
    task_tileset_arg TilemapEntry_8042FA8
    task_tileset_arg TilemapEntry_8042FC8
    task_tileset_arg TilemapEntry_8042FE8
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043008
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043048
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043088
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430E8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_8043128
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043048
    task_repeat

global_label BgTask_80428C8
    task_tileset 0, 0x8780034, 0x6000000, 0x10, 0
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043008
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043048
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043088
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430E8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_8043128
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043048
    task_repeat

global_label BgTask_8042958
    task_tileset 0, 0x8782034, 0x6000000, 0x10, 0
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043008
    task_tileset_arg TilemapEntry_8043028
    task_tileset_arg TilemapEntry_8043048
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043088
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430E8
    task_tileset_arg TilemapEntry_8043108
    task_tileset_arg TilemapEntry_80430C8
    task_tileset_arg TilemapEntry_80430A8
    task_tileset_arg TilemapEntry_8043128
    task_tileset_arg TilemapEntry_8043068
    task_tileset_arg TilemapEntry_8043048
    task_repeat

TilemapEntry_80429E8:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_0.tilemap"
TilemapEntry_8042A08:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_1.tilemap"
TilemapEntry_8042A28:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_2.tilemap"
TilemapEntry_8042A48:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_3.tilemap"
TilemapEntry_8042A68:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_4.tilemap"
TilemapEntry_8042A88:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_5.tilemap"
TilemapEntry_8042AA8:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_6.tilemap"
TilemapEntry_8042AC8:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_7.tilemap"
TilemapEntry_8042AE8:
    .incbin "data/maps/areas/Oven_Comp/429E8/429E8_8.tilemap"

TilemapEntry_8042B08:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_00.tilemap"
TilemapEntry_8042B28:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_01.tilemap"
TilemapEntry_8042B48:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_02.tilemap"
TilemapEntry_8042B68:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_03.tilemap"
TilemapEntry_8042B88:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_04.tilemap"
TilemapEntry_8042BA8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_05.tilemap"
TilemapEntry_8042BC8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_06.tilemap"
TilemapEntry_8042BE8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_07.tilemap"
TilemapEntry_8042C08:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_08.tilemap"
TilemapEntry_8042C28:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_09.tilemap"
TilemapEntry_8042C48:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_10.tilemap"
TilemapEntry_8042C68:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_11.tilemap"
TilemapEntry_8042C88:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_12.tilemap"
TilemapEntry_8042CA8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_13.tilemap"
TilemapEntry_8042CC8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_14.tilemap"
TilemapEntry_8042CE8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_15.tilemap"
TilemapEntry_8042D08:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_16.tilemap"
TilemapEntry_8042D28:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_17.tilemap"
TilemapEntry_8042D48:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_18.tilemap"
TilemapEntry_8042D68:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_19.tilemap"
TilemapEntry_8042D88:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_20.tilemap"
TilemapEntry_8042DA8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_21.tilemap"
TilemapEntry_8042DC8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_22.tilemap"
TilemapEntry_8042DE8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_23.tilemap"
TilemapEntry_8042E08:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_24.tilemap"
TilemapEntry_8042E28:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_25.tilemap"
TilemapEntry_8042E48:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_26.tilemap"
TilemapEntry_8042E68:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_27.tilemap"
TilemapEntry_8042E88:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_28.tilemap"
TilemapEntry_8042EA8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_29.tilemap"
TilemapEntry_8042EC8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_30.tilemap"
TilemapEntry_8042EE8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_31.tilemap"
TilemapEntry_8042F08:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_32.tilemap"
TilemapEntry_8042F28:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_33.tilemap"
TilemapEntry_8042F48:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_34.tilemap"
TilemapEntry_8042F68:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_35.tilemap"
TilemapEntry_8042F88:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_36.tilemap"
TilemapEntry_8042FA8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_37.tilemap"
TilemapEntry_8042FC8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_38.tilemap"
TilemapEntry_8042FE8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_39.tilemap"
TilemapEntry_8043008:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_40.tilemap"
TilemapEntry_8043028:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_41.tilemap"
TilemapEntry_8043048:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_42.tilemap"
TilemapEntry_8043068:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_43.tilemap"
TilemapEntry_8043088:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_44.tilemap"
TilemapEntry_80430A8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_45.tilemap"
TilemapEntry_80430C8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_46.tilemap"
TilemapEntry_80430E8:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_47.tilemap"
TilemapEntry_8043108:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_48.tilemap"
TilemapEntry_8043128:
    .incbin "data/maps/areas/Oven_Comp/42B08/42B08_49.tilemap"
