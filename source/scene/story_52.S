#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_52
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_52_0_0808f9f8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_52_0_0808f814:
    .word S_Story_52_0
    .word S_Story_52_1
    .word S_Story_52_2
    .word S_Story_52_3
    .word S_Story_52_4
    .word S_Story_52_5
    .word S_Story_52_6
    .word S_Story_52_7
    .word S_Story_52_8


_ts S_Story_52_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_52_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f8b4
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808f8b4
    push       {r5}
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    mov        r0,#0x1
    strb       r0,[r7,#0x10]
    pop        {r5}
    mov        r0,#0x92
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x8e
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    bl         Scene_IsStartPressed
    beq        LAB_0808f8b4
    bl         S_Story_52_SkipIfStart
LAB_0808f8b4:
    pop        {pc}


_nt S_Story_52_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f8d4
    push       {r5}
    ldr        r0,PTR_ScenarioData_52_0808f9fc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808f8d4:
    pop        {pc}


_nt S_Story_52_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f8f2
    Flag_SetBase 0x9E
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808f8f2:
    bl         Scene_IsStartPressed
    beq        LAB_0808f8fc
    bl         S_Story_52_SkipIfStart
LAB_0808f8fc:
    pop        {pc}


_nt S_Story_52_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808f920
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_52_0808f9fc
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808f920:
    bl         Scene_IsStartPressed
    beq        LAB_0808f92a
    bl         S_Story_52_SkipIfStart
LAB_0808f92a:
    pop        {pc}


_ts S_Story_52_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f942
    mov        r0,#0xc8
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808f942:
    bl         Scene_IsStartPressed
    beq        LAB_0808f94c
    bl         S_Story_52_SkipIfStart
LAB_0808f94c:
    pop        {pc}


_nt S_Story_52_6
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808f95e
    Scene_Next
LAB_0808f95e:
    bl         Scene_IsStartPressed
    beq        LAB_0808f968
    bl         S_Story_52_SkipIfStart
LAB_0808f968:
    pop        {pc}


_nt S_Story_52_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f9b2
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808f98c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_803D36C_0808fa00
    bl         Map_LoadNPCList
    pop        {r5}
LAB_0808f98c:
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808f9b2
    push       {r5}
    FadeIn_Black
    pop        {r5}
LAB_0808f9b2:
    pop        {pc}


_ts S_Story_52_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f9d6
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x9F
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f9d6:
    pop        {pc}


_ts S_Story_52_SkipIfStart
    push       {r5}
    FadeOut_Black
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}

PTR_PTR_S_Story_52_0_0808f9f8:
    .word PTR_S_Story_52_0_0808f814

PTR_ScenarioData_52_0808f9fc:
    .word ScenarioData_52

PTR_NPCList_803D36C_0808fa00:
    .word NPCList_803D36C
