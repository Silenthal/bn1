#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MapEntranceOptions_08096aa0:
    MapEntranceOpt Map_Rocket_Comp, d_ne, f(-510, 0, 0), dialog=0x8, fadeType=0

Cam_Set_08096ab4:
    cam_set -232, 164, 0
    cam_move 128, -128, 0, 350
    cam_end

Cam_Move_08096ac8:
    cam_move 128, 128, 0, 150
    cam_end

Cam_Move_08096ad4:
    cam_move -256, 0, 0, 100
    cam_end

Cam_Set_08096ae0:
    cam_set -70, 90, 0
    cam_end

    .align 2, 0



_ts Scene_Story_7A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7A_0_08096af8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7A_0_08096af8:
    .word PTR_S_Story_7A_0_08096afc

PTR_S_Story_7A_0_08096afc:
    .word S_Story_7A_0
    .word S_Story_7A_1
    .word S_Story_7A_2
    .word S_Story_7A_3
    .word S_Story_7A_4
    .word S_Story_7A_5
    .word S_Story_7A_6
    .word S_Story_7A_7
    .word S_Story_7A_8
    .word S_Story_7A_9
    .word S_Story_7A_10
    .word S_Story_7A_11
    .word S_Story_7A_12
    .word S_Story_7A_13
    .word S_Story_7A_14


_ts S_Story_7A_0
    ldr        r0,PTR_MapEntranceOptions_08096b50
    str        r0,[r5,#Scene_sceneArg]
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

PTR_MapEntranceOptions_08096b50:
    .word MapEntranceOptions_08096aa0


_ts S_Story_7A_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08096bb8
    push       {r5}
    mov        r0,#0xe8
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xa4
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08096ef8
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Flag_ClearBase 0x93
    Flag_ClearBase 0xE3
    push       {r5}
    ldr        r7,PTR_NPCList_803E8D8_08096efc
    bl         Map_LoadNPCList
    Flag_ClearBase 0xA2
    mov        r1,#0x6
    bl         Effect_LifeVirusSeed_Create
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08096bb8:
    pop        {pc}


_nt S_Story_7A_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096be8
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08096bde
    ldr        r0,PTR_Cam_Move_08096f00
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
LAB_08096bde:
    bl         Scene_IsStartPressed
    beq        LAB_08096be8
    bl         S_Story_7A_SkipIfStart
LAB_08096be8:
    pop        {pc}


_nt S_Story_7A_3
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08096c04
    Flag_SetBase 0xA2
    mov        r0,#0xcd
    lsl        r0,r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08096c04:
    bl         Scene_IsStartPressed
    beq        LAB_08096c0e
    bl         S_Story_7A_SkipIfStart
LAB_08096c0e:
    pop        {pc}


_ts S_Story_7A_4
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08096c2a
    Flag_SetBase 0x93
    mov        r0,#0x46
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08096c2a:
    bl         Scene_IsStartPressed
    beq        LAB_08096c34
    bl         S_Story_7A_SkipIfStart
LAB_08096c34:
    pop        {pc}


_nt S_Story_7A_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08096c52
    push       {r5}
    ldr        r0,PTR_ScenarioData_7A_08096f04
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08096c52:
    bl         Scene_IsStartPressed
    beq        LAB_08096c5c
    bl         S_Story_7A_SkipIfStart
LAB_08096c5c:
    pop        {pc}


_nt S_Story_7A_6
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096c9c
    push       {r5}
    mov        r0,#0xb4
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x5a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x11
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Move_08096f08
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x50
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08096c9c:
    bl         Scene_IsStartPressed
    beq        LAB_08096ca6
    bl         S_Story_7A_SkipIfStart
LAB_08096ca6:
    pop        {pc}


_ts S_Story_7A_7
    ldrb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08096cb6
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    b          LAB_08096cc6
LAB_08096cb6:
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
LAB_08096cc6:
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08096ce6
    push       {r5}
    ldr        r0,PTR_ScenarioData_7A_08096f04
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Flag_ClearBase 0x93
    Scene_Next
LAB_08096ce6:
    bl         Scene_IsStartPressed
    beq        LAB_08096cf0
    bl         S_Story_7A_SkipIfStart
LAB_08096cf0:
    pop        {pc}


_nt S_Story_7A_8
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096d0e
    mov        r0,#0x11
    bl         PlayerAnimation_SetState
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08096d0e:
    bl         Scene_IsStartPressed
    beq        LAB_08096d18
    bl         S_Story_7A_SkipIfStart
LAB_08096d18:
    pop        {pc}


_nt S_Story_7A_9
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    beq        LAB_08096d32
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    b          LAB_08096d4a
LAB_08096d32:
    push       {r5}
    ldr        r0,PTR_ScenarioData_7A_08096f04
    mov        r1,#0x8
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_08096d4a:
    bl         Scene_IsStartPressed
    beq        LAB_08096d54
    bl         S_Story_7A_SkipIfStart
LAB_08096d54:
    pop        {pc}


_nt S_Story_7A_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096d96
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096d86
    push       {r5}
    ldr        r0,PTR_ScenarioData_7A_08096f04
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    Scene_Next
LAB_08096d86:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    bne        LAB_08096d96
    bl         Scene_IsStartPressed
    beq        LAB_08096d96
    bl         S_Story_7A_SkipIfStart
LAB_08096d96:
    pop        {pc}


_ts S_Story_7A_11
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08096dbc
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    Fade_Request FT_DarkenExceptSpritesBG0, 0x8
    pop        {r5}
    Scene_Next
LAB_08096dbc:
    pop        {pc}


_nt S_Story_7A_12
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096dfe
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#World_playerLocation]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x1
    and        r1,r0
    beq        LAB_08096de6
    push       {r0}
    bl         FUN_08096e90
    pop        {r0}
LAB_08096de6:
    mov        r1,#0x80
    and        r1,r0
    beq        LAB_08096dfe
    push       {r5}
    Fade_Request FT_FadeOutToWhiteExceptBG0, 0x10
    pop        {r5}
    Scene_Next
LAB_08096dfe:
    pop        {pc}


_ts S_Story_7A_13
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096e2a
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xE7
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08096e2a:
    pop        {pc}


_ts S_Story_7A_14
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096e8e
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x47
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x5a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08096f0c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803E8E0_08096f10
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#Scene_state_s0]
LAB_08096e8e:
    pop        {pc}


_ts FUN_08096e90
    push       {lr}
    mov        r0,#0x84
    bl         Sound_PlaySE
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    ldr        r1,[r0,#PlayerLocation_pos_curr_x]
    ldr        r2,[r0,#PlayerLocation_pos_curr_y]
    ldr        r3,[r0,#PlayerLocation_pos_curr_z]
    mov        r4,#0x3
    neg        r4,r4
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    add        r2,r2,r4
    mov        r4,#0x38
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    push       {r5}
    mov        r0,#0x1
    mov        r4,#0xf
    bl         Effect_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0



_ts FUN_08096ec8
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x14]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}


_nt S_Story_7A_SkipIfStart
    push       {r5}
    FadeOutFast_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x38
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

    .align 2, 0


PTR_Cam_Set_08096ef8:
    .word Cam_Set_08096ab4

PTR_NPCList_803E8D8_08096efc:
    .word NPCList_803E8D8

PTR_Cam_Move_08096f00:
    .word Cam_Move_08096ac8

PTR_ScenarioData_7A_08096f04:
    .word ScenarioData_7A

PTR_Cam_Move_08096f08:
    .word Cam_Move_08096ad4

PTR_Cam_Set_08096f0c:
    .word Cam_Set_08096ae0

PTR_NPCList_803E8E0_08096f10:
    .word NPCList_803E8E0
