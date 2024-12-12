#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_804CC98
    task_direct slot=0, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg 0x878B774
    task_repeat

global_label BgTask_804CCB0
    task_tileset slot=0, src=0x878B874, dst=0x6000020, count=0x40, bufIndex=28, delay=8
    task_tileset_arg TilemapEntry_804CDF8_0
    task_tileset_arg TilemapEntry_804CDF8_1
    task_tileset_arg TilemapEntry_804CDF8_2
    task_tileset_arg TilemapEntry_804CDF8_3
    task_tileset_arg TilemapEntry_804CDF8_4
    task_tileset_arg TilemapEntry_804CDF8_5
    task_tileset_arg TilemapEntry_804CDF8_6
    task_repeat

global_label BgTask_804CCF8
    task_direct slot=1, dst=eBgPalette1, len=0x8, delay=8
    task_direct_arg 0x878E974
    task_direct_arg 0x878E994
    task_direct_arg 0x878E9B4
    task_direct_arg 0x878E9D4
    task_direct_arg 0x878E9F4
    task_repeat

global_label BgTask_804CD30
    task_direct slot=2, dst=eBgPalette2, len=0x8, delay=8
    task_direct_arg 0x878EA14
    task_direct_arg 0x878EA34
    task_direct_arg 0x878EA54
    task_direct_arg 0x878EA74
    task_direct_arg 0x878EA94
    task_repeat

global_label BgTask_804CD68
    task_direct slot=0, dst=eBgPalette0, len=0x8, delay=4
    task_direct_arg 0x8796CD4
    task_direct_arg 0x8796CF4
    task_direct_arg 0x8796D14
    task_direct_arg 0x8796D34
    task_direct_arg 0x8796D54
    task_direct_arg 0x8796D74
    task_direct_arg 0x8796D94
    task_direct_arg 0x8796DB4
    task_direct_arg 0x8796DD4
    task_direct_arg 0x8796DF4
    task_direct_arg 0x8796E14
    task_direct_arg 0x8796E34
    task_direct_arg 0x8796E54
    task_direct_arg 0x8796E74
    task_direct_arg 0x8796E94
    task_direct_arg 0x8796EB4
    task_repeat

TilemapEntry_804CDF8_0:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_0.tilemap"

TilemapEntry_804CDF8_1:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_1.tilemap"

TilemapEntry_804CDF8_2:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_2.tilemap"

TilemapEntry_804CDF8_3:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_3.tilemap"

TilemapEntry_804CDF8_4:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_4.tilemap"

TilemapEntry_804CDF8_5:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_5.tilemap"

TilemapEntry_804CDF8_6:
    .incbin "data/maps/areas/WWW_Comp/4CDF8/4CDF8_6.tilemap"
