#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808e5b4:
    cam_set -34, 34, 0
    cam_end

    .align 2, 0



_ts Scene_Story_49
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_49_0_0808e7d8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_49_0_0808e5cc:
    .word S_Story_49_0
    .word S_Story_49_1
    .word S_Story_49_2
    .word S_Story_49_3
    .word S_Story_49_4
    .word S_Story_49_5
    .word S_Story_49_6
    .word S_Story_49_7
    .word S_Story_49_8


_ts S_Story_49_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808e7dc
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    Scene_Next
    push       {r5}
    mov        r7,#0x5
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    pop        {pc}


_ts S_Story_49_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808e64c
    push       {r5}
    mov        r0,#0x64
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x44
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeIn_White
    pop        {r5}
    Scene_Next
LAB_0808e64c:
    pop        {pc}


_nt S_Story_49_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e664
    mov        r0,#0x14
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808e664:
    pop        {pc}


_nt S_Story_49_3
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808e68a
    LoadMain mapEventState, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#MapEventState_b8]
    strb       r0,[r7,#MapEventState_ba]
    mov        r0,#0x2
    strb       r0,[r7,#MapEventState_b9]
    strb       r0,[r7,#MapEventState_bb]
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808e68a:
    pop        {pc}


_ts S_Story_49_4
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808e6a4
    Flag_SetBase 0xB2
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808e6a4:
    pop        {pc}


_nt S_Story_49_5
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808e6ce
    push       {r5}
    ldr        r0,PTR_ScenarioData_49_0808e7e0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    bl         Scene_IsStartPressed
    beq        LAB_0808e6ce
    bl         S_Story_49_SkipIfStart
LAB_0808e6ce:
    pop        {pc}


_ts S_Story_49_6
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808e6f0
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808e73a
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    b          LAB_0808e712
LAB_0808e6f0:
    Flag_GetBase 0xCB
    beq        LAB_0808e712
    push       {r5}
    mov        r0,#0x18
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    Flag_ClearBase 0xCB
    b          LAB_0808e73a
LAB_0808e712:
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e730
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
LAB_0808e730:
    bl         Scene_IsStartPressed
    beq        LAB_0808e73a
    bl         S_Story_49_SkipIfStart
LAB_0808e73a:
    pop        {pc}


_ts S_Story_49_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e76e
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#World_playerLocation]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    Scene_Next
LAB_0808e76e:
    pop        {pc}


_ts S_Story_49_8
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xBA
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x37
    strb       r1,[r0,#World_storyFlag]
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#World_lastBattleResult]
    mov        r1,#0x1
    strb       r1,[r0,#World_commentaryTextIndex]
    ldr        r1,PTR_MapEntrance_0808e7e4
    str        r1,[r0,#World_statAttack]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0

MapEntrance_0808e7ac:
    MapEntrance Map_DenTown_Center, d_ne, f(-100, 68, 0)


_ts S_Story_49_SkipIfStart
    push       {r5}
    FadeOut_Black
    pop        {r5}
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_49_0_0808e7d8:
    .word PTR_S_Story_49_0_0808e5cc

PTR_Cam_Set_0808e7dc:
    .word Cam_Set_0808e5b4

PTR_ScenarioData_49_0808e7e0:
    .word ScenarioData_49

PTR_MapEntrance_0808e7e4:
    .word MapEntrance_0808e7ac
