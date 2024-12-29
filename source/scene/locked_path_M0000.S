#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    cam_end

    .align 2, 0


_ts Scene_LockedPath_School_Class_5A
    push       {lr}
    ldr        r0,PTR_PTR_S_LockedPath_School_Class_5A_0_08083050
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_LockedPath_School_Class_5A_0_08082f58:
    .word S_LockedPath_School_Class_5A_0
    .word S_LockedPath_School_Class_5A_1
    .word S_LockedPath_School_Class_5A_2
    .word S_LockedPath_School_Class_5A_3
    .word S_LockedPath_School_Class_5A_4
    .word S_LockedPath_School_Class_5A_5


_ts S_LockedPath_School_Class_5A_0
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_School_Class_5A_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_08082fb6
    push       {r5}
    LoadMain world, r0, r0
    ldr        r0,[r0,#0x28]
    ldrb       r0,[r0,#0x14]
    mov        r1,#0x7
    and        r0,r1
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x7
    bl         Text_LoadAreaDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082fb6:
    pop        {pc}


_ts S_LockedPath_School_Class_5A_2
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08082fcc
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082fcc:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_School_Class_5A_3
    push       {lr}
    bl         S_LockedPath_School_Class_5A_AnimatePlayer
    push       {r5}
    LoadMain world, r0, r7
    ldr        r0,[r0,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_08082ff8
    cmp        r0,#0x2
    beq        LAB_08082ff8
    mov        r0,#0x10
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082ff8:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_School_Class_5A_4
    push       {lr}
    bl         S_LockedPath_School_Class_5A_AnimatePlayer
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bgt        LAB_0808301c
    push       {r5}
    mov        r0,#0x7
    bl         PlayerAnimation_SetState
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808301c:
    pop        {pc}

    .align 2, 0



_ts S_LockedPath_School_Class_5A_5
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_Unlock
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
    pop        {pc}


_ts S_LockedPath_School_Class_5A_AnimatePlayer
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

PTR_PTR_S_LockedPath_School_Class_5A_0_08083050:
    .word PTR_S_LockedPath_School_Class_5A_0_08082f58
