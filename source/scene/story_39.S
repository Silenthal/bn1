#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808cb14:
    cam_set -120, 194, 0
    cam_end


_ts Scene_Story_39
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_39_0_0808cd04
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_39_0_0808cb2c:
    .word S_Story_39_0
    .word S_Story_39_1
    .word S_Story_39_2
    .word S_Story_39_3
    .word S_Story_39_4
    .word S_Story_39_5
    .word S_Story_39_6


_ts S_Story_39_0
    push       {r5}
    bl         PlayerAnimation_Lock
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_39_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cbca
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808cbca
    ldr        r0,PTR_Cam_Set_0808cd08
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    ldrh       r0,[r7,#(PlayerLocation_pos_curr_x + 2)]
    strh       r0,[r5,#Scene_sceneArg]
    ldrh       r0,[r7,#(PlayerLocation_pos_curr_y + 2)]
    strh       r0,[r5,#0x14]
    push       {r5}
    mov        r0,#0x28
    lsl        r0,r0,#0x10
    mov        r1,#0x1b
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8039164_0808cd0c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808cbca:
    pop        {pc}


_ts S_Story_39_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cc00
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808cbf6
    push       {r5}
    ldr        r0,PTR_ScenarioData_39_0808cd10
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808cbf6:
    bl         Scene_IsStartPressed
    beq        LAB_0808cc00
    bl         S_Story_39_SkipIfStart
LAB_0808cc00:
    pop        {pc}


_nt S_Story_39_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808cc28
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    bne        LAB_0808cc32
    push       {r5}
    ldr        r0,PTR_ScenarioData_39_0808cd10
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808cc28:
    bl         Scene_IsStartPressed
    beq        LAB_0808cc32
    bl         S_Story_39_SkipIfStart
LAB_0808cc32:
    pop        {pc}


_ts S_Story_39_4
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808cc28
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808cc5c
    bl         S_Story_39_SkipIfStart
LAB_0808cc5c:
    pop        {pc}


_nt S_Story_39_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ccc4
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
    ldr        r7,PTR_NPCList_803909C_0808cd14
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldrh       r0,[r5,#Scene_sceneArg]
    lsl        r0,r0,#0x10
    ldrh       r1,[r5,#0x14]
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
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
LAB_0808ccc4:
    pop        {pc}


_nt S_Story_39_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808cce8
    bl         PlayerAnimation_Unlock
    bl         EnableBoundaryCheck
    push       {r5}
    Flag_SetBase 0x9A
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808cce8:
    pop        {pc}


_nt S_Story_39_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_39_0_0808cd04:
    .word PTR_S_Story_39_0_0808cb2c

PTR_Cam_Set_0808cd08:
    .word Cam_Set_0808cb14

PTR_NPCList_8039164_0808cd0c:
    .word NPCList_8039164

PTR_ScenarioData_39_0808cd10:
    .word ScenarioData_39

PTR_NPCList_803909C_0808cd14:
    .word NPCList_803909C
