#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_7F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7F_0_080979d8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7F_0_080979d8:
    .word PTR_S_Story_7F_0_080979dc

PTR_S_Story_7F_0_080979dc:
    .word S_Story_7F_0
    .word S_Story_7F_1
    .word S_Story_7F_2
    .word S_Story_7F_3
    .word S_Story_7F_4
    .word S_Story_7F_5
    .word S_Story_7F_6
    .word S_Story_7F_7
    .word S_Story_7F_8


_ts S_Story_7F_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    Scene_Next
    pop        {pc}


_ts S_Story_7F_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08097a6c
    push       {r5}
    mov        r0,#0x6e
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x84
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    pop        {r5}
    Flag_ClearBase 0xAE
    Flag_ClearBase 0xA4
    Flag_ClearBase 0xF9
    Flag_ClearBase 0x93
    push       {r5}
    ldr        r7,PTR_NPCList_8030180_08097c34
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_7F_08097c38
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08097a6c:
    pop        {pc}


_nt S_Story_7F_2
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097a8c
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_08097a8c:
    bl         Scene_IsStartPressed
    beq        LAB_08097a96
    bl         S_Story_7F_SkipIfStart
LAB_08097a96:
    pop        {pc}


_ts S_Story_7F_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097ac6
    mov        r0,#T_Home_Town
    bl         Sound_PlayBGM
    push       {r5}
    ldr        r0,PTR_ScenarioData_7F_08097c38
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08097ac6
    bl         S_Story_7F_SkipIfStart
LAB_08097ac6:
    pop        {pc}


_ts S_Story_7F_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097b12
    Flag_GetBase 0xED
    beq        LAB_08097aea
    Flag_ClearBase 0xED
    mov        r0,#0x1f
    mov        r1,#0xa
    bl         Sound_FadeOut
LAB_08097aea:
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097b08
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
    pop        {pc}
LAB_08097b08:
    bl         Scene_IsStartPressed
    beq        LAB_08097b12
    bl         S_Story_7F_SkipIfStart
LAB_08097b12:
    pop        {pc}


_ts S_Story_7F_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097b54
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#World_playerLocation]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x1
    and        r1,r0
    beq        LAB_08097b3c
    push       {r0}
    bl         FUN_08097bec
    pop        {r0}
LAB_08097b3c:
    mov        r1,#0x80
    and        r1,r0
    beq        LAB_08097b54
    push       {r5}
    Fade_Request FT_FadeOutToWhite, 0x2
    pop        {r5}
    Scene_Next
LAB_08097b54:
    pop        {pc}


_nt S_Story_7F_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097b76
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08097b76:
    pop        {pc}


_ts S_Story_7F_7
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xEC
    pop        {r5}
    push       {r5}
    bl         World_StartCredits
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_7F_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097bc6
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
LAB_08097bc6:
    pop        {pc}


_ts S_Story_7F_SkipIfStart
    push       {r5}
    FadeOutFast_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    Flag_SetBase 0x96
    Flag_SetBase 0xF9
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts FUN_08097bec
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


_ts FUN_08097c24
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x14]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}

    .align 2, 0


PTR_NPCList_8030180_08097c34:
    .word NPCList_8030180

PTR_ScenarioData_7F_08097c38:
    .word ScenarioData_7F
