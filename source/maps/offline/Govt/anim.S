#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80311A0
    task_direct 0, 0x6004020, 0x58, 600
    task_direct_arg 0x877A254
    task_direct_arg 0x877A3B4, 12
    task_direct_arg 0x877A514, 12
    task_direct_arg 0x877A3B4, 12
    task_direct_arg 0x877A514, 12
    task_direct_arg 0x877A3B4, 12
    task_direct_arg 0x877A514, 12
    task_direct_arg 0x877A3B4, 12
    task_repeat

global_label BgTask_80311F0
    task_direct 0, 0x6002400, 0x60, 16
    task_direct_arg 0x877A674
    task_direct_arg 0x877A7F4
    task_direct_arg 0x877A674
    task_direct_arg 0x877A7F4
    task_direct_arg 0x877A674
    task_direct_arg 0x877A7F4
    task_direct_arg 0x877A974, 24
    task_direct_arg 0x877AAF4, 8
    task_direct_arg 0x877AC74, 8
    task_direct_arg 0x877ADF4, 8
    task_direct_arg 0x877AF74, 8
    task_direct_arg 0x877B0F4, 8
    task_direct_arg 0x877B274, 8
    task_direct_arg 0x877ADF4, 8
    task_direct_arg 0x877AF74, 8
    task_direct_arg 0x877B0F4, 8
    task_direct_arg 0x877B274, 8
    task_direct_arg 0x877B3F4
    task_direct_arg 0x877B574, 32
    task_direct_arg 0x877B6F4
    task_direct_arg 0x877B874, 8
    task_direct_arg 0x877B9F4, 48
    task_repeat

global_label BgTask_80312B0
    task_direct 0, 0x2006DF0, 0x8, 6
    task_direct_arg 0x877BB74
    task_direct_arg 0x877BB94
    task_direct_arg 0x877BBB4
    task_direct_arg 0x877BBD4
    task_direct_arg 0x877BBF4
    task_repeat

global_label BgTask_80312E8
    task_direct 0, 0x2006D50, 0x8
    task_direct_arg 0x877BC34
    task_stop

global_label BgTask_8031300
    task_direct 1, 0x2006DB0, 0x8
    task_direct_arg 0x877BC54
    task_stop
