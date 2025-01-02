#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


MapEntranceOptions_ARRAY_08091870:
    MapEntrance Map_Govt_SciLab_Lobby, d_se, f(-204, -174, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_Govt_Yuichiro_Lab, d_se, f(-124, -190, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Power_Plant_Hallway, d_se, f(-282, -122, 0)
    .byte -1, 0x0, 0x0, 0x0
    MapEntrance Map_SciLab_Restaurant_Hallway, d_se, f(-274, -126, 0)
    .byte -1, 0x0, 0x0, 0x0


_ts Scene_GovtElevator
    push       {lr}
    ldr        r0,PTR_PTR_S_GovtElevator_0_080919d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_GovtElevator_0_080918cc:
    .word S_GovtElevator_0
    .word S_GovtElevator_1
    .word S_GovtElevator_2
    .word S_GovtElevator_3
    .word S_GovtElevator_4


_ts S_GovtElevator_0
    bl         Flag_SetPlayerInactive
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_GovtElevator_1
    push       {r5}
    ldrb       r0,[r5,#0x4]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_GovtElevator_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091956
    Flag_GetBase 0x31
    bne        LAB_08091928
    Flag_GetBase 0x32
    bne        LAB_0809192e
    Flag_GetBase 0x34
    bne        LAB_08091934
    mov        r0,#0x2
    strb       r0,[r5,#0x4]
    b          LAB_08091938
LAB_08091928:
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    b          LAB_08091938
LAB_0809192e:
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    b          LAB_08091938
LAB_08091934:
    mov        r0,#0x3
    strb       r0,[r5,#0x4]
LAB_08091938:
    ldr        r0,PTR_MapEntranceOptions_ARRAY_080919d4
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#0x10]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091956:
    pop        {pc}


_ts S_GovtElevator_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091974
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091974:
    pop        {pc}


_nt S_GovtElevator_4
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Flag_ClearBase 0x31
    Flag_ClearBase 0x32
    Flag_ClearBase 0x34
    Flag_ClearBase 0x33
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
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
    mov        r0,#0xc1
    bl         Sound_PlaySongImmediate
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

PTR_PTR_S_GovtElevator_0_080919d0:
    .word PTR_S_GovtElevator_0_080918cc

PTR_MapEntranceOptions_ARRAY_080919d4:
    .word MapEntranceOptions_ARRAY_08091870
