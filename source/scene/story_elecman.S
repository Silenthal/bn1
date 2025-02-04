#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_ElecMan
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_ElecMan_0_08091e7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_ElecMan_0_08091d30:
    .word S_Story_ElecMan_0
    .word S_Story_ElecMan_1
    .word S_Story_ElecMan_2
    .word S_Story_ElecMan_3
    .word S_Story_ElecMan_4
    .word S_Story_ElecMan_5


_ts S_Story_ElecMan_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_ElecMan_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08091da8
    Flag_ClearBase 0xBE
    push       {r5}
    mov        r0,#0x3
    bl         Effect_ElecMan_Create
    pop        {r5}
    push       {r5}
    bl         PETBattery_Disable
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08091e80
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091da8:
    pop        {pc}


_nt S_Story_ElecMan_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091dc8
    push       {r5}
    ldr        r0,PTR_ScenarioData_5D_08091e84
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091dc8:
    pop        {pc}


_nt S_Story_ElecMan_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08091df2
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091df2:
    bl         Scene_IsStartPressed
    beq        LAB_08091dfc
    bl         S_Story_ElecMan_SkipIfStart
LAB_08091dfc:
    pop        {pc}


_nt S_Story_ElecMan_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08091e1e
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08091e1e:
    pop        {pc}


_ts S_Story_ElecMan_5
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xC2
    LoadMain gameStats, r7, r7
    mov        r0,#0xa
    strb       r0,[r7,#0x5]
    push       {r5}
    ldr        r0,PTR_EnemySpawn_ElecManV1_08091e88
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


_ts S_Story_ElecMan_SkipIfStart
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
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_ElecMan_0_08091e7c:
    .word PTR_S_Story_ElecMan_0_08091d30

DAT_08091e80:
    .word 0x18E

PTR_ScenarioData_5D_08091e84:
    .word ScenarioData_5D

PTR_EnemySpawn_ElecManV1_08091e88:
    .word EnemySpawn_ElecManV1
