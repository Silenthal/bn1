#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Handler, 0x8055440 + 1
    .set SpriteFrame_LoadTileset, 0x3006A00 + 1

    .text

PTR_PlayerLocation_Handler_1_08003084: .word PlayerLocation_Handler

thumb_func_start PlayerLocation_Alloc
PlayerLocation_Alloc:
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetPlayerLocation_080031c0
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_080031c4
    ldr        r5,PTR_gEntityListPlayerLocation_080031c8
    ldr        r3,PTR_gFrameCounter_080031cc
LAB_08003094:
    tst        r2,r1
    beq        LAB_080030a2
    lsr        r1,r1,#0x1
    add        r5,#0xb0
    cmp        r5,r3
    bge        LAB_080030bc
    b          LAB_08003094
LAB_080030a2:
    orr        r2,r1
    str        r2,[r0,#0x0]
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
LAB_080030bc:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }
thumb_func_end PlayerLocation_Alloc

thumb_func_start PlayerLocation_Free
PlayerLocation_Free:
    push       { lr }
    ldr        r0,DAT_080031c4
    ldrb       r1,[r5,#0x3]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetPlayerLocation_080031d0
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    bl         SpritePtr_AffineFree
    pop        { pc }
thumb_func_end PlayerLocation_Free

thumb_func_start PlayerLocation_UpdateAll
PlayerLocation_UpdateAll:
    push       { lr }
    ldr        r5,PTR_gEntityListPlayerLocation_080031d4
LAB_080030e0:
    mov        r1,#0x1
    ldrb       r0,[r5,#0x0]
    tst        r0,r1
    beq        LAB_08003106
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080030f8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_08003106
LAB_080030f8:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_PTR_PlayerLocation_Handler_1_080031d8
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_08003106:
    add        r5,#0xb0
    ldr        r0,PTR_gEntityListPlayerLocation_080031dc
    mov        r1,#0xb0
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003114
    b          LAB_080030e0
LAB_08003114:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }
thumb_func_end PlayerLocation_UpdateAll

thumb_func_start PlayerLocation_Init
PlayerLocation_Init:
    push       { lr }
    ldr        r0,PTR_gFillValue_080031e0
    ldr        r1,PTR_gEntityListPlayerLocation_080031e4
    mov        r2,#0x2c
    mov        r3,#0x3
    ldr        r4,DAT_080031e8
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x1
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListPlayerLocation_080031ec
LAB_0800313c:
    mov        r3,#0x80
    strb       r3,[r5,#0x2]
    strb       r1,[r5,#0x3]
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_0800313c
    ldr        r0,PTR_gBitsetPlayerLocation_080031f0
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end PlayerLocation_Init

thumb_func_start PlayerLocation_LoadAll
PlayerLocation_LoadAll:
    push       { lr }
    mov        r0,#0x1
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListPlayerLocation_080031f4
LAB_0800315c:
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08003182
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x24
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x0
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_080031f8
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x80
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_0800319c
LAB_08003182:
    add        r4,r5,#0x0
    add        r4,#0x80
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_0800319c
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x24
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_0800319c:
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_0800315c
    pop        { pc }
thumb_func_end PlayerLocation_LoadAll

thumb_func_start PlayerLocation_UnloadAll
PlayerLocation_UnloadAll:
    mov        r0,#0x0
    ldr        r5,PTR_gEntityListPlayerLocation_080031fc
LAB_080031ac:
    add        r1,r5,#0x0
    add        r1,#0x80
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xb0
    add        r0,#0x1
    cmp        r0,#0x1
    blt        LAB_080031ac
    mov        pc,lr
thumb_func_end PlayerLocation_UnloadAll

    .align 2, 0

PTR_gBitsetPlayerLocation_080031c0:         .word gBitsetPlayerLocation
DAT_080031c4:                               .word 0x80000000
PTR_gEntityListPlayerLocation_080031c8:     .word gEntityListPlayerLocation
PTR_gFrameCounter_080031cc:                 .word gFrameCounter
PTR_gBitsetPlayerLocation_080031d0:         .word gBitsetPlayerLocation
PTR_gEntityListPlayerLocation_080031d4:     .word gEntityListPlayerLocation
PTR_PTR_PlayerLocation_Handler_1_080031d8:  .word PTR_PlayerLocation_Handler_1_08003084
PTR_gEntityListPlayerLocation_080031dc:     .word gEntityListPlayerLocation
PTR_gFillValue_080031e0:                    .word gFillValue
PTR_gEntityListPlayerLocation_080031e4:     .word gEntityListPlayerLocation
DAT_080031e8:                               .word 0x85000000
PTR_gEntityListPlayerLocation_080031ec:     .word gEntityListPlayerLocation
PTR_gBitsetPlayerLocation_080031f0:         .word gBitsetPlayerLocation
PTR_gEntityListPlayerLocation_080031f4:     .word gEntityListPlayerLocation
PTR_SpriteFrame_LoadTileset_1_080031f8:     .word SpriteFrame_LoadTileset
PTR_gEntityListPlayerLocation_080031fc:     .word gEntityListPlayerLocation

.end
