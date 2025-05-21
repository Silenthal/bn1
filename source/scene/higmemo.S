#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Internet_4_HigMemo_Gate
    push       {lr}
    ldr        r0,PTR_PTR_S_Internet_4_HigMemo_Gate_0_08097e8c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Internet_4_HigMemo_Gate_0_08097dc0:
    .word S_Internet_4_HigMemo_Gate_0
    .word S_Internet_4_HigMemo_Gate_1
    .word S_Internet_4_HigMemo_Gate_2
    .word S_Internet_4_HigMemo_Gate_3


_ts S_Internet_4_HigMemo_Gate_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Internet_4_HigMemo_Gate_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08097e1a
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08097e1a:
    pop        {pc}


_ts S_Internet_4_HigMemo_Gate_2
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097e46
    push       {r5}
    FadeOut_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08097e46:
    pop        {pc}


_ts S_Internet_4_HigMemo_Gate_3
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097e88
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    Flag_SetEvent 0x2F
    ldr        r0,PTR_EnemySpawn_08097e90
    bl         Battle_SetEncounter
    mov        r0,#0x6
    mov        r1,#0x5
    mov        r2,#0x0
    mov        r4,#0x1
    mov        r6,#0x1
    bl         World_SetBattleParams
    LoadMain world, r0, r0
    mov        r1,#0x51
    strb       r1,[r0,#World_storyFlag]
    bl         Scene_UnloadAndResetStepCounter
LAB_08097e88:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Internet_4_HigMemo_Gate_0_08097e8c:
    .word PTR_S_Internet_4_HigMemo_Gate_0_08097dc0

PTR_EnemySpawn_08097e90:
    .word EnemySpawn_0800b344
