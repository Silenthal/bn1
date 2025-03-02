#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_fts SpriteFrame_LoadTileset
    push       {r5,lr}
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x20
    bic        r1,r2
    strb       r1,[r5,#0x4]
    mov        r2,#0x2
    tst        r1,r2
    bne        LAB_03006a1e
    mov        r1,#0x0
    str        r1,[r5,#0x24]
    pop        {r5,pc}
LAB_03006a1e:
    ldr        r1,PTR_listTilesetOffset_03006d28
    lsl        r0,r0,#0x2
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    ldrh       r6,[r0,#0x0]
    mov        r8,r0
    ldr        r7,[r5,#0x1c]
    ldr        r7,[r7,#0x0]
    ldr        r1,[r5,#0x18]
    add        r7,r7,r1
    @@ r0, r8 = 0x200c120
    @@ r1 = spriteStartAddr
    @@ r5 = sprite
    @@ r6 = [200C120] (probably 1)
    @@ r7, r12 = tilesetHeaderStartAddr
    mov        r12,r7
    bl         SpriteFrame_GetTilesetOffset
    beq        LAB_03006a92
    ldrh       r2,[r5,#0x8]
    mov        r0,r8
    ldrh       r1,[r0,#0x0]
    cmp        r1,r2
    beq        LAB_03006a48
    mov        r2,#0x0
    str        r2,[r5,#0x24]
LAB_03006a48:
    ldr        r3,[r5,#0x18]
    sub        r3,#0x4
    mov        r0,r8
    ldrh       r4,[r3,#0x0]
    bl         SpriteFrame_CheckTilesetLimit
    beq        LAB_03006a64
    ldrb       r1,[r5,#0x4]
    mov        r2,#0x20
    orr        r1,r2
    strb       r1,[r5,#0x4]
    mov        r2,#0x0
    str        r2,[r5,#0x24]
    pop        {r5,pc}
LAB_03006a64:
    bl         SpriteFrame_TilesetTrackerAlloc
    strh       r1,[r5,#0x8]
    add        r4,r4,r1
    strh       r4,[r0,#0x0]
    ldr        r2,[r5,#0x24]
    mov        r0,r12
    cmp        r0,r2
    beq        LAB_03006a98
    str        r0,[r5,#0x24]
    mov        r8,r5
    ldr        r2,[r0,#0x0]
    lsr        r2,r2,#0x2
    add        r0,#0x4
    ldr        r1,PTR_OBJ_VRAM0_03006d2c
    ldrh       r3,[r5,#0x8]
    lsl        r3,r3,#0x5
    add        r1,r1,r3
    ldr        r7,PTR_Dma_TransferListAdd_03006d30
    mov        lr,pc
    bx         r7
    mov        r5,r8
    b          LAB_03006a98
LAB_03006a92:
    strh       r0,[r5,#0x8]
    mov        r0,r12
    str        r0,[r5,#0x24]
LAB_03006a98:
    ldrb       r1,[r5,#0x15]
    mov        r2,#0xf0
    and        r1,r2
    cmp        r1,r2
    beq        LAB_03006ab4
    bl         SpriteFrame_LoadPalette
    ldrb       r1,[r5,#0x15]
    mov        r2,#0xf0
    bic        r1,r2
    lsl        r0,r0,#0x4
    orr        r1,r0
    strb       r1,[r5,#0x15]
    pop        {r5,pc}
LAB_03006ab4:
    pop        {r5,pc}

    .align 2, 0


far_global_label listTilesetOffset
    .word gSpriteTilesetOffset0
    .word gSpriteTilesetOffset0
    .word gSpriteTilesetOffset0
    .word gSpriteTilesetOffset0
    .word gSpriteTilesetOffset0


_ts SpriteFrame_LoadPalette
    push       {r5}
    ldr        r0,[r5,#0x1c]
    ldr        r0,[r0,#0x4]
    add        r0,#0x4
    ldr        r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x5]
    ldrb       r2,[r5,#0x6]
    add        r1,r1,r2
    lsl        r1,r1,#0x5
    add        r0,r0,r1
    ldr        r7,PTR_gSpritePalettesLoaded_03006d34
    ldr        r4,[r7,#0x0]
    cmp        r4,#0xf
    bge        LAB_03006b20
    ldr        r5,PTR_gObjPalette0_03006d38
    mov        r1,#0x0
LAB_03006aee:
    cmp        r1,r4
    bge        LAB_03006b0c
    mov        r6,#0x0
LAB_03006af4:
    ldr        r2,[r5,r6]
    ldr        r3,[r0,r6]
    cmp        r2,r3
    bne        LAB_03006b06
    add        r6,#0x4
    cmp        r6,#0x20
    blt        LAB_03006af4
    add        r0,r1,#0x0
    b          LAB_03006b22
LAB_03006b06:
    add        r5,#0x20
    add        r1,#0x1
    b          LAB_03006aee
LAB_03006b0c:
    mov        r6,#0x0
LAB_03006b0e:
    @@ Load object palette here
    ldr        r2,[r0,r6]
    str        r2,[r5,r6]
    add        r6,#0x4
    cmp        r6,#0x20
    blt        LAB_03006b0e
    add        r4,#0x1
    str        r4,[r7,#0x0]
    add        r0,r1,#0x0
    b          LAB_03006b22
LAB_03006b20:
    mov        r0,#0xf
LAB_03006b22:
    pop        {r5}
    mov        pc,lr

    .align 2, 0



_ts SpriteFrame_GetTilesetOffset
    ldr        r1,PTR_gSpriteTilesetDetailCount_03006d3c
    ldr        r1,[r1,#0x0]
    ldr        r2,PTR_gListSpriteTilesetDetail_03006d40
LAB_03006b2e:
    cmp        r1,#0x0
    beq        LAB_03006b3e
    ldr        r3,[r2,#0x0]
    cmp        r7,r3
    beq        LAB_03006b42
    sub        r1,#0x1
    add        r2,#0x8
    b          LAB_03006b2e
LAB_03006b3e:
    mov        r0,#0x1
    mov        pc,lr
LAB_03006b42:
    ldr        r0,[r2,#0x4]
    mov        r3,#0x0
    mov        pc,lr


_ts SpriteFrame_TilesetTrackerAlloc
    ldr        r2,PTR_gSpriteTilesetDetailCount_03006d44
    ldr        r3,[r2,#0x0]
    add        r3,#0x1
    str        r3,[r2,#0x0]
    sub        r3,#0x1
    lsl        r3,r3,#0x3
    ldr        r2,PTR_gListSpriteTilesetDetail_03006d48
    add        r2,r2,r3
    str        r7,[r2,#0x0]
    str        r6,[r2,#0x4]
    mov        pc,lr

    .align 2, 0



_fts SpritePtr_CalculateOcclusion
    push       {r5,lr}
    ldrb       r6,[r5,#0x0]
    push       {r6}
    ldr        r4,PTR_gIsObjectXFlipped_03006d4c
    ldrb       r4,[r4,#0x0]
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    LoadMain manager, r2, r2
    ldrb       r2,[r2,#Manager_gameState]
    cmp        r2,#0x8
    beq        LAB_03006b82
    bl         SpritePtr_CalculatePositionNormal
    b          LAB_03006b86
LAB_03006b82:
    bl         SpritePtr_CalculatePositionBattle
LAB_03006b86:
    mov        r12,r7
    pop        {r7}
    mov        r0,#0x8
    tst        r0,r7
    bne        LAB_03006be4
    ldr        r3,[r5,#0x20]
    ldrb       r2,[r3,#0x0]
    lsl        r2,r2,#0x2
    ldr        r0,[r5,#0x1c]
    ldr        r0,[r0,#0xc]
    ldr        r3,[r5,#0x18]
    add        r3,r3,r0
    ldr        r2,[r3,r2]
    add        r2,r2,r3
    mov        r7,#0x0
    mov        r4,#0x80
    lsl        r4,r4,#0x18
LAB_03006ba8:
    ldrb       r3,[r2,#0x0]
    cmp        r3,#0xff
    beq        LAB_03006bf8
    mov        r3,#0x1
    ldrsb      r3,[r2,r3]
    add        r3,r3,r1
    mov        r0,#0x40
    neg        r0,r0
    cmp        r3,r0
    blt        LAB_03006bdc
    mov        r0,#0xf0
    add        r0,#0x41
    cmp        r3,r0
    bge        LAB_03006bdc
    mov        r3,#0x2
    ldrsb      r3,[r2,r3]
    add        r3,r12
    mov        r0,#0x20
    neg        r0,r0
    cmp        r3,r0
    blt        LAB_03006bdc
    mov        r0,#0xa0
    add        r0,#0x21
    cmp        r3,r0
    bge        LAB_03006bdc
    orr        r7,r4
LAB_03006bdc:
    mov        r12,r6
    lsr        r4,r4,#0x1
    add        r2,#0x5
    b          LAB_03006ba8
LAB_03006be4:
    mov        r7,#0x0
    mov        r0,#0x40
    neg        r0,r0
    cmp        r1,r0
    blt        LAB_03006bf8
    mov        r0,#0xf0
    add        r0,#0x41
    cmp        r6,r0
    bge        LAB_03006bf8
    mov        r7,#0x1
LAB_03006bf8:
    ldrb       r3,[r5,#0x4]
    mov        r4,#0x8
    tst        r3,r4
    bne        LAB_03006c1e
    add        r6,r7,#0x0
    mov        r4,#0x80
    lsl        r4,r4,#0x18
    bic        r6,r4
    mov        r4,#0x10
    bic        r3,r4
    tst        r6,r6
    beq        LAB_03006c12
    orr        r3,r4
LAB_03006c12:
    mov        r4,#0x2
    bic        r3,r4
    tst        r7,r7
    beq        LAB_03006c28
    orr        r3,r4
    b          LAB_03006c28
LAB_03006c1e:
    mov        r4,#0x12
    bic        r3,r4
    tst        r7,r7
    beq        LAB_03006c28
    orr        r3,r4
LAB_03006c28:
    strb       r3,[r5,#0x4]
    str        r7,[r5,#0x28]
    pop        {r5,pc}

    .align 2, 0



_ts SpritePtr_CalculatePositionNormal
    @@ Treating right shift 0x10 as making floats into ints:
    @@ if sprite.z_clip:
    @@     adj.z = HandleElevation
    @@ else
    @@     adj.z = pos.z
    @@ dx = pos.x - map.x
    @@ dy = pos.y - map.y
    @@ dz = pos.z - map.z
    @@ az = adj.z - map.z
    @@ hp = (dy - dx) / 2
    @@ sprite.screenX = dx + dy + 120
    @@ sprite.spriteNum = hp + map.z + 128
    @@ sprite.portraitScreenY = hp - dz + 82
    @@ sprite.screenY = hp - az + 82
    push       {lr}
    mov        r2,#0x8
    ldrh       r3,[r5,#0x4]
    tst        r2,r3
    bne        LAB_03006c4a
    push       {r0,r5}
    ldr        r5,PTR_Map_HandleCollisionElevation_03006d50
    mov        lr,pc
    bx         r5
    lsl        r0,r0,#0x10
    mov        r9,r0
    pop        {r0,r5}
    b          LAB_03006c4e
LAB_03006c4a:
    ldr        r1,[r0,#0x8]
    mov        r9,r1
LAB_03006c4e:
    LoadMain camera, r3, r3
    ldr        r1,[r0,#0x0]
    ldr        r4,[r3,#Camera_posMap_x]
    sub        r1,r1,r4
    mov        r8,r1
    ldr        r6,[r0,#0x4]
    ldr        r4,[r3,#Camera_posMap_y]
    sub        r6,r6,r4
    add        r1,r1,r6
    asr        r1,r1,#0x10
    add        r1,#0x78
    strh       r1,[r5,#0xc]
    mov        r2,r8
    sub        r6,r6,r2
    asr        r6,r6,#0x1
    add        r7,r6,#0x0
    ldr        r2,[r3,#Camera_posMap_z]
    mov        r4,#0x80
    lsl        r4,r4,#0x10
    add        r2,r2,r4
    add        r4,r2,r6
    asr        r4,r4,#0x10
    strh       r4,[r5,#0xa]
    ldr        r4,[r0,#0x8]
    sub        r6,r6,r4
    ldr        r2,[r3,#Camera_posMap_z]
    add        r6,r6,r2
    asr        r6,r6,#0x10
    add        r6,#0x52
    strb       r6,[r5,#0xe]
    mov        r4,r9
    sub        r7,r7,r4
    ldr        r2,[r3,#Camera_posMap_z]
    add        r7,r7,r2
    asr        r7,r7,#0x10
    add        r7,#0x52
    strb       r7,[r5,#0xf]
    pop        {pc}


_ts SpritePtr_CalculatePositionBattle
    add        r6,r4,#0x0
    LoadMain camera, r3, r3
    mov        r2,#0x2
    ldrsh      r1,[r0,r2]
    ldr        r4,[r3,#Camera_posMap_x]
    asr        r4,r4,#0x10
    sub        r1,r1,r4
    tst        r6,r6
    beq        LAB_03006cb4
    neg        r1,r1
    sub        r1,#0x1
LAB_03006cb4:
    add        r1,#0x78
    strh       r1,[r5,#0xc]
    mov        r2,#0x6
    ldrsh      r6,[r0,r2]
    ldr        r4,[r3,#Camera_posMap_y]
    asr        r4,r4,#0x10
    sub        r6,r6,r4
    add        r6,#0x50
    add        r7,r6,#0x0
    strh       r7,[r5,#0xa]
    mov        r2,#0xa
    ldrsh      r4,[r0,r2]
    ldr        r2,[r3,#Camera_posMap_z]
    asr        r2,r2,#0x10
    sub        r4,r4,r2
    sub        r6,r6,r4
    strb       r6,[r5,#0xe]
    strb       r7,[r5,#0xf]
    mov        r2,#0x8
    ldrh       r3,[r5,#0x4]
    tst        r2,r3
    beq        LAB_03006ce2
    add        r7,r6,#0x0
LAB_03006ce2:
    mov        pc,lr


_ts SpriteFrame_CheckTilesetLimit
    LoadMain manager, r3, r3
    ldrb       r3,[r3,#Manager_gameState]
    cmp        r3,#0x8
    beq        LAB_03006d06
    ldrh       r3,[r0,#0x0]
    mov        r2,#0x30
    sub        r3,r3,r2
    add        r3,r3,r4
    ldr        r2,INT_03006d54
    cmp        r3,r2
    bge        LAB_03006d22
    ldr        r2,PTR_gSpritePalettesLoaded_03006d58
    ldr        r3,[r2,#0x0]
    cmp        r3,#0xc
    bge        LAB_03006d22
    b          LAB_03006d1e
LAB_03006d06:
    ldrh       r3,[r0,#0x0]
    mov        r2,#0x30
    sub        r3,r3,r2
    add        r3,r3,r4
    ldr        r2,INT_03006d5c
    cmp        r3,r2
    bge        LAB_03006d22
    ldr        r2,PTR_gSpritePalettesLoaded_03006d60
    ldr        r3,[r2,#0x0]
    cmp        r3,#0xa
    bge        LAB_03006d22
    b          LAB_03006d1e
LAB_03006d1e:
    mov        r3,#0x0
    mov        pc,lr
LAB_03006d22:
    mov        r3,#0x1
    mov        pc,lr

    .align 2, 0


PTR_listTilesetOffset_03006d28:
    .word listTilesetOffset_far

PTR_OBJ_VRAM0_03006d2c:
    .word OBJ_VRAM0

PTR_Dma_TransferListAdd_03006d30:
    .word Dma_TransferListAdd

PTR_gSpritePalettesLoaded_03006d34:
    .word gSpritePalettesLoaded

PTR_gObjPalette0_03006d38:
    .word gObjPalette0

PTR_gSpriteTilesetDetailCount_03006d3c:
    .word gSpriteTilesetDetailCount

PTR_gListSpriteTilesetDetail_03006d40:
    .word gListSpriteTilesetDetail

PTR_gSpriteTilesetDetailCount_03006d44:
    .word gSpriteTilesetDetailCount

PTR_gListSpriteTilesetDetail_03006d48:
    .word gListSpriteTilesetDetail

PTR_gIsObjectXFlipped_03006d4c:
    .word gIsObjectXFlipped

PTR_Map_HandleCollisionElevation_03006d50:
    .word Map_HandleCollisionElevation

INT_03006d54:
    .word 0x32F

PTR_gSpritePalettesLoaded_03006d58:
    .word gSpritePalettesLoaded

INT_03006d5c:
    .word 0x2FF

PTR_gSpritePalettesLoaded_03006d60:
    .word gSpritePalettesLoaded
