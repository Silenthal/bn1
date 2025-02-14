#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


BYTE_ARRAY_08073cd8:
    .byte 0x05
    .byte 0x05
    .byte 0x04
    .byte 0x04
    .byte 0x04
    .byte 0x04
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x02
    .byte 0x02
    .byte 0x02
    .byte 0x01
    .byte 0x01
    .byte 0x00


_ts Attack_DieBomb_Chip
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_DieBombC_0_Init_08073cf8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_DieBombC_0_Init_08073cf8:
    .word PTR_A_DieBombC_0_Init_08073cfc

PTR_A_DieBombC_0_Init_08073cfc:
    .word A_DieBombC_0_Init
    .word A_DieBombC_1_Main
    .word A_DieBombC_2_Free


_ts A_DieBombC_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x85
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x40
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x30]
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_DieBombC_1_Main
    pop        {pc}


_nt A_DieBombC_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_DieBombC_1_0_Bounce_08073d58
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_A_DieBombC_1_0_Bounce_08073d58:
    .word PTR_A_DieBombC_1_0_Bounce_08073d5c

PTR_A_DieBombC_1_0_Bounce_08073d5c:
    .word A_DieBombC_1_0_Bounce
    .word A_DieBombC_1_1_Land
    .word A_DieBombC_1_2_Prime
    .word A_DieBombC_1_3_Next


_ts A_DieBombC_1_0_Bounce
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073d96
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0x0
    str        r0,[r5,#0x4c]
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r1,r0
    ldr        r7,PTR_BYTE_ARRAY_08073d98
    ldrb       r0,[r7,r1]
    strb       r0,[r5,#0x5]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08073d96:
    pop        {pc}

PTR_BYTE_ARRAY_08073d98:
    .word BYTE_ARRAY_08073cd8


_ts A_DieBombC_1_1_Land
    push       {lr}
    ldr        r0,[r5,#0x4c]
    ldr        r1,DAT_08073dec
    add        r0,r0,r1
    str        r0,[r5,#0x4c]
    ldr        r1,[r5,#0x30]
    add        r1,r1,r0
    str        r1,[r5,#0x30]
    bgt        LAB_08073dea
    mov        r1,#0x0
    str        r1,[r5,#0x30]
    neg        r0,r0
    asr        r0,r0,#0x1
    str        r0,[r5,#0x4c]
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bpl        LAB_08073dea
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    strb       r0,[r5,#0x14]
    push       {r5}
    ldrh       r1,[r5,#0x24]
    ldrb       r2,[r5,#0x5]
    add        r2,#0x1
    ldrb       r0,[r5,#0x16]
    add        r0,#0x6
    bl         BattleMessage_Load
    pop        {r5}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    ldrh       r1,[r5,#0x24]
    mul        r1,r0
    strh       r1,[r5,#0x24]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08073dea:
    pop        {pc}

DAT_08073dec:
    .word 0xFFFFD800


_ts A_DieBombC_1_2_Prime
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x16]
    add        r0,#0x6
    bl         BattleMessage_Main
    pop        {r5}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073e1e
    push       {r5}
    ldrb       r0,[r5,#0x16]
    add        r0,#0x6
    bl         BattleMessage_Disable
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0x14]
    mov        r0,#0x3
    strh       r0,[r5,#0x1c]
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_08073e1e:
    pop        {pc}


_ts A_DieBombC_1_3_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08073e38
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08073e38
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08073e38:
    pop        {pc}


_nt A_DieBombC_2_Free
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r0}
    bl         Field_GetPanelFlags
    mov        r1,#0x2
    and        r0,r1
    eor        r0,r1
    lsr        r0,r0,#0x1
    pop        {r1}
    ldrh       r6,[r5,#0x24]
    mov        r2,#0x1
LAB_08073e5a:
    mov        r4,#0x0
    bl         Effect_DieBombExplosion_Create
    tst        r7,r7
    beq        LAB_08073e6c
    ldrb       r3,[r7,#0x0]
    mov        r4,#0x4
    orr        r3,r4
    strb       r3,[r7,#0x0]
LAB_08073e6c:
    add        r2,#0x1
    cmp        r2,#0x4
    bne        LAB_08073e5a
    bl         Attack_Free
    pop        {pc}


_ts Attack_DieBombChip_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x28
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08073e94
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_08073e94:
    pop        {pc}

    .align 2, 0

