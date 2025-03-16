#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808810c:
    cam_set 10, -34, 0
    cam_end

    .align 2, 0



_ts Scene_Story_1D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1D_0_0808822c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1D_0_08088124:
    .word S_Story_1D_0
    .word S_Story_1D_1
    .word S_Story_1D_2
    .word S_Story_1D_3
    .word S_Story_1D_4
    .word S_Story_1D_5


_ts S_Story_1D_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08088230
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
    pop        {pc}


_nt S_Story_1D_1
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_1D_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088188
    push       {r5}
    ldr        r0,PTR_ScenarioData_1D_08088234
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08088188:
    pop        {pc}


_nt S_Story_1D_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080881a8
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_080881a8:
    bl         Scene_IsStartPressed
    beq        LAB_080881b2
    bl         S_Story_1D_SkipIfStart
LAB_080881b2:
    pop        {pc}


_ts S_Story_1D_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080881e0
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_080881e0:
    pop        {pc}


_nt S_Story_1D_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088210
    Flag_SetBase 0x90
    push       {r5}
    LoadMain world, r7, r7
    ldr        r5,[r7,#World_playerLocation]
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08088210:
    pop        {pc}


_nt S_Story_1D_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_1D_0_0808822c:
    .word PTR_S_Story_1D_0_08088124

PTR_Cam_Set_08088230:
    .word Cam_Set_0808810c

PTR_ScenarioData_1D_08088234:
    .word ScenarioData_1D
