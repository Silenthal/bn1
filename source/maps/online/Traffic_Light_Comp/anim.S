#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80473B4
    task_direct 2, eBgPalette0, 0x18
    task_direct_arg 0x878A834
    task_stop

global_label BgTask_80473CC
    task_direct 3, eBgPalette4, 0x10
    task_direct_arg 0x878A894
    task_stop

global_label BgTask_80473E4
    task_direct 4, eBgPalette7, 0x8
    task_direct_arg 0x878A9B4
    task_stop

global_label BgTask_80473FC
    task_direct 2, eBgPalette0, 0x18
    task_direct_arg 0x84BDB34
    task_stop

global_label BgTask_8047414
    task_direct 3, eBgPalette4, 0x10
    task_direct_arg 0x84BDBB4
    task_stop

global_label BgTask_804742C
    task_direct 4, eBgPalette7, 0x8
    task_direct_arg 0x84BDC14
    task_stop

global_label BgTask_8047444
    task_direct 5, eBgPalette3, 0x8, 8
    task_direct_arg 0x84BDB94
    task_direct_arg 0x878A8D4
    task_direct_arg 0x878A8F4
    task_direct_arg 0x878A914
    task_repeat

global_label BgTask_8047474
    task_direct 5, eBgPalette3, 0x8, 8
    task_direct_arg 0x878A934
    task_direct_arg 0x878A954
    task_direct_arg 0x878A974
    task_direct_arg 0x878A994
    task_repeat

global_label BgTask_80474A4
    task_tileset 0, 0x8787D34, 0x6000020, 0x20, 5
    task_tileset_arg TilemapEntry_804765C_0
    task_tileset_arg TilemapEntry_804765C_1
    task_tileset_arg TilemapEntry_804765C_2
    task_tileset_arg TilemapEntry_804765C_3
    task_tileset_arg TilemapEntry_804765C_4
    task_tileset_arg TilemapEntry_804765C_5
    task_tileset_arg TilemapEntry_804765C_6
    task_tileset_arg TilemapEntry_804765C_7
    task_tileset_arg TilemapEntry_804765C_8
    task_tileset_arg TilemapEntry_804765C_9, 60
    task_repeat

global_label BgTask_8047504
    task_tileset 0, 0x8787D34, 0x6000020, 0x20, 5
    task_tileset_arg TilemapEntry_80478DC_0
    task_tileset_arg TilemapEntry_80478DC_1
    task_tileset_arg TilemapEntry_80478DC_2
    task_tileset_arg TilemapEntry_80478DC_3
    task_tileset_arg TilemapEntry_80478DC_4
    task_tileset_arg TilemapEntry_80478DC_5
    task_tileset_arg TilemapEntry_80478DC_6
    task_tileset_arg TilemapEntry_80478DC_7
    task_repeat

global_label BgTask_8047554
    task_tileset 0, 0x8787D34, 0x6000020, 0x20, 5
    task_tileset_arg TilemapEntry_8047ADC_0
    task_tileset_arg TilemapEntry_8047ADC_1
    task_repeat

global_label BgTask_8047574
    task_tileset 0, 0x8787D34, 0x6000020, 0x20, 5
    task_tileset_arg TilemapEntry_8047B5C_0
    task_tileset_arg TilemapEntry_8047B5C_1
    task_tileset_arg TilemapEntry_8047B5C_2
    task_tileset_arg TilemapEntry_8047B5C_3
    task_repeat

global_label BgTask_80475A4
    task_tileset 0, 0x8787D34, 0x6000020, 0x20, 5
    task_tileset_arg TilemapEntry_8047C5C_0
    task_tileset_arg TilemapEntry_8047C5C_1
    task_tileset_arg TilemapEntry_8047C5C_2
    task_tileset_arg TilemapEntry_8047C5C_3
    task_tileset_arg TilemapEntry_8047C5C_4
    task_tileset_arg TilemapEntry_8047C5C_5
    task_tileset_arg TilemapEntry_8047C5C_6
    task_tileset_arg TilemapEntry_8047C5C_7
    task_repeat

global_label BgTask_80475F4
    task_tileset 1, 0x8787B74, 0x6000440, 0xD, 6, 1
    task_tileset_arg TilemapEntry_8047624
    task_stop

global_label BgTask_804760C
    task_tileset 1, 0x8787B74, 0x6000440, 0xD, 6, 1
    task_tileset_arg TilemapEntry_8047640
    task_stop


TilemapEntry_8047624:
    .incbin "data/maps/areas/Traffic_Light_Comp/47624.tilemap"

TilemapEntry_8047640:
    .incbin "data/maps/areas/Traffic_Light_Comp/47640.tilemap"

TilemapEntry_804765C_0:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_0.tilemap"

TilemapEntry_804765C_1:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_1.tilemap"

TilemapEntry_804765C_2:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_2.tilemap"

TilemapEntry_804765C_3:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_3.tilemap"

TilemapEntry_804765C_4:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_4.tilemap"

TilemapEntry_804765C_5:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_5.tilemap"

TilemapEntry_804765C_6:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_6.tilemap"

TilemapEntry_804765C_7:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_7.tilemap"

TilemapEntry_804765C_8:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_8.tilemap"

TilemapEntry_804765C_9:
    .incbin "data/maps/areas/Traffic_Light_Comp/4765C/4765C_9.tilemap"

TilemapEntry_80478DC_0:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_0.tilemap"

TilemapEntry_80478DC_1:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_1.tilemap"

TilemapEntry_80478DC_2:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_2.tilemap"

TilemapEntry_80478DC_3:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_3.tilemap"

TilemapEntry_80478DC_4:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_4.tilemap"

TilemapEntry_80478DC_5:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_5.tilemap"

TilemapEntry_80478DC_6:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_6.tilemap"

TilemapEntry_80478DC_7:
    .incbin "data/maps/areas/Traffic_Light_Comp/478DC/478DC_7.tilemap"

TilemapEntry_8047ADC_0:
    .incbin "data/maps/areas/Traffic_Light_Comp/47ADC/47ADC_0.tilemap"

TilemapEntry_8047ADC_1:
    .incbin "data/maps/areas/Traffic_Light_Comp/47ADC/47ADC_1.tilemap"

TilemapEntry_8047B5C_0:
    .incbin "data/maps/areas/Traffic_Light_Comp/47B5C/47B5C_0.tilemap"

TilemapEntry_8047B5C_1:
    .incbin "data/maps/areas/Traffic_Light_Comp/47B5C/47B5C_1.tilemap"

TilemapEntry_8047B5C_2:
    .incbin "data/maps/areas/Traffic_Light_Comp/47B5C/47B5C_2.tilemap"

TilemapEntry_8047B5C_3:
    .incbin "data/maps/areas/Traffic_Light_Comp/47B5C/47B5C_3.tilemap"

TilemapEntry_8047C5C_0:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_0.tilemap"

TilemapEntry_8047C5C_1:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_1.tilemap"

TilemapEntry_8047C5C_2:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_2.tilemap"

TilemapEntry_8047C5C_3:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_3.tilemap"

TilemapEntry_8047C5C_4:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_4.tilemap"

TilemapEntry_8047C5C_5:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_5.tilemap"

TilemapEntry_8047C5C_6:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_6.tilemap"

TilemapEntry_8047C5C_7:
    .incbin "data/maps/areas/Traffic_Light_Comp/47C5C/47C5C_7.tilemap"
