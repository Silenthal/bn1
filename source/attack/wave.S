#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Wave
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_Wave_0_Init_08074380
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Wave_0_Init_08074380:
    .word PTR_A_Wave_0_Init_08074384

PTR_A_Wave_0_Init_08074384:
    .word A_Wave_0_Init
    .word A_Wave_1_Main
    .word A_Wave_2_Free


_ts A_Wave_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xa3
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#Attack_family_family]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    mov        r0,#0x24
    strh       r0,[r5,#Attack_counterA]
    FieldObject_Create PFI_Self_Grounded, Attack_param_60
    ldrb       r0,[r5,#Attack_owner]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0xb3
    bl         Sound_PlaySE
    pop        {pc}


_nt A_Wave_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         A_Wave_IsStopped
    tst        r0,r0
    beq        LAB_08074406
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    b          LAB_0807442a
LAB_08074406:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807442a
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
    bl         A_Wave_CheckNextPanel
    cmp        r0,#0xff
    beq        LAB_0807442a
    ldrb       r2,[r5,#Attack_element]
    ldrb       r4,[r5,#Attack_family_family]
    ldrh       r6,[r5,#Attack_damage]
    bl         Attack_Wave_Create
LAB_0807442a:
    pop        {pc}


_ts A_Wave_2_Free
    push       {lr}
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt Attack_Wave_Create
    push       {lr}
    push       {r0,r1,r2,r5}
    mov        r0,#0x2c
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5}
    tst        r7,r7
    beq        LAB_0807446c
    strb       r2,[r7,#0x1a]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r2,[r5,#Attack_owner]
    strb       r2,[r7,#0x16]
    ldrb       r0,[r7,#0x18]
    ldrb       r1,[r7,#0x19]
    push       {r7}
    bl         Battle_CellCoordsToSprite
    pop        {r7}
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_0807446c:
    pop        {pc}


_nt A_Wave_CheckNextPanel
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#Attack_cPos_x]
    add        r0,r0,r1
    ldrb       r1,[r5,#Attack_cPos_y]
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    tst        r0,r0
    pop        {r0,r1}
    bne        LAB_080744a4
    push       {r0,r1}
    bl         FieldObject_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1}
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_080744a4
    ldrb       r3,[r5,#Attack_owner]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_listWaveStopPanelFlags_080744a8
    ldr        r3,[r7,r3]
    tst        r2,r3
    bne        LAB_080744a4
    b          LAB_080744a6
LAB_080744a4:
    mov        r0,#0xff
LAB_080744a6:
    pop        {pc}

PTR_listWaveStopPanelFlags_080744a8:
    .word listWaveStopPanelFlags

listWaveStopPanelFlags:
    .word PF_PlayerOccupied | PF_Solid
    .word PF_EnemyOccupied | PF_Solid


_ts Attack_Wave_CreateColumn
    push       {lr}
    mov        r1,#0x1
    push       {r0,r2,r4,r6}
    bl         Attack_Wave_Create
    pop        {r0,r2,r4,r6}
    mov        r1,#0x2
    push       {r0,r2,r4,r6}
    bl         Attack_Wave_Create
    pop        {r0,r2,r4,r6}
    mov        r1,#0x3
    bl         Attack_Wave_Create
    pop        {pc}


_nt A_Wave_IsStopped
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    mov        r3,#0x1
    tst        r0,r1
    beq        LAB_080744ec
    ldr        r1,PanelFlag_080744f4
    tst        r0,r1
    bne        LAB_080744ec
    mov        r3,#0x0
LAB_080744ec:
    add        r0,r3,#0x0
    pop        {pc}
    .word PanelFlag_080744f4

PanelFlag_080744f4:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
