#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808e3d8:
    cam_set -34, 34, 0
    cam_end

Cam_Set_0808e3e2:
    cam_set -34, 34, 0
    cam_move 0, 128, 0, 120
    cam_end

    .align 2, 0



_ts Scene_Story_48
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_48_0_0808e5a0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_48_0_0808e404:
    .word S_Story_48_0
    .word S_Story_48_1
    .word S_Story_48_2
    .word S_Story_48_3
    .word S_Story_48_4
    .word S_Story_48_5
    .word S_Story_48_6
    .word S_Story_48_7


_ts S_Story_48_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808e5a4
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    push       {r5}
    mov        r7,#0x4
    bl         Effect_Nonstop_Bus_Create
    pop        {r5}
    pop        {pc}


_ts S_Story_48_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808e480
    push       {r5}
    mov        r0,#0x64
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x44
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
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
LAB_0808e480:
    pop        {pc}


_nt S_Story_48_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e498
    mov        r0,#0x28
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e498:
    bl         Scene_IsStartPressed
    beq        LAB_0808e4a2
    bl         S_Story_48_SkipIfStart
LAB_0808e4a2:
    pop        {pc}


_ts S_Story_48_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808e4c2
    ldr        r0,PTR_Cam_Set_0808e5a8
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0xb4
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e4c2:
    bl         Scene_IsStartPressed
    beq        LAB_0808e4cc
    bl         S_Story_48_SkipIfStart
LAB_0808e4cc:
    pop        {pc}


_nt S_Story_48_4
    bl         SceneCamera_Main
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808e4ec
    push       {r5}
    ldr        r0,PTR_ScenarioData_48_0808e5ac
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e4ec:
    bl         Scene_IsStartPressed
    beq        LAB_0808e4f6
    bl         S_Story_48_SkipIfStart
LAB_0808e4f6:
    pop        {pc}


_ts S_Story_48_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e516
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e516:
    bl         Scene_IsStartPressed
    beq        LAB_0808e520
    bl         S_Story_48_SkipIfStart
LAB_0808e520:
    pop        {pc}


_nt S_Story_48_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e542
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e542:
    pop        {pc}


_ts S_Story_48_7
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0xB9
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808e5b0
    str        r1,[r0,#0x14]
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


MapEntrance_0808e574:
    MapEntrance Map_Traffic_Light_Comp_5, d_nw, f(-10, 90, 0)


_ts S_Story_48_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_48_0_0808e5a0:
    .word PTR_S_Story_48_0_0808e404

PTR_Cam_Set_0808e5a4:
    .word Cam_Set_0808e3d8

PTR_Cam_Set_0808e5a8:
    .word Cam_Set_0808e3e2

PTR_ScenarioData_48_0808e5ac:
    .word ScenarioData_48

PTR_MapEntrance_0808e5b0:
    .word MapEntrance_0808e574
