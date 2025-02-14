#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_IceManSpikes
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_IceManSpikes_0_Init_0807421c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_IceManSpikes_0_Init_08074210:
    .word A_IceManSpikes_0_Init
    .word A_IceManSpikes_1_Main
    .word A_IceManSpikes_2_Free

PTR_PTR_A_IceManSpikes_0_Init_0807421c:
    .word PTR_A_IceManSpikes_0_Init_08074210


_ts A_IceManSpikes_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    mov        r0,#0x1
    mov        r1,#0x9d
    bl         Sprite_InitSpritePtr
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_IceManSpikes_1_Main
    pop        {pc}


_ts A_IceManSpikes_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_IceManSpikes_1_0_Move_08074270
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_IceManSpikes_1_0_Move_08074270:
    .word PTR_A_IceManSpikes_1_0_Move_08074274

PTR_A_IceManSpikes_1_0_Move_08074274:
    .word A_IceManSpikes_1_0_Move
    .word A_IceManSpikes_1_1_Next


_ts A_IceManSpikes_1_0_Move
    push       {lr}
    mov        r0,#0xff
    strb       r0,[r5,#0x15]
    ldrb       r1,[r5,#0x18]
    ldr        r0,[r5,#0x44]
    add        r0,r0,r1
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_IsEntityCellPositionValid
    tst        r0,r0
    beq        LAB_0807430a
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080742f8
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_listIceManSpikesTargetFlags_08074318
    ldr        r1,[r7,r1]
    and        r0,r1
    cmp        r0,r1
    bne        LAB_080742e0
    ldrb       r0,[r5,#0x1a]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r4,#0x19
    mov        r6,#0x2
    lsl        r6,r6,#0x18
    orr        r4,r6
    mov        r6,#0x16
    lsl        r6,r6,#0x10
    orr        r4,r6
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
LAB_080742e0:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x9c
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_080742f8:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0807430a:
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}

PTR_listIceManSpikesTargetFlags_08074318:
    .word listIceManSpikesTargetFlags

listIceManSpikesTargetFlags:
    .word PF_EnemyOccupied | PF_ActorEnemy
    .word PF_PlayerOccupied | PF_ActorPlayer


_ts A_IceManSpikes_1_1_Next
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08074336
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strh       r0,[r5,#0xa]
LAB_08074336:
    pop        {pc}


_ts A_IceManSpikes_2_Free
    push       {lr}
    ldr        r7,[r5,#0x60]
    tst        r7,r7
    beq        LAB_08074344
    mov        r0,#0x1
    strb       r0,[r7,#0x7]
LAB_08074344:
    bl         Attack_Free
    pop        {pc}


_nt Attack_IceManSpikes_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x2b
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_0807436a
    strb       r0,[r7,#0x1a]
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    str        r5,[r7,#0x60]
LAB_0807436a:
    pop        {pc}
