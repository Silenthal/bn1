#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808e088:
    cam_set -34, 36, 0
    cam_end

Cam_Set_0808e092:
    cam_set -98, 2, 0
    cam_end


_ts Scene_Story_46
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_46_0_0808e21c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_46_0_0808e0a8:
    .word S_Story_46_0
    .word S_Story_46_1
    .word S_Story_46_2
    .word S_Story_46_3
    .word S_Story_46_4
    .word S_Story_46_5
    .word S_Story_46_6
    .word S_Story_46_7


_ts S_Story_46_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    ldr        r0,PTR_Cam_Set_0808e220
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_46_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e100
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e100:
    bl         Scene_IsStartPressed
    beq        LAB_0808e10a
    bl         S_Story_46_SkipIfStart
LAB_0808e10a:
    pop        {pc}


_ts S_Story_46_2
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808e12a
    ldr        r0,PTR_Cam_Set_0808e224
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e12a:
    bl         Scene_IsStartPressed
    beq        LAB_0808e134
    bl         S_Story_46_SkipIfStart
LAB_0808e134:
    pop        {pc}


_nt S_Story_46_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808e156
    LoadMain mapEventState, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xa]
    mov        r0,#0x2
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xb]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e156:
    bl         Scene_IsStartPressed
    beq        LAB_0808e160
    bl         S_Story_46_SkipIfStart
LAB_0808e160:
    pop        {pc}


_nt S_Story_46_4
    push       {r5}
    ldr        r0,PTR_ScenarioData_46_0808e228
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_46_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e194
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e194:
    bl         Scene_IsStartPressed
    beq        LAB_0808e19e
    bl         S_Story_46_SkipIfStart
LAB_0808e19e:
    pop        {pc}


_ts S_Story_46_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e1c0
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e1c0:
    pop        {pc}


_nt S_Story_46_7
    bl         Flag_SetPlayerActive
    push       {r5}
    Flag_SetBase 0xB6
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808e22c
    str        r1,[r0,#0x14]
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808e1f0:
    MapEntrance Map_Traffic_Light_Comp_5, d_nw, f(-6, -4, 0)


_ts S_Story_46_SkipIfStart
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

PTR_PTR_S_Story_46_0_0808e21c:
    .word PTR_S_Story_46_0_0808e0a8

PTR_Cam_Set_0808e220:
    .word Cam_Set_0808e088

PTR_Cam_Set_0808e224:
    .word Cam_Set_0808e092

PTR_ScenarioData_46_0808e228:
    .word ScenarioData_46

PTR_MapEntrance_0808e22c:
    .word MapEntrance_0808e1f0
