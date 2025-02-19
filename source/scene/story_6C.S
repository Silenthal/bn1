#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_6C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6C_0_08093ec0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6C_0_08093c74:
    .word S_Story_6C_0
    .word S_Story_6C_1
    .word S_Story_6C_2
    .word S_Story_6C_3
    .word S_Story_6C_4
    .word S_Story_6C_5
    .word S_Story_6C_6
    .word S_Story_6C_7
    .word S_Story_6C_8
    .word S_Story_6C_9


_ts S_Story_6C_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    Scene_Next
    mov        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    pop        {pc}


_ts S_Story_6C_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08093ce4
    push       {r5}
    mov        r0,#0x18
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x24
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08093ce4:
    pop        {pc}


_nt S_Story_6C_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093d04
    push       {r5}
    ldr        r0,PTR_ScenarioData_6C_08093ec4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08093d04:
    pop        {pc}


_nt S_Story_6C_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093d2a
    mov        r0,#0x9
    bl         PlayerAnimation_SetState
    mov        r0,#0x8
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    Scene_Next
LAB_08093d2a:
    bl         Scene_IsStartPressed
    beq        LAB_08093d34
    bl         S_Story_6C_SkipIfStart
LAB_08093d34:
    pop        {pc}


_nt S_Story_6C_4
    mov        r0,#0x8
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    bne        LAB_08093d66
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08093d66:
    bl         Scene_IsStartPressed
    beq        LAB_08093d70
    bl         S_Story_6C_SkipIfStart
LAB_08093d70:
    pop        {pc}


_nt S_Story_6C_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093d8c
    mov        r0,#0x2f
    bl         PlayerAnimation_SetState
    mov        r0,#0xa
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08093d8c:
    bl         Scene_IsStartPressed
    beq        LAB_08093d96
    bl         S_Story_6C_SkipIfStart
LAB_08093d96:
    pop        {pc}


_ts S_Story_6C_6
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093db4
    push       {r5}
    ldr        r0,PTR_ScenarioData_6C_08093ec4
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08093db4:
    bl         Scene_IsStartPressed
    beq        LAB_08093dbe
    bl         S_Story_6C_SkipIfStart
LAB_08093dbe:
    pop        {pc}


_ts S_Story_6C_7
    Flag_GetBase 0x74
    beq        LAB_08093ddc
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_08093ddc
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_counter]
LAB_08093ddc:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093dfa
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_08093dfa:
    bl         Scene_IsStartPressed
    beq        LAB_08093e04
    bl         S_Story_6C_SkipIfStart
LAB_08093e04:
    pop        {pc}


_nt S_Story_6C_8
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_08093e1a
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_counter]
LAB_08093e1a:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093e60
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x18
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x24
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_08093e60:
    pop        {pc}


_nt S_Story_6C_9
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_08093e76
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_counter]
LAB_08093e76:
    LoadMain mapEventState, r7, r7
    ldrb       r0,[r5,#Scene_counter]
    strb       r0,[r7,#0x6]
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093ea6
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xA9
    Flag_SetBase 0x74
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08093ea6:
    pop        {pc}


_ts S_Story_6C_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_6C_0_08093ec0:
    .word PTR_S_Story_6C_0_08093c74

PTR_ScenarioData_6C_08093ec4:
    .word ScenarioData_6C
