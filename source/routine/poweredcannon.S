#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_PoweredCannon
    push       {lr}
    ldr        r7,PTR_PTR_R_PoweredCannon_0_Init_0805bf50
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_PoweredCannon_0_Init_0805bf50:
    .word PTR_R_PoweredCannon_0_Init_0805bf54

PTR_R_PoweredCannon_0_Init_0805bf54:
    .word R_PoweredCannon_0_Init
    .word R_PoweredCannon_1_Main
    .word R_PoweredCannon_2_Free


_ts R_PoweredCannon_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_0805bf7c
    mov        r0,#0x4
LAB_0805bf7c:
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    mov        r3,#0x28
    add        r7,r7,r3
    ldmia      r7!,{r0,r1,r2}
    add        r3,r3,r5
    stmia      r3!,{r0,r1,r2}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_PoweredCannon_1_Main
    pop        {pc}


_ts R_PoweredCannon_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_R_PoweredCannon_1_0_0805bfdc
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_PoweredCannon_1_0_0805bfdc:
    .word PTR_R_PoweredCannon_1_0_0805bfe0

PTR_R_PoweredCannon_1_0_0805bfe0:
    .word R_PoweredCannon_1_0
    .word R_PoweredCannon_1_1
    .word R_PoweredCannon_1_2
    .word R_PoweredCannon_1_3_Wait


_ts R_PoweredCannon_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805c028
    mov        r0,#0x10
    strb       r0,[r5,#0x14]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    sub        r2,r2,r0
    ldr        r3,[r5,#0x30]
    sub        r3,r3,r0
    ldr        r4,familyPoweredCannon
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    tst        r7,r7
    beq        LAB_0805c020
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805c020:
    mov        r0,#0x19
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0805c028:
    pop        {pc}

    .align 2, 0


familyPoweredCannon:
    .word 0x800000


_ts R_PoweredCannon_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0805c044
    mov        r0,#0xe4
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_0805c044:
    pop        {pc}


_nt R_PoweredCannon_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x1
    and        r0,r1
    beq        LAB_0805c07e
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r1,r1,r0
    ldrb       r2,[r5,#0x19]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    mov        r0,#0x0
    ldrh       r6,[r5,#0x24]
    bl         Attack_PoweredCannon_Create
    tst        r7,r7
    beq        LAB_0805c074
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0805c074:
    mov        r0,#0x74
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_0805c07e:
    pop        {pc}


_ts R_PoweredCannon_1_3_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0805c090
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0805c090:
    pop        {pc}


_nt R_PoweredCannon_2_Free
    push       {lr}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         Actor_Free
    pop        {pc}


_nt Routine_PoweredCannon_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0xb
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0805c0c8
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_0805c0c8:
    pop        {pc}

    .align 2, 0

