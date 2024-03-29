#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


@@ Copies a list of tilemap entries to the screen buffer in a horizontal line.
@@ In:
@@ r0: x: The X coordinate of the target screen. Bounded on [0, 31].
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
far_thumb_func_start Screen_SafeCopyTileMapH
Screen_SafeCopyTileMapH:
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r1,r1,#0x6
    add        r6,r6,r1
    mov        r2,#0x1f
    mvn        r2,r2
LAB_03006988:
    tst        r0,r2
    bne        LAB_03006992
    ldrh       r7,[r3,#0x0]
    lsl        r1,r0,#0x1
    strh       r7,[r6,r1]
LAB_03006992:
    add        r0,#0x1
    add        r3,#0x2
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_03006988
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a vertical line.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen. Bounded on [0, 31].
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
far_thumb_func_start Screen_SafeCopyTileMapV
Screen_SafeCopyTileMapV:
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    add        r6,r6,r0
    mov        r2,#0x1f
    mvn        r2,r2
LAB_030069b0:
    tst        r1,r2
    bne        LAB_030069ba
    ldrh       r7,[r3,#0x0]
    lsl        r0,r1,#0x6
    strh       r7,[r6,r0]
LAB_030069ba:
    add        r1,#0x1
    add        r3,#0x2
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_030069b0
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a rectangle.
@@ In:
@@ r0: x: The X coordinate of the target screen. Bounded on [0, 31].
@@ r1: y: The Y coordinate of the target screen. Bounded on [0, 31].
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: width: The width of the rectangle.
@@ r5: height: The height of the rectangle.
far_thumb_func_start Screen_SafeCopyTileMapRect
Screen_SafeCopyTileMapRect:
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    add        r4,r4,r0
    add        r5,r5,r1
LAB_030069d4:
    push       { r0 }
LAB_030069d6:
    mov        r2,#0x1f
    mvn        r2,r2
    add        r7,r0,#0x0
    orr        r7,r1
    tst        r7,r2
    bne        LAB_030069ec
    lsl        r7,r0,#0x1
    lsl        r2,r1,#0x6
    add        r2,r2,r7
    ldrh       r7,[r3,#0x0]
    strh       r7,[r6,r2]
LAB_030069ec:
    add        r3,#0x2
    add        r0,#0x1
    cmp        r0,r4
    blt        LAB_030069d6
    pop        { r0 }
    add        r1,#0x1
    cmp        r1,r5
    blt        LAB_030069d4
    mov        pc,lr

    .align 2, 0
