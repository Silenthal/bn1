#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_PharaohTrap
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_PharaohTrap_0_Init_08078874
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohTrap_0_Init_08078874:
    .word PTR_A_PharaohTrap_0_Init_08078878

PTR_A_PharaohTrap_0_Init_08078878:
    .word A_PharaohTrap_0_Init
    .word A_PharaohTrap_1_Main
    .word A_PharaohTrap_2_Free


_ts A_PharaohTrap_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xaf
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Attack_frameIndexCurr]
    strb       r0,[r5,#Attack_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    strb       r0,[r5,#Attack_canBeDamaged]
    strh       r0,[r5,#Attack_damage]
    str        r0,[r5,#Attack_param_5C]
    FieldObject_Create PFI_Trap, Attack_param_60
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    mov        r0,#0xff
    strb       r0,[r5,#Attack_bc]
    bl         A_PharaohTrap_1_Main
    pop        {pc}


_ts A_PharaohTrap_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_PharaohTrap_1_0_Set_080788e0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         FUN_08078cee
    bl         A_PharaohTrap_CheckValidPosition
    pop        {pc}

PTR_PTR_A_PharaohTrap_1_0_Set_080788e0:
    .word PTR_A_PharaohTrap_1_0_Set_080788e4

PTR_A_PharaohTrap_1_0_Set_080788e4:
    .word A_PharaohTrap_1_0_Set
    .word A_PharaohTrap_1_1_Ready
    .word A_PharaohTrap_1_2_Activate


_ts A_PharaohTrap_1_0_Set
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    tst        r0,r0
    bne        LAB_0807891e
    push       {r5}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x13
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_0807890e
    mov        r0,#0x5
    strb       r0,[r5,#Attack_header_entityFlags]
LAB_0807890e:
    pop        {r5}
    mov        r0,#0x7
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0xa
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    b          LAB_0807892e
LAB_0807891e:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807892e
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_0807892e:
    pop        {pc}


_ts A_PharaohTrap_1_1_Ready
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_PharaohTrap_1_1_0_SetLiveTimer_08078940
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_PharaohTrap_1_1_0_SetLiveTimer_08078940:
    .word PTR_A_PharaohTrap_1_1_0_SetLiveTimer_08078944

PTR_A_PharaohTrap_1_1_0_SetLiveTimer_08078944:
    .word A_PharaohTrap_1_1_0_SetLiveTimer
    .word A_PharaohTrap_1_1_1_CheckLive


_ts A_PharaohTrap_1_1_0_SetLiveTimer
    push       {lr}
    mov        r0,#0x96
    lsl        r0,r0,#0x2
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    pop        {pc}


_nt A_PharaohTrap_1_1_1_CheckLive
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_0807896e
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    b          LAB_08078984
LAB_0807896e:
    bl         A_PharaohTrap_IsSet
    tst        r0,r0
    beq        LAB_08078984
    mov        r0,#0xa5
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s1]
    mov        r0,#0x0
    strh       r0,[r5,#Attack_state_s2]
LAB_08078984:
    pop        {pc}


_nt A_PharaohTrap_1_2_Activate
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s2]
    ldr        r7,PTR_PTR_A_PharaohTrap_1_2_0_Press_08078994
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_PharaohTrap_1_2_0_Press_08078994:
    .word PTR_A_PharaohTrap_1_2_0_Press_08078998

PTR_A_PharaohTrap_1_2_0_Press_08078998:
    .word A_PharaohTrap_1_2_0_Press
    .word A_PharaohTrap_1_2_1_ChooseAction
    .word A_PharaohTrap_1_2_2_Activate


_ts A_PharaohTrap_1_2_0_Press
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#Attack_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s2]
    mov        r0,#0x1e
    strh       r0,[r5,#Attack_counterA]
    pop        {pc}


_ts A_PharaohTrap_1_2_1_ChooseAction
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_080789e6
    mov        r0,#0x1
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x8
    strb       r0,[r5,#Attack_state_s2]
    bl         FUN_08078cc8
    tst        r0,r0
    bne        LAB_080789da
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         Div
    b          LAB_080789e4
LAB_080789da:
    bl         Rng_RandomInt
    mov        r1,#0x1
    and        r0,r1
    add        r0,#0x1
LAB_080789e4:
    strb       r1,[r5,#Attack_bc]
LAB_080789e6:
    pop        {pc}


_ts A_PharaohTrap_1_2_2_Activate
    push       {lr}
    ldrb       r0,[r5,#Attack_bc]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_A_PharaohTrap_1_2_2_Anubis_080789f8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_PharaohTrap_1_2_2_Anubis_080789f8:
    .word PTR_A_PharaohTrap_1_2_2_Anubis_080789fc

PTR_A_PharaohTrap_1_2_2_Anubis_080789fc:
    .word A_PharaohTrap_1_2_2_Anubis
    .word A_PharaohTrap_1_2_2_SnakeEgg
    .word A_PharaohTrap_1_2_2_Arrow


_ts A_PharaohTrap_1_2_2_Anubis
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    tst        r0,r0
    bne        LAB_08078a34
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         Div
    add        r1,#0x1
    add        r2,r1,#0x0
    mov        r1,#0x5
    mov        r0,#0x5c
    add        r0,r0,r5
    mov        r6,#0xa
    ldrb       r7,[r5,#Attack_owner]
    mov        r4,#0x0
    bl         Attack_Anubis_Create
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s3]
    b          LAB_08078a3e
LAB_08078a34:
    ldr        r0,[r5,#Attack_param_5C]
    tst        r0,r0
    bne        LAB_08078a3e
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08078a3e:
    pop        {pc}


_ts A_PharaohTrap_1_2_2_SnakeEgg
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    tst        r0,r0
    bne        LAB_08078a80
    bl         A_PharaohTrap_SetSnakeEggTarget
    cmp        r0,#0xff
    beq        LAB_08078a80
    ldrb       r3,[r5,#Attack_bd]
    mov        r7,#0xe
    add        r7,r7,r5
LAB_08078a56:
    ldrb       r0,[r7,#0x0]
    bl         Field_IndexToCellXY
    push       {r3,r7}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r0,#0x0
    mov        r4,#0x82
    mov        r6,#0x64
    ldrb       r7,[r5,#Attack_owner]
    bl         Attack_SnakeEgg_Create
    pop        {r3,r7}
    add        r7,#0x1
    sub        r3,#0x1
    bgt        LAB_08078a56
    mov        r0,#0x1
    strb       r0,[r5,#Attack_state_s3]
    mov        r0,#0xd2
    lsl        r0,r0,#0x1
    strh       r0,[r5,#Attack_counterA]
LAB_08078a80:
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078a8c
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08078a8c:
    pop        {pc}


_nt A_PharaohTrap_1_2_2_Arrow
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s3]
    ldr        r7,PTR_PTR_A_PharaohTrap_1_2_2_0_Delay_08078a9c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_PharaohTrap_1_2_2_0_Delay_08078a9c:
    .word PTR_A_PharaohTrap_1_2_2_0_Delay_08078aa0

PTR_A_PharaohTrap_1_2_2_0_Delay_08078aa0:
    .word A_PharaohTrap_1_2_2_0_Delay
    .word A_PharaohTrap_1_2_2_1_Arrow


_ts A_PharaohTrap_1_2_2_0_Delay
    push       {lr}
    mov        r0,#0xf
    strh       r0,[r5,#Attack_counterA]
    mov        r0,#0x6
    strh       r0,[r5,#Attack_counterB]
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s3]
    pop        {pc}


_ts A_PharaohTrap_1_2_2_1_Arrow
    push       {lr}
    ldrh       r0,[r5,#Attack_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterA]
    bne        LAB_08078af4
    mov        r0,#0xf
    strh       r0,[r5,#Attack_counterA]
    bl         Rng_RandomInt
    mov        r1,#0x3
    bl         Div
    add        r1,#0x1
    mov        r0,#0x6
    ldrb       r2,[r5,#Attack_owner]
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mov        r4,#0x1
    mov        r6,#0x64
    bl         Attack_Arrow_Create
    mov        r0,#0x7d
    bl         Sound_PlaySE
    ldrh       r0,[r5,#Attack_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Attack_counterB]
    bne        LAB_08078af4
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08078af4:
    pop        {pc}


_nt A_PharaohTrap_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s1]
    ldr        r7,PTR_PTR_A_PharaohTrap_2_0_Free_08078b08
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_PharaohTrap_2_0_Free_08078b04:
    .word A_PharaohTrap_2_0_Free

PTR_PTR_A_PharaohTrap_2_0_Free_08078b08:
    .word PTR_A_PharaohTrap_2_0_Free_08078b04


_ts A_PharaohTrap_2_0_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_bc]
    cmp        r0,#0xff
    bne        LAB_08078b24
    push       {r5}
    ldr        r1,[r5,#Attack_pos_curr_x]
    ldr        r2,[r5,#Attack_pos_curr_y]
    ldr        r3,[r5,#Attack_pos_curr_z]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
LAB_08078b24:
    mov        r0,#0x0
    ldr        r7,[r5,#Attack_param_64]
    str        r0,[r7,#0x0]
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
    bl         Attack_Free
    pop        {pc}


_nt A_PharaohTrap_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5,r6}
    mov        r0,#0x49
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5,r6}
    tst        r7,r7
    beq        LAB_08078b6c
    str        r2,[r7,#0x64]
    str        r3,[r7,#0x68]
    str        r7,[r2,#0x0]
    mov        r3,#0x1
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    mov        r2,#0x1
    lsl        r2,r2,#0x10
    sub        r1,r1,r2
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    mov        r0,#0xd
    strb       r0,[r7,#0x0]
LAB_08078b6c:
    add        r0,r7,#0x0
    pop        {pc}


_ts A_PharaohTrap_IsSet
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    add        r2,r0,#0x0
    mov        r0,#0x1
    mov        r1,#0x1
    tst        r2,r1
    beq        LAB_08078b92
    ldrb       r1,[r5,#Attack_owner]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_08078b94
    ldr        r1,[r7,r1]
    tst        r2,r1
    bne        LAB_08078b92
    mov        r0,#0x0
LAB_08078b92:
    pop        {pc}

PTR_PanelFlag_ARRAY_08078b94:
    .word PanelFlag_ARRAY_08078b98

PanelFlag_ARRAY_08078b98:
    .word PF_EnemyOccupied
    .word PF_PlayerOccupied


_ts A_PharaohTrap_CheckValidPosition
    push       {lr}
    ldrb       r0,[r5,#Attack_cPos_x]
    ldrb       r1,[r5,#Attack_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08078bb8
    ldr        r1,DAT_08078bc0
    tst        r0,r1
    bne        LAB_08078bb8
    b          LAB_08078bbc
LAB_08078bb8:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
LAB_08078bbc:
    pop        {pc}

    .align 2, 0


DAT_08078bc0:
    .word 0x820


_ts A_PharaohTrap_PlaceTrap
    push       {lr}
    sub        sp,#0x28
    add        r6,r0,#0x0
    mov        r0,#0x0
    str        r0,[r6,#0x68]
    str        r0,[r6,#0x6c]
    str        r0,[r6,#0x70]
    ldrb       r3,[r6,#0x16]
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_08078c6c
    lsl        r0,r3,#0x3
    add        r7,r7,r0
    mov        r0,sp
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    push       {r6}
    bl         Field_SearchWithOwner
    pop        {r6}
    tst        r1,r1
    beq        LAB_08078c66
    mov        r0,sp
    push       {r6}
    add        r7,r0,#0x0
    add        r0,#0x14
    add        r6,r0,#0x0
    mov        r3,#0x0
    mov        r4,#0x0
LAB_08078bfa:
    ldrb       r0,[r7,#0x0]
    push       {r0,r1}
    bl         Field_IndexToCellXY
    cmp        r0,#0x4
    pop        {r0,r1}
    bge        LAB_08078c0e
    strb       r0,[r6,#0x0]
    add        r6,#0x1
    add        r4,#0x1
LAB_08078c0e:
    add        r7,#0x1
    add        r3,#0x1
    cmp        r3,r1
    blt        LAB_08078bfa
    pop        {r6}
    add        r1,r4,#0x0
    tst        r4,r4
    beq        LAB_08078c66
    add        r4,r1,#0x0
    add        r2,r1,#0x0
    add        r0,sp,#0x14
    mov        r1,sp
    bl         memcpy_8
    add        r1,r4,#0x0
    mov        r0,sp
    mov        r2,#0x14
    push       {r1,r6}
    bl         ArrayShuffle
    pop        {r1,r6}
    mov        r1,#0x1
    mov        r2,#0x68
    add        r2,r2,r6
    mov        r7,sp
    add        r3,r6,#0x0
    mov        r4,#0x0
LAB_08078c44:
    push       {r1,r2,r3,r4,r7}
    ldrb       r0,[r7,#0x0]
    push       {r2}
    bl         Field_IndexToCellXY
    pop        {r2}
    bl         A_PharaohTrap_Create
    pop        {r1,r2,r3,r4,r7}
    add        r2,#0x4
    add        r7,#0x1
    add        r4,#0x1
    cmp        r4,r1
    blt        LAB_08078c44
    mov        r0,#0xd2
    bl         Sound_PlaySE
LAB_08078c66:
    add        sp,#0x28
    pop        {pc}

    .align 2, 0


PTR_PanelFlag_ARRAY_ARRAY_08078c6c:
    .word PanelFlag_ARRAY_ARRAY_08078c70

PanelFlag_ARRAY_ARRAY_08078c70:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Teleporting | PF_Solid | PF_Trap
    .word PF_Walkable
    .word PF_EnemyTerritory | PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Teleporting | PF_Solid | PF_Trap


_ts A_PharaohTrap_SearchForClearPanel
    push       {lr}
    sub        sp,#0x14
    add        r6,r0,#0x0
    ldrb       r3,[r6,#0x16]
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_08078cc4
    lsl        r0,r3,#0x3
    add        r7,r7,r0
    mov        r0,sp
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    push       {r6}
    bl         Field_SearchWithOwner
    pop        {r6}
    tst        r1,r1
    beq        LAB_08078cc0
    mov        r7,sp
    mov        r3,#0x0
    mov        r4,#0x0
LAB_08078ca6:
    ldrb       r0,[r7,#0x0]
    push       {r1}
    bl         Field_IndexToCellXY
    pop        {r1}
    cmp        r0,#0x4
    bge        LAB_08078cb6
    add        r4,#0x1
LAB_08078cb6:
    add        r7,#0x1
    add        r3,#0x1
    cmp        r3,r1
    blt        LAB_08078ca6
    add        r1,r4,#0x0
LAB_08078cc0:
    add        sp,#0x14
    pop        {pc}

PTR_PanelFlag_ARRAY_ARRAY_08078cc4:
    .word PanelFlag_ARRAY_ARRAY_08078c70


_ts FUN_08078cc8
    push       {lr}
    ldr        r7,[r5,#Attack_param_68]
    mov        r0,#0x68
    add        r7,r7,r0
    mov        r3,#0x0
LAB_08078cd2:
    ldr        r6,[r7,#0x0]
    tst        r6,r6
    beq        LAB_08078cde
    ldrb       r0,[r6,#0xc]
    tst        r0,r0
    beq        LAB_08078cea
LAB_08078cde:
    add        r7,#0x4
    add        r3,#0x1
    cmp        r3,#0x3
    blt        LAB_08078cd2
    mov        r0,#0x0
    b          LAB_08078cec
LAB_08078cea:
    mov        r0,#0x1
LAB_08078cec:
    pop        {pc}


_nt FUN_08078cee
    push       {lr}
    ldr        r0,[r5,#Attack_param_64]
    ldr        r0,[r0,#0x0]
    tst        r0,r0
    bne        LAB_08078d06
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    ldr        r0,[r5,#Attack_param_5C]
    tst        r0,r0
    beq        LAB_08078d06
    mov        r0,#0x1
    strb       r0,[r5,#Attack_family_b1]
LAB_08078d06:
    pop        {pc}


_ts A_PharaohTrap_SetSnakeEggTarget
    push       {lr}
    sub        sp,#0x14
    mov        r0,sp
    mov        r1,#0x1
    ldr        r2,PanelFlag_08078d44
    ldrb       r3,[r5,#Attack_owner]
    bl         Field_SearchWithOwner
    mov        r0,#0xff
    tst        r1,r1
    beq        LAB_08078d40
    mov        r0,sp
    mov        r2,#0x14
    push       {r1}
    bl         ArrayShuffle
    pop        {r1}
    mov        r7,sp
    mov        r2,#0x0
    cmp        r1,#0x1
    beq        LAB_08078d38
    add        r2,#0x1
    ldrb       r0,[r7,#0x1]
    strb       r0,[r5,#Attack_bf]
LAB_08078d38:
    add        r2,#0x1
    ldrb       r0,[r7,#0x0]
    strb       r0,[r5,#Attack_be]
    strb       r2,[r5,#Attack_bd]
LAB_08078d40:
    add        sp,#0x14
    pop        {pc}

PanelFlag_08078d44:
    .word PF_EnemyTerritory | PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid
