#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Dialogue
    push       {lr}
    ldr        r0,PTR_PTR_S_Dialogue_0_08084984
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Dialogue_0_0808490c:
    .word S_Dialogue_0
    .word S_Dialogue_1
    .word S_Dialogue_2


_ts S_Dialogue_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_Dialogue_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08084962
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08084962:
    pop        {pc}


_ts S_Dialogue_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08084982
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08084982:
    pop        {pc}

PTR_PTR_S_Dialogue_0_08084984:
    .word PTR_S_Dialogue_0_0808490c
