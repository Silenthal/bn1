#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_8049BA8
    task_tileset 0, 0x878A9D4, 0x6000040, 0xE, 15, 4
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
    task_tileset 0, 0x878A9D4, 0x6000040, 0xE, 15, 1
    task_tileset_arg TilemapEntry_804A058_3
    task_stop

global_label BgTask_8049C18
    task_tileset 1, 0x878A9D4, 0x6000200, 0x9, 16, 4
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
    task_tileset 1, 0x878A9D4, 0x6000200, 0x9, 16, 1
    task_tileset_arg TilemapEntry_804A0C8_3
    task_stop

global_label BgTask_8049C88
    task_tileset 2, 0x878A9D4, 0x6000320, 0xE, 17, 4
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
    task_tileset 2, 0x878A9D4, 0x6000320, 0xE, 17, 1
    task_tileset_arg TilemapEntry_804A058_3
    task_stop

global_label BgTask_8049CF8
    task_tileset 3, 0x878A9D4, 0x60004E0, 0x9, 18, 4
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
    task_tileset 3, 0x878A9D4, 0x60004E0, 0x9, 18, 1
    task_tileset_arg TilemapEntry_804A0C8_3
    task_stop

global_label BgTask_8049D68
    task_direct 4, eBgPalette9, 0x8, 16
    task_direct_arg 0x84D398C
    task_direct_arg 0x878B754
    task_repeat

global_label BgTask_8049D88
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x84D39AC
    task_stop

global_label BgTask_8049DA0
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B774
    task_stop

global_label BgTask_8049DB8
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B794
    task_stop

global_label BgTask_8049DD0
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B7B4
    task_stop

global_label BgTask_8049DE8
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B7D4
    task_stop

global_label BgTask_8049E00
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B7F4
    task_stop

global_label BgTask_8049E18
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B814
    task_stop

global_label BgTask_8049E30
    task_direct 5, eBgPaletteA, 0x8
    task_direct_arg 0x878B834
    task_stop

global_label BgTask_8049E48
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x84D39CC
    task_stop

global_label BgTask_8049E60
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B774
    task_stop

global_label BgTask_8049E78
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B794
    task_stop

global_label BgTask_8049E90
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B7B4
    task_stop

global_label BgTask_8049EA8
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B7D4
    task_stop

global_label BgTask_8049EC0
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B7F4
    task_stop

global_label BgTask_8049ED8
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B814
    task_stop

global_label BgTask_8049EF0
    task_direct 6, eBgPaletteB, 0x8
    task_direct_arg 0x878B834
    task_stop

global_label BgTask_8049F08
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x84D39EC
    task_stop

global_label BgTask_8049F20
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B774
    task_stop

global_label BgTask_8049F38
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B794
    task_stop

global_label BgTask_8049F50
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B7B4
    task_stop

global_label BgTask_8049F68
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B7D4
    task_stop

global_label BgTask_8049F80
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B7F4
    task_stop

global_label BgTask_8049F98
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B814
    task_stop

global_label BgTask_8049FB0
    task_direct 7, eBgPaletteC, 0x8
    task_direct_arg 0x878B834
    task_stop

global_label BgTask_8049FC8
    task_direct 8, eBgPalette4, 0x8
    task_direct_arg 0x84D38EC
    task_stop

global_label BgTask_8049FE0
    task_direct 8, eBgPalette4, 0x8
    task_direct_arg 0x878B854
    task_stop

global_label BgTask_8049FF8
    task_direct 9, eBgPalette0, 0x8, 180
    task_direct_arg 0x85637AC
    task_direct_arg 0x8796C74, 4
    task_direct_arg 0x8796C94, 4
    task_direct_arg 0x8796CB4, 4
    task_direct_arg 0x8796C74, 4
    task_direct_arg 0x8796C94, 4
    task_direct_arg 0x8796C74, 4
    task_direct_arg 0x8796CB4, 4
    task_direct_arg 0x8796C74, 4
    task_direct_arg 0x8796C94, 4
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
