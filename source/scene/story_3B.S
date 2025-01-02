#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_0808cf88:
    cam_set -160, 218, 0
    cam_end

    .align 2, 0



_ts Scene_Story_3B
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_3B_0_0808d188
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_3B_0_0808cfa0:
    .word S_Story_3B_0
    .word S_Story_3B_1
    .word S_Story_3B_2
    .word S_Story_3B_3
    .word S_Story_3B_4
    .word S_Story_3B_5
    .word S_Story_3B_6
    .word S_Story_3B_7


_ts S_Story_3B_0
    push       {r5}
    bl         PlayerAnimation_Lock
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_3B_1
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d03c
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808d03c
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    ldr        r7,PTR_NPCList_8038F14_0808d18c
    bl         Map_LoadNPCList
    pop        {r5}
    ldr        r0,PTR_Cam_Set_0808d190
    bl         SceneCamera_Init
    bl         SceneCamera_Main
    push       {r5}
    mov        r0,#0x90
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xe2
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x5
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
LAB_0808d03c:
    pop        {pc}


_nt S_Story_3B_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d05c
    push       {r5}
    ldr        r0,PTR_ScenarioData_3B_0808d194
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d05c:
    bl         Scene_IsStartPressed
    beq        LAB_0808d066
    bl         S_Story_3B_SkipIfStart
LAB_0808d066:
    pop        {pc}


_ts S_Story_3B_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d084
    Flag_SetBase 0xA0
    mov        r0,#0xc8
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d084:
    bl         Scene_IsStartPressed
    beq        LAB_0808d08e
    bl         S_Story_3B_SkipIfStart
LAB_0808d08e:
    pop        {pc}


_ts S_Story_3B_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    bne        LAB_0808d0aa
    push       {r5}
    ldr        r0,PTR_ScenarioData_3B_0808d194
    mov        r1,#0x7
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d0aa:
    bl         Scene_IsStartPressed
    beq        LAB_0808d0b4
    bl         S_Story_3B_SkipIfStart
LAB_0808d0b4:
    pop        {pc}


_nt S_Story_3B_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808d0d4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808d0d4:
    bl         Scene_IsStartPressed
    beq        LAB_0808d0de
    bl         S_Story_3B_SkipIfStart
LAB_0808d0de:
    pop        {pc}


_ts S_Story_3B_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d112
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
LAB_0808d112:
    pop        {pc}


_ts S_Story_3B_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808d15c
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    push       {r5}
    Flag_SetBase 0xA1
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x33
    strb       r1,[r0,#0x6]
    push       {r5}
    LoadMain mapChange, r0, r7
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,PTR_MapEntrance_0808d198
    str        r1,[r0,#0x14]
    mov        r0,#0x0
    bl         World_ChangeMap
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808d15c:
    pop        {pc}

    .align 2, 0


MapEntrance_0808d160:
    MapEntrance Map_DenTown_Center, d_sw, f(-144, 226, 0)


_ts S_Story_3B_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_3B_0_0808d188:
    .word PTR_S_Story_3B_0_0808cfa0

PTR_NPCList_8038F14_0808d18c:
    .word NPCList_8038F14

PTR_Cam_Set_0808d190:
    .word Cam_Set_0808cf88

PTR_ScenarioData_3B_0808d194:
    .word ScenarioData_3B

PTR_MapEntrance_0808d198:
    .word MapEntrance_0808d160
