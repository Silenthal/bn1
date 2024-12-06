#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Cloudy
    push       {lr}
    ldr        r7,PTR_PTR_SD_Cloudy_0_Init_080996c0
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Cloudy_0_Init_080996c0:
    .word PTR_SD_Cloudy_0_Init_080996c4

PTR_SD_Cloudy_0_Init_080996c4:
    .word SD_Cloudy_0_Init
    .word SD_Cloudy_1_ShowMessage
    .word SD_Cloudy_2_Attack
    .word SD_Cloudy_3_FadeIn
    .word SD_Cloudy_4_Free


_ts SD_Cloudy_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x5b
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


_ts SD_Cloudy_1_ShowMessage
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_0809973c
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809973c
    ldrb       r0,[r5,#0x6]
    bl         R_Player_ClearOwnedEntity
    mov        r0,#0x15
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_0809973c:
    pop        {pc}


_nt SD_Cloudy_2_Attack
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809978c
    bl         FUN_080997e8
    mov        r4,#0x1
    lsl        r0,r2,#0x18
    orr        r4,r0
    lsl        r1,r1,#0x10
    orr        r4,r1
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r3,[r5,#0x6]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    ldr        r7,[r7,r3]
    ldrb       r1,[r7,#0x18]
    ldrh       r6,[r5,#0xc]
    ldr        r0,PTR_DAT_08099790
    ldrb       r3,[r5,#0x5]
    lsl        r3,r3,#0x2
    ldr        r3,[r0,r3]
    ldr        r7,[r7,#0x74]
    add        r7,#0x50
    ldrb       r0,[r5,#0x6]
    bl         Attack_Cloudy_Create
    tst        r7,r7
    beq        LAB_08099784
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08099784:
    mov        r0,#0x30
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809978c:
    pop        {pc}

    .align 2, 0


PTR_DAT_08099790:
    .word DAT_08099794

DAT_08099794:
    .byte 0xCC
    .byte 0x4C
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x80
    .byte 0x00
    .byte 0x00
    .byte 0x33
    .byte 0xB3

    .align 2, 0



_ts SD_Cloudy_3_FadeIn
    push       {lr}
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    ldrb       r3,[r5,#0x6]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    ldr        r6,[r6,r3]
    ldr        r6,[r6,#0x74]
    ldr        r7,[r6,#0x4c]
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    tst        r0,r1
    bne        LAB_080997ca
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_080997ca:
    pop        {pc}


_ts SD_Cloudy_4_Free
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080997e6
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080997e6:
    pop        {pc}


_ts FUN_080997e8
    push       {lr}
    ldrb       r0,[r5,#0x6]
    lsl        r3,r0,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0809981c
    ldr        r1,[r7,r3]
    ldr        r7,PTR_PanelFlag_ARRAY_08099820
    ldr        r2,[r7,r3]
    bl         Field_GetFirstColumnFront
    tst        r0,r0
    bne        LAB_0809980a
    ldrb       r0,[r5,#0x6]
    bl         Field_GetFirstWalkableColumnFront
    tst        r0,r0
    bne        LAB_0809980a
    mov        r0,#0x6
LAB_0809980a:
    add        r1,r0,#0x0
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r2,[r5,#0x6]
    lsl        r2,r2,#0x2
    add        r2,#0x40
    ldr        r7,[r7,r2]
    ldrb       r2,[r7,#0x19]
    pop        {pc}

PTR_PanelFlag_ARRAY_0809981c:
    .word PanelFlag_ARRAY_08099824

PTR_PanelFlag_ARRAY_08099820:
    .word PanelFlag_ARRAY_0809982c

PanelFlag_ARRAY_08099824:
    .word PF_EnemyTerritory | PF_EnemyOccupied
    .word PF_PlayerOccupied

PanelFlag_ARRAY_0809982c:
    .word 0
    .word PF_EnemyTerritory
