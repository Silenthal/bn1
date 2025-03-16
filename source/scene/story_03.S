#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808331c:
    cam_set -216, 72, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end


_ts Scene_Story_03_BeginClassTutorial
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_03_0_08083490
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_03_0_08083358:
    .word S_Story_03_0
    .word S_Story_03_1
    .word S_Story_03_2
    .word S_Story_03_3
    .word S_Story_03_4

DAT_0808336c:
    .byte 0x00

    .align 2, 0



_ts S_Story_03_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08083494
    bl         SceneCamera_Init
    Scene_Next
    pop        {pc}


_ts S_Story_03_1
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_080833b2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080833b2
    mov        r0,#0x0
    strb       r0,[r5,#Scene_dialogueIndex]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_080833b2
    bl         S_Story_03_SkipIfStart
LAB_080833b2:
    pop        {pc}


_ts S_Story_03_2
    push       {lr}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    add        r1,r0,#0x1
    strb       r1,[r5,#Scene_dialogueIndex]
    push       {r5}
    ldr        r1,PTR_DAT_08083498
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_03_0808349c
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_080833da
    bl         S_Story_03_SkipIfStart
LAB_080833da:
    pop        {pc}


_ts S_Story_03_3
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08083406
    push       {r5}
    FadeOutFast_White
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    Scene_Next
LAB_08083406:
    bl         Scene_IsStartPressed
    beq        LAB_08083410
    bl         S_Story_03_SkipIfStart
LAB_08083410:
    pop        {pc}

    .align 2, 0



_ts S_Story_03_4
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08083468
    push       {r5}
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x95
    bl         Text_DisableDialogue
    ldr        r0,PTR_EnemySpawn_Tutorial_1_080834a0
    bl         Battle_SetEncounter
    mov        r0,#0x0
    mov        r1,#0x1
    ldr        r2,PTR_BattleChip_ARRAY_080834a4
    mov        r3,#0x0
    mov        r4,#0x0
    mov        r6,#0x1
    bl         World_SetBattleParams
    pop        {r5}
    LoadMain world, r7, r7
    mov        r0,#0xe8
    neg        r0,r0
    lsl        r0,r0,#0x10
    str        r0,[r7,#World_savedPos_x]
    mov        r0,#0x58
    lsl        r0,r0,#0x10
    str        r0,[r7,#World_savedPos_y]
    mov        r0,#0x0
    str        r0,[r7,#World_savedPos_z]
    mov        r0,#0x4
    str        r0,[r7,#World_savedDirection]
    bl         Scene_UnloadAndResetStepCounter
LAB_08083468:
    pop        {pc}

    .align 2, 0



_ts S_Story_03_SkipIfStart
    push       {lr}
    push       {r5}
    FadeOut_White
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySE
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}

PTR_PTR_S_Story_03_0_08083490:
    .word PTR_S_Story_03_0_08083358

PTR_Cam_Set_08083494:
    .word Cam_Set_0808331c

PTR_DAT_08083498:
    .word DAT_0808336c

PTR_ScenarioData_03_0808349c:
    .word ScenarioData_03

PTR_EnemySpawn_Tutorial_1_080834a0:
    .word EnemySpawn_Tutorial_1

PTR_BattleChip_ARRAY_080834a4:
    .word folderTutorial1
