#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_Story_0B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0B_0_08084d00
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_0B_0_08084bfc:
    .word S_Story_0B_0
    .word S_Story_0B_1
    .word S_Story_0B_2
    .word S_Story_0B_3
    .word S_Story_0B_4
    .word S_Story_0B_5


_ts S_Story_0B_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_0B_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08084c52
    push       {r5}
    mov        r0,#0x2c
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08084c52:
    pop        {pc}


_ts S_Story_0B_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084c74
    push       {r5}
    ldr        r0,PTR_ScenarioData_0B_08084d04
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08084c74:
    bl         Scene_IsStartPressed
    beq        LAB_08084c7e
    bl         S_Story_0B_SkipIfStart
LAB_08084c7e:
    pop        {pc}


_ts S_Story_0B_3
    push       {lr}
    push       {r5}
    Flag_GetBase 0xDC
    pop        {r5}
    beq        LAB_08084c9e
    push       {r5}
    mov        r0,#0x2d
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_08084c9e:
    bl         Scene_IsStartPressed
    beq        LAB_08084ca8
    bl         S_Story_0B_SkipIfStart
LAB_08084ca8:
    pop        {pc}

    .align 2, 0



_ts S_Story_0B_4
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084cc0
    Scene_Next
LAB_08084cc0:
    bl         Scene_IsStartPressed
    beq        LAB_08084cca
    bl         S_Story_0B_SkipIfStart
LAB_08084cca:
    pop        {pc}


_ts S_Story_0B_5
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0xC7
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0



_ts S_Story_0B_SkipIfStart
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_0B_0_08084d00:
    .word PTR_S_Story_0B_0_08084bfc

PTR_ScenarioData_0B_08084d04:
    .word ScenarioData_0B
