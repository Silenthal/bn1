#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_GaiaBase
    push       {lr}
    ldrb       r0,[r5,#Effect_state_s0]
    ldr        r7,PTR_PTR_E_GaiaBase_0_Init_08081830
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_GaiaBase_0_Init_08081830:
    .word PTR_E_GaiaBase_0_Init_08081834

PTR_E_GaiaBase_0_Init_08081834:
    .word E_GaiaBase_0_Init
    .word E_GaiaBase_1_Main
    .word E_GaiaBase_2_Free


_ts E_GaiaBase_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    mov        r1,#0x6
    add        r1,#0xff
    bl         Sprite_InitSpritePtr
    bl         SpritePtr_NoShadow
    mov        r0,#0x0
    strb       r0,[r5,#Effect_frameIndexCurr]
    strb       r0,[r5,#Effect_frameIndexLast]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    ldrb       r0,[r5,#Effect_family_family]
    bl         SpritePtr_SetPaletteIndex
    ldrb       r0,[r5,#Effect_cPos_x]
    ldrb       r1,[r5,#Effect_cPos_y]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#Effect_pos_curr_x]
    mov        r0,#0x1
    lsl        r0,r0,#0x10
    neg        r0,r0
    add        r1,r1,r0
    str        r1,[r5,#Effect_pos_curr_y]
    str        r0,[r5,#Effect_pos_curr_z]
    mov        r0,#0x1
    strb       r0,[r5,#Effect_owner]
    FieldObject_Create PFI_Moving, 0x60
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s0]
    bl         E_GaiaBase_1_Main
    ldr        r0,[r5,#Effect_obj_60]
    bl         FieldObject_MarkAsChecked
    pop        {pc}


_ts E_GaiaBase_1_Main
    mov        pc,lr


_nt E_GaiaBase_2_Free
    push       {lr}
    ldr        r0,[r5,#Effect_obj_60]
    bl         FieldObject_Free
    bl         Effect_Free
    pop        {pc}


_ts Effect_GaiaBase_Create
    push       {lr}
    push       {r1,r2,r5}
    mov        r0,#0x47
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r1,r2,r5}
    beq        LAB_080818c4
    strb       r1,[r7,#0x18]
    strb       r2,[r7,#0x19]
LAB_080818c4:
    pop        {pc}

    .align 2, 0

