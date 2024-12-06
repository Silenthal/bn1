#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_6A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6A_0_08093980
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6A_0_080938d8:
    .word S_Story_6A_0
    .word S_Story_6A_1
    .word S_Story_6A_2
    .word S_Story_6A_3
    .word S_Story_6A_4


_ts S_Story_6A_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    pop        {pc}


_ts S_Story_6A_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093926
    push       {r5}
    ldr        r0,PTR_ScenarioData_6A_08093984
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08093926:
    pop        {pc}


_ts S_Story_6A_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809393a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809393a:
    bl         Scene_IsStartPressed
    beq        LAB_08093944
    bl         S_Story_6A_SkipIfStart
LAB_08093944:
    pop        {pc}


_nt S_Story_6A_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_6A_4
    bl         Flag_SetPlayerActive
    push       {r5}
    mov        r0,#0xa7
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_6A_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_6A_0_08093980:
    .word PTR_S_Story_6A_0_080938d8

PTR_ScenarioData_6A_08093984:
    .word ScenarioData_6A
