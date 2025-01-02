#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_RechargeSuccess
    push       {lr}
    ldr        r0,PTR_PTR_S_RechargeSuccess_0_08091ac4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_RechargeSuccess_0_080919e4:
    .word S_RechargeSuccess_0
    .word S_RechargeSuccess_1
    .word S_RechargeSuccess_2
    .word S_RechargeSuccess_3
    .word S_RechargeSuccess_4
    .word S_RechargeSuccess_5


_ts S_RechargeSuccess_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_RechargeSuccess_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08091a2c
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091a2c:
    pop        {pc}


_nt S_RechargeSuccess_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091a54
    push       {r5}
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x3
    ldr        r7,PTR_PTR_ScenarioData_56_08091ac8
    ldr        r0,[r7,r1]
    add        r1,#0x4
    ldr        r1,[r7,r1]
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091a54:
    pop        {pc}

    .align 2, 0


PTR_ScenarioData_56_08091a58:
    .word ScenarioData_56
    .word 0x5
    .word ScenarioData_57
    .word 0x3
    .word ScenarioData_58
    .word 0x3


_ts S_RechargeSuccess_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091a82
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091a82:
    bl         Scene_IsStartPressed
    beq        LAB_08091a8c
    bl         S_RechargeSuccess_SkipIfStart
LAB_08091a8c:
    pop        {pc}


_nt S_RechargeSuccess_4
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_RechargeSuccess_5
    Flag_SetBase 0xB5
    bl         PlayerAnimation_Unlock
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_RechargeSuccess_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_RechargeSuccess_0_08091ac4:
    .word PTR_S_RechargeSuccess_0_080919e4

PTR_PTR_ScenarioData_56_08091ac8:
    .word PTR_ScenarioData_56_08091a58
