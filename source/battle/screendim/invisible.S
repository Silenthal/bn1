#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Invisible
    push       {lr}
    ldr        r7,PTR_PTR_SD_Invisible_0_Init_08099124
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Invisible_0_Init_08099124:
    .word PTR_SD_Invisible_0_Init_08099128

PTR_SD_Invisible_0_Init_08099128:
    .word SD_Invisible_0_Init
    .word SD_Invisible_1
    .word SD_Invisible_2_FadeIn
    .word SD_Invisible_3_Free


_ts SD_Invisible_0_Init
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldr        r7,PTR_DAT_08099180
    ldrb       r1,[r5,#0x5]
    ldrb       r1,[r7,r1]
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
    bl         SpritePtr_ResetPalette
    pop        {r5}
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0


PTR_DAT_08099180:
    .word DAT_08099184

DAT_08099184:
    .byte 0x64
    .byte 0x65
    .byte 0x66
    .byte 0x89
    .byte 0x8A

    .align 2, 0



_ts SD_Invisible_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_080991d2
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_080991d2
    ldr        r7,PTR_InvisArg_ARRAY_080991d4
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x2
    ldrh       r1,[r7,r0]
    add        r0,#0x2
    ldrb       r2,[r7,r0]
    ldrb       r0,[r5,#0x6]
    bl         R_Player_SetInvisible
    mov        r0,#0x91
    bl         Sound_PlaySE
    mov        r0,#0x3c
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_080991d2:
    pop        {pc}

PTR_InvisArg_ARRAY_080991d4:
    .word InvisArg_ARRAY_080991d8

InvisArg_ARRAY_080991d8:
    .byte 0x68, 0x01, 0x01, 0x00
    .byte 0xE0, 0x01, 0x01, 0x00
    .byte 0x58, 0x02, 0x01, 0x00
    .byte 0x00, 0x00, 0x02, 0x00
    .byte 0x00, 0x00, 0x03, 0x00


_ts SD_Invisible_2_FadeIn
    push       {lr}
    bl         SD_Invisible_DoEffect
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809920a
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809920a:
    pop        {pc}


_ts SD_Invisible_3_Free
    push       {lr}
    bl         SD_Invisible_DoEffect
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0809922a
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_0809922a:
    pop        {pc}


_ts SD_Invisible_DoEffect
    push       {lr}
    ldrb       r0,[r5,#0x6]
    bl         Battle_GetPlayer
    tst        r7,r7
    beq        LAB_08099254
    LoadMain frameCounter, r6, r6
    ldrh       r0,[r6,#0x0]
    lsr        r0,r0,#0x1
    bcs        LAB_0809924c
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    pop        {pc}
LAB_0809924c:
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08099254:
    pop        {pc}

    .align 2, 0

