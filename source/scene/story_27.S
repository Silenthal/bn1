#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_27
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_27_0_080894dc
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_27_0_08089418:
    .word S_Story_27_0
    .word S_Story_27_1
    .word S_Story_27_2
    .word S_Story_27_3
    .word S_Story_27_4


_ts S_Story_27_0
    push       {r5}
    mov        r0,#0x2
    bl         Sound_StopSong
    pop        {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0xff
    strb       r0,[r7,#0x18]
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_27_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08089478
    push       {r5}
    ldr        r0,PTR_ScenarioData_27_080894e0
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08089478:
    pop        {pc}


_nt S_Story_27_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808948c
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808948c:
    bl         Scene_IsStartPressed
    beq        LAB_08089496
    bl         S_Story_27_SkipIfStart
LAB_08089496:
    pop        {pc}


_ts S_Story_27_3
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_27_4
    mov        r0,#0xbe
    bl         Flag_SetBase
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    mov        r0,#0x2
    bl         Sound_ChangeSong
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_Story_27_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_27_0_080894dc:
    .word PTR_S_Story_27_0_08089418

PTR_ScenarioData_27_080894e0:
    .word ScenarioData_27
