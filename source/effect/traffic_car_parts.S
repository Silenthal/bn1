#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_TrafficCarParts
    push       {lr}
    ldr        r0,PTR_PTR_E_TrafficCarParts_0_Init_0807efcc
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_TrafficCarParts_0_Init_0807eed8:
    .word E_TrafficCarParts_0_Init
    .word E_TrafficCarParts_1_Main
    .word E_TrafficCarParts_2_Free


_ts E_TrafficCarParts_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_0807efd0
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_family_b1]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Effect_family_family]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    bl         Rng_RandomUint
    mov        r1,#0x7
    and        r1,r0
    sub        r1,#0x3
    lsl        r1,r1,#0xf
    str        r1,[r5,#Effect_diff_x]
    lsr        r0,r0,#0x4
    mov        r1,#0x7
    and        r1,r0
    sub        r1,#0x3
    lsl        r1,r1,#0xf
    str        r1,[r5,#Effect_diff_y]
    lsr        r0,r0,#0x4
    mov        r1,#0xf
    and        r1,r0
    add        r1,#0x8
    lsl        r1,r1,#0xf
    str        r1,[r5,#Effect_diff_z]
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}


_nt E_TrafficCarParts_1_Main
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#Effect_state_s1]
    cmp        r0,#0x1
    bne        LAB_0807ef5c
    mov        r0,#0x14
    strb       r0,[r5,#Effect_state_s1]
    mov        r0,#0x2
    strb       r0,[r5,#Effect_state_s0]
    pop        {pc}
LAB_0807ef5c:
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    bpl        LAB_0807ef72
    mov        r2,#0x0
LAB_0807ef72:
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldr        r0,DAT_0807efa0
    add        r6,r6,r0
    str        r6,[r5,#Effect_diff_z]
    ldr        r0,[r5,#Effect_pos_curr_z]
    tst        r0,r0
    bne        LAB_0807ef9e
    ldrb       r0,[r5,#Effect_state_s1]
    tst        r0,r0
    beq        LAB_0807ef8e
    sub        r0,#0x1
    strb       r0,[r5,#Effect_state_s1]
    b          LAB_0807ef9e
LAB_0807ef8e:
    ldrb       r2,[r5,#Effect_family_family]
    tst        r2,r2
    beq        LAB_0807ef9a
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s1]
    b          LAB_0807ef9e
LAB_0807ef9a:
    mov        r0,#0x14
    strb       r0,[r5,#Effect_state_s1]
LAB_0807ef9e:
    pop        {pc}

DAT_0807efa0:
    .word 0xFFFEC000


_ts E_TrafficCarParts_2_Free
    push       {lr}
    ldrb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x2
    eor        r0,r1
    strb       r0,[r5,#Effect_header_entityFlags]
    ldrb       r0,[r5,#Effect_state_s1]
    tst        r0,r0
    beq        LAB_0807efba
    sub        r0,#0x1
    strb       r0,[r5,#Effect_state_s1]
    bne        LAB_0807efbe
LAB_0807efba:
    bl         Effect_Free
LAB_0807efbe:
    pop        {pc}


_ts Effect_TrafficCarParts_Create
    push       {lr}
    mov        r0,#0x21
    bl         Effect_Alloc
    pop        {pc}

    .align 2, 0


PTR_PTR_E_TrafficCarParts_0_Init_0807efcc:
    .word PTR_E_TrafficCarParts_0_Init_0807eed8

DAT_0807efd0:
    .word 0x103
