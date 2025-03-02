#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BattleHP
    push       {lr}
    LoadMain battle, r7, r7
    ldrb       r1,[r7,#Battle_battleState]
    mov        r0,#0x5
    and        r1,r0
    cmp        r1,#0x5
    bne        LAB_0807ba7a
    ldr        r6,[r5,#Effect_parent]
    ldrb       r0,[r6,#0x0]
    tst        r0,r0
    bne        LAB_0807ba5e
    mov        r0,#0x8
    strb       r0,[r5,#Effect_state_s0]
    b          LAB_0807ba7a
LAB_0807ba5e:
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807ba7a
    ldrh       r1,[r6,#0x20]
    tst        r1,r1
    beq        LAB_0807ba7a
    ldrb       r1,[r5,#Effect_bc]
    tst        r1,r1
    beq        LAB_0807ba7a
    ldr        r7,PTR_PTR_E_BattleHP_0_Init_0807ba88
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_0807ba7a:
    pop        {pc}

PTR_E_BattleHP_0_Init_0807ba7c:
    .word E_BattleHP_0_Init
    .word E_BattleHP_1_Main
    .word E_BattleHP_2_Free

PTR_PTR_E_BattleHP_0_Init_0807ba88:
    .word PTR_E_BattleHP_0_Init_0807ba7c


_ts E_BattleHP_0_Init
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0xd
    strb       r0,[r5,#Effect_header_entityFlags]
    bl         E_BattleHP_1_Main
    pop        {pc}


_ts E_BattleHP_1_Main
    push       {lr}
    bl         E_BattleHP_CalculateFloatingNum
    ldrb       r0,[r5,#Effect_family_b2]
    tst        r0,r0
    beq        LAB_0807baca
    ldr        r1,[r5,#Effect_extraX]
    ldr        r2,[r5,#Effect_extraY]
    asr        r1,r1,#0x10
    asr        r2,r2,#0x10
    ldrb       r3,[r5,#Effect_family_b1]
    mov        r4,#0x68
    add        r4,r4,r5
LAB_0807bab6:
    ldrb       r0,[r4,#0x0]
    push       {r1,r2,r3,r4,r6}
    mov        r3,#0x0
    bl         E_BattleHP_DrawFloatingDigit
    pop        {r1,r2,r3,r4,r6}
    sub        r1,#0x8
    add        r4,#0x1
    sub        r3,#0x1
    bne        LAB_0807bab6
LAB_0807baca:
    pop        {pc}


_ts E_BattleHP_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_BattleHP_Create
    push       {r5,lr}
    push       {r0}
    mov        r0,#0x2
    bl         Effect_Alloc
    pop        {r0}
    tst        r5,r5
    beq        LAB_0807baf2
    str        r0,[r5,#Effect_parent]
    ldrh       r1,[r0,#0x20]
    str        r1,[r5,#Effect_obj_60]
    mov        r0,#0xd
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    strb       r0,[r5,#Effect_bc]
LAB_0807baf2:
    pop        {r5,pc}


_ts E_BattleHP_DrawFloatingDigit
    push       {r5,lr}
    mov        r4,#0xff
    and        r1,r4
    and        r2,r4
    mov        r4,#0x80
    lsl        r4,r4,#0x8
    orr        r2,r4
    cmp        r0,#0xc
    bne        LAB_0807bb0e
    mov        r0,#0xb
    mov        r4,#0x10
    lsl        r4,r4,#0x8
    orr        r1,r4
LAB_0807bb0e:
    add        r3,#0xb
    lsl        r5,r3,#0xc
    mov        r4,#0xf
    and        r4,r0
    add        r4,r4,r4
    ldr        r3,DAT_0807bb30
    add        r3,r3,r4
    add        r3,r3,r5
    lsl        r1,r1,#0x10
    orr        r1,r2
    add        r0,r1,#0x0
    add        r1,r3,#0x0
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Battle_SpriteQueueAdd
    pop        {r5,pc}

DAT_0807bb30:
    .word 0xB90


_ts E_BattleHP_CalculateFloatingNum
    push       {lr}
    sub        sp,#0xc
    mov        r8,sp
    ldr        r6,[r5,#Effect_parent]
    ldrh       r0,[r6,#0x20]
    ldr        r1,[r5,#Effect_obj_60]
    cmp        r0,r1
    beq        LAB_0807bb58
    @@ When a floating num is rapidly decreased/increased, it has 4 added/subtracted
    @@ every frame till the target value is reached
    bmi        LAB_0807bb50
    add        r1,#0x4
    cmp        r1,r0
    ble        LAB_0807bb58
    add        r1,r0,#0x0
    b          LAB_0807bb58
LAB_0807bb50:
    sub        r1,#0x4
    cmp        r1,r0
    bge        LAB_0807bb58
    add        r1,r0,#0x0
LAB_0807bb58:
    str        r1,[r5,#Effect_obj_60]
    ldrb       r0,[r6,#0x13]
    bl         Enemy_GetEnemyDetail
    mov        r4,#0x3
    ldrsb      r1,[r0,r4]
    lsl        r1,r1,#0x10
    mov        r7,r8
    ldr        r0,[r6,#0x28]
    str        r0,[r7,#0x0]
    ldr        r0,[r6,#0x2c]
    str        r0,[r7,#0x4]
    ldr        r0,[r6,#0x30]
    add        r0,r0,r1
    str        r0,[r7,#0x8]
    add        r0,r7,#0x0
    bl         Entity_BattlePosToScreenPos
    @@ Returned:
    @@ r0: object X
    @@ r1: object Y
    @@ r2: isDraw
    mov        r3,#0x0
    mov        r4,#0xff
    cmp        r0,r4
    bhi        LAB_0807bb8a
    tst        r2,r2
    beq        LAB_0807bb8a
    mov        r3,#0x1
LAB_0807bb8a:
    strb       r3,[r5,#Effect_family_b2]
    lsl        r0,r0,#0x10
    lsl        r1,r1,#0x10
    str        r0,[r5,#Effect_pos_curr_x]
    str        r1,[r5,#Effect_pos_curr_y]
    ldr        r0,[r5,#Effect_obj_60]
    bl         ConvertNumToBCD
    str        r0,[r5,#Effect_obj_64]
    bl         GetWidthOfBcdNumber
    strb       r0,[r5,#Effect_family_b1]
    lsl        r0,r0,#0x2
    sub        r0,#0x8
    lsl        r0,r0,#0x10
    ldr        r1,[r5,#Effect_pos_curr_x]
    add        r1,r1,r0
    str        r1,[r5,#Effect_extraX]
    ldr        r1,[r5,#Effect_pos_curr_y]
    str        r1,[r5,#Effect_extraY]
    ldrb       r0,[r5,#Effect_family_b1]
    ldr        r1,[r5,#Effect_obj_64]
    mov        r2,#0x68
    add        r2,r2,r5
LAB_0807bbba:
    mov        r3,#0xf
    and        r3,r1
    strb       r3,[r2,#0x0]
    lsr        r1,r1,#0x4
    add        r2,#0x1
    sub        r0,#0x1
    bne        LAB_0807bbba
    add        sp,#0xc
    pop        {pc}


_ts Effect_BattleHP_CreateAll
    push       {r5,lr}
    LoadMain battle, r5, r5
    mov        r4,#0x0
    mov        r3,#0x54
LAB_0807bbd6:
    ldr        r6,[r5,r3]
    tst        r6,r6
    beq        LAB_0807bbe6
    push       {r3,r4,r5}
    add        r0,r6,#0x0
    bl         Effect_BattleHP_Create
    pop        {r3,r4,r5}
LAB_0807bbe6:
    add        r3,#0x4
    add        r4,#0x1
    cmp        r4,#0x4
    bne        LAB_0807bbd6
    pop        {r5,pc}
