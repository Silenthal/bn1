#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end


_ts Scene_Story_06
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_06_0_08083a78
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_06_0_080839bc:
    .word S_Story_06_0
    .word S_Story_06_1
    .word S_Story_06_2
    .word S_Story_06_3


_ts S_Story_06_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Sound_StopAllMusic
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_06_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08083a18
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_06_08083a7c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08083a18:
    pop        {pc}


_ts S_Story_06_2
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08083a30
    Scene_Next
LAB_08083a30:
    bl         Scene_IsStartPressed
    beq        LAB_08083a44
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
LAB_08083a44:
    pop        {pc}


_ts S_Story_06_3
    push       {lr}
    push       {r5}
    bl         Text_DisableDialogue
    Flag_ClearGate F_GATE_00
    Flag_SetBase 0x99
    LoadMain world, r7, r7
    mov        r0,#0x3
    strb       r0,[r7,#World_storyFlag]
    bl         PlayerAnimation_Unlock
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_06_0_08083a78:
    .word PTR_S_Story_06_0_080839bc

PTR_ScenarioData_06_08083a7c:
    .word ScenarioData_06
