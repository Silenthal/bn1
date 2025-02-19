#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08088da0:
    cam_set 70, -132, 0
    cam_move -128, 128, 0, 382
    cam_wait 60
    cam_end


_ts Scene_Story_24
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_24_0_08088f7c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_24_0_08088dc4:
    .word S_Story_24_0
    .word S_Story_24_1
    .word S_Story_24_2
    .word S_Story_24_3
    .word S_Story_24_4
    .word S_Story_24_5
    .word S_Story_24_6
    .word S_Story_24_7
    .word S_Story_24_8


_ts S_Story_24_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_24_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08088e32
    push       {r5}
    mov        r0,#0x6e
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x44
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08088f80
    bl         SceneCamera_Init
    Scene_Next
LAB_08088e32:
    pop        {pc}


_ts S_Story_24_2
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08088e4e
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088e58
    Scene_Next
LAB_08088e4e:
    bl         Scene_IsStartPressed
    beq        LAB_08088e58
    bl         S_Story_24_SkipIfStart
LAB_08088e58:
    pop        {pc}


_nt S_Story_24_3
    push       {r5}
    ldr        r0,PTR_ScenarioData_24_08088f84
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08088e76
    bl         S_Story_24_SkipIfStart
LAB_08088e76:
    pop        {pc}


_ts S_Story_24_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088e94
    Flag_SetBase 0xA4
    mov        r0,#0xa0
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08088e94:
    bl         Scene_IsStartPressed
    beq        LAB_08088e9e
    bl         S_Story_24_SkipIfStart
LAB_08088e9e:
    pop        {pc}


_ts S_Story_24_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bne        LAB_08088ebc
    push       {r5}
    ldr        r0,PTR_ScenarioData_24_08088f84
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08088ebc:
    pop        {pc}


_nt S_Story_24_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088edc
    Scene_Next
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_08088edc:
    pop        {pc}


_nt S_Story_24_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088f30
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08088f88
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08088f30:
    pop        {pc}


_nt S_Story_24_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088f60
    push       {r5}
    bl         Text_DisableDialogue
    Flag_SetBase 0xA3
    ldr        r7,PTR_DAT_08088f8c
    bl         Map_LoadNPCList
    pop        {r5}
    Flag_ClearBase 0x2B
    bl         PlayerAnimation_Unlock
    bl         Scene_UnloadAndResetStepCounter
LAB_08088f60:
    pop        {pc}


_nt S_Story_24_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_24_0_08088f7c:
    .word PTR_S_Story_24_0_08088dc4

PTR_Cam_Set_08088f80:
    .word Cam_Set_08088da0

PTR_ScenarioData_24_08088f84:
    .word ScenarioData_24

PTR_DAT_08088f88:
    .word NPCList_8030408

PTR_DAT_08088f8c:
    .word NPCList_8030408
