#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end


_ts Scene_Story_22
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_22_0_08088a64
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_22_0_0808890c:
    .word S_Story_22_0
    .word S_Story_22_1
    .word S_Story_22_2
    .word S_Story_22_3
    .word S_Story_22_4
    .word S_Story_22_5
    .word S_Story_22_6


_ts S_Story_22_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_22_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08088966
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_08088966:
    pop        {pc}


_ts S_Story_22_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808899a
    mov        r0,#0x14
    lsl        r0,r0,#0x10
    mov        r1,#0x1e
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808899a:
    pop        {pc}


_ts S_Story_22_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080889ba
    push       {r5}
    ldr        r0,PTR_ScenarioData_22_08088a68
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080889ba:
    pop        {pc}


_ts S_Story_22_4
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080889da
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_080889da:
    bl         Scene_IsStartPressed
    beq        LAB_080889e4
    bl         S_Story_22_SkipIfStart
LAB_080889e4:
    pop        {pc}


_nt S_Story_22_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088a26
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
    ldr        r7,PTR_NPCList_8030718_08088a6c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_08088a26:
    pop        {pc}


_ts S_Story_22_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088a4a
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0x9E
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08088a4a:
    pop        {pc}


_ts S_Story_22_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_22_0_08088a64:
    .word PTR_S_Story_22_0_0808890c

PTR_ScenarioData_22_08088a68:
    .word ScenarioData_22

PTR_NPCList_8030718_08088a6c:
    .word NPCList_8030718
