#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Traffic
    push       {lr}
    ldr        r0,PTR_PTR_E_Traffic_0_Init_0807ee00
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Traffic_0_Init_0807ebe8:
    .word E_Traffic_0_Init
    .word E_Traffic_1_Main
    .word E_Traffic_2_Free


_ts E_Traffic_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    ldrb       r1,[r5,#Effect_family_b1]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_USHORT_ARRAY_0807ee04
    ldr        r1,[r0,r1]
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    bne        LAB_0807ec20
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    ldr        r1,PTR_BYTE_ARRAY_0807ee08
    ldrb       r0,[r1,r0]
    str        r0,[r5,#Effect_obj_6C]
    bl         SpritePtr_SetPaletteIndex
LAB_0807ec20:
    ldrb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    bne        LAB_0807ec46
    mov        r0,#0x2
LAB_0807ec46:
    bl         SpritePtr_SetPriority
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    bne        LAB_0807ec56
    mov        r0,#0x30
    str        r0,[r5,#Effect_obj_68]
    b          LAB_0807ec5a
LAB_0807ec56:
    ldr        r0,DAT_0807ee0c
    str        r0,[r5,#Effect_obj_68]
LAB_0807ec5a:
    ldrb       r0,[r5,#Effect_family_family]
    cmp        r0,#0x1
    bne        LAB_0807ec6c
    mov        r0,#0x30
    lsl        r0,r0,#0xc
    str        r0,[r5,#Effect_obj_60]
    mov        r0,#0x0
    str        r0,[r5,#Effect_obj_64]
    b          LAB_0807ec88
LAB_0807ec6c:
    cmp        r0,#0x2
    bne        LAB_0807ec7c
    mov        r0,#0x30
    lsl        r0,r0,#0xc
    str        r0,[r5,#Effect_obj_64]
    mov        r0,#0x0
    str        r0,[r5,#Effect_obj_60]
    b          LAB_0807ec88
LAB_0807ec7c:
    mov        r0,#0x30
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#Effect_obj_64]
    mov        r0,#0x0
    str        r0,[r5,#Effect_obj_60]
LAB_0807ec88:
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}

    .align 2, 0


BYTE_ARRAY_0807ec90:
    .byte 0x00
    .byte 0x01
    .byte 0x02

    .align 2, 0


USHORT_ARRAY_0807ec94:
    .short 0xD
    .short 0x0
    .short 0x104

    .align 2, 0



_ts E_Traffic_1_Main
    push       {lr}
    ldr        r0,[r5,#Effect_obj_68]
    cmp        r0,#0x1e
    bne        LAB_0807ecb4
    ldrb       r1,[r5,#Effect_family_b1]
    cmp        r1,#0x1
    beq        LAB_0807ecb4
    push       {r0}
    mov        r0,#0xb8
    bl         Sound_PlaySE
    pop        {r0}
LAB_0807ecb4:
    sub        r0,#0x1
    str        r0,[r5,#Effect_obj_68]
    bne        LAB_0807eccc
    ldrb       r1,[r5,#Effect_family_b1]
    cmp        r1,#0x1
    beq        LAB_0807ecc6
    mov        r0,#0xb9
    bl         Sound_PlaySE
LAB_0807ecc6:
    mov        r0,#0x2
    strb       r0,[r5,#Effect_state_s0]
    b          LAB_0807ecdc
LAB_0807eccc:
    ldr        r0,[r5,#Effect_pos_curr_x]
    ldr        r1,[r5,#Effect_obj_60]
    add        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_x]
    ldr        r0,[r5,#Effect_pos_curr_y]
    ldr        r1,[r5,#Effect_obj_64]
    add        r0,r0,r1
    str        r0,[r5,#Effect_pos_curr_y]
LAB_0807ecdc:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_Traffic_2_Free
    ldrb       r1,[r5,#Effect_family_b1]
    tst        r1,r1
    bne        LAB_0807ed88
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    push       {r5}
    bl         Effect_TrafficExplosion_1_Create
    pop        {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    mov        r4,#0x0
    ldr        r6,[r5,#Effect_obj_6C]
    lsl        r6,r6,#0x8
    orr        r4,r6
    push       {r5}
    bl         Effect_TrafficCarParts_Create
    pop        {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    mov        r4,#0x0
    ldr        r6,[r5,#Effect_obj_6C]
    lsl        r6,r6,#0x8
    orr        r4,r6
    push       {r5}
    bl         Effect_TrafficCarParts_Create
    pop        {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    mov        r4,#0x1
    ldr        r6,[r5,#Effect_obj_6C]
    lsl        r6,r6,#0x8
    orr        r4,r6
    push       {r5}
    bl         Effect_TrafficCarParts_Create
    pop        {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    mov        r4,#0x2
    ldr        r6,[r5,#Effect_obj_6C]
    lsl        r6,r6,#0x8
    orr        r4,r6
    push       {r5}
    bl         Effect_TrafficCarParts_Create
    pop        {r5}
    ldrh       r1,[r5,#0x2A]
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2E]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsl        r3,r3,#0x10
    mov        r4,#0x3
    ldr        r6,[r5,#Effect_obj_6C]
    lsl        r6,r6,#0x8
    orr        r4,r6
    push       {r5}
    bl         Effect_TrafficCarParts_Create
    pop        {r5}
LAB_0807ed88:
    bl         Effect_Free
    pop        {pc}


_nt Effect_Traffic_1_Create
    push       {lr}
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_0807ee10
    mov        r2,#0x8
    mul        r2,r7
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r4,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x1f
    bl         Effect_Alloc
    ldrb       r1,[r5,#Effect_family_family]
    strb       r1,[r5,#Effect_frameIndexCurr]
    mov        r1,#0x0
    strb       r1,[r5,#Effect_family_b1]
    pop        {pc}

    .align 2, 0


USHORT_ARRAY_ARRAY_0807edb8:
    .short 0xFF5E
    .short 0xE
    .short 0x0
    .short 0x1
    .short 0x2
    .short 0xA8
    .short 0x0
    .short 0x7


_ts Effect_Traffic_2_Create
    push       {lr}
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_0807ee14
    mov        r2,#0x8
    mul        r2,r7
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r4,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x1f
    bl         Effect_Alloc
    ldrb       r1,[r5,#Effect_family_family]
    strb       r1,[r5,#Effect_frameIndexCurr]
    mov        r1,#0x1
    strb       r1,[r5,#Effect_family_b1]
    pop        {pc}

USHORT_ARRAY_ARRAY_0807edf0:
    .short 0x64
    .short 0x140
    .short 0x0
    .short 0x7
    .short 0xFFB0
    .short 0xFF10
    .short 0x0
    .short 0x2

PTR_PTR_E_Traffic_0_Init_0807ee00:
    .word PTR_E_Traffic_0_Init_0807ebe8

PTR_USHORT_ARRAY_0807ee04:
    .word USHORT_ARRAY_0807ec94

PTR_BYTE_ARRAY_0807ee08:
    .word BYTE_ARRAY_0807ec90

DAT_0807ee0c:
    .word 0x12C

PTR_USHORT_ARRAY_ARRAY_0807ee10:
    .word USHORT_ARRAY_ARRAY_0807edb8

PTR_USHORT_ARRAY_ARRAY_0807ee14:
    .word USHORT_ARRAY_ARRAY_0807edf0
