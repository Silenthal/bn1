#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_School_TilesetBlackboardEvent
    task_direct slot=0, dst=0x6001A40, len=0x180
    task_direct_arg tilesetSchoolBlackboardEvent
    task_stop

global_label BgTask_School_TilesetBlackboardTriangle
    task_direct slot=0, dst=0x6001A40, len=0x180
    task_direct_arg tilesetSchoolBlackboardTriangle
    task_stop

global_label BgTask_School_PaletteBlackboardOff
    task_direct slot=1, dst=gBgPaletteB, len=0x8, delay=4
    task_direct_arg paletteSchoolBlackboardOff
    task_stop

global_label BgTask_School_PaletteBlackboardOn
    task_direct slot=1, dst=gBgPaletteB, len=0x8, delay=4
    task_direct_arg paletteSchoolBlackboard00
    task_direct_arg paletteSchoolBlackboard01
    task_direct_arg paletteSchoolBlackboard02
    task_direct_arg paletteSchoolBlackboard03
    task_direct_arg paletteSchoolBlackboard04
    task_direct_arg paletteSchoolBlackboard05
    task_direct_arg paletteSchoolBlackboard06
    task_direct_arg paletteSchoolBlackboard07
    task_direct_arg paletteSchoolBlackboard08
    task_direct_arg paletteSchoolBlackboard09
    task_direct_arg paletteSchoolBlackboard10
    task_direct_arg paletteSchoolBlackboardOff
    task_repeat

global_label BgTask_School_PaletteBlackboardOn_2
    task_direct slot=1, dst=gBgPaletteB, len=0x8, delay=10
    task_direct_arg paletteSchoolBlackboard00
    task_direct_arg paletteSchoolBlackboard01
    task_direct_arg paletteSchoolBlackboard02
    task_direct_arg paletteSchoolBlackboard03
    task_direct_arg paletteSchoolBlackboard04
    task_direct_arg paletteSchoolBlackboard05
    task_direct_arg paletteSchoolBlackboard06
    task_direct_arg paletteSchoolBlackboard07
    task_direct_arg paletteSchoolBlackboard08
    task_direct_arg paletteSchoolBlackboard09
    task_direct_arg paletteSchoolBlackboard10
    task_direct_arg paletteSchoolBlackboardOff
    task_repeat

global_label BgTask_School_TilesetBlackboardGraph
    task_direct slot=0, dst=0x6001A40, len=0x180, delay=10
    task_direct_arg tilesetSchoolBlackboardGraph0
    task_direct_arg tilesetSchoolBlackboardGraph1
    task_direct_arg tilesetSchoolBlackboardGraph2
    task_direct_arg tilesetSchoolBlackboardGraph3, 90
    task_repeat

global_label BgTask_School_TilesetBlackboardMath
    task_direct slot=0, dst=0x6001A40, len=0x180, delay=30
    task_direct_arg tilesetSchoolBlackboardMath0
    task_direct_arg tilesetSchoolBlackboardMath1
    task_direct_arg tilesetSchoolBlackboardMath2, 60
    task_repeat

global_label BgTask_School_TilesetBlackboardRooster
    task_direct slot=0, dst=0x6001A40, len=0x180, delay=30
    task_direct_arg tilesetSchoolBlackboardRooster0
    task_direct_arg tilesetSchoolBlackboardRooster1, 90
    task_repeat

global_label BgTask_80241B8
    task_direct slot=0, dst=gBgPalette4, len=0x8, delay=6
    task_direct_arg paletteSchoolUnused0
    task_direct_arg paletteSchoolUnused1
    task_direct_arg paletteSchoolUnused2
    task_direct_arg paletteSchoolUnused3
    task_direct_arg paletteSchoolUnused4
    task_direct_arg paletteSchoolUnused5
    task_direct_arg paletteSchoolUnused6
    task_direct_arg paletteSchoolUnused7
    task_repeat

global_label BgTask_School_PaletteServer
    task_direct slot=0, dst=gBgPalette4, len=0x8, delay=20
    task_direct_arg paletteSchoolServer0
    task_direct_arg paletteSchoolServer1
    task_direct_arg paletteSchoolServer2
    task_direct_arg paletteSchoolServer3
    task_direct_arg paletteSchoolServer4
    task_direct_arg paletteSchoolServer5
    task_direct_arg paletteSchoolServer6
    task_repeat

global_label BgTask_8024250
    task_direct slot=0, dst=gBgPalette4, len=0x8, delay=20
    task_direct_arg paletteSchoolUnusedOff
    task_stop