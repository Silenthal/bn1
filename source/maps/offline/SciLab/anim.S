#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_803B9DC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877C494
    task_stop

global_label BgTask_803B9F4
    task_direct slot=1, dst=0x6000020, len=0x70, delay=10
    task_direct_arg 0x877BC74
    task_direct_arg 0x877BE14
    task_direct_arg 0x877BFB4
    task_direct_arg 0x877C154
    task_direct_arg 0x877C2F4
    task_repeat

global_label BgTask_803BA2C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x8447BBC
    task_stop

global_label BgTask_803BA44
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877C634
    task_stop

global_label BgTask_803BA5C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877C7D4
    task_stop

global_label BgTask_803BA74
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x844CB50
    task_stop

global_label BgTask_803BA8C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877C974
    task_stop

global_label BgTask_803BAA4
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x844F588
    task_stop

global_label BgTask_803BABC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877CB14
    task_stop

global_label BgTask_803BAD4
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877CCB4
    task_stop

global_label BgTask_803BAEC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x8451B00
    task_stop

global_label BgTask_803BB04
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877CE54
    task_stop

global_label BgTask_803BB1C
    task_direct slot=1, dst=eBgPalette9, len=0x8, delay=6
    task_direct_arg 0x877CFF4
    task_direct_arg 0x877D014
    task_direct_arg 0x877D034
    task_direct_arg 0x877D054
    task_direct_arg 0x877D074
    task_repeat

global_label BgTask_803BB54
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x84537DC
    task_stop

global_label BgTask_803BB6C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x877D0B4
    task_stop

global_label BgTask_803BB84
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=6
    task_direct_arg 0x877D254
    task_direct_arg 0x877D274
    task_direct_arg 0x877D294
    task_direct_arg 0x877D2B4
    task_direct_arg 0x877D2D4
    task_direct_arg 0x877D2F4
    task_direct_arg 0x877D314
    task_direct_arg 0x877D334
    task_direct_arg 0x877D354
    task_direct_arg 0x877D374
    task_direct_arg 0x877D394
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3F4
L_803BC00:
    task_direct_arg 0x877D414
    task_direct_arg 0x877D3F4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D394
    task_direct_arg 0x877D374
    task_direct_arg 0x877D394
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3F4
    task_direct_arg 0x877D414
    task_direct_arg 0x877D3F4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D394
    task_direct_arg 0x877D374
    task_direct_arg 0x877D354
    task_direct_arg 0x877D334
    task_direct_arg 0x877D314
    task_direct_arg 0x877D334
    task_direct_arg 0x877D354
    task_direct_arg 0x877D374
    task_direct_arg 0x877D394
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3F4
    task_jump L_803BC00

global_label BgTask_803BCD8
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=1
    task_direct_arg 0x877D254
    task_stop

global_label BgTask_803BCF0
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=6
    task_direct_arg 0x877D414
    task_direct_arg 0x877D3F4
    task_direct_arg 0x877D3D4
    task_direct_arg 0x877D3B4
    task_direct_arg 0x877D394
    task_direct_arg 0x877D374
    task_direct_arg 0x877D354
    task_direct_arg 0x877D334
    task_direct_arg 0x877D314
    task_direct_arg 0x877D2F4
    task_direct_arg 0x877D2D4
    task_direct_arg 0x877D2B4
    task_direct_arg 0x877D294
    task_direct_arg 0x877D274
    task_direct_arg 0x877D254
    task_stop

global_label BgTask_803BD78
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg 0x8456740
    task_stop
