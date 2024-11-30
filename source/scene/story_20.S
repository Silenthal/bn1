#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    cam_set 128, -24, 0
    cam_end

    .align 2, 0



_ts Scene_Story_20
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_20_0_0808868c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_S_Story_20_0_080884ec:
    .word S_Story_20_0
    .word S_Story_20_1
    .word S_Story_20_2
    .word S_Story_20_3
    .word S_Story_20_4
    .word S_Story_20_5
    .word S_Story_20_6
    .word S_Story_20_7
    .word S_Story_20_8


_ts S_Story_20_0
    push       {r5}
    bl         PlayerAnimation_Lock
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Story_20_1
    bl         PlayerAnimation_GetState
    cmp        r0,#0x2
    bne        LAB_08088554
    mov        r0,#0x4c
    neg        r0,r0
    lsl        r0,r0,#0x10
    ldr        r1,DAT_08088690
    neg        r1,r1
    lsl        r1,r1,#0x10
    mov        r2,#0x40
    lsl        r2,r2,#0x10
    bl         PlayerAnimation_SetPosition
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    push       {r5}
    ldr        r0,PTR_ScenarioData_20_08088694
    mov        r1,#0x0
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088554:
    pop        {pc}


_nt S_Story_20_2
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_0808856c
    mov        r0,#0x81
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808856c:
    bl         Scene_IsStartPressed
    beq        LAB_08088576
    bl         S_Story_20_SkipIfStart
LAB_08088576:
    pop        {pc}


_ts S_Story_20_3
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    beq        LAB_080885a6
    mov        r1,#0x7
    and        r0,r1
    bne        LAB_080885bc
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    mov        r0,#0xff
    strb       r0,[r7,#0x15]
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    mov        r0,#0x36
    bl         PlayerAnimation_SetState
    mov        r0,#0xa0
    bl         Flag_SetBase
    b          LAB_080885bc
LAB_080885a6:
    mov        r0,#0xa1
    bl         Flag_SetBase
    mov        r0,#0x31
    bl         PlayerAnimation_SetState
    mov        r0,#0x5a
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080885bc:
    pop        {pc}


_nt S_Story_20_4
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    cmp        r0,#0x0
    bne        LAB_080885d4
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_080885d4:
    pop        {pc}


_nt S_Story_20_5
    push       {r5}
    ldr        r0,PTR_ScenarioData_20_08088694
    mov        r1,#0x3
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_nt S_Story_20_6
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08088608
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08088608:
    pop        {pc}


_nt S_Story_20_7
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0808864c
    mov        r0,#0xa1
    bl         Flag_SetBase
    mov        r0,#0xa6
    bl         Flag_SetBase
    push       {r5}
    mov        r0,#0x3
    bl         PlayerAnimation_SetState
    pop        {r5}
    push       {r5}
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    pop        {r5}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_0808864c:
    pop        {pc}


_nt S_Story_20_8
    mov        r0,r10
    ldr        r0,[r0,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08088678
    push       {r5}
    bl         Text_DisableDialogue
    bl         PlayerAnimation_Unlock
    mov        r0,#0x19
    bl         Flag_SetBase
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    mov        r1,#0x22
    strb       r1,[r0,#0x6]
    bl         Scene_UnloadAndResetStepCounter
LAB_08088678:
    pop        {pc}


_nt S_Story_20_SkipIfStart
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_20_0_0808868c:
    .word PTR_S_Story_20_0_080884ec

DAT_08088690:
    .word 0x1CC

PTR_ScenarioData_20_08088694:
    .word ScenarioData_20
