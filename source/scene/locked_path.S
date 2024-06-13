#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_LockedPath
    push       {lr}
    ldr        r0,PTR_PTR_S_LockedPath_0_08082f38
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_LockedPath_0_08082df4:
    .word S_LockedPath_0
    .word S_LockedPath_1
    .word S_LockedPath_2
    .word S_LockedPath_3
    .word S_LockedPath_4
    .word S_LockedPath_5


_ts S_LockedPath_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08082e52
    push       {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    ldrb       r0,[r5,#0x5]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082e52:
    pop        {pc}


_ts S_LockedPath_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08082e68
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082e68:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_3
    push       {lr}
    bl         S_LockedPath_AnimatePlayer
    mov        r0,#0x10
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_4
    push       {lr}
    bl         S_LockedPath_AnimatePlayer
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bgt        LAB_08082ebc
    ldr        r7,PTR_DAT_08082f3c
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x7f
    and        r2,r1
    push       {r5}
    ldrb       r0,[r7,r2]
    mov        r2,#0x80
    tst        r1,r2
    beq        LAB_08082ea8
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
LAB_08082ea8:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    strb       r0,[r7,#0x10]
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082ebc:
    pop        {pc}

    .align 2, 0


DAT_08082ec0:
    .byte 0x00
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x04
    .byte 0x05
    .byte 0x06
    .byte 0x07


_ts S_LockedPath_5
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_LockedPath_AnimatePlayer
    push       {lr}
    ldr        r7,PTR_PlayerAnimateArgs_ARRAY_08082f40
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x7f
    and        r2,r1
    lsl        r2,r2,#0x2
    add        r7,r7,r2
    push       {r5,r7}
    add        r0,r1,#0x0
    mov        r2,#0x80
    tst        r1,r2
    beq        LAB_08082ef6
    add        r0,#0x4
    mov        r2,#0x7
    and        r0,r2
LAB_08082ef6:
    add        r0,#0x8
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

    .align 2, 0


PlayerAnimateArgs_ARRAY_08082f18:
    player_anim 8, 16, -16, -1
    player_anim 9, 16, 0, -1
    player_anim 10, 8, 8, -1
    player_anim 11, 0, 16, -1
    player_anim 12, -16, 16, -1
    player_anim 13, -16, 0, -1
    player_anim 14, -8, -8, -1
    player_anim 15, 0, -16, -1

PTR_PTR_S_LockedPath_0_08082f38:
    .word PTR_S_LockedPath_0_08082df4

PTR_DAT_08082f3c:
    .word DAT_08082ec0

PTR_PlayerAnimateArgs_ARRAY_08082f40:
    .word PlayerAnimateArgs_ARRAY_08082f18
