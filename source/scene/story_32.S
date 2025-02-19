#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set 114, 258, -96
    cam_move -128, 128, 0, 212
    cam_wait 60
    cam_end


_ts Scene_Story_32
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_32_0_0808b150
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_32_0_0808aebc:
    .word S_Story_32_0
    .word S_Story_32_1
    .word S_Story_32_2
    .word S_Story_32_3
    .word S_Story_32_4
    .word S_Story_32_5
    .word S_Story_32_6
    .word S_Story_32_7
    .word S_Story_32_8
    .word S_Story_32_9
    .word S_Story_32_10
    .word S_Story_32_11


_ts S_Story_32_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_32_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808af1c
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_32_0808b154
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808af1c:
    pop        {pc}


_nt S_Story_32_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808af3c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808af3c:
    bl         Scene_IsStartPressed
    beq        LAB_0808af46
    bl         S_Story_32_SkipIfStart
LAB_0808af46:
    pop        {pc}


_ts S_Story_32_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808af6c
    Flag_SetBase 0xCE
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808af6c:
    pop        {pc}


_nt S_Story_32_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808af8a
    Flag_SetBase 0xCB
    mov        r0,#0x90
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808af8a:
    pop        {pc}


_ts S_Story_32_5
    ldrh       r0,[r5,#Scene_sceneTimer]
    push       {r0}
    cmp        r0,#0x5b
    beq        LAB_0808afa0
    cmp        r0,#0x3f
    beq        LAB_0808afa0
    cmp        r0,#0x23
    beq        LAB_0808afa0
    cmp        r0,#0x7
    bne        LAB_0808afa6
LAB_0808afa0:
    mov        r0,#0xea
    bl         Sound_PlaySE
LAB_0808afa6:
    pop        {r0}
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808afc6
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    pop        {pc}
LAB_0808afc6:
    bl         Scene_IsStartPressed
    beq        LAB_0808afd0
    bl         S_Story_32_SkipIfStart
LAB_0808afd0:
    pop        {pc}


_nt S_Story_32_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b02c
    ldrh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x3c
    bne        LAB_0808afee
    push       {r0}
    mov        r0,#0xeb
    bl         Sound_PlaySE
    pop        {r0}
LAB_0808afee:
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808b02c
    Flag_SetBase 0xCC
    push       {r5}
    ldr        r0,PTR_BgTask_8044048_0808b158
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_0808b15c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80442E8_0808b160
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044318_0808b164
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808b02c:
    pop        {pc}


_nt S_Story_32_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b058
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808b058
    push       {r5}
    ldr        r0,PTR_ScenarioData_32_0808b154
    mov        r1,#0xb
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808b058:
    pop        {pc}


_nt S_Story_32_8
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b08a
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808b08a
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    ldr        r0,PTR_ScenarioData_32_0808b154
    mov        r1,#0xc
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808b08a:
    bl         Scene_IsStartPressed
    beq        LAB_0808b094
    bl         S_Story_32_SkipIfStart
LAB_0808b094:
    pop        {pc}


_nt S_Story_32_9
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808b0aa
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneTimer]
LAB_0808b0aa:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b0c8
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0808b0c8:
    pop        {pc}


_nt S_Story_32_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b0ea
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808b0ea:
    pop        {pc}


_ts S_Story_32_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b124
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0xCD
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808b168
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808b124:
    pop        {pc}

    .align 2, 0


MapEntrance_0808b128:
    MapEntrance Map_Waterworks_Comp_1, d_ne, f(-118, 48, 0)


_ts S_Story_32_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_32_0_0808b150:
    .word PTR_S_Story_32_0_0808aebc

PTR_ScenarioData_32_0808b154:
    .word ScenarioData_32

PTR_BgTask_8044048_0808b158:
    .word BgTask_8044048

PTR_BgTask_8044060_0808b15c:
    .word BgTask_8044060

PTR_BgTask_80442E8_0808b160:
    .word BgTask_80442E8

PTR_BgTask_8044318_0808b164:
    .word BgTask_8044318

PTR_MapEntrance_0808b168:
    .word MapEntrance_0808b128
