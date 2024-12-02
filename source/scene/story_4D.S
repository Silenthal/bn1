#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808ee88:
    cam_set 80, -40, 0
    cam_end

    .align 2, 0



_ts Scene_Story_4D
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_4D_0_0808f034
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_4D_0_0808eea0:
    .word S_Story_4D_0
    .word S_Story_4D_1
    .word S_Story_4D_2
    .word S_Story_4D_3
    .word S_Story_4D_4
    .word S_Story_4D_5


_ts S_Story_4D_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         PetStatusControl_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    ldr        r0,PTR_Cam_Set_0808f038
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_ts S_Story_4D_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808ef0e
    push       {r5}
    mov        r0,#0x68
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0x0
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ef0e:
    pop        {pc}


_ts S_Story_4D_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ef38
    push       {r5}
    ldr        r0,PTR_ScenarioData_4D_0808f03c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808ef38
    bl         S_Story_4D_SkipIfStart
LAB_0808ef38:
    pop        {pc}


_nt S_Story_4D_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808ef58
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ef58:
    bl         Scene_IsStartPressed
    beq        LAB_0808ef62
    bl         S_Story_4D_SkipIfStart
LAB_0808ef62:
    pop        {pc}


_ts S_Story_4D_4
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808ef84
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808ef84:
    pop        {pc}


_nt S_Story_4D_5
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808f008
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0xc2
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    bl         Flag_SetBase
    bl         FUN_080102e8
    mov        r0,#0x3c
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3d
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x3e
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    mov        r0,#0x2a
    bl         Flag_ClearBase
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x40
    strb       r1,[r0,#0x6]
    mov        r0,#0x38
    bl         Flag_ClearBase
    mov        r0,#0x2d
    bl         Flag_ClearBase
    mov        r0,#0x2c
    bl         Flag_ClearBase
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808f040
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Sound_StopAllMusic
    bl         Scene_UnloadAndResetStepCounter
LAB_0808f008:
    pop        {pc}

    .align 2, 0

MapEntrance_0808f00c:
    MapEntrance Map_ACDC_Town, d_s, f(-50, 0, 0)


_ts S_Story_4D_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_4D_0_0808f034:
    .word PTR_S_Story_4D_0_0808eea0

PTR_Cam_Set_0808f038:
    .word Cam_Set_0808ee88

PTR_ScenarioData_4D_0808f03c:
    .word ScenarioData_4D

PTR_MapEntrance_0808f040:
    .word MapEntrance_0808f00c
