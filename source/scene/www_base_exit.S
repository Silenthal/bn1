#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_end

    .align 2, 0



_ts Scene_WWW_Base_Exit
    push       {lr}
    ldr        r0,PTR_PTR_S_WWW_Base_Exit_0_0809808c
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_WWW_Base_Exit_0_08097f48:
    .word S_WWW_Base_Exit_0
    .word S_WWW_Base_Exit_1
    .word S_WWW_Base_Exit_2
    .word S_WWW_Base_Exit_3
    .word S_WWW_Base_Exit_4
    .word S_WWW_Base_Exit_5


_ts S_WWW_Base_Exit_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}

    .align 2, 0



_ts S_WWW_Base_Exit_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08097fa6
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#World_playerLocation]
    ldrb       r0,[r0,#PlayerLocation_currDirMoveIndex]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#Scene_areaDialogueIndex]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    Scene_Next
LAB_08097fa6:
    pop        {pc}


_ts S_WWW_Base_Exit_2
    push       {lr}
    push       {r5}
    mov        r0,#TF_DialogueActive
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08097fca
    Flag_GetGate F_GATE_00
    bne        LAB_08097fc4
    mov        r0,#0x14
    strb       r0,[r5,#Scene_state_s0]
    pop        {pc}
LAB_08097fc4:
    Scene_Next
LAB_08097fca:
    pop        {pc}


_ts S_WWW_Base_Exit_3
    push       {lr}
    bl         S_WWW_Base_Exit_MovePlayer
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#World_playerLocation]
    add        r0,#PlayerLocation_pos_curr
    bl         Map_HandleCollisionEvent
    pop        {r5}
    ldrb       r1,[r5,#Scene_dialogueIndex]
    add        r1,#0x1
    cmp        r0,r1
    beq        LAB_08097ff4
    mov        r0,#0x10
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_08097ff4:
    pop        {pc}

    .align 2, 0



_ts S_WWW_Base_Exit_4
    push       {lr}
    bl         S_WWW_Base_Exit_MovePlayer
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    cmp        r0,#0x0
    bgt        LAB_08098024
    ldr        r7,PTR_DAT_08098090
    ldrb       r0,[r5,#Scene_dialogueIndex]
    push       {r5}
    ldrb       r0,[r7,r0]
    LoadMain world, r7, r7
    ldr        r7,[r7,#World_playerLocation]
    strb       r0,[r7,#PlayerLocation_direction]
    bl         PlayerAnimation_SetState
    pop        {r5}
    Scene_Next
LAB_08098024:
    pop        {pc}

    .align 2, 0


DAT_08098028:
    .byte 0x00
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x04
    .byte 0x05
    .byte 0x06
    .byte 0x07


_ts S_WWW_Base_Exit_5
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_WWW_Base_Exit_MovePlayer
    push       {lr}
    ldr        r7,PTR_PlayerAnimateArgs_ARRAY_08098094
    ldrb       r1,[r5,#Scene_dialogueIndex]
    lsl        r1,r1,#0x2
    add        r7,r7,r1
    push       {r5,r7}
    ldrb       r0,[r7,#0x0]
    bl         PlayerAnimation_SetState
    pop        {r5,r7}
    mov        r3,#0x1
    ldrsb      r0,[r7,r3]
    lsl        r0,r0,#0xc
    mov        r3,#0x2
    ldrsb      r1,[r7,r3]
    lsl        r1,r1,#0xc
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    pop        {pc}

PlayerAnimateArgs_ARRAY_0809806c:
    player_anim 8, 16, -16, -1
    player_anim 9, 16, 0, -1
    player_anim 10, 8, 8, -1
    player_anim 11, 0, 16, -1
    player_anim 12, -16, 16, -1
    player_anim 13, -16, 0, -1
    player_anim 14, -8, -8, -1
    player_anim 15, 0, -16, -1

PTR_PTR_S_WWW_Base_Exit_0_0809808c:
    .word PTR_S_WWW_Base_Exit_0_08097f48

PTR_DAT_08098090:
    .word DAT_08098028

PTR_PlayerAnimateArgs_ARRAY_08098094:
    .word PlayerAnimateArgs_ARRAY_0809806c
