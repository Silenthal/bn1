#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_40
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_40_0_0808d72c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_40_0_0808d690:
    .word S_Story_40_0
    .word S_Story_40_1
    .word S_Story_40_2
    .word S_Story_40_3
    .word S_Story_40_4


_ts S_Story_40_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_40_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_40_0808d730
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808d6d0
    bl         FUN_0808d71a
LAB_0808d6d0:
    pop        {pc}


_nt S_Story_40_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d6e4
    Scene_Next
LAB_0808d6e4:
    bl         Scene_IsStartPressed
    beq        LAB_0808d6ee
    bl         FUN_0808d71a
LAB_0808d6ee:
    pop        {pc}


_ts S_Story_40_3
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_40_4
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xAA
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt FUN_0808d71a
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_40_0_0808d72c:
    .word PTR_S_Story_40_0_0808d690

PTR_ScenarioData_40_0808d730:
    .word ScenarioData_40
