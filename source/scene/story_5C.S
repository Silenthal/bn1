#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_5C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_5C_0_08090dac
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_5C_0_08090bd4:
    .word S_Story_5C_0
    .word S_Story_5C_1
    .word S_Story_5C_2
    .word S_Story_5C_3
    .word S_Story_5C_4
    .word S_Story_5C_5
    .word S_Story_5C_6
    .word S_Story_5C_7
    .word S_Story_5C_8


_ts S_Story_5C_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_5C_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08090c4a
    push       {r5}
    mov        r0,#0x2
    bl         Effect_ElecMan_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08090db0
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08090c4a:
    pop        {pc}


_ts S_Story_5C_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090c6a
    push       {r5}
    ldr        r0,PTR_ScenarioData_5C_08090db4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08090c6a:
    pop        {pc}


_ts S_Story_5C_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090c84
    Flag_ClearBase 0xBE
    Scene_Next
LAB_08090c84:
    bl         Scene_IsStartPressed
    beq        LAB_08090c8e
    bl         S_Story_5C_SkipIfStart
LAB_08090c8e:
    pop        {pc}


_ts S_Story_5C_4
    Flag_GetBase 0xBE
    bne        LAB_08090cac
    mov        r0,#0x45
    bl         PlayerAnimation_SetState
    mov        r0,#0x4
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x0
    strb       r0,[r5,#Scene_counter]
    Scene_Next
LAB_08090cac:
    bl         Scene_IsStartPressed
    beq        LAB_08090cb6
    bl         S_Story_5C_SkipIfStart
LAB_08090cb6:
    pop        {pc}


_ts S_Story_5C_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08090cda
    push       {r5}
    ldr        r0,PTR_ScenarioData_5C_08090db4
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x46
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_08090cda:
    bl         Scene_IsStartPressed
    beq        LAB_08090ce4
    bl         S_Story_5C_SkipIfStart
LAB_08090ce4:
    pop        {pc}


_nt S_Story_5C_6
    ldrb       r0,[r5,#Scene_counter]
    tst        r0,r0
    beq        LAB_08090cf2
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    b          LAB_08090d00
LAB_08090cf2:
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_counter]
    push       {r5}
    mov        r0,#0x8d
    bl         Sound_PlaySE
    pop        {r5}
LAB_08090d00:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090d1e
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08090d1e:
    bl         Scene_IsStartPressed
    beq        LAB_08090d28
    bl         S_Story_5C_SkipIfStart
LAB_08090d28:
    pop        {pc}


_nt S_Story_5C_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090d4a
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08090d4a:
    pop        {pc}


_ts S_Story_5C_8
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xBF
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08090db8
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_08090d84:
    MapEntrance Map_SciLab_Generator_Room, d_se, f(6, -126, 0)


_ts S_Story_5C_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_5C_0_08090dac:
    .word PTR_S_Story_5C_0_08090bd4

DAT_08090db0:
    .word 0x18E

PTR_ScenarioData_5C_08090db4:
    .word ScenarioData_5C

PTR_MapEntrance_08090db8:
    .word MapEntrance_08090d84
