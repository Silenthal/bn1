#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Ice_Slide
    push       {lr}
    ldr        r0,PTR_PTR_S_Ice_Slide_0_0808c128
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Ice_Slide_0_0808be60:
    .word S_Ice_Slide_0
    .word S_Ice_Slide_1
    .word S_Ice_Slide_2
    .word S_Ice_Slide_3
    .word S_Ice_Slide_4
    .word S_Ice_Slide_5


_ts S_Ice_Slide_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    bl         PlayerAnimation_Lock
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts S_Ice_Slide_1
    push       {lr}
    push       {r5}
    bl         PlayerAnimation_GetState
    pop        {r5}
    cmp        r0,#0x2
    bne        LAB_0808becc
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    add        r0,#0x3b
    bl         PlayerAnimation_SetState
    bl         DisableElevationCheck
    pop        {r5}
    ldr        r0,PTR_gPlayerAnimation_0808c12c
    str        r0,[r5,#0x24]
    mov        r0,#0x80
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x10]
    str        r0,[r5,#0x14]
    str        r0,[r5,#0x18]
    mov        r0,#0x0
    str        r0,[r5,#0x20]
    mov        r0,#0xe8
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_0808becc:
    pop        {pc}

    .align 2, 0



_ts S_Ice_Slide_2
    push       {lr}
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionElevation
    add        r2,r0,#0x0
    pop        {r5}
    ldr        r0,[r5,#0x24]
    ldr        r1,[r0,#0x10]
    asr        r1,r1,#0x10
    cmp        r2,r1
    bge        LAB_0808bef4
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    b          LAB_0808bf74
LAB_0808bef4:
    bl         S_Ice_Slide_HandleCollisionDirection
    ldr        r0,[r5,#0x24]
    ldr        r1,[r0,#0x8]
    ldr        r2,[r5,#0x10]
    ldr        r3,[r0,#0xc]
    ldr        r4,[r5,#0x14]
    ldr        r6,[r0,#0x10]
    ldr        r7,[r5,#0x18]
    str        r1,[r5,#0x10]
    str        r3,[r5,#0x14]
    str        r6,[r5,#0x18]
    cmp        r1,r2
    bne        LAB_0808bf2a
    cmp        r3,r4
    bne        LAB_0808bf2a
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldrb       r0,[r7,#0x10]
    add        r0,#0x4
    mov        r1,#0x7
    and        r0,r1
    strb       r0,[r7,#0x10]
    mov        r0,#0xe8
    bl         Sound_PlaySongImmediate
LAB_0808bf2a:
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    pop        {r5}
    cmp        r0,#0x10
    beq        LAB_0808bf74
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    bne        LAB_0808bf5c
    cmp        r0,#0x10
    blt        LAB_0808bf5c
    cmp        r0,#0x15
    bgt        LAB_0808bf5c
    sub        r0,#0x11
    add        r0,#0xf0
    bl         Flag_GetBase
    beq        LAB_0808bf74
LAB_0808bf5c:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r0,[r7,#0x24]
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    push       {r5}
    bl         PlayerAnimation_SetPosition
    pop        {r5}
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_0808bf74:
    pop        {pc}

    .align 2, 0



_ts S_Ice_Slide_3
    push       {lr}
    push       {r5}
    ldr        r0,[r5,#0x24]
    ldrb       r0,[r0,#0x2]
    sub        r0,#0x3b
    bl         PlayerAnimation_SetState
    bl         Flag_SetPlayerActive
    bl         PlayerAnimation_Unlock
    bl         EnableElevationCheck
    pop        {r5}
    bl         Scene_MarkForUnloading
    pop        {pc}

    .align 2, 0



_ts S_Ice_Slide_4
    push       {lr}
    bl         S_Ice_Slide_HoldDirectionChange
    beq        LAB_0808bfa8
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_0808bfa8:
    pop        {pc}

    .align 2, 0



_ts S_Ice_Slide_5
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0808bfcc
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    push       {r5}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r0,[r7,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionElevation
    add        r2,r0,#0x0
    pop        {r5}
    str        r2,[r5,#0x28]
LAB_0808bfcc:
    ldr        r2,[r5,#0x28]
    ldr        r0,[r5,#0x24]
    ldr        r1,[r0,#0x10]
    asr        r1,r1,#0x10
    cmp        r2,r1
    bge        LAB_0808bfec
    ldr        r3,[r5,#0x20]
    add        r3,#0x2
    str        r3,[r5,#0x20]
    sub        r1,r1,r3
    strh       r1,[r0,#0x12]
    cmp        r2,r1
    blt        LAB_0808c03c
    strh       r2,[r0,#0x12]
    mov        r3,#0x0
    str        r3,[r5,#0x20]
LAB_0808bfec:
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    push       {r5}
    sub        sp,#0x18
    mov        r0,sp
    ldr        r7,[r5,#0x24]
    ldr        r1,[r7,#0x8]
    str        r1,[sp,#0x0]
    str        r1,[sp,#0xc]
    ldr        r1,[r7,#0xc]
    str        r1,[sp,#0x4]
    str        r1,[sp,#0x10]
    ldr        r1,[r7,#0x10]
    str        r1,[sp,#0x8]
    str        r1,[sp,#0x14]
    bl         Map_HandleCollisionEvent
    add        sp,#0x18
    pop        {r5}
    cmp        r0,#0x10
    beq        LAB_0808c03c
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x6]
    lsr        r7,r7,#0x4
    cmp        r7,#0x2
    bne        LAB_0808c038
    cmp        r0,#0x10
    blt        LAB_0808c038
    cmp        r0,#0x15
    bgt        LAB_0808c038
    sub        r0,#0x11
    add        r0,#0xf0
    bl         Flag_GetBase
    beq        LAB_0808c03c
LAB_0808c038:
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
LAB_0808c03c:
    pop        {pc}

    .align 2, 0



_ts S_Ice_Slide_HandleCollisionDirection
    push       {r5,lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    ldr        r3,[r7,#0x24]
    ldr        r4,[r7,#0x28]
    push       {r3,r4}
    ldrb       r0,[r7,#0x10]
    lsl        r0,r0,#0x2
    ldr        r5,PTR_PlayerAnimateArgs_ARRAY_0808c130
    add        r5,r5,r0
    mov        r2,#0x1
    ldrsb      r0,[r5,r2]
    lsl        r0,r0,#0xc
    mov        r2,#0x2
    ldrsb      r1,[r5,r2]
    lsl        r1,r1,#0xc
    add        r3,r3,r0
    str        r3,[r7,#0x24]
    add        r4,r4,r1
    str        r4,[r7,#0x28]
    push       {r3,r4,r7}
    mov        r0,#0x24
    add        r0,r0,r7
    bl         Map_HandleCollisionBoundary
    mov        r8,r0
    pop        {r3,r4,r7}
    ldr        r0,[r7,#0x24]
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    push       {r0,r1,r2,r3,r4,r7}
    bl         PlayerAnimation_SetPosition
    pop        {r0,r1,r2,r3,r4,r7}
    pop        {r3,r4}
    str        r3,[r7,#0x24]
    str        r4,[r7,#0x28]
    mov        r5,r8
    mov        r6,#0x1
    tst        r5,r6
    bne        LAB_0808c09e
    mov        r6,#0x2
    tst        r5,r6
    bne        LAB_0808c0b2
    ldrb       r0,[r7,#0x10]
    b          LAB_0808c0c6
LAB_0808c09e:
    sub        r1,r1,r4
    cmp        r1,#0x0
    bgt        LAB_0808c0aa
    blt        LAB_0808c0ae
    ldrb       r0,[r7,#0x10]
    b          LAB_0808c0c6
LAB_0808c0aa:
    mov        r0,#0x3
    b          LAB_0808c0c6
LAB_0808c0ae:
    mov        r0,#0x7
    b          LAB_0808c0c6
LAB_0808c0b2:
    sub        r0,r0,r3
    cmp        r0,#0x0
    bgt        LAB_0808c0be
    blt        LAB_0808c0c2
    ldrb       r0,[r7,#0x10]
    b          LAB_0808c0c6
LAB_0808c0be:
    mov        r0,#0x1
    b          LAB_0808c0c6
LAB_0808c0c2:
    mov        r0,#0x5
    b          LAB_0808c0c6
LAB_0808c0c6:
    strb       r0,[r7,#0x10]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PlayerAnimateArgs_ARRAY_0808c134
    add        r7,r7,r0
    ldrb       r0,[r7,#0x0]
    bl         PlayerAnimation_SetState
    pop        {r5,pc}

    .align 2, 0


PlayerAnimateArgs_ARRAY_0808c0d8:
    player_anim 59, 64, -64, -1
    player_anim 60, 64, 0, -1
    player_anim 61, 32, 32, -1
    player_anim 62, 0, 64, -1
    player_anim 63, -64, 64, -1
    player_anim 64, -64, 0, -1
    player_anim 65, -32, -32, -1
    player_anim 66, 0, -64, -1


_ts S_Ice_Slide_HoldDirectionChange
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r1,[r7,#0x0]
    mov        r0,#0xf0
    and        r0,r1
    beq        LAB_0808c116
    lsr        r0,r0,#0x4
    ldr        r7,PTR_BYTE_ARRAY_0808c138
    ldrb       r0,[r7,r0]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r7,[r7,#0x28]
    strb       r0,[r7,#0x10]
    mov        r0,#0x1
LAB_0808c116:
    pop        {pc}

BYTE_ARRAY_0808c118:
    .byte -1
    .byte 0x02
    .byte 0x06
    .byte -1
    .byte 0x00
    .byte 0x01
    .byte 0x07
    .byte -1
    .byte 0x04
    .byte 0x03
    .byte 0x05
    .byte -1
    .byte -1
    .byte -1
    .byte -1
    .byte -1

PTR_PTR_S_Ice_Slide_0_0808c128:
    .word PTR_S_Ice_Slide_0_0808be60

PTR_gPlayerAnimation_0808c12c:
    .word gPlayerAnimation

PTR_PlayerAnimateArgs_ARRAY_0808c130:
    .word PlayerAnimateArgs_ARRAY_0808c0d8

PTR_PlayerAnimateArgs_ARRAY_0808c134:
    .word PlayerAnimateArgs_ARRAY_0808c0d8

PTR_BYTE_ARRAY_0808c138:
    .word BYTE_ARRAY_0808c118
