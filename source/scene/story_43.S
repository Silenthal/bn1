#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


MapEntranceOptions_0808db64:
    MapEntranceOpt Map_Traffic_Light_Comp_5, d_sw, f(-10, 122, 0), dialog=0x8, fadeType=0
    cam_set 30, -10, 0
    cam_end


_ts Scene_Story_43
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_43_0_0808de20
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_43_0_0808db90:
    .word S_Story_43_0
    .word S_Story_43_1
    .word S_Story_43_2
    .word S_Story_43_3
    .word S_Story_43_4
    .word S_Story_43_5
    .word S_Story_43_6
    .word S_Story_43_7
    .word S_Story_43_8


_ts S_Story_43_0
    ldr        r0,PTR_MapEntranceOptions_0808de24
    str        r0,[r5,#Scene_sceneArg]
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}


_ts S_Story_43_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808dc04
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,DAT_0808de28
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    pop        {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_0808dc04:
    pop        {pc}


_nt S_Story_43_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808dc30
    push       {r5}
    mov        r7,#0x3
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    mov        r0,#0x8c
    strh       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    mov        r0,#0x17
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_0808dc30:
    bl         Scene_IsStartPressed
    beq        LAB_0808dc3a
    bl         S_Story_43_SkipIfStart
LAB_0808dc3a:
    pop        {pc}


_ts S_Story_43_3
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x6e
    bne        LAB_0808dc52
    push       {r5}
    ldr        r0,PTR_ScenarioData_43_0808de2c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
LAB_0808dc52:
    cmp        r0,#0x0
    beq        LAB_0808dc66
    mov        r0,#0x0
    mov        r1,#0x18
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    b          LAB_0808dc76
LAB_0808dc66:
    push       {r5}
    mov        r0,#0x2
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_0808dc76:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    bne        LAB_0808dc86
    bl         Scene_IsStartPressed
    beq        LAB_0808dc86
    bl         S_Story_43_SkipIfStart
LAB_0808dc86:
    pop        {pc}


_ts S_Story_43_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808dccc
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808dcbc
    push       {r5}
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_43_0808de2c
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808dcbc:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    bne        LAB_0808dccc
    bl         Scene_IsStartPressed
    beq        LAB_0808dccc
    bl         S_Story_43_SkipIfStart
LAB_0808dccc:
    pop        {pc}


_nt S_Story_43_5
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808dcf2
    push       {r5}
    mov        r0,#0x18
    bl         PlayerAnimation_SetState
    Fade_Request FT_DarkenExceptSpritesBG0, 0x8
    pop        {r5}
    Scene_Next
LAB_0808dcf2:
    pop        {pc}


_ts S_Story_43_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808dd34
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#World_playerLocation]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x1
    and        r1,r0
    beq        LAB_0808dd1c
    push       {r0}
    bl         FUN_0808ddb8
    pop        {r0}
LAB_0808dd1c:
    mov        r1,#0x80
    and        r1,r0
    beq        LAB_0808dd34
    push       {r5}
    Fade_Request FT_FadeOutToWhiteExceptBG0, 0x10
    pop        {r5}
    Scene_Next
LAB_0808dd34:
    pop        {pc}


_nt S_Story_43_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808dd6c
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xB3
    Flag_ClearBase 0x2F
    Flag_ClearBase 0x30
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    mov        r1,#0x0
    bl         World_SetTransitionLocation
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808dd6c:
    pop        {pc}


_nt S_Story_43_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ddb6
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x6b
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
LAB_0808ddb6:
    pop        {pc}


_ts FUN_0808ddb8
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


_ts FUN_0808ddf0
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x14]
    bl         Effect_Free
    pop        {r5}
    pop        {pc}


_nt S_Story_43_SkipIfStart
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_43_0_0808de20:
    .word PTR_S_Story_43_0_0808db90

PTR_MapEntranceOptions_0808de24:
    .word MapEntranceOptions_0808db64

DAT_0808de28:
    .word 0x13C

PTR_ScenarioData_43_0808de2c:
    .word ScenarioData_43
