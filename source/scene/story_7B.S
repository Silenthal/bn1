#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08096f14:
    cam_set 36, 70, 0
    cam_end

    .align 2, 0



_ts Scene_Story_7B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_7B_0_08096f2c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_PTR_S_Story_7B_0_08096f2c:
    .word PTR_S_Story_7B_0_08096f30

PTR_S_Story_7B_0_08096f30:
    .word S_Story_7B_0
    .word S_Story_7B_1
    .word S_Story_7B_2
    .word S_Story_7B_3
    .word S_Story_7B_4
    .word S_Story_7B_5
    .word S_Story_7B_6
    .word S_Story_7B_7
    .word S_Story_7B_8


_ts S_Story_7B_0
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    Scene_Next
    pop        {pc}


_ts S_Story_7B_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08096fc0
    push       {r5}
    mov        r0,#0x40
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x5a
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0809720c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r1,#0x7
    bl         Effect_LifeVirusSeed_Create
    Flag_ClearBase 0xF9
    ldr        r7,PTR_NPCList_803E8E8_08097210
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x32
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08096fc0:
    pop        {pc}


_nt S_Story_7B_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08096ff4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08096fea
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x80
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08096fea:
    bl         Scene_IsStartPressed
    beq        LAB_08096ff4
    bl         S_Story_7B_SkipIfStart
LAB_08096ff4:
    pop        {pc}


_nt S_Story_7B_3
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809701e
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_0809701e
    bl         S_Story_7B_SkipIfStart
LAB_0809701e:
    pop        {pc}


_ts S_Story_7B_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097048
    push       {r5}
    ldr        r0,PTR_ScenarioData_7B_08097214
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08097048
    bl         S_Story_7B_SkipIfStart
LAB_08097048:
    pop        {pc}


_nt S_Story_7B_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809707c
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_7B_08097214
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    mov        r1,#0x1
    strb       r1,[r5,#Scene_sceneTimer]
    strb       r1,[r5,#Scene_counter]
    strb       r1,[r5,#Scene_sceneArg]
LAB_0809707c:
    bl         Scene_IsStartPressed
    beq        LAB_08097086
    bl         S_Story_7B_SkipIfStart
LAB_08097086:
    pop        {pc}


_ts S_Story_7B_6
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#Scene_sceneArg]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneArg]
    tst        r0,r0
    bne        LAB_080970a8
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneArg]
LAB_080970a8:
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_080970bc
    mov        r0,#0xd8
    bl         Sound_PlaySE
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_counter]
LAB_080970bc:
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080970f6
    bl         Rng_RandomUint
    mov        r7,#0x7f
    and        r7,r0
    sub        r7,#0x3f
    mov        r1,#0x32
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    mov        r2,#0x2a
    lsl        r2,r2,#0x10
    mov        r7,#0x7f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0x3f
    mov        r3,#0x0
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_2_Create
    pop        {r5}
    mov        r1,#0xa
    strb       r1,[r5,#Scene_sceneTimer]
LAB_080970f6:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097114
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08097114:
    bl         Scene_IsStartPressed
    beq        LAB_0809711e
    bl         S_Story_7B_SkipIfStart
LAB_0809711e:
    pop        {pc}


_ts S_Story_7B_7
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x1
    bl         Camera_EnableScreenShake
    pop        {r5}
    ldrb       r0,[r5,#Scene_sceneArg]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneArg]
    tst        r0,r0
    bne        LAB_08097140
    mov        r0,#0xd1
    bl         Sound_PlaySE
    mov        r0,#0x36
    strb       r0,[r5,#Scene_sceneArg]
LAB_08097140:
    ldrb       r0,[r5,#Scene_counter]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_counter]
    tst        r0,r0
    bne        LAB_08097154
    mov        r0,#0xd8
    bl         Sound_PlaySE
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_counter]
LAB_08097154:
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_0809718e
    bl         Rng_RandomUint
    mov        r7,#0x7f
    and        r7,r0
    sub        r7,#0x3f
    mov        r1,#0x32
    add        r1,r1,r7
    lsl        r1,r1,#0x10
    mov        r2,#0x2a
    lsl        r2,r2,#0x10
    mov        r7,#0x7f
    lsl        r7,r7,#0x8
    and        r7,r0
    lsr        r7,r7,#0x8
    sub        r7,#0x3f
    mov        r3,#0x0
    add        r3,r3,r7
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
    mov        r1,#0xa
    strb       r1,[r5,#Scene_sceneTimer]
LAB_0809718e:
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080971ae
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_080971ae:
    pop        {pc}


_ts S_Story_7B_8
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0xE8
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08097218
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_080971e4:
    MapEntrance Map_WWW_Wily_Lab, d_sw, f(52, -32, 0)


_ts S_Story_7B_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_Cam_Set_0809720c:
    .word Cam_Set_08096f14

PTR_NPCList_803E8E8_08097210:
    .word NPCList_803E8E8

PTR_ScenarioData_7B_08097214:
    .word ScenarioData_7B

PTR_MapEntrance_08097218:
    .word MapEntrance_080971e4
