#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end


MapEntranceOptions_0808703e:
    MapEntrance Map_School_Class_5A, d_s, f(47, 18, 0)
    .byte 0x0, 0x0, 0x1, 0x0

    .align 2, 0



_ts Scene_Story_17
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_17_0_08087198
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_17_0_08087060:
    .word S_Story_17_0
    .word S_Story_17_1
    .word S_Story_17_2
    .word S_Story_17_3
    .word S_Story_17_4
    .word S_Story_17_5
    .word S_Story_17_6


_ts S_Story_17_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_17_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_080870c2
    LoadMain world, r0, r7
    mov        r0,#0x33
    bl         PlayerAnimation_SetState
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    push       {r5}
    mov        r0,#T_Incident_Occurrence
    bl         Sound_ChangeSong
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_ScenarioData_17_0808719c
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080870c2:
    pop        {pc}


_ts S_Story_17_2
    LoadMain world, r0, r7
    mov        r0,#0x34
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_17_3
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_080870ea
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x8d
    bl         Sound_PlaySongImmediate
LAB_080870ea:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080870fc
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080870fc:
    bl         Scene_IsStartPressed
    beq        LAB_08087106
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
LAB_08087106:
    pop        {pc}


_ts S_Story_17_4
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_17_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08087146
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08087146:
    pop        {pc}


_ts S_Story_17_6
    ldr        r0,PTR_MapEntranceOptions_080871a0
    str        r0,[r5,#0x10]
    LoadMain world, r0, r7
    mov        r1,#0x3
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    ldr        r2,[r5,#0x10]
    strb       r1,[r0,#0x12]
    str        r2,[r0,#0x14]
    push       {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r0,[r0,#0x12]
    bl         World_ChangeMap
    pop        {r5}
    LoadMain world, r0, r0
    mov        r1,#0x15
    strb       r1,[r0,#0x6]
    push       {r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r5}
    Flag_SetBase 0xC4
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_17_0_08087198:
    .word PTR_S_Story_17_0_08087060

PTR_ScenarioData_17_0808719c:
    .word ScenarioData_17

PTR_MapEntranceOptions_080871a0:
    .word MapEntranceOptions_0808703e
