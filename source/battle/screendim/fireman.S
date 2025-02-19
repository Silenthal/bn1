#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_FireMan
    push       {lr}
    ldrb       r0,[r5,#0x0]
    ldr        r7,PTR_PTR_SD_Fireman_0_Init_08098888
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_Fireman_0_Init_0809887c:
    .word SD_Fireman_0_Init
    .word SD_FireMan_1_Main
    .word SD_FireMan_2_Free

PTR_PTR_SD_Fireman_0_Init_08098888:
    .word PTR_SD_Fireman_0_Init_0809887c


_ts SD_Fireman_0_Init
    push       {lr}
    FadeOut_ScreenDim
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0xac
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts SD_FireMan_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x1]
    ldr        r7,PTR_PTR_SD_FireMan_1_0_ShowMessage_080988d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_SD_FireMan_1_0_ShowMessage_080988cc:
    .word SD_FireMan_1_0_ShowMessage
    .word SD_FireMan_1_1_FireArm
    .word SD_FireMan_1_2_WarpOut

PTR_PTR_SD_FireMan_1_0_ShowMessage_080988d8:
    .word PTR_SD_FireMan_1_0_ShowMessage_080988cc


_ts SD_FireMan_1_0_ShowMessage
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08098912
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098912
    bl         ScreenDim_WarpPlayerOut
    mov        r0,#0x1e
    strb       r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
LAB_08098912:
    pop        {pc}


_ts SD_FireMan_1_1_FireArm
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08098946
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r1,r0,#0x2
    add        r1,#0x40
    ldr        r7,[r7,r1]
    ldrb       r1,[r7,#0x18]
    ldrb       r2,[r7,#0x19]
    ldrh       r6,[r5,#0xc]
    bl         Routine_FireMan_Chip_Create
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        r0,#0xde
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x1]
LAB_08098946:
    pop        {pc}


_ts SD_FireMan_1_2_WarpOut
    push       {lr}
    ldrb       r0,[r5,#0x3]
    tst        r0,r0
    beq        LAB_0809895e
    bl         ScreenDim_WarpPlayerIn
    mov        r0,#0x92
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809895e:
    pop        {pc}


_ts SD_FireMan_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_08098978
    FadeIn_ScreenDim
    mov        r0,#0x4
    strb       r0,[r5,#0x1]
LAB_08098978:
    LoadMain fade, r7, r7
    ldrb       r0,[r7,#0x3]
    cmp        r0,#0x1
    beq        LAB_0809898e
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809898e:
    pop        {pc}
