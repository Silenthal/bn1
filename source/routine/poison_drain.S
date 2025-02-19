#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_SetPoisonDrain
    push       {lr}
    ldrb       r2,[r0,#0x0]
    add        r2,#0x1
    strb       r2,[r0,#0x0]
    lsr        r3,r2,#0x1
    bcc        LAB_080562d4
    push       {r0,r2}
    mov        r0,#0x1f
    sub        r0,r0,r1
    bl         Battle_SetBattleFlag
    pop        {r0,r2}
LAB_080562d4:
    pop        {pc}


_nt Routine_CheckPoisonDrain
    push       {lr}
    mov        r0,#0x1e
    ldrb       r1,[r5,#Actor_owner]
    add        r0,r0,r1
    bl         Battle_GetBattleFlag
    tst        r0,r0
    beq        LAB_080562f4
    ldrh       r0,[r5,#Actor_hpCurrent]
    sub        r0,#0x1
    tst        r0,r0
    beq        LAB_080562f8
    asr        r1,r0,#0x1f
    bic        r0,r1
    strh       r0,[r5,#Actor_hpCurrent]
LAB_080562f4:
    mov        r0,#0x0
    pop        {pc}
LAB_080562f8:
    strh       r0,[r5,#Actor_hpCurrent]
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0
