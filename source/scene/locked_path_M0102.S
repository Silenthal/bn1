#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_LockedPath_M0102
    push       {lr}
    ldr        r0,PTR_PTR_S_LockedPath_M0102_0_08083b9c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_LockedPath_M0102_0_08083a94:
    .word S_LockedPath_M0102_0
    .word S_LockedPath_M0102_1
    .word S_LockedPath_M0102_2
    .word S_LockedPath_M0102_3
    .word S_LockedPath_M0102_4
    .word S_LockedPath_M0102_5


_ts S_LockedPath_M0102_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_M0102_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08083afa
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
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r0,[r0,#0x6]
    ldr        r1,PTR_DAT_08083ba0
    ldrb       r0,[r1,r0]
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083afa:
    pop        {pc}

DAT_08083afc:
    .byte -1
    .byte -1
    .byte -1
    .byte 0x10
    .byte 0x15
    .byte 0x1A
    .byte -1
    .byte -1
    .byte -1

    .align 2, 0



_ts S_LockedPath_M0102_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08083b1c
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083b1c:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_M0102_3
    push       {lr}
    bl         S_LockedPath_M0102_AnimatePlayer
    push       {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08083b44
    mov        r0,#0x10
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083b44:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_M0102_4
    push       {lr}
    bl         S_LockedPath_M0102_AnimatePlayer
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bgt        LAB_08083b68
    push       {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08083b68:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_M0102_5
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_LockedPath_M0102_AnimatePlayer
    push       {lr}
    push       {r5}
    mov        r0,#0xf
    bl         PlayerAnimation_SetState
    pop        {r5}
    mov        r0,#0x0
    mov        r1,#0x1
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x0
    push       {r5}
    bl         PlayerAnimation_Move
    pop        {r5}
    pop        {pc}

PTR_PTR_S_LockedPath_M0102_0_08083b9c:
    .word PTR_S_LockedPath_M0102_0_08083a94

PTR_DAT_08083ba0:
    .word DAT_08083afc
