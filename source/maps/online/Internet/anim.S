#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80515C8
    task_direct 0, 0x2006D10, 0x8, 8
    task_direct_arg 0x851E280
    task_direct_arg 0x8796814
    task_direct_arg 0x8796834
    task_direct_arg 0x8796854
    task_direct_arg 0x8796874
    task_direct_arg 0x8796894
    task_direct_arg 0x87968B4
    task_direct_arg 0x87968D4
    task_repeat

global_label BgTask_8051618
    task_direct 1, 0x2006DD0, 0x8, 8
    task_direct_arg 0x851E340
    task_direct_arg 0x8796A14
    task_direct_arg 0x8796A34
    task_direct_arg 0x8796A54
    task_direct_arg 0x8796A74
    task_direct_arg 0x8796A94
    task_direct_arg 0x8796AB4
    task_direct_arg 0x8796AD4
    task_repeat

global_label BgTask_8051668
    task_direct 2, 0x2006DF0, 0x8, 8
    task_direct_arg 0x851E360
    task_direct_arg 0x8796AF4
    task_direct_arg 0x8796B14
    task_direct_arg 0x8796B34
    task_direct_arg 0x8796B54
    task_direct_arg 0x8796B74
    task_direct_arg 0x8796B94
    task_direct_arg 0x8796BB4
    task_repeat

global_label BgTask_80516B8
    task_direct 3, 0x2006D30, 0x8, 8
    task_direct_arg 0x851E2A0
    task_direct_arg 0x87968F4
    task_direct_arg 0x8796914
    task_direct_arg 0x8796934
    task_direct_arg 0x8796914
    task_direct_arg 0x87968F4
    task_repeat

global_label BgTask_80516F8
    task_direct 4, 0x2006D50, 0x8, 8
    task_direct_arg 0x851E2C0
    task_direct_arg 0x8796954
    task_direct_arg 0x8796974
    task_direct_arg 0x8796994
    task_direct_arg 0x8796974
    task_direct_arg 0x8796954
    task_repeat

global_label BgTask_8051738
    task_direct 5, 0x2006E10, 0x8
    task_direct_arg 0x87969B4
    task_stop

global_label BgTask_8051750
    task_direct 6, 0x2006E30, 0x8, 16
    task_direct_arg 0x851E3A0
    task_direct_arg 0x8796C14
    task_direct_arg 0x8796C34
    task_direct_arg 0x8796C54
    task_repeat

global_label BgTask_8051780
    task_tileset 7, 0x8792AB4, 0x6000020, 0x10, 11
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
    task_tileset 8, 0x8792AB4, 0x6000220, 0x10, 12
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
    task_tileset 9, 0x8792AB4, 0x6000460, 0x1B, 13, 1
    task_tileset_arg TilemapEntry_8051C80
    task_stop

global_label BgTask_80518A8
    task_tileset 9, 0x8792AB4, 0x6000460, 0x1B, 13, 1
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