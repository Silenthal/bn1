#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808b16c:
    cam_set -6, 70, 0

Cam_End_0808b174:
    cam_end
    .byte 0x00
    .byte 0x00
    player_anim 9, 16, 0, 96
    player_anim 1, 0, 0, 4
    player_anim -1, 0, 0, 0


_ts Scene_Story_33
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_33_0_0808b3f4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_33_0_0808b190:
    .word S_Story_33_0
    .word S_Story_33_1
    .word S_Story_33_2
    .word S_Story_33_3
    .word S_Story_33_4
    .word S_Story_33_5
    .word S_Story_33_6
    .word S_Story_33_7
    .word S_Story_33_8
    .word S_Story_33_9


_ts S_Story_33_0
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_33_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808b20a
    ldr        r0,PTR_Cam_Set_0808b3f8
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldr        r7,PTR_Cam_End_0808b3fc
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#0x1c]
    push       {r5}
    ldr        r0,PTR_ScenarioData_33_0808b400
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b20a:
    pop        {pc}


_ts S_Story_33_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b23a
    mov        r0,#0x7c
    bl         Sound_PlaySongImmediate
    push       {r5}
    mov        r0,#0x4
    bl         Sound_StopSong
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_33_0808b400
    mov        r1,#0x5
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b23a:
    bl         Scene_IsStartPressed
    beq        LAB_0808b244
    bl         S_Story_33_SkipIfStart
LAB_0808b244:
    pop        {pc}


_nt S_Story_33_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b27c
    mov        r0,#0xf7
    bl         Flag_SetBase
    bl         S_Story_33_AnimatePlayer
    tst        r0,r0
    bne        LAB_0808b272
    push       {r5}
    ldr        r0,PTR_ScenarioData_33_0808b400
    mov        r1,#0x6
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b272:
    bl         Scene_IsStartPressed
    beq        LAB_0808b27c
    bl         S_Story_33_SkipIfStart
LAB_0808b27c:
    pop        {pc}


_nt S_Story_33_4
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b29a
    mov        r0,#0x7c
    bl         Sound_PlaySongImmediate
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b29a:
    bl         Scene_IsStartPressed
    beq        LAB_0808b2a4
    bl         S_Story_33_SkipIfStart
LAB_0808b2a4:
    pop        {pc}


_nt S_Story_33_5
    ldr        r0,[r5,#0x8]
    sub        r0,#0x1
    str        r0,[r5,#0x8]
    bne        LAB_0808b2c4
    mov        r0,#0x2
    bl         PlayerAnimation_SetState
    mov        r0,#0xd2
    bl         Flag_SetBase
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b2c4:
    bl         Scene_IsStartPressed
    beq        LAB_0808b2ce
    bl         S_Story_33_SkipIfStart
LAB_0808b2ce:
    pop        {pc}


_ts S_Story_33_6
    ldr        r0,[r5,#0x8]
    sub        r0,#0x1
    str        r0,[r5,#0x8]
    bne        LAB_0808b2ea
    push       {r5}
    ldr        r0,PTR_ScenarioData_33_0808b400
    mov        r1,#0xd
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b2ea:
    pop        {pc}


_ts S_Story_33_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b30a
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b30a:
    bl         Scene_IsStartPressed
    beq        LAB_0808b314
    bl         S_Story_33_SkipIfStart
LAB_0808b314:
    pop        {pc}


_nt S_Story_33_8
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b336
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b336:
    pop        {pc}


_ts S_Story_33_9
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808b370
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0xd3
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808b404
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808b370:
    pop        {pc}

    .align 2, 0


MapEntrance_0808b374:
    MapEntrance Map_ACDC_Town, d_nw, f(304, -160, 0)


_ts S_Story_33_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_33_AnimatePlayer
    push       {lr}
    ldr        r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_0808b3f0
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#0x10]
    cmp        r0,#0x0
    bgt        LAB_0808b3cc
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_0808b3b8
    mov        r1,#0x2
    str        r1,[r5,#0x1c]
    sub        r7,#0x4
LAB_0808b3b8:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_0808b3ca
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_0808b3ca:
    ldrb       r0,[r7,#0x3]
LAB_0808b3cc:
    sub        r0,#0x1
    str        r0,[r5,#0x10]
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
    ldr        r0,[r5,#0x1c]
    cmp        r0,#0x2
    beq        LAB_0808b3f0
    mov        r0,#0x1
    pop        {pc}
LAB_0808b3f0:
    mov        r0,#0x0
    pop        {pc}

PTR_PTR_S_Story_33_0_0808b3f4:
    .word PTR_S_Story_33_0_0808b190

PTR_Cam_Set_0808b3f8:
    .word Cam_Set_0808b16c

PTR_Cam_End_0808b3fc:
    .word Cam_End_0808b174

PTR_ScenarioData_33_0808b400:
    .word ScenarioData_33

PTR_MapEntrance_0808b404:
    .word MapEntrance_0808b374
