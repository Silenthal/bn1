#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


_ts Scene_School_Comp_2_GateClear
    push       {lr}
    ldr        r0,PTR_PTR_S_School_Comp_2_GateClear_0_08087038
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_School_Comp_2_GateClear_0_08086f74:
    .word S_School_Comp_2_GateClear_0
    .word S_School_Comp_2_GateClear_1
    .word S_School_Comp_2_GateClear_2
    .word S_School_Comp_2_GateClear_3
    .word S_School_Comp_2_GateClear_4
    .word S_School_Comp_2_GateClear_5


_ts S_School_Comp_2_GateClear_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086fa6
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086fa6:
    pop        {pc}


_ts S_School_Comp_2_GateClear_1
    push       {r5}
    mov        r0,#0xa9
    bl         Flag_ClearBase
    mov        r0,#0x0
    bl         Flag_SetIgnore
    pop        {r5}
    mov        r0,#0x3c
    str        r0,[r5,#0x10]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_School_Comp_2_GateClear_2
    ldr        r0,[r5,#0x10]
    sub        r0,#0x1
    str        r0,[r5,#0x10]
    bne        LAB_08086fd2
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086fd2:
    bl         Scene_IsStartPressed
    beq        LAB_08086fdc
    bl         S_School_Comp_2_GateClear_SkipIfStart
LAB_08086fdc:
    pop        {pc}


_nt S_School_Comp_2_GateClear_3
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086ff0
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08086ff0:
    pop        {pc}


_nt S_School_Comp_2_GateClear_4
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_School_Comp_2_GateClear_5
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087024
    push       {r5}
    bl         Flag_SetPlayerActive
    mov        r0,#0xa8
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08087024:
    pop        {pc}


_nt S_School_Comp_2_GateClear_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_School_Comp_2_GateClear_0_08087038:
    .word PTR_S_School_Comp_2_GateClear_0_08086f74
