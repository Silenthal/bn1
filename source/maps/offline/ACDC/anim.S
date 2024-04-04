#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label BgTask_08029EE4
    task_direct slot=0, dst=0x2006CD0, len=0x68, delay=4
    task_direct_arg 0x8771654
    task_stop

global_label BgTask_08029EFC
    task_direct slot=1, dst=0x2006CD0, len=0x68, delay=4
    task_direct_arg 0x83D8108
    task_stop

global_label BgTask_08029F14
    task_tileset slot=2, src=0x8770C54, dst=0x6000020, count=0x22, bufIndex=7, delay=1
    task_tileset_arg TransferArgs_0802A3A4
    task_stop

global_label BgTask_08029F2C
    task_tileset slot=3, src=0x8770C54, dst=0x6003B40, count=0x5, bufIndex=8, delay=1
    task_tileset_arg TransferArgs_0802A3E8
    task_stop

global_label BgTask_08029F44
    task_tileset slot=2, src=0x8770C54, dst=0x6000020, count=0x22, bufIndex=7, delay=1
    task_tileset_arg 0x802A3F4
    task_stop

global_label BgTask_08029F5C
    task_tileset slot=3, src=0x8770C54, dst=0x6003B40, count=0x5, bufIndex=8, delay=1
    task_tileset_arg 0x802A438
    task_stop

global_label BgTask_08029F74
    task_direct slot=4, dst=eBgPaletteB, len=0x8
    task_direct_arg 0x87717F4
    task_stop

global_label BgTask_08029F8C
    task_tileset slot=5, src=0x8770134, dst=0x6003500, count=0x32, bufIndex=9, delay=1
    task_tileset_arg 0x802A444
    task_stop

global_label BgTask_08029FA4
    task_tileset slot=6, src=0x8770134, dst=0x6007F60, count=0x2, bufIndex=10, delay=1
    task_tileset_arg 0x802A4A8
    task_stop

global_label BgTask_08029FBC
    task_tileset slot=5, src=0x8770134, dst=0x6003500, count=0x32, bufIndex=9, delay=1
    task_tileset_arg 0x802A4AC
    task_stop

global_label BgTask_08029FD4
    task_tileset slot=6, src=0x8770134, dst=0x6007F60, count=0x2, bufIndex=10, delay=1
    task_tileset_arg 0x802A510
    task_stop

global_label BgTask_08029FEC
    task_direct slot=0, dst=0x6006C40, len=0x210
    task_direct_arg 0x8771814
    task_stop

global_label BgTask_0802A004
    task_direct slot=0, dst=0x6006C40, len=0x210
    task_direct_arg 0x8772054
    task_stop

global_label BgTask_0802A01C
    task_direct slot=1, dst=0x2006D90, len=0x8, delay=4
    task_direct_arg 0x8772894
    task_stop

global_label BgTask_0802A034
    task_direct slot=0, dst=0x6000020, len=0xA0, delay=12
    task_direct_arg 0x87728B4
    task_direct_arg 0x8772B34
    task_direct_arg 0x87728B4
    task_direct_arg 0x8772B34
    task_direct_arg 0x87728B4
    task_direct_arg 0x8772B34
    task_direct_arg 0x8772DB4
    task_direct_arg 0x8773034
    task_direct_arg 0x87732B4
    task_direct_arg 0x8773534
    task_direct_arg 0x87737B4
    task_direct_arg 0x8773A34
    task_direct_arg 0x8773CB4
    task_direct_arg 0x8773F34
    task_direct_arg 0x87741B4, 24
    task_direct_arg 0x8774434, 24
    task_direct_arg 0x87746B4, 24
    task_direct_arg 0x8774934
    task_direct_arg 0x8774BB4
    task_direct_arg 0x8774934
    task_direct_arg 0x8774BB4
    task_direct_arg 0x8774934
    task_direct_arg 0x8774BB4
    task_repeat

global_label BgTask_0802A0FC
    task_direct slot=0, dst=0x6000020, len=0xA0, delay=6
    task_direct_arg 0x8774E34
    task_direct_arg 0x87750B4
    task_direct_arg 0x8775334
    task_direct_arg 0x87755B4
    task_direct_arg 0x8775834
    task_direct_arg 0x8775AB4
    task_direct_arg 0x8775D34
    task_direct_arg 0x8775FB4
    task_direct_arg 0x8776234
    task_direct_arg 0x87764B4
    task_repeat

global_label BgTask_0802A15C
    task_direct slot=0, dst=0x6000020, len=0xE0, delay=9
    task_direct_arg 0x8776734
    task_direct_arg 0x8776AB4, 30
    task_direct_arg 0x8776734, 6
    task_direct_arg 0x8776AB4, 3
    task_direct_arg 0x8776734, 70
    task_direct_arg 0x8776AB4, 6
    task_direct_arg 0x8776734
    task_direct_arg 0x8776AB4, 30
    task_direct_arg 0x8776734, 6
    task_direct_arg 0x8776AB4, 3
    task_direct_arg 0x8776734, 70
    task_direct_arg 0x8776AB4, 6
    task_direct_arg 0x8776734, 4
    task_direct_arg 0x8776E34, 4
    task_direct_arg 0x87771B4, 4
    task_direct_arg 0x8777534, 4
    task_stop

global_label BgTask_0802A1EC
    task_direct slot=0, dst=0x6000020, len=0xE0
    task_direct_arg 0x8777534
    task_stop

global_label BgTask_0802A204
    task_direct slot=1, dst=0x6002860, len=0x28, delay=20
    task_direct_arg 0x87778B4
    task_direct_arg 0x8777954
    task_direct_arg 0x87779F4
    task_direct_arg 0x8777A94
    task_direct_arg 0x8777B34
    task_direct_arg 0x8777BD4
    task_direct_arg 0x8777C74
    task_direct_arg 0x8777D14
    task_direct_arg 0x8777DB4
    task_direct_arg 0x8777E54
    task_direct_arg 0x8777EF4
    task_direct_arg 0x8777F94
    task_direct_arg 0x8778034
    task_direct_arg 0x87780D4
    task_repeat

global_label BgTask_0802A284
    task_direct slot=0, dst=0x2006CF0, len=0x8, delay=8
    task_direct_arg 0x8778174
    task_direct_arg 0x83F2334
    task_repeat

global_label BgTask_0802A2A4
    task_direct slot=0, dst=0x6002D80, len=0x30, delay=120
    task_direct_arg 0x8778314
    task_direct_arg 0x87783D4, 8
    task_direct_arg 0x8778494, 8
    task_direct_arg 0x8778554, 8
    task_direct_arg 0x8778614, 8
    task_direct_arg 0x87786D4, 8
    task_direct_arg 0x8778614, 8
    task_direct_arg 0x8778554, 8
    task_direct_arg 0x8778494, 8
    task_direct_arg 0x87783D4
    task_direct_arg 0x8778314, 8
    task_direct_arg 0x8778794, 8
    task_direct_arg 0x8778854, 8
    task_direct_arg 0x8778914, 8
    task_direct_arg 0x87789D4, 8
    task_direct_arg 0x8778A94, 8
    task_direct_arg 0x8778B54, 8
    task_direct_arg 0x8778C14, 8
    task_repeat

global_label BgTask_0802A344
    task_direct slot=0, dst=0x6004020, len=0x30
    task_direct_arg 0x877A0D4
    task_stop

global_label BgTask_0802A35C
    task_direct slot=0, dst=0x6004020, len=0x30
    task_direct_arg 0x877A194
    task_stop

global_label BgTask_0802A374
    task_direct slot=1, dst=0x6006FE0, len=0x140, delay=10
    task_direct_arg 0x8778CD4
    task_direct_arg 0x87791D4
    task_direct_arg 0x87796D4
    task_direct_arg 0x8779BD4
    task_repeat

TransferArgs_0802A3A4:

    .short 0x0, 0x1, 0x2, 0x3
    .short 0x4, 0x5, 0x6, 0x7
    .short 0x8, 0x9, 0xB, 0xE
    .short 0x11, 0x12, 0x14, 0x15
    .short 0x16, 0x17, 0x18, 0x19
    .short 0x1A, 0x1B, 0x1C, 0x1D
    .short 0x1E, 0x1F, 0x20, 0x21
    .short 0x22, 0x23, 0x24, 0x25
    .short 0x26, 0x27

TransferArgs_0802A3E8:
    .short 0x2, 0xB, 0xF, 0x10
    .short 0x13

    .align 2, 0

TransferArgs_0802A3F4:
    .short 0x28, 0x29, 0x2A, 0x2B
    .short 0x2C, 0x2D, 0x2E, 0x2F
    .short 0x30, 0x31, 0x33, 0x36
    .short 0x39, 0x3A, 0x3C, 0x3D
    .short 0x3E, 0x3F, 0x40, 0x41
    .short 0x42, 0x43, 0x44, 0x45
    .short 0x46, 0x47, 0x48, 0x49
    .short 0x4A, 0x4B, 0x4C, 0x4D
    .short 0x4E, 0x4F
