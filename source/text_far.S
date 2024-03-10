#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

PTR_ARRAY_030070d8:
    far_label Screen_PadUITextToEnd
    far_label Screen_PadUITextToLineEnd
    far_label Screen_PrintFixedWidthNumber


@@ Writes UI text to the screen.
@@ Uses different rules than dialogue.
@@ 
@@ In:
@@ r0 (pushed): void* textDict
@@ r1: int textDictIndex
@@ r2: byte* dstTextTileBuf
@@ r3: byte* dstAddressVram
@@ r4: byte textWidth
@@ r5: byte textHeight
@@ r6: byte* srcTextTileBuf
@@ r7: byte charShade

far_thumb_func_start Screen_WriteUIText
Screen_WriteUIText:
    pop        { r0 }
    push       { lr }
    mov        r8,r7
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    @ Store text width, total text length, and char shade
    strb       r4,[r7,#0x0]
    mul        r4,r5
    strb       r4,[r7,#0x1]
    mov        r4,r8
    strb       r4,[r7,#0x2]
    @Set the r4 and r5 counters to 0
    mov        r4,#0x0
    mov        r5,#0x0
    mov        r9,r5
    push       { r2, r3 }
    @ Load text pointer to r0
    lsl        r1,r1,#0x1
    ldrh       r1,[r0,r1]
    add        r0,r0,r1
    mov        r3,#0x1
.main:
    cmp        r3,#0x0
    beq        .done
    @ Check byte 
    ldrb       r1,[r0,#0x0]
    cmp        r1,#0xe7
    bge        .callTextFunc
    b          .printRegularChar
.callTextFunc:
    @ For chars past E7, do a special func
    sub        r1,#0xe7
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PTR_ARRAY_0300729c
    ldr        r1,[r7,r1]
    mov        lr,pc
    bx         r1
    b          .main
.printRegularChar:
    cmp        r1,#0xe5
    beq        .printE5ExtendedChar
    cmp        r1,#0xe6
    beq        .printE6ExtendedChar
    @ Character is normal, so print as usual
    bl         Screen_CopyUITextTile
    @ Advance by just 1
    add        r0,#0x1
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    b          .main
.printE5ExtendedChar:
    @ For E5, next byte specifies an extended range cha to print 
    ldrb       r1,[r0,#0x1]
    add        r1,#0xe5
    bl         Screen_CopyUITextTile
    @ Advance by 2 when done
    add        r0,#0x2
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    b          .main
.printE6ExtendedChar:
    @ For E6, print from the extra extended char set
    ldrb       r1,[r0,#0x1]
    add        r1,#0xe6
    add        r1,#0xff
    bl         Screen_CopyUITextTile
    @ Advance by 2 when done
    add        r0,#0x2
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    b          .main
.done:
    @ r0 = text tile buffer that was written to
    @ r1 = actual address in vram
    @ r2 = word count ((end - start)/ 4)
    pop        { r0, r1 }
    sub        r2,r2,r0
    lsr        r2,r2,#0x2
    ldr        r3,PTR_Dma_TransferListAdd_1_030072a0
    mov        lr,pc
    bx         r3
    mov        r0,r9
    pop        { pc }

@@ Copies the tile data for a character of UI text
@@ to the buffer.
@@ 
@@ In:
@@ r1: int character
@@ r2: byte* dstTextTileBuf
@@ r4: int lineCharCounter
@@ r5: int totalCharCounter
@@ r6: byte* srcTextTile
@@ 
@@ Out:
@@ r2: dstTextTileBuf + 0x40
@@ r4: r4 + 1
@@ r5: r5 + 1
far_thumb_func_start Screen_CopyUITextTile
Screen_CopyUITextTile:
    push       { r0, r6, lr }    
    @ set r6 to point to 2-tile char specified by r1
    lsl        r7,r1,#0x6
    add        r6,r6,r7
    @set r0 to point to char shade specified by unk68->m_charShade
    ldr        r7,PTR_charShade_030072a4
    mov        r1,r10
    ldr        r1,[r1,#0x68]
    ldrb       r1,[r1,#0x2]
    ldr        r0,[r7,r1]
    mov        r1,#0x0
1:
    @ copy src tile line, add shade, store to dest tile line
    ldr        r7,[r6,r1]
    add        r7,r7,r0
    str        r7,[r2,r1]
    add        r1,#0x4
    cmp        r1,#0x40
    blt        1b
    @ Once done, advance r2 by 1 char (2 tiles)
    @ add 1 to r4 and r5
    add        r2,#0x40
    add        r4,#0x1
    add        r5,#0x1
    pop        { r0, r6, pc }

    .align 2, 0

charShade:
    .word 0x0
    .word 0x33333333
    .word 0x66666666
    .word 0x99999999
    .word 0xCCCCCCCC


@@ Pads a block of UI text till the max length is reached.
@@ 
@@ In:
@@ r2: byte* dstTextTileBuf
@@ r4: int lineCharCounter
@@ r5: int totalCharCounter
@@ r6: byte* srcTextTileBuf
@@ 
@@ Out:
@@ r2: dstTextTileBuf + 0x40
@@ r4: r4 + 1
@@ r5: r5 + 1
_ts Screen_PadUITextToEnd
    push       { lr }
    @ Fetch total text length into r1
    mov        r1,r10
    ldr        r1,[r1,#0x68]
    ldrb       r1,[r1,#0x1]
    mov        r8,r1
1:
    @ Copy char 0 (blank) to buffer till end of
    @ text is reached
    cmp        r5,r8
    bge        2f
    mov        r1,#0x0
    bl         Screen_CopyUITextTile
    b          1b
2:
    @ Mark r3 as 0 to indicate the end of the text print
    mov        r3,#0x0
    pop        { pc }

@@ Pads a block of UI text till a line break.
@@ 
@@ In:
@@ r2: byte* dstTextTileBuf
@@ r4: int lineCharCounter
@@ r5: int totalCharCounter
@@ r6: byte* srcTextTileBuf
@@ 
@@ Out:
@@ r2: dstTextTileBuf + 0x40
@@ r4: r4 + 1
@@ r5: r5 + 1
_ts Screen_PadUITextToLineEnd
    push       { lr }
    @ Fetch text width into r1
    mov        r1,r10
    ldr        r1,[r1,#0x68]
    ldrb       r1,[r1,#0x0]
    mov        r8,r1
1:
    @ Copy char 0 (blank) to buffer till end of
    @ line is reached
    cmp        r4,r8
    bge        2f
    mov        r1,#0x0
    bl         Screen_CopyUITextTile
    b          1b
2:
    @ Reset line counter and move text pointer to next position
    mov        r4,#0x0
    add        r0,#0x1
    pop        { pc }

@@ Prints a stored number with a given minimum width.
@@ 
@@ In:
@@ r0: byte* textPointer
@@ r2: byte* dstTextTileBuf
@@ r4: int lineCharCounter
@@ r5: int totalCharCounter
@@ r6: byte* srcTextTileBuf
@@
@@ Code format:
@@ textPointer[1] = the buffer index from which to read the number (0-3)
@@ textPointer[2] = the width of the output.
@@ - If <  0x80, pad right with space if (width - numberWidth)        < 0x40, otherwise 0
@@ - If >= 0x80, pad left  with space if (width - 0x80 - numberWidth) < 0x40, otherwise 0
_ts Screen_PrintFixedWidthNumber
    push       { r3, lr }
    push       { r0, r2, r4, r5, r6 }
    ldrb       r1,[r0,#0x1]
    lsl        r1,r1,#0x2
    add        r1,#0x4
    mov        r7,r10
    ldr        r7,[r7,#0x68]
    ldr        r0,[r7,r1]
    ldr        r6,PTR_ConvertNumToBCD_1_030072a8
    mov        lr,pc
    bx         r6
    mov        r8,r0
    ldr        r6,PTR_GetWidthOfBcdNumber_1_030072ac
    mov        lr,pc
    bx         r6
    add        r7,r0,#0x0
    sub        r0,#0x1
    lsl        r1,r0,#0x2
    pop        { r0, r2, r4, r5, r6 }
    ldrb       r3,[r0,#0x2]
    cmp        r3,#0x80
    bge        LAB_0300724e
    sub        r3,r3,r7
    mov        r7,#0x0
    cmp        r3,#0x40
    blt        LAB_0300721c
    sub        r3,#0x40
    mov        r7,#0x1
LAB_0300721c:
    push       { r0 }
    push       { r7 }
    mov        r0,#0xf
LAB_03007222:
    mov        r7,r8
    lsr        r7,r1
    and        r7,r0
    push       { r1 }
    mov        r1,#0x1
    add        r1,r1,r7
    bl         Screen_CopyUITextTile
    pop        { r1 }
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    sub        r1,#0x4
    bge        LAB_03007222
    pop        { r0 }
LAB_03007240:
    cmp        r3,#0x0
    ble        LAB_03007294
    sub        r3,#0x1
    add        r1,r0,#0x0
    bl         Screen_CopyUITextTile
    b          LAB_03007240
LAB_0300724e:
    sub        r3,#0x80
    sub        r3,r3,r7
    push       { r0, r1 }
    mov        r0,#0x0
    cmp        r3,#0x40
    blt        LAB_0300725e
    sub        r3,#0x40
    mov        r0,#0x1
LAB_0300725e:
    cmp        r3,#0x0
    ble        LAB_03007272
    sub        r3,#0x1
    add        r1,r0,#0x0
    bl         Screen_CopyUITextTile
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    b          LAB_0300725e
LAB_03007272:
    pop        { r0, r1 }
    push       { r0 }
    mov        r0,#0xf
LAB_03007278:
    mov        r7,r8
    lsr        r7,r1
    and        r7,r0
    push       { r1 }
    mov        r1,#0x1
    add        r1,r1,r7
    bl         Screen_CopyUITextTile
    pop        { r1 }
    mov        r7,r9
    add        r7,#0x1
    mov        r9,r7
    sub        r1,#0x4
    bge        LAB_03007278
LAB_03007294:
    pop        { r0 }
    add        r0,#0x3
    pop        { r3, pc }

    .align 2, 0

PTR_PTR_ARRAY_0300729c:
    far_label PTR_ARRAY_030070d8
PTR_Dma_TransferListAdd_1_030072a0:
    .word Dma_TransferListAdd
PTR_charShade_030072a4:
    far_label charShade
PTR_ConvertNumToBCD_1_030072a8:
    .word ConvertNumToBCD
PTR_GetWidthOfBcdNumber_1_030072ac:
    .word GetWidthOfBcdNumber
PTR_REG_DISPCNT_030072b0:
    .word REG_DISPCNT
    .word 0x400
