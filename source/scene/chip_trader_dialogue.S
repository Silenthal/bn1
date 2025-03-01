#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_ChipTraderDialogue
    push       {lr}
    ldr        r0,PTR_PTR_S_ChipTraderDialogue_0_08085fe4
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_ChipTraderDialogue_0_08085f64:
    .word S_ChipTraderDialogue_0
    .word S_ChipTraderDialogue_1
    .word S_ChipTraderDialogue_2


_ts S_ChipTraderDialogue_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_ChipTraderDialogue_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08085fc2
    LoadMain world, r0, r7
    push       {r5}
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r1,[r5,#Scene_dialogueIndex]
    sub        r1,#0x21
    mov        r2,#0x6
    mul        r1,r2
    push       {r5}
    ldr        r0,PTR_textDict_ChipTrader_08085fe8
    bl         Text_LoadDialogue
    pop        {r5}
    Scene_Next
LAB_08085fc2:
    pop        {pc}


_ts S_ChipTraderDialogue_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08085fe2
    push       {r5}
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08085fe2:
    pop        {pc}

PTR_PTR_S_ChipTraderDialogue_0_08085fe4:
    .word PTR_S_ChipTraderDialogue_0_08085f64

PTR_textDict_ChipTrader_08085fe8:
    .word textDict_ChipTrader
