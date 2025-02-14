#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_AmmoniculeBubbleWrap
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_AmmoniculeBubbleWrap_0_08075a78
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AmmoniculeBubbleWrap_0_08075a78:
    .word PTR_A_AmmoniculeBubbleWrap_0_08075a7c

PTR_A_AmmoniculeBubbleWrap_0_08075a7c:
    .word A_AmmoniculeBubbleWrap_0
    .word A_AmmoniculeBubbleWrap_1
    .word A_AmmoniculeBubbleWrap_2


_ts A_AmmoniculeBubbleWrap_0
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x45
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    strb       r0,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0xd]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    bl         A_AmmoniculeBubbleWrap_1
    pop        {pc}


_nt A_AmmoniculeBubbleWrap_1
    push       {lr}
    ldr        r7,[r5,#0x60]
    ldr        r6,[r7,#0x5c]
    tst        r6,r6
    bne        LAB_08075ada
    bl         Attack_Free
    b          LAB_08075af0
LAB_08075ada:
    ldr        r0,[r7,#0x28]
    ldr        r1,[r7,#0x2c]
    ldr        r2,[r7,#0x30]
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    str        r2,[r5,#0x30]
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_AmmoniculeBubbleWrap_1_0_08075af4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08075af0:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AmmoniculeBubbleWrap_1_0_08075af4:
    .word PTR_A_AmmoniculeBubbleWrap_1_0_08075af8

PTR_A_AmmoniculeBubbleWrap_1_0_08075af8:
    .word A_AmmoniculeBubbleWrap_1_0
    .word A_AmmoniculeBubbleWrap_1_1
    .word A_AmmoniculeBubbleWrap_1_2


_ts A_AmmoniculeBubbleWrap_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_AmmoniculeBubbleWrap_1_0_0_08075b14
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_AmmoniculeBubbleWrap_1_0_0_08075b14:
    .word PTR_A_AmmoniculeBubbleWrap_1_0_0_08075b18

PTR_A_AmmoniculeBubbleWrap_1_0_0_08075b18:
    .word A_AmmoniculeBubbleWrap_1_0_0
    .word A_AmmoniculeBubbleWrap_1_0_1


_ts A_AmmoniculeBubbleWrap_1_0_0
    push       {lr}
    mov        r0,#0x1e
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    pop        {pc}


_ts A_AmmoniculeBubbleWrap_1_0_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08075b54
    mov        r1,#0x3
    strb       r1,[r5,#0x0]
    ldrh       r1,[r5,#0x22]
    strh       r1,[r5,#0x20]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08075b60
LAB_08075b54:
    mov        r1,#0x3
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_08075b5e
    mov        r1,#0x1
LAB_08075b5e:
    strb       r1,[r5,#0x0]
LAB_08075b60:
    pop        {pc}


_nt A_AmmoniculeBubbleWrap_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_AmmoniculeBubbleWrap_1_1_0_08075b70
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_AmmoniculeBubbleWrap_1_1_0_08075b70:
    .word PTR_A_AmmoniculeBubbleWrap_1_1_0_08075b74

PTR_A_AmmoniculeBubbleWrap_1_1_0_08075b74:
    .word A_AmmoniculeBubbleWrap_1_1_0


_ts A_AmmoniculeBubbleWrap_1_1_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    ldrb       r0,[r5,#0xe]
    tst        r0,r0
    beq        LAB_08075b8c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08075b8c:
    pop        {pc}


_nt A_AmmoniculeBubbleWrap_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_AmmoniculeBubbleWrap_1_2_0_08075b9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_AmmoniculeBubbleWrap_1_2_0_08075b9c:
    .word PTR_A_AmmoniculeBubbleWrap_1_2_0_08075ba0

PTR_A_AmmoniculeBubbleWrap_1_2_0_08075ba0:
    .word A_AmmoniculeBubbleWrap_1_2_0
    .word A_AmmoniculeBubbleWrap_1_2_1
    .word A_AmmoniculeBubbleWrap_1_2_2


_ts A_AmmoniculeBubbleWrap_1_2_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r0,#0xad
    bl         Sound_PlaySE
    pop        {pc}


_nt A_AmmoniculeBubbleWrap_1_2_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08075bda
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
LAB_08075bda:
    pop        {pc}


_ts A_AmmoniculeBubbleWrap_1_2_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    ldrh       r1,[r5,#0x1e]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,r1
    blt        LAB_08075bf2
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08075bf2:
    pop        {pc}


_ts A_AmmoniculeBubbleWrap_2
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_AmmoniculeBubbleWrap_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x36
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    tst        r7,r7
    beq        LAB_08075c1a
    strh       r0,[r7,#0x20]
    strh       r0,[r7,#0x22]
    strh       r1,[r7,#0x1e]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_08075c1a:
    add        r0,r7,#0x0
    pop        {pc}


_nt FUN_08075c1e
    ldrb       r0,[r0,#0xc]
    mov        pc,lr


_nt FUN_08075c22
    mov        r1,#0x1
    strb       r1,[r0,#0xd]
    mov        pc,lr


_ts A_AmmoniculeBubbleWrap_MarkPopped
    mov        r1,#0x1
    strb       r1,[r0,#0xe]
    mov        r1,#0x0
    strb       r1,[r0,#0xc]
    strh       r1,[r0,#0x20]
    mov        pc,lr


_ts A_AmmoniculeBubbleWrap_ApplyDamage
    push       {lr}
    sub        sp,#0x4
    mov        r1,#0x0
    str        r1,[sp,#0x0]
    ldrb       r1,[r0,#0xc]
    tst        r1,r1
    beq        LAB_08075c7c
    tst        r3,r3
    beq        LAB_08075c50
    bl         A_AmmoniculeBubbleWrap_MarkPopped
    mov        r0,#0x1
    str        r0,[sp,#0x0]
    b          LAB_08075c74
LAB_08075c50:
    mov        r1,#0x0
    add        r1,r1,r2
    add        r1,r1,r4
    add        r1,r1,r6
    add        r1,r1,r7
    push       {r2}
    ldrh       r2,[r0,#0x20]
    sub        r2,r2,r1
    strh       r2,[r0,#0x20]
    pop        {r2}
    bgt        LAB_08075c70
    bl         A_AmmoniculeBubbleWrap_MarkPopped
    mov        r0,#0x1
    str        r0,[sp,#0x0]
    b          LAB_08075c74
LAB_08075c70:
    mov        r0,#0x0
    str        r0,[sp,#0x0]
LAB_08075c74:
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r6,#0x0
    mov        r7,#0x0
LAB_08075c7c:
    ldr        r0,[sp,#0x0]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0

