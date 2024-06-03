#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


ChipId_ARRAY_ARRAY_08082710:
    .byte CD_LilBomb
    .byte CD_LilBomb
    .byte CD_CrosBomb
    .byte CD_CrosBomb
    .byte CD_BigBomb
    .byte CD_BigBomb
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

    .byte CD_Sword
    .byte CD_Sword
    .byte CD_WideSwrd
    .byte CD_WideSwrd
    .byte CD_LongSwrd
    .byte CD_LongSwrd
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

    .byte CD_ShokWave
    .byte CD_ShokWave
    .byte CD_SoniWave
    .byte CD_SoniWave
    .byte CD_DynaWave
    .byte CD_DynaWave
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

    .byte CD_Quake1
    .byte CD_Quake1
    .byte CD_Quake2
    .byte CD_Quake2
    .byte CD_Quake3
    .byte CD_Quake3
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF
    .byte 0xFF

    .byte CD_LilBomb
    .byte CD_LilBomb
    .byte CD_LilBomb
    .byte CD_CrosBomb
    .byte CD_CrosBomb
    .byte CD_CrosBomb
    .byte CD_BigBomb
    .byte CD_BigBomb
    .byte CD_BigBomb
    .byte 0xFF

    .byte CD_Sword
    .byte CD_Sword
    .byte CD_Sword
    .byte CD_WideSwrd
    .byte CD_WideSwrd
    .byte CD_WideSwrd
    .byte CD_LongSwrd
    .byte CD_LongSwrd
    .byte CD_LongSwrd
    .byte 0xFF

    .byte CD_ShokWave
    .byte CD_ShokWave
    .byte CD_ShokWave
    .byte CD_SoniWave
    .byte CD_SoniWave
    .byte CD_SoniWave
    .byte CD_DynaWave
    .byte CD_DynaWave
    .byte CD_DynaWave
    .byte 0xFF

    .byte CD_Quake1
    .byte CD_Quake1
    .byte CD_Quake1
    .byte CD_Quake2
    .byte CD_Quake2
    .byte CD_Quake2
    .byte CD_Quake3
    .byte CD_Quake3
    .byte CD_Quake3
    .byte 0xFF


_ts BattleChip_BetaSigmaPA
    push       {lr}
    ldr        r7,PTR_PTR_BC_BetaSigmaPA_0_Init_08082770
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_BetaSigmaPA_0_Init_08082770:
    .word PTR_BC_BetaSigmaPA_0_Init_08082774

PTR_BC_BetaSigmaPA_0_Init_08082774:
    .word BC_BetaSigmaPA_0_Init
    .word BC_BetaSigmaPA_1_Free


_ts BC_BetaSigmaPA_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x4
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,#0xde
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_BetaSigmaPA_1_Free
    push       {lr}
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    mov        r0,#0xa
    mul        r1,r0
    ldr        r0,PTR_ChipId_ARRAY_ARRAY_080827d8
    add        r0,r0,r1
    ldr        r6,[r5,#0x74]
    mov        r1,#0x0
    strb       r1,[r6,#0x7]
    mov        r1,#0x60
    add        r1,r1,r6
    mov        r2,#0xa
    bl         memcpy_8
    push       {r5}
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,#0xde
    ldrb       r0,[r5,#0x16]
    add        r0,#0xa
    bl         BattleMessage_Load
    pop        {r5}
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}

    .align 2, 0


PTR_ChipId_ARRAY_ARRAY_080827d8:
    .word ChipId_ARRAY_ARRAY_08082710
