#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label mapExitList_ACDC_Elementary
    .word mapExitList_School_Class_5A
    .word mapExitList_School_Class_5B
    .word mapExitList_School_Library
    .word mapExitList_School_2F_Hallway
    .word 0
    .word mapExitList_School_Class_1A
    .word mapExitList_School_Class_1B
    .word mapExitList_School_AV_Room
    .word mapExitList_School_Infirmary
    .word mapExitList_School_1F_Hallway
    .word 0
    .word mapExitList_School_Cross_Hallway
    .word mapExitList_School_Storage
    .word mapExitList_School_Staff_Lounge
    .word mapExitList_School_Staff_Lounge_Hallway


mapExitList_School_Class_5A:
    MapEntrance Map_School_2F_Hallway, d_se, f(-343, 24, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(-538, 24, 0)

global_label MapEntrance_ARRAY_08023de8
    MapEntrance Map_ACDC_Town, d_sw, f(346, -90, 0)
    MapEntrance Map_ACDC_Town, d_sw, f(346, -90, 0)

mapExitList_School_Class_5B:
    MapEntrance Map_School_2F_Hallway, d_se, f(-56, 24, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(-248, 24, 0)

mapExitList_School_Library:
    MapEntrance Map_School_2F_Hallway, d_se, f(136, 24, 0)

mapExitList_School_2F_Hallway:
    MapEntrance Map_School_Class_5A, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_5A, d_nw, f(66, 115, 0)
    MapEntrance Map_School_Class_5B, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_5B, d_nw, f(66, 115, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(24, 6, 0)
    MapEntrance Map_School_Library, d_nw, f(-150, 106, 0)

mapExitList_School_Class_1A:
    MapEntrance Map_School_1F_Hallway, d_se, f(-343, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(-538, 24, 0)

mapExitList_School_Class_1B:
    MapEntrance Map_School_1F_Hallway, d_se, f(-56, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(-248, 24, 0)

mapExitList_School_AV_Room:
    MapEntrance Map_School_1F_Hallway, d_se, f(328, 24, 0)
    MapEntrance Map_School_1F_Hallway, d_se, f(138, 24, 0)

mapExitList_School_Infirmary:
    MapEntrance Map_School_1F_Hallway, d_se, f(424, 24, 0)

mapExitList_School_1F_Hallway:
    MapEntrance Map_School_Class_1A, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_1A, d_nw, f(66, 115, 0)
    MapEntrance Map_School_Class_1B, d_nw, f(-126, 115, 0)
    MapEntrance Map_School_Class_1B, d_nw, f(66, 115, 0)
    MapEntrance Map_School_2F_Hallway, d_se, f(24, 6, 0)
    MapEntrance Map_School_AV_Room, d_nw, f(-118, 107, 0)
    MapEntrance Map_School_AV_Room, d_nw, f(90, 107, 0)
    MapEntrance Map_School_Infirmary, d_nw, f(-14, 66, 0)
    MapEntrance Map_School_Cross_Hallway, d_ne, f(-154, 30, 0)

mapExitList_School_Cross_Hallway:
    MapEntrance Map_ACDC_School_Gate, d_s, f(12, -68, 0)
    MapEntrance Map_School_1F_Hallway, d_sw, f(476, 50, 0)
    MapEntrance Map_School_Staff_Lounge_Hallway, d_ne, f(-285, 70, 0)

mapExitList_School_Storage:
    MapEntrance Map_School_Staff_Lounge_Hallway, d_se, f(-212, 49, 0)

mapExitList_School_Staff_Lounge:
    MapEntrance Map_School_Staff_Lounge_Hallway, d_se, f(76, 49, 0)

mapExitList_School_Staff_Lounge_Hallway:
    MapEntrance Map_School_Cross_Hallway, d_sw, f(72, 30, 0)
    MapEntrance Map_School_Storage, d_nw, f(6, 50, 0)
    MapEntrance Map_School_Staff_Lounge, d_nw, f(123, 118, 0)

global_label BgTask_08024018
    task_direct 0, 0x6001A40, 0x180
    task_direct_arg 0x876BBB4
    task_stop

global_label BgTask_08024030
    task_direct 0, 0x6001A40, 0x180
    task_direct_arg 0x876C1B4
    task_stop

global_label BgTask_08024048
    task_direct 1, 0x2006E30, 0x8, 4
    task_direct_arg 0x876FF14
    task_stop

global_label BgTask_08024060
    task_direct 1, 0x2006E30, 0x8, 4
    task_direct_arg 0x876FDB4
    task_direct_arg 0x876FDD4
    task_direct_arg 0x876FDF4
    task_direct_arg 0x876FE14
    task_direct_arg 0x876FE34
    task_direct_arg 0x876FE54
    task_direct_arg 0x876FE74
    task_direct_arg 0x876FE94
    task_direct_arg 0x876FEB4
    task_direct_arg 0x876FED4
    task_direct_arg 0x876FEF4
    task_direct_arg 0x876FF14
    task_repeat

global_label BgTask_080240D0
    task_direct 1, 0x2006E30, 0x8, 10
    task_direct_arg 0x876FDB4
    task_direct_arg 0x876FDD4
    task_direct_arg 0x876FDF4
    task_direct_arg 0x876FE14
    task_direct_arg 0x876FE34
    task_direct_arg 0x876FE54
    task_direct_arg 0x876FE74
    task_direct_arg 0x876FE94
    task_direct_arg 0x876FEB4
    task_direct_arg 0x876FED4
    task_direct_arg 0x876FEF4
    task_direct_arg 0x876FF14
    task_repeat

global_label BgTask_08024140
    task_direct 0, 0x6001A40, 0x180, 10
    task_direct_arg 0x876C7B4
    task_direct_arg 0x876CDB4
    task_direct_arg 0x876D3B4
    task_direct_arg 0x876D9B4, 90
    task_repeat

global_label BgTask_08024170
    task_direct 0, 0x6001A40, 0x180, 30
    task_direct_arg 0x876DFB4
    task_direct_arg 0x876E5B4
    task_direct_arg 0x876EBB4, 60
    task_repeat

global_label BgTask_08024198
    task_direct 0, 0x6001A40, 0x180, 30
    task_direct_arg 0x876F1B4
    task_direct_arg 0x876F7B4, 90
    task_repeat

global_label BgTask_080241B8
    task_direct 0, 0x2006D50, 0x8, 6
    task_direct_arg 0x876FF34
    task_direct_arg 0x876FF54
    task_direct_arg 0x876FF74
    task_direct_arg 0x876FF94
    task_direct_arg 0x876FFB4
    task_direct_arg 0x876FFD4
    task_direct_arg 0x876FFF4
    task_direct_arg 0x8770014
    task_repeat

global_label BgTask_08024208
    task_direct 0, 0x2006D50, 0x8, 20
    task_direct_arg 0x8770034
    task_direct_arg 0x8770054
    task_direct_arg 0x8770074
    task_direct_arg 0x8770094
    task_direct_arg 0x87700B4
    task_direct_arg 0x87700D4
    task_direct_arg 0x87700F4
    task_repeat

global_label BgTask_08024250
    task_direct 0, 0x2006D50, 0x8, 20
    task_direct_arg 0x8770114
    task_stop


_ts dummy_ACDC_Elementary
    push       {lr}
    pop        {pc}


_ts GraphicDataSetup_ACDC_Elementary
    push       {lr}
    mov        r7,r10
    ldr        r0,PTR_mapExitList_ACDC_Elementary_08024330
    ldr        r1,[r7,#0x2c]
    ldr        r2,[r7,#0x8]
    ldrb       r3,[r2,#0x5]
    lsl        r4,r3,#0x2
    add        r0,r0,r4
    ldr        r0,[r0,#0x0]
    str        r0,[r1,#0x14]
    push       {r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         BGDM_Init
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         Map_LoadBackgroundData
    pop        {r5}
    ldr        r0,[r5,#0x38]
    ldr        r1,[r5,#0x3c]
    ldr        r2,[r5,#0x40]
    ldrb       r3,[r5,#0x4]
    ldrb       r4,[r5,#0x5]
    push       {r5}
    bl         Camera_Init
    bl         BGDM_Load
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_gDstCompressedSpriteData_08024334
    bl         SpriteLz_Init
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_spriteList_School_Class_5A_08024338
    ldr        r0,[r0,r1]
    bl         SpriteLz_DecompressSpriteList
    pop        {r5}
    pop        {pc}

    .align 2, 0

global_label PTR_spriteList_School_Class_5A_080242cc
    .word spriteList_School_Class_5A
    .word spriteList_School_Class_5B
    .word spriteList_School_Library
    .word spriteList_School_None
    .word spriteList_School_None
    .word spriteList_School_Class_1A
    .word spriteList_School_Class_1B
    .word spriteList_School_AV_Room
    .word spriteList_School_Infirmary
    .word spriteList_School_None
    .word spriteList_School_None
    .word spriteList_School_None
    .word spriteList_School_None
    .word spriteList_School_Staff_Lounge
    .word spriteList_School_None
spriteList_School_Class_5A:
    .short 0xD0
    .short -1
spriteList_School_Class_5B:
    .short 0xD0
    .short -1
spriteList_School_Library:
    .short 0xE9
    .short 0xEA
    .short -1
spriteList_School_Class_1A:
    .short 0xD0
    .short -1
spriteList_School_Class_1B:
    .short 0xD0
    .short -1
spriteList_School_AV_Room:
    .short 0xD0
    .short -1
spriteList_School_Infirmary:
    .short 0xD5
    .short 0xD6
    .short -1
spriteList_School_Staff_Lounge:
    .short 0xD1
    .short 0xD2
    .short -1
spriteList_School_None:
    .short -1

PTR_mapExitList_ACDC_Elementary_08024330:
    .word mapExitList_ACDC_Elementary
PTR_gDstCompressedSpriteData_08024334:
    .word gDstCompressedSpriteData
PTR_PTR_spriteList_School_Class_5A_08024338:
    .word PTR_spriteList_School_Class_5A_080242cc
global_label flagSetup_ACDC_Elementary
    .word FlagSetup_ACDC_Elementary_S0
    .word FlagSetup_ACDC_Elementary_S0
    .word FlagSetup_ACDC_Elementary_S0
    .word FlagSetup_ACDC_Elementary_S0
    .word FlagSetup_ACDC_Elementary_S0
    .word FlagSetup_ACDC_Elementary_S0

global_label mapSetup_ACDC_Elementary
    .word mapSetup_ACDC_Elementary_S0
    .word mapSetup_ACDC_Elementary_S1
    .word mapSetup_ACDC_Elementary_S2
    .word mapSetup_ACDC_Elementary_S3
    .word mapSetup_ACDC_Elementary_S3
    .word mapSetup_ACDC_Elementary_S5
mapSetup_ACDC_Elementary_S0:
    .word MapSetup_School_Class_5A_S0
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default

mapSetup_ACDC_Elementary_S1:
    .word MapSetup_School_Class_5A_S1
    .word MapSetup_School_Class_5B_S1
    .word MapSetup_School_Library_S1
    .word MapSetup_School_2F_Hallway_S1
    .word MapSetup_Default
    .word MapSetup_School_Class_1A_S1
    .word MapSetup_School_Class_1B_S1
    .word MapSetup_School_AV_Room_S1
    .word MapSetup_School_Infirmary_S1
    .word MapSetup_School_1F_Hallway_S1
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_S1
    .word MapSetup_School_Storage_S1
    .word MapSetup_School_Staff_Lounge_S1
    .word MapSetup_School_Staff_Lounge_Hallway_S1
mapSetup_ACDC_Elementary_S2:
    .word MapSetup_School_Class_5A_S2
    .word MapSetup_School_Class_5B_S2
    .word MapSetup_School_Library_S2
    .word MapSetup_School_2F_Hallway_S2
    .word MapSetup_Default
    .word MapSetup_School_Class_1A_S2
    .word MapSetup_School_Class_1B_S2
    .word MapSetup_School_AV_Room_S2
    .word MapSetup_School_Infirmary_S2
    .word MapSetup_School_1F_Hallway_S2
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_S2
    .word MapSetup_School_Storage_S2
    .word MapSetup_Default
    .word MapSetup_School_Staff_Lounge_Hallway_S2
    .word MapSetup_Default
mapSetup_ACDC_Elementary_S3:
    .word MapSetup_School_Class_5A_S3
    .word MapSetup_School_Class_5B_S3
    .word MapSetup_School_Library_S3
    .word MapSetup_School_2F_Hallway_S3
    .word MapSetup_Default
    .word MapSetup_School_Class_1A_S3
    .word MapSetup_School_Class_1B_S3
    .word MapSetup_School_AV_Room_S3
    .word MapSetup_School_Infirmary_S3
    .word MapSetup_School_1F_Hallway_S3
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_S3
    .word MapSetup_School_Storage_S3
    .word MapSetup_Default
    .word MapSetup_School_Staff_Lounge_Hallway_S3
    .word MapSetup_Default
mapSetup_ACDC_Elementary_S5:
    .word MapSetup_School_Class_5A_S3
    .word MapSetup_School_Class_5B_S3
    .word MapSetup_School_Library_S3
    .word MapSetup_School_2F_Hallway_S3
    .word MapSetup_Default
    .word MapSetup_School_Class_1A_S3
    .word MapSetup_School_Class_1B_S3
    .word MapSetup_School_AV_Room_S3
    .word MapSetup_School_Infirmary_S3
    .word MapSetup_School_1F_Hallway_S3
    .word MapSetup_Default
    .word MapSetup_School_Cross_Hallway_S3
    .word MapSetup_School_Storage_S3
    .word MapSetup_School_Staff_Lounge_S5
    .word MapSetup_School_Staff_Lounge_Hallway_S5
    .word MapSetup_Default

global_label eventHandler_ACDC_Elementary
    .word eventHandler_ACDC_Elementary_S0
    .word eventHandler_ACDC_Elementary_S1
    .word eventHandler_ACDC_Elementary_S2
    .word eventHandler_ACDC_Elementary_S3
    .word eventHandler_ACDC_Elementary_S3
    .word eventHandler_ACDC_Elementary_S5

eventHandler_ACDC_Elementary_S0:
    .word EventHandler_School_Class_5A_S0
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
eventHandler_ACDC_Elementary_S1:
    .word EventHandler_School_Class_5A_S1
    .word EventHandler_School_Class_5B_S1
    .word EventHandler_School_Library_S1
    .word EventHandler_School_2F_Hallway_S1
    .word EventHandler_Default
    .word EventHandler_School_Class_1A_S1
    .word EventHandler_School_Class_1B_S1
    .word EventHandler_School_AV_Room_S1
    .word EventHandler_School_Infirmary_S1
    .word EventHandler_School_1F_Hallway_S1
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_S1
    .word EventHandler_School_Storage_S1
    .word EventHandler_School_Staff_Lounge_S1
    .word EventHandler_School_Staff_Lounge_Hallway_S1
eventHandler_ACDC_Elementary_S2:
    .word EventHandler_School_Class_5A_S2
    .word EventHandler_School_Class_5B_S2
    .word EventHandler_School_Library_S2
    .word EventHandler_School_2F_Hallway_S2
    .word EventHandler_Default
    .word EventHandler_School_Class_1A_S2
    .word EventHandler_School_Class_1B_S2
    .word EventHandler_School_AV_Room_S2
    .word EventHandler_School_Infirmary_S2
    .word EventHandler_School_1F_Hallway_S2
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_S2
    .word EventHandler_School_Storage_S2
    .word EventHandler_Default
    .word EventHandler_School_Staff_Lounge_Hallway_S2
    .word EventHandler_Default
eventHandler_ACDC_Elementary_S3:
    .word EventHandler_School_Class_5A_S3
    .word EventHandler_School_Class_5B_S3
    .word EventHandler_School_Library_S3
    .word EventHandler_School_2F_Hallway_S3
    .word EventHandler_Default
    .word EventHandler_School_Class_1A_S3
    .word EventHandler_School_Class_1B_S3
    .word EventHandler_School_AV_Room_S3
    .word EventHandler_School_Infirmary_S3
    .word EventHandler_School_1F_Hallway_S3
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_S3
    .word EventHandler_School_Storage_S3
    .word EventHandler_Default
    .word EventHandler_School_Staff_Lounge_Hallway_S3
    .word EventHandler_Default
eventHandler_ACDC_Elementary_S5:
    .word EventHandler_School_Class_5A_S3
    .word EventHandler_School_Class_5B_S3
    .word EventHandler_School_Library_S3
    .word EventHandler_School_2F_Hallway_S3
    .word EventHandler_Default
    .word EventHandler_School_Class_1A_S3
    .word EventHandler_School_Class_1B_S3
    .word EventHandler_School_AV_Room_S3
    .word EventHandler_School_Infirmary_S3
    .word EventHandler_School_1F_Hallway_S3
    .word EventHandler_Default
    .word EventHandler_School_Cross_Hallway_S3
    .word EventHandler_School_Storage_S3
    .word EventHandler_School_Staff_Lounge_S5
    .word EventHandler_School_Staff_Lounge_Hallway_S5
    .word EventHandler_Default

global_label mapDialogue_ACDC_Elementary
    .word mapDialogue_School_Class_5A
    .word mapDialogue_School_Class_5B
    .word mapDialogue_School_Library
    .word mapDialogue_School_2F_Hallway
    .word 0
    .word mapDialogue_School_Class_1A
    .word mapDialogue_School_Class_1B
    .word mapDialogue_School_AV_Room
    .word mapDialogue_School_Infirmary
    .word mapDialogue_School_1F_Hallway
    .word 0
    .word mapDialogue_School_Cross_Hallway
    .word mapDialogue_School_Storage
    .word mapDialogue_School_Staff_Lounge
    .word mapDialogue_School_Staff_Lounge_Hallway
    .word 0

mapDialogue_School_Class_5A:
    .byte 0xE9
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xE5
    .byte 0xE6
    .byte 0xE7
    .byte 0xE8
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Class_5B:
    .byte 0xE6
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xE5
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Library:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xFF
    .byte 0xE1
    .byte 0xE2
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x04
    .byte 0x05
    .byte 0x06
    .byte 0x07
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_2F_Hallway:
    .byte 0xDC
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Class_1A:
    .byte 0xDC
    .byte 0xE5
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Class_1B:
    .byte 0xE4
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE5
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_AV_Room:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xFF
    .byte 0xE2
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Infirmary:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_1F_Hallway:
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Cross_Hallway:
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Storage:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Staff_Lounge:
    .byte 0xDC
    .byte 0xDD
    .byte 0xDE
    .byte 0xDF
    .byte 0xE0
    .byte 0xE1
    .byte 0xE2
    .byte 0xE3
    .byte 0xE4
    .byte 0xE5
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

mapDialogue_School_Staff_Lounge_Hallway:
    .byte 0x02
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
