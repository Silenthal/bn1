#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


@@ Initializes the background data manager.
@@ In:
@@ r0: areaId: The ID of the overall area.
@@ r1: areaaSubId: The ID of the current sub area.
@ void BGDM_Init(AreaId areaId,byte areaSubId)
_ts BGDM_Init
    push       {lr}
    mov        r5,r10
    ldr        r5,[r5,#0x44]
    cmp        r0,#0xf0
    bge        .initBattleMap
    cmp        r0,#0x80
    bge        .initOnlineMap
    ldr        r3,ptrBgDataOffline
    ldr        r4,ptrTmCopy3x
    str        r4,[r5,#0x18]
    ldr        r4,ptrLoad123
    str        r4,[r5,#0x1c]
    ldr        r4,ptrLoadXY123
    str        r4,[r5,#0x20]
    b          .rest
.initOnlineMap:
    ldr        r3,ptrBgDataOnline
    sub        r0,#0x80
    ldr        r4,ptrTmCopy2x
    str        r4,[r5,#0x18]
    ldr        r4,ptrLoad23_1
    str        r4,[r5,#0x1c]
    ldr        r4,ptrLoadXY23
    str        r4,[r5,#0x20]
    b          .rest
.initBattleMap:
    ldr        r3,ptrBgDataBattle
    sub        r0,#0xf0
    ldr        r4,ptrTmCopy1x
    str        r4,[r5,#0x18]
    ldr        r4,ptrLoad23_2
    str        r4,[r5,#0x1c]
    ldr        r4,ptrLoadXY23_2
    str        r4,[r5,#0x20]
.rest:
    lsl        r0,r0,#0x2
    add        r3,r3,r0
    ldr        r3,[r3,#0x0]
    mov        r2,#0xc
    mul        r1,r2
    add        r3,r3,r1
    str        r3,[r5,#0x8]
    ldr        r0,[r3,#0x8]
    ldr        r1,=gTempMemory
    ldrb       r2,[r0,#0x0]
    strb       r2,[r5,#0x0]
    ldrb       r2,[r0,#0x1]
    strb       r2,[r5,#0x1]
    ldr        r2,[r3,#0x4]
    str        r2,[r5,#0x10]
    ldr        r2,[r3,#0x0]
    str        r2,[r5,#0x14]
    str        r1,[r5,#0xc]
    pop        {pc}


@@ Loads tileset, tilemap, and palette data for the current map.
_ts BGDM_Load
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x44]
    ldr        r0,[r5,#0x10]
    ldr        r2,[r0,#0x0]
    lsr        r2,r2,#0x2
    add        r0,#0x4
    ldr        r1,=eBgPalette0
    mov        r3,#0x3
    ldr        r4,=(DMA_32BIT | DMA_ENABLE)
    push       {r5}
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    pop        {r5}
    mov        r0,#0x0
    ldr        r7,[r5,#0x14]
    add        r6,r7,#0x0
.loopVramCopy:
    push       {r0,r6}
    ldr        r0,[r7,#0x4]
    add        r0,r0,r6
    ldr        r1,=gTempMemory
    push       {r5,r7}
    bl         SWI_LZ77UnCompWram
    pop        {r5,r7}
    push       {r5,r7}
    ldr        r0,=gTempMemory
    ldr        r1,[r7,#0x8]
    ldr        r2,=BG_VRAM_BASE0
    add        r1,r1,r2
    ldr        r2,[r7,#0x0]
    mov        r3,#0x3
    ldr        r4,=(DMA_32BIT | DMA_ENABLE)
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    pop        {r5,r7}
    add        r7,#0xc
    pop        {r0,r6}
    add        r0,#0x1
    cmp        r0,#0x3
    blt        .loopVramCopy
    ldr        r3,[r5,#0x8]
    ldr        r0,[r3,#0x8]
    ldr        r1,=gTempMemory
    mov        r2,#0x10
    push       {r0,r1,r5,r7}
    bl         memcpy_32
    pop        {r0,r1,r5,r7}
    add        r0,#0x10
    add        r1,#0x10
    push       {r5,r7}
    bl         SWI_LZ77UnCompWram
    pop        {r5,r7}
    ldr        r0,[r5,#0x1c]
    mov        lr,pc
    bx         r0
    pop        {pc}


@@ Updates the drawn edges of the current map based on the player location.
_ts BGDM_UpdateMapEdge
    push       {lr}
    mov        r7,r10
    ldr        r3,[r7,#0x14]
    ldr        r5,[r7,#0x44]
    mov        r4,#0x4
    ldrsh      r0,[r3,r4]
    mov        r4,#0x6
    ldrsh      r1,[r3,r4]
    asr        r0,r0,#0x3
    asr        r1,r1,#0x3
    mov        r4,#0x4
    ldrsh      r2,[r5,r4]
    cmp        r0,r2
    beq        .checkPlayerY
    bgt        .drawRight
    @ background moves right -> background X (r2) > player X (r0) -> player is moving left
    sub        r2,r2,r0
    push       {r0,r1}
    bl         BGDM_UpdateMapEdgeLeft
    pop        {r0,r1}
    b          .checkPlayerY
.drawRight:
    @ background moves left -> background X (r2) < player X (r0) -> player is moving right
    sub        r2,r0,r2
    push       {r0,r1}
    bl         BGDM_UpdateMapEdgeRight
    pop        {r0,r1}
.checkPlayerY:
    mov        r4,#0x6
    ldrsh      r2,[r5,r4]
    cmp        r1,r2
    beq        LAB_08010fe4
    bgt        .drawDown
    @ background moves down -> background Y (r2) > player Y (r1) -> player is moving up
    sub        r2,r2,r1
    bl         BGDM_UpdateMapEdgeUp
    b          LAB_08010fe4
.drawDown:
    @ background moves up -> background Y (r2) < player Y (r1) -> player is moving down
    sub        r2,r1,r2
    bl         BGDM_UpdateMapEdgeDown
LAB_08010fe4:
    pop        {pc}


@@ Fetches the tilemap entries from the tilemap archive at a given location.
@@ In:
@@ r0: x: The X coordinate to copy from.
@@ r1: y: The Y coordinate to copy from.
@@ Out:
@@ r0: tilemapBG1: The tilemap entry for layer 1.
@@ r1: tilemapBG2: The tilemap entry for layer 2.
@@ r2: tilemapBG3: The tilemap entry for layer 3.
_ts BGDM_GetTilemapEntriesFromArchive
    cmp        r0,#0x0
    bge        .checkMapBoundX
    b          .setCoordToZero
.checkMapBoundX:
    ldrb       r6,[r5,#0x0]
    cmp        r0,r6
    blt        .checkY
    b          .setCoordToZero
.checkY:
    cmp        r1,#0x0
    bge        .checkMapBoundY
    b          .setCoordToZero
.checkMapBoundY:
    ldrb       r6,[r5,#0x1]
    cmp        r1,r6
    blt        .next
    b          .setCoordToZero
.next:
    ldr        r3,[r5,#0xc]
    mov        r4,#0xc
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
.loopFetch:
    ldr        r2,[r3,r4]
    add        r2,r2,r3
    lsl        r6,r0,#0x1
    add        r2,r2,r6
    add        r6,r1,#0x0
    mul        r6,r7
    ldrh       r2,[r2,r6]
    push       {r2}
    sub        r4,#0x4
    cmp        r4,#0x0
    bgt        .loopFetch
    pop        {r0,r1,r2}
    mov        pc,lr
.setCoordToZero:
    mov        r0,#0x0
    mov        r1,#0x0
    b          .next


@@ Copies three tilemap entries to the BG1, BG2 and BG3 layer of the screen.
@@ In:
@@ r0: tilemapBG1: The tilemap entry to copy for layer 1.
@@ r1: tilemapBG2: The tilemap entry to copy for layer 2.
@@ r2: tilemapBG3: The tilemap entry to copy for layer 3.
@@ r3: x: The X coordinate to copy to.
@@ r4: y: The Y coordinate to copy to.
_ts BGDM_CopyTilemapEntry_BG123
    push       {r0,r1,r2}
    mov        r2,#0x1
.loopCopy:
    pop        {r0}
    mov        r7,r10
    ldr        r7,[r7,#0x5c]
    lsl        r6,r2,#0xb
    add        r7,r7,r6
    lsl        r6,r3,#0x1
    add        r7,r7,r6
    lsl        r6,r4,#0x6
    strh       r0,[r7,r6]
    add        r2,#0x1
    cmp        r2,#0x3
    ble        .loopCopy
    mov        pc,lr


@@ Updates the left edge of the current map.
@@ r0: px: the X coordinate of the player's tile.
@@ r1: py: the Y coordinate of the player's tile.
@@ r2: dist: The distance between the map's coordinate and the player's tile.
_ts BGDM_UpdateMapEdgeLeft
    push       {lr}
    strh       r0,[r5,#0x4]
    cmp        r2,#0x5
    blt        LAB_0801105c
    ldr        r3,[r5,#0x20]
    mov        lr,pc
    bx         r3
    b          LAB_080110a4
LAB_0801105c:
    push       {r1}
    mov        r7,#0x0
LAB_08011060:
    push       {r2,r7}
    mov        r8,r0
    mov        r9,r1
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r4,r9
    mov        r3,r8
    sub        r3,#0x20
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    ldr        r6,[r5,#0x18]
    mov        lr,pc
    bx         r6
    pop        {r2,r7}
    mov        r0,r8
    mov        r1,r9
    add        r1,#0x1
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_08011060
    pop        {r1}
    add        r0,#0x1
    sub        r2,#0x1
    cmp        r2,#0x0
    bgt        LAB_0801105c
LAB_080110a4:
    pop        {pc}


@@ Updates the right edge of the current map.
@@ r0: px: the X coordinate of the player's tile.
@@ r1: py: the Y coordinate of the player's tile.
@@ r2: dist: The distance between the map's coordinate and the player's tile.
_ts BGDM_UpdateMapEdgeRight
    push       {lr}
    strh       r0,[r5,#0x4]
    cmp        r2,#0x5
    blt        LAB_080110b8
    ldr        r3,[r5,#0x20]
    mov        lr,pc
    bx         r3
    b          LAB_08011100
LAB_080110b8:
    push       {r1}
    mov        r7,#0x0
LAB_080110bc:
    push       {r2,r7}
    mov        r8,r0
    mov        r9,r1
    add        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r4,r9
    mov        r3,r8
    add        r3,#0x1e
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    ldr        r6,[r5,#0x18]
    mov        lr,pc
    bx         r6
    pop        {r2,r7}
    mov        r0,r8
    mov        r1,r9
    add        r1,#0x1
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_080110bc
    pop        {r1}
    sub        r0,#0x1
    sub        r2,#0x1
    cmp        r2,#0x0
    bgt        LAB_080110b8
LAB_08011100:
    pop        {pc}


@@ Updates the upper edge of the current map.
@@ r0: px: the X coordinate of the player's tile.
@@ r1: py: the Y coordinate of the player's tile.
@@ r2: dist: The distance between the map's coordinate and the player's tile.
_ts BGDM_UpdateMapEdgeUp
    push       {lr}
    strh       r1,[r5,#0x6]
    cmp        r2,#0x5
    blt        LAB_08011114
    ldr        r3,[r5,#0x20]
    mov        lr,pc
    bx         r3
    b          LAB_0801115c
LAB_08011114:
    push       {r0}
    mov        r7,#0x0
LAB_08011118:
    push       {r2,r7}
    mov        r8,r0
    mov        r9,r1
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r4,r9
    mov        r3,r8
    sub        r4,#0x20
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    ldr        r6,[r5,#0x18]
    mov        lr,pc
    bx         r6
    pop        {r2,r7}
    mov        r0,r8
    mov        r1,r9
    add        r0,#0x1
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_08011118
    pop        {r0}
    add        r1,#0x1
    sub        r2,#0x1
    cmp        r2,#0x0
    bgt        LAB_08011114
LAB_0801115c:
    pop        {pc}


@@ Updates the lower edge of the current map.
@@ r0: px: the X coordinate of the player's tile.
@@ r1: py: the Y coordinate of the player's tile.
@@ r2: dist: The distance between the map's coordinate and the player's tile.
_ts BGDM_UpdateMapEdgeDown
    push       {lr}
    strh       r1,[r5,#0x6]
    cmp        r2,#0x5
    blt        LAB_08011170
    ldr        r3,[r5,#0x20]
    mov        lr,pc
    bx         r3
    b          LAB_080111b8
LAB_08011170:
    push       {r0}
    mov        r7,#0x0
LAB_08011174:
    push       {r2,r7}
    mov        r8,r0
    mov        r9,r1
    sub        r0,#0xf
    add        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r4,r9
    mov        r3,r8
    add        r4,#0x14
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    ldr        r6,[r5,#0x18]
    mov        lr,pc
    bx         r6
    pop        {r2,r7}
    mov        r0,r8
    mov        r1,r9
    add        r0,#0x1
    add        r7,#0x1
    cmp        r7,#0x20
    blt        LAB_08011174
    pop        {r0}
    sub        r1,#0x1
    sub        r2,#0x1
    cmp        r2,#0x0
    bgt        LAB_08011170
LAB_080111b8:
    pop        {pc}


@@ Copies two tilemap entries to the BG2 and BG3 layer of the screen.
@@ In:
@@ r1: tilemapBG2: The tilemap entry to copy for layer 2.
@@ r2: tilemapBG3: The tilemap entry to copy for layer 3.
@@ r3: x: The X coordinate to copy to.
@@ r4: y: The Y coordinate to copy to.
_ts BGDM_CopyTilemapEntry_BG23
    push       {lr}
    push       {r2}
    push       {r1}
    mov        r2,#0x2
LAB_080111c4:
    pop        {r0}
    mov        r7,r10
    ldr        r7,[r7,#0x5c]
    lsl        r6,r2,#0xb
    add        r7,r7,r6
    lsl        r6,r3,#0x1
    add        r7,r7,r6
    lsl        r6,r4,#0x6
    strh       r0,[r7,r6]
    add        r2,#0x1
    cmp        r2,#0x3
    ble        LAB_080111c4
    pop        {pc}


@@ Copies the given tilemap entry to the BG2 layer of the screen.
@@ In:
@@ r1: tilemapBG2: The tilemap entry to copy.
@@ r3: x: The X coordinate to copy to.
@@ r4: y: The Y coordinate to copy to.
_ts BGDM_CopyTilemapEntry_BG2
    push       {lr}
    mov        r2,#0x2
    mov        r7,r10
    ldr        r7,[r7,#0x5c]
    lsl        r6,r2,#0xb
    add        r7,r7,r6
    lsl        r6,r3,#0x1
    add        r7,r7,r6
    lsl        r6,r4,#0x6
    strh       r1,[r7,r6]
    pop        {pc}


@@ Copies the full surrounding tilemap to the BG1, BG2 and BG3 layer of the screen.
_ts BGDM_CopyTilemap
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x14]
    mov        r1,#0x4
    ldrsh      r3,[r0,r1]
    mov        r1,#0x6
    ldrsh      r4,[r0,r1]
    asr        r3,r3,#0x3
    asr        r4,r4,#0x3
    strh       r3,[r5,#0x4]
    strh       r4,[r5,#0x6]
    mov        r1,#0x0
LAB_08011210:
    push       {r3}
    mov        r0,#0x0
LAB_08011214:
    push       {r0,r1}
    add        r0,r3,#0x0
    add        r1,r4,#0x0
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    mov        r8,r3
    mov        r9,r4
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r3,r8
    mov        r4,r9
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    bl         BGDM_CopyTilemapEntry_BG123
    mov        r3,r8
    mov        r4,r9
    add        r3,#0x1
    pop        {r0,r1}
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_08011214
    pop        {r3}
    add        r4,#0x1
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_08011210
    pop        {pc}
    .align 2, 0

ptrBgDataOffline: .word BGData_Offline
ptrTmCopy3x: .word BGDM_CopyTilemapEntry_BG123
ptrLoad123: .word BGDM_CopyTilemap
ptrLoadXY123: .word BGDM_LoadTilemapXY
ptrBgDataOnline: .word BGData_Online
ptrTmCopy2x: .word BGDM_CopyTilemapEntry_BG23
ptrLoad23_1: .word BGDM_LoadTilemap_StaticBG1
ptrLoadXY23: .word BGDM_LoadTilemapXY_StaticBG1
ptrBgDataBattle: .word BGData_Battle
ptrTmCopy1x: .word BGDM_CopyTilemapEntry_BG2
ptrLoad23_2: .word BGDM_LoadTilemap_StaticBG1
ptrLoadXY23_2: .word BGDM_LoadTilemapXY_StaticBG1

    .pool


@@ Copies the full surrounding tilemap to the BG1, BG2 and BG3 layer of the screen, keeping the BG1 layer static.
_ts BGDM_LoadTilemap_StaticBG1
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x14]
    mov        r1,#0x4
    ldrsh      r3,[r0,r1]
    mov        r1,#0x6
    ldrsh      r4,[r0,r1]
    asr        r3,r3,#0x3
    asr        r4,r4,#0x3
    strh       r3,[r5,#0x4]
    strh       r4,[r5,#0x6]
    mov        r1,#0x0
LAB_080112b4:
    push       {r3}
    mov        r0,#0x0
LAB_080112b8:
    push       {r0,r1}
    add        r0,r3,#0x0
    add        r1,r4,#0x0
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    mov        r8,r3
    mov        r9,r4
    bl         BGDM_GetTilemapEntriesFromArchive
    mov        r3,r8
    mov        r4,r9
    mov        r6,#0x1f
    and        r3,r6
    and        r4,r6
    bl         BGDM_CopyTilemapEntry_BG23
    mov        r3,r8
    mov        r4,r9
    add        r3,#0x1
    pop        {r0,r1}
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_080112b8
    pop        {r3}
    add        r4,#0x1
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_080112b4
    ldr        r3,[r5,#0xc]
    mov        r4,#0x4
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
    ldr        r2,[r3,r4]
    add        r3,r3,r2
    mov        r1,#0x0
LAB_0801130a:
    push       {r1,r3,r5,r7}
    mov        r0,#0x0
    mov        r2,#0x1
    mov        r4,#0x20
    bl         Screen_CopyTileMapHWrap
    pop        {r1,r3,r5,r7}
    add        r3,r3,r7
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_0801130a
    pop        {pc}


@@ Copies the surrounding tilemap at the given location to the BG1, BG2, and BG3 layer of the screen.
@@ In:
@@ r0: x: The X coordinate to copy to.
@@ r1: y: The Y coordinate to copy to.
_ts BGDM_LoadTilemapXY
    push       {r5,lr}
    mov        r8,r0
    mov        r9,r1
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
    lsl        r0,r0,#0x1
    mul        r1,r7
    add        r0,r0,r1
    ldr        r2,[r5,#0xc]
    mov        r4,#0xc
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
LAB_0801134c:
    ldr        r3,[r2,r4]
    add        r3,r3,r2
    add        r3,r3,r0
    mov        r1,#0x0
    push       {r0,r2}
LAB_08011356:
    push       {r1,r3,r4,r7}
    mov        r0,r8
    mov        r1,r9
    mov        r7,#0x1f
    and        r0,r7
    and        r1,r7
    lsr        r2,r4,#0x2
    mov        r4,#0x20
    bl         Screen_CopyTileMapHWrap
    mov        r1,#0x1
    add        r9,r1
    pop        {r1,r3,r4,r7}
    add        r0,#0x1
    add        r3,r3,r7
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_08011356
    pop        {r0,r2}
    sub        r4,#0x4
    cmp        r4,#0x0
    bgt        LAB_0801134c
    pop        {r5,pc}


@@ Copies the surrounding tilemap at the given location to the BG1, BG2, and BG3 layer of the screen, keeping the BG1 layer static.
@@ In:
@@ r0: x: The X coordinate to copy to.
@@ r1: y: The Y coordinate to copy to.
_ts BGDM_LoadTilemapXY_StaticBG1
    push       {r5,lr}
    mov        r8,r0
    mov        r9,r1
    sub        r0,#0xf
    sub        r1,#0xa
    ldrb       r6,[r5,#0x0]
    lsr        r6,r6,#0x1
    ldrb       r7,[r5,#0x1]
    lsr        r7,r7,#0x1
    add        r0,r0,r6
    add        r1,r1,r7
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
    lsl        r0,r0,#0x1
    mul        r1,r7
    add        r0,r0,r1
    ldr        r2,[r5,#0xc]
    mov        r4,#0xc
    ldrb       r7,[r5,#0x0]
    lsl        r7,r7,#0x1
LAB_080113ac:
    ldr        r3,[r2,r4]
    add        r3,r3,r2
    add        r3,r3,r0
    mov        r1,#0x0
    push       {r0,r2}
LAB_080113b6:
    push       {r1,r3,r4,r7}
    mov        r0,r8
    mov        r1,r9
    mov        r7,#0x1f
    and        r0,r7
    and        r1,r7
    lsr        r2,r4,#0x2
    mov        r4,#0x20
    bl         Screen_CopyTileMapHWrap
    mov        r1,#0x1
    add        r9,r1
    pop        {r1,r3,r4,r7}
    add        r0,#0x1
    add        r3,r3,r7
    add        r1,#0x1
    cmp        r1,#0x20
    blt        LAB_080113b6
    pop        {r0,r2}
    sub        r4,#0x4
    cmp        r4,#0x4
    bgt        LAB_080113ac
    pop        {r5,pc}
