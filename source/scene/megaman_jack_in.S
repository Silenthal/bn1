#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_MegaManJackIn
    push       {lr}
    ldr        r0,PTR_PTR_S_MegaManJackIn_0_08084190
    ldrb       r1,[r5,#Scene_state_s0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_MegaManJackIn_0_08084080:
    .word S_MegaManJackIn_0
    .word S_MegaManJackIn_1
    .word S_MegaManJackIn_2
    .word S_MegaManJackIn_3


_ts S_MegaManJackIn_0
    push       {lr}
    push       {r5}
    Flag_SetSystem F_SYSTEM_JACK_IN
    pop        {r5}
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    Scene_Next
    pop        {pc}


_ts S_MegaManJackIn_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_080840d4
    push       {r5}
    mov        r0,#0x28
    bl         PlayerAnimation_SetState
    mov        r0,#0xde
    bl         Sound_PlaySE
    pop        {r5}
    Scene_Next
LAB_080840d4:
    pop        {pc}

    .align 2, 0



_ts S_MegaManJackIn_2
    push       {lr}
    push       {r5}
    LoadMain world, r0, r0
    ldr        r5,[r0,#0x28]
    bl         SpritePtr_GetFrameStatus
    pop        {r5}
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080840f8
    ldrb       r0,[r5,#Scene_areaDialogueIndex]
    strh       r0,[r5,#Scene_sceneTimer]
    Scene_Next
LAB_080840f8:
    pop        {pc}

    .align 2, 0



_ts S_MegaManJackIn_3
    push       {lr}
    ldrh       r0,[r5,#Scene_sceneTimer]
    tst        r0,r0
    beq        LAB_08084110
    bl         S_MegaManJackIn_AnimatePlayer
    ldrh       r0,[r5,#Scene_sceneTimer]
    sub        r0,#0x1
    strh       r0,[r5,#Scene_sceneTimer]
    b          LAB_0808413e
LAB_08084110:
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x44]
    bl         PlayerAnimation_SetState
    Flag_ClearSystem F_SYSTEM_JACK_IN
    pop        {r5}
    ldrb       r1,[r5,#Scene_dialogueIndex]
    tst        r1,r1
    bne        LAB_08084132
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
LAB_08084132:
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_0808413e:
    pop        {pc}


_ts S_MegaManJackIn_AnimatePlayer
    push       {lr}
    LoadMain world, r7, r7
    ldr        r1,[r7,#0x44]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PlayerAnimateArgs_ARRAY_08084194
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

PlayerAnimateArgs_ARRAY_08084170:
    player_anim 8, 16, -16, -1
    player_anim 9, 16, 0, -1
    player_anim 10, 8, 8, -1
    player_anim 11, 0, 16, -1
    player_anim 12, -16, 16, -1
    player_anim 13, -16, 0, -1
    player_anim 14, -8, -8, -1
    player_anim 15, 0, -16, -1

PTR_PTR_S_MegaManJackIn_0_08084190:
    .word PTR_S_MegaManJackIn_0_08084080

PTR_PlayerAnimateArgs_ARRAY_08084194:
    .word PlayerAnimateArgs_ARRAY_08084170
