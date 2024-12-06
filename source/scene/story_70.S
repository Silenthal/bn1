#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_70
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_70_0_08094590
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_70_0_08094504:
    .word S_Story_70_0
    .word S_Story_70_1
    .word S_Story_70_2
    .word S_Story_70_3
    .word S_Story_70_4


_ts S_Story_70_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_70_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_70_08094594
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_70_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0809454e
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809454e:
    bl         Scene_IsStartPressed
    beq        LAB_08094558
    bl         S_Story_70_SkipIfStart
LAB_08094558:
    pop        {pc}


_nt S_Story_70_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_70_4
    mov        r0,#0xb1
    bl         Flag_SetBase
    bl         Flag_SetPlayerActive
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_70_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_70_0_08094590:
    .word PTR_S_Story_70_0_08094504

PTR_ScenarioData_70_08094594:
    .word ScenarioData_70
