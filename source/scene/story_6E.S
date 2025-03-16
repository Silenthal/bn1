#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080940e0:
    cam_set -170, -20, -64
    cam_end

Cam_Set_080940ea:
    cam_set -170, -20, -64
    cam_move 128, 0, 0, 550
    cam_end

Cam_Move_080940fe:
    cam_move 128, -128, 0, 380
    cam_end

    .align 2, 0



_ts Scene_Story_6E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6E_0_080942d4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6E_0_08094118:
    .word S_Story_6E_0
    .word S_Story_6E_1
    .word S_Story_6E_2
    .word S_Story_6E_3
    .word S_Story_6E_4
    .word S_Story_6E_5
    .word S_Story_6E_6
    .word S_Story_6E_7


_ts S_Story_6E_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_6E_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08094192
    push       {r5}
    mov        r0,#0xd0
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xb6
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    neg        r2,r2
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_080942d8
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_08094192:
    pop        {pc}


_ts S_Story_6E_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080941ba
    ldr        r0,PTR_Cam_Set_080942dc
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_080941ba
    bl         S_Story_6E_SkipIfStart
LAB_080941ba:
    pop        {pc}


_ts S_Story_6E_3
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_080941d4
    ldr        r0,PTR_Cam_Move_080942e0
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
LAB_080941d4:
    bl         Scene_IsStartPressed
    beq        LAB_080941de
    bl         S_Story_6E_SkipIfStart
LAB_080941de:
    pop        {pc}


_ts S_Story_6E_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_080941fa
    push       {r5}
    ldr        r0,PTR_ScenarioData_6E_080942e4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080941fa:
    bl         Scene_IsStartPressed
    beq        LAB_08094204
    bl         S_Story_6E_SkipIfStart
LAB_08094204:
    pop        {pc}


_nt S_Story_6E_5
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08094224
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_08094224:
    bl         Scene_IsStartPressed
    beq        LAB_0809422e
    bl         S_Story_6E_SkipIfStart
LAB_0809422e:
    pop        {pc}


_ts S_Story_6E_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809428e
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0xbe
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x32
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    neg        r2,r2
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#World_playerLocation]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_0809428e:
    pop        {pc}


_ts S_Story_6E_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080942ba
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xAF
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080942ba:
    pop        {pc}


_ts S_Story_6E_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_6E_0_080942d4:
    .word PTR_S_Story_6E_0_08094118

PTR_Cam_Set_080942d8:
    .word Cam_Set_080940e0

PTR_Cam_Set_080942dc:
    .word Cam_Set_080940ea

PTR_Cam_Move_080942e0:
    .word Cam_Move_080940fe

PTR_ScenarioData_6E_080942e4:
    .word ScenarioData_6E
