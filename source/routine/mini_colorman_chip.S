#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_MiniColorMan_Chip
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,PTR_PTR_R_MiniColorManC_0_Init_08069d7c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MiniColorManC_0_Init_08069d7c:
    .word PTR_R_MiniColorManC_0_Init_08069d80

PTR_R_MiniColorManC_0_Init_08069d80:
    .word R_MiniColorManC_0_Init
    .word R_MiniColorManC_1_Main
    .word R_MiniColorManC_2_Free


_ts R_MiniColorManC_0_Init
    push       {lr}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0xa5
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_owner]
    neg        r0,r0
    add        r0,#0x1
    bl         SpritePtr_SetFlipType
    ldrb       r0,[r5,#Actor_family_family]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Actor_pos_curr_x]
    str        r1,[r5,#Actor_pos_curr_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_pos_curr_z]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_MiniColorManC_1_Main
    pop        {pc}


_nt R_MiniColorManC_1_Main
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,PTR_PTR_R_MiniColorManC_1_0_08069dec
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_MiniColorManC_1_0_08069dec:
    .word PTR_R_MiniColorManC_1_0_08069df0

PTR_R_MiniColorManC_1_0_08069df0:
    .word R_MiniColorManC_1_0
    .word R_MiniColorManC_1_1
    .word R_MiniColorManC_1_2


_ts R_MiniColorManC_1_0
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_MiniColorManC_1_0_0_08069e0c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MiniColorManC_1_0_0_08069e0c:
    .word PTR_R_MiniColorManC_1_0_0_08069e10

PTR_R_MiniColorManC_1_0_0_08069e10:
    .word R_MiniColorManC_1_0_0
    .word R_MiniColorManC_1_0_1


_ts R_MiniColorManC_1_0_0
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08069e4e
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0x10
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08069e44
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
LAB_08069e44:
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
LAB_08069e4e:
    pop        {pc}


_ts R_MiniColorManC_1_0_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08069e62
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08069e62:
    pop        {pc}


_ts R_MiniColorManC_1_1
    push       {lr}
    ldrb       r0,[r5,#Actor_state_s2]
    ldr        r7,PTR_PTR_R_MiniColorManC_1_1_0_08069e74
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_MiniColorManC_1_1_0_08069e74:
    .word PTR_R_MiniColorManC_1_1_0_08069e78

PTR_R_MiniColorManC_1_1_0_08069e78:
    .word R_MiniColorManC_1_1_0
    .word R_MiniColorManC_1_1_1
    .word R_MiniColorManC_1_1_2


_ts R_MiniColorManC_1_1_0
    push       {lr}
    ldr        r7,PTR_DAT_08069e98
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x4
    strh       r0,[r5,#Actor_state_s2]
    pop        {pc}

    .align 2, 0


PTR_DAT_08069e98:
    .word DAT_08069e9c

DAT_08069e9c:
    .byte 0x79
    .byte 0x00
    .byte 0x01

    .align 2, 0



_ts R_MiniColorManC_1_1_1
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08069edc
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    mov        r2,#0x0
    ldr        r7,PTR_DAT_08069ee4
    ldrb       r3,[r5,#Actor_family_family]
    lsl        r3,r3,#0x1
    add        r7,r7,r3
    ldrb       r3,[r7,#0x0]
    ldrb       r4,[r7,#0x1]
    ldrh       r6,[r5,#Actor_damage]
    bl         Attack_Tower_Create
    tst        r7,r7
    beq        LAB_08069ece
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08069ece:
    ldr        r7,PTR_USHORT_ARRAY_08069ee0
    ldrb       r0,[r5,#Actor_family_family]
    lsl        r0,r0,#0x1
    ldrh       r0,[r7,r0]
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strh       r0,[r5,#Actor_state_s2]
LAB_08069edc:
    pop        {pc}

    .align 2, 0


PTR_USHORT_ARRAY_08069ee0:
    .word USHORT_ARRAY_08069ee8

PTR_DAT_08069ee4:
    .word DAT_08069eec

USHORT_ARRAY_08069ee8:
    .short 0x78
    .short 0xF0

DAT_08069eec:
    .byte 0x03

DAT_08069eed:
    .byte 0x85
    .byte 0x02
    .byte 0x84


_ts R_MiniColorManC_1_1_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08069f06
    mov        r0,#0x78
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Actor_state_s2]
LAB_08069f06:
    pop        {pc}


_ts R_MiniColorManC_1_2
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08069f44
    push       {r5}
    ldr        r1,[r5,#Actor_pos_curr_x]
    ldr        r2,[r5,#Actor_pos_curr_y]
    ldr        r3,[r5,#Actor_pos_curr_z]
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xf
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08069f32
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
LAB_08069f32:
    pop        {r5}
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_08069f44:
    pop        {pc}


_nt R_MiniColorManC_2_Free
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_08069f54
    bl         Actor_Free
LAB_08069f54:
    pop        {pc}


_nt Routine_MiniColorMan_Chip_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x3b
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_08069f70
    strb       r0,[r7,#0x16]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
LAB_08069f70:
    pop        {pc}

    .align 2, 0

