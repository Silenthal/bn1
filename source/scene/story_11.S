#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_set 240, 20, 0
    cam_move 256, -256, 0, 80
    cam_wait 30
    cam_end


_ts Scene_Story_11
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_11_0_080864a8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_11_0_080863bc:
    .word S_Story_11_0
    .word S_Story_11_1
    .word S_Story_11_2
    .word S_Story_11_3
    .word S_Story_11_4
    .word S_Story_11_5
    .word S_Story_11_6
    .word S_Story_11_7


_ts S_Story_11_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_11_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808640a
    push       {r5}
    ldr        r0,PTR_ScenarioData_11_080864ac
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808640a:
    pop        {pc}


_ts S_Story_11_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808641e
    Scene_Next
LAB_0808641e:
    bl         Scene_IsStartPressed
    beq        LAB_08086428
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
LAB_08086428:
    pop        {pc}


_nt S_Story_11_3
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x91
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_11_4
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_11_5
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086480
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08086480:
    pop        {pc}


_nt S_Story_11_6
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_11_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080864a6
    mov        r0,#0xc
    str        r0,[r5,#Scene_state_s0]
LAB_080864a6:
    pop        {pc}

PTR_PTR_S_Story_11_0_080864a8:
    .word PTR_S_Story_11_0_080863bc

PTR_ScenarioData_11_080864ac:
    .word ScenarioData_11
