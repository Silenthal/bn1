#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_AutoChipShop
    push       {lr}
    ldr        r0,PTR_PTR_S_AutoChipShop_0_08097f30
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_AutoChipShop_0_08097ea4:
    .word S_AutoChipShop_0
    .word S_AutoChipShop_1
    .word S_AutoChipShop_2


_ts S_AutoChipShop_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_AutoChipShop_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08097efa
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x5
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08097efa:
    pop        {pc}


_ts S_AutoChipShop_2
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097f2c
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    Flag_GetBase 0xA6
    beq        LAB_08097f28
    push       {r5}
    mov        r0,#0x0
    bl         World_StartShop
    pop        {r5}
LAB_08097f28:
    bl         Scene_UnloadAndResetStepCounter
LAB_08097f2c:
    pop        {pc}

    .align 2, 0


PTR_PTR_S_AutoChipShop_0_08097f30:
    .word PTR_S_AutoChipShop_0_08097ea4
