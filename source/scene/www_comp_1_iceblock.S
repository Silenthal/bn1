#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0



_ts Scene_WWW_Comp_1_IceBlock
    push       {lr}
    ldr        r0,PTR_PTR_S_WWW_Comp_1_IceBlock_0_080982b0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_WWW_Comp_1_IceBlock_0_08098200:
    .word S_WWW_Comp_1_IceBlock_0
    .word S_WWW_Comp_1_IceBlock_1
    .word S_WWW_Comp_1_IceBlock_2


_ts S_WWW_Comp_1_IceBlock_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_WWW_Comp_1_IceBlock_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0809825e
    LoadMain mapEventState, r0, r0
    ldrb       r1,[r5,#0x4]
    sub        r1,#0x20
    strb       r1,[r0,#0x8]
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DialogueData_WWW_Comp_1_080982b4
    mov        r1,#0x14
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0809825e:
    pop        {pc}


_ts S_WWW_Comp_1_IceBlock_2
    push       {lr}
    push       {r5}
    mov        r0,#0xf6
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_0809828c
    push       {r5}
    mov        r0,#0xf6
    bl         Flag_ClearBase
    ldrb       r0,[r5,#0x4]
    sub        r0,#0x20
    push       {r0}
    add        r0,#0xdf
    bl         Flag_SetBase
    pop        {r0}
    add        r0,#0x0
    bl         Flag_SetIgnore
    pop        {r5}
LAB_0809828c:
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080982ac
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    LoadMain mapEventState, r1, r0
    mov        r0,#0xff
    strb       r0,[r1,#0x8]
    bl         Scene_MarkForUnloading
LAB_080982ac:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_WWW_Comp_1_IceBlock_0_080982b0:
    .word PTR_S_WWW_Comp_1_IceBlock_0_08098200

PTR_DialogueData_WWW_Comp_1_080982b4:
    .word DialogueData_WWW_Comp_1
