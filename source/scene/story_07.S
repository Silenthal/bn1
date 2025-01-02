#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_07
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_07_0_08084248
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_07_0_080841ac:
    .word S_Story_07_0
    .word S_Story_07_1
    .word S_Story_07_2
    .word S_Story_07_3


_ts S_Story_07_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_07_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080841f0
    push       {r5}
    ldr        r0,PTR_ScenarioData_07_0808424c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080841f0:
    pop        {pc}

    .align 2, 0



_ts S_Story_07_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084208
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08084208:
    bl         Scene_IsStartPressed
    beq        LAB_08084212
    bl         S_Story_07_SkipIfStart
LAB_08084212:
    pop        {pc}


_ts S_Story_07_3
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0x9E
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0



_ts S_Story_07_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_07_0_08084248:
    .word PTR_S_Story_07_0_080841ac

PTR_ScenarioData_07_0808424c:
    .word ScenarioData_07
