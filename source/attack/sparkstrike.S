#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_SparkStrike
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_SparkStrike_0_Init_08075264
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_SparkStrike_0_Init_08075258:
    .word A_SparkStrike_0_Init
    .word A_SparkStrike_1_Main
    .word A_SparkStrike_2_Free

PTR_PTR_A_SparkStrike_0_Init_08075264:
    .word PTR_A_SparkStrike_0_Init_08075258


_ts A_SparkStrike_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xaa
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    mov        r0,#0x14
    lsl        r0,r0,#0x10
    str        r0,[r5,#Attack_pos_curr_z]
    mov        r0,#0x1
    strb       r0,[r5,#Attack_element]
    mov        r7,#0x1e
    strh       r7,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    bcs        LAB_080752b2
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_080752bc
    mov        r6,#0x0
    mov        r7,#0x1e
    bl         Attack_SharpStrike_Create
LAB_080752b2:
    mov        r0,#0x4
    str        r0,[r5,#Attack_state_s0]
    bl         A_SparkStrike_1_Main
    pop        {pc}

DAT_080752bc:
    strike_attribute PFI_Grounded, effect_target=0, effect_type=QE_ShortExplosion


_ts A_SparkStrike_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_SparkStrike_1_0_080752d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_SparkStrike_1_0_080752d4:
    .word PTR_A_SparkStrike_1_0_080752d8

PTR_A_SparkStrike_1_0_080752d8:
    .word A_SparkStrike_1_0
    .word A_SparkStrike_1_1
    .word A_SparkStrike_1_2


_ts A_SparkStrike_1_0
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807530c
    mov        r0,#0x9
    strh       r0,[r5,#Attack_counterA]
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_frameIndexLast]
    mov        r0,#0xbb
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807530c:
    pop        {pc}


_nt A_SparkStrike_1_1
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08075356
    mov        r0,#0x1
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,FamilyDetail_08075358
    ldrh       r6,[r5,#Attack_damage]
    mov        r7,#0x1
    push       {r0}
    ldrb       r0,[r5,#Attack_family_family]
    lsl        r0,r0,#0x19
    pop        {r0}
    bcc        LAB_0807534a
    bl         Field_CreateSharpStrikeAttack
    mov        r0,#0x19
    ldr        r3,[r5,#Attack_pos_curr_z]
    bl         Field_CreateStrikeEffect
    tst        r7,r7
    beq        LAB_0807534a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
    b          LAB_0807534e
LAB_0807534a:
    bl         Attack_SharpStrike_Create
LAB_0807534e:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08075356:
    pop        {pc}

FamilyDetail_08075358:
    strike_attribute PFI_Self_Grounded, effect_target=PFI_Target_Solid, effect_type=QE_SwordStrike


_ts A_SparkStrike_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807536c
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_0807536c:
    pop        {pc}


_nt A_SparkStrike_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt Attack_SparkStrike_Create
    push       {lr}
    push       {r1,r2,r5,r6}
    mov        r0,#0x32
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08075392
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_08075392:
    pop        {pc}
