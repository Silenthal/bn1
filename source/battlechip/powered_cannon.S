#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts BattleChip_PoweredCannon
    push       {lr}
    ldr        r7,PTR_PTR_BC_PoweredCannon_0_Init_08082604
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_PoweredCannon_0_Init_08082604:
    .word PTR_BC_PoweredCannon_0_Init_08082608

PTR_BC_PoweredCannon_0_Init_08082608:
    .word BC_PoweredCannon_0_Init
    .word BC_PoweredCannon_1_Free


_ts BC_PoweredCannon_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x3
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_ts BC_PoweredCannon_1_Free
    push       {lr}
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}

    .align 2, 0

