#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808e230:
    cam_set -34, 36, 0
    cam_end

Cam_Set_0808e23a:
    cam_set 12, 60, 0
    cam_end


_ts Scene_Story_47
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_47_0_0808e3c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_47_0_0808e250:
    .word S_Story_47_0
    .word S_Story_47_1
    .word S_Story_47_2
    .word S_Story_47_3
    .word S_Story_47_4
    .word S_Story_47_5
    .word S_Story_47_6
    .word S_Story_47_7


_ts S_Story_47_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    ldr        r0,PTR_Cam_Set_0808e3c8
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


_nt S_Story_47_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e2a8
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e2a8:
    bl         Scene_IsStartPressed
    beq        LAB_0808e2b2
    bl         S_Story_47_SkipIfStart
LAB_0808e2b2:
    pop        {pc}


_ts S_Story_47_2
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808e2d2
    ldr        r0,PTR_Cam_Set_0808e3cc
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    mov        r0,#0x3c
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e2d2:
    bl         Scene_IsStartPressed
    beq        LAB_0808e2dc
    bl         S_Story_47_SkipIfStart
LAB_0808e2dc:
    pop        {pc}


_nt S_Story_47_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808e2fe
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
LAB_0808e2fe:
    bl         Scene_IsStartPressed
    beq        LAB_0808e308
    bl         S_Story_47_SkipIfStart
LAB_0808e308:
    pop        {pc}


_nt S_Story_47_4
    push       {r5}
    ldr        r0,PTR_ScenarioData_47_0808e3d0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_47_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808e33c
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e33c:
    bl         Scene_IsStartPressed
    beq        LAB_0808e346
    bl         S_Story_47_SkipIfStart
LAB_0808e346:
    pop        {pc}


_ts S_Story_47_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808e368
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808e368:
    pop        {pc}


_nt S_Story_47_7
    bl         Flag_SetPlayerActive
    push       {r5}
    mov        r0,#0xb7
    bl         Flag_SetBase
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808e3d4
    str        r1,[r0,#0x14]
    mov        r0,#0x2
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808e398:
    MapEntrance Map_Traffic_Light_Comp_5, d_nw, f(-6, -4, 0)


_ts S_Story_47_SkipIfStart
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

PTR_PTR_S_Story_47_0_0808e3c4:
    .word PTR_S_Story_47_0_0808e250

PTR_Cam_Set_0808e3c8:
    .word Cam_Set_0808e230

PTR_Cam_Set_0808e3cc:
    .word Cam_Set_0808e23a

PTR_ScenarioData_47_0808e3d0:
    .word ScenarioData_47

PTR_MapEntrance_0808e3d4:
    .word MapEntrance_0808e398
