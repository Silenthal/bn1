#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_ShotgunBurst
    push       {lr}
    ldrb       r0,[r5,#Attack_state_s0]
    ldr        r7,PTR_PTR_A_ShotgunBurst_0_Init_080712c0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_ShotgunBurst_0_Init_080712c0:
    .word PTR_A_ShotgunBurst_0_Init_080712c4

PTR_A_ShotgunBurst_0_Init_080712c4:
    .word A_ShotgunBurst_0_Init
    .word A_ShotgunBurst_1_Main
    .word A_ShotgunBurst_2_Free


_ts A_ShotgunBurst_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Attack_header_entityFlags]
    mov        r0,#0x1
    ldr        r7,PTR_SpriteIndex_08071330
    ldrb       r2,[r5,#Attack_family_family]
    lsl        r2,r2,#0x2
    add        r7,r7,r2
    ldrh       r1,[r7,#0x0]
    push       {r7}
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strh       r0,[r5,#Attack_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    pop        {r7}
    ldrb       r0,[r7,#0x2]
    lsl        r0,r0,#0x1f
    asr        r0,r0,#0x1f
    ldr        r1,[r5,#Attack_pos_curr_z]
    and        r1,r0
    str        r1,[r5,#Attack_pos_curr_z]
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#Attack_cPos_x]
    strb       r1,[r5,#Attack_cPos_y]
    ldrb       r0,[r5,#Attack_family_family]
    cmp        r0,#0x2
    bls        LAB_0807131e
    FieldObject_Create 0x1, Attack_param_60
LAB_0807131e:
    mov        r0,#0x4
    strb       r0,[r5,#Attack_state_s0]
    ldrb       r0,[r5,#Attack_family_family]
    cmp        r0,#0x2
    bls        LAB_0807132e
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_MarkAsChecked
LAB_0807132e:
    pop        {pc}

PTR_SpriteIndex_08071330:
    .word SpriteIndex_08071334

SpriteIndex_08071334:
    .short SP_BattleEffect_BusterHit
    .byte 0x01
    .byte 0x00
    .short SP_BattleEffect_BubblerHit
    .byte 0x00
    .byte 0x00
    .short SP_BattleEffect_HeaterHit
    .byte 0x00
    .byte 0x00
    .short SP_BattleEffect_BusterHit
    .byte 0x01
    .byte 0x00
    .short SP_BattleEffect_BusterHit
    .byte 0x01

    .align 2, 0



_ts A_ShotgunBurst_1_Main
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    cmp        r0,#0x2
    bls        LAB_08071356
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Disable
LAB_08071356:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    bne        LAB_08071366
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}
LAB_08071366:
    mov        r0,#0x8
    str        r0,[r5,#Attack_state_s0]
    pop        {pc}


_ts A_ShotgunBurst_2_Free
    push       {lr}
    ldrb       r0,[r5,#Attack_family_family]
    cmp        r0,#0x2
    bls        LAB_0807137a
    ldr        r0,[r5,#Attack_param_60]
    bl         FieldObject_Free
LAB_0807137a:
    bl         Attack_Free
    pop        {pc}


_ts Attack_ShotgunBurst_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x13
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_0807139a
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#Attack_owner]
    strb       r0,[r7,#0x16]
LAB_0807139a:
    pop        {pc}
