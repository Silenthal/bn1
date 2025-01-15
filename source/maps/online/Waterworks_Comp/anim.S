#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_8044030
    task_tileset slot=0, src=tileset_07871B4, dst=0x60056E0, count=0x38, bufIndex=1, delay=1
    task_tileset_arg TilemapEntry_8044BBC
    task_stop

global_label BgTask_8044048
    task_tileset slot=0, src=tileset_07871B4, dst=0x60056E0, count=0x38, bufIndex=1, delay=1
    task_tileset_arg TilemapEntry_8044C2C
    task_stop

global_label BgTask_8044060
    task_direct slot=1, dst=gBgPalette4, len=0x8, delay=1
    task_direct_arg palette_0787174
    task_stop

global_label BgTask_8044078
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_8044DE0_0
    task_tileset_arg TilemapEntry_8044DE0_1
    task_tileset_arg TilemapEntry_8044DE0_2
    task_tileset_arg TilemapEntry_8044DE0_3
    task_tileset_arg TilemapEntry_8044DE0_4
    task_tileset_arg TilemapEntry_8044DE0_5
    task_tileset_arg TilemapEntry_8044DE0_6
    task_tileset_arg TilemapEntry_8044DE0_7
    task_tileset_arg TilemapEntry_8044DE0_8
    task_tileset_arg TilemapEntry_8044DE0_9
    task_repeat

global_label BgTask_80440D8
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_8044F20_0
    task_tileset_arg TilemapEntry_8044F20_1
    task_tileset_arg TilemapEntry_8044F20_2
    task_tileset_arg TilemapEntry_8044F20_3
    task_repeat

global_label BgTask_8044108
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_8044FA0_0
    task_tileset_arg TilemapEntry_8044FA0_1
    task_tileset_arg TilemapEntry_8044FA0_2
    task_tileset_arg TilemapEntry_8044FA0_3
    task_tileset_arg TilemapEntry_8044FA0_4
    task_tileset_arg TilemapEntry_8044FA0_5
    task_tileset_arg TilemapEntry_8044FA0_6
    task_tileset_arg TilemapEntry_8044FA0_7
    task_tileset_arg TilemapEntry_8044FA0_8
    task_tileset_arg TilemapEntry_8044FA0_9
    task_repeat

global_label BgTask_8044168
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_80450E0_0
    task_tileset_arg TilemapEntry_80450E0_1
    task_tileset_arg TilemapEntry_80450E0_2
    task_tileset_arg TilemapEntry_80450E0_3
    task_repeat

global_label BgTask_8044198
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_8045160_0
    task_tileset_arg TilemapEntry_8045160_1
    task_tileset_arg TilemapEntry_8045160_2
    task_tileset_arg TilemapEntry_8045160_3
    task_tileset_arg TilemapEntry_8045160_4
    task_tileset_arg TilemapEntry_8045160_5
    task_tileset_arg TilemapEntry_8045160_6
    task_tileset_arg TilemapEntry_8045160_7
    task_tileset_arg TilemapEntry_8045160_8
    task_tileset_arg TilemapEntry_8045160_9
    task_repeat

global_label BgTask_80441F8
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=8
    task_tileset_arg TilemapEntry_80452A0_00
    task_tileset_arg TilemapEntry_80452A0_01
    task_tileset_arg TilemapEntry_80452A0_02
    task_tileset_arg TilemapEntry_80452A0_03
    task_tileset_arg TilemapEntry_80452A0_04
    task_tileset_arg TilemapEntry_80452A0_05
    task_tileset_arg TilemapEntry_80452A0_06
    task_tileset_arg TilemapEntry_80452A0_07
    task_tileset_arg TilemapEntry_80452A0_08
    task_tileset_arg TilemapEntry_80452A0_09
    task_tileset_arg TilemapEntry_80452A0_10
    task_tileset_arg TilemapEntry_80452A0_11
    task_tileset_arg TilemapEntry_80452A0_12
    task_tileset_arg TilemapEntry_80452A0_13
    task_tileset_arg TilemapEntry_80452A0_14
    task_tileset_arg TilemapEntry_80452A0_15
    task_tileset_arg TilemapEntry_80452A0_16
    task_tileset_arg TilemapEntry_80452A0_17
    task_tileset_arg TilemapEntry_80452A0_18
    task_tileset_arg TilemapEntry_80452A0_19
    task_tileset_arg TilemapEntry_80452A0_20
    task_tileset_arg TilemapEntry_80452A0_21
    task_tileset_arg TilemapEntry_80452A0_22
    task_tileset_arg TilemapEntry_80452A0_23
    task_tileset_arg TilemapEntry_80452A0_24
    task_tileset_arg TilemapEntry_80452A0_25
    task_tileset_arg TilemapEntry_80452A0_26
    task_tileset_arg TilemapEntry_80452A0_27, 60
    task_repeat

global_label BgTask_80442E8
    task_tileset slot=2, src=tileset_07854F4, dst=0x6000020, count=0x10, bufIndex=2, delay=10
    task_tileset_arg TilemapEntry_8045620_0
    task_tileset_arg TilemapEntry_8045620_1
    task_tileset_arg TilemapEntry_8045620_2
    task_tileset_arg TilemapEntry_8045620_3
    task_repeat

global_label BgTask_8044318
    task_direct slot=3, dst=gBgPaletteC, len=0x8, delay=1
    task_direct_arg palette_0787194
    task_stop

global_label BgTask_8044330
    task_direct slot=3, dst=gBgPalette0, len=0x8, delay=1
    task_direct_arg palette_0787194
    task_stop

global_label BgTask_8044348
    task_tileset slot=3, src=tileset_0784234, dst=0x6000240, count=0x1E, bufIndex=3, delay=1
    task_tileset_arg TilemapEntry_8044C9C
    task_stop

global_label BgTask_8044360
    task_tileset slot=3, src=tileset_0784234, dst=0x6000240, count=0x1E, bufIndex=3, delay=1
    task_tileset_arg TilemapEntry_8044CD8
    task_stop

global_label BgTask_8044378
    task_tileset slot=3, src=tileset_0784234, dst=0x60074C0, count=0x12, bufIndex=4, delay=1
    task_tileset_arg TilemapEntry_8044D14
    task_stop

global_label BgTask_8044390
    task_tileset slot=3, src=tileset_0784234, dst=0x60074C0, count=0x12, bufIndex=4, delay=1
    task_tileset_arg TilemapEntry_8044D38
    task_stop

global_label BgTask_80443A8
    task_tileset slot=3, src=tileset_0784234, dst=0x6000240, count=0x21, bufIndex=3, delay=1
    task_tileset_arg TilemapEntry_8044D5C
    task_stop

global_label BgTask_80443C0
    task_tileset slot=3, src=tileset_0784234, dst=0x6000240, count=0x21, bufIndex=3, delay=1
    task_tileset_arg TilemapEntry_8044D9E
    task_stop

global_label BgTask_80443D8
    task_direct slot=0, dst=0x6008020, len=0x130, delay=1
    task_direct_arg tileset_0785034
    task_stop

global_label BgTask_80443F0
    task_tilemap slot=4, count=0x90, bufIndex=2
    .incbin "data/maps/areas/Waterworks_Comp/443FC.bin"
    task_stop

global_label BgTask_8044880
    task_tilemap slot=5, count=0x66, bufIndex=2
    .incbin "data/maps/areas/Waterworks_Comp/4488C.bin"


TilemapEntry_8044BBC:
    .incbin "data/maps/areas/Waterworks_Comp/44BBC.tilemap"

TilemapEntry_8044C2C:
    .incbin "data/maps/areas/Waterworks_Comp/44C2C.tilemap"

TilemapEntry_8044C9C:
    .incbin "data/maps/areas/Waterworks_Comp/44C9C.tilemap"

TilemapEntry_8044CD8:
    .incbin "data/maps/areas/Waterworks_Comp/44CD8.tilemap"

TilemapEntry_8044D14:
    .incbin "data/maps/areas/Waterworks_Comp/44D14.tilemap"

TilemapEntry_8044D38:
    .incbin "data/maps/areas/Waterworks_Comp/44D38.tilemap"

TilemapEntry_8044D5C:
    .incbin "data/maps/areas/Waterworks_Comp/44D5C.tilemap"

TilemapEntry_8044D9E:
    .incbin "data/maps/areas/Waterworks_Comp/44D9E.tilemap"

TilemapEntry_8044DE0_0:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_0.tilemap"

TilemapEntry_8044DE0_1:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_1.tilemap"

TilemapEntry_8044DE0_2:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_2.tilemap"

TilemapEntry_8044DE0_3:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_3.tilemap"

TilemapEntry_8044DE0_4:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_4.tilemap"

TilemapEntry_8044DE0_5:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_5.tilemap"

TilemapEntry_8044DE0_6:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_6.tilemap"

TilemapEntry_8044DE0_7:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_7.tilemap"

TilemapEntry_8044DE0_8:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_8.tilemap"

TilemapEntry_8044DE0_9:
    .incbin "data/maps/areas/Waterworks_Comp/44DE0/44DE0_9.tilemap"

TilemapEntry_8044F20_0:
    .incbin "data/maps/areas/Waterworks_Comp/44F20/44F20_0.tilemap"

TilemapEntry_8044F20_1:
    .incbin "data/maps/areas/Waterworks_Comp/44F20/44F20_1.tilemap"

TilemapEntry_8044F20_2:
    .incbin "data/maps/areas/Waterworks_Comp/44F20/44F20_2.tilemap"

TilemapEntry_8044F20_3:
    .incbin "data/maps/areas/Waterworks_Comp/44F20/44F20_3.tilemap"

TilemapEntry_8044FA0_0:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_0.tilemap"

TilemapEntry_8044FA0_1:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_1.tilemap"

TilemapEntry_8044FA0_2:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_2.tilemap"

TilemapEntry_8044FA0_3:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_3.tilemap"

TilemapEntry_8044FA0_4:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_4.tilemap"

TilemapEntry_8044FA0_5:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_5.tilemap"

TilemapEntry_8044FA0_6:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_6.tilemap"

TilemapEntry_8044FA0_7:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_7.tilemap"

TilemapEntry_8044FA0_8:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_8.tilemap"

TilemapEntry_8044FA0_9:
    .incbin "data/maps/areas/Waterworks_Comp/44FA0/44FA0_9.tilemap"

TilemapEntry_80450E0_0:
    .incbin "data/maps/areas/Waterworks_Comp/450E0/450E0_0.tilemap"

TilemapEntry_80450E0_1:
    .incbin "data/maps/areas/Waterworks_Comp/450E0/450E0_1.tilemap"

TilemapEntry_80450E0_2:
    .incbin "data/maps/areas/Waterworks_Comp/450E0/450E0_2.tilemap"

TilemapEntry_80450E0_3:
    .incbin "data/maps/areas/Waterworks_Comp/450E0/450E0_3.tilemap"

TilemapEntry_8045160_0:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_0.tilemap"

TilemapEntry_8045160_1:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_1.tilemap"

TilemapEntry_8045160_2:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_2.tilemap"

TilemapEntry_8045160_3:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_3.tilemap"

TilemapEntry_8045160_4:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_4.tilemap"

TilemapEntry_8045160_5:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_5.tilemap"

TilemapEntry_8045160_6:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_6.tilemap"

TilemapEntry_8045160_7:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_7.tilemap"

TilemapEntry_8045160_8:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_8.tilemap"

TilemapEntry_8045160_9:
    .incbin "data/maps/areas/Waterworks_Comp/45160/45160_9.tilemap"

TilemapEntry_80452A0_00:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_00.tilemap"

TilemapEntry_80452A0_01:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_01.tilemap"

TilemapEntry_80452A0_02:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_02.tilemap"

TilemapEntry_80452A0_03:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_03.tilemap"

TilemapEntry_80452A0_04:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_04.tilemap"

TilemapEntry_80452A0_05:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_05.tilemap"

TilemapEntry_80452A0_06:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_06.tilemap"

TilemapEntry_80452A0_07:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_07.tilemap"

TilemapEntry_80452A0_08:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_08.tilemap"

TilemapEntry_80452A0_09:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_09.tilemap"

TilemapEntry_80452A0_10:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_10.tilemap"

TilemapEntry_80452A0_11:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_11.tilemap"

TilemapEntry_80452A0_12:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_12.tilemap"

TilemapEntry_80452A0_13:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_13.tilemap"

TilemapEntry_80452A0_14:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_14.tilemap"

TilemapEntry_80452A0_15:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_15.tilemap"

TilemapEntry_80452A0_16:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_16.tilemap"

TilemapEntry_80452A0_17:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_17.tilemap"

TilemapEntry_80452A0_18:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_18.tilemap"

TilemapEntry_80452A0_19:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_19.tilemap"

TilemapEntry_80452A0_20:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_20.tilemap"

TilemapEntry_80452A0_21:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_21.tilemap"

TilemapEntry_80452A0_22:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_22.tilemap"

TilemapEntry_80452A0_23:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_23.tilemap"

TilemapEntry_80452A0_24:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_24.tilemap"

TilemapEntry_80452A0_25:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_25.tilemap"

TilemapEntry_80452A0_26:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_26.tilemap"

TilemapEntry_80452A0_27:
    .incbin "data/maps/areas/Waterworks_Comp/452A0/452A0_27.tilemap"

TilemapEntry_8045620_0:
    .incbin "data/maps/areas/Waterworks_Comp/45620/45620_0.tilemap"

TilemapEntry_8045620_1:
    .incbin "data/maps/areas/Waterworks_Comp/45620/45620_1.tilemap"

TilemapEntry_8045620_2:
    .incbin "data/maps/areas/Waterworks_Comp/45620/45620_2.tilemap"

TilemapEntry_8045620_3:
    .incbin "data/maps/areas/Waterworks_Comp/45620/45620_3.tilemap"
