#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_0D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0D_0_08084fb8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_0D_0_08084edc:
    .word S_Story_0D_0
    .word S_Story_0D_1
    .word S_Story_0D_2
    .word S_Story_0D_3


_ts S_Story_0D_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_0D_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08084f26
    push       {r5}
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    ldr        r0,PTR_ScenarioData_0D_08084fbc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08084f26:
    pop        {pc}


_ts S_Story_0D_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084f48
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08084f48:
    bl         Scene_IsStartPressed
    beq        LAB_08084f52
    bl         S_Story_0D_SkipIfStart
LAB_08084f52:
    pop        {pc}


_ts S_Story_0D_3
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084f88
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xCA
    ldr        r0,PTR_MapEntrance_08084fc0
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    LoadMain world, r7, r7
    mov        r0,#0x6
    strb       r0,[r7,#0x6]
    bl         Scene_UnloadAndResetStepCounter
LAB_08084f88:
    pop        {pc}

    .align 2, 0


MapEntrance_08084f8c:
    MapEntrance Map_ACDC_Lan_Living_Room, d_ne, f(-115, -4, 0)


_ts S_Story_0D_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_0D_0_08084fb8:
    .word PTR_S_Story_0D_0_08084edc

PTR_ScenarioData_0D_08084fbc:
    .word ScenarioData_0D

PTR_MapEntrance_08084fc0:
    .word MapEntrance_08084f8c
