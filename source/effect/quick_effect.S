#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


_ts Effect_QuickEffect
    push       {lr}
    ldr        r0,PTR_PTR_E_QuickEffect_0_Init
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_E_QuickEffect_0_Init:
    .word E_QuickEffect_0_Init
    .word E_QuickEffect_1_WaitForEnd
    .word E_QuickEffect_2_Free


_ts E_QuickEffect_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,PTR_SpriteAnimParam_ARRAY_0807b5ac
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1a
    lsr        r0,r0,#0x18
    ldrh       r1,[r7,r0]
    push       {r0,r7}
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    ldrb       r0,[r5,#0x5]
    lsl        r0,r0,#0x1c
    lsr        r0,r0,#0x1c
    bl         SpritePtr_SetPaletteIndex
    pop        {r0,r7}
    add        r0,#0x2
    ldrh       r0,[r7,r0]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x7
    bl         SpritePtr_SetFlipType
    ldrh       r0,[r5,#0x6]
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    bl         E_QuickEffect_1_WaitForEnd
    pop        {pc}

    .align 2, 0

SpriteAnimParam_ARRAY_0807b4e4:
_00: @ 0
    .short SP_Effect_ShortExplosion
    .short 0
_01: @ 1
    .short 0xD3
    .short 0
_02: @ 2
    .short SP_Effect_ArmorHit
    .short 0
_03: @ 3
    .short SP_Attack_Cannon
    .short 1
_04: @ 4
    .short SP_BattleEffect_ShotgunBurst
    .short 0
_05: @ 5
    .short SP_BattleEffect_ShotgunBurst
    .short 0
_06: @ 6
    .short SP_BattleEffect_ShotgunBurst
    .short 1
_07: @ 7
    .short SP_BattleEffect_BusterHit
    .short 0
_08: @ 8
    .short SP_BattleEffect_BusterHit
    .short 1
_09: @ 9
    .short SP_Effect_TallExplosion
    .short 0
_0A: @ 10
    .short 0xDB
    .short 0
_0B: @ 11
    .short SP_BattleEffect_MiniBombExplosion
    .short 0
_0C: @ 12
    .short 0x78
    .short 0
_0D: @ 13
    .short 0x7F
    .short 0
_0E: @ 14
    .short SP_BattleEffect_Recover
    .short 0
_0F: @ 15
    .short SP_Effect_TeleportMove
    .short 0
_10: @ 16
    .short SP_Effect_TeleportMove
    .short 1
_11: @ 17
    .short SP_Effect_TeleportMove
    .short 2
_12: @ 18
    .short SP_Effect_TeleportMove
    .short 3
_13: @ 19
    .short SP_Effect_TeleportMove
    .short 4
_14: @ 20
    .short SP_Effect_TeleportMove
    .short 5
_15: @ 21
    .short 0xE2
    .short 0
_16: @ 22
    .short SP_Battle_MegaMan
    .short 3
_17: @ 23
    .short SP_Battle_MegaMan
    .short 2
_18: @ 24
    .short SP_BattleEffect_PanelBreak
    .short 0
_19: @ 25
    .short SP_Effect_SwordStrike
    .short 0
_1A: @ 26
    .short SP_Effect_ElecHit
    .short 0
_1B: @ 27
    .short SP_Effect_FireHit
    .short 0
_1C: @ 28
    .short SP_Effect_AquaHit
    .short 0
_1D: @ 29
    .short SP_Effect_WoodHit
    .short 0
_1E: @ 30
    .short 0x8C
    .short 9
_1F: @ 31
    .short 0x9C
    .short 0
_20: @ 32
    .short 0x9C
    .short 1
_21: @ 33
    .short 0x84
    .short 5
_22: @ 34
    .short 0x84
    .short 6
_23: @ 35
    .short 0xAA
    .short 0
_24: @ 36
    .short 0x106
    .short 0
_25: @ 37
    .short 0x10A
    .short 0
_26: @ 38
    .short 0xA8
    .short 0
_27: @ 39
    .short SP_BattleObject_BubbleShield
    .short 1
_28: @ 40
    .short 0x4B
    .short 5
_29: @ 41
    .short 0xC3
    .short 0
_2A: @ 42
    .short 0xAC
    .short 0
_2B: @ 43
    .short SP_BattleEffect_PanelBreak
    .short 1
_2C: @ 44
    .short 0xBC
    .short 0
_2D: @ 45
    .short 0x113
    .short 0
_2E: @ 46
    .short 0xB7
    .short 0
_2F: @ 47
    .short 0xB7
    .short 1
_30: @ 48
    .short SP_BattleEffect_SwordSlash
    .short 0
_31: @ 49
    .short 0x106
    .short 0
PTR_SpriteAnimParam_ARRAY_0807b5ac:
    .word SpriteAnimParam_ARRAY_0807b4e4


_ts E_QuickEffect_1_WaitForEnd
    push       {lr}
    bl         SpritePtr_ProcessFrameDelay
    ldrh       r0,[r5,#0x6]
    tst        r0,r0
    beq        LAB_0807b5c2
    sub        r0,#0x1
    strh       r0,[r5,#0x6]
    beq        LAB_0807b5d8
LAB_0807b5c2:
    ldrb       r0,[r5,#0x4]
    lsr        r0,r0,#0x7
    bcs        LAB_0807b5dc
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0807b5dc
    mov        r1,#0x40
    tst        r0,r1
    bne        LAB_0807b5dc
LAB_0807b5d8:
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
LAB_0807b5dc:
    pop        {pc}


_ts E_QuickEffect_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_QuickEffect_Create
    push       {lr}
    mov        r0,#0x0
    bl         Effect_Alloc
    pop        {pc}

    .align 2, 0

PTR_PTR_E_QuickEffect_0_Init: .word PTR_E_QuickEffect_0_Init
