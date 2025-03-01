#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08092d08:
    cam_set 114, -42, 0
    cam_end
    cam_set 114, -42, 0
    cam_move 0, -128, 0, 80
    cam_end

    .align 2, 0



_ts Scene_Story_65
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_65_0_08092f04
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_65_0_08092d34:
    .word S_Story_65_0
    .word S_Story_65_1
    .word S_Story_65_2
    .word S_Story_65_3
    .word S_Story_65_4
    .word S_Story_65_5
    .word S_Story_65_6
    .word S_Story_65_7


_ts S_Story_65_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    ldr        r7,PTR_NPCList_803E708_08092f08
    bl         Map_LoadNPCList
    mov        r1,#0x0
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x1
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x2
    bl         Effect_LifeVirusSeed_Create
    mov        r1,#0x3
    bl         Effect_LifeVirusSeed_Create
    pop        {r5}
    Scene_Next
    ldr        r0,PTR_Cam_Set_08092f0c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_nt S_Story_65_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08092dd0
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08092dd0:
    pop        {pc}


_nt S_Story_65_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092e0a
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08092e00
    Flag_SetBase 0x93
    push       {r5}
    ldr        r0,PTR_ScenarioData_65_08092f10
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08092e00:
    bl         Scene_IsStartPressed
    beq        LAB_08092e0a
    bl         S_Story_65_SkipIfStart
LAB_08092e0a:
    pop        {pc}


_ts S_Story_65_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092e28
    Flag_SetBase 0x93
    mov        r0,#0x5a
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08092e28:
    bl         Scene_IsStartPressed
    beq        LAB_08092e32
    bl         S_Story_65_SkipIfStart
LAB_08092e32:
    pop        {pc}


_ts S_Story_65_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08092e50
    push       {r5}
    ldr        r0,PTR_ScenarioData_65_08092f10
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08092e50:
    bl         Scene_IsStartPressed
    beq        LAB_08092e5a
    bl         S_Story_65_SkipIfStart
LAB_08092e5a:
    pop        {pc}


_ts S_Story_65_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092e7a
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_08092e7a:
    bl         Scene_IsStartPressed
    beq        LAB_08092e84
    bl         S_Story_65_SkipIfStart
LAB_08092e84:
    pop        {pc}


_nt S_Story_65_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092ea6
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08092ea6:
    pop        {pc}


_ts S_Story_65_7
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x92
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_type]
    mov        r1,#0x1
    strb       r1,[r0,#MapChange_destinationIndex]
    ldr        r1,PTR_MapEntrance_08092f14
    str        r1,[r0,#MapChange_destinationList]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_08092edc:
    MapEntrance Map_ACDC_Lan_Room, d_s, f(0, 0, 0)


_ts S_Story_65_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_65_0_08092f04:
    .word PTR_S_Story_65_0_08092d34

PTR_NPCList_803E708_08092f08:
    .word NPCList_803E708

PTR_Cam_Set_08092f0c:
    .word Cam_Set_08092d08

PTR_ScenarioData_65_08092f10:
    .word ScenarioData_65

PTR_MapEntrance_08092f14:
    .word MapEntrance_08092edc
