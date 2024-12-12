#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_8050060
    task_tileset slot=0, src=0x87922B4, dst=0x6000020, count=0x10, bufIndex=26, delay=12
    task_tileset_arg TilemapEntry_804EE78_0
    task_tileset_arg TilemapEntry_804EE78_1
    task_tileset_arg TilemapEntry_804EE78_2
    task_tileset_arg TilemapEntry_804EE78_3
    task_repeat
