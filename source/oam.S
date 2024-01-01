#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

thumb_func_start Oam_InitTransferData
Oam_InitTransferData:
    push       { lr }
    ldr        r0,PTR_srcSpriteContainerList_08010bd0
    ldr        r1,PTR_iwSpriteContainerList_08010bd4
    mov        r2,#0x20
    bl         memcpy_32
    mov        r2,#0x0
    mvn        r2,r2
    ldr        r3,PTR_srcSpriteContainerList_08010bd8
    mov        r4,#0x4
LAB_08010a70:
    ldr        r0,[r3,#0x0]
    ldr        r1,[r3,#0x4]
    bl         memset_32
    add        r3,#0x8
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_08010a70
    ldr        r0,PTR_iwOamAttributeList_08010bdc
    ldr        r1,DAT_08010be0
    bl         memset0_32
    ldr        r0,PTR_gOamAttributeCount_08010be4
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Oam_InitTransferData

srcSpriteContainerList:
    .word iwSpriteList0, 0x34
    .word iwSpriteList1, 0x34
    .word iwSpriteList2, 0x1A0
    .word iwSpriteList3, 0x1A0


@@ Adds an object to be drawn to the screen.
@@ In:
@@ r0: xyDetails: Object attributes 0 and 1, dealing with an object's position and appearance.
@@ r1: tileDetails: Object attribute 2, dealing with an object's tile number, palette, and priority.
@@ r2: listIndex: The index of the object list to add to.
@@ r3: listOffset: The index within the specified list to add the object at.
thumb_func_start Oam_AddObject
Oam_AddObject:
    @ Check if the max amount of objects have been added
    ldr        r5,PTR_gOamAttributeCount_08010be8
    ldr        r6,[r5,#0x0]
    cmp        r6,#OAM_OBJECT_LIMIT
    bge        .oam_add_object_end
    @ Use r2 to select the list
    ldr        r4,PTR_iwSpriteContainerList_08010bec
    lsl        r7,r2,#0x3
    add        r4,r4,r7
    @ Check that the list offset (r3) is valid to the specified list
    ldr        r7,[r4,#SpriteList_length]
    cmp        r3,r7
    bge        .oam_add_object_end
    cmp        r3,#0x0
    blt        .oam_add_object_end
    @ Index into the selected sprite list...
    ldr        r4,[r4,#SpriteList_header]
    add        r4,r4,r3
    @ Increment the object count...
    add        r7,r6,#0x1
    str        r7,[r5,#0x0]
    @ Take the index that was at the location,
    @ and store the new index, which is the old
    @ object count (r6) in the sprite list
    ldrb       r7,[r4,#0x0]
    strb       r6,[r4,#0x0]
    @ Then, index into the oam attribute linked list...
    lsl        r6,r6,#0x3
    ldr        r5,PTR_iwOamAttributeList_08010bf0
    add        r5,r5,r6
    @ And store the xy and tile attributes, and the old index
    @ as the "next" node to go to
    str        r0,[r5,#OamAttributeListNode_m_xyDetails]
    strh       r1,[r5,#OamAttributeListNode_m_tileDetail]
    strb       r7,[r5,#OamAttributeListNode_m_nextIndex]
    mov        r0,#0xff
    strb       r0,[r5,#OamAttributeListNode_m_unused]
.oam_add_object_end:
    mov        pc,lr
thumb_func_end Oam_AddObject

thumb_func_start Oam_AffineTransformAlloc
Oam_AffineTransformAlloc:
    ldr        r3,PTR_gSpriteAffineDataFlag_08010bf4
    ldr        r1,[r3,#0x0]
    ldr        r2,DAT_08010bf8
    mov        r0,#0x0
LAB_08010af0:
    tst        r1,r2
    beq        LAB_08010afe
    lsr        r2,r2,#0x1
    add        r0,#0x1
    cmp        r0,#0x10
    bge        LAB_08010b04
    b          LAB_08010af0
LAB_08010afe:
    orr        r1,r2
    str        r1,[r3,#0x0]
    mov        pc,lr
LAB_08010b04:
    mov        r0,#0xff
    mov        pc,lr
thumb_func_end Oam_AffineTransformAlloc

thumb_func_start Oam_AffineTransformFree
Oam_AffineTransformFree:
    ldr        r3,PTR_gSpriteAffineDataFlag_08010bfc
    ldr        r1,[r3,#0x0]
    ldr        r2,DAT_08010bf8
    lsr        r2,r0
    bic        r1,r2
    str        r1,[r3,#0x0]
    mov        pc,lr
thumb_func_end Oam_AffineTransformFree



@@ Sets params for rotation/scaling.
@@ In:
@@ r0: angle: The angle to rotate by.
@@ r1: Sx: The inverse of the amount to scale X by, multiplied by 16.
@@ r2: Sy: The inverse of the amount to scale Y by, multiplied by 16.
@@ r3: index: The parameter index.
@@ 
@@ Notes:
@@ Two entries are used per index. The one stored at index+16 has the 
@@ inverse scaling matrix:
@@ | Sx  0 |
@@ |  0 Sy |
@@ and the one stored at index has the inverse scale/rotate matrix:
@@ | Sx  0 | * |  cos(a) sin(a) | = | Sx *  cos(a)  Sx * sin(a) |
@@ |  0 Sy |   | -sin(a) cos(a) |   | Sy * -sin(a)  Sy * cos(a) |
@@ The param at index also stores the actual scale factors, which are
@@ 1/Sx and 1/Sy.
@@
@@ The scale is stored as above because the affine matrix P (pa, pb, pc, pd)
@@ is a linear transformation from a point on the screen to the sprite. From
@@ the sprite perspective, a scale is performed, then a rotate. From the
@@ screen perspective, the same operation is an inverse rotate, then an
@@ inverse scale.
thumb_func_start Oam_AffineTransformSetParams
Oam_AffineTransformSetParams:
    push       { lr }
    push       { r0, r1, r2 }
    ldr        r0,PTR_gSpriteAffineDataList_08010c00
    add        r6,r0,#0x0
    mov        r1,#0xc
    mul        r1,r3
    add        r0,r0,r1
    add        r3,#0x10
    mov        r1,#0xc
    mul        r1,r3
    add        r6,r6,r1
    mov        r5,#0x0
    mov        r2,#0x0
    strb       r2,[r6,#0x8]
    pop        { r2 }
    strb       r2,[r0,#0x8]
    lsl        r2,r2,#0x1
    pop        { r3 }
    add        r7,r3,#0x0
    bl         Inverse
    strb       r3,[r0,#0x9]
    add        r3,r7,#0x0
    ldr        r1,PTR_cosTable_08010c04
    ldrsh      r4,[r1,r5]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r6,#0x0]
    ldrsh      r4,[r1,r2]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r0,#0x0]
    ldr        r1,PTR_sinTable_08010c08
    ldrsh      r4,[r1,r5]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r6,#0x2]
    ldrsh      r4,[r1,r2]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r0,#0x2]
    pop        { r3 }
    add        r7,r3,#0x0
    bl         Inverse
    strb       r3,[r0,#0xa]
    add        r3,r7,#0x0
    ldr        r1,PTR_cosTable_08010c0c
    ldrsh      r4,[r1,r5]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r6,#0x6]
    ldrsh      r4,[r1,r2]
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r0,#0x6]
    ldr        r1,PTR_sinTable_08010c10
    ldrsh      r4,[r1,r5]
    neg        r4,r4
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r6,#0x4]
    ldrsh      r4,[r1,r2]
    neg        r4,r4
    mul        r4,r3
    lsr        r4,r4,#0x4
    strh       r4,[r0,#0x4]
    pop        { pc }
thumb_func_end Oam_AffineTransformSetParams

@ For a fractional number from 0 to 1 (0x100), returns 1/num.
thumb_func_start Inverse
Inverse:
    push       { r1, r2 }
    ldr        r1,DAT_08010c14
    mov        r2,#0x0
    cmp        r3,#0x0
    beq        LAB_08010bb4
LAB_08010baa:
    cmp        r1,r3
    blt        LAB_08010bb4
    sub        r1,r1,r3
    add        r2,#0x1
    b          LAB_08010baa
LAB_08010bb4:
    add        r3,r2,#0x0
    pop        { r1, r2 }
    mov        pc,lr
thumb_func_end Inverse


thumb_func_start Oam_InitAffineData
Oam_InitAffineData:
    push       { lr }
    ldr        r0,PTR_gSpriteAffineDataFlag_08010c18
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    ldr        r0,PTR_gSpriteAffineDataList_08010c1c
    ldr        r1,INT_08010c20
    bl         memset0_32
    pop        { pc }
thumb_func_end Oam_InitAffineData

    .align 2, 0
PTR_srcSpriteContainerList_08010bd0:    .word srcSpriteContainerList
PTR_iwSpriteContainerList_08010bd4:     .word iwSpriteContainerList
PTR_srcSpriteContainerList_08010bd8:    .word srcSpriteContainerList
PTR_iwOamAttributeList_08010bdc:        .word iwOamAttributeList
DAT_08010be0:                           .word 0x400
PTR_gOamAttributeCount_08010be4:        .word gOamAttributeCount
PTR_gOamAttributeCount_08010be8:        .word gOamAttributeCount
PTR_iwSpriteContainerList_08010bec:     .word iwSpriteContainerList
PTR_iwOamAttributeList_08010bf0:        .word iwOamAttributeList
PTR_gSpriteAffineDataFlag_08010bf4:     .word gSpriteAffineDataFlag
DAT_08010bf8:                           .word 0x80000000
PTR_gSpriteAffineDataFlag_08010bfc:     .word gSpriteAffineDataFlag
PTR_gSpriteAffineDataList_08010c00:     .word gSpriteAffineDataList
PTR_cosTable_08010c04:                  .word cosTable
PTR_sinTable_08010c08:                  .word sinTable
PTR_cosTable_08010c0c:                  .word cosTable
PTR_sinTable_08010c10:                  .word sinTable
DAT_08010c14:                           .word 0x100
PTR_gSpriteAffineDataFlag_08010c18:     .word gSpriteAffineDataFlag
PTR_gSpriteAffineDataList_08010c1c:     .word gSpriteAffineDataList
INT_08010c20:                           .word 0x180

    .end
