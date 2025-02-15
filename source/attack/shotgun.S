#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Shotgun
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Shotgun_0_Init_080703b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Shotgun_0_Init_080703b8:
    .word PTR_A_Shotgun_0_Init_080703bc

PTR_A_Shotgun_0_Init_080703bc:
    .word A_Shotgun_0_Init
    .word A_Shotgun_1_Main
    .word A_Shotgun_2_Free


_ts A_Shotgun_0_Init
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    str        r0,[r5,#0x44]
    mov        r0,#0x1
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         A_Shotgun_1_Main
    pop        {pc}


_ts A_Shotgun_1_Main
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_08070416
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_Shotgun_CheckTargetDamage
    tst        r0,r0
    bne        LAB_0807040e
    ldrb       r0,[r5,#0x18]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    strb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    beq        LAB_08070416
LAB_0807040e:
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    pop        {pc}
LAB_08070416:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    pop        {pc}


_nt A_Shotgun_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_ts A_Shotgun_CheckTargetDamage
    push       {lr}
    mov        r0,#0x2
    ldr        r1,[r5,#0x60]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08070478
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    ldr        r7,PTR_DAT_0807047c
    ldrb       r4,[r5,#0x4]
    ldrb       r4,[r7,r4]
    push       {r5}
    bl         Effect_QuickEffect_Create
    pop        {r5}
    bl         A_Shotgun_CreateExtraHits
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    bhi        LAB_08070470
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsSpread
LAB_08070470:
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    mov        r0,#0x1
    pop        {pc}
LAB_08070478:
    mov        r0,#0x0
    pop        {pc}

PTR_DAT_0807047c:
    .word DAT_08070480

DAT_08070480:
    .byte QE_ShotgunHit
    .byte QE_BubblerHit
    .byte QE_HeaterHit
    .byte QE_ShotgunHit
    .byte QE_ShotgunHit

    .align 2, 0


_ts A_Shotgun_CreateExtraHits
    push       {lr}
    ldrb       r0,[r5,#0x4]
    ldr        r7,ptrListShotgunSoundEffect
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_08070498
    bl         Sound_PlaySE
LAB_08070498:
    ldr        r7,ptrListExtraPanelCount
    ldrb       r4,[r5,#0x4]
    ldrb       r6,[r7,r4]
    lsl        r4,r4,#0x2
LAB_080704a0:
    sub        r6,#0x2
    bmi        LAB_080704e8
    ldr        r7,ptrListExtraPanels
    ldr        r7,[r7,r4]
    add        r7,r7,r6
    mov        r3,#0x0
    ldrsb      r0,[r7,r3]
    mov        r3,#0x1
    ldrsb      r1,[r7,r3]
    ldr        r2,[r5,#0x44]
    mul        r0,r2
    ldrb       r2,[r5,#0x18]
    add        r0,r0,r2
    ldrb       r2,[r5,#0x19]
    add        r1,r1,r2
    push       {r0,r1,r4,r6}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r4,r6}
    beq        LAB_080704a0
    push       {r4,r6}
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    ldr        r3,[r5,#0x30]
    bl         Field_GetRandomXZPosOnTarget
    ldrb       r4,[r5,#0x4]
    ldrb       r0,[r5,#0x1a]
    ldrh       r6,[r5,#0x24]
    bl         Attack_ShotgunBurst_Create
    pop        {r4,r6}
    b          LAB_080704a0
LAB_080704e8:
    pop        {pc}

    .align 2, 0


ptrListExtraPanels:
    .word listExtraPanels

ptrListExtraPanelCount:
    .word listExtraPanelCount

ptrListShotgunSoundEffect:
    .word listShotgunSoundEffect

listExtraPanels:
    .word listShotgunExtraPanels
    .word listShotgunExtraPanels
    .word listShotgunExtraPanels
    .word listShotgunExtraPanels
    .word listCrossgunExtraPanels

listExtraPanelCount:
    .byte 8 << 1
    .byte 8 << 1
    .byte 8 << 1
    .byte 1 << 1
    .byte 4 << 1

listShotgunSoundEffect:
    .byte 0
    .byte SE_Battle_Bubbler
    .byte SE_Battle_Heater
    .byte 0
    .byte 0

listShotgunExtraPanels:
    cell_pos 1, 0
    cell_pos 0, -1
    cell_pos 0, 1
    cell_pos -1, 0
    cell_pos 1, -1
    cell_pos 1, 1
    cell_pos -1, -1
    cell_pos -1, 1

listCrossgunExtraPanels:
    cell_pos 1, -1
    cell_pos 1, 1
    cell_pos -1, -1
    cell_pos -1, 1
    cell_pos 0, 0


_ts Attack_Shotgun_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0xc
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    tst        r7,r7
    beq        LAB_08070552
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    mov        r0,#0x9
    strb       r0,[r7,#0x0]
LAB_08070552:
    pop        {pc}
