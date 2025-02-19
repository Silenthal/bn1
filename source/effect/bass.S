#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Bass
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_Bass_0_Init_08081734
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_Bass_0_Init_08081734:
    .word PTR_E_Bass_0_Init_08081738

PTR_E_Bass_0_Init_08081738:
    .word E_Bass_0_Init
    .word E_Bass_1_Main
    .word E_Bass_2_Free


_ts E_Bass_0_Init
    push       {lr}
    mov        r1,#0xca
    ldrb       r0,[r5,#Effect_family_family]
    tst        r0,r0
    beq        LAB_08081750
    mov        r1,#0xc9
LAB_08081750:
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#Effect_family_family]
    tst        r0,r0
    beq        LAB_0808177a
    ldr        r7,[r5,#Effect_obj_60]
    ldrb       r0,[r7,#0xc]
    bl         SpritePtr_SetPaletteIndex
LAB_0808177a:
    ldrb       r0,[r5,#Effect_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x1
    ldrb       r1,[r5,#Effect_owner]
    tst        r1,r1
    beq        LAB_08081790
    mov        r0,#0x0
LAB_08081790:
    bl         SpritePtr_SetFlipType
    bl         E_Bass_1_Main
    pop        {pc}


_nt E_Bass_1_Main
    push       {lr}
    ldrb       r0,[r5,#Effect_family_family]
    tst        r0,r0
    bne        LAB_080817a8
    bl         E_Bass_Aura
    b          LAB_080817ac
LAB_080817a8:
    bl         E_Bass_Arm
LAB_080817ac:
    pop        {pc}


_nt E_Bass_Aura
    push       {lr}
    ldr        r7,[r5,#Effect_obj_60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_080817be
    bl         E_Bass_2_Free
    b          LAB_080817d6
LAB_080817be:
    mov        r1,#0x1
    ldrb       r0,[r7,#0xd]
    tst        r0,r0
    beq        LAB_080817c8
    mov        r1,#0x3
LAB_080817c8:
    strb       r1,[r5,#Effect_header_entityFlags]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#Effect_pos_curr_x]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#Effect_pos_curr_y]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#Effect_pos_curr_z]
LAB_080817d6:
    pop        {pc}


_ts E_Bass_Arm
    push       {lr}
    ldr        r7,[r5,#Effect_obj_60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_080817e8
    bl         E_Bass_2_Free
    b          LAB_080817fe
LAB_080817e8:
    ldr        r0,[r7,#0x68]
    tst        r0,r0
    bne        LAB_080817f2
    bl         E_Bass_2_Free
LAB_080817f2:
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#Effect_pos_curr_x]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#Effect_pos_curr_y]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#Effect_pos_curr_z]
LAB_080817fe:
    pop        {pc}


_ts E_Bass_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_Bass_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x46
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0808181e
    str        r5,[r7,#0x60]
    ldrb       r0,[r5,#Effect_owner]
    strb       r0,[r7,#0x16]
LAB_0808181e:
    pop        {pc}
