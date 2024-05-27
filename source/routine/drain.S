#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_CreateAnimationOnly, 0x806F5A4+1


_ts Routine_Drain
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Drain_0_Init_08069274
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Drain_0_Init_08069274:
    .word PTR_R_Drain_0_Init_08069278

PTR_R_Drain_0_Init_08069278:
    .word R_Drain_0_Init
    .word R_Drain_1_Main
    .word R_Drain_2_Free


_ts R_Drain_0_Init
    push       {lr}
    mov        r0,#0x7
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x0
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    ldrb       r1,[r5,#0x16]
    tst        r1,r1
    beq        LAB_080692a0
    mov        r0,#0x4
LAB_080692a0:
    bl         SpritePtr_SetPaletteIndex
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x16]
    bl         SpritePtr_SetFlipType
    mov        r0,#0x1
    strh       r0,[r5,#0x1c]
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
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
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_Drain_1_Main
    pop        {pc}


_ts R_Drain_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Drain_1_0_08069300
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Drain_1_0_08069300:
    .word PTR_R_Drain_1_0_08069304

PTR_R_Drain_1_0_08069304:
    .word R_Drain_1_0
    .word R_Drain_1_1
    .word R_Drain_1_2
    .word R_Drain_1_3
    .word R_Drain_1_4


_ts R_Drain_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08069340
    mov        r0,#0x15
    strb       r0,[r5,#0x14]
    ldr        r4,DAT_08069344
    ldrb       r0,[r5,#0x16]
    bl         Attack_CreateAnimationOnly
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806933c
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806933c:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08069340:
    pop        {pc}

    .align 2, 0


DAT_08069344:
    .word 0xC00000


_ts R_Drain_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x82
    tst        r0,r1
    beq        LAB_08069358
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08069358:
    pop        {pc}


_nt R_Drain_1_2
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x81
    tst        r0,r1
    beq        LAB_080693ee
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    mov        r0,#0x16
    strb       r0,[r5,#0x14]
    bl         R_Actor_ClearCurrentAttack
    ldr        r4,DAT_080693f8
    ldrb       r0,[r5,#0x16]
    bl         Attack_CreateAnimationOnly
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_0806938a
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0806938a:
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r1,DAT_080693fc
    mul        r1,r0
    str        r1,[r5,#0x44]
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    ldr        r7,PTR_PanelFlag_080693f4
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_080693e4
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,FamilyDetail_080693f0
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    push       {r5}
    ldrh       r0,[r5,#0x24]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r5,[r7,r1]
    bl         Field_AddHp
    pop        {r5}
LAB_080693e4:
    mov        r0,#0x94
    bl         Sound_PlaySongImmediate
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_080693ee:
    pop        {pc}

FamilyDetail_080693f0:
    .byte 0x19, 0x00, 0x01, 0x02

PTR_PanelFlag_080693f4:
    .word PanelFlag_08069498

DAT_080693f8:
    .word 0xC00180

DAT_080693fc:
    .word 0xA0000


_ts R_Drain_1_3
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    push       {r0}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r1,[r5,#0x2c]
    bl         Battle_SpriteCoordsToCell
    ldrb       r2,[r5,#0x18]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    cmp        r0,r2
    beq        LAB_08069470
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Field_GetAttackDirectionOffset_MP
    ldrb       r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x19]
    push       {r0,r1}
    bl         Field_GetPanelFlags
    ldr        r7,PTR_PanelFlag_08069494
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r0,r1
    pop        {r0,r1}
    beq        LAB_08069470
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,FamilyDetail_08069490
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    push       {r5}
    ldrh       r0,[r5,#0x24]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    add        r1,#0x40
    ldr        r5,[r7,r1]
    bl         Field_AddHp
    pop        {r5}
LAB_08069470:
    pop        {r2}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    add        r0,r0,r2
    bl         Field_IsCellPositionValid
    tst        r0,r0
    bne        LAB_0806948c
    bl         R_Player_ClearAttack
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
LAB_0806948c:
    pop        {pc}

    .align 2, 0


FamilyDetail_08069490:
    .byte 0x19, 0x00, 0x01, 0x02

PTR_PanelFlag_08069494:
    .word PanelFlag_08069498

PanelFlag_08069498:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


_ts R_Drain_1_4
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_080694b0
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_080694b0:
    pop        {pc}


_nt R_Drain_2_Free
    push       {lr}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         Actor_Free
    pop        {pc}


_nt Routine_Drain_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x38
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_080694ec
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_080694ec:
    pop        {pc}

    .align 2, 0

