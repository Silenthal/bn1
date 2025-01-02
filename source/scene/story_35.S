#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808c13c:
    cam_set 80, -40, 0
    cam_end

    .align 2, 0



_ts Scene_Story_35
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_35_0_0808c3cc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_35_0_0808c154:
    .word S_Story_35_0
    .word S_Story_35_1
    .word S_Story_35_2
    .word S_Story_35_3
    .word S_Story_35_4
    .word S_Story_35_5
    .word S_Story_35_6
    .word S_Story_35_7
    .word S_Story_35_8
    .word S_Story_35_9
    .word S_Story_35_10
    .word S_Story_35_11


_ts S_Story_35_0
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
    ldr        r0,PTR_Cam_Set_0808c3d0
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    pop        {pc}


_ts S_Story_35_1
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808c1da
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
LAB_0808c1da:
    pop        {pc}


_ts S_Story_35_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c204
    push       {r5}
    ldr        r0,PTR_ScenarioData_35_0808c3d4
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808c204
    bl         S_Story_35_SkipIfStart
LAB_0808c204:
    pop        {pc}


_nt S_Story_35_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c224
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c224:
    bl         Scene_IsStartPressed
    beq        LAB_0808c22e
    bl         S_Story_35_SkipIfStart
LAB_0808c22e:
    pop        {pc}


_ts S_Story_35_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c262
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803E6C8_0808c3d8
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c262:
    pop        {pc}


_ts S_Story_35_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c28c
    push       {r5}
    ldr        r0,PTR_ScenarioData_35_0808c3d4
    mov        r1,#0xf
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808c28c
    bl         S_Story_35_SkipIfStart
LAB_0808c28c:
    pop        {pc}


_nt S_Story_35_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c2ac
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c2ac:
    bl         Scene_IsStartPressed
    beq        LAB_0808c2b6
    bl         S_Story_35_SkipIfStart
LAB_0808c2b6:
    pop        {pc}


_ts S_Story_35_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c2ea
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803E6D8_0808c3dc
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c2ea:
    pop        {pc}


_ts S_Story_35_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c314
    push       {r5}
    ldr        r0,PTR_ScenarioData_35_0808c3d4
    mov        r1,#0x12
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808c314
    bl         S_Story_35_SkipIfStart
LAB_0808c314:
    pop        {pc}


_nt S_Story_35_9
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c334
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c334:
    bl         Scene_IsStartPressed
    beq        LAB_0808c33e
    bl         S_Story_35_SkipIfStart
LAB_0808c33e:
    pop        {pc}


_ts S_Story_35_10
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c360
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c360:
    pop        {pc}


_nt S_Story_35_11
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c3a2
    bl         PlayerAnimation_Unlock
    push       {r5}
    Flag_SetBase 0x90
    pop        {r5}
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808c3e0
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    LoadMain world, r0, r0
    ldr        r1,DAT_0808c3e4
    str        r1,[r0,#0x58]
    bl         Scene_UnloadAndResetStepCounter
LAB_0808c3a2:
    pop        {pc}

MapEntrance_0808c3a4:
    MapEntrance Map_ACDC_Lan_PC, d_s, f(-50, 0, 0)


_ts S_Story_35_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x28
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_35_0_0808c3cc:
    .word PTR_S_Story_35_0_0808c154

PTR_Cam_Set_0808c3d0:
    .word Cam_Set_0808c13c

PTR_ScenarioData_35_0808c3d4:
    .word ScenarioData_35

PTR_NPCList_803E6C8_0808c3d8:
    .word NPCList_803E6C8

PTR_NPCList_803E6D8_0808c3dc:
    .word NPCList_803E6D8

PTR_MapEntrance_0808c3e0:
    .word MapEntrance_0808c3a4

DAT_0808c3e4:
    .word 0x301
