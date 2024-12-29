#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_Scuttlest
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_Scuttlest_0_Init_08077f44
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Scuttlest_0_Init_08077f44:
    .word PTR_A_Scuttlest_0_Init_08077f48

PTR_A_Scuttlest_0_Init_08077f48:
    .word A_Scuttlest_0_Init
    .word A_Scuttlest_1_Main
    .word A_Scuttlest_2_Free


_ts A_Scuttlest_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xc5
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_SetZClip
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    mov        r0,#0x9
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x32
    mov        r1,#0x64
    add        r1,r1,r5
    bl         Field_CreateEntity
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x64
    strh       r0,[r5,#0x20]
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         A_Scuttlest_SetElement
    bl         A_Scuttlest_1_Main
    pop        {pc}


_nt A_Scuttlest_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08077fde
    bl         A_Scuttlest_CheckDamage
    tst        r0,r0
    beq        LAB_08077fde
    bl         Field_SubtractHP
    push       {r2}
    bl         SpritePtr_SetFlashPalette
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08077fde:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Scuttlest_1_0_08078024
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08077ffe
    mov        r0,#0x9
    b          LAB_08078000
LAB_08077ffe:
    mov        r0,#0xf
LAB_08078000:
    ldr        r1,[r5,#0x60]
    bl         Field_SetPanelFlagsOnEntity
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_08078014
    ldr        r7,[r5,#0x68]
    ldrb       r0,[r7,#0xf]
    tst        r0,r0
    beq        LAB_08078022
LAB_08078014:
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
LAB_08078022:
    pop        {pc}

PTR_PTR_A_Scuttlest_1_0_08078024:
    .word PTR_A_Scuttlest_1_0_08078028

PTR_A_Scuttlest_1_0_08078028:
    .word A_Scuttlest_1_0
    .word A_Scuttlest_1_1
    .word A_Scuttlest_1_2
    .word A_Scuttlest_1_3_Attack


_ts A_Scuttlest_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08078082
    ldr        r7,[r5,#0x68]
    mov        r0,#0x10
    add        r7,r7,r0
    ldrb       r0,[r5,#0xe]
    ldrb       r0,[r7,r0]
    tst        r0,r0
    beq        LAB_080780a2
    ldrb       r0,[r5,#0x18]
    cmp        r0,#0xff
    bne        LAB_08078074
    bl         A_Scuttlest_ChooseFrontPanel
    cmp        r0,#0xff
    beq        LAB_080780a2
    ldr        r7,[r5,#0x64]
    strb       r0,[r5,#0x18]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r5,#0x19]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    bl         R_Actor_UpdateSpritePos
LAB_08078074:
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    b          LAB_080780a2
LAB_08078082:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080780a2
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
LAB_080780a2:
    pop        {pc}


_ts A_Scuttlest_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Scuttlest_1_1_0_080780bc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Scuttlest_1_1_0_080780b4:
    .word A_Scuttlest_1_1_0
    .word A_Scuttlest_1_1_1

PTR_PTR_A_Scuttlest_1_1_0_080780bc:
    .word PTR_A_Scuttlest_1_1_0_080780b4


_ts A_Scuttlest_1_1_0
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    pop        {pc}


_ts A_Scuttlest_1_1_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080780e4
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_08078116
LAB_080780e4:
    ldrb       r0,[r5,#0xd]
    tst        r0,r0
    bne        LAB_080780f2
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08078116
LAB_080780f2:
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    bne        LAB_08078112
    ldr        r7,[r5,#0x6c]
    ldrb       r0,[r7,#0xc]
    tst        r0,r0
    bne        LAB_08078112
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r0,#0x0
    strb       r0,[r5,#0xd]
LAB_08078112:
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
LAB_08078116:
    pop        {pc}


_ts A_Scuttlest_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Scuttlest_1_2_0_08078130
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_A_Scuttlest_1_2_0_08078128:
    .word A_Scuttlest_1_2_0
    .word A_Scuttlest_1_2_1

PTR_PTR_A_Scuttlest_1_2_0_08078130:
    .word PTR_A_Scuttlest_1_2_0_08078128


_ts A_Scuttlest_1_2_0
    push       {lr}
    bl         A_Scuttlest_GetNextMovePanel
    cmp        r0,#0xff
    bne        LAB_0807814c
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    b          LAB_08078176
LAB_0807814c:
    ldr        r7,[r5,#0x64]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    strb       r0,[r5,#0x6]
    strb       r1,[r5,#0x7]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    ldr        r2,DAT_08078178
    ldrb       r0,[r5,#0x19]
    ldrb       r1,[r5,#0x7]
    cmp        r0,r1
    bmi        LAB_0807816c
    neg        r2,r2
LAB_0807816c:
    str        r2,[r5,#0x48]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
LAB_08078176:
    pop        {pc}

DAT_08078178:
    .word 0x20000


_ts A_Scuttlest_1_2_1
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldrb       r1,[r5,#0x7]
    bl         Battle_CellCoordsToSprite
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x48]
    tst        r3,r3
    bmi        LAB_08078196
    add        r2,r2,r3
    cmp        r2,r1
    bmi        LAB_080781b2
    b          LAB_0807819c
LAB_08078196:
    add        r2,r2,r3
    cmp        r2,r1
    bgt        LAB_080781b2
LAB_0807819c:
    str        r2,[r5,#0x2c]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        r0,#0x2d
    strh       r0,[r5,#0x1c]
    b          LAB_080781b4
LAB_080781b2:
    str        r2,[r5,#0x2c]
LAB_080781b4:
    bl         R_Actor_UpdateCellPos
    pop        {pc}


_nt A_Scuttlest_1_3_Attack
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_Scuttlest_1_3_0_080781d8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_A_Scuttlest_1_3_0_080781c8:
    .word A_Scuttlest_1_3_0
    .word A_Scuttlest_1_3_1
    .word A_Scuttlest_1_3_2
    .word A_Scuttlest_1_3_3

PTR_PTR_A_Scuttlest_1_3_0_080781d8:
    .word PTR_A_Scuttlest_1_3_0_080781c8


_ts A_Scuttlest_1_3_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    pop        {pc}


_ts A_Scuttlest_1_3_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08078200
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_A_Scutz_Fire_08078204
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
LAB_08078200:
    pop        {pc}

    .align 2, 0


PTR_PTR_A_Scutz_Fire_08078204:
    .word PTR_A_Scutz_Fire_08078208

PTR_A_Scutz_Fire_08078208:
    .word A_Scutz_Fire
    .word A_Scuttle_AquaTower
    .word A_Scuttler_Thunder
    .word A_Scuttzer_WoodTower


_ts A_Scutz_Fire
    push       {lr}
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x8
    lsl        r3,r3,#0x10
    mov        r4,#0x1
    mov        r6,#0x50
    bl         Attack_MagicFire_Create
    mov        r0,#0xb6
    bl         Sound_PlaySongImmediate
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts A_Scuttle_AquaTower
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    LoadMain battle, r2, r2
    ldr        r2,[r2,#0x40]
    add        r2,#0x2c
    mov        r4,#0x2
    mov        r3,#0x3
    mov        r6,#0x50
    bl         Attack_Tower_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_Scuttler_Thunder
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    ldr        r2,DAT_0807827c
    mov        r3,#0x3
    mov        r4,#0x1
    mov        r6,#0x50
    mov        r7,#0x0
    bl         Attack_Thunder_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_0807827c:
    .word 0xCCCC


_ts A_Scuttzer_WoodTower
    push       {lr}
    push       {r5}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    LoadMain battle, r2, r2
    ldr        r2,[r2,#0x40]
    add        r2,#0x2c
    mov        r4,#0x3
    mov        r3,#0x4
    mov        r6,#0x50
    bl         Attack_Tower_Create
    pop        {r5}
    mov        r0,#0x8
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt A_Scuttlest_1_3_2
    push       {lr}
    mov        r0,#0x64
    strh       r0,[r5,#0x1e]
    mov        r0,#0xc
    strb       r0,[r5,#0xa]
    mov        r0,#0x2
    strb       r0,[r5,#0x14]
    pop        {pc}


_nt A_Scuttlest_1_3_3
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_080782ca
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    strb       r0,[r5,#0xc]
    mov        r0,#0x1e
    strh       r0,[r5,#0x1e]
LAB_080782ca:
    pop        {pc}


_ts A_Scuttlest_2_Free
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_Scuttlest_2_0_08078300
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r7,[r5,#0x68]
    ldrb       r0,[r7,#0xf]
    tst        r0,r0
    beq        LAB_080782f0
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Attack_Free
LAB_080782f0:
    pop        {pc}

    .align 2, 0


PTR_A_Scuttlest_2_0_080782f4:
    .word A_Scuttlest_2_0
    .word A_Scuttlest_2_1
    .word A_Scuttlest_2_2

PTR_PTR_A_Scuttlest_2_0_08078300:
    .word PTR_A_Scuttlest_2_0_080782f4


_ts A_Scuttlest_2_0
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0xd]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    mov        r0,#0x4b
    lsl        r0,r0,#0x3
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt A_Scuttlest_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807834c
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    bl         A_Scuttlest_2_2
LAB_0807834c:
    pop        {pc}


_nt A_Scuttlest_2_2
    push       {lr}
    bl         A_Scuttlest_ChooseFrontPanel
    cmp        r0,#0xff
    beq        LAB_0807838e
    ldr        r7,[r5,#0x64]
    strb       r0,[r5,#0x18]
    strb       r0,[r7,#0x2]
    strb       r0,[r7,#0x4]
    strb       r1,[r5,#0x19]
    strb       r1,[r7,#0x3]
    strb       r1,[r7,#0x5]
    add        r0,r7,#0x0
    bl         FieldObject_Enable
    ldrb       r0,[r5,#0x4]
    add        r0,#0x1
    mov        r1,#0x3
    and        r0,r1
    strb       r0,[r5,#0x4]
    bl         A_Scuttlest_SetElement
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0x64
    strh       r0,[r5,#0x20]
    bl         R_Actor_UpdateSpritePos
LAB_0807838e:
    pop        {pc}


_ts Attack_Scuttlest_Create
    push       {lr}
    push       {r0,r1,r5}
    mov        r0,#0x47
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5}
    tst        r7,r7
    beq        LAB_080783b8
    ldrb       r3,[r5,#0x16]
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
    str        r5,[r7,#0x68]
LAB_080783b8:
    add        r0,r7,#0x0
    pop        {pc}


_ts A_Scuttlest_CheckDamage
    push       {lr}
    ldr        r6,[r5,#0x60]
    ldrh       r0,[r6,#0x2]
    ldr        r1,PanelFlag_080783e0
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    pop        {pc}

    .align 2, 0


PanelFlag_080783e0:
    .word PF_Player


_ts A_Scuttlest_IsPanelWalkable
    push       {lr}
    push       {r0,r1}
    bl         Battle_IsOutOfBounds
    add        r3,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x0
    tst        r3,r3
    bne        LAB_0807840e
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_0807840e
    ldr        r1,PanelFlag_08078414
    tst        r0,r1
    bne        LAB_0807840e
    mov        r1,#0x2
    tst        r0,r1
    beq        LAB_0807840e
    mov        r2,#0x1
LAB_0807840e:
    add        r0,r2,#0x0
    pop        {pc}

    .align 2, 0


PanelFlag_08078414:
    .word PF_EnemyOccupied | PF_Sealed


_ts A_Scuttlest_GetNextMovePanel
    push       {lr}
    bl         Entity_CompareToPlayerRow
    tst        r0,r0
    beq        LAB_0807843c
    ldrb       r1,[r5,#0x19]
    bmi        LAB_0807842a
    add        r1,#0x1
    b          LAB_0807842c
LAB_0807842a:
    sub        r1,#0x1
LAB_0807842c:
    ldrb       r0,[r5,#0x18]
    push       {r0,r1}
    bl         A_Scuttlest_IsPanelWalkable
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0807843c
    b          LAB_0807843e
LAB_0807843c:
    mov        r0,#0xff
LAB_0807843e:
    pop        {pc}


_ts A_Scuttlest_SetElement
    push       {lr}
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x4]
    ldr        r7,PTR_ElementID_ARRAY_0807845c
    ldrb       r0,[r7,r0]
    strb       r0,[r5,#0x1a]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x6]
    pop        {pc}

ElementID_ARRAY_08078456:
    element Fire
    element Water
    element Elec
    element Wood

    .align 2, 0


PTR_ElementID_ARRAY_0807845c:
    .word ElementID_ARRAY_08078456


_ts A_Scuttlest_ChooseFrontPanel
    push       {lr}
    sub        sp,#0x4
    mov        r1,#0x1
    mov        r3,#0x0
    mov        r4,sp
LAB_0807846a:
    push       {r1,r3,r4}
    mov        r0,#0x4
    bl         A_Scuttlest_IsPanelWalkable
    tst        r0,r0
    pop        {r1,r3,r4}
    beq        LAB_0807847e
    strb       r1,[r4,#0x0]
    add        r4,#0x1
    add        r3,#0x1
LAB_0807847e:
    add        r1,#0x1
    cmp        r1,#0x3
    ble        LAB_0807846a
    mov        r0,#0xff
    tst        r3,r3
    beq        LAB_0807849e
    push       {r3}
    bl         Rng_RandomInt
    pop        {r3}
    add        r1,r3,#0x0
    bl         SWI_Div
    mov        r4,sp
    ldrb       r1,[r4,r1]
    mov        r0,#0x4
LAB_0807849e:
    add        sp,#0x4
    pop        {pc}

    .align 2, 0

