#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_LifeVirusSword
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_LifeVirusSword_0_Init_08077c40
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_LifeVirusSword_0_Init_08077c40:
    .word PTR_A_LifeVirusSword_0_Init_08077c44

PTR_A_LifeVirusSword_0_Init_08077c44:
    .word A_LifeVirusSword_0_Init
    .word A_LifeVirusSword_1_Main
    .word A_LifeVirusSword_2_Free


_ts A_LifeVirusSword_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xc6
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x2
    bl         SpritePtr_SetPriority
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r3,#0x6
    ldr        r4,PTR_CellPosition_ARRAY_08077cd0
    mov        r7,#0x60
    add        r7,r7,r5
LAB_08077c86:
    push       {r3,r4,r7}
    bl         FieldObject_Alloc
    add        r6,r0,#0x0
    pop        {r3,r4,r7}
    tst        r6,r6
    beq        LAB_08077cae
    ldrh       r0,[r4,#0x0]
    strh       r0,[r6,#0x2]
    strh       r0,[r6,#0x4]
    ldrh       r0,[r5,#0x24]
    strh       r0,[r6,#0x8]
    mov        r0,#0x0
    strb       r0,[r6,#0x6]
    ldr        r0,PanelFlag_08077cd4
    str        r0,[r6,#0xc]
    str        r6,[r7,#0x0]
    add        r0,r6,#0x0
    bl         FieldObject_Disable
LAB_08077cae:
    add        r4,#0x2
    add        r7,#0x4
    sub        r3,#0x1
    bgt        LAB_08077c86
    mov        r0,#0xd5
    bl         Sound_PlaySE
    bl         A_LifeVirusSword_1_Main
    pop        {pc}

CellPosition_ARRAY_08077cc2:
    cell_pos 2, 1
    cell_pos 2, 2
    cell_pos 2, 3
    cell_pos 3, 1
    cell_pos 3, 2
    cell_pos 3, 3

    .align 2, 0


PTR_CellPosition_ARRAY_08077cd0:
    .word CellPosition_ARRAY_08077cc2

PanelFlag_08077cd4:
    .word PF_Ground | PF_Enemy | PF_Break


_ts A_LifeVirusSword_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LifeVirusSword_1_0_08077cf8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_LifeVirusSword_1_0_08077ce8:
    .word A_LifeVirusSword_1_0
    .word A_LifeVirusSword_1_1
    .word A_LifeVirusSword_1_2
    .word A_LifeVirusSword_1_3

PTR_PTR_A_LifeVirusSword_1_0_08077cf8:
    .word PTR_A_LifeVirusSword_1_0_08077ce8


_ts A_LifeVirusSword_1_0
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts A_LifeVirusSword_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x2c
    bne        LAB_08077d22
    bl         A_LifeVirusSword_EnableHitbox
    mov        r0,#0xd6
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08077d22:
    pop        {pc}


_ts A_LifeVirusSword_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    add        r0,#0x1
    strh       r0,[r5,#0x1c]
    cmp        r0,#0x2f
    bne        LAB_08077d38
    bl         A_LifeSword_DisableHitbox
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_08077d38:
    pop        {pc}


_nt A_LifeVirusSword_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08077d4e
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08077d4e:
    pop        {pc}


_ts A_LifeVirusSword_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_LifeVirusSword_2_0_08077d64
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_LifeVirusSword_2_0_08077d60:
    .word A_LifeVirusSword_2_0

PTR_PTR_A_LifeVirusSword_2_0_08077d64:
    .word PTR_A_LifeVirusSword_2_0_08077d60


_ts A_LifeVirusSword_2_0
    push       {lr}
    mov        r7,#0x60
    add        r7,r7,r5
    mov        r3,#0x0
LAB_08077d70:
    push       {r3,r7}
    ldr        r0,[r7,#0x0]
    bl         FieldObject_Free
    pop        {r3,r7}
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x6
    blt        LAB_08077d70
    bl         Attack_Free
    pop        {pc}


_ts Attack_LifeVirusSword_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x45
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08077dba
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
    strh       r6,[r7,#0x24]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    mov        r2,#0x1e
    lsl        r2,r2,#0x10
    add        r1,r1,r2
    str        r1,[r7,#0x2c]
    mov        r2,#0x26
    lsl        r2,r2,#0x10
    str        r2,[r7,#0x30]
    str        r5,[r7,#0x78]
LAB_08077dba:
    add        r0,r7,#0x0
    pop        {pc}


_nt A_LifeVirusSword_EnableHitbox
    push       {lr}
    mov        r7,#0x60
    add        r7,r7,r5
    mov        r3,#0x0
LAB_08077dc6:
    ldr        r0,[r7,#0x0]
    bl         FieldObject_Enable
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x6
    blt        LAB_08077dc6
    pop        {pc}


_nt A_LifeSword_DisableHitbox
    push       {lr}
    mov        r7,#0x60
    add        r7,r7,r5
    mov        r3,#0x0
LAB_08077dde:
    ldr        r0,[r7,#0x0]
    bl         FieldObject_Disable
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x6
    blt        LAB_08077dde
    pop        {pc}

    .align 2, 0

