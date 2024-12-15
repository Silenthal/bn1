#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label BgTask_803D7AC
    task_direct slot=1, dst=eBgPalette4, len=0x8, delay=6
    task_direct_arg palette_077D434_0
    task_direct_arg palette_077D434_1
    task_direct_arg palette_077D434_2
    task_direct_arg palette_077D434_3
    task_direct_arg palette_077D434_4
    task_repeat

global_label BgTask_803D7E4
    task_direct slot=0, dst=0x6000020, len=0x150, delay=1
    task_direct_arg tileset_077D4D4
    task_stop

global_label BgTask_803D7FC
    task_direct slot=0, dst=0x6000020, len=0x150, delay=1
    task_direct_arg tileset_077DA14
    task_stop

global_label BgTask_803D814
    task_direct slot=0, dst=0x60020E0, len=0xC0, delay=8
    task_direct_arg tileset_077DFF4_0
    task_direct_arg tileset_077DFF4_1
    task_direct_arg tileset_077DFF4_2
    task_direct_arg tileset_077DFF4_3
    task_repeat

global_label BgTask_803D844
    task_direct slot=1, dst=eBgPalette0, len=0x8, delay=6
    task_direct_arg palette_077DF54_0
    task_direct_arg palette_077DF54_1
    task_direct_arg palette_077DF54_2
    task_direct_arg palette_077DF54_3
    task_direct_arg palette_077DF54_4
    task_repeat

