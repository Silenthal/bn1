#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


@@ Copies a single tilemap entry to the screen buffer.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entry: The tilemap entry.
_ts Screen_CopyTileMapEntry
    mov        r4,r10
    ldr        r4,[r4,#0x5c]
    lsl        r2,r2,#0xb
    add        r4,r4,r2
    lsl        r0,r0,#0x1
    lsl        r1,r1,#0x6
    add        r4,r4,r0
    add        r4,r4,r1
    strh       r3,[r4,#0x0]
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a horizontal line.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts Screen_CopyTileMapH
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    lsl        r1,r1,#0x6
    add        r6,r6,r0
    add        r6,r6,r1
LAB_080021d0:
    ldrh       r7,[r3,#0x0]
    strh       r7,[r6,#0x0]
    add        r3,#0x2
    add        r6,#0x2
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_080021d0
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a vertical line.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts Screen_CopyTileMapV
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    lsl        r1,r1,#0x6
    add        r6,r6,r0
    add        r6,r6,r1
LAB_080021f0:
    ldrh       r7,[r3,#0x0]
    strh       r7,[r6,#0x0]
    add        r3,#0x2
    add        r6,#0x40
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_080021f0
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a rectangle.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: width: The width of the rectangle.
@@ r5: height: The height of the rectangle.
_ts Screen_CopyTileMapRect
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    add        r6,r6,r0
    lsl        r1,r1,#0x6
    add        r6,r6,r1
    mov        r2,#0x0
    add        r1,r6,#0x0
LAB_08002214:
    ldrh       r7,[r3,#0x0]
    strh       r7,[r6,#0x0]
    add        r3,#0x2
    add        r6,#0x2
    add        r2,#0x1
    cmp        r2,r4
    blt        LAB_08002214
    mov        r2,#0x0
    add        r1,#0x40
    add        r6,r1,#0x0
    sub        r5,#0x1
    cmp        r5,#0x0
    bgt        LAB_08002214
    mov        pc,lr


@@ Sets all tilemap entries in a rectanglular area in a given screen buffer
@@ to the given tilemap entry.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: width: The width of the rectangle.
@@ r4: height: The height of the rectangle.
@@ r5: entry: The tilemap entry.
_ts Screen_SetTileMapRect
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    add        r6,r6,r0
    lsl        r1,r1,#0x6
    add        r6,r6,r1
    mov        r2,#0x0
    add        r1,r6,#0x0
LAB_08002244:
    strh       r5,[r6,#0x0]
    add        r6,#0x2
    add        r2,#0x1
    cmp        r2,r3
    blt        LAB_08002244
    mov        r2,#0x0
    add        r1,#0x40
    add        r6,r1,#0x0
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_08002244
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a horizontal line,
@@ wrapping to the start of the screen line if overflow occurs.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts Screen_CopyTileMapHWrap
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r1,r1,#0x6
    add        r6,r6,r1
LAB_08002268:
    ldrh       r7,[r3,#0x0]
    lsl        r1,r0,#0x1
    strh       r7,[r6,r1]
    add        r0,#0x1
    mov        r1,#0x1f
    and        r0,r1
    add        r3,#0x2
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_08002268
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a vertical line,
@@ wrapping to the start of the screen line if overflow occurs.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts Screen_CopyTileMapVWrap
    mov        r6,r10
    ldr        r6,[r6,#0x5c]
    lsl        r2,r2,#0xb
    add        r6,r6,r2
    lsl        r0,r0,#0x1
    add        r6,r6,r0
LAB_0800228c:
    ldrh       r7,[r3,#0x0]
    lsl        r0,r1,#0x6
    strh       r7,[r6,r0]
    add        r1,#0x1
    mov        r0,#0x1f
    and        r1,r0
    add        r3,#0x2
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        LAB_0800228c
    mov        pc,lr


@@ Copies a list of tilemap entries to the screen buffer in a horizontal line.
@@ In:
@@ r0: x: The X coordinate of the target screen. Bounded on [0, 31].
@@ r1: y: The Y coordinate of the target screen.
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts LC_Screen_SafeCopyTileMapH
    push       { lr }
    ldr        r7,PTR_Screen_SafeCopyTileMapH_1_080022c8
    mov        lr,pc
    bx         r7
    pop        { pc }


@@ Copies a list of tilemap entries to the screen buffer in a vertical line.
@@ In:
@@ r0: x: The X coordinate of the target screen.
@@ r1: y: The Y coordinate of the target screen. Bounded on [0, 31].
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: entryListSz: The size of the tilemap entry list.
_ts LC_Screen_SafeCopyTileMapV
    push       { lr }
    ldr        r7,PTR_Screen_SafeCopyTileMapV_1_080022cc
    mov        lr,pc
    bx         r7
    pop        { pc }


@@ Copies a list of tilemap entries to the screen buffer in a rectangle.
@@ In:
@@ r0: x: The X coordinate of the target screen. Bounded on [0, 31].
@@ r1: y: The Y coordinate of the target screen. Bounded on [0, 31].
@@ r2: screen: The screen to draw to.
@@ r3: entryList: The list of tilemap entries.
@@ r4: width: The width of the rectangle.
@@ r5: height: The height of the rectangle.
_ts LC_Screen_SafeCopyTileMapRect
    push       { lr }
    ldr        r7,PTR_Screen_SafeCopyTileMapRect_1_080022d0
    mov        lr,pc
    bx         r7
    pop        { pc }

    .align 2, 0
PTR_Screen_SafeCopyTileMapH_1_080022c8:
    far_label Screen_SafeCopyTileMapH
PTR_Screen_SafeCopyTileMapV_1_080022cc:
    far_label Screen_SafeCopyTileMapV
PTR_Screen_SafeCopyTileMapRect_1_080022d0:
    far_label Screen_SafeCopyTileMapRect
