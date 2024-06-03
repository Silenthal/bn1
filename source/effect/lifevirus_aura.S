#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_LiveVirusAura
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_LiveVirusAura_0_Init_080807b4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_LiveVirusAura_0_Init_080807b4:
    .word PTR_E_LiveVirusAura_0_Init_080807b8

PTR_E_LiveVirusAura_0_Init_080807b8:
    .word E_LiveVirusAura_0_Init
    .word E_LiveVirusAura_1_Main
    .word E_LiveVirusAura_2_Free


_ts E_LiveVirusAura_0_Init
    push       {lr}
    mov        r1,#0xc8
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    beq        LAB_080807d0
    mov        r1,#0x72
LAB_080807d0:
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_LiveVirusAura_1_Main
    pop        {pc}


_nt E_LiveVirusAura_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    tst        r0,r0
    bne        LAB_08080808
    bl         E_LifeVirusAura_1_0
    b          LAB_0808080c
LAB_08080808:
    bl         E_LiveVirusAura_1_1
LAB_0808080c:
    pop        {pc}


_nt E_LifeVirusAura_1_0
    push       {lr}
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_0808081e
    bl         E_LiveVirusAura_2_Free
    b          LAB_08080836
LAB_0808081e:
    mov        r1,#0x1
    ldrb       r0,[r7,#0xc]
    tst        r0,r0
    beq        LAB_08080828
    mov        r1,#0x3
LAB_08080828:
    strb       r1,[r5,#0x0]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#0x30]
LAB_08080836:
    pop        {pc}


_ts E_LiveVirusAura_1_1
    push       {lr}
    ldr        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x0]
    tst        r0,r0
    bne        LAB_08080848
    bl         E_LiveVirusAura_2_Free
    b          LAB_08080864
LAB_08080848:
    ldr        r0,[r7,#0x64]
    tst        r0,r0
    bne        LAB_08080852
    bl         E_LiveVirusAura_2_Free
LAB_08080852:
    ldrb       r0,[r7,#0xd]
    add        r0,#0x3
    strb       r0,[r5,#0x14]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x28]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x2c]
    ldr        r0,[r7,#0x30]
    str        r0,[r5,#0x30]
LAB_08080864:
    pop        {pc}


_nt E_LiveVirusAura_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_nt Effect_LifeVirusAura_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x37
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_08080880
    str        r5,[r7,#0x60]
LAB_08080880:
    pop        {pc}

    .align 2, 0

