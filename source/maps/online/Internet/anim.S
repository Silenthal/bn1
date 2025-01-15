#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80515C8
    task_direct slot=0, dst=gBgPalette2, len=0x8, delay=8
    task_direct_arg BgData_Palette_Internet_1 + 0x44
    task_direct_arg palette_0796814_0
    task_direct_arg palette_0796814_1
    task_direct_arg palette_0796814_2
    task_direct_arg palette_0796814_3
    task_direct_arg palette_0796814_4
    task_direct_arg palette_0796814_5
    task_direct_arg palette_0796814_6
    task_repeat

global_label BgTask_8051618
    task_direct slot=1, dst=gBgPalette8, len=0x8, delay=8
    task_direct_arg BgData_Palette_Internet_1 + 0x104
    task_direct_arg palette_0796A14_0
    task_direct_arg palette_0796A14_1
    task_direct_arg palette_0796A14_2
    task_direct_arg palette_0796A14_3
    task_direct_arg palette_0796A14_4
    task_direct_arg palette_0796A14_5
    task_direct_arg palette_0796A14_6
    task_repeat

global_label BgTask_8051668
    task_direct slot=2, dst=gBgPalette9, len=0x8, delay=8
    task_direct_arg BgData_Palette_Internet_1 + 0x124
    task_direct_arg palette_0796AF4_0
    task_direct_arg palette_0796AF4_1
    task_direct_arg palette_0796AF4_2
    task_direct_arg palette_0796AF4_3
    task_direct_arg palette_0796AF4_4
    task_direct_arg palette_0796AF4_5
    task_direct_arg palette_0796AF4_6
    task_repeat

global_label BgTask_80516B8
    task_direct slot=3, dst=gBgPalette3, len=0x8, delay=8
    task_direct_arg BgData_Palette_Internet_1 + 0x64
    task_direct_arg palette_07968F4_0
    task_direct_arg palette_07968F4_1
    task_direct_arg palette_07968F4_2
    task_direct_arg palette_07968F4_1
    task_direct_arg palette_07968F4_0
    task_repeat

global_label BgTask_80516F8
    task_direct slot=4, dst=gBgPalette4, len=0x8, delay=8
    task_direct_arg BgData_Palette_Internet_1 + 0x84
    task_direct_arg palette_0796954_0
    task_direct_arg palette_0796954_1
    task_direct_arg palette_0796954_2
    task_direct_arg palette_0796954_1
    task_direct_arg palette_0796954_0
    task_repeat

global_label BgTask_8051738
    task_direct slot=5, dst=gBgPaletteA, len=0x8, delay=1
    task_direct_arg palette_07969B4_0
    task_stop

global_label BgTask_8051750
    task_direct slot=6, dst=gBgPaletteB, len=0x8, delay=16
    task_direct_arg BgData_Palette_Internet_1 + 0x164
    task_direct_arg palette_0796C14_0
    task_direct_arg palette_0796C14_1
    task_direct_arg palette_0796C14_2
    task_repeat

global_label BgTask_8051780
    task_tileset slot=7, src=tileset_0792AB4, dst=0x6000020, count=0x10, bufIndex=11, delay=8
    task_tileset_arg TilemapEntry_80518C0_00
    task_tileset_arg TilemapEntry_80518C0_01
    task_tileset_arg TilemapEntry_80518C0_02
    task_tileset_arg TilemapEntry_80518C0_03
    task_tileset_arg TilemapEntry_80518C0_04
    task_tileset_arg TilemapEntry_80518C0_05
    task_tileset_arg TilemapEntry_80518C0_06
    task_tileset_arg TilemapEntry_80518C0_07
    task_tileset_arg TilemapEntry_80518C0_08
    task_tileset_arg TilemapEntry_80518C0_09
    task_tileset_arg TilemapEntry_80518C0_10
    task_tileset_arg TilemapEntry_80518C0_11
    task_tileset_arg TilemapEntry_80518C0_12
    task_tileset_arg TilemapEntry_80518C0_13
    task_tileset_arg TilemapEntry_80518C0_14
    task_tileset_arg TilemapEntry_80518C0_15
    task_tileset_arg TilemapEntry_80518C0_16
    task_tileset_arg TilemapEntry_80518C0_17
    task_repeat

global_label BgTask_8051820
    task_tileset slot=8, src=tileset_0792AB4, dst=0x6000220, count=0x10, bufIndex=12, delay=8
    task_tileset_arg TilemapEntry_8051B00_00
    task_tileset_arg TilemapEntry_8051B00_01
    task_tileset_arg TilemapEntry_8051B00_02
    task_tileset_arg TilemapEntry_8051B00_03
    task_tileset_arg TilemapEntry_8051B00_04
    task_tileset_arg TilemapEntry_8051B00_05
    task_tileset_arg TilemapEntry_8051B00_06
    task_tileset_arg TilemapEntry_8051B00_07
    task_tileset_arg TilemapEntry_8051B00_08
    task_tileset_arg TilemapEntry_8051B00_09
    task_tileset_arg TilemapEntry_8051B00_10
    task_tileset_arg TilemapEntry_8051B00_11
    task_repeat

global_label BgTask_8051890
    task_tileset slot=9, src=tileset_0792AB4, dst=0x6000460, count=0x1B, bufIndex=13, delay=1
    task_tileset_arg TilemapEntry_8051C80
    task_stop

global_label BgTask_80518A8
    task_tileset slot=9, src=tileset_0792AB4, dst=0x6000460, count=0x1B, bufIndex=13, delay=1
    task_tileset_arg TilemapEntry_8051CB8
    task_stop

TilemapEntry_80518C0_00:
    .incbin "data/maps/areas/Internet/518C0/518C0_00.tilemap"

TilemapEntry_80518C0_01:
    .incbin "data/maps/areas/Internet/518C0/518C0_01.tilemap"

TilemapEntry_80518C0_02:
    .incbin "data/maps/areas/Internet/518C0/518C0_02.tilemap"

TilemapEntry_80518C0_03:
    .incbin "data/maps/areas/Internet/518C0/518C0_03.tilemap"

TilemapEntry_80518C0_04:
    .incbin "data/maps/areas/Internet/518C0/518C0_04.tilemap"

TilemapEntry_80518C0_05:
    .incbin "data/maps/areas/Internet/518C0/518C0_05.tilemap"

TilemapEntry_80518C0_06:
    .incbin "data/maps/areas/Internet/518C0/518C0_06.tilemap"

TilemapEntry_80518C0_07:
    .incbin "data/maps/areas/Internet/518C0/518C0_07.tilemap"

TilemapEntry_80518C0_08:
    .incbin "data/maps/areas/Internet/518C0/518C0_08.tilemap"

TilemapEntry_80518C0_09:
    .incbin "data/maps/areas/Internet/518C0/518C0_09.tilemap"

TilemapEntry_80518C0_10:
    .incbin "data/maps/areas/Internet/518C0/518C0_10.tilemap"

TilemapEntry_80518C0_11:
    .incbin "data/maps/areas/Internet/518C0/518C0_11.tilemap"

TilemapEntry_80518C0_12:
    .incbin "data/maps/areas/Internet/518C0/518C0_12.tilemap"

TilemapEntry_80518C0_13:
    .incbin "data/maps/areas/Internet/518C0/518C0_13.tilemap"

TilemapEntry_80518C0_14:
    .incbin "data/maps/areas/Internet/518C0/518C0_14.tilemap"

TilemapEntry_80518C0_15:
    .incbin "data/maps/areas/Internet/518C0/518C0_15.tilemap"

TilemapEntry_80518C0_16:
    .incbin "data/maps/areas/Internet/518C0/518C0_16.tilemap"

TilemapEntry_80518C0_17:
    .incbin "data/maps/areas/Internet/518C0/518C0_17.tilemap"

TilemapEntry_8051B00_00:
    .incbin "data/maps/areas/Internet/51B00/51B00_00.tilemap"

TilemapEntry_8051B00_01:
    .incbin "data/maps/areas/Internet/51B00/51B00_01.tilemap"

TilemapEntry_8051B00_02:
    .incbin "data/maps/areas/Internet/51B00/51B00_02.tilemap"

TilemapEntry_8051B00_03:
    .incbin "data/maps/areas/Internet/51B00/51B00_03.tilemap"

TilemapEntry_8051B00_04:
    .incbin "data/maps/areas/Internet/51B00/51B00_04.tilemap"

TilemapEntry_8051B00_05:
    .incbin "data/maps/areas/Internet/51B00/51B00_05.tilemap"

TilemapEntry_8051B00_06:
    .incbin "data/maps/areas/Internet/51B00/51B00_06.tilemap"

TilemapEntry_8051B00_07:
    .incbin "data/maps/areas/Internet/51B00/51B00_07.tilemap"

TilemapEntry_8051B00_08:
    .incbin "data/maps/areas/Internet/51B00/51B00_08.tilemap"

TilemapEntry_8051B00_09:
    .incbin "data/maps/areas/Internet/51B00/51B00_09.tilemap"

TilemapEntry_8051B00_10:
    .incbin "data/maps/areas/Internet/51B00/51B00_10.tilemap"

TilemapEntry_8051B00_11:
    .incbin "data/maps/areas/Internet/51B00/51B00_11.tilemap"

TilemapEntry_8051C80:
    .incbin "data/maps/areas/Internet/51C80.tilemap"

TilemapEntry_8051CB8:
    .incbin "data/maps/areas/Internet/51CB8.tilemap"