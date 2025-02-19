#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_3D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3D_0_0808d34c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3D_0_0808d2b0:
    .word S_Story_3D_0
    .word S_Story_3D_1
    .word S_Story_3D_2
    .word S_Story_3D_3
    .word S_Story_3D_4


_ts S_Story_3D_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_3D_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_3D_0808d350
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808d2f0
    bl         FUN_0808d33a
LAB_0808d2f0:
    pop        {pc}


_nt S_Story_3D_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d304
    Scene_Next
LAB_0808d304:
    bl         Scene_IsStartPressed
    beq        LAB_0808d30e
    bl         FUN_0808d33a
LAB_0808d30e:
    pop        {pc}


_ts S_Story_3D_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_3D_4
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xA8
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt FUN_0808d33a
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_3D_0_0808d34c:
    .word PTR_S_Story_3D_0_0808d2b0

PTR_ScenarioData_3D_0808d350:
    .word ScenarioData_3D
