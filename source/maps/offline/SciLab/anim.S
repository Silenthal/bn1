#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_803B9DC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077C494
    task_stop

global_label BgTask_803B9F4
    task_direct slot=1, dst=0x6000020, len=0x70, delay=10
    task_direct_arg tilesetSciLab_077BC74_0
    task_direct_arg tilesetSciLab_077BC74_1
    task_direct_arg tilesetSciLab_077BC74_2
    task_direct_arg tilesetSciLab_077BC74_3
    task_direct_arg tilesetSciLab_077BC74_4
    task_repeat

global_label BgTask_803BA2C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Restaurant_Hallway+4
    task_stop

global_label BgTask_803BA44
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077C634
    task_stop

global_label BgTask_803BA5C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077C7D4
    task_stop

global_label BgTask_803BA74
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Restaurant+4
    task_stop

global_label BgTask_803BA8C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077C974
    task_stop

global_label BgTask_803BAA4
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Power_Plant_Hallway+4
    task_stop

global_label BgTask_803BABC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077CB14
    task_stop

global_label BgTask_803BAD4
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077CCB4
    task_stop

global_label BgTask_803BAEC
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Power_Plant+4
    task_stop

global_label BgTask_803BB04
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077CE54
    task_stop

global_label BgTask_803BB1C
    task_direct slot=1, dst=eBgPalette9, len=0x8, delay=6
    task_direct_arg paletteSciLab_077CFF4_0
    task_direct_arg paletteSciLab_077CFF4_1
    task_direct_arg paletteSciLab_077CFF4_2
    task_direct_arg paletteSciLab_077CFF4_3
    task_direct_arg paletteSciLab_077CFF4_4
    task_repeat

global_label BgTask_803BB54
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Power_Plant_Control_Room+4
    task_stop

global_label BgTask_803BB6C
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg paletteSciLab_077D0B4
    task_stop

global_label BgTask_803BB84
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=6
    task_direct_arg paletteSciLab_077D254_00
    task_direct_arg paletteSciLab_077D254_01
    task_direct_arg paletteSciLab_077D254_02
    task_direct_arg paletteSciLab_077D254_03
    task_direct_arg paletteSciLab_077D254_04
    task_direct_arg paletteSciLab_077D254_05
    task_direct_arg paletteSciLab_077D254_06
    task_direct_arg paletteSciLab_077D254_07
    task_direct_arg paletteSciLab_077D254_08
    task_direct_arg paletteSciLab_077D254_09
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_13
L_803BC00:
    task_direct_arg paletteSciLab_077D254_14
    task_direct_arg paletteSciLab_077D254_13
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_09
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_13
    task_direct_arg paletteSciLab_077D254_14
    task_direct_arg paletteSciLab_077D254_13
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_09
    task_direct_arg paletteSciLab_077D254_08
    task_direct_arg paletteSciLab_077D254_07
    task_direct_arg paletteSciLab_077D254_06
    task_direct_arg paletteSciLab_077D254_07
    task_direct_arg paletteSciLab_077D254_08
    task_direct_arg paletteSciLab_077D254_09
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_13
    task_jump L_803BC00

global_label BgTask_803BCD8
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=1
    task_direct_arg paletteSciLab_077D254_00
    task_stop

global_label BgTask_803BCF0
    task_direct slot=1, dst=eBgPalette8, len=0x8, delay=6
    task_direct_arg paletteSciLab_077D254_14
    task_direct_arg paletteSciLab_077D254_13
    task_direct_arg paletteSciLab_077D254_12
    task_direct_arg paletteSciLab_077D254_11
    task_direct_arg paletteSciLab_077D254_10
    task_direct_arg paletteSciLab_077D254_09
    task_direct_arg paletteSciLab_077D254_08
    task_direct_arg paletteSciLab_077D254_07
    task_direct_arg paletteSciLab_077D254_06
    task_direct_arg paletteSciLab_077D254_05
    task_direct_arg paletteSciLab_077D254_04
    task_direct_arg paletteSciLab_077D254_03
    task_direct_arg paletteSciLab_077D254_02
    task_direct_arg paletteSciLab_077D254_01
    task_direct_arg paletteSciLab_077D254_00
    task_stop

global_label BgTask_803BD78
    task_direct slot=0, dst=eBgPalette0, len=0x68, delay=1
    task_direct_arg BgData_Palette_SciLab_Generator_Room+4
    task_stop
