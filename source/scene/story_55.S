#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_55
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_55_0_080901c0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_55_0_08090134:
    .word S_Story_55_0
    .word S_Story_55_1
    .word S_Story_55_2
    .word S_Story_55_3
    .word S_Story_55_4


_ts S_Story_55_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_55_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_55_080901c4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_55_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809017e
    Scene_Next
LAB_0809017e:
    bl         Scene_IsStartPressed
    beq        LAB_08090188
    bl         S_Story_55_SkipIfStart
LAB_08090188:
    pop        {pc}


_nt S_Story_55_3
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_55_4
    Flag_SetBase 0xB5
    bl         Flag_SetPlayerActive
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_55_SkipIfStart
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_55_0_080901c0:
    .word PTR_S_Story_55_0_08090134

PTR_ScenarioData_55_080901c4:
    .word ScenarioData_55
