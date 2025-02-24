#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Invisible
    push       {lr}
    ldr        r7,PTR_PTR_SD_Invisible_0_Init_08099124
    ldrb       r0,[r5,#ScreenDim_state_s0]
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
    FadeOut_ScreenDim
    SD_SetTimer 0x1e
    ldr        r7,PTR_DAT_08099180
    ldrb       r1,[r5,#ScreenDim_subFamily]
    ldrb       r1,[r7,r1]
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
    SD_ShowMessage
    tst        r0,r0
    bne        LAB_080991d2
    SD_HideMessage
    SD_DecreaseTimer
    bne        LAB_080991d2
    ldr        r7,PTR_InvisArg_ARRAY_080991d4
    ldrb       r0,[r5,#ScreenDim_subFamily]
    lsl        r0,r0,#0x2
    ldrh       r1,[r7,r0]
    add        r0,#0x2
    ldrb       r2,[r7,r0]
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         R_Player_SetInvisible
    mov        r0,#0x91
    bl         Sound_PlaySE
    SD_SetTimer 0x3c
    mov        r0,#0x8
    str        r0,[r5,#ScreenDim_state_s0]
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
    SD_DecreaseTimer
    bne        LAB_0809920a
    FadeIn_ScreenDim
    mov        r0,#0xc
    str        r0,[r5,#ScreenDim_state_s0]
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
    ldrb       r0,[r5,#ScreenDim_owner]
    bl         Field_GetActorById
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

