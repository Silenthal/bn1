#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08093ec8:
    cam_set 100, 206, 0
    cam_end

    .align 2, 0



_ts Scene_Story_6D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6D_0_080940cc
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6D_0_08093ee0:
    .word S_Story_6D_0
    .word S_Story_6D_1
    .word S_Story_6D_2
    .word S_Story_6D_3
    .word S_Story_6D_4
    .word S_Story_6D_5
    .word S_Story_6D_6
    .word S_Story_6D_7
    .word S_Story_6D_8


_ts S_Story_6D_0
    push       {r5}
    mov        r0,#0x3
    bl         Sound_StopBGM
    LoadMain world, r7, r7
    mov        r0,#0xff
    strb       r0,[r7,#0x18]
    pop        {r5}
    Flag_ClearEvent 0x2C
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8035880_080940d0
    bl         Map_LoadNPCList
    pop        {r5}
    Scene_Next
    ldr        r0,PTR_Cam_Set_080940d4
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_ts S_Story_6D_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08093f76
    push       {r5}
    mov        r0,#0x2c
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x6c
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    pop        {r5}
    Scene_Next
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
LAB_08093f76:
    pop        {pc}


_ts S_Story_6D_2
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08093f94
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08093f94:
    pop        {pc}


_nt S_Story_6D_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093fbe
    push       {r5}
    ldr        r0,PTR_ScenarioData_6D_080940d8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08093fbe
    bl         S_Story_6D_SkipIfStart
LAB_08093fbe:
    pop        {pc}


_ts S_Story_6D_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08093fdc
    Flag_SetBase 0xAD
    mov        r0,#0x78
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08093fdc:
    bl         Scene_IsStartPressed
    beq        LAB_08093fe6
    bl         S_Story_6D_SkipIfStart
LAB_08093fe6:
    pop        {pc}


_ts S_Story_6D_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08094010
    Flag_SetBase 0xAE
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    push       {r5}
    ldr        r0,PTR_ScenarioData_6D_080940d8
    mov        r1,#0xa
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08094010:
    bl         Scene_IsStartPressed
    beq        LAB_0809401a
    bl         S_Story_6D_SkipIfStart
LAB_0809401a:
    pop        {pc}


_ts S_Story_6D_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809403a
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_0809403a:
    bl         Scene_IsStartPressed
    beq        LAB_08094044
    bl         S_Story_6D_SkipIfStart
LAB_08094044:
    pop        {pc}


_nt S_Story_6D_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094066
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08094066:
    pop        {pc}


_ts S_Story_6D_8
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0xAB
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_080940dc
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0809409c:
    MapEntrance Map_WWW_Base, d_sw, f(-190, -50, -64)


_ts S_Story_6D_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#T_Suspicious_Mood
    bl         Sound_PlayBGM
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_6D_0_080940cc:
    .word PTR_S_Story_6D_0_08093ee0

PTR_NPCList_8035880_080940d0:
    .word NPCList_8035880

PTR_Cam_Set_080940d4:
    .word Cam_Set_08093ec8

PTR_ScenarioData_6D_080940d8:
    .word ScenarioData_6D

PTR_MapEntrance_080940dc:
    .word MapEntrance_0809409c
