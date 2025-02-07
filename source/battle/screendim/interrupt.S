#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Interrupt
    push       {lr}
    ldr        r7,PTR_PTR_SD_Interrupt_0_08099fd4
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Interrupt_0_08099fd4:
    .word PTR_SD_Interrupt_0_08099fd8

PTR_SD_Interrupt_0_08099fd8:
    .word SD_Interrupt_0
    .word SD_Interrupt_1
    .word SD_Interrupt_2
    .word SD_Interrupt_3


_ts SD_Interrupt_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    mov        r1,#0x53
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Load
    pop        {r5}
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    push       {r5}
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    bl         SpritePtr_DisableFlash
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}


_nt SD_Interrupt_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809a062
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a062
    bl         FUN_0809a0a6
    mov        r0,#0xcf
    bl         Sound_PlaySE
    mov        r0,#0x5a
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809a062:
    pop        {pc}


_ts SD_Interrupt_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809a07e
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809a07e:
    pop        {pc}


_ts SD_Interrupt_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a0a4
    ldrb       r0,[r5,#0x6]
    neg        r0,r0
    add        r0,#0x1d
    bl         Battle_SetBattleFlag
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a0a4:
    pop        {pc}


_nt FUN_0809a0a6
    push       {lr}
    LoadMain matchBattleState, r0, r0
    ldrb       r1,[r5,#0x6]
    tst        r1,r1
    bne        LAB_0809a0b6
    add        r0,#0x70
    b          LAB_0809a0c8
LAB_0809a0b6:
    push       {r0}
    LoadMain battle, r0, r0
    add        r0,#0x78
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    pop        {r0}
LAB_0809a0c8:
    add        r0,#0x6a
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0809a122
    add        r7,#0x54
    mov        r6,#0xc
LAB_0809a0e0:
    push       {r6,r7}
    ldr        r7,[r7,r6]
    tst        r7,r7
    beq        LAB_0809a11a
    ldrb       r0,[r7,#0x13]
    push       {r7}
    bl         Enemy_GetEnemyDetail
    pop        {r7}
    ldrb       r0,[r0,#0x3]
    lsr        r0,r0,#0x1
    sub        r0,#0x8
    bgt        LAB_0809a0fc
    mov        r0,#0x10
LAB_0809a0fc:
    lsl        r0,r0,#0x10
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    add        r3,r3,r0
    ldr        r4,DAT_0809a158
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0809a11a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0809a11a:
    pop        {r6,r7}
    sub        r6,#0x4
    bpl        LAB_0809a0e0
    pop        {pc}
LAB_0809a122:
    ldr        r7,[r7,#0x40]
    ldrb       r0,[r7,#0x13]
    push       {r7}
    bl         Enemy_GetEnemyDetail
    pop        {r7}
    ldrb       r0,[r0,#0x3]
    asr        r0,r0,#0x1
    sub        r0,#0x8
    bgt        LAB_0809a138
    mov        r0,#0x10
LAB_0809a138:
    lsl        r0,r0,#0x10
    add        r7,#0x28
    ldmia      r7!,{r1,r2,r3}
    add        r3,r3,r0
    ldr        r4,DAT_0809a158
    push       {r5}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0809a156
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0809a156:
    pop        {pc}

DAT_0809a158:
    .word 0x3C0069
