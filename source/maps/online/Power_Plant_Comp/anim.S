#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_8049BA8
    task_tileset slot=0, src=tileset_078A9D4, dst=0x6000040, count=0xE, bufIndex=15, delay=4
    task_tileset_arg TilemapEntry_804A058_0
    task_tileset_arg TilemapEntry_804A058_1
    task_tileset_arg TilemapEntry_804A058_2
    task_tileset_arg TilemapEntry_804A058_3
    task_tileset_arg TilemapEntry_804A058_0
    task_tileset_arg TilemapEntry_804A058_3
    task_tileset_arg TilemapEntry_804A058_1
    task_tileset_arg TilemapEntry_804A058_2
    task_tileset_arg TilemapEntry_804A058_3
    task_repeat

global_label BgTask_8049C00
    task_tileset slot=0, src=tileset_078A9D4, dst=0x6000040, count=0xE, bufIndex=15, delay=1
    task_tileset_arg TilemapEntry_804A058_3
    task_stop

global_label BgTask_8049C18
    task_tileset slot=1, src=tileset_078A9D4, dst=0x6000200, count=0x9, bufIndex=16, delay=4
    task_tileset_arg TilemapEntry_804A0C8_1
    task_tileset_arg TilemapEntry_804A0C8_3
    task_tileset_arg TilemapEntry_804A0C8_0
    task_tileset_arg TilemapEntry_804A0C8_2
    task_tileset_arg TilemapEntry_804A0C8_3
    task_tileset_arg TilemapEntry_804A0C8_0
    task_tileset_arg TilemapEntry_804A0C8_1
    task_tileset_arg TilemapEntry_804A0C8_2
    task_tileset_arg TilemapEntry_804A0C8_3
    task_repeat

global_label BgTask_8049C70
    task_tileset slot=1, src=tileset_078A9D4, dst=0x6000200, count=0x9, bufIndex=16, delay=1
    task_tileset_arg TilemapEntry_804A0C8_3
    task_stop

global_label BgTask_8049C88
    task_tileset slot=2, src=tileset_078A9D4, dst=0x6000320, count=0xE, bufIndex=17, delay=4
    task_tileset_arg TilemapEntry_804A058_0
    task_tileset_arg TilemapEntry_804A058_2
    task_tileset_arg TilemapEntry_804A058_3
    task_tileset_arg TilemapEntry_804A058_0
    task_tileset_arg TilemapEntry_804A058_1
    task_tileset_arg TilemapEntry_804A058_2
    task_tileset_arg TilemapEntry_804A058_3
    task_tileset_arg TilemapEntry_804A058_1
    task_tileset_arg TilemapEntry_804A058_3
    task_repeat

global_label BgTask_8049CE0
    task_tileset slot=2, src=tileset_078A9D4, dst=0x6000320, count=0xE, bufIndex=17, delay=1
    task_tileset_arg TilemapEntry_804A058_3
    task_stop

global_label BgTask_8049CF8
    task_tileset slot=3, src=tileset_078A9D4, dst=0x60004E0, count=0x9, bufIndex=18, delay=4
    task_tileset_arg TilemapEntry_804A0C8_3
    task_tileset_arg TilemapEntry_804A0C8_0
    task_tileset_arg TilemapEntry_804A0C8_1
    task_tileset_arg TilemapEntry_804A0C8_2
    task_tileset_arg TilemapEntry_804A0C8_3
    task_tileset_arg TilemapEntry_804A0C8_2
    task_tileset_arg TilemapEntry_804A0C8_3
    task_tileset_arg TilemapEntry_804A0C8_1
    task_tileset_arg TilemapEntry_804A0C8_2
    task_repeat

global_label BgTask_8049D50
    task_tileset slot=3, src=tileset_078A9D4, dst=0x60004E0, count=0x9, bufIndex=18, delay=1
    task_tileset_arg TilemapEntry_804A0C8_3
    task_stop

global_label BgTask_8049D68
    task_direct slot=4, dst=eBgPalette9, len=0x8, delay=16
    task_direct_arg 0x84D398C
    task_direct_arg palette_078B754
    task_repeat

global_label BgTask_8049D88
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg 0x84D39AC
    task_stop

global_label BgTask_8049DA0
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B774
    task_stop

global_label BgTask_8049DB8
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B794
    task_stop

global_label BgTask_8049DD0
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B7B4
    task_stop

global_label BgTask_8049DE8
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B7D4
    task_stop

global_label BgTask_8049E00
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B7F4
    task_stop

global_label BgTask_8049E18
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B814
    task_stop

global_label BgTask_8049E30
    task_direct slot=5, dst=eBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_078B834
    task_stop

global_label BgTask_8049E48
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg 0x84D39CC
    task_stop

global_label BgTask_8049E60
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B774
    task_stop

global_label BgTask_8049E78
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B794
    task_stop

global_label BgTask_8049E90
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B7B4
    task_stop

global_label BgTask_8049EA8
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B7D4
    task_stop

global_label BgTask_8049EC0
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B7F4
    task_stop

global_label BgTask_8049ED8
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B814
    task_stop

global_label BgTask_8049EF0
    task_direct slot=6, dst=eBgPaletteB, len=0x8, delay=1
    task_direct_arg palette_078B834
    task_stop

global_label BgTask_8049F08
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg 0x84D39EC
    task_stop

global_label BgTask_8049F20
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B774
    task_stop

global_label BgTask_8049F38
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B794
    task_stop

global_label BgTask_8049F50
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B7B4
    task_stop

global_label BgTask_8049F68
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B7D4
    task_stop

global_label BgTask_8049F80
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B7F4
    task_stop

global_label BgTask_8049F98
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B814
    task_stop

global_label BgTask_8049FB0
    task_direct slot=7, dst=eBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_078B834
    task_stop

global_label BgTask_8049FC8
    task_direct slot=8, dst=eBgPalette4, len=0x8, delay=1
    task_direct_arg 0x84D38EC
    task_stop

global_label BgTask_8049FE0
    task_direct slot=8, dst=eBgPalette4, len=0x8, delay=1
    task_direct_arg palette_078B854
    task_stop

global_label BgTask_8049FF8
    task_direct slot=9, dst=eBgPalette0, len=0x8, delay=180
    task_direct_arg 0x85637AC
    task_direct_arg palette_0796C74_0, 4
    task_direct_arg palette_0796C74_1, 4
    task_direct_arg palette_0796C74_2, 4
    task_direct_arg palette_0796C74_0, 4
    task_direct_arg palette_0796C74_1, 4
    task_direct_arg palette_0796C74_0, 4
    task_direct_arg palette_0796C74_2, 4
    task_direct_arg palette_0796C74_0, 4
    task_direct_arg palette_0796C74_1, 4
    task_repeat

TilemapEntry_804A058_0:
    .incbin "data/maps/areas/Power_Plant_Comp/4A058/4A058_0.tilemap"

TilemapEntry_804A058_1:
    .incbin "data/maps/areas/Power_Plant_Comp/4A058/4A058_1.tilemap"

TilemapEntry_804A058_2:
    .incbin "data/maps/areas/Power_Plant_Comp/4A058/4A058_2.tilemap"

TilemapEntry_804A058_3:
    .incbin "data/maps/areas/Power_Plant_Comp/4A058/4A058_3.tilemap"

TilemapEntry_804A0C8_0:
    .incbin "data/maps/areas/Power_Plant_Comp/4A0C8/4A0C8_0.tilemap"

TilemapEntry_804A0C8_1:
    .incbin "data/maps/areas/Power_Plant_Comp/4A0C8/4A0C8_1.tilemap"

TilemapEntry_804A0C8_2:
    .incbin "data/maps/areas/Power_Plant_Comp/4A0C8/4A0C8_2.tilemap"

TilemapEntry_804A0C8_3:
    .incbin "data/maps/areas/Power_Plant_Comp/4A0C8/4A0C8_3.tilemap"
