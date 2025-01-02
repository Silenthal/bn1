#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_2A
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_2A_0_08089c20
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_2A_0_08089b94:
    .word S_Story_2A_0
    .word S_Story_2A_1
    .word S_Story_2A_2
    .word S_Story_2A_3
    .word S_Story_2A_4


_ts S_Story_2A_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_2A_1
    push       {r5}
    ldr        r0,PTR_ScenarioData_2A_08089c24
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_2A_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08089bde
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089bde:
    bl         Scene_IsStartPressed
    beq        LAB_08089be8
    bl         S_Story_2A_SkipIfStart
LAB_08089be8:
    pop        {pc}


_nt S_Story_2A_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_2A_4
    Flag_SetBase 0xB3
    bl         Flag_SetPlayerActive
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_2A_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_2A_0_08089c20:
    .word PTR_S_Story_2A_0_08089b94

PTR_ScenarioData_2A_08089c24:
    .word ScenarioData_2A
