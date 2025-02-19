#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_4F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4F_0_0808f41c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4F_0_0808f214:
    .word S_Story_4F_0
    .word S_Story_4F_1
    .word S_Story_4F_2
    .word S_Story_4F_3
    .word S_Story_4F_4
    .word S_Story_4F_5
    .word S_Story_4F_6
    .word S_Story_4F_7
    .word S_Story_4F_8


_ts S_Story_4F_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    FadeOut_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_4F_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f2ac
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808f2ac
    mov        r0,#0x5e
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x24
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8030808_0808f420
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
LAB_0808f2ac:
    pop        {pc}


_nt S_Story_4F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f2d6
    push       {r5}
    ldr        r0,PTR_ScenarioData_4F_0808f424
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808f2d6
    bl         S_Story_4F_SkipIfStart
LAB_0808f2d6:
    pop        {pc}


_ts S_Story_4F_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f2ee
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808f2ee:
    bl         Scene_IsStartPressed
    beq        LAB_0808f2f8
    bl         S_Story_4F_SkipIfStart
LAB_0808f2f8:
    pop        {pc}


_nt S_Story_4F_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808f314
    mov        r0,#0xb
    bl         PlayerAnimation_SetState
    mov        r0,#0x96
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_0808f314:
    bl         Scene_IsStartPressed
    beq        LAB_0808f31e
    bl         S_Story_4F_SkipIfStart
LAB_0808f31e:
    pop        {pc}


_ts S_Story_4F_5
    mov        r0,#0x0
    mov        r1,#0x8
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0808f34e
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_4F_0808f424
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_0808f34e:
    bl         Scene_IsStartPressed
    beq        LAB_0808f358
    bl         S_Story_4F_SkipIfStart
LAB_0808f358:
    pop        {pc}


_nt S_Story_4F_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808f36c
    Scene_Next
LAB_0808f36c:
    bl         Scene_IsStartPressed
    beq        LAB_0808f376
    bl         S_Story_4F_SkipIfStart
LAB_0808f376:
    pop        {pc}


_ts S_Story_4F_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f3d8
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    mov        r0,#0x0
    strb       r0,[r7,#0x10]
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808f3d2
    mov        r0,#0x5e
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x6f
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x0
    bl         PlayerAnimation_SetState
    push       {r5}
    FadeIn_Black
    pop        {r5}
LAB_0808f3d2:
    Scene_Next
LAB_0808f3d8:
    pop        {pc}


_nt S_Story_4F_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f3f8
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x95
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f3f8:
    pop        {pc}


_nt S_Story_4F_SkipIfStart
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

    .align 2, 0


PTR_PTR_S_Story_4F_0_0808f41c:
    .word PTR_S_Story_4F_0_0808f214

PTR_NPCList_8030808_0808f420:
    .word NPCList_8030808

PTR_ScenarioData_4F_0808f424:
    .word ScenarioData_4F
