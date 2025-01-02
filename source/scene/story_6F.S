#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_6F
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_6F_0_080944e4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_6F_0_080942f4:
    .word S_Story_6F_0
    .word S_Story_6F_1
    .word S_Story_6F_2
    .word S_Story_6F_3
    .word S_Story_6F_4
    .word S_Story_6F_5
    .word S_Story_6F_6
    .word S_Story_6F_7
    .word S_Story_6F_8


_ts S_Story_6F_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803EA5C_080944e8
    bl         Map_LoadNPCList
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    pop        {pc}


_nt S_Story_6F_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0809435a
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809435a:
    pop        {pc}


_ts S_Story_6F_2
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809437a
    push       {r5}
    ldr        r0,PTR_ScenarioData_6F_080944ec
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809437a:
    pop        {pc}


_ts S_Story_6F_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809439a
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809439a:
    bl         Scene_IsStartPressed
    beq        LAB_080943a4
    bl         S_Story_6F_SkipIfStart
LAB_080943a4:
    pop        {pc}


_nt S_Story_6F_4
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080943f6
    push       {r5}
    mov        r0,#0x2a
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xcc
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_803EA28_080944f0
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
LAB_080943f6:
    pop        {pc}


_ts S_Story_6F_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08094416
    push       {r5}
    ldr        r0,PTR_ScenarioData_6F_080944ec
    mov        r1,#0x4
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08094416:
    pop        {pc}


_ts S_Story_6F_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809442a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809442a:
    bl         Scene_IsStartPressed
    beq        LAB_08094434
    bl         S_Story_6F_SkipIfStart
LAB_08094434:
    pop        {pc}


_nt S_Story_6F_7
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080944a2
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x2a
    neg        r0,r0
    lsl        r0,r0,#0x10
    mov        r1,#0xcc
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    beq        LAB_080944a2
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x0
    str        r1,[r0,#0x34]
    push       {r5}
    ldr        r7,PTR_NPCList_803EA28_080944f4
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
LAB_080944a2:
    pop        {pc}


_ts S_Story_6F_8
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080944c6
    push       {r5}
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    pop        {r5}
    Flag_SetBase 0xB0
    bl         Scene_UnloadAndResetStepCounter
LAB_080944c6:
    pop        {pc}


_ts S_Story_6F_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}

PTR_PTR_S_Story_6F_0_080944e4:
    .word PTR_S_Story_6F_0_080942f4

PTR_NPCList_803EA5C_080944e8:
    .word NPCList_803EA5C

PTR_ScenarioData_6F_080944ec:
    .word ScenarioData_6F

PTR_NPCList_803EA28_080944f0:
    .word NPCList_803EA28

PTR_NPCList_803EA28_080944f4:
    .word NPCList_803EA28
