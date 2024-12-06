#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Dentown_Center_Chaud_Undernet
    push       {lr}
    ldr        r0,PTR_PTR_S_Dentown_Center_Chaud_Undernet_0_08097da4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Dentown_Center_Chaud_Undernet_0_08097c48:
    .word S_Dentown_Center_Chaud_Undernet_0
    .word S_Dentown_Center_Chaud_Undernet_1
    .word S_Dentown_Center_Chaud_Undernet_2
    .word S_Dentown_Center_Chaud_Undernet_3
    .word S_Dentown_Center_Chaud_Undernet_4
    .word S_Dentown_Center_Chaud_Undernet_5
    .word S_Dentown_Center_Chaud_Undernet_6


_ts S_Dentown_Center_Chaud_Undernet_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Dentown_Center_Chaud_Undernet_1
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097ce6
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08097ce6
    mov        r0,#0x4
    bl         NPC_FindByIndex
    str        r0,[r5,#0x10]
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    eor        r1,r2
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         Effect_Chaud_2_Create
    pop        {r5}
    mov        r0,#0x86
    lsl        r0,r0,#0x10
    mov        r1,#0x3c
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    bl         PlayerAnimation_SetPosition
    bl         DisableBoundaryCheck
    mov        r0,#0x1
    bl         PlayerAnimation_SetState
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0x1
    strb       r0,[r7,#0x10]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097ce6:
    pop        {pc}


_ts S_Dentown_Center_Chaud_Undernet_2
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097d06
    push       {r5}
    ldr        r0,PTR_DialogueData_DenTown_Center_08097da8
    mov        r1,#0x56
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097d06:
    pop        {pc}


_ts S_Dentown_Center_Chaud_Undernet_3
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097d48
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    pop        {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    orr        r1,r2
    strb       r1,[r0,#0x0]
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_8039828_08097dac
    bl         Entity_AllocList
    pop        {r5}
    push       {r5}
    mov        r0,r10
    ldr        r5,[r0,#0x24]
    bl         Traffic_Init
    pop        {r5}
    mov        r0,#0x78
    strb       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097d48:
    pop        {pc}


_nt S_Dentown_Center_Chaud_Undernet_4
    ldrb       r0,[r5,#0x8]
    sub        r0,#0x1
    strb       r0,[r5,#0x8]
    tst        r0,r0
    bne        LAB_08097d66
    push       {r5}
    ldr        r0,PTR_DialogueData_DenTown_Center_08097da8
    mov        r1,#0x5c
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097d66:
    pop        {pc}


_ts S_Dentown_Center_Chaud_Undernet_5
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097d7a
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08097d7a:
    pop        {pc}


_ts S_Dentown_Center_Chaud_Undernet_6
    bl         EnableBoundaryCheck
    bl         PlayerAnimation_Unlock
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x97
    bl         Flag_SetBase
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Dentown_Center_Chaud_Undernet_0_08097da4:
    .word PTR_S_Dentown_Center_Chaud_Undernet_0_08097c48

PTR_DialogueData_DenTown_Center_08097da8:
    .word DialogueData_DenTown_Center

PTR_EntityAllocParams_8039828_08097dac:
    .word EntityAllocParams_8039828
