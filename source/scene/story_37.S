#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Story_37
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_37_0_0808c718
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_37_0_0808c5b4:
    .word S_Story_37_0
    .word S_Story_37_1
    .word S_Story_37_2
    .word S_Story_37_3
    .word S_Story_37_4
    .word S_Story_37_5
    .word S_Story_37_6


_ts S_Story_37_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_37_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_0808c612
    push       {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c612
    push       {r5}
    ldr        r7,DAT_0808c71c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x50
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c612:
    pop        {pc}


_ts S_Story_37_2
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0808c638
    push       {r5}
    ldr        r0,PTR_ScenarioData_37_0808c720
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c638:
    bl         Scene_IsStartPressed
    beq        LAB_0808c642
    bl         S_Story_37_SkipIfStart
LAB_0808c642:
    pop        {pc}


_ts S_Story_37_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808c660
    mov        r0,#0x96
    bl         Flag_SetBase
    mov        r0,#0x50
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c660:
    bl         Scene_IsStartPressed
    beq        LAB_0808c66a
    bl         S_Story_37_SkipIfStart
LAB_0808c66a:
    pop        {pc}


_ts S_Story_37_4
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_0808c688
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808c688:
    bl         Scene_IsStartPressed
    beq        LAB_0808c692
    bl         S_Story_37_SkipIfStart
LAB_0808c692:
    pop        {pc}


_ts S_Story_37_5
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c6de
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8030004_0808c724
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
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
LAB_0808c6de:
    pop        {pc}


_ts S_Story_37_6
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808c6fe
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0x95
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808c6fe:
    pop        {pc}


_ts S_Story_37_SkipIfStart
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    pop        {pc}

PTR_PTR_S_Story_37_0_0808c718:
    .word PTR_S_Story_37_0_0808c5b4

DAT_0808c71c:
    .word NPCList_80300F8

PTR_ScenarioData_37_0808c720:
    .word ScenarioData_37

PTR_NPCList_8030004_0808c724:
    .word NPCList_8030004
