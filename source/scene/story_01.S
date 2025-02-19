#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08082ac8:
    cam_set -94, -148, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end

PlayerAnimateArgs_8082AF4:
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


_ts Scene_Story_01_LanWalksToSchool
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_01_0_08082dc0
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_01_0_08082b2c:
    .word S_Story_01_0
    .word S_Story_01_1
    .word S_Story_01_2
    .word S_Story_01_3
    .word S_Story_01_4
    .word S_Story_01_5
    .word S_Story_01_6
    .word S_Story_01_7
    .word S_Story_01_8
    .word S_Story_01_9

DAT_08082b54:
    .byte 0x00

    .align 2, 0



_ts S_Story_01_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#Scene_isAnimating]
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Story_01_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08082ba4
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    bl         S_01_LoadMayl
    push       {r5}
    FadeIn_Black
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08082dc4
    bl         SceneCamera_Init
    Scene_Next
LAB_08082ba4:
    pop        {pc}

    .align 2, 0



_ts S_Story_01_2
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08082bde
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08082bde
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#Scene_dialogueIndex]
    mov        r0,#0x0
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08082bde:
    pop        {pc}


_ts S_Story_01_3
    push       {lr}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    add        r1,r0,#0x1
    strb       r1,[r5,#Scene_dialogueIndex]
    ldr        r1,PTR_DAT_08082dc8
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_01_08082dcc
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08082c06
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08082c06:
    pop        {pc}


_ts S_Story_01_4
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08082c1c
    Scene_Next
LAB_08082c1c:
    bl         Scene_IsStartPressed
    beq        LAB_08082c26
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08082c26:
    pop        {pc}


_ts S_Story_01_5
    push       {lr}
    push       {r5}
    Flag_SetBase 0xD1
    pop        {r5}
    ldr        r7,PTR_PlayerAnimateArgs_8082AF4_08082dd0
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#Scene_sceneArg]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#Scene_isAnimating]
    push       {r5}
    ldr        r0,PTR_ScenarioData_01_08082dcc
    mov        r1,#0x8
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
    bl         Scene_IsStartPressed
    beq        LAB_08082c60
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08082c60:
    pop        {pc}

    .align 2, 0



_ts S_Story_01_6
    push       {lr}
    bl         S_01_AnimatePlayer
    tst        r0,r0
    bne        LAB_08082c7e
    Scene_Next
    push       {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
LAB_08082c7e:
    bl         Scene_IsStartPressed
    beq        LAB_08082c88
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
LAB_08082c88:
    pop        {pc}

    .align 2, 0



_ts S_Story_01_7
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08082c1c
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    ldrb       r0,[r5,#Scene_state_s0]
    add        r0,#0x8
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Story_01_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_08082c60
    mov        r0,#0x20
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Story_01_8
    push       {lr}
    bl         S_01_AnimatePlayer
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    push       {r5}
    FadeOutFast_Black
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_Story_01_9
    push       {lr}
    bl         S_01_AnimatePlayer
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08082d30
    push       {r5}
    bl         PlayerAnimation_Unlock
    Flag_SetBase 0x92
    bl         Text_DisableDialogue
    pop        {r5}
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08082dd4
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08082d30:
    pop        {pc}

    .align 2, 0


MapEntrance_08082d34:
    MapEntrance Map_School_Class_5A, d_nw, f(66, 115, 0)


_ts S_01_LoadMayl
    push       {lr}
    push       {r5}
    mov        r0,#0x6
    ldr        r1,DAT_08082dd8
    ldr        r2,DAT_08082ddc
    mov        r3,#0x0
    mov        r4,#0x0
    bl         Actor_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x1C]
    pop        {pc}

    .align 2, 0



_ts S_01_FreeMayl
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x1C]
    bl         Actor_Free
    pop        {r5}
    pop        {pc}

    .align 2, 0



_ts S_01_AnimatePlayer
    push       {lr}
    ldr        r0,[r5,#Scene_isAnimating]
    tst        r0,r0
    beq        LAB_08082dba
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#Scene_sceneArg]
    cmp        r0,#0x0
    bgt        LAB_08082d9c
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08082d88
    b          LAB_08082dba
LAB_08082d88:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_08082d9a
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_08082d9a:
    ldrb       r0,[r7,#0x3]
LAB_08082d9c:
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
LAB_08082dba:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_01_0_08082dc0:
    .word PTR_S_Story_01_0_08082b2c

PTR_Cam_Set_08082dc4:
    .word Cam_Set_08082ac8

PTR_DAT_08082dc8:
    .word DAT_08082b54

PTR_ScenarioData_01_08082dcc:
    .word ScenarioData_01

PTR_PlayerAnimateArgs_8082AF4_08082dd0:
    .word PlayerAnimateArgs_8082AF4 - 4

PTR_MapEntrance_08082dd4:
    .word MapEntrance_08082d34

DAT_08082dd8:
    .word 0xFFA80000

DAT_08082ddc:
    .word 0xFF7C0000
