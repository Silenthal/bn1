#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_8029EE4
    task_direct slot=0, dst=gBgPalette0, len=0x68, delay=4
    task_direct_arg paletteACDC_0771654
    task_stop

global_label BgTask_8029EFC
    task_direct slot=1, dst=gBgPalette0, len=0x68, delay=4
    task_direct_arg BgData_Palette_ACDC_Town+4
    task_stop

global_label BgTask_8029F14
    task_tileset slot=2, src=tilesetACDC_0770C54, dst=0x6000020, count=0x22, bufIndex=7, delay=1
    task_tileset_arg TransferArgs_0802A3A4
    task_stop

global_label BgTask_8029F2C
    task_tileset slot=3, src=tilesetACDC_0770C54, dst=0x6003B40, count=0x5, bufIndex=8, delay=1
    task_tileset_arg TransferArgs_0802A3E8
    task_stop

global_label BgTask_8029F44
    task_tileset slot=2, src=tilesetACDC_0770C54, dst=0x6000020, count=0x22, bufIndex=7, delay=1
    task_tileset_arg TransferArgs_0802A3F4
    task_stop

global_label BgTask_8029F5C
    task_tileset slot=3, src=tilesetACDC_0770C54, dst=0x6003B40, count=0x5, bufIndex=8, delay=1
    task_tileset_arg TransferArgs_0802A438
    task_stop

global_label BgTask_8029F74
    task_direct slot=4, dst=gBgPaletteB, len=0x8
    task_direct_arg paletteACDC_07717F4
    task_stop

global_label BgTask_8029F8C
    task_tileset slot=5, src=tilesetACDCBuilding, dst=0x6003500, count=0x32, bufIndex=9, delay=1
    task_tileset_arg tilemapACDCBuildingRegular
    task_stop

global_label BgTask_8029FA4
    task_tileset slot=6, src=tilesetACDCBuilding, dst=0x6007F60, count=0x2, bufIndex=10, delay=1
    task_tileset_arg TransferArgs_0802A4A8
    task_stop

global_label BgTask_8029FBC
    task_tileset slot=5, src=tilesetACDCBuilding, dst=0x6003500, count=0x32, bufIndex=9, delay=1
    task_tileset_arg tilemapACDCBuildingHigsby
    task_stop

global_label BgTask_8029FD4
    task_tileset slot=6, src=tilesetACDCBuilding, dst=0x6007F60, count=0x2, bufIndex=10, delay=1
    task_tileset_arg TransferArgs_0802A510
    task_stop

global_label BgTask_8029FEC
    task_direct slot=0, dst=0x6006C40, len=0x210
    task_direct_arg tilesetACDC_0771814
    task_stop

global_label BgTask_802A004
    task_direct slot=0, dst=0x6006C40, len=0x210
    task_direct_arg tilesetACDC_0772054
    task_stop

global_label BgTask_802A01C
    task_direct slot=1, dst=gBgPalette6, len=0x8, delay=4
    task_direct_arg paletteACDC_0772894
    task_stop

global_label BgTask_ACDC_Lan_Living_Room_TV_Regular
    task_direct slot=0, dst=0x6000020, len=0xA0, delay=12
    task_direct_arg tilesetACDCTVRegular00
    task_direct_arg tilesetACDCTVRegular01
    task_direct_arg tilesetACDCTVRegular00
    task_direct_arg tilesetACDCTVRegular01
    task_direct_arg tilesetACDCTVRegular00
    task_direct_arg tilesetACDCTVRegular01
    task_direct_arg tilesetACDCTVRegular02
    task_direct_arg tilesetACDCTVRegular03
    task_direct_arg tilesetACDCTVRegular04
    task_direct_arg tilesetACDCTVRegular05
    task_direct_arg tilesetACDCTVRegular06
    task_direct_arg tilesetACDCTVRegular07
    task_direct_arg tilesetACDCTVRegular08
    task_direct_arg tilesetACDCTVRegular09
    task_direct_arg tilesetACDCTVRegular10, 24
    task_direct_arg tilesetACDCTVRegular11, 24
    task_direct_arg tilesetACDCTVRegular12, 24
    task_direct_arg tilesetACDCTVRegular13
    task_direct_arg tilesetACDCTVRegular14
    task_direct_arg tilesetACDCTVRegular13
    task_direct_arg tilesetACDCTVRegular14
    task_direct_arg tilesetACDCTVRegular13
    task_direct_arg tilesetACDCTVRegular14
    task_repeat

global_label BgTask_ACDC_Lan_Living_Room_TV_Wily
    task_direct slot=0, dst=0x6000020, len=0xA0, delay=6
    task_direct_arg tilesetACDCTVWily00
    task_direct_arg tilesetACDCTVWily01
    task_direct_arg tilesetACDCTVWily02
    task_direct_arg tilesetACDCTVWily03
    task_direct_arg tilesetACDCTVWily04
    task_direct_arg tilesetACDCTVWily05
    task_direct_arg tilesetACDCTVWily06
    task_direct_arg tilesetACDCTVWily07
    task_direct_arg tilesetACDCTVWily08
    task_direct_arg tilesetACDCTVWily09
    task_repeat

global_label BgTask_ACDC_Lan_Room_Window_Bird
    task_direct slot=0, dst=0x6000020, len=0xE0, delay=9
    task_direct_arg tilesetACDCLanRoomBird00
    task_direct_arg tilesetACDCLanRoomBird01, 30
    task_direct_arg tilesetACDCLanRoomBird00, 6
    task_direct_arg tilesetACDCLanRoomBird01, 3
    task_direct_arg tilesetACDCLanRoomBird00, 70
    task_direct_arg tilesetACDCLanRoomBird01, 6
    task_direct_arg tilesetACDCLanRoomBird00
    task_direct_arg tilesetACDCLanRoomBird01, 30
    task_direct_arg tilesetACDCLanRoomBird00, 6
    task_direct_arg tilesetACDCLanRoomBird01, 3
    task_direct_arg tilesetACDCLanRoomBird00, 70
    task_direct_arg tilesetACDCLanRoomBird01, 6
    task_direct_arg tilesetACDCLanRoomBird00, 4
    task_direct_arg tilesetACDCLanRoomBird02, 4
    task_direct_arg tilesetACDCLanRoomBird03, 4
    task_direct_arg tilesetACDCLanRoomBird04, 4
    task_stop

global_label BgTask_ACDC_Lan_Room_Window_Empty
    task_direct slot=0, dst=0x6000020, len=0xE0
    task_direct_arg tilesetACDCLanRoomBird04
    task_stop

global_label BgTask_ACDC_Lan_Room_Tileset_Computer
    task_direct slot=1, dst=0x6002860, len=0x28, delay=20
    task_direct_arg tilesetACDCLanRoomComputer00
    task_direct_arg tilesetACDCLanRoomComputer01
    task_direct_arg tilesetACDCLanRoomComputer02
    task_direct_arg tilesetACDCLanRoomComputer03
    task_direct_arg tilesetACDCLanRoomComputer04
    task_direct_arg tilesetACDCLanRoomComputer05
    task_direct_arg tilesetACDCLanRoomComputer06
    task_direct_arg tilesetACDCLanRoomComputer07
    task_direct_arg tilesetACDCLanRoomComputer08
    task_direct_arg tilesetACDCLanRoomComputer09
    task_direct_arg tilesetACDCLanRoomComputer10
    task_direct_arg tilesetACDCLanRoomComputer11
    task_direct_arg tilesetACDCLanRoomComputer12
    task_direct_arg tilesetACDCLanRoomComputer13
    task_repeat

global_label BgTask_802A284
    task_direct slot=0, dst=gBgPalette1, len=0x8, delay=8
    task_direct_arg paletteACDC_0778174
    task_direct_arg BgData_Palette_ACDC_Dex_Room+36
    task_repeat

global_label BgTask_ACDC_Yai_Room_Tileset_Panel
    task_direct slot=0, dst=0x6002D80, len=0x30, delay=120
    task_direct_arg tilesetACDCYaiRoomPanel00
    task_direct_arg tilesetACDCYaiRoomPanel01, 8
    task_direct_arg tilesetACDCYaiRoomPanel02, 8
    task_direct_arg tilesetACDCYaiRoomPanel03, 8
    task_direct_arg tilesetACDCYaiRoomPanel04, 8
    task_direct_arg tilesetACDCYaiRoomPanel05, 8
    task_direct_arg tilesetACDCYaiRoomPanel04, 8
    task_direct_arg tilesetACDCYaiRoomPanel03, 8
    task_direct_arg tilesetACDCYaiRoomPanel02, 8
    task_direct_arg tilesetACDCYaiRoomPanel01
    task_direct_arg tilesetACDCYaiRoomPanel00, 8
    task_direct_arg tilesetACDCYaiRoomPanel06, 8
    task_direct_arg tilesetACDCYaiRoomPanel07, 8
    task_direct_arg tilesetACDCYaiRoomPanel08, 8
    task_direct_arg tilesetACDCYaiRoomPanel09, 8
    task_direct_arg tilesetACDCYaiRoomPanel10, 8
    task_direct_arg tilesetACDCYaiRoomPanel11, 8
    task_direct_arg tilesetACDCYaiRoomPanel12, 8
    task_repeat

global_label BgTask_ACDC_Station_Tileset_Gate_Closed
    task_direct slot=0, dst=0x6004020, len=0x30
    task_direct_arg tilesetACDCStationGateClosed
    task_stop

global_label BgTask_ACDC_Station_Tileset_Gate_Open
    task_direct slot=0, dst=0x6004020, len=0x30
    task_direct_arg tilesetACDCStationGateOpen
    task_stop

global_label BgTask_802A374
    task_direct slot=1, dst=0x6006FE0, len=0x140, delay=10
    task_direct_arg tilesetGovt_0778CD4_00
    task_direct_arg tilesetGovt_0778CD4_01
    task_direct_arg tilesetGovt_0778CD4_02
    task_direct_arg tilesetGovt_0778CD4_03
    task_repeat

TransferArgs_0802A3A4:
    .incbin "data/maps/areas/ACDC/002A3A4.tilemap"
TransferArgs_0802A3E8:
    .incbin "data/maps/areas/ACDC/002A3E8.tilemap"
TransferArgs_0802A3F4:
    .incbin "data/maps/areas/ACDC/002A3F4.tilemap"
TransferArgs_0802A438:
    .incbin "data/maps/areas/ACDC/002A438.tilemap"
tilemapACDCBuildingRegular:
    .incbin "data/maps/areas/ACDC/building_regular.tilemap"
TransferArgs_0802A4A8:
    .incbin "data/maps/areas/ACDC/002A4A8.tilemap"
tilemapACDCBuildingHigsby:
    .incbin "data/maps/areas/ACDC/building_higsby.tilemap"
TransferArgs_0802A510:
    .incbin "data/maps/areas/ACDC/002A510.tilemap"
