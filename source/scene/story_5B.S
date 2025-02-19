#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_5B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_5B_0_08090bb8
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_5B_0_080909e8:
    .word S_Story_5B_0
    .word S_Story_5B_1
    .word S_Story_5B_2
    .word S_Story_5B_3
    .word S_Story_5B_4
    .word S_Story_5B_5
    .word S_Story_5B_6
    .word S_Story_5B_7
    .word S_Story_5B_8


_ts S_Story_5B_0
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_5B_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090a74
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08090a74
    push       {r5}
    mov        r0,#0xc
    bl         Effect_ElecMan_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x54
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08090bbc
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    Scene_Next
LAB_08090a74:
    pop        {pc}


_nt S_Story_5B_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090a88
    Scene_Next
LAB_08090a88:
    pop        {pc}


_nt S_Story_5B_3
    mov        r0,#0x64
    strb       r0,[r5,#Scene_sceneTimer]
    mov        r0,#0x8
    bl         PlayerAnimation_SetState
    Scene_Next
    mov        r0,#0x0
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    bl         Scene_IsStartPressed
    beq        LAB_08090ab2
    bl         S_Story_5B_SkipIfStart
LAB_08090ab2:
    pop        {pc}


_ts S_Story_5B_4
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08090ace
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0x1e
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08090ace:
    mov        r0,#0x10
    lsl        r0,r0,#0xc
    mov        r1,#0x10
    neg        r1,r1
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    bl         PlayerAnimation_Move
    bl         Scene_IsStartPressed
    beq        LAB_08090ae8
    bl         S_Story_5B_SkipIfStart
LAB_08090ae8:
    pop        {pc}


_nt S_Story_5B_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08090b0c
    Flag_SetBase 0xBE
    push       {r5}
    ldr        r0,PTR_ScenarioData_5B_08090bc0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08090b0c:
    bl         Scene_IsStartPressed
    beq        LAB_08090b16
    bl         S_Story_5B_SkipIfStart
LAB_08090b16:
    pop        {pc}


_ts S_Story_5B_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08090b40
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08090b40:
    bl         Scene_IsStartPressed
    beq        LAB_08090b4a
    bl         S_Story_5B_SkipIfStart
LAB_08090b4a:
    pop        {pc}


_ts S_Story_5B_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08090b6c
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08090b6c:
    pop        {pc}


_nt S_Story_5B_8
    push       {r5}
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xBD
    ldr        r0,PTR_EnemySpawn_InvElecMan_08090bc4
    bl         Battle_SetEncounter
    mov        r0,#0x4
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_5B_SkipIfStart
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_5B_0_08090bb8:
    .word PTR_S_Story_5B_0_080909e8

DAT_08090bbc:
    .word 0x128

PTR_ScenarioData_5B_08090bc0:
    .word ScenarioData_5B

PTR_EnemySpawn_InvElecMan_08090bc4:
    .word EnemySpawn_InvElecMan
