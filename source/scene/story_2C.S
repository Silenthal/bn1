#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08089fb0:
    cam_set -568, 140, 0
    cam_end

    .align 2, 0



_ts Scene_Story_2C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2C_0_0808a2bc
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2C_0_08089fc8:
    .word S_Story_2C_0
    .word S_Story_2C_1
    .word S_Story_2C_2
    .word S_Story_2C_3
    .word S_Story_2C_4
    .word S_Story_2C_5
    .word S_Story_2C_6
    .word S_Story_2C_7
    .word S_Story_2C_8
    .word S_Story_2C_9
    .word S_Story_2C_10
    .word S_Story_2C_11
    .word S_Story_2C_12


_ts S_Story_2C_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_2C_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808a042
    push       {r5}
    ldr        r0,DAT_0808a2c0
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x54
    lsl        r1,r1,#0x10
    mov        r2,#0x60
    neg        r2,r2
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808a2c4
    bl         SceneCamera_Init
    Scene_Next
LAB_0808a042:
    pop        {pc}


_ts S_Story_2C_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808a05e
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a05e:
    pop        {pc}


_ts S_Story_2C_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a088
    push       {r5}
    ldr        r0,PTR_ScenarioData_2C_0808a2c8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808a088
    bl         S_Story_2C_SkipIfStart
LAB_0808a088:
    pop        {pc}


_nt S_Story_2C_4
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a0ae
    LoadMain world, r0, r7
    mov        r0,#0x30
    bl         PlayerAnimation_SetState
    mov        r0,#0xa1
    strh       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    Scene_Next
LAB_0808a0ae:
    bl         Scene_IsStartPressed
    beq        LAB_0808a0b8
    bl         S_Story_2C_SkipIfStart
LAB_0808a0b8:
    pop        {pc}


_nt S_Story_2C_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    beq        LAB_0808a0f4
    cmp        r0,#0x90
    bne        LAB_0808a0d2
    push       {r0,r5}
    mov        r0,#0x1
    mov        r1,#0xb8
    bl         Camera_EnableScreenShake
    pop        {r0,r5}
LAB_0808a0d2:
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_0808a108
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0xff
    strb       r0,[r7,#PlayerLocation_lastDirMoveIndex]
    LoadMain world, r0, r7
    mov        r0,#0x37
    bl         PlayerAnimation_SetState
    mov        r0,#0x6e
    bl         Sound_PlaySE
    b          LAB_0808a108
LAB_0808a0f4:
    LoadMain world, r0, r7
    mov        r0,#0x30
    bl         PlayerAnimation_SetState
    Scene_Next
    mov        r0,#0x20
    strb       r0,[r5,#Scene_sceneTimer]
LAB_0808a108:
    bl         Scene_IsStartPressed
    beq        LAB_0808a112
    bl         S_Story_2C_SkipIfStart
LAB_0808a112:
    ldrb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x90
    bge        LAB_0808a12c
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_0808a12c
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0xa
    strb       r0,[r5,#Scene_counter]
LAB_0808a12c:
    pop        {pc}


_nt S_Story_2C_6
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808a148
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a148:
    bl         Scene_IsStartPressed
    beq        LAB_0808a152
    bl         S_Story_2C_SkipIfStart
LAB_0808a152:
    pop        {pc}


_ts S_Story_2C_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a19c
    push       {r5}
    ldr        r0,PTR_BgTask_8044048_0808a2cc
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044060_0808a2d0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80442E8_0808a2d4
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8044318_0808a2d8
    bl         BgTask_AddNew
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    bl         Scene_IsStartPressed
    beq        LAB_0808a19c
    bl         S_Story_2C_SkipIfStart
LAB_0808a19c:
    pop        {pc}


_nt S_Story_2C_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a1c2
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    beq        LAB_0808a1b8
    Scene_Next
LAB_0808a1b8:
    bl         Scene_IsStartPressed
    beq        LAB_0808a1c2
    bl         S_Story_2C_SkipIfStart
LAB_0808a1c2:
    pop        {pc}


_ts S_Story_2C_9
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808a1e2
    push       {r5}
    ldr        r0,PTR_ScenarioData_2C_0808a2c8
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
LAB_0808a1e2:
    bl         Scene_IsStartPressed
    beq        LAB_0808a1ec
    bl         S_Story_2C_SkipIfStart
LAB_0808a1ec:
    pop        {pc}


_nt S_Story_2C_10
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    bne        LAB_0808a210
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808a210
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a210:
    bl         Scene_IsStartPressed
    beq        LAB_0808a21a
    bl         S_Story_2C_SkipIfStart
LAB_0808a21a:
    pop        {pc}


_ts S_Story_2C_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a23c
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808a23c:
    pop        {pc}


_nt S_Story_2C_12
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    Flag_SetBase 0xB8
    bl         PlayerAnimation_Unlock
    push       {r5}
    bl         Camera_DisableScreenShake
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x26
    strb       r1,[r0,#World_storyFlag]
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#World_fadeType]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808a2dc
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808a290:
    MapEntrance Map_Govt_Waterworks_Office, d_sw, f(36, 94, 0)


_ts S_Story_2C_SkipIfStart
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    mov        r0,#0x2c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_2C_0_0808a2bc:
    .word PTR_S_Story_2C_0_08089fc8

DAT_0808a2c0:
    .word 0x1A6

PTR_Cam_Set_0808a2c4:
    .word Cam_Set_08089fb0

PTR_ScenarioData_2C_0808a2c8:
    .word ScenarioData_2C

PTR_BgTask_8044048_0808a2cc:
    .word BgTask_8044048

PTR_BgTask_8044060_0808a2d0:
    .word BgTask_8044060

PTR_BgTask_80442E8_0808a2d4:
    .word BgTask_80442E8

PTR_BgTask_8044318_0808a2d8:
    .word BgTask_8044318

PTR_MapEntrance_0808a2dc:
    .word MapEntrance_0808a290
