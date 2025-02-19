#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

Cam_Set_08086a54:
    cam_set 62, 56, 0
    cam_wait 60
    cam_end

    .align 2, 0



_ts Scene_Story_14
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_14_0_08086c1c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_14_0_08086a70:
    .word S_Story_14_0
    .word S_Story_14_1
    .word S_Story_14_2
    .word S_Story_14_3
    .word S_Story_14_4
    .word S_Story_14_5
    .word S_Story_14_6
    .word S_Story_14_7
    .word S_Story_14_8


_ts S_Story_14_0
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086ab6
    push       {r5}
    bl         Flag_SetPlayerInactive
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08086ab6:
    pop        {pc}


_ts S_Story_14_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086b12
    push       {r5}
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_PTR_DAT_08086c20
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    LoadMain world, r7, r7
    ldr        r0,DAT_08086c24
    str        r0,[r7,#0x38]
    ldr        r0,DAT_08086c28
    str        r0,[r7,#0x3c]
    mov        r0,#0x4
    str        r0,[r7,#0x40]
    mov        r1,#0x0
    str        r1,[r7,#0x44]
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08086c2c
    bl         SceneCamera_Init
    Scene_Next
LAB_08086b12:
    pop        {pc}


_ts S_Story_14_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08086b48
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086b48
    push       {r5}
    ldr        r0,PTR_ScenarioData_14_08086c30
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next


_nt S_Story_14_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08086b48
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
LAB_08086b48:
    pop        {pc}


_nt S_Story_14_3
    Flag_GetBase 0x9C
    beq        LAB_08086b6e
    Flag_GetBase 0x9F
    bne        LAB_08086b6e
    ldrb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08086b6a
    mov        r0,#0xa8
    bl         Sound_PlaySE
    mov        r0,#0x6
    strb       r0,[r5,#Scene_sceneTimer]
LAB_08086b6a:
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
LAB_08086b6e:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086b80
    ldrb       r0,[r5,#Scene_state_s0]
    add        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
LAB_08086b80:
    b          S_Story_14_SkipIfStart


_nt S_Story_14_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08086b94
    Scene_Next
LAB_08086b94:
    b          S_Story_14_SkipIfStart


_nt S_Story_14_5
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_14_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086be4
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    mov        r0,#0x11
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_08086c34
    bl         Map_LoadNPCList
    pop        {r5}
    Scene_Next
LAB_08086be4:
    pop        {pc}


_nt S_Story_14_7
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
    pop        {pc}


_nt S_Story_14_8
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x9B
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

PTR_PTR_S_Story_14_0_08086c1c:
    .word PTR_S_Story_14_0_08086a70

PTR_PTR_DAT_08086c20:
    .word NPCList_8028D00

DAT_08086c24:
    .word 0x420000

DAT_08086c28:
    .word 0x380000

PTR_Cam_Set_08086c2c:
    .word Cam_Set_08086a54

PTR_ScenarioData_14_08086c30:
    .word ScenarioData_14

PTR_PTR_DAT_08086c34:
    .word NPCList_8028D24
