#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_DynamyteExplosion
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_DynamyteExplosion_0_Init_08081250
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_DynamyteExplosion_0_Init_08081250:
    .word PTR_E_DynamyteExplosion_0_Init_08081254

PTR_E_DynamyteExplosion_0_Init_08081254:
    .word E_DynamyteExplosion_0_Init
    .word E_DynamyteExplosion_1_Main
    .word E_DynamyteExplosion_2_Free


_ts E_DynamyteExplosion_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xd7
    bl         Sprite_InitSpritePtr
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r0,#0x0
    str        r0,[r5,#0x30]
    bl         Field_GetAttackDirectionOffset_MP
    ldr        r7,PTR_CellPosition_ARRAY_080812d4
    ldrb       r1,[r5,#0x4]
    lsl        r1,r1,#0x1
    ldrsb      r2,[r7,r1]
    mul        r0,r2
    str        r0,[r5,#0x44]
    add        r1,#0x1
    ldrsb      r0,[r7,r1]
    str        r0,[r5,#0x48]
    mov        r0,#0x9
    strh       r0,[r5,#0x1c]
    mov        r0,#0x76
    bl         Sound_PlaySongImmediate
    mov        r0,#0x0
    strb       r0,[r5,#0x1a]
    mov        r0,#0x1
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_DynamyteExplosion_1_Main
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}

    .align 2, 0


PTR_CellPosition_ARRAY_080812d4:
    .word CellPosition_ARRAY_080812d8

CellPosition_ARRAY_080812d8:
    cell_pos 1, 0
    cell_pos 1, 0
    cell_pos 1, -1
    cell_pos 1, 1
    cell_pos 0, -1
    cell_pos 0, 1


_ts E_DynamyteExplosion_1_Main
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_DisableIfHitFlagSet
    bl         E_DynamyteExplosion_IsHit
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_DynamyteExplosion_1_0_08081300
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

PTR_PTR_E_DynamyteExplosion_1_0_08081300:
    .word PTR_E_DynamyteExplosion_1_0_08081304

PTR_E_DynamyteExplosion_1_0_08081304:
    .word E_DynamyteExplosion_1_0
    .word E_DynamyteExplosion_1_1


_ts E_DynamyteExplosion_1_0
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0808133a
    ldrb       r0,[r5,#0x18]
    ldr        r2,[r5,#0x44]
    add        r0,r0,r2
    ldrb       r1,[r5,#0x19]
    ldr        r2,[r5,#0x48]
    add        r1,r1,r2
    push       {r0,r1}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08081336
    ldrb       r4,[r5,#0x4]
    ldrh       r6,[r5,#0x24]
    bl         Effect_DynamyteExplosion_Create
LAB_08081336:
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_0808133a:
    pop        {pc}


_ts E_DynamyteExplosion_1_1
    push       {lr}
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0808134c
    mov        r0,#0x8
    str        r0,[r5,#0x8]
LAB_0808134c:
    pop        {pc}


_nt E_DynamyteExplosion_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_ts E_DynamyteExplosion_IsHit
    push       {lr}
    ldr        r1,[r5,#0x60]
    ldrb       r0,[r1,#0x0]
    mov        r2,#0x2
    tst        r0,r2
    beq        LAB_0808137c
    mov        r0,#0x2
    bl         Field_GetDamageOnEntity
    tst        r0,r0
    beq        LAB_0808137c
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetHitFlag
    mov        r0,#0x1
    pop        {pc}
LAB_0808137c:
    mov        r0,#0x0
    pop        {pc}


_ts Effect_DynamyteExplosion_Create
    push       {lr}
    add        r7,r4,#0x0
    beq        LAB_0808139e
    push       {r0,r1,r5,r6}
    mov        r0,#0x42
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r5,r6}
    beq        LAB_0808139e
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    strh       r6,[r7,#0x24]
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
LAB_0808139e:
    pop        {pc}
