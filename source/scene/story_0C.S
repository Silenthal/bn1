#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08084d08:
    cam_set -213, -218, 0
    cam_move -128, 128, 0, 212
    cam_wait 60
    cam_end


_ts Scene_Story_0C
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_0C_0_08084eb0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_0C_0_08084d30:
    .word S_Story_0C_0
    .word S_Story_0C_1
    .word S_Story_0C_2
    .word S_Story_0C_3
    .word S_Story_0C_4
    .word S_Story_0C_5


_ts S_Story_0C_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_0C_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08084d8c
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_08084d8c:
    pop        {pc}

    .align 2, 0



_ts S_Story_0C_2
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084dda
    push       {r5}
    ldr        r0,DAT_08084eb4
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x60
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0x1c
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8043CD8_08084eb8
    bl         Map_LoadNPCList
    ldr        r0,PTR_Cam_Set_08084ebc
    bl         SceneCamera_Init
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_08084dda:
    pop        {pc}


_ts S_Story_0C_3
    push       {lr}
    bl         SceneCamera_Main
    LoadMain fade, r2, r2
    ldrb       r2,[r2,#0x3]
    mov        r1,#0x1
    cmp        r2,r1
    beq        LAB_08084e0e
    cmp        r0,#0x1
    beq        LAB_08084e04
    push       {r5}
    ldr        r0,PTR_ScenarioData_0C_08084ec0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08084e04:
    bl         Scene_IsStartPressed
    beq        LAB_08084e0e
    bl         S_Story_0C_SkipIfStart
LAB_08084e0e:
    pop        {pc}


_ts S_Story_0C_4
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08084e42
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084e42
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08084e42:
    bl         Scene_IsStartPressed
    beq        LAB_08084e4c
    bl         S_Story_0C_SkipIfStart
LAB_08084e4c:
    pop        {pc}

    .align 2, 0



_ts S_Story_0C_5
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08084e88
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC9
    ldr        r0,PTR_EnemySpawn_FireManV1_08084ec4
    bl         Battle_SetEncounter
    mov        r0,#0x1
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08084e88:
    pop        {pc}

    .align 2, 0



_ts S_Story_0C_SkipIfStart
    push       {lr}
    push       {r5}
    FadeOutFast_White
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_0C_0_08084eb0:
    .word PTR_S_Story_0C_0_08084d30

DAT_08084eb4:
    .word 0x139

PTR_NPCList_8043CD8_08084eb8:
    .word NPCList_8043CD8

PTR_Cam_Set_08084ebc:
    .word Cam_Set_08084d08

PTR_ScenarioData_0C_08084ec0:
    .word ScenarioData_0C

PTR_EnemySpawn_FireManV1_08084ec4:
    .word EnemySpawn_FireManV1
