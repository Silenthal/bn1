#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


ChipId_ARRAY_080827dc:
    .byte CD_MetGuard
    .byte CD_MiniBomb
    .byte CD_Sword
    .byte CD_GutsPnch


_ts BattleChip_BusterChip
    push       {lr}
    ldr        r7,PTR_PTR_BC_BusterChip_0_Init_080827f0
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_BusterChip_0_Init_080827f0:
    .word PTR_BC_BusterChip_0_Init_080827f4

PTR_BC_BusterChip_0_Init_080827f4:
    .word BC_BusterChip_0_Init
    .word BC_BusterChip_1_Free


_ts BC_BusterChip_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x4
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,#0x6c
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_BusterChip_1_Free
    push       {lr}
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    ldr        r0,PTR_ChipId_ARRAY_08082834
    ldr        r0,[r0,r1]
    ldr        r6,[r5,#0x74]
    strb       r0,[r6,#0x8]
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}

PTR_ChipId_ARRAY_08082834:
    .word ChipId_ARRAY_080827dc
