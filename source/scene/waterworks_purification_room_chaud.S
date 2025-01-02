#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Waterworks_Purification_Room_Chaud
    push       {lr}
    ldr        r0,PTR_PTR_S_Waterworks_Purification_Room_Chaud_0_0808b8e8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Waterworks_Purification_Room_Chaud_0_0808b850:
    .word S_Waterworks_Purification_Room_Chaud_0
    .word S_Waterworks_Purification_Room_Chaud_1
    .word S_Waterworks_Purification_Room_Chaud_2
    .word S_Waterworks_Purification_Room_Chaud_3


_ts S_Waterworks_Purification_Room_Chaud_0
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    bl         NPC_FindByIndex
    str        r0,[r5,#0x10]
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    eor        r1,r2
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         Effect_Chaud_1_Create
    pop        {r5}
    push       {r5}
    ldr        r0,PTR_DialogueData_Govt_Waterworks_Purification_Room_0808b8ec
    mov        r1,#0x1
    bl         Text_LoadDialogue
    pop        {r5}
    pop        {pc}


_ts S_Waterworks_Purification_Room_Chaud_1
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Waterworks_Purification_Room_Chaud_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808b8c2
    push       {r5}
    mov        r0,#0x8
    bl         Entity_FreeAllMultiple
    pop        {r5}
    ldr        r0,[r5,#0x10]
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    orr        r1,r2
    strb       r1,[r0,#0x0]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808b8c2:
    pop        {pc}


_ts S_Waterworks_Purification_Room_Chaud_3
    bl         Flag_SetPlayerActive
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    Flag_ClearBase 0xD8
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Waterworks_Purification_Room_Chaud_0_0808b8e8:
    .word PTR_S_Waterworks_Purification_Room_Chaud_0_0808b850

PTR_DialogueData_Govt_Waterworks_Purification_Room_0808b8ec:
    .word DialogueData_Govt_Waterworks_Purification_Room
