#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_4E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4E_0_0808f200
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4E_0_0808f050:
    .word S_Story_4E_0
    .word S_Story_4E_1
    .word S_Story_4E_2
    .word S_Story_4E_3
    .word S_Story_4E_4
    .word S_Story_4E_5
    .word S_Story_4E_6
    .word S_Story_4E_7
    .word S_Story_4E_8


_ts S_Story_4E_0
    bl         Sound_StopAllMusic
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_4E_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808f0be
    mov        r0,#0xa4
    lsl        r0,r0,#0x10
    mov        r1,#0x26
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_4E_0808f204
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f0be:
    pop        {pc}


_ts S_Story_4E_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f0de
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f0de:
    bl         Scene_IsStartPressed
    beq        LAB_0808f0e8
    bl         S_Story_4E_SkipIfStart
LAB_0808f0e8:
    pop        {pc}


_nt S_Story_4E_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f118
    mov        r0,#0x1
    bl         Sound_ChangeSong
    push       {r5}
    ldr        r0,PTR_ScenarioData_4E_0808f204
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808f118
    bl         S_Story_4E_SkipIfStart
LAB_0808f118:
    pop        {pc}


_nt S_Story_4E_4
    Flag_GetBase 0xC9
    beq        LAB_0808f136
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0xc
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f136:
    bl         Scene_IsStartPressed
    beq        LAB_0808f140
    bl         S_Story_4E_SkipIfStart
LAB_0808f140:
    pop        {pc}


_nt S_Story_4E_5
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808f15c
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f15c:
    bl         Scene_IsStartPressed
    beq        LAB_0808f166
    bl         S_Story_4E_SkipIfStart
LAB_0808f166:
    pop        {pc}


_ts S_Story_4E_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f17a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808f17a:
    bl         Scene_IsStartPressed
    beq        LAB_0808f184
    bl         S_Story_4E_SkipIfStart
LAB_0808f184:
    pop        {pc}


_nt S_Story_4E_7
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0xa4
    lsl        r0,r0,#0x10
    mov        r1,#0x26
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         EnableBoundaryCheck
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_4E_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f1dc
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x93
    pop        {r5}
    mov        r0,#0x1
    bl         Sound_ChangeSong
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f1dc:
    pop        {pc}


_nt S_Story_4E_SkipIfStart
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0xc
    bge        LAB_0808f1f0
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_0808f1f0:
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_4E_0_0808f200:
    .word PTR_S_Story_4E_0_0808f050

PTR_ScenarioData_4E_0808f204:
    .word ScenarioData_4E
