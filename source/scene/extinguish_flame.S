#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_ExtinguishFlame
    push       {lr}
    ldr        r0,PTR_PTR_S_ExtinguishFlame_0_0808470c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_ExtinguishFlame_0_0808465c:
    .word S_ExtinguishFlame_0
    .word S_ExtinguishFlame_1
    .word S_ExtinguishFlame_2


_ts S_ExtinguishFlame_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_ExtinguishFlame_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080846ba
    LoadMain mapEventState, r0, r0
    ldrb       r1,[r5,#Scene_dialogueIndex]
    sub        r1,#0x20
    strb       r1,[r0,#MapEventState_b8]
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DialogueData_Oven_Comp_1_08084710
    mov        r1,#0x14
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_080846ba:
    pop        {pc}


_ts S_ExtinguishFlame_2
    push       {lr}
    push       {r5}
    Flag_GetBase 0xDB
    pop        {r5}
    beq        LAB_080846e8
    push       {r5}
    Flag_ClearBase 0xDB
    ldrb       r0,[r5,#Scene_dialogueIndex]
    sub        r0,#0x20
    push       {r0}
    add        r0,#0xa0
    bl         Flag_SetBase
    pop        {r0}
    add        r0,#0x0
    bl         Flag_SetIgnore
    pop        {r5}
LAB_080846e8:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084708
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    LoadMain mapEventState, r1, r0
    mov        r0,#0xff
    strb       r0,[r1,#MapEventState_b8]
    bl         Scene_MarkForUnloading
LAB_08084708:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_ExtinguishFlame_0_0808470c:
    .word PTR_S_ExtinguishFlame_0_0808465c

PTR_DialogueData_Oven_Comp_1_08084710:
    .word DialogueData_Oven_Comp_1
