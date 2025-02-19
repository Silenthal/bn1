#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_BombManBombExplosion
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_BombManBombExplosion_0_Init_080801cc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    pop        {pc}

    .align 2, 0


PTR_PTR_E_BombManBombExplosion_0_Init_080801cc:
    .word PTR_E_BombManBombExplosion_0_Init_080801d0

PTR_E_BombManBombExplosion_0_Init_080801d0:
    .word E_BombManBombExplosion_0_Init
    .word E_BombManBombExplosion_1_Main
    .word E_BombManBombExplosion_2_Free


_ts E_BombManBombExplosion_0_Init
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0xcc
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoShadow
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Effect_counterA]
    strb       r0,[r5,#Effect_bc]
    mov        r0,#0x2
    strb       r0,[r5,#Effect_element]
    FieldObject_Create PFI_Self_Default, 0x64
    mov        r0,#0x76
    bl         Sound_PlaySE
    bl         E_BombManBombExplosion_1_Main
    pop        {pc}


_ts E_BombManBombExplosion_1_Main
    push       {lr}
    mov        r0,#0x0
    bl         FieldObject_UpdateField
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    bl         FieldObject_GetPanelFlags
    ldrb       r1,[r5,#Effect_bc]
    tst        r1,r1
    beq        LAB_08080242
    ldr        r0,[r5,#Effect_obj_64]
    bl         FieldObject_Disable
    b          LAB_08080258
LAB_08080242:
    ldr        r7,PTR_DAT_080802b8
    ldrb       r1,[r5,#Effect_owner]
    lsl        r1,r1,#0x2
    ldr        r1,[r7,r1]
    tst        r1,r0
    beq        LAB_08080258
    mov        r0,#0x1
    strb       r0,[r5,#Effect_bc]
    ldr        r0,[r5,#Effect_obj_64]
    bl         FieldObject_SetDeletedFlag
LAB_08080258:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_0808026c
    mov        r0,#0x8
    strh       r0,[r5,#Effect_state_s0]
    mov        r0,#0x0
    strh       r0,[r5,#Effect_state_s2]
    b          LAB_080802b6
LAB_0808026c:
    ldrh       r0,[r5,#Effect_counterA]
    add        r0,#0x1
    strh       r0,[r5,#Effect_counterA]
    cmp        r0,#0x8
    bne        LAB_080802b6
    ldrb       r0,[r5,#Effect_family_family]
    tst        r0,r0
    bne        LAB_080802a0
    mov        r0,#0x0
LAB_0808027e:
    push       {r0}
    push       {r0}
    bl         FUN_080802d2
    pop        {r4}
    cmp        r0,#0xff
    beq        LAB_08080296
    mov        r2,#0x8c
    ldrb       r3,[r5,#Effect_owner]
    add        r4,#0x1
    bl         Effect_BombManBombExplosion_Create
LAB_08080296:
    pop        {r0}
    add        r0,#0x1
    cmp        r0,#0x4
    blt        LAB_0808027e
    b          LAB_080802b6
LAB_080802a0:
    ldrb       r0,[r5,#Effect_family_family]
    sub        r0,#0x1
    bl         FUN_080802d2
    cmp        r0,#0xff
    beq        LAB_080802b6
    mov        r2,#0x8c
    ldrb       r3,[r5,#Effect_owner]
    ldrb       r4,[r5,#Effect_family_family]
    bl         Effect_BombManBombExplosion_Create
LAB_080802b6:
    pop        {pc}

PTR_DAT_080802b8:
    .word DAT_080802bc

DAT_080802bc:
    .byte 0x20
    .byte 0x00
    .byte 0x00
    .byte 0x00
    .byte 0x10

    .align 2, 0



_ts E_BombManBombExplosion_2_Free
    push       {lr}
    ldr        r0,[r5,#Effect_obj_64]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_nt FUN_080802d2
    push       {lr}
    sub        sp,#0x8
    ldr        r7,PTR_DAT_0808031c
    add        r0,r0,r0
    add        r7,r7,r0
    mov        r2,#0x0
    ldrsb      r2,[r7,r2]
    mov        r3,#0x1
    ldrsb      r3,[r7,r3]
    ldrb       r0,[r5,#Effect_cPos_x]
    add        r0,r0,r2
    str        r0,[sp,#0x0]
    ldrb       r1,[r5,#Effect_cPos_y]
    add        r1,r1,r3
    str        r1,[sp,#0x4]
    bl         FieldObject_GetPanelFlags
    mov        r1,#0x1
    tst        r0,r1
    beq        LAB_08080308
    mov        r1,#0x2
    and        r1,r0
    lsr        r1,r1,#0x1
    ldrb       r0,[r5,#Effect_owner]
    eor        r0,r1
    beq        LAB_08080308
    b          LAB_0808030c
LAB_08080308:
    mov        r0,#0xff
    str        r0,[sp,#0x0]
LAB_0808030c:
    ldr        r0,[sp,#0x0]
    ldr        r1,[sp,#0x4]
    add        sp,#0x8
    pop        {pc}

DAT_08080314:
    .byte 0x00

DAT_08080315:
    .byte -1
    .byte 0x00
    .byte 0x01
    .byte -1
    .byte 0x00
    .byte 0x01

    .align 2, 0


PTR_DAT_0808031c:
    .word DAT_08080314


_ts Effect_BombManBombExplosion_Create
    push       {lr}
    push       {r0,r1,r2,r3,r5}
    mov        r0,#0x34
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r0,r1,r2,r3,r5}
    beq        LAB_08080344
    strh       r2,[r7,#0x24]
    strb       r3,[r7,#0x16]
    strb       r0,[r7,#0x18]
    strb       r1,[r7,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r7,#0x28]
    str        r1,[r7,#0x2c]
    mov        r2,#0x0
    str        r2,[r7,#0x30]
LAB_08080344:
    pop        {pc}

    .align 2, 0

