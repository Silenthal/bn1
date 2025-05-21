#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Steal
    push       {lr}
    ldr        r7,PTR_PTR_A_Steal_0_Init_08071844
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r0,[r7,r0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0


PTR_A_Steal_0_Init_080716c4:
    .word A_Steal_0_Init
    .word A_Steal_1_Main
    .word A_Steal_2_Free


_ts A_Steal_0_Init
    push       {lr}
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x3
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x7e
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_frameIndexLast]
    ldr        r0,DAT_08071718
    str        r0,[r5,#Attack_diff_z]
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Attack_pos_curr_x]
    str        r1,[r5,#Attack_pos_curr_y]
    ldr        r0,DAT_0807171c
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_0807170e
    mov        r0,#0x78
    bl         Sound_PlaySE
LAB_0807170e:
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    bl         A_Steal_1_Main
    pop        {pc}

DAT_08071718:
    .word 0x80000

DAT_0807171c:
    .word 0x1000000


_ts A_Steal_1_Main
    push       {lr}
    bl         Battle_GetEntryState
    cmp        r0,#0x0
    bne        LAB_0807173a
    ldr        r7,PTR_PTR_A_Steal_1_0_Drop_08071740
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}
LAB_0807173a:
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
    pop        {pc}

PTR_PTR_A_Steal_1_0_Drop_08071740:
    .word PTR_A_Steal_1_0_Drop_08071744

PTR_A_Steal_1_0_Drop_08071744:
    .word A_Steal_1_0_Drop
    .word A_Steal_1_1_Splash
    .word A_Steal_1_2_Wait


_ts A_Steal_1_0_Drop
    push       {lr}
    ldr        r0,[r5,#Attack_pos_curr_z]
    ldr        r1,[r5,#Attack_diff_z]
    sub        r0,r0,r1
    str        r0,[r5,#Attack_pos_curr_z]
    bgt        LAB_080717a4
    mov        r0,#0x0
    str        r0,[r5,#Attack_pos_curr_z]
    ldrb       r0,[r5,#Attack_family_family]
    tst        r0,r0
    bne        LAB_0807176c
    mov        r0,#0x79
    bl         Sound_PlaySE
LAB_0807176c:
    bl         A_Steal_CheckEntityHit
    tst        r0,r0
    beq        LAB_08071792
    mov        r0,#PFI_Self_Default
    bl         Field_GetPanelFlagGroup
    add        r4,r1,#0x0
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldrb       r2,[r5,#Attack_owner]
    ldrh       r3,[r5,#Attack_damage]
    mov        r6,#0x0
    mov        r7,#0x1
    push       {r5}
    bl         Attack_QuickAttack_Create
    pop        {r5}
    b          LAB_080717a0
LAB_08071792:
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    ldrb       r3,[r5,#Attack_owner]
    ldr        r7,PTR_listCapturedPanelProperties_080717a8
    ldrb       r2,[r7,r3]
    bl         FieldObject_SetFieldPanelFlag
LAB_080717a0:
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
LAB_080717a4:
    pop        {pc}

    .align 2, 0


PTR_listCapturedPanelProperties_080717a8:
    .word listCapturedPanelProperties

listCapturedPanelProperties:
    .byte PF_Walkable
    .byte PF_Walkable | PF_EnemyTerritory


_ts A_Steal_1_1_Splash
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    pop        {pc}


_ts A_Steal_1_2_Wait
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_080717cc
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s0]
LAB_080717cc:
    pop        {pc}


_nt A_Steal_2_Free
    push       {lr}
    bl         Attack_Free
    pop        {pc}


_nt A_Steal_CheckEntityHit
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    push       {r0}
    mov        r0,#PFI_Target_NoStealing
    bl         Field_GetPanelFlagGroup
    pop        {r0}
    tst        r0,r1
    beq        LAB_08071814
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0xf
    bl         Field_GetRandomXZPosOnTarget
    mov        r4,#0x1
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0807180e
    ldrb       r0,[r5,#Attack_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_0807180e:
    pop        {r5}
    mov        r0,#0x1
    pop        {pc}
LAB_08071814:
    ldr        r1,PanelFlag_08071824
    tst        r0,r1
    beq        LAB_0807181e
    mov        r0,#0x1
    pop        {pc}
LAB_0807181e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


PanelFlag_08071824:
    .word PF_Teleporting | PF_Sealed


_ts Attack_Steal_Create
    push       {lr}
    push       {r0,r1,r2,r5,r6}
    mov        r0,#0x17
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r5,r6}
    beq        LAB_08071840
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    strb       r2,[r7,#0x16]
    strh       r6,[r7,#0x24]
LAB_08071840:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Steal_0_Init_08071844:
    .word PTR_A_Steal_0_Init_080716c4
