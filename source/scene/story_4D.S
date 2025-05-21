#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808ee88:
    cam_set 80, -40, 0
    cam_end


_ts Scene_Story_4D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4D_0_0808f034
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4D_0_0808eea0:
    .word S_Story_4D_0
    .word S_Story_4D_1
    .word S_Story_4D_2
    .word S_Story_4D_3
    .word S_Story_4D_4
    .word S_Story_4D_5


_ts S_Story_4D_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    pop        {r5}
    Scene_Next
    ldr        r0,PTR_Cam_Set_0808f038
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_ts S_Story_4D_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808ef0e
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808ef0e:
    pop        {pc}


_ts S_Story_4D_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ef38
    push       {r5}
    ldr        r0,PTR_ScenarioData_4D_0808f03c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808ef38
    bl         S_Story_4D_SkipIfStart
LAB_0808ef38:
    pop        {pc}


_nt S_Story_4D_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ef58
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808ef58:
    bl         Scene_IsStartPressed
    beq        LAB_0808ef62
    bl         S_Story_4D_SkipIfStart
LAB_0808ef62:
    pop        {pc}


_ts S_Story_4D_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ef84
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0808ef84:
    pop        {pc}


_nt S_Story_4D_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f008
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0xC2
    pop        {r5}
    push       {r5}
    Flag_SetBase 0x03
    bl         FUN_080102e8
    mov        r0,#0x3c
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3d
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3e
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    Flag_ClearBase 0x2A
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x40
    strb       r1,[r0,#World_storyFlag]
    Flag_ClearBase 0x38
    Flag_ClearBase 0x2D
    Flag_ClearBase 0x2C
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#World_lastBattleResult]
    mov        r1,#0x1
    strb       r1,[r0,#World_commentaryTextIndex]
    ldr        r1,PTR_MapEntrance_0808f040
    str        r1,[r0,#World_statAttack]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Sound_StopAllMusic
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f008:
    pop        {pc}

    .align 2, 0

MapEntrance_0808f00c:
    MapEntrance Map_ACDC_Town, d_s, f(-50, 0, 0)


_ts S_Story_4D_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_4D_0_0808f034:
    .word PTR_S_Story_4D_0_0808eea0

PTR_Cam_Set_0808f038:
    .word Cam_Set_0808ee88

PTR_ScenarioData_4D_0808f03c:
    .word ScenarioData_4D

PTR_MapEntrance_0808f040:
    .word MapEntrance_0808f00c
