#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SpriteFrame_LoadTileset, 0x3006A00 + 1

    .text

listHandlerNpc:
    .word 0x08081d94 + 1 @ NPC_Handler

thumb_func_start NPC_Alloc
NPC_Alloc:
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetNPC_08003c68
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_08003c6c
    ldr        r5,PTR_gEntityListNpc_08003c70
    ldr        r3,PTR_gEmailIndexes_08003c74
LAB_08003b24:
    tst        r2,r1
    beq        LAB_08003b32
    lsr        r1,r1,#0x1
    add        r5,#0xc0
    cmp        r5,r3
    bge        LAB_08003b5a
    b          LAB_08003b24
LAB_08003b32:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r0,r5
    mov        r1,#0x46
    lsl        r1,r1,#0x1
    mov        r2,#0x7e
    bl         memset
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
    pop        { r0, r1, r2, r3, r4 }
    strb       r0,[r5,#0x1]
    str        r1,[r5,#0x24]
    str        r2,[r5,#0x28]
    str        r3,[r5,#0x2c]
    str        r4,[r5,#0x4]
    mov        r0,#0x0
    str        r0,[r5,#0x8]
    pop        { pc }
LAB_08003b5a:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }
thumb_func_end NPC_Alloc

thumb_func_start NPC_Free
NPC_Free:
    push       { lr }
    ldr        r0,DAT_08003c6c
    ldrb       r1,[r5,#0x3]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetNPC_08003c78
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    bl         SpritePtr_AffineFree
    pop        { pc }
thumb_func_end NPC_Free

thumb_func_start NPC_UpdateAll
NPC_UpdateAll:
    push       { lr }
    mov        r0,#0x4
    bl         Flag_Get400
    bne        LAB_08003bbc
    ldr        r5,PTR_gEntityListNpc_08003c7c
LAB_08003b88:
    mov        r1,#0x1
    ldrb       r0,[r5,#0x0]
    tst        r0,r1
    beq        LAB_08003bae
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_08003ba0
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_08003bae
LAB_08003ba0:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_PTR_NPC_Handler_1_08003c80
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_08003bae:
    add        r5,#0xc0
    ldr        r0,PTR_gEntityListNpc_08003c84
    ldr        r1,DAT_08003c88
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003bbc
    b          LAB_08003b88
LAB_08003bbc:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }
thumb_func_end NPC_UpdateAll

thumb_func_start NPC_Init
NPC_Init:
    push       { lr }
    ldr        r0,PTR_gFillValue_08003c8c
    ldr        r1,PTR_gEntityListNpc_08003c90
    ldr        r2,DAT_08003c94
    mov        r3,#0x3
    ldr        r4,DAT_08003c98
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x10
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListNpc_08003c9c
LAB_08003be4:
    mov        r3,#0x94
    strb       r3,[r5,#0x2]
    strb       r1,[r5,#0x3]
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003be4
    ldr        r0,PTR_gBitsetNPC_08003ca0
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end NPC_Init

thumb_func_start NPC_LoadAll
NPC_LoadAll:
    push       { lr }
    mov        r0,#0x10
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListNpc_08003ca4
LAB_08003c04:
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08003c2a
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x24
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x4
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_08003ca8
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x90
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_08003c44
LAB_08003c2a:
    add        r4,r5,#0x0
    add        r4,#0x90
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08003c44
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x24
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_08003c44:
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003c04
    pop        { pc }
thumb_func_end NPC_LoadAll

thumb_func_start NPC_UnloadAll
NPC_UnloadAll:
    mov        r0,#0x0
    ldr        r5,PTR_gEntityListNpc_08003cac
LAB_08003c54:
    add        r1,r5,#0x0
    add        r1,#0x90
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xc0
    add        r0,#0x1
    cmp        r0,#0x10
    blt        LAB_08003c54
    mov        pc,lr
thumb_func_end NPC_UnloadAll

    .align 2, 0
PTR_gBitsetNPC_08003c68:                .word gBitsetNPC
DAT_08003c6c:                           .word 0x80000000
PTR_gEntityListNpc_08003c70:            .word gEntityListNpc
PTR_gEmailIndexes_08003c74:             .word gEmailIndexes
PTR_gBitsetNPC_08003c78:                .word gBitsetNPC
PTR_gEntityListNpc_08003c7c:            .word gEntityListNpc
PTR_PTR_NPC_Handler_1_08003c80:         .word listHandlerNpc
PTR_gEntityListNpc_08003c84:            .word gEntityListNpc
DAT_08003c88:                           .word 0xC00
PTR_gFillValue_08003c8c:                .word gFillValue
PTR_gEntityListNpc_08003c90:            .word gEntityListNpc
DAT_08003c94:                           .word 0x300
DAT_08003c98:                           .word 0x85000000
PTR_gEntityListNpc_08003c9c:            .word gEntityListNpc
PTR_gBitsetNPC_08003ca0:                .word gBitsetNPC
PTR_gEntityListNpc_08003ca4:            .word gEntityListNpc
PTR_SpriteFrame_LoadTileset_1_08003ca8: .word SpriteFrame_LoadTileset
PTR_gEntityListNpc_08003cac:            .word gEntityListNpc

.end
