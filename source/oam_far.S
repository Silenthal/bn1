#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

far_thumb_func_start Oam_AddSprite
Oam_AddSprite:
    push       { lr }
    strb       r0,[r5,#Sprite_m_indexOamList]
    ldrb       r0,[r5,#Sprite_m_spriteFlags]
    mov        r1,#0x20
    tst        r0,r1
    bne        LAB_03006d76
    mov        r1,#0x2
    tst        r0,r1
    bne        LAB_03006d78
LAB_03006d76:
    pop        { pc }
LAB_03006d78:
    ldr        r1,[r5,#Sprite_m_curSubFrame]
    ldrb       r2,[r1,#0x0] @ object list index
    lsl        r2,r2,#0x2
    ldr        r0,[r5,#Sprite_m_curFrame]
    ldr        r0,[r0,#0xc] @ object list ptr
    ldr        r1,[r5,#Sprite_m_spriteStart]
    add        r1,r1,r0
    ldr        r2,[r1,r2]
    add        r2,r2,r1
    ldr        r3,[r5,#Sprite_m_i0]
    push       { r3 }
    ldr        r4,[r5,#Sprite_m_b11]
    mvn        r4,r4
    and        r3,r4
    str        r3,[r5,#Sprite_m_i0]
    ldrb       r0,[r5,#Sprite_m_spriteFlags]
    mov        r7,#0xff
    mov        r1,#0x4
    and        r1,r0
    bne        LAB_03006da8
    mov        r7,#0x0
    mov        r1,#0x8
    and        r1,r0
    beq        advanceToNextObj
LAB_03006da8:
    ldrb       r3,[r2,#0x0] @ tile number
    cmp        r3,#0xff
    beq        exit
    ldr        r3,[r5,#Sprite_m_i0]
    lsl        r6,r3,#0x1
    str        r6,[r5,#Sprite_m_i0]
    cmp        r3,#0x0
    bge        advanceToNextObj
    ldr        r6,[r5,#Sprite_m_u2]
    bl         Oam_SpriteRotateFlipPos
    mov        r8,r1
    mov        r9,r0
    add        r3,r6,#0x0
    mov        r0,#Sprite_m_posX
    ldrsh      r0,[r5,r0]
    add        r0,r8
    mov        r4,#0x10
    lsl        r4,r4,#0x4
    add        r4,#0xff
    and        r0,r4
    lsl        r0,r0,#0x10
    orr        r3,r0
    ldrb       r4,[r2,#0x3] @ flag1
    mov        r0,#0xf0
    and        r0,r4
    lsl        r4,r4,#0x1e
    orr        r3,r4
    lsl        r0,r0,#0x16
    eor        r3,r0
    cmp        r7,#0xff
    bne        LAB_03006dec
    mov        r0,#0xf
    b          LAB_03006dee
LAB_03006dec:
    mov        r0,#0xe
LAB_03006dee:
    ldrb       r0,[r5,r0]
    add        r0,r9
    mov        r4,#0xff
    and        r0,r4
    orr        r3,r0
    @ Object shape
    ldrb       r4,[r2,#0x4]
    lsl        r1,r4,#0x1c
    lsr        r1,r1,#0x1c
    lsl        r1,r1,#0xe
    orr        r3,r1
    @ tile attributes
    ldrh       r1,[r5,#Sprite_m_tileAttributes]
    ldrh       r0,[r5,#Sprite_m_dstTileOffset]
    ldrb       r4,[r2,#0x0]
    add        r4,r4,r0
    orr        r1,r4
    mov        r8,r2
    mov        r9,r5
    add        r0,r3,#0x0
    ldrb       r2,[r5,#0x7]
    cmp        r7,#0xff
    bne        LAB_03006e1a
    add        r2,#0x1
LAB_03006e1a:
    mov        r12,r7
    mov        r3,#0xa
    ldrsh      r3,[r5,r3]
    add        r3,#0x30
    ldr        r7,PTR_Oam_AddObject_1_03006fbc
    mov        lr,pc
    bx         r7
    mov        r7,r12
    mov        r2,r8
    mov        r5,r9
advanceToNextObj:
    add        r2,#0x5
    mov        r7,#0x0
    b          LAB_03006da8
exit:
    pop        { r0 }
    str        r0,[r5,#Sprite_m_i0]
    pop        { pc }
thumb_func_end Oam_AddSprite

thumb_func_start Oam_SpriteRotateFlipPos
Oam_SpriteRotateFlipPos:
    mov        r3,#0x3
    lsl        r3,r3,#0x8
    and        r3,r6
    beq        LAB_03006f42
    @ With a as an angle going counterclockwise:
    @ | x0 |  x  | Sx *  cos(a)  Sy * sin(a) |  =  | x1 |
    @ | y0 |     | Sx * -sin(a)  Sy * cos(a) |     | y1 |
    @ With this formula, the rotation specified by a is clockwise, and the
    @ operation performs scaling first, then rotation
    ldrb       r4,[r5,#Sprite_m_u3_affineRelated_Hi]
    mov        r3,#0x3e
    and        r4,r3
    lsr        r4,r4,#0x1
    mov        r3,#0x20
    lsl        r3,r3,#0x18
    cmp        r7,#0xff
    bne        LAB_03006e5a
    add        r6,r6,r3
    add        r4,#0x10
    b          LAB_03006e5c
LAB_03006e5a:
    bic        r6,r3
LAB_03006e5c:
    mov        r8,r6
    mov        r9,r7
    mov        r6,#0xc
    mul        r4,r6
    ldr        r6,PTR_gSpriteAffineDataList_03006fc0
    add        r6,r6,r4
    ldrb       r1,[r6,#0x8]
    add        r1,#0x40
    mov        r3,#0xff
    and        r1,r3
    lsl        r1,r1,#0x1
    mov        r3,#0x1
    ldrsb      r3,[r2,r3]
    ldr        r0,PTR_objMidpointX_03006fc4
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r0,r0,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r4,[r0,r4]
    sub        r3,r3,r4
    ldrb       r0,[r6,#0x9]
    mul        r3,r0
    ldr        r0,PTR_sinTable_03006fc8
    ldrsh      r0,[r0,r1]
    mul        r3,r0
    mov        r7,#0x2
    ldrsb      r7,[r2,r7]
    ldr        r0,PTR_objMidpointY_03006fcc
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r0,r0,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r4,[r0,r4]
    sub        r7,r7,r4
    ldrb       r0,[r6,#0xA]
    mul        r7,r0
    ldr        r0,PTR_cosTable_03006fd0
    ldrsh      r0,[r0,r1]
    mul        r7,r0
    add        r3,r3,r7
    asr        r3,r3,#0xc
    ldr        r0,PTR_objWidth_03006fd4
    ldrb       r1,[r2,#0x4]
    lsl        r1,r1,#0x1c
    lsr        r1,r1,#0x1a
    add        r0,r0,r1
    ldrb       r1,[r2,#0x3]
    lsl        r1,r1,#0x1c
    lsr        r1,r1,#0x1c
    ldrsb      r1,[r0,r1]
    add        r3,r3,r1
    push       { r3 }
    ldrb       r1,[r6,#0x8]
    add        r1,#0x40
    mov        r3,#0xff
    and        r1,r3
    lsl        r1,r1,#0x1
    mov        r3,#0x1
    ldrsb      r3,[r2,r3]
    ldr        r0,PTR_objMidpointX_03006fd8
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r0,r0,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r4,[r0,r4]
    sub        r3,r3,r4
    ldrb       r0,[r6,#0x9]
    mul        r3,r0
    ldr        r0,PTR_cosTable_03006fdc
    ldrsh      r0,[r0,r1]
    neg        r0,r0
    mul        r3,r0
    mov        r7,#0x2
    ldrsb      r7,[r2,r7]
    ldr        r0,PTR_objMidpointY_03006fe0
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r0,r0,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r4,[r0,r4]
    sub        r7,r7,r4
    ldrb       r0,[r6,#0xA]
    mul        r7,r0
    ldr        r0,PTR_sinTable_03006fe4
    ldrsh      r0,[r0,r1]
    mul        r7,r0
    add        r3,r3,r7
    asr        r3,r3,#0xc
    ldr        r0,PTR_objHeight_03006fe8
    ldrb       r1,[r2,#0x4]
    lsl        r1,r1,#0x1c
    lsr        r1,r1,#0x1a
    add        r0,r0,r4
    ldrb       r1,[r2,#0x3]
    lsl        r1,r1,#0x1c
    lsr        r1,r1,#0x1c
    ldrsb      r1,[r0,r1]
    add        r3,r3,r1
    push       { r3 }
    pop        { r0, r1 }
    mov        r6,r8
    mov        r7,r9
    mov        pc,lr
LAB_03006f42:
    mov        r8,r7
    mov        r1,#0x1
    ldrsb      r1,[r2,r1]
    mov        r0,#0x2
    ldrsb      r0,[r2,r0]
    ldrb       r3,[r5,#0x13]
    mov        r4,#0x10
    and        r3,r4
    beq        LAB_03006f6a
    neg        r1,r1
    ldr        r3,PTR_objWidth_03006fec
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r3,r3,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r3,[r3,r4]
    add        r1,r1,r3
LAB_03006f6a:
    ldrb       r3,[r5,#0x13]
    mov        r4,#0x20
    and        r3,r4
    beq        LAB_03006f88
    neg        r0,r0
    ldr        r3,PTR_objHeight_03006ff0
    ldrb       r4,[r2,#0x4]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1a
    add        r3,r3,r4
    ldrb       r4,[r2,#0x3]
    lsl        r4,r4,#0x1c
    lsr        r4,r4,#0x1c
    ldrsb      r3,[r3,r4]
    add        r0,r0,r3
LAB_03006f88:
    mov        r7,r8
    mov        pc,lr
thumb_func_end Oam_SpriteRotateFlipPos

objMidpointX:
    .byte -4,  -8, -16, -32
    .byte -8, -16, -16, -32
    .byte -4,  -4,  -8, -16
 objMidpointY:
    .byte -4,  -8, -16, -32
    .byte -4,  -4,  -8, -16
    .byte -8, -16, -16, -32
objWidth:
    .byte -8,  -16, -32, -64
    .byte -16, -32, -32, -64
    .byte -8,   -8, -16, -32
objHeight:
    .byte -8,  -16, -32, -64
    .byte -8,   -8, -16, -32
    .byte -16, -32, -32, -64

PTR_Oam_AddObject_1_03006fbc:           .word Oam_AddObject + 1
PTR_gSpriteAffineDataList_03006fc0:     .word gSpriteAffineDataList
PTR_objMidpointX_03006fc4:              far_label objMidpointX
PTR_sinTable_03006fc8:                  .word sinTable
PTR_objMidpointY_03006fcc:              far_label objMidpointY
PTR_cosTable_03006fd0:                  .word cosTable
PTR_objWidth_03006fd4:                  far_label objWidth
PTR_objMidpointX_03006fd8:              far_label objMidpointX
PTR_cosTable_03006fdc:                  .word cosTable
PTR_objMidpointY_03006fe0:              far_label objMidpointY
PTR_sinTable_03006fe4:                  .word sinTable
PTR_objHeight_03006fe8:                 far_label objHeight
PTR_objWidth_03006fec:                  far_label objWidth
PTR_objHeight_03006ff0:                 far_label objHeight

far_thumb_func_start Oam_TransferData
Oam_TransferData:
    push       { lr }
    ldr        r0,ptrOamStart
    ldr        r2,ptrSpriteContainerListEnd
    ldr        r3,ptrOamEnd
    ldr        r6,ptrSpriteContainerListStart
    @ Go through sprite list, adding sprites to OAM
LAB_03006ffe:
    ldr        r1,[r6,#0x0]
    ldr        r4,[r6,#0x4]
    add        r4,r4,r1
    @ r1 = address of start of list
    @ r4 = address of end of list
LAB_03007004:
    @ Going backwards, obtain the index
    @ Skip index if equal to -1
    sub        r4,#0x1
    cmp        r1,r4
    bgt        LAB_0300702c
    ldrb       r5,[r4,#0x0]
    cmp        r5,#0xff
    beq        LAB_03007004
    @ r0 = the current object
LAB_03007010:
    @ Skip section if current object address is past OAM end
    cmp        r0,r3
    bge        LAB_03007032
    @ Using the index gotten earlier, index into the iwOamAttributeList
    lsl        r5,r5,#0x3
    ldr        r7,PTR_iwOamAttributeList_030070c0
    add        r7,r7,r5
    @ Store the xyDetails and tileDetails at the index in iwOamAttributeList
    ldr        r5,[r7,#OamAttributeListNode_m_xyDetails]
    str        r5,[r0,#ObjectControl_m_xyDetails]
    ldrh       r5,[r7,#OamAttributeListNode_m_tileDetail]
    strh       r5,[r0,#ObjectControl_m_tileDetails]
    @ Move to the next OAM object
    add        r0,#0x8
    ldrb       r5,[r7,#OamAttributeListNode_m_nextIndex]
    @ If the next index is 0xFF, go to the next entry in the sprite container list
    @ Otherwise, continue this block with the new index
    cmp        r5,#0xff
    beq        LAB_03007004
    b          LAB_03007010
LAB_0300702c:
    @ Move to the next list in the collection
    add        r6,#0x8
    cmp        r6,r2
    blt        LAB_03006ffe
LAB_03007032:
    @ Store available object slots
    sub        r2,r3,r0
    lsr        r2,r2,#0x3
    ldr        r4,PTR_gOamFreeObjectCount_030070c4
    str        r2,[r4,#0x0]
    @ After all objects are written, clear the rest of OAM
    mov        r2,#0x0
    mov        r4,#0xc
    lsl        r4,r4,#0x8
LAB_03007040:
    cmp        r0,r3
    bge        LAB_0300704c
    str        r2,[r0,#0x0]
    strh       r4,[r0,#0x4]
    add        r0,#0x8
    b          LAB_03007040
    @ Transfer affine data
LAB_0300704c:
    ldr        r0,PTR_gSpriteAffineDataList_030070c8
    ldr        r1,ptrOamStart
    mov        r2,#0
    mov        r3,#32
LAB_03007054:
    ldrh       r4,[r0,#ObjectAffineAttributes_m_pa]
    strh       r4,[r1,#ObjectControl_m_affineDetails]
    ldrh       r4,[r0,#ObjectAffineAttributes_m_pb]
    strh       r4,[r1,#ObjectControl_m_affineDetails + 0x8 * 1]
    ldrh       r4,[r0,#ObjectAffineAttributes_m_pc]
    strh       r4,[r1,#ObjectControl_m_affineDetails + 0x8 * 2]
    ldrh       r4,[r0,#ObjectAffineAttributes_m_pd]
    strh       r4,[r1,#ObjectControl_m_affineDetails + 0x8 * 3]
    add        r0,#0xc
    add        r1,#0x20
    add        r2,#0x1
    cmp        r2,r3
    blt        LAB_03007054
    @ Clear all sprite lists
    mov        r2,#0x0
    mvn        r2,r2
    ldr        r3,PTR_SpriteList_ARRAY_030070cc
    mov        r4,#0x4
LAB_03007076:
    ldr        r0,[r3,#0x0]
    ldr        r1,[r3,#0x4]
    ldr        r7,PTR_memset_32_1_030070d0
    mov        lr,pc
    bx         r7
    add        r3,#0x8
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_03007076
    ldr        r0,PTR_gOamAttributeCount_030070d4
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Oam_TransferData

SpriteList_ARRAY_03007090:
    .word iwSpriteList0, 0x34
    .word iwSpriteList1, 0x34
    .word iwSpriteList2, 0x1A0
    .word iwSpriteList3, 0x1A0

ptrOamStart:                        .word OAM_BEGIN
ptrSpriteContainerListEnd:          .word iwSpriteContainerList + 4 * 8
ptrOamEnd:                          .word OAM_END
ptrSpriteContainerListStart:        .word iwSpriteContainerList
PTR_iwOamAttributeList_030070c0:    .word iwOamAttributeList
PTR_gOamFreeObjectCount_030070c4:   .word gOamFreeObjectCount
PTR_gSpriteAffineDataList_030070c8: .word gSpriteAffineDataList
PTR_SpriteList_ARRAY_030070cc:      far_label SpriteList_ARRAY_03007090
PTR_memset_32_1_030070d0:           .word memset_32+1
PTR_gOamAttributeCount_030070d4:    .word gOamAttributeCount

    .end
