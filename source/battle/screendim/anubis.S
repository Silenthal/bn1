#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Anubis
    push       {lr}
    ldr        r7,PTR_PTR_SD_Anubis_0_Init_080999c0
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Anubis_0_Init_080999c0:
    .word PTR_SD_Anubis_0_Init_080999c4

PTR_SD_Anubis_0_Init_080999c4:
    .word SD_Anubis_0_Init
    .word SD_Anubis_1
    .word SD_Anubis_2
    .word SD_Anubis_3_FadeIn
    .word SD_Anubis_4_Free


_ts SD_Anubis_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0x8e
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_nt SD_Anubis_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099a64
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099a64
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    bne        LAB_08099a5c
    ldrb       r0,[r5,#0x6]
    push       {r0}
    bl         Field_GetAttackDirectionOffset
    add        r2,r0,#0x0
    pop        {r0}
    LoadMain battle, r7, r7
    add        r7,#0x40
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    add        r0,r0,r2
    mov        r3,#0x14
    strb       r0,[r5,r3]
    mov        r3,#0x15
    strb       r1,[r5,r3]
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
LAB_08099a5c:
    mov        r0,#0x15
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099a64:
    pop        {pc}


_nt SD_Anubis_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099aac
    ldrb       r0,[r5,#0x5]
    tst        r0,r0
    beq        LAB_08099a7a
    mov        r0,#0x0
    b          LAB_08099a88
LAB_08099a7a:
    LoadMain matchBattleState, r0, r0
    ldrb       r7,[r5,#0x6]
    tst        r7,r7
    beq        LAB_08099a86
    add        r0,#0x70
LAB_08099a86:
    add        r0,#0x50
LAB_08099a88:
    mov        r3,#0x14
    ldrb       r1,[r5,r3]
    mov        r3,#0x15
    ldrb       r2,[r5,r3]
    mov        r4,#0x0
    mov        r6,#0xa
    bl         Attack_Anubis_Create
    tst        r4,r4
    beq        LAB_08099aa4
    ldrb       r0,[r4,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r4,#0x0]
LAB_08099aa4:
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_08099aac:
    pop        {pc}


_nt SD_Anubis_3_FadeIn
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099ac8
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_08099ac8:
    pop        {pc}


_nt SD_Anubis_4_Free
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08099ae4
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_08099ae4:
    pop        {pc}


_nt ScreenDim_Anubis_Create
    push       {lr}
    push       {r0,r1}
    mov        r0,#0x16
    mov        r1,#0x1
    mov        r2,#0x1
    mov        r3,#0xa
    bl         ScreenDim_Alloc
    pop        {r0,r1}
    LoadMain screenDim, r7, r7
    mov        r3,#0x14
    strb       r0,[r7,r3]
    mov        r3,#0x15
    strb       r1,[r7,r3]
    pop        {pc}

    .align 2, 0

