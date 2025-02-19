#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08088368:
    cam_set 88, -594, 0
    cam_move -128, 128, 0, 212
    cam_wait 60
    cam_end


_ts Scene_Story_1F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_1F_0_080884c4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_1F_0_0808838c:
    .word S_Story_1F_0
    .word S_Story_1F_1
    .word S_Story_1F_2
    .word S_Story_1F_3
    .word S_Story_1F_4
    .word S_Story_1F_5


_ts S_Story_1F_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_1F_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080883d4
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
LAB_080883d4:
    pop        {pc}


_nt S_Story_1F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080883fa
    ldr        r0,PTR_Cam_Set_080884c8
    bl         SceneCamera_Init
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_080883fa:
    pop        {pc}


_ts S_Story_1F_3
    bl         SceneCamera_Main
    LoadMain fade, r2, r2
    ldrb       r2,[r2,#0x3]
    mov        r1,#0x1
    cmp        r2,r1
    beq        LAB_0808842c
    cmp        r0,#0x1
    beq        LAB_08088422
    push       {r5}
    ldr        r0,PTR_ScenarioData_1F_080884cc
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08088422:
    bl         Scene_IsStartPressed
    beq        LAB_0808842c
    bl         S_Story_1F_SkipIfStart
LAB_0808842c:
    pop        {pc}


_nt S_Story_1F_4
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_0808845e
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808845e
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_0808845e:
    bl         Scene_IsStartPressed
    beq        LAB_0808842c
    bl         S_Story_1F_SkipIfStart
    pop        {pc}


_nt S_Story_1F_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080884a0
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0x6F
    ldr        r0,PTR_EnemySpawn_StoneManV1_080884d0
    bl         Battle_SetEncounter
    mov        r0,#0x6
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x81
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_080884a0:
    pop        {pc}


_nt S_Story_1F_SkipIfStart
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

PTR_PTR_S_Story_1F_0_080884c4:
    .word PTR_S_Story_1F_0_0808838c

PTR_Cam_Set_080884c8:
    .word Cam_Set_08088368

PTR_ScenarioData_1F_080884cc:
    .word ScenarioData_1F

PTR_EnemySpawn_StoneManV1_080884d0:
    .word EnemySpawn_StoneManV1
