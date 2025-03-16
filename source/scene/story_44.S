#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_44
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_44_0_0808ded8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_44_0_0808de3c:
    .word S_Story_44_0
    .word S_Story_44_1
    .word S_Story_44_2
    .word S_Story_44_3
    .word S_Story_44_4


_ts S_Story_44_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_44_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_44_0808dedc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808de7c
    bl         S_Story_44_SkipIfStart
LAB_0808de7c:
    pop        {pc}


_nt S_Story_44_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808de90
    Scene_Next
LAB_0808de90:
    bl         Scene_IsStartPressed
    beq        LAB_0808de9a
    bl         S_Story_44_SkipIfStart
LAB_0808de9a:
    pop        {pc}


_ts S_Story_44_3
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_44_4
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xB4
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_44_SkipIfStart
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_44_0_0808ded8:
    .word PTR_S_Story_44_0_0808de3c

PTR_ScenarioData_44_0808dedc:
    .word ScenarioData_44
