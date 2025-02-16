#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


DAT_0807773c:
    .byte 0x19
    .byte 0x0C
    .byte 0x08

    .align 2, 0


_ts Attack_Tornado_Chip
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_TornadoC_0_Init_0807775c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_TornadoC_0_Init_08077750:
    .word A_TornadoC_0_Init
    .word A_TornadoC_1_Main
    .word A_TornadoC_2_Free

PTR_PTR_A_TornadoC_0_Init_0807775c:
    .word PTR_A_TornadoC_0_Init_08077750


_ts A_TornadoC_0_Init
    push       {lr}
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_080777c6
    mov        r0,#0xc9
    bl         Sound_PlaySE
    ldr        r7,PTR_DAT_080777cc
    ldrb       r0,[r5,#Attack_family_family]
    add        r7,r7,r0
    str        r7,[r5,#Attack_param_64]
    mov        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x3c
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xac
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x0
    strb       r0,[r5,#Attack_element]
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_TornadoC_1_Main
    pop        {pc}
LAB_080777c6:
    bl         Attack_Free
    pop        {pc}

PTR_DAT_080777cc:
    .word DAT_0807773c


_ts A_TornadoC_1_Main
    push       {lr}
    bl         Battle_IsInputLocked
    beq        LAB_080777de
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}
LAB_080777de:
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_TornadoC_1_0_080777f0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_TornadoC_1_0_080777f0:
    .word PTR_A_TornadoC_1_0_080777f4

PTR_A_TornadoC_1_0_080777f4:
    .word A_TornadoC_1_0


_ts A_TornadoC_1_0
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    beq        LAB_08077826
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bne        LAB_0807782a
    ldrb       r0,[r5,#Attack_element]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,PTR_DAT_0807782c
    ldrh       r6,[r5,#Attack_damage]
    ldr        r7,[r5,#Attack_param_64]
    ldrb       r7,[r7,#0x0]
    bl         Attack_SharpStrike_Create
    ldr        r7,[r5,#Attack_param_64]
    ldrb       r0,[r7,#0x0]
    strh       r0,[r5,#Attack_counterB]
    pop        {pc}
LAB_08077826:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_0807782a:
    pop        {pc}

PTR_DAT_0807782c:
    .word 0x2030019


_ts A_TornadoC_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_ts Attack_Tornado_Chip_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x43
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08077854
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08077854:
    pop        {pc}

    .align 2, 0

