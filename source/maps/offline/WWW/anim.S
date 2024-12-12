#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label BgTask_803D7AC
    task_direct slot=1, dst=eBgPalette4, len=0x8, delay=6
    task_direct_arg 0x877D434
    task_direct_arg 0x877D454
    task_direct_arg 0x877D474
    task_direct_arg 0x877D494
    task_direct_arg 0x877D4B4
    task_repeat

global_label BgTask_803D7E4
    task_direct slot=0, dst=0x6000020, len=0x150, delay=1
    task_direct_arg 0x877D4D4
    task_stop

global_label BgTask_803D7FC
    task_direct slot=0, dst=0x6000020, len=0x150, delay=1
    task_direct_arg 0x877DA14
    task_stop

global_label BgTask_803D814
    task_direct slot=0, dst=0x60020E0, len=0xC0, delay=8
    task_direct_arg 0x877DFF4
    task_direct_arg 0x877E2F4
    task_direct_arg 0x877E5F4
    task_direct_arg 0x877E8F4
    task_repeat

global_label BgTask_803D844
    task_direct slot=1, dst=eBgPalette0, len=0x8, delay=6
    task_direct_arg 0x877DF54
    task_direct_arg 0x877DF74
    task_direct_arg 0x877DF94
    task_direct_arg 0x877DFB4
    task_direct_arg 0x877DFD4
    task_repeat

