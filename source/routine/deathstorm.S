#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_DeathStorm
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_DeathStorm_0_Init_08068ad4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_DeathStorm_0_Init_08068ad4:
    .word PTR_R_DeathStorm_0_Init_08068ad8

PTR_R_DeathStorm_0_Init_08068ad8:
    .word R_DeathStorm_0_Init
    .word R_DeathStorm_1_Main
    .word R_DeathStorm_2_Free


_ts R_DeathStorm_0_Init
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
    beq        LAB_08068b00
    mov        r0,#0x4
LAB_08068b00:
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
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x4
    str        r0,[r5,#0x8]
    bl         R_DeathStorm_1_Main
    pop        {pc}


_ts R_DeathStorm_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_DeathStorm_1_0_08068b60
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_R_DeathStorm_1_0_08068b60:
    .word PTR_R_DeathStorm_1_0_08068b64

PTR_R_DeathStorm_1_0_08068b64:
    .word R_DeathStorm_1_0
    .word R_DeathStorm_1_1
    .word R_DeathStorm_1_2
    .word R_DeathStorm_1_3


_ts R_DeathStorm_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068b9c
    mov        r0,#0x1f
    strb       r0,[r5,#0x14]
    ldr        r4,DAT_08068ba0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08068b98
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08068b98:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08068b9c:
    pop        {pc}

    .align 2, 0


DAT_08068ba0:
    .word 0xB40400


_ts R_DeathStorm_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08068bde
    mov        r0,#0x21
    strb       r0,[r5,#0x14]
    bl         R_Actor_ClearCurrentAttack
    ldr        r4,DAT_08068be0
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08068bce
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08068bce:
    mov        r0,#0x78
    strh       r0,[r5,#0x1c]
    mov        r0,#0x2
    strh       r0,[r5,#0x1e]
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_08068bde:
    pop        {pc}

DAT_08068be0:
    .word 0xB40600


_ts R_DeathStorm_1_2
    push       {lr}
    ldrh       r0,[r5,#0x1e]
    sub        r0,#0x1
    strh       r0,[r5,#0x1e]
    bne        LAB_08068bf6
    bl         R_DeathStorm_RandomTornadoes
    mov        r0,#0x2
    strh       r0,[r5,#0x1e]
LAB_08068bf6:
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    strb       r0,[r5,#0x7]
    bne        LAB_08068c08
    mov        r0,#0xc9
    bl         Sound_PlaySE
    mov        r0,#0x14
    strb       r0,[r5,#0x7]
LAB_08068c08:
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_08068c32
    mov        r0,#0x22
    strb       r0,[r5,#0x14]
    bl         R_Actor_ClearCurrentAttack
    ldr        r4,DAT_08068c34
    ldrb       r0,[r5,#0x16]
    bl         Attack_AnimationOnly_Create
    str        r7,[r5,#0x5c]
    tst        r7,r7
    beq        LAB_08068c2e
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_08068c2e:
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
LAB_08068c32:
    pop        {pc}

DAT_08068c34:
    .word 0xB40700


_ts R_DeathStorm_1_3
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08068c4c
    bl         R_DeathStorm_Attack
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_08068c4c:
    pop        {pc}


_nt R_DeathStorm_2_Free
    push       {lr}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    add        r3,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r3]
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r7,#0x0]
    bl         Actor_Free
    pop        {pc}


_nt R_DeathStorm_RandomTornadoes
    push       {r5,lr}
    bl         Rng_RandomUint
    ldrb       r2,[r5,#0x18]
    add        r3,r2,#0x1
    ldrb       r1,[r5,#0x16]
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r1,r4
    tst        r1,r1
    beq        LAB_08068c88
    mov        r1,#0x7
    sub        r2,r1,r2
    mov        r3,#0x1
LAB_08068c88:
    mov        r1,#0x6
    sub        r1,r1,r2
    bls        LAB_08068cc6
    push       {r0,r3}
    lsr        r0,r0,#0x10
    bl         SWI_DivMod
    add        r7,r0,#0x0
    pop        {r0,r3}
    add        r7,r7,r3
    lsl        r0,r0,#0x10
    lsr        r0,r0,#0x10
    mov        r1,#0x3
    bl         SWI_DivMod
    add        r1,r0,#0x1
    add        r0,r7,#0x0
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    ldr        r4,DAT_08068cc8
    bl         Effect_QuickEffect_Create
    tst        r5,r5
    beq        LAB_08068cc6
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r5,#0x0]
LAB_08068cc6:
    pop        {r5,pc}

DAT_08068cc8:
    .word 0x5002A


_ts R_DeathStorm_Attack
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    sub        sp,#0x14
    mov        r0,sp
    push       {r0}
    bl         Battle_FindOpponentPanelsForward
    pop        {r7}
    ldr        r4,FamilyDetail_08068d0c
    ldrh       r6,[r5,#0x24]
LAB_08068ce4:
    sub        r0,#0x4
    bmi        LAB_08068d06
    push       {r0,r4,r6,r7}
    ldrb       r0,[r7,r0]
    bl         Field_IndexToCellXY
    bl         Battle_CellCoordsToSprite
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    mov        r3,#0x0
    mov        r0,#0x0
    mov        r7,#0x1
    bl         Field_CreateSharpStrikeAttack
    pop        {r0,r4,r6,r7}
    b          LAB_08068ce4
LAB_08068d06:
    add        sp,#0x14
    pop        {pc}

    .align 2, 0


FamilyDetail_08068d0c:
    .byte 0x19, 0x00, 0x01, 0x02


_ts Routine_DeathStorm_Create
    push       {lr}
    push       {r0,r5,r6}
    mov        r0,#0x36
    bl         Actor_Alloc
    add        r7,r5,#0x0
    pop        {r0,r5,r6}
    tst        r7,r7
    beq        LAB_08068d2a
    strb       r0,[r7,#0x16]
    strh       r6,[r7,#0x24]
    mov        r0,#0x5
    strb       r0,[r7,#0x0]
LAB_08068d2a:
    pop        {pc}
