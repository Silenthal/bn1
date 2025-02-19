#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set -92, 84, 0
    cam_end

    .align 2, 0



_ts Scene_Story_2F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2F_0_0808a91c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2F_0_0808a7a4:
    .word S_Story_2F_0
    .word S_Story_2F_1
    .word S_Story_2F_2
    .word S_Story_2F_3
    .word S_Story_2F_4
    .word S_Story_2F_5
    .word S_Story_2F_6
    .word S_Story_2F_7
    .word S_Story_2F_8


_ts S_Story_2F_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_2F_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808a80c
    push       {r5}
    mov        r0,#0x5c
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x54
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a80c:
    pop        {pc}


_nt S_Story_2F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a836
    push       {r5}
    ldr        r0,PTR_ScenarioData_2F_0808a920
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808a836
    bl         S_Story_2F_SkipIfStart
LAB_0808a836:
    pop        {pc}


_ts S_Story_2F_3
    Flag_GetBase 0xA5
    beq        LAB_0808a854
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    mov        r0,#0xc
    bl         PetStatusControl_SetState
    pop        {r5}
    Scene_Next
LAB_0808a854:
    bl         Scene_IsStartPressed
    beq        LAB_0808a85e
    bl         S_Story_2F_SkipIfStart
LAB_0808a85e:
    pop        {pc}


_ts S_Story_2F_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808a87a
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    Scene_Next
LAB_0808a87a:
    bl         Scene_IsStartPressed
    beq        LAB_0808a884
    bl         S_Story_2F_SkipIfStart
LAB_0808a884:
    pop        {pc}


_nt S_Story_2F_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a8b6
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808a8a2
    bl         S_Story_2F_SkipIfStart
LAB_0808a8a2:
    pop        {pc}


_ts S_Story_2F_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a8b6
    Scene_Next
LAB_0808a8b6:
    bl         Scene_IsStartPressed
    beq        LAB_0808a8c0
    bl         S_Story_2F_SkipIfStart
LAB_0808a8c0:
    pop        {pc}


_nt S_Story_2F_7
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_2F_8
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0xB0
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    bl         PlayerAnimation_Unlock
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_2F_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_2F_0_0808a91c:
    .word PTR_S_Story_2F_0_0808a7a4

PTR_ScenarioData_2F_0808a920:
    .word ScenarioData_2F
