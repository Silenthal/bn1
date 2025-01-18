#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_VirusDelete
    push       {lr}
    ldr        r7,PTR_PTR_E_VirusDelete_0_Init_0807cd7c
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_E_VirusDelete_0_Init_0807cd70:
    .word E_VirusDelete_0_Init
    .word E_VirusDelete_1_Main
    .word E_VirusDelete_2_Free

PTR_PTR_E_VirusDelete_0_Init_0807cd7c:
    .word PTR_E_VirusDelete_0_Init_0807cd70


_ts E_VirusDelete_0_Init
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_VirusDelete_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_E_VirusDelete_1_0_0807cd98
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_VirusDelete_1_0_0807cd98:
    .word PTR_E_VirusDelete_1_0_0807cd9c

PTR_E_VirusDelete_1_0_0807cd9c:
    .word E_VirusDelete_1_0


_ts E_VirusDelete_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_0807cdb0
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_0807cdb0:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x20
    bmi        LAB_0807cdc0
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    b          LAB_0807ce02
LAB_0807cdc0:
    mov        r1,#0x7
    and        r1,r0
    cmp        r1,#0x7
    bne        LAB_0807cde6
    ldr        r7,[r5,#0x60]
    push       {r0,r5}
    mov        r0,#0x7
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    ldr        r3,[r7,#0x30]
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    mov        r0,#0x76
    bl         Sound_PlaySE
    pop        {r0,r5}
LAB_0807cde6:
    mov        r1,#0x2
    tst        r1,r0
    bne        LAB_0807cdf8
    push       {r5}
    ldr        r5,[r5,#0x60]
    bl         SpritePtr_SetFlashPalette
    pop        {r5}
    b          LAB_0807ce02
LAB_0807cdf8:
    push       {r5}
    ldr        r5,[r5,#0x60]
    bl         SpritePtr_ResetPalette
    pop        {r5}
LAB_0807ce02:
    pop        {pc}


_ts E_VirusDelete_2_Free
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r0,#0x70
    bl         Sound_PlaySE
    bl         Effect_Free
    pop        {pc}


_nt Effect_VirusDelete_Create
    push       {lr}
    push       {r0}
    mov        r0,#0xe
    bl         Effect_Alloc
    pop        {r0}
    tst        r5,r5
    beq        LAB_0807ce2c
    str        r0,[r5,#0x60]
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
LAB_0807ce2c:
    pop        {pc}

    .align 2, 0

