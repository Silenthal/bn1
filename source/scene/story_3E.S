#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808d354:
    cam_set 68, -12, 0
    cam_end

    .align 2, 0



_ts Scene_Story_3E
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3E_0_0808d578
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3E_0_0808d36c:
    .word S_Story_3E_0
    .word S_Story_3E_1
    .word S_Story_3E_2
    .word S_Story_3E_3
    .word S_Story_3E_4
    .word S_Story_3E_5
    .word S_Story_3E_6
    .word S_Story_3E_7
    .word S_Story_3E_8
    .word S_Story_3E_9


_ts S_Story_3E_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_3E_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808d3fe
    ldr        r0,PTR_Cam_Set_0808d57c
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    LoadMain mapEventState, r7, r7
    mov        r0,#0x0
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0x9]
    mov        r0,#0x2
    strb       r0,[r7,#0xa]
    strb       r0,[r7,#0xb]
    push       {r5}
    mov        r0,#0x1a
    lsl        r0,r0,#0x10
    mov        r1,#0x18
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    mov        r0,#0x18
    bl         Entity_FreeAllMultiple
    ldr        r0,PTR_EntityAllocParams_803B310_0808d580
    bl         Entity_AllocList
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d3fe:
    pop        {pc}


_ts S_Story_3E_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d41c
    push       {r5}
    mov        r7,#0x0
    bl         Effect_Traffic_2_Create
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d41c:
    bl         Scene_IsStartPressed
    beq        LAB_0808d426
    bl         S_Story_3E_SkipIfStart
LAB_0808d426:
    pop        {pc}


_ts S_Story_3E_3
    push       {r5}
    ldr        r0,PTR_ScenarioData_3E_0808d584
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    mov        r0,#0x7d
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808d448
    bl         S_Story_3E_SkipIfStart
LAB_0808d448:
    pop        {pc}


_nt S_Story_3E_4
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d462
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d462:
    bl         Scene_IsStartPressed
    beq        LAB_0808d46c
    bl         S_Story_3E_SkipIfStart
LAB_0808d46c:
    pop        {pc}


_nt S_Story_3E_5
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808d48e
    LoadMain mapEventState, r7, r7
    mov        r0,#0x2
    strb       r0,[r7,#0x8]
    strb       r0,[r7,#0xa]
    mov        r0,#0x0
    strb       r0,[r7,#0x9]
    strb       r0,[r7,#0xb]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d48e:
    bl         Scene_IsStartPressed
    beq        LAB_0808d498
    bl         S_Story_3E_SkipIfStart
LAB_0808d498:
    pop        {pc}


_nt S_Story_3E_6
    push       {r5}
    ldr        r0,PTR_ScenarioData_3E_0808d584
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808d4b6
    bl         S_Story_3E_SkipIfStart
LAB_0808d4b6:
    pop        {pc}


_ts S_Story_3E_7
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d4d6
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d4d6:
    bl         Scene_IsStartPressed
    beq        LAB_0808d4e0
    bl         S_Story_3E_SkipIfStart
LAB_0808d4e0:
    pop        {pc}


_nt S_Story_3E_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d514
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    LoadMain world, r1, r1
    ldr        r1,[r1,#0x28]
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d514:
    pop        {pc}


_nt S_Story_3E_9
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xAE
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x34
    strb       r1,[r0,#0x6]
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808d588
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

MapEntrance_0808d550:
    MapEntrance Map_DenTown_Block_4, d_nw, f(26, 24, 0)


_ts S_Story_3E_SkipIfStart
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

PTR_PTR_S_Story_3E_0_0808d578:
    .word PTR_S_Story_3E_0_0808d36c

PTR_Cam_Set_0808d57c:
    .word Cam_Set_0808d354

PTR_EntityAllocParams_803B310_0808d580:
    .word EntityAllocParams_803B310

PTR_ScenarioData_3E_0808d584:
    .word ScenarioData_3E

PTR_MapEntrance_0808d588:
    .word MapEntrance_0808d550
