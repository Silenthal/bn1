#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_QuickEffect_Create, 0x807B5E8+1


_ts Routine_GutsShoot_GutsMan
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_GutsShoot_GutsMan_0_Init_0806810c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsShoot_GutsMan_0_Init_0806810c:
    .word PTR_R_GutsShoot_GutsMan_0_Init_08068110

PTR_R_GutsShoot_GutsMan_0_Init_08068110:
    .word R_GutsShoot_GutsMan_0_Init
    .word R_GutsShoot_GutsMan_1_Main
    .word R_GutsShoot_GutsMan_2_Free


_ts R_GutsShoot_GutsMan_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x22
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,r3]
    mov        r3,#0x28
    add        r7,r7,r3
    ldmia      r7!,{r0,r1,r2}
    mov        r4,#0x1
    lsl        r4,r4,#0x10
    sub        r1,r1,r4
    sub        r2,r2,r4
    add        r3,r3,r5
    stmia      r3!,{r0,r1,r2}
    push       {r5}
    add        r3,r2,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08068188
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x5
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08068188:
    pop        {r5}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_GutsShoot_GutsMan_1_Main
    pop        {pc}


_ts R_GutsShoot_GutsMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_GutsShoot_GutsMan_1_0_080681b0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsShoot_GutsMan_1_0_080681b0:
    .word PTR_R_GutsShoot_GutsMan_1_0_080681b4

PTR_R_GutsShoot_GutsMan_1_0_080681b4:
    .word R_GutsShoot_GutsMan_1_0
    .word R_GutsShoot_GutsMan_1_1
    .word R_GutsShoot_GutsMan_1_2


_ts R_GutsShoot_GutsMan_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080681d2
    mov        r0,#0x5
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_080681d2:
    pop        {pc}
    .byte 0x00
    .byte 0x00
    .byte 0x95

    .align 2, 0



_ts R_GutsShoot_GutsMan_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080681f0
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_080681f0:
    pop        {pc}


_nt R_GutsShoot_GutsMan_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068222
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r0,#0x10
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x5
    orr        r0,r1
    strb       r0,[r5,#0x0]
    pop        {r5}
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08068222:
    pop        {pc}


_ts R_GutsShoot_GutsMan_2_Free
    push       {lr}
    bl         Actor_Free
    pop        {pc}


_ts Routine_GutsShoot_GutsMan_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x32
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0806824a
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806824a:
    pop        {pc}
