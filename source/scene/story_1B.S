#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set 128, -24, 0
    cam_end

    .align 2, 0



_ts Scene_Story_1B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1B_0_080879c4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1B_0_080878cc:
    .word S_Story_1B_0
    .word S_Story_1B_1
    .word S_Story_1B_2
    .word S_Story_1B_3


_ts S_Story_1B_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    bl         Sound_StopAllMusic
    pop        {pc}


_ts S_Story_1B_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08087920
    bl         DisableBoundaryCheck
    mov        r0,#0x82
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_1B_080879c8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08087920:
    pop        {pc}


_nt S_Story_1B_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08087940
    push       {r5}
    FadeOut_White
    pop        {r5}
    Scene_Next
LAB_08087940:
    bl         Scene_IsStartPressed
    beq        LAB_0808794a
    bl         S_Story_1B_SkipIfStart
LAB_0808794a:
    pop        {pc}


_ts S_Story_1B_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808799a
    bl         EnableBoundaryCheck
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC7
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080879cc
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    LoadMain world, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x7]
    pop        {r5}
    mov        r0,#T_School
    bl         Sound_PlayBGM
    bl         Scene_UnloadAndResetStepCounter
LAB_0808799a:
    pop        {pc}

MapEntrance_0808799c:
    MapEntrance Map_School_Staff_Lounge, d_nw, f(-156, -38, 0)


_ts S_Story_1B_SkipIfStart
    push       {r5}
    FadeOut_White
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_1B_0_080879c4:
    .word PTR_S_Story_1B_0_080878cc

PTR_ScenarioData_1B_080879c8:
    .word ScenarioData_1B

PTR_MapEntrance_080879cc:
    .word MapEntrance_0808799c
