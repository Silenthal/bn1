#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

thumb_func_start InitBgAnimation
InitBgAnimation:
    push       { lr }
    mov        r0,r10
    ldr        r0,[r0,#0x58]
    ldr        r1,=0x180
    bl         memset0_32
    pop        { pc }
thumb_func_end InitBgAnimation

    .align 2, 0

    .pool

thumb_func_start BgAnimation_AddNew
BgAnimation_AddNew:
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x58]
    ldrb       r1,[r0,#0x9]
    mov        r2,#0x18
    mul        r2,r1
    add        r7,r7,r2
    strb       r1,[r7,#0x1]
    ldr        r1,[r0,#0x0]
    str        r1,[r7,#0xc]
    ldr        r2,[r0,#0x4]
    str        r2,[r7,#0x10]
    ldr        r3,[r0,#0x8]
    str        r3,[r7,#0x14]
    add        r0,#0xc
    mov        r6,#0x1
    cmp        r3,#0x8
    beq        LAB_08001d46
    ldr        r6,[r0,#0x4]
LAB_08001d46:
    strh       r6,[r7,#0x2]
    mov        r6,#0x1
    strb       r6,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    ldr        r6,=funcListBgDataTransfer
    ldrb       r1,[r7,#0x14]
    ldr        r6,[r6,r1]
    mov        lr,pc
    bx         r6
    pop        { pc }
thumb_func_end BgAnimation_AddNew

    .pool

thumb_func_start BgAnimation_Update
BgAnimation_Update:
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x58]
    mov        r4,#0x0
LAB_08001d68:
    ldrb       r1,[r7,#0x0]
    tst        r1,r1
    bne        LAB_08001d78
LAB_08001d6e:
    add        r7,#0x18
    add        r4,#0x1
    cmp        r4,#0x10
    bge        LAB_08001db8
    b          LAB_08001d68
LAB_08001d78:
    ldrh       r1,[r7,#0x2]
    sub        r1,#0x1
    strh       r1,[r7,#0x2]
    cmp        r1,#0x0
    bgt        LAB_08001d6e
    ldr        r0,[r7,#0x8]
    ldr        r1,PTR_INT_ARRAY_08001dd4
    ldrb       r2,[r7,#0x14]
    ldr        r1,[r1,r2]
    add        r0,r0,r1
    ldr        r1,[r0,#0x0]
    cmp        r1,#0x0
    beq        LAB_08001db4
    cmp        r1,#0x2
    beq        LAB_08001d9e
    cmp        r1,#0x1
    bne        LAB_08001da2
    ldr        r0,[r7,#0x4]
    b          LAB_08001da2
LAB_08001d9e:
    ldr        r0,[r0,#0x4]
    str        r0,[r7,#0x4]
LAB_08001da2:
    str        r0,[r7,#0x8]
    ldr        r1,[r0,#0x4]
    strh       r1,[r7,#0x2]
    ldr        r6,PTR_funcListBgDataTransfer_08001dd8
    ldrb       r1,[r7,#0x14]
    ldr        r6,[r6,r1]
    mov        lr,pc
    bx         r6
    b          LAB_08001d6e
LAB_08001db4:
    mov        r1,#0x0
    strb       r1,[r7,#0x0]
LAB_08001db8:
    pop        { pc }
thumb_func_end BgAnimation_Update

    .align 2, 0

funcListBgDataTransfer:
    .word BgAnimation_TransferSimple
    .word BgAnimation_TransferTransform
    .word BgAnimation_TransferTilemap
INT_ARRAY_08001dc8:
    .word 8
    .word 8
    .word 8
PTR_INT_ARRAY_08001dd4: .word INT_ARRAY_08001dc8
PTR_funcListBgDataTransfer_08001dd8: .word funcListBgDataTransfer

thumb_func_start BgAnimation_TransferSimple
BgAnimation_TransferSimple:
    push       { lr }
    push       { r4, r7 }
    ldr        r0,[r0,#0x0]
    ldr        r1,[r7,#0xc]
    ldr        r2,[r7,#0x10]
    bl         Dma_TransferListAdd
    pop        { r4, r7 }
    pop        { pc }
thumb_func_end BgAnimation_TransferSimple

thumb_func_start BgAnimation_TransferTilemap
BgAnimation_TransferTilemap:
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0x44]
    ldr        r5,[r5,#0xc]
    ldrb       r2,[r7,#0x17]
    lsl        r2,r2,#0x2
    add        r2,#0x4
    ldr        r2,[r5,r2]
    add        r5,r5,r2
    mov        r6,#0xf0
    lsl        r6,r6,#0x8
    ldrb       r2,[r7,#0x16]
    mov        r8,r7
LAB_08001e0a:
    ldr        r1,[r0,#0x0]
    ldr        r7,[r0,#0x4]
    ldrh       r3,[r5,r1]
    and        r3,r6
    orr        r3,r7
    strh       r3,[r5,r1]
    add        r0,#0x8
    sub        r2,#0x1
    bgt        LAB_08001e0a
    mov        r7,r8
    push       { r4, r7 }
    mov        r7,r10
    ldr        r5,[r7,#0x44]
    bl         BGDM_LoadTilemap_StaticBG1
    pop        { r4, r7 }
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    pop        { pc }
thumb_func_end BgAnimation_TransferTilemap

thumb_func_start BgAnimation_TransferTransform
BgAnimation_TransferTransform:
    push       { r4, r7, lr }
    ldr        r6,[r0,#0x0]
    ldr        r5,PTR_PTR_gBgTileDataBuffer0_08001e84
    ldrb       r4,[r7,#0x17]
    lsl        r4,r4,#0x2
    ldr        r5,[r5,r4]
    ldr        r4,[r7,#0xc]
    mov        r1,#0x0
    push       { r0 }
LAB_08001e42:
    ldrh       r2,[r6,r1]
    lsl        r3,r2,#0x16
    lsr        r3,r3,#0x16
    lsl        r3,r3,#0x5
    push       { r4, r6 }
    add        r4,r4,r3
    ldr        r0,PTR_funcListTileCopy_08001e80
    lsr        r2,r2,#0xa
    lsl        r2,r2,#0x2
    ldr        r0,[r0,r2]
    mov        lr,pc
    bx         r0
    pop        { r4, r6 }
    add        r5,#0x20
    add        r1,#0x2
    ldrb       r2,[r7,#0x16]
    lsl        r2,r2,#0x1
    cmp        r1,r2
    blt        LAB_08001e42
    pop        { r0 }
    ldr        r0,PTR_PTR_gBgTileDataBuffer0_08001e84
    ldrb       r1,[r7,#0x17]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    ldr        r1,[r7,#0x10]
    ldrb       r2,[r7,#0x16]
    lsl        r2,r2,#0x5
    lsr        r2,r2,#0x2
    bl         Dma_TransferListAdd
    pop        { r4, r7, pc }
thumb_func_end BgAnimation_TransferTransform

PTR_funcListTileCopy_08001e80: .word funcListTileCopy
PTR_PTR_gBgTileDataBuffer0_08001e84: .word bgTileBufferList
bgTileBufferList:
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer1
    .word gBgTileDataBuffer2
    .word gBgTileDataBuffer3
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer4
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer5
    .word gBgTileDataBuffer6
    .word gBgTileDataBuffer7
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer8
    .word gBgTileDataBuffer4
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer9
    .word gBgTileDataBufferA
    .word gBgTileDataBufferB
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
    .word gBgTileDataBuffer0
funcListTileCopy:
    .word CopyTile
    .word CopyTile_HFlip
    .word CopyTile_VFlip
    .word CopyTile_HVFlip

thumb_func_start CopyTile
CopyTile:
    ldr        r0,[r4,#0x0]
    str        r0,[r5,#0x0]
    ldr        r0,[r4,#0x4]
    str        r0,[r5,#0x4]
    ldr        r0,[r4,#0x8]
    str        r0,[r5,#0x8]
    ldr        r0,[r4,#0xc]
    str        r0,[r5,#0xc]
    ldr        r0,[r4,#0x10]
    str        r0,[r5,#0x10]
    ldr        r0,[r4,#0x14]
    str        r0,[r5,#0x14]
    ldr        r0,[r4,#0x18]
    str        r0,[r5,#0x18]
    ldr        r0,[r4,#0x1c]
    str        r0,[r5,#0x1c]
    mov        pc,lr
thumb_func_end CopyTile

thumb_func_start CopyTile_HFlip
CopyTile_HFlip:
    ldr        r2,DAT_080021a8
    mov        r9,r2
    ldr        r2,DAT_080021a4
    mov        r8,r2
    ldr        r0,[r4,#0x0]
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x0]
    ldr        r0,[r4,#0x4]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x4]
    ldr        r0,[r4,#0x8]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x8]
    ldr        r0,[r4,#0xc]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0xc]
    ldr        r0,[r4,#0x10]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x10]
    ldr        r0,[r4,#0x14]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x14]
    ldr        r0,[r4,#0x18]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x18]
    ldr        r0,[r4,#0x1c]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x1c]
    mov        pc,lr
thumb_func_end CopyTile_HFlip

thumb_func_start CopyTile_VFlip
CopyTile_VFlip:
    ldr        r0,[r4,#0x0]
    str        r0,[r5,#0x1c]
    ldr        r0,[r4,#0x4]
    str        r0,[r5,#0x18]
    ldr        r0,[r4,#0x8]
    str        r0,[r5,#0x14]
    ldr        r0,[r4,#0xc]
    str        r0,[r5,#0x10]
    ldr        r0,[r4,#0x10]
    str        r0,[r5,#0xc]
    ldr        r0,[r4,#0x14]
    str        r0,[r5,#0x8]
    ldr        r0,[r4,#0x18]
    str        r0,[r5,#0x4]
    ldr        r0,[r4,#0x1c]
    str        r0,[r5,#0x0]
    mov        pc,lr
thumb_func_end CopyTile_VFlip

thumb_func_start CopyTile_HVFlip
CopyTile_HVFlip:
    ldr        r2,DAT_080021a8
    mov        r9,r2
    ldr        r2,DAT_080021a4
    mov        r8,r2
    ldr        r0,[r4,#0x0]
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x1c]
    ldr        r0,[r4,#0x4]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x18]
    ldr        r0,[r4,#0x8]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x14]
    ldr        r0,[r4,#0xc]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x10]
    ldr        r0,[r4,#0x10]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0xc]
    ldr        r0,[r4,#0x14]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x8]
    ldr        r0,[r4,#0x18]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x4]
    ldr        r0,[r4,#0x1c]
    mov        r2,r8
    lsr        r3,r2,#0x8
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x8
    lsl        r3,r3,#0x8
    orr        r0,r3
    mov        r2,#0x10
    ror        r0,r2
    mov        r2,r9
    lsr        r3,r2,#0x4
    and        r2,r0
    and        r3,r0
    lsr        r0,r2,#0x4
    lsl        r3,r3,#0x4
    orr        r0,r3
    str        r0,[r5,#0x0]
    mov        pc,lr
thumb_func_end CopyTile_HVFlip

DAT_080021a4: .word 0xFF00FF00
DAT_080021a8: .word 0xF0F0F0F0

    .end
