#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_804CC98
    task_direct slot=0, dst=gBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B774
    task_repeat

global_label BgTask_804CCB0
    task_tileset slot=0, src=tileset_078B874, dst=0x6000020, count=0x40, bufIndex=28, delay=8
    task_tileset_arg TilemapEntry_804CDF8_0
    task_tileset_arg TilemapEntry_804CDF8_1
    task_tileset_arg TilemapEntry_804CDF8_2
    task_tileset_arg TilemapEntry_804CDF8_3
    task_tileset_arg TilemapEntry_804CDF8_4
    task_tileset_arg TilemapEntry_804CDF8_5
    task_tileset_arg TilemapEntry_804CDF8_6
    task_repeat

global_label BgTask_804CCF8
    task_direct slot=1, dst=gBgPalette1, len=0x8, delay=8
    task_direct_arg palette_078E974_0
    task_direct_arg palette_078E974_1
    task_direct_arg palette_078E974_2
    task_direct_arg palette_078E974_3
    task_direct_arg palette_078E974_4
    task_repeat

global_label BgTask_804CD30
    task_direct slot=2, dst=gBgPalette2, len=0x8, delay=8
    task_direct_arg palette_078EA14_0
    task_direct_arg palette_078EA14_1
    task_direct_arg palette_078EA14_2
    task_direct_arg palette_078EA14_3
    task_direct_arg palette_078EA14_4
    task_repeat

global_label BgTask_804CD68
    task_direct slot=0, dst=gBgPalette0, len=0x8, delay=4
    task_direct_arg palette_0796CD4_00
    task_direct_arg palette_0796CD4_01
    task_direct_arg palette_0796CD4_02
    task_direct_arg palette_0796CD4_03
    task_direct_arg palette_0796CD4_04
    task_direct_arg palette_0796CD4_05
    task_direct_arg palette_0796CD4_06
    task_direct_arg palette_0796CD4_07
    task_direct_arg palette_0796CD4_08
    task_direct_arg palette_0796CD4_09
    task_direct_arg palette_0796CD4_10
    task_direct_arg palette_0796CD4_11
    task_direct_arg palette_0796CD4_12
    task_direct_arg palette_0796CD4_13
    task_direct_arg palette_0796CD4_14
    task_direct_arg palette_0796CD4_15
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
