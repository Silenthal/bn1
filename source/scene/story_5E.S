#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_5E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_5E_0_080912a0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_5E_0_08091060:
    .word S_Story_5E_0
    .word S_Story_5E_1
    .word S_Story_5E_2
    .word S_Story_5E_3
    .word S_Story_5E_4
    .word S_Story_5E_5
    .word S_Story_5E_6
    .word S_Story_5E_7
    .word S_Story_5E_8
    .word S_Story_5E_9
    .word S_Story_5E_10


_ts S_Story_5E_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_5E_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080910e4
    Flag_ClearBase 0xBE
    push       {r5}
    mov        r0,#0x12
    bl         Effect_ElecMan_Create
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    ldr        r1,DAT_080912a4
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    FadeIn_Black
    pop        {r5}
    Scene_Next
LAB_080910e4:
    pop        {pc}


_nt S_Story_5E_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091104
    push       {r5}
    ldr        r0,PTR_ScenarioData_5E_080912a8
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08091104:
    pop        {pc}


_nt S_Story_5E_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091122
    Flag_SetBase 0xBE
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08091122:
    bl         Scene_IsStartPressed
    beq        LAB_0809112c
    bl         S_Story_5E_SkipIfStart
LAB_0809112c:
    pop        {pc}


_nt S_Story_5E_4
    Flag_GetBase 0xBE
    bne        LAB_08091162
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091162
    push       {r5}
    Fade_Request FT_FadeInFromWhite, 0xf0
    pop        {r5}
    mov        r0,#0x3c
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08091162
    bl         S_Story_5E_SkipIfStart
LAB_08091162:
    pop        {pc}


_ts S_Story_5E_5
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080911aa
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080911aa
    Flag_ClearBase 0xBE
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    mov        r0,#0xde
    bl         Sound_PlaySE
    ldr        r7,PTR_NPCList_804B9FC_080912ac
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_080911aa
    bl         S_Story_5E_SkipIfStart
LAB_080911aa:
    pop        {pc}


_ts S_Story_5E_6
    ldrb       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strb       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_080911ce
    mov        r0,#0x2e
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_5E_080912a8
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080911ce:
    bl         Scene_IsStartPressed
    beq        LAB_080911d8
    bl         S_Story_5E_SkipIfStart
LAB_080911d8:
    pop        {pc}


_nt S_Story_5E_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080911f2
    Flag_SetBase 0xBE
    Scene_Next
LAB_080911f2:
    bl         Scene_IsStartPressed
    beq        LAB_080911fc
    bl         S_Story_5E_SkipIfStart
LAB_080911fc:
    pop        {pc}


_nt S_Story_5E_8
    Flag_GetBase 0xBE
    bne        LAB_08091222
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08091222:
    bl         Scene_IsStartPressed
    beq        LAB_0809122c
    bl         S_Story_5E_SkipIfStart
LAB_0809122c:
    pop        {pc}


_nt S_Story_5E_9
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809124e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    Scene_Next
LAB_0809124e:
    pop        {pc}


_ts S_Story_5E_10
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xC3
    ldr        r0,PTR_EnemySpawn_ProtoManV1_080912b0
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


_ts S_Story_5E_SkipIfStart
    push       {r5}
    FadeOutFast_White
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x24
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_5E_0_080912a0:
    .word PTR_S_Story_5E_0_08091060

DAT_080912a4:
    .word 0x18E

PTR_ScenarioData_5E_080912a8:
    .word ScenarioData_5E

PTR_NPCList_804B9FC_080912ac:
    .word NPCList_804B9FC

PTR_EnemySpawn_ProtoManV1_080912b0:
    .word EnemySpawn_ProtoManV1
