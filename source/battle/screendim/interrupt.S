#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Interrupt
    push       {lr}
    ldr        r7,PTR_PTR_SD_Interrupt_0_08099fd4
    ldrb       r0,[r5,#ScreenDim_state_s0]
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
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    mov        r1,#CD_Interrupt
    SD_LoadMessage
    push       {r5}
    bl         BattleUi_ClearActiveChip
    pop        {r5}
    push       {r5}
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
    lsl        r0,r0,#0x2
    add        r0,#0x40
    ldr        r5,[r7,r0]
    bl         SpritePtr_DisableFlash
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#ScreenDim_state_s0]
    pop        {pc}


_nt SD_Interrupt_1
    push       {lr}
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_0809a062
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_0809a062
    bl         SD_Interrupt_Activate
    mov        r0,#0xcf
    bl         Sound_PlaySE
    SD_SetTimer 0x5a
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a062:
    pop        {pc}


_ts SD_Interrupt_2
    push       {lr}
    SD_DecreaseTimer
    bne        LAB_0809a07e
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
LAB_0809a07e:
    pop        {pc}


_ts SD_Interrupt_3
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809a0a4
    ldrb       r0,[r5,#ScreenDim_owner]
    neg        r0,r0
    add        r0,#0x1d
    bl         Battle_SetBattleFlag
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809a0a4:
    pop        {pc}


_nt SD_Interrupt_Activate
    push       {lr}
    LoadMain matchBattleState, r0, r0
    ldrb       r1,[r5,#ScreenDim_owner]
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
    bl         memset_8
    pop        {r0}
LAB_0809a0c8:
    add        r0,#0x6a
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset_8
    LoadMain battle, r7, r7
    ldrb       r0,[r5,#ScreenDim_owner]
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
