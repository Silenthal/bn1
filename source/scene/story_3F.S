#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set 52, -66, 0
    cam_end

    .align 2, 0



_ts Scene_Story_3F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3F_0_0808d67c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3F_0_0808d5a4:
    .word S_Story_3F_0
    .word S_Story_3F_1
    .word S_Story_3F_2
    .word S_Story_3F_3
    .word S_Story_3F_4


_ts S_Story_3F_0
    bl         Flag_SetPlayerInactive
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_3F_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d600
    push       {r5}
    mov        r0,#0xc
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    ldr        r0,PTR_ScenarioData_3F_0808d680
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
LAB_0808d600:
    pop        {pc}


_nt S_Story_3F_2
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808d622
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808d63e
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    b          LAB_0808d63e
LAB_0808d622:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d634
    Scene_Next
LAB_0808d634:
    bl         Scene_IsStartPressed
    beq        LAB_0808d63e
    bl         S_Story_3F_SkipIfStart
LAB_0808d63e:
    pop        {pc}


_ts S_Story_3F_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_3F_4
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xB1
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_3F_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_3F_0_0808d67c:
    .word PTR_S_Story_3F_0_0808d5a4

PTR_ScenarioData_3F_0808d680:
    .word ScenarioData_3F
