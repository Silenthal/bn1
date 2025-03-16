#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_50
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_50_0_0808f5d0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_50_0_0808f434:
    .word S_Story_50_0
    .word S_Story_50_1
    .word S_Story_50_2
    .word S_Story_50_3
    .word S_Story_50_4
    .word S_Story_50_5
    .word S_Story_50_6


_ts S_Story_50_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_50_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f4c4
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_80355D8_0808f5d4
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808f4c4
    mov        r0,#0x52
    lsl        r0,r0,#0x10
    mov        r1,#0x48
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    Flag_SetBase 0x9A
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
LAB_0808f4c4:
    pop        {pc}


_nt S_Story_50_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f4ee
    push       {r5}
    ldr        r0,PTR_ScenarioData_50_0808f5d8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808f4ee
    bl         S_Story_50_SkipIfStart
LAB_0808f4ee:
    pop        {pc}


_ts S_Story_50_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f506
    ldr        r0,DAT_0808f5dc
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808f506:
    bl         Scene_IsStartPressed
    beq        LAB_0808f510
    bl         S_Story_50_SkipIfStart
LAB_0808f510:
    pop        {pc}


_nt S_Story_50_4
    ldrh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0xeb
    bne        LAB_0808f522
    push       {r0}
    mov        r0,#0x5
    bl         PlayerAnimation_SetState
    pop        {r0}
LAB_0808f522:
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808f530
    Scene_Next
LAB_0808f530:
    bl         Scene_IsStartPressed
    beq        LAB_0808f53a
    bl         S_Story_50_SkipIfStart
LAB_0808f53a:
    pop        {pc}


_ts S_Story_50_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f58c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_80355BC_0808f5e0
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0x5
    strb       r0,[r7,#0x10]
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808f586
    push       {r5}
    FadeIn_Black
    pop        {r5}
LAB_0808f586:
    Scene_Next
LAB_0808f58c:
    pop        {pc}


_nt S_Story_50_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f5ac
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x98
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f5ac:
    pop        {pc}


_nt S_Story_50_SkipIfStart
    push       {r5}
    FadeOut_Black
    pop        {r5}
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_50_0_0808f5d0:
    .word PTR_S_Story_50_0_0808f434

PTR_NPCList_80355D8_0808f5d4:
    .word NPCList_80355D8

PTR_ScenarioData_50_0808f5d8:
    .word ScenarioData_50

DAT_0808f5dc:
    .word 0x113

PTR_NPCList_80355BC_0808f5e0:
    .word NPCList_80355BC
