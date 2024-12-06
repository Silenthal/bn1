#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts ScreenDim_Geddon
    push       {lr}
    ldr        r7,PTR_PTR_SD_Geddon_0_080994c8
    ldrb       r0,[r5,#0x0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_SD_Geddon_0_080994c8:
    .word PTR_SD_Geddon_0_080994cc

PTR_SD_Geddon_0_080994cc:
    .word SD_Geddon_0
    .word SD_Geddon_1
    .word SD_Geddon_2
    .word SD_Geddon_3
    .word SD_Geddon_4


_ts SD_Geddon_0
    push       {lr}
    mov        r0,#0x6
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1e
    strh       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_SD_Geddon_0_0_0809951c
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    str        r7,[r5,#0x14]
    ldrb       r1,[r5,#0x5]
    add        r1,#0x4f
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

    .align 2, 0


PTR_PTR_SD_Geddon_0_0_0809951c:
    .word PTR_SD_Geddon_0_0_08099520

PTR_SD_Geddon_0_0_08099520:
    .word SD_Geddon_0_0
    .word SD_Geddon_0_1


_ts SD_Geddon_1
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Main
    pop        {r5}
    tst        r0,r0
    bne        LAB_08099556
    push       {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    bl         BattleMessage_Disable
    pop        {r5}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099556
    mov        r0,#0x30
    strh       r0,[r5,#0x8]
    mov        r0,#0x8
    str        r0,[r5,#0x0]
LAB_08099556:
    pop        {pc}


_ts SD_Geddon_2
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809956a
    mov        r0,#0x6
    strh       r0,[r5,#0x8]
    mov        r0,#0xc
    str        r0,[r5,#0x0]
LAB_0809956a:
    pop        {pc}


_ts SD_Geddon_3
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldr        r7,[r5,#0x14]
    mov        lr,pc
    bx         r7
    tst        r0,r0
    bne        LAB_0809958e
    mov        r0,#0x5
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x10
    str        r0,[r5,#0x0]
LAB_0809958e:
    pop        {pc}


_ts SD_Geddon_4
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080995aa
    push       {r5}
    bl         BattleUi_DrawActiveChip
    pop        {r5}
    bl         ScreenDim_Free
LAB_080995aa:
    pop        {pc}


_ts SD_Geddon_0_0
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_08099614
    mov        r0,#0x6
    strh       r0,[r5,#0x8]
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,PanelFlag_08099620
    ldr        r2,PanelFlag_08099624
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_08099618
    push       {r0}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    pop        {r0}
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    push       {r0,r1}
    bl         Field_CrackPanel
    pop        {r0,r1}
    push       {r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0809960a
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_0809960a:
    pop        {r5}
    mov        r0,#0x7b
    bl         Sound_PlaySongImmediate
    add        sp,#0x14
LAB_08099614:
    mov        r0,#0x1
    pop        {pc}
LAB_08099618:
    mov        r0,#0x0
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


PanelFlag_08099620:
    .word PF_Walkable

PanelFlag_08099624:
    .word PF_Cracked


_ts SD_Geddon_0_1
    push       {lr}
    ldrh       r0,[r5,#0x8]
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    bne        LAB_0809969e
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    sub        sp,#0x14
    mov        r0,sp
    ldr        r1,PanelFlag_080996a8
    ldr        r2,PanelFlag_080996ac
    push       {r0}
    bl         Field_Search
    pop        {r0}
    tst        r1,r1
    beq        LAB_080996a2
    push       {r0}
    push       {r1}
    bl         Rng_RandomInt
    pop        {r1}
    bl         SWI_Div
    pop        {r0}
    ldrb       r0,[r0,r1]
    bl         Field_IndexToCellXY
    push       {r0,r1}
    bl         Field_CrackPanel
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    pop        {r0,r1}
    push       {r0,r1}
    bl         Field_CrackPanel
    pop        {r0,r1}
    push       {r5}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x2b
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08099694
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08099694:
    pop        {r5}
    mov        r0,#0x7b
    bl         Sound_PlaySongImmediate
    add        sp,#0x14
LAB_0809969e:
    mov        r0,#0x1
    pop        {pc}
LAB_080996a2:
    mov        r0,#0x0
    add        sp,#0x14
    pop        {pc}

PanelFlag_080996a8:
    .word PF_Walkable

PanelFlag_080996ac:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed
