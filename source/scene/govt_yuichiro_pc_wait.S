#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Yuichiro_PC_Wait
    push       {lr}
    ldr        r0,PTR_PTR_S_Yuichiro_PC_Wait_0_0808b950
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Yuichiro_PC_Wait_0_0808b900:
    .word S_Yuichiro_PC_Wait_0
    .word S_Yuichiro_PC_Wait_1


_ts S_Yuichiro_PC_Wait_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}


_ts S_Yuichiro_PC_Wait_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808b94e
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808b94e:
    pop        {pc}

PTR_PTR_S_Yuichiro_PC_Wait_0_0808b950:
    .word PTR_S_Yuichiro_PC_Wait_0_0808b900
