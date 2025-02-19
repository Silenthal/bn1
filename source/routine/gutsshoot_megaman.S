#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_GutsShoot_MegaMan
    push       {lr}
    ldr        r7,PTR_PTR_R_GutsShoot_MegaMan_0_Init_0806825c
    ldrb       r0,[r5,#Actor_state_s0]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsShoot_MegaMan_0_Init_0806825c:
    .word PTR_R_GutsShoot_MegaMan_0_Init_08068260

PTR_R_GutsShoot_MegaMan_0_Init_08068260:
    .word R_GutsShoot_MegaMan_0_Init
    .word R_GutsShoot_MegaMan_1_Main
    .word R_GutsShoot_MegaMan_2_Free


_ts R_GutsShoot_MegaMan_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#Actor_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_EnableShadow
    mov        r0,#0x0
    ldrb       r1,[r5,#Actor_owner]
    tst        r1,r1
    beq        LAB_08068288
    mov        r0,#0x4
LAB_08068288:
    bl         SpritePtr_SetPaletteIndex
    bl         Field_GetAttackDirectionOffset_MP
    mov        r1,#0x6
    lsl        r1,r1,#0x10
    mul        r1,r0
    str        r1,[r5,#Actor_diff_x]
    mov        r0,#0x1
    strb       r0,[r5,#Actor_frameIndexCurr]
    strb       r0,[r5,#Actor_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#Actor_owner]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x3c
    strh       r0,[r5,#Actor_counterA]
    ldrb       r3,[r5,#Actor_owner]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r7,#0x0]
    mov        r3,#0x28
    add        r7,r7,r3
    ldmia      r7!,{r0,r1,r2}
    add        r3,r3,r5
    stmia      r3!,{r0,r1,r2}
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    mov        r0,#0x0
    str        r0,[r5,#Actor_param_5C]
    mov        r0,#0x4
    str        r0,[r5,#Actor_state_s0]
    bl         R_GutsShoot_MegaMan_1_Main
    pop        {pc}


_ts R_GutsShoot_MegaMan_1_Main
    push       {lr}
    ldr        r7,PTR_PTR_R_GutsShoot_MegaMan_1_0_080682f8
    ldrb       r0,[r5,#Actor_state_s1]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_GutsShoot_MegaMan_1_0_080682f8:
    .word PTR_R_GutsShoot_MegaMan_1_0_080682fc

PTR_R_GutsShoot_MegaMan_1_0_080682fc:
    .word R_GutsShoot_MegaMan_1_0
    .word R_GutsShoot_MegaMan_1_1
    .word R_GutsShoot_MegaMan_1_2


_ts R_GutsShoot_MegaMan_1_0
    push       {lr}
    ldrh       r0,[r5,#Actor_counterA]
    sub        r0,#0x1
    strh       r0,[r5,#Actor_counterA]
    bne        LAB_0806831a
    mov        r0,#0x24
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r0,#0x4
    strb       r0,[r5,#Actor_state_s1]
LAB_0806831a:
    pop        {pc}


_ts R_GutsShoot_MegaMan_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08068352
    mov        r0,#0x25
    strb       r0,[r5,#Actor_frameIndexCurr]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_08068354
    ldrb       r0,[r5,#Actor_owner]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#Actor_param_5C]
    tst        r7,r7
    beq        LAB_08068348
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08068348:
    mov        r0,#0x94
    bl         Sound_PlaySE
    mov        r0,#0x8
    strb       r0,[r5,#Actor_state_s1]
LAB_08068352:
    pop        {pc}

DAT_08068354:
    .word 0xC40020


_ts R_GutsShoot_MegaMan_1_2
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Actor_cPos_x]
    ldrb       r1,[r5,#Actor_cPos_y]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x10
    ldrb       r2,[r5,#Actor_owner]
    lsr        r1,r2
    lsl        r1,r1,#0x10
    tst        r0,r1
    bne        LAB_08068394
    ldr        r0,[r5,#Actor_pos_curr_x]
    ldr        r1,[r5,#Actor_diff_x]
    add        r0,r0,r1
    str        r0,[r5,#Actor_pos_curr_x]
    ldr        r1,[r5,#Actor_pos_curr_y]
    bl         Battle_SpriteCoordsToCell
    strb       r0,[r5,#Actor_cPos_x]
    strb       r1,[r5,#Actor_cPos_y]
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_08068392
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
LAB_08068392:
    pop        {pc}
LAB_08068394:
    ldrb       r0,[r5,#Actor_element]
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    ldr        r4,DAT_080683d4
    ldrh       r6,[r5,#Actor_damage]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r1,r2,r3}
    mov        r0,#0x18
    lsl        r0,r0,#0x10
    add        r3,r3,r0
    mov        r4,#0xd
    push       {r5}
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_080683c6
    ldrb       r0,[r5,#Actor_header_entityFlags]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#Actor_header_entityFlags]
LAB_080683c6:
    pop        {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    mov        r0,#0x8
    str        r0,[r5,#Actor_state_s0]
    pop        {pc}

DAT_080683d4:
    .word 0x10019


_ts R_GutsShoot_MegaMan_2_Free
    push       {lr}
    ldr        r0,[r5,#Actor_param_5C]
    tst        r0,r0
    beq        LAB_080683ea
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
LAB_080683ea:
    bl         Actor_Free
    pop        {pc}


_ts Routine_GutsShoot_MegaMan_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x33
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0806840e
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806840e:
    pop        {pc}
