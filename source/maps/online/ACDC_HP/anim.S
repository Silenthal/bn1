#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_804EDA8
    task_tileset 0, 0x878EAB4, 0x6000020, 0x10, 19, 6
    task_tileset_arg TilemapEntry_804EE78_0
    task_tileset_arg TilemapEntry_804EE78_1
    task_tileset_arg TilemapEntry_804EE78_2
    task_tileset_arg TilemapEntry_804EE78_3
    task_repeat

global_label BgTask_804EDD8
    task_tileset 0, 0x878F2B4, 0x6000020, 0x10, 20, 240
    task_tileset_arg TilemapEntry_804EE78_0
    task_tileset_arg TilemapEntry_804EE78_1, 8
    task_tileset_arg TilemapEntry_804EE78_2, 8
    task_tileset_arg TilemapEntry_804EE78_3, 8
    task_tileset_arg TilemapEntry_804EE78_2, 8
    task_tileset_arg TilemapEntry_804EE78_1, 8
    task_repeat

global_label BgTask_804EE18
    task_tileset 0, 0x878FAB4, 0x6000020, 0x10, 21, 12
    task_tileset_arg TilemapEntry_804EE78_0
    task_tileset_arg TilemapEntry_804EE78_1
    task_tileset_arg TilemapEntry_804EE78_2
    task_tileset_arg TilemapEntry_804EE78_3
    task_repeat

global_label BgTask_804EE48
    task_tileset 0, 0x87902B4, 0x6000020, 0x10, 22, 12
    task_tileset_arg TilemapEntry_804EE78_0
    task_tileset_arg TilemapEntry_804EE78_1
    task_tileset_arg TilemapEntry_804EE78_2
    task_tileset_arg TilemapEntry_804EE78_3
    task_repeat

global_label TilemapEntry_804EE78_0
    .incbin "data/maps/areas/ACDC_HP/4EE78/4EE78_0.tilemap"

global_label TilemapEntry_804EE78_1
    .incbin "data/maps/areas/ACDC_HP/4EE78/4EE78_1.tilemap"

global_label TilemapEntry_804EE78_2
    .incbin "data/maps/areas/ACDC_HP/4EE78/4EE78_2.tilemap"

global_label TilemapEntry_804EE78_3
    .incbin "data/maps/areas/ACDC_HP/4EE78/4EE78_3.tilemap"

