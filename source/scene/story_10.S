#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_080861b0:
    cam_set 240, 20, 0
    cam_move 256, -256, 0, 80
    cam_wait 30
    cam_end

PlayerAnimateArgs_80861C8:
    player_anim 17, 16, 0, 45
    player_anim 16, 16, -16, 15
    player_anim 17, 16, 0, 32
    player_anim 18, 8, 8, 32
    player_anim 17, 16, 0, -6
    player_anim 17, 16, 0, 72
    player_anim 18, 8, 8, 31
    player_anim -1, 0, 0, 0


_ts Scene_Story_10
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_10_0_08086384
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_10_0_080861f4:
    .word S_Story_10_0
    .word S_Story_10_1
    .word S_Story_10_2
    .word S_Story_10_3
    .word S_Story_10_4
    .word S_Story_10_5
    .word S_Story_10_6


_ts S_Story_10_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_10_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808624e
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldr        r0,PTR_Cam_Set_08086388
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808624e:
    pop        {pc}


_ts S_Story_10_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08086296
    push       {r5}
    mov        r0,#0x1
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r0,PTR_ScenarioData_10_0808638c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldr        r7,PTR_PlayerAnimateArgs_80861C8_08086390
    str        r7,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x10]
    mov        r0,#0xff
    str        r0,[r5,#0x14]
    mov        r0,#0x1
    str        r0,[r5,#0x1c]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]


_ts S_Story_10_SkipIfStart
    bl         Scene_IsStartPressed
    beq        LAB_0808624e
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
LAB_08086296:
    pop        {pc}


_ts S_Story_10_3
    bl         S_Story_10_AnimatePlayer
    tst        r0,r0
    bne        LAB_080862a4
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
LAB_080862a4:
    b          S_Story_10_SkipIfStart


_nt S_Story_10_4
    push       {r5}
    bl         PlayerAnimation_Unlock
    mov        r0,#0x90
    bl         Flag_SetBase
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_08086394
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_080862dc:
    MapEntrance Map_School_Cross_Hallway, d_nw, f(-28, 84, 0)


_ts S_Story_10_5
    bl         S_Story_10_AnimatePlayer
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_10_6
    bl         S_Story_10_AnimatePlayer
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808632a
    push       {r5}
    bl         Text_DisableDialogue
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_0808632a:
    pop        {pc}


_ts S_Story_10_AnimatePlayer
    push       {lr}
    ldr        r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_08086380
    ldr        r7,[r5,#0x18]
    ldr        r0,[r5,#0x10]
    cmp        r0,#0x0
    bgt        LAB_0808635c
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0xff
    bne        LAB_08086348
    mov        r1,#0x2
    str        r1,[r5,#0x1c]
    sub        r7,#0x4
LAB_08086348:
    add        r7,#0x4
    str        r7,[r5,#0x18]
    ldr        r1,[r5,#0x14]
    cmp        r0,r1
    beq        LAB_0808635a
    push       {r5,r7}
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
LAB_0808635a:
    ldrb       r0,[r7,#0x3]
LAB_0808635c:
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
    beq        LAB_08086380
    mov        r0,#0x1
    pop        {pc}
LAB_08086380:
    mov        r0,#0x0
    pop        {pc}

PTR_PTR_S_Story_10_0_08086384:
    .word PTR_S_Story_10_0_080861f4

PTR_Cam_Set_08086388:
    .word Cam_Set_080861b0

PTR_ScenarioData_10_0808638c:
    .word ScenarioData_10

PTR_PlayerAnimateArgs_80861C8_08086390:
    .word PlayerAnimateArgs_80861C8 - 4

PTR_MapEntrance_08086394:
    .word MapEntrance_080862dc
