#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Effect_VirusDeleteExplosion_Create, 0x807CE16+1

DAT_08068410:
    .byte 0x95
    .byte 0x00
    .byte 0x02
    .byte 0x50
    .byte 0x95
    .byte 0x00
    .byte 0x04
    .byte 0x78
    .byte 0x45
    .byte 0x00
    .byte 0x02
    .byte 0xA0


_ts Routine_Fanner
    push       {lr}
    bl         SpritePtr_ResetPalette
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_Fanner_0_Init_08068430
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fanner_0_Init_08068430:
    .word PTR_R_Fanner_0_Init_08068434

PTR_R_Fanner_0_Init_08068434:
    .word R_Fanner_0_Init
    .word R_Fanner_1_Main
    .word R_Fanner_2_Free


_ts R_Fanner_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    bic        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x5f
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_SetZClip
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    ldrb       r0,[r5,#0x4]
    push       {r0}
    bl         SpritePtr_SetPaletteIndex
    pop        {r0}
    lsl        r0,r0,#0x2
    ldr        r7,PTR_DAT_080684c4
    add        r7,r7,r0
    str        r7,[r5,#0x60]
    ldrb       r0,[r7,#0x3]
    strh       r0,[r5,#0x24]
    mov        r3,#0x28
    add        r7,r5,r3
    mov        r3,#0x50
    add        r6,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r6!,{r0,r1,r2}
    bl         Battle_LoadEnemyHp
    bl         Battle_PriorityQueueEnqueue
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x9
    mov        r3,#0x64
    add        r1,r5,r3
    bl         Field_CreateEntity
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    mov        r0,#0x4
    strb       r0,[r5,#0xb]
    ldrb       r0,[r5,#0x12]
    cmp        r0,#0xff
    bne        LAB_080684b6
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strb       r0,[r5,#0xb]
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
LAB_080684b6:
    bl         R_Fanner_1_Main
    ldr        r0,[r5,#0x64]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_DAT_080684c4:
    .word DAT_08068410


_ts R_Fanner_1_Main
    push       {lr}
    ldr        r0,[r5,#0x64]
    bl         FieldObject_DisableIfHitFlagSet
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_080684f4
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetHitFlag
    b          LAB_08068548
LAB_080684f4:
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    beq        LAB_0806852c
    bl         Battle_IsInputLocked
    bne        LAB_08068548
    bl         Routine_CheckPoisonDrain
    tst        r0,r0
    bne        LAB_0806852c
    mov        r0,#0xa
    ldr        r1,[r5,#0x64]
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_08068548
    ldrb       r0,[r5,#0x1a]
    bl         Field_CalcDamageDealt
    tst        r0,r0
    beq        LAB_08068548
    bl         Field_SubtractHP
    bl         SpritePtr_SetFlashPalette
    ldrh       r0,[r5,#0x20]
    tst        r0,r0
    bne        LAB_08068542
LAB_0806852c:
    bl         Battle_DecreaseOpponentCount
    mov        r0,#0x70
    bl         Sound_PlaySongImmediate
    ldr        r0,[r5,#0x64]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x8
    str        r0,[r5,#0x8]
    pop        {pc}
LAB_08068542:
    mov        r0,#0x6f
    bl         Sound_PlaySongImmediate
LAB_08068548:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_Actor_1_0_Spawn_08068558
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

PTR_PTR_R_Actor_1_0_Spawn_08068558:
    .word PTR_R_Actor_1_0_Spawn_0806855c

PTR_R_Actor_1_0_Spawn_0806855c:
    .word R_Actor_1_0_Spawn
    .word R_Fanner_1_1_Wait
    .word R_Fanner_1_2_Decide
    .word R_Fanner_1_3_Tornado


_ts R_Fanner_1_1_Wait
    push       {lr}
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08068586
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x7]
    add        r0,#0x1
    strb       r0,[r7,#0x7]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
LAB_08068586:
    bl         Battle_GetEntryState
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08068598
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08068598:
    pop        {pc}


_nt R_Fanner_1_2_Decide
    push       {lr}
    ldr        r7,PTR_PTR_R_Fanner_1_2_0_080685bc
    ldrb       r0,[r5,#0xa]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         Battle_GetEntryState
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_080685b8
    mov        r1,#0x4
    strb       r1,[r5,#0x9]
    mov        r1,#0x0
    strh       r1,[r5,#0xa]
LAB_080685b8:
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fanner_1_2_0_080685bc:
    .word PTR_R_Fanner_1_2_0_080685c0

PTR_R_Fanner_1_2_0_080685c0:
    .word R_Fanner_1_2_0
    .word R_Fanner_1_2_1


_ts R_Fanner_1_2_0
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    bl         Rng_RandomUint
    lsr        r0,r0,#0x1a
    ldr        r7,[r5,#0x60]
    ldrh       r1,[r7,#0x0]
    add        r1,r1,r0
    strh       r1,[r5,#0x1c]
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt R_Fanner_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080685f4
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080685f4:
    pop        {pc}


_nt R_Fanner_1_3_Tornado
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_Fanner_1_3_0_08068604
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_R_Fanner_1_3_0_08068604:
    .word PTR_R_Fanner_1_3_0_08068608

PTR_R_Fanner_1_3_0_08068608:
    .word R_Fanner_1_3_0
    .word R_Fanner_1_3_1
    .word R_Fanner_1_3_2


_ts R_Fanner_1_3_0
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x14]
    ldrb       r0,[r5,#0x18]
    sub        r0,#0x1
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    ldr        r4,DAT_08068640
    ldrh       r6,[r5,#0x24]
    mov        r7,#0x14
    strh       r7,[r5,#0x1c]
    bl         Attack_SharpStrike_Create
    mov        r0,#0x4
    strh       r0,[r5,#0xa]
    pop        {pc}

    .align 2, 0


DAT_08068640:
    .word 0x2700FF


_ts R_Fanner_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0806866e
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    ldrb       r2,[r5,#0x19]
    mov        r3,#0x0
    ldr        r7,[r5,#0x60]
    ldrb       r4,[r5,#0x4]
    ldrb       r0,[r7,#0x2]
    lsl        r0,r0,#0x8
    orr        r4,r0
    ldrh       r6,[r5,#0x24]
    bl         Attack_Tornado_Create
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0806866e:
    pop        {pc}


_ts R_Fanner_1_3_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068686
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_08068686:
    pop        {pc}


_ts R_Fanner_2_Free
    push       {lr}
    ldr        r7,PTR_PTR_R_Fanner_2_0_08068698
    ldrb       r0,[r5,#0x9]
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_Fanner_2_0_08068698:
    .word PTR_R_Fanner_2_0_0806869c

PTR_R_Fanner_2_0_0806869c:
    .word R_Fanner_2_0
    .word R_Fanner_2_1


_ts R_Fanner_2_0
    push       {lr}
    bl         Battle_RegisterVirusDelete
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    push       {r5}
    add        r0,r5,#0x0
    bl         Effect_VirusDeleteExplosion_Create
    pop        {r5}
    mov        r0,#0x20
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    pop        {pc}


_ts R_Fanner_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_080686e0
    ldr        r0,[r5,#0x64]
    bl         FieldObject_Free
    bl         Battle_RemoveFromEnemyList
    bl         Actor_Free
LAB_080686e0:
    pop        {pc}

    .align 2, 0

