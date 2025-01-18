#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


MapEntranceOptions_ARRAY_08087c18:
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x0, 0xC9, 0x1, 0x1
    MapEntrance Map_School_Comp_1, d_nw, f(-348, 288, 0)
    .byte -1, 0x0, 0x0, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x23, 0xD4, 0x1, 0x1
    MapEntrance Map_School_Comp_2, d_s, f(47, 18, 0)
    .byte -1, 0xB3, 0x2, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0xA, 0x0, 0x4, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x5, 0x0, 0x4, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x0, 0xD5, 0x1, 0x1
    MapEntrance Map_School_Comp_3, d_s, f(47, 18, 0)
    .byte -1, 0xB4, 0x2, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x5, 0x0, 0x4, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x5, 0x0, 0x1, 0x1
    MapEntrance Map_School_Comp_1, d_s, f(47, 18, 0)
    .byte -1, 0xCA, 0x2, 0x1
    MapEntrance Map_ACDC_Town, d_s, f(0, 0, 0)
    .byte -1, 0x0, 0x0, 0x1
    MapEntrance Map_School_Class_5A, d_s, f(10, -34, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_Govt_Waterworks_Office, d_sw, f(104, 182, 0)
    .byte 0x1A, 0x0, 0x0, 0x1
    MapEntrance Map_Govt_Yuichiro_Lab, d_se, f(-124, -190, 0)
    .byte 0x5, 0x0, 0x0, 0x1
    MapEntrance Map_Govt_SciLab_Lobby, d_se, f(-204, -174, 0)
    .byte 0x13, 0x0, 0x0, 0x1
    MapEntrance Map_Govt_Waterworks_Lobby, d_sw, f(144, 240, 0)
    .byte 0x4, 0x0, 0x0, 0x1
    MapEntrance Map_DenTown_Center, d_n, f(-114, 194, 0)
    .byte -1, 0x0, 0x0, 0x1
    MapEntrance Map_DenTown_Center, d_n, f(-114, 194, 0)
    .byte -1, 0x0, 0x1, 0x2
    MapEntrance Map_DenTown_Center, d_n, f(-114, 194, 0)
    .byte -1, 0x0, 0x0, 0x2
    MapEntrance Map_SciLab_Power_Plant_Hallway, d_se, f(128, -100, 0)
    .byte 0xE3, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Power_Plant_Control_Room, d_ne, f(24, 4, 0)
    .byte 0x3D, 0x0, 0x0, 0x0
    MapEntrance Map_WWW_Wily_Lab, d_nw, f(68, -30, 0)
    .byte -1, 0x0, 0x0, 0x1
    MapEntrance Map_Govt_Yuichiro_Lab, d_nw, f(100, 206, 0)
    .byte -1, 0x0, 0x0, 0x1
    MapEntrance Map_WWW_Rocket_Hanger, d_nw, f(100, 206, 0)
    .byte -1, 0x0, 0x0, 0x4
    MapEntrance Map_WWW_Rocket_Hanger, d_ne, f(-64, 90, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_Undernet_1, d_ne, f(-416, -108, 0)
    .byte -1, 0x0, 0x0, 0x0


_ts Scene_ChangeMap
    push       {lr}
    ldr        r0,PTR_PTR_S_ChangeMap_0_08087fa0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_ChangeMap_0_08087e40:
    .word S_ChangeMap_0
    .word S_ChangeMap_1
    .word S_ChangeMap_2
    .word S_ChangeMap_3
    .word S_ChangeMap_4


_ts S_ChangeMap_0
    ldr        r0,PTR_MapEntranceOptions_ARRAY_08087fa4
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087e7a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087e7a:
    pop        {pc}


_ts S_ChangeMap_1
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x10]
    cmp        r0,#0xff
    beq        LAB_08087e8a
    bl         Text_LoadAreaDialogue
LAB_08087e8a:
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_ChangeMap_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087ea6
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087ea6:
    pop        {pc}


_ts S_ChangeMap_3
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    cmp        r0,#0x4
    pop        {r5}
    beq        LAB_08087eda
    ldr        r1,[r5,#0x10]
    ldrb       r1,[r1,#0x13]
    cmp        r1,#0x2
    beq        LAB_08087ece
    cmp        r1,#0x4
    beq        LAB_08087eda
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    b          LAB_08087eda
LAB_08087ece:
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_08087eda:
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_ChangeMap_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087f7c
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x11]
    tst        r0,r0
    beq        LAB_08087f16
    push       {r5}
    bl         Flag_SetBase
    pop        {r5}
LAB_08087f16:
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    cmp        r0,#0x4
    pop        {r5}
    beq        LAB_08087f70
    LoadMain world, r0, r7
    ldr        r1,[r5,#0x10]
    ldrb       r1,[r1,#0x13]
    cmp        r1,#0x0
    beq        LAB_08087f40
    cmp        r1,#0x1
    bne        LAB_08087f38
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    b          LAB_08087f40
LAB_08087f38:
    cmp        r1,#0x4
    beq        LAB_08087f40
    mov        r1,#0x1
    strb       r1,[r0,#0x7]
LAB_08087f40:
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#0x10]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    ldrb       r1,[r5,#0x4]
    ldr        r7,PTR_SongId_ARRAY_08087fa8
    ldrb       r0,[r7,r1]
    tst        r0,r0
    beq        LAB_08087f66
    bl         Sound_PlaySE
LAB_08087f66:
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
LAB_08087f70:
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08087f7c:
    pop        {pc}

    .align 2, 0


SongId_ARRAY_08087f80:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0xC1
    .byte 0xC1
    .byte 0xC1
    .byte 0xC1
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00

PTR_PTR_S_ChangeMap_0_08087fa0:
    .word PTR_S_ChangeMap_0_08087e40

PTR_MapEntranceOptions_ARRAY_08087fa4:
    .word MapEntranceOptions_ARRAY_08087c18

PTR_SongId_ARRAY_08087fa8:
    .word SongId_ARRAY_08087f80
