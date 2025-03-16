#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808a4bc:
    cam_set -192, 138, 0
    cam_move 128, -128, 0, 212
    cam_wait 60
    cam_end


_ts Scene_Story_2E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2E_0_0808a778
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2E_0_0808a4e0:
    .word S_Story_2E_0
    .word S_Story_2E_1
    .word S_Story_2E_2
    .word S_Story_2E_3
    .word S_Story_2E_4
    .word S_Story_2E_5
    .word S_Story_2E_6
    .word S_Story_2E_7
    .word S_Story_2E_8
    .word S_Story_2E_9
    .word S_Story_2E_10


_ts S_Story_2E_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}


_ts S_Story_2E_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808a55a
    push       {r5}
    mov        r0,#0x5a
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x24
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    FadeInFast_Black
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808a77c
    bl         SceneCamera_Init
    Scene_Next
LAB_0808a55a:
    pop        {pc}


_ts S_Story_2E_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808a582
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a58c
    push       {r5}
    ldr        r0,PTR_ScenarioData_2E_0808a780
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808a582:
    bl         Scene_IsStartPressed
    beq        LAB_0808a58c
    bl         S_Story_2E_SkipIfStart
LAB_0808a58c:
    pop        {pc}


_nt S_Story_2E_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a5ae
    push       {r5}
    ldr        r7,PTR_DAT_0808a784
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0xdc
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808a5ae:
    bl         Scene_IsStartPressed
    beq        LAB_0808a5b8
    bl         S_Story_2E_SkipIfStart
LAB_0808a5b8:
    pop        {pc}


_nt S_Story_2E_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bne        LAB_0808a5d2
    push       {r5}
    ldr        r0,PTR_ScenarioData_2E_0808a780
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808a5d2:
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    bl         Scene_IsStartPressed
    beq        LAB_0808a5e0
    bl         S_Story_2E_SkipIfStart
LAB_0808a5e0:
    pop        {pc}


_nt S_Story_2E_5
    Flag_GetBase 0xAC
    beq        LAB_0808a5fc
    push       {r5}
    ldr        r0,PTR_ScenarioData_2E_0808a780
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808a5fc:
    bl         Scene_IsStartPressed
    beq        LAB_0808a606
    bl         S_Story_2E_SkipIfStart
LAB_0808a606:
    pop        {pc}


_ts S_Story_2E_6
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a5ae
    Flag_SetBase 0xAD
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808a62e
    bl         S_Story_2E_SkipIfStart
LAB_0808a62e:
    pop        {pc}


_ts S_Story_2E_7
    Flag_GetBase 0xAE
    beq        LAB_0808a654
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bne        LAB_0808a654
    push       {r5}
    ldr        r0,PTR_ScenarioData_2E_0808a780
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808a654:
    bl         Scene_IsStartPressed
    beq        LAB_0808a65e
    bl         S_Story_2E_SkipIfStart
LAB_0808a65e:
    pop        {pc}


_ts S_Story_2E_8
    Flag_GetBase 0xF6
    beq        LAB_0808a674
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    Flag_ClearBase 0xF6
LAB_0808a674:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808a694
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808a6b4
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    push       {r5}
    mov        r0,#0x4
    bl         PetStatusControl_SetState
    pop        {r5}
    b          LAB_0808a6b4
LAB_0808a694:
    Flag_GetBase 0xF9
    beq        LAB_0808a6b4
    Flag_ClearBase 0xF9
    push       {r5}
    mov        r0,#0xc
    bl         PetStatusControl_SetState
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
LAB_0808a6b4:
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a6d8
    mov        r0,#0x0
    bl         NPC_FindByIndex
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a6d8:
    pop        {pc}


_nt S_Story_2E_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a72c
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_0808a788
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#World_playerLocation]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a72c:
    pop        {pc}


_nt S_Story_2E_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a75c
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0xAB
    pop        {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_PlayBGM
    bl         PlayerAnimation_Unlock
    Flag_ClearBase 0xDF
    bl         Scene_UnloadAndResetStepCounter
LAB_0808a75c:
    pop        {pc}


_nt S_Story_2E_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_2E_0_0808a778:
    .word PTR_S_Story_2E_0_0808a4e0

PTR_Cam_Set_0808a77c:
    .word Cam_Set_0808a4bc

PTR_ScenarioData_2E_0808a780:
    .word ScenarioData_2E

PTR_DAT_0808a784:
    .word NPCList_80304DC

PTR_DAT_0808a788:
    .word NPCList_8030534
