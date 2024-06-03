#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_NaviDelete
    push       {lr}
    ldr        r7,PTR_PTR_E_NaviDelete_0_Init_08081cdc
    ldrb       r0,[r5,#0x8]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_E_NaviDelete_0_Init_08081cd0:
    .word E_NaviDelete_0_Init
    .word E_NaviDelete_1_Main
    .word E_NaviDelete_2_End

PTR_PTR_E_NaviDelete_0_Init_08081cdc:
    .word PTR_E_NaviDelete_0_Init_08081cd0


_ts E_NaviDelete_0_Init
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_NaviDelete_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_E_NaviDelete_1_0_Explode_08081cf8
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_NaviDelete_1_0_Explode_08081cf8:
    .word PTR_E_NaviDelete_1_0_Explode_08081cfc

PTR_E_NaviDelete_1_0_Explode_08081cfc:
    .word E_NaviDelete_1_0_Explode


_ts E_NaviDelete_1_0_Explode
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08081d10
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
LAB_08081d10:
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x5a
    bmi        LAB_08081d20
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    b          LAB_08081d68
LAB_08081d20:
    mov        r1,#0x7
    and        r1,r0
    cmp        r1,#0x7
    bne        LAB_08081d4c
    ldr        r7,[r5,#0x60]
    push       {r0,r5}
    mov        r0,#0x1f
    ldr        r1,[r7,#0x28]
    ldr        r2,[r7,#0x2c]
    ldr        r3,[r7,#0x30]
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x10
    lsl        r4,r4,#0x10
    add        r3,r3,r4
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    mov        r0,#0x76
    bl         Sound_PlaySongImmediate
    pop        {r0,r5}
LAB_08081d4c:
    mov        r1,#0x2
    tst        r1,r0
    bne        LAB_08081d5e
    push       {r5}
    ldr        r5,[r5,#0x60]
    bl         SpritePtr_SetFlashPalette
    pop        {r5}
    b          LAB_08081d68
LAB_08081d5e:
    push       {r5}
    ldr        r5,[r5,#0x60]
    bl         SpritePtr_ResetPalette
    pop        {r5}
LAB_08081d68:
    pop        {pc}


_nt E_NaviDelete_2_End
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    bl         Effect_Free
    pop        {pc}


_ts Effect_NaviDelete_Create
    push       {lr}
    push       {r0}
    mov        r0,#0x4b
    bl         Effect_Alloc
    pop        {r0}
    tst        r5,r5
    beq        LAB_08081d92
    str        r0,[r5,#0x60]
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
LAB_08081d92:
    pop        {pc}
