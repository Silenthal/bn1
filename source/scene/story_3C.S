#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_3C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3C_0_0808d29c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3C_0_0808d1a8:
    .word S_Story_3C_0
    .word S_Story_3C_1
    .word S_Story_3C_2
    .word S_Story_3C_3
    .word S_Story_3C_4
    .word S_Story_3C_5


_ts S_Story_3C_0
    push       {r5}
    bl         Sound_StopAllMusic
    pop        {r5}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0x18
    bl         PetStatusControl_SetState
    pop        {r5}
    pop        {pc}


_nt S_Story_3C_1
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808d200
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d200:
    pop        {pc}


_nt S_Story_3C_2
    push       {r5}
    ldr        r0,PTR_ScenarioData_3C_0808d2a0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808d21e
    bl         S_Story_3C_SkipIfStart
LAB_0808d21e:
    pop        {pc}


_ts S_Story_3C_3
    Flag_GetBase 0xA5
    beq        LAB_0808d238
    Flag_ClearBase 0xA5
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
LAB_0808d238:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d24a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d24a:
    bl         Scene_IsStartPressed
    beq        LAB_0808d254
    bl         S_Story_3C_SkipIfStart
LAB_0808d254:
    pop        {pc}


_nt S_Story_3C_4
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_3C_5
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xA6
    pop        {r5}
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_3C_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_3C_0_0808d29c:
    .word PTR_S_Story_3C_0_0808d1a8

PTR_ScenarioData_3C_0808d2a0:
    .word ScenarioData_3C
