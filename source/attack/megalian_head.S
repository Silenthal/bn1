#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Attack_MegalianHead
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_A_MegalianHead_0_Init_08076690
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MegalianHead_0_Init_08076690:
    .word PTR_A_MegalianHead_0_Init_08076694

PTR_A_MegalianHead_0_Init_08076694:
    .word A_MegalianHead_0_Init
    .word A_MegalianHead_1_Main
    .word A_MegalianHead_2_Free


_ts A_MegalianHead_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x53
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_DisableShadow
    ldrb       r0,[r5,#0x4]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#0x16]
    mov        r1,#0x1
    eor        r0,r1
    bl         SpritePtr_SetFlipType
    mov        r0,#0x1b
    mov        r1,#0x60
    add        r1,r1,r5
    bl         Field_CreateEntity
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    strb       r0,[r5,#0x1b]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         A_MegalianHead_1_Main
    pop        {pc}


_nt A_MegalianHead_1_Main
    push       {lr}
    mov        r0,#0x0
    strh       r0,[r5,#0x20]
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0x5c]
    tst        r0,r0
    bne        LAB_0807670c
    ldr        r0,[r5,#0x60]
    bl         FieldObject_SetDeletedFlag
    mov        r0,#0x8
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807677a
LAB_0807670c:
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    bl         Battle_EntitySpriteCoordsToCell
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    ldr        r7,[r5,#0x60]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    bl         SpritePtr_DisableFlash
    ldr        r6,[r5,#0x60]
    ldrb       r0,[r5,#0x17]
    tst        r0,r0
    beq        LAB_08076764
    ldrh       r0,[r5,#0x18]
    ldr        r1,PanelFlag_08076788
    ldrb       r2,[r5,#0x16]
    tst        r2,r2
    beq        LAB_08076738
    ldr        r1,PanelFlag_0807678c
LAB_08076738:
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    bl         FieldObject_CalcDamage
    push       {r7}
    ldr        r7,[r5,#0x60]
    str        r1,[r7,#0x14]
    pop        {r7}
    ldrb       r0,[r5,#0x1a]
    bl         FieldObject_GetDamageToEntity
    tst        r0,r0
    beq        LAB_08076764
    strh       r0,[r5,#0x20]
    push       {r2}
    bl         SpritePtr_EnableFlash
    pop        {r2}
    mov        r0,#0x6f
    bl         Sound_PlaySE
LAB_08076764:
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_A_MegalianHead_1_0_0807677c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldr        r0,[r5,#0x60]
    bl         FieldObject_UpdateCellPosition
    ldr        r0,[r5,#0x60]
    bl         FieldObject_MarkAsChecked
LAB_0807677a:
    pop        {pc}

PTR_PTR_A_MegalianHead_1_0_0807677c:
    .word PTR_A_MegalianHead_1_0_08076780

PTR_A_MegalianHead_1_0_08076780:
    .word A_MegalianHead_1_0
    .word A_MegalianHead_1_1

PanelFlag_08076788:
    .word PF_Enemy | PF_Solid

PanelFlag_0807678c:
    .word PF_Player | PF_Solid


_ts A_MegalianHead_1_0
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_MegalianHead_1_0_0_080767a0
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_A_MegalianHead_1_0_0_080767a0:
    .word PTR_A_MegalianHead_1_0_0_080767a4

PTR_A_MegalianHead_1_0_0_080767a4:
    .word A_MegalianHead_1_0_0
    .word A_MegalianHead_1_0_1


_ts A_MegalianHead_1_0_0
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Disable
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    bl         SpritePtr_DisableShadow
    bl         A_MegalianHead_1_0_1
    pop        {pc}


_nt A_MegalianHead_1_0_1
    push       {lr}
    ldr        r7,[r5,#0x64]
    ldr        r0,[r7,#0x28]
    ldr        r1,[r7,#0x2c]
    ldr        r2,[r7,#0x30]
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    str        r2,[r5,#0x30]
    ldrb       r0,[r7,#0x18]
    strb       r0,[r5,#0x18]
    ldrb       r0,[r7,#0x19]
    strb       r0,[r5,#0x19]
    ldrb       r0,[r5,#0x1b]
    tst        r0,r0
    beq        LAB_080767f0
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_080767f0:
    pop        {pc}


_nt A_MegalianHead_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_A_MegalianHead_1_1_0_08076800
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_A_MegalianHead_1_1_0_08076800:
    .word PTR_A_MegalianHead_1_1_0_08076804

PTR_A_MegalianHead_1_1_0_08076804:
    .word A_MegalianHead_1_1_0
    .word A_MegalianHead_1_1_1


_ts A_MegalianHead_1_1_0
    push       {lr}
    mov        r0,#0x4
    strb       r0,[r5,#0x14]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    ldr        r7,PTR_DAT_0807685c
    ldrb       r0,[r5,#0x4]
    lsl        r1,r0,#0x2
    add        r0,r0,r0
    add        r0,r0,r1
    ldrb       r1,[r5,#0x18]
    sub        r1,#0x1
    add        r0,r0,r1
    ldrb       r0,[r7,r0]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_DAT_08076858
    ldr        r0,[r7,r0]
    str        r0,[r5,#0x44]
    neg        r0,r0
    str        r0,[r5,#0x4c]
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Enable
    mov        r0,#0x1
    strb       r0,[r5,#0x17]
    bl         SpritePtr_EnableShadow
    pop        {pc}

DAT_08076844:
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x01
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x01
    .byte 0x02

    .align 2, 0


PTR_DAT_08076858:
    .word DAT_08076860

PTR_DAT_0807685c:
    .word DAT_08076844

DAT_08076860:
    .byte 0x00
    .byte 0x00
    .byte 0x08
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x09
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x0A

    .align 2, 0



_ts A_MegalianHead_1_1_1
    push       {lr}
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    sub        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x4c]
    ldr        r2,DAT_08076894
    sub        r1,r1,r2
    str        r1,[r5,#0x44]
    cmp        r1,r0
    bgt        LAB_0807688c
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    strb       r0,[r5,#0x1b]
LAB_0807688c:
    bl         R_Actor_UpdateCellPos
    pop        {pc}

    .align 2, 0


DAT_08076894:
    .word 0x4000


_ts A_MegalianHead_2_Free
    push       {lr}
    ldr        r0,[r5,#0x60]
    bl         FieldObject_Free
    push       {r5}
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    mov        r4,#0x0
    bl         Effect_QuickEffect_Create
    pop        {r5}
    bl         Attack_Free
    pop        {pc}


_nt Attack_MegalianHead_Create
    push       {lr}
    push       {r3,r5,r6}
    mov        r0,#0x3a
    bl         Attack_Alloc
    add        r7,r5,#0x0
    pop        {r3,r5,r6}
    tst        r7,r7
    beq        LAB_080768d8
    ldrb       r0,[r5,#0x16]
    strb       r0,[r7,#0x16]
    ldrb       r0,[r5,#0x1a]
    strb       r0,[r7,#0x1a]
    strh       r6,[r7,#0x24]
    str        r5,[r7,#0x64]
    mov        r0,#0x0
    strh       r0,[r7,#0x20]
LAB_080768d8:
    add        r0,r7,#0x0
    pop        {pc}


_ts A_Megalian_ShowHead
    push       {lr}
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    orr        r1,r2
    strb       r1,[r0,#0x0]
    pop        {pc}


_ts A_Megalian_HideHead
    push       {lr}
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    bic        r1,r2
    strb       r1,[r0,#0x0]
    pop        {pc}
