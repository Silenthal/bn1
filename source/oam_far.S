#include "offsets.h"
#include "common.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

@ In:
@ r0: spriteListIndex - The index in which to insert the sprite
@ r5: sprite - The sprite to add
far_thumb_func_start Oam_AddSprite
Oam_AddSprite:
    push       { lr }
    strb       r0,[r5,#Sprite_indexOamList]
    ldrb       r0,[r5,#Sprite_spriteFlags]
    mov        r1,#SF_TilesNotInVram
    tst        r0,r1
    bne        .returnIfNoTiles
    mov        r1,#SF_TilesetLoaded
    tst        r0,r1
    bne        .spriteTilesetLoaded
.returnIfNoTiles:
    pop        { pc }
.spriteTilesetLoaded:
    ldr        r1,[r5,#Sprite_curSubFrame]
    ldrb       r2,[r1,#SpriteSubFrame_objectListIndex]
    lsl        r2,r2,#0x2
    @ r2 = list index of current sub frame, which is looked up in the current frame's object list
    ldr        r0,[r5,#Sprite_curFrame]
    ldr        r0,[r0,#SpriteFrame_objectLists]
    ldr        r1,[r5,#Sprite_spriteStart]
    add        r1,r1,r0
    @ r1 = object list of current frame
    ldr        r2,[r1,r2]
    add        r2,r2,r1
    @ r2 = object entry of the active sub frame of the current sprite frame
    ldr        r3,[r5,#Sprite_objectDrawBitset]
    push       { r3 }
    ldr        r4,[r5,#Sprite_objectExcludeFlags]
    mvn        r4,r4
    and        r3,r4
    str        r3,[r5,#Sprite_objectDrawBitset]
    ldrb       r0,[r5,#Sprite_spriteFlags]
    mov        r7,#0xff
    mov        r1,#0x4
    and        r1,r0
    bne        .handleObject
    mov        r7,#0x0
    mov        r1,#SF_NoZClip
    and        r1,r0
    beq        .advanceToNextObj
.handleObject:
    ldrb       r3,[r2,#SpriteObjectEntry_tileNumber]
    cmp        r3,#0xff
    beq        .exit
    ldr        r3,[r5,#Sprite_objectDrawBitset]
    lsl        r6,r3,#0x1
    str        r6,[r5,#Sprite_objectDrawBitset]
    @ bitset <<= 1; if bitset & 0x80000000 == 0 move to next object
    cmp        r3,#0x0
    bge        .advanceToNextObj
    ldr        r6,[r5,#Sprite_bx10_lo]
    @ if sprite flag & 4 != 0, r7 = 0xFF, else r7 = 0
    bl         Oam_SpriteRotateFlipPos
    mov        r8,r1
    mov        r9,r0
    @ r8 = object X
    @ r9 = object Y
    add        r3,r6,#0x0
    @ r3 = r6, from sprite rotate func
    mov        r0,#Sprite_screenX
    ldrsh      r0,[r5,r0]
    add        r0,r8
    mov        r4,#0x10
    lsl        r4,r4,#0x4
    add        r4,#0xff
    and        r0,r4
    lsl        r0,r0,#0x10
    orr        r3,r0
    @ r3 |= ((screenX + objectX) & 0x1FF) << 0x10
    @ r3 [16:23] = x coord
    ldrb       r4,[r2,#SpriteObjectEntry_flag1]
    mov        r0,#0xf0
    and        r0,r4
    lsl        r4,r4,#0x1e
    orr        r3,r4
    @ r3 |= flag1 << 0x1E
    @ r0 [30:31] = obj size
    lsl        r0,r0,#0x16
    eor        r3,r0
    @ r3 ^= hvflags << 0x16
    @ r3 [28] = ~hflip
    @ r3 [29] = ~vflip
    cmp        r7,#0xff
    bne        .usePortraitY
    mov        r0,#Sprite_bx0f_y2
    b          .calculateScreenY
.usePortraitY:
    mov        r0,#Sprite_portraitScreenY
.calculateScreenY:
    ldrb       r0,[r5,r0]
    add        r0,r9
    mov        r4,#0xff
    and        r0,r4
    orr        r3,r0
    @ r3 |= ([screen Y] + object Y) & 0xFF
    @ r3 [0:7] = y coord 
    ldrb       r4,[r2,#SpriteObjectEntry_flag2]
    lsl        r1,r4,#0x1c
    lsr        r1,r1,#0x1c
    lsl        r1,r1,#0xe
    orr        r3,r1
    @ r3 |= flag2 & 0xF << 0xE
    @ r3 [14:15] = obj shape
    ldrh       r1,[r5,#Sprite_tileAttributes]
    ldrh       r0,[r5,#Sprite_dstTileOffset]
    ldrb       r4,[r2,#SpriteObjectEntry_tileNumber]
    add        r4,r4,r0
    orr        r1,r4
    @ r1 = (dstTileOffset + tileNum) | tileAttrs
    mov        r8,r2
    mov        r9,r5
    add        r0,r3,#0x0
    @ store object to r8, and sprite to r9, and [ObjectXYAttributes] to r0
    ldrb       r2,[r5,#Sprite_indexOamList]
    cmp        r7,#0xff
    bne        LAB_03006e1a
    add        r2,#0x1
LAB_03006e1a:
    mov        r12,r7
    mov        r3,#Sprite_spriteNum
    ldrsh      r3,[r5,r3]
    add        r3,#0x30
    @ r0 = ObjectXYAttributes
    @ r1 = ObjectTileAttributes
    @ r2 = indexOamList + (r7 == 0xFF ? 1 : 0)
    @ r3 = spriteNum + 0x30
    ldr        r7,PTR_Oam_AddObject_1_03006fbc
    mov        lr,pc
    bx         r7
    mov        r7,r12
    mov        r2,r8
    mov        r5,r9
    @ Restore r7, sprite, and object to previous values
.advanceToNextObj:
    add        r2,#0x5
    mov        r7,#0x0
    b          .handleObject
.exit:
    pop        { r0 }
    str        r0,[r5,#Sprite_objectDrawBitset]
    pop        { pc }
thumb_func_end Oam_AddSprite

@ In:
@ r2: curObject
@ r5: sprite
@ r6: param_r6
@ r7: param_r7
@
@ Out:
@ r0: newObjectY
@ r1: newObjectX
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
    ldrb       r4,[r5,#Sprite_bx13_affineRelated_Hi]
    mov        r3,#0x3e
    and        r4,r3
    lsr        r4,r4,#0x1
    @ r4 = 
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
    @ r1 = x, r0 = y
    ldrb       r3,[r5,#0x13]
    mov        r4,#0x10
    and        r3,r4
    beq        .checkY
    @ if affineHigh & 0x10 != 0...
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
    @ r1 = -x + objWidthArr[objShape * 4 + objSize]
.checkY:
    ldrb       r3,[r5,#0x13]
    mov        r4,#0x20
    and        r3,r4
    beq        .end
    @ if affineHigh & 0x20 != 0...
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
    @ r0 = -y + objHeightArr[objShape * 4 + objSize]
.end:
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
@@ Transfers object data to OAM memory.
Oam_TransferData:
    push       { lr }
    ldr        r0,=OAM_BEGIN
    ldr        r2,=iwSpriteContainerList + 4 * 8
    ldr        r3,=OAM_END
    ldr        r6,=iwSpriteContainerList
    @ Go through sprite list, adding sprites to OAM
.read_sprite_list_header:
    ldr        r1,[r6,#SpriteList_header]
    ldr        r4,[r6,#SpriteList_length]
    add        r4,r4,r1
    @ r1 = address of start of list
    @ r4 = address of end of list
.get_next_spritelist_entry:
    @ Going backwards, obtain the next available object entry
    sub        r4,#0x1
    cmp        r1,r4
    bgt        .move_to_next_sprite_list
    ldrb       r5,[r4,#0x0]
    cmp        r5,#0xff
    beq        .get_next_spritelist_entry
    @ r0 = the current object
.copy_current_object:
    @ Skip section if current object address is past OAM end
    cmp        r0,r3
    bge        .update_object_count
    @ Using the index gotten earlier, index into the object attribute list to get details on the current object
    lsl        r5,r5,#0x3
    ldr        r7,=iwOamAttributeList
    add        r7,r7,r5
    @ Copy xyDetails and tileDetails from the object to the location in OAM
    ldr        r5,[r7,#OamAttributeListNode_m_xyDetails]
    str        r5,[r0,#ObjectControl_m_xyDetails]
    ldrh       r5,[r7,#OamAttributeListNode_m_tileDetail]
    strh       r5,[r0,#ObjectControl_m_tileDetails]
    @ Move to the next object index
    add        r0,#0x8
    ldrb       r5,[r7,#OamAttributeListNode_m_nextIndex]
    @ If the next index is 0xFF, go to the next entry in the sprite container list
    @ Otherwise, continue this block with the new index
    cmp        r5,#0xff
    beq        .get_next_spritelist_entry
    b          .copy_current_object
.move_to_next_sprite_list:
    @ Move to the next list in the collection
    add        r6,#0x8
    cmp        r6,r2
    blt        .read_sprite_list_header
.update_object_count:
    @ Store available object slots
    sub        r2,r3,r0
    lsr        r2,r2,#0x3
    ldr        r4,=gOamFreeObjectCount
    str        r2,[r4,#0x0]
    @ After all objects are written, clear the rest of OAM
    mov        r2,#0x0
    mov        r4,#0xc
    lsl        r4,r4,#0x8
.clear_tail_oam:
    cmp        r0,r3
    bge        .load_affine_data
    str        r2,[r0,#0x0]
    strh       r4,[r0,#0x4]
    add        r0,#0x8
    b          .clear_tail_oam
    @ Transfer affine data
.load_affine_data:
    ldr        r0,=gSpriteAffineDataList
    ldr        r1,=OAM_BEGIN
    mov        r2,#0
    mov        r3,#32
.load_affine_data_main_loop:
    ldrh       r4,[r0,#ObjectAffineAttributes_m_pa]
    strh       r4,[r1,#ObjectControl_m_affineDetails + 0x8 * 0]
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
    blt        .load_affine_data_main_loop
    @ Initialize all sprite lists
    mov        r2,#0x0
    mvn        r2,r2
    ldr        r3,=far(SpriteList_ARRAY_03007090)
    mov        r4,#0x4
.clear_sprite_lists:
    ldr        r0,[r3,#0x0]
    ldr        r1,[r3,#0x4]
    ldr        r7,=memset_32
    mov        lr,pc
    bx         r7
    add        r3,#0x8
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        .clear_sprite_lists
    ldr        r0,=gOamAttributeCount
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Oam_TransferData

SpriteList_ARRAY_03007090:
    .word iwSpriteList0, 0x34
    .word iwSpriteList1, 0x34
    .word iwSpriteList2, 0x1A0
    .word iwSpriteList3, 0x1A0

    .pool

    .end
