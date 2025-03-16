#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0


_ts Scene_Get_SchoolID
    push       {lr}
    ldr        r0,PTR_PTR_S_Get_SchoolID_0_08088104
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Get_SchoolID_0_08087fbc:
    .word S_Get_SchoolID_0
    .word S_Get_SchoolID_1
    .word S_Get_SchoolID_2
    .word S_Get_SchoolID_3
    .word S_Get_SchoolID_4
    .word S_Get_SchoolID_5


_ts S_Get_SchoolID_0
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Get_SchoolID_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808802e
    mov        r0,#0x0
    bl         NPC_FindByIndex
    str        r0,[r5,#Scene_sceneArg]
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    ldrb       r0,[r7,#PlayerLocation_direction]
    add        r0,#0x4
    mov        r1,#0x7
    and        r0,r1
    ldr        r1,[r5,#Scene_sceneArg]
    strb       r0,[r1,#0x14]
    Flag_SetBase 0xC6
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808802e:
    pop        {pc}


_ts S_Get_SchoolID_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808806e
    push       {r5}
    ldr        r0,PTR_DialogueData_School_Storage_08088108
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next


_nt S_Get_SchoolID_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_0808806e
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
LAB_0808806e:
    pop        {pc}


_ts S_Get_SchoolID_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088082
    Scene_Next
LAB_08088082:
    b          S_Get_SchoolID_SkipIfStart


_ts S_Get_SchoolID_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080880d6
    mov        r0,#0x3
    ldr        r1,[r5,#Scene_sceneArg]
    strb       r0,[r1,#0x14]
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Flag_GetBase 0xBF
    beq        LAB_080880d2
    Flag_GetBase 0xC6
    beq        LAB_080880d2
    mov        r0,#0x3
    bl         KeyItem_IsPresent
    tst        r0,r0
    bne        LAB_080880d2
    mov        r0,#0x3
    mov        r1,#0x1
    bl         KeyItem_AddAmount
LAB_080880d2:
    bl         Scene_UnloadAndResetStepCounter
LAB_080880d6:
    pop        {pc}


_ts S_Get_SchoolID_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088102
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableDialogue
    bl         Text_DisableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
LAB_08088102:
    pop        {pc}

PTR_PTR_S_Get_SchoolID_0_08088104:
    .word PTR_S_Get_SchoolID_0_08087fbc

PTR_DialogueData_School_Storage_08088108:
    .word DialogueData_School_Storage
