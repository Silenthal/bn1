#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_80311A0
    task_direct slot=0, dst=0x6004020, len=0x58, delay=600
    task_direct_arg tilesetGovt_077A254_0
    task_direct_arg tilesetGovt_077A254_1, 12
    task_direct_arg tilesetGovt_077A254_2, 12
    task_direct_arg tilesetGovt_077A254_1, 12
    task_direct_arg tilesetGovt_077A254_2, 12
    task_direct_arg tilesetGovt_077A254_1, 12
    task_direct_arg tilesetGovt_077A254_2, 12
    task_direct_arg tilesetGovt_077A254_1, 12
    task_repeat

global_label BgTask_80311F0
    task_direct slot=0, dst=0x6002400, len=0x60, delay=16
    task_direct_arg tilesetGovt_077A674_00
    task_direct_arg tilesetGovt_077A674_01
    task_direct_arg tilesetGovt_077A674_00
    task_direct_arg tilesetGovt_077A674_01
    task_direct_arg tilesetGovt_077A674_00
    task_direct_arg tilesetGovt_077A674_01
    task_direct_arg tilesetGovt_077A674_02, 24
    task_direct_arg tilesetGovt_077A674_03, 8
    task_direct_arg tilesetGovt_077A674_04, 8
    task_direct_arg tilesetGovt_077A674_05, 8
    task_direct_arg tilesetGovt_077A674_06, 8
    task_direct_arg tilesetGovt_077A674_07, 8
    task_direct_arg tilesetGovt_077A674_08, 8
    task_direct_arg tilesetGovt_077A674_05, 8
    task_direct_arg tilesetGovt_077A674_06, 8
    task_direct_arg tilesetGovt_077A674_07, 8
    task_direct_arg tilesetGovt_077A674_08, 8
    task_direct_arg tilesetGovt_077A674_09
    task_direct_arg tilesetGovt_077A674_10, 32
    task_direct_arg tilesetGovt_077A674_11
    task_direct_arg tilesetGovt_077A674_12, 8
    task_direct_arg tilesetGovt_077A674_13, 48
    task_repeat

global_label BgTask_80312B0
    task_direct slot=0, dst=gBgPalette9, len=0x8, delay=6
    task_direct_arg paletteGovt_077BB74_0
    task_direct_arg paletteGovt_077BB74_1
    task_direct_arg paletteGovt_077BB74_2
    task_direct_arg paletteGovt_077BB74_3
    task_direct_arg paletteGovt_077BB74_4
    task_repeat

global_label BgTask_80312E8
    task_direct slot=0, dst=gBgPalette4, len=0x8, delay=1
    task_direct_arg paletteGovt_077BC34
    task_stop

global_label BgTask_8031300
    task_direct slot=1, dst=gBgPalette7, len=0x8, delay=1
    task_direct_arg paletteGovt_077BC54
    task_stop
