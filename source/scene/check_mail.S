#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_CheckMail
    push       {lr}
    ldr        r0,PTR_PTR_S_CheckMail_0_08085b38
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_CheckMail_0_08085a88:
    .word S_CheckMail_0
    .word S_CheckMail_1
    .word S_CheckMail_2
    .word S_CheckMail_3


_ts S_CheckMail_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    bl         Flag_SetPlayerInactive
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_CheckMail_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08085aec
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    push       {r5}
    ldrb       r0,[r7,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    strb       r0,[r7,#PlayerLocation_direction]
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#Scene_sceneTimer]
    push       {r5}
    ldrb       r0,[r5,#Scene_areaDialogueIndex]
    add        r0,#0x2
    lsl        r0,r0,#0x2
    bl         PetStatusControl_SetState
    pop        {r5}
    Scene_Next
LAB_08085aec:
    pop        {pc}

    .align 2, 0



_ts S_CheckMail_2
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    bne        LAB_08085b0c
    push       {r5}
    ldrb       r0,[r5,#Scene_dialogueIndex]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08085b0c:
    pop        {pc}

    .align 2, 0



_ts S_CheckMail_3
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08085b36
    push       {r5}
    ldrb       r0,[r5,#Scene_areaDialogueIndex]
    lsl        r0,r0,#0x2
    bl         PetStatusControl_SetState
    bl         PlayerAnimation_Unlock
    bl         Flag_SetPlayerActive
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08085b36:
    pop        {pc}

PTR_PTR_S_CheckMail_0_08085b38:
    .word PTR_S_CheckMail_0_08085a88
