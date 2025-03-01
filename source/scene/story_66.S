#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_66
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_66_0_08093068
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_66_0_08092f24:
    .word S_Story_66_0
    .word S_Story_66_1
    .word S_Story_66_2
    .word S_Story_66_3
    .word S_Story_66_4
    .word S_Story_66_5


_ts S_Story_66_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_66_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08092fa2
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092fa2
    push       {r5}
    ldr        r0,DAT_0809306c
    lsl        r0,r0,#0x10
    mov        r1,#0xac
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeInFast_Black
    pop        {r5}
    Scene_Next
LAB_08092fa2:
    pop        {pc}


_ts S_Story_66_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08092fc2
    push       {r5}
    ldr        r0,PTR_ScenarioData_66_08093070
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08092fc2:
    pop        {pc}


_ts S_Story_66_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08092fec
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08092fec:
    bl         Scene_IsStartPressed
    beq        LAB_08092ff6
    bl         S_Story_66_SkipIfStart
LAB_08092ff6:
    pop        {pc}


_ts S_Story_66_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08093018
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_08093018:
    pop        {pc}


_nt S_Story_66_5
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x9A
    ldr        r0,PTR_EnemySpawn_BombManV1_08093074
    bl         Battle_SetEncounter
    mov        r0,#0x6
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_nt S_Story_66_SkipIfStart
    push       {r5}
    FadeOutFast_White
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_66_0_08093068:
    .word PTR_S_Story_66_0_08092f24

DAT_0809306c:
    .word 0x176

PTR_ScenarioData_66_08093070:
    .word ScenarioData_66

PTR_EnemySpawn_BombManV1_08093074:
    .word EnemySpawn_BombManV1
