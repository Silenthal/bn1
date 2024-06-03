#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


ZetaOmegaType_ARRAY_0808263c:
    .short CD_Cannon
    .short 300
    .short CD_HiCannon
    .short 300
    .short CD_M_Cannon
    .short 300
    .short CD_Spreader
    .short 300
    .short CD_Ratton1
    .short 300
    .short CD_Ratton2
    .short 300
    .short CD_Ratton3
    .short 300
    .short CD_TriArrow
    .short 300
    .short CD_TriSpear
    .short 300
    .short CD_TriLance
    .short 300
    .short CD_Cannon
    .short 600
    .short CD_HiCannon
    .short 600
    .short CD_M_Cannon
    .short 600
    .short CD_Spreader
    .short 600
    .short CD_Ratton1
    .short 600
    .short CD_Ratton2
    .short 600
    .short CD_Ratton3
    .short 600
    .short CD_TriArrow
    .short 600
    .short CD_TriSpear
    .short 600
    .short CD_TriLance
    .short 600


_ts BattleChip_ZetaOmegaPA
    push       {lr}
    ldr        r7,PTR_PTR_BC_ZetaOmegaPA_0_Init_0808269c
    mov        r3,#0x67
    ldrb       r0,[r5,r3]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_BC_ZetaOmegaPA_0_Init_0808269c:
    .word PTR_BC_ZetaOmegaPA_0_Init_080826a0

PTR_BC_ZetaOmegaPA_0_Init_080826a0:
    .word BC_ZetaOmegaPA_0_Init
    .word BC_ZetaOmegaPA_1_Free


_ts BC_ZetaOmegaPA_0_Init
    push       {lr}
    mov        r0,#0xf
    bl         ActorPlayer_ClearFlag_1
    mov        r0,#0x4
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,#0xca
    ldrb       r2,[r5,#0x16]
    bl         ScreenDim_Alloc
    mov        r3,#0x67
    mov        r0,#0x4
    strb       r0,[r5,r3]
    pop        {pc}


_nt BC_ZetaOmegaPA_1_Free
    push       {lr}
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_ZetaOmegaType_ARRAY_0808270c
    add        r7,r7,r1
    ldr        r6,[r5,#0x74]
    ldrb       r0,[r7,#0x0]
    strb       r0,[r6,#0x5]
    ldrh       r0,[r7,#0x2]
    strh       r0,[r6,#0x1a]
    add        r1,r0,#0x0
    ldrb       r0,[r5,#0x16]
    mov        r2,#0x1
    bl         R_Player_SetInvisible
    push       {r5}
    mov        r3,#0x61
    ldrb       r1,[r5,r3]
    add        r1,#0xca
    ldrb       r0,[r5,#0x16]
    add        r0,#0x8
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x91
    bl         Sound_PlaySongImmediate
    bl         R_Player_ResetChipUseState
    mov        r0,#0x2
    bl         R_Player_SetChipActivationDelay
    pop        {pc}

    .align 2, 0


PTR_ZetaOmegaType_ARRAY_0808270c:
    .word ZetaOmegaType_ARRAY_0808263c
