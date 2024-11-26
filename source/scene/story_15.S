#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0



_ts Scene_Story_15
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_15_0_08086d1c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_15_0_08086c48:
    .word S_Story_15_0
    .word S_Story_15_1
    .word S_Story_15_2
    .word S_Story_15_3
    .word S_Story_15_4
    .word S_Story_15_5
    .word S_Story_15_6


_ts S_Story_15_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086c7e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086c7e:
    pop        {pc}


_ts S_Story_15_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_15_08086d20
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_15_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086ca6
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086ca6:
    bl         Scene_IsStartPressed
    beq        LAB_08086cb0
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_08086cb0:
    pop        {pc}


_nt S_Story_15_3
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_15_4
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086cf0
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086cf0:
    pop        {pc}


_nt S_Story_15_5
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_15_6
    push       {r5}
    bl         Flag_SetPlayerActive
    mov        r0,#0xa1
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_15_0_08086d1c:
    .word PTR_S_Story_15_0_08086c48

PTR_ScenarioData_15_08086d20:
    .word ScenarioData_15
