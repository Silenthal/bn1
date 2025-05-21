#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08088a70:
    cam_set -94, -148, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end

PlayerAnimateArgs_88A9C:
    player_anim 9, 8, 0, 90
    player_anim 9, 8, -8, 30
    player_anim 9, 8, 0, 80
    player_anim 9, 4, 4, 90
    player_anim 9, 8, 0, -6
    player_anim 9, 8, 0, -16
    player_anim 9, 8, 0, -86
    player_anim 1, 0, 0, 20
    player_anim 11, 0, 8, 15
    player_anim -1, 0, 0, 0


_ts Scene_Story_23
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_23_0_08088d80
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_23_0_08088ad4:
    .word S_Story_23_0
    .word S_Story_23_1
    .word S_Story_23_2
    .word S_Story_23_3
    .word S_Story_23_4
    .word S_Story_23_5
    .word S_Story_23_6
    .word S_Story_23_7
    .word S_Story_23_8
    .word S_Story_23_9

DAT_08088afc:
    .byte 0x00


_ts S_Story_23_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#Scene_isAnimating]
    Scene_Next
    pop        {pc}


_ts S_Story_23_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08088b4c
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    bl         S_Story_23_MaylLoad
    push       {r5}
    FadeIn_Black
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08088d84
    bl         SceneCamera_Init
    Scene_Next
LAB_08088b4c:
    pop        {pc}


_ts S_Story_23_2
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08088b86
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088b86
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#World_playerLocation]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#Scene_dialogueIndex]
    mov        r0,#0x0
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08088b86:
    pop        {pc}


_ts S_Story_23_3
    push       {lr}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    add        r1,r0,#0x1
    strb       r1,[r5,#Scene_dialogueIndex]
    ldr        r1,PTR_DAT_08088d88
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_23_08088d8c
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08088bae
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08088bae:
    pop        {pc}


_ts S_Story_23_4
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088bc4
    Scene_Next
LAB_08088bc4:
    bl         Scene_IsStartPressed
    beq        LAB_08088bce
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08088bce:
    pop        {pc}


_ts S_Story_23_5
    push       {lr}
    push       {r5}
    Flag_SetBase 0xD1
    pop        {r5}
    ldr        r7,PTR_PlayerAnimateArgs_08088d90
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#Scene_sceneArg]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#Scene_isAnimating]
    mov        r0,#0xdc
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08088c00
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08088c00:
    pop        {pc}


_ts S_Story_23_6
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0xff
    beq        LAB_08088c28
    cmp        r0,#0x0
    bne        LAB_08088c22
    push       {r5}
    ldr        r0,PTR_ScenarioData_23_08088d8c
    mov        r1,#0x2
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0xff
    strh       r0,[r5,#Scene_sceneTimer]
    b          LAB_08088c28
LAB_08088c22:
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
LAB_08088c28:
    bl         S_Story_23_AnimatePlayer
    tst        r0,r0
    bne        LAB_08088c40
    Scene_Next
    push       {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
LAB_08088c40:
    bl         Scene_IsStartPressed
    beq        LAB_08088c4a
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08088c4a:
    pop        {pc}


_ts S_Story_23_7
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088bc4
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s0]
    add        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Story_23_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08088c00
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Story_23_8
    push       {lr}
    bl         S_Story_23_AnimatePlayer
    push       {r5}
    mov        r0,#TF_DisableInput
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_23_9
    push       {lr}
    bl         S_Story_23_AnimatePlayer
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088cf0
    push       {r5}
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0xA2
    bl         Text_DisableDialogue
    pop        {r5}
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#World_fadeType]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08088d94
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08088cf0:
    pop        {pc}

    .align 2, 0


MapEntrance_08088cf4:
    MapEntrance Map_ACDC_School_Gate, d_ne, f(-240, 142, 0)


_ts S_Story_23_MaylLoad
    push       {lr}
    push       {r5}
    mov        r0,#0x6
    ldr        r1,DAT_08088d98
    ldr        r2,DAT_08088d9c
    mov        r3,#0x0
    mov        r4,#0x0
    bl         Actor_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x1C]
    pop        {pc}


_ts S_Story_23_MaylFree
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x1C]
    bl         Actor_Free
    pop        {r5}
    pop        {pc}


_ts S_Story_23_AnimatePlayer
    push       {lr}
    ldr        r0,[r5,#Scene_isAnimating]
    tst        r0,r0
    beq        LAB_08088d7a
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#Scene_sceneArg]
    cmp        r0,#0x0
    bgt        LAB_08088d5c
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08088d48
    b          LAB_08088d7a
LAB_08088d48:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_08088d5a
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_08088d5a:
    ldrb       r0,[r7,#0x3]
LAB_08088d5c:
    sub        r0,#0x1
    str        r0,[r5,#Scene_sceneArg]
    mov        r3,#0x1
    ldrsb      r0,[r7,r3]
    lsl        r0,r0,#0xc
    mov        r3,#0x2
    ldrsb      r1,[r7,r3]
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_08088d7a:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_23_0_08088d80:
    .word PTR_S_Story_23_0_08088ad4

PTR_Cam_Set_08088d84:
    .word Cam_Set_08088a70

PTR_DAT_08088d88:
    .word DAT_08088afc

PTR_ScenarioData_23_08088d8c:
    .word ScenarioData_23

PTR_PlayerAnimateArgs_08088d90:
    .word PlayerAnimateArgs_88A9C - 4

PTR_MapEntrance_08088d94:
    .word MapEntrance_08088cf4

DAT_08088d98:
    .word 0xFFA80000

DAT_08088d9c:
    .word 0xFF7C0000
