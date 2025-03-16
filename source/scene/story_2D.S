#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set 74, 148, 0
    cam_move 128, -128, 0, 212
    cam_wait 60
    cam_end

MapEntranceOptions_0808a2f8:
    MapEntrance Map_ACDC_School_Gate, d_n, f(-108, 46, 0)
    .byte -1, 0x0, 0x0, 0x0


_ts Scene_Story_2D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2D_0_0808a4ac
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2D_0_0808a318:
    .word S_Story_2D_0
    .word S_Story_2D_1
    .word S_Story_2D_2
    .word S_Story_2D_3
    .word S_Story_2D_4
    .word S_Story_2D_5


_ts S_Story_2D_0
    ldr        r0,PTR_MapEntranceOptions_0808a4b0
    ldrb       r1,[r5,#Scene_dialogueIndex]
    mov        r2,#0x14
    mul        r2,r1
    add        r0,r0,r2
    str        r0,[r5,#Scene_sceneArg]
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    mov        r0,#0x0
    strb       r0,[r5,#Scene_state_s1]
    pop        {pc}


_ts S_Story_2D_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808a392
    push       {r5}
    ldr        r0,DAT_0808a4b4
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xe0
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x4
    bl         PlayerAnimation_SetState
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#World_playerLocation]
    add        r1,#0x24
    bl         Camera_SetEnabled
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a392:
    pop        {pc}


_ts S_Story_2D_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a3bc
    push       {r5}
    ldr        r0,PTR_ScenarioData_2D_0808a4b8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0808a3bc
    bl         S_Story_2D_SkipIfStart
LAB_0808a3bc:
    pop        {pc}


_nt S_Story_2D_3
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808a3e2
    push       {r5}
    mov        r0,#0x11
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    mov        r0,#0x1
    strb       r0,[r5,#Scene_state_s1]
LAB_0808a3e2:
    bl         Scene_IsStartPressed
    beq        LAB_0808a3ec
    bl         S_Story_2D_SkipIfStart
LAB_0808a3ec:
    pop        {pc}


_nt S_Story_2D_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bne        LAB_0808a40a
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_0808a40a:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808a426
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    bl         Scene_IsStartPressed
    beq        LAB_0808a426
    bl         S_Story_2D_SkipIfStart
LAB_0808a426:
    pop        {pc}


_ts S_Story_2D_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808a47a
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#World_fadeType]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#Scene_sceneArg]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#Scene_sceneArg]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}
LAB_0808a47a:
    ldrb       r0,[r5,#Scene_state_s1]
    tst        r0,r0
    beq        LAB_0808a48c
    mov        r0,#0x8
    lsl        r0,r0,#0xc
    mov        r1,#0x0
    mov        r2,#0x0
    bl         PlayerAnimation_Move
LAB_0808a48c:
    pop        {pc}


_nt S_Story_2D_SkipIfStart
    push       {r5}
    FadeOut_Black
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_2D_0_0808a4ac:
    .word PTR_S_Story_2D_0_0808a318

PTR_MapEntranceOptions_0808a4b0:
    .word MapEntranceOptions_0808a2f8

DAT_0808a4b4:
    .word 0x108

PTR_ScenarioData_2D_0808a4b8:
    .word ScenarioData_2D
