#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SpriteFrame_LoadTileset, 0x3006A00 + 1

    .text

listHandlerActor:
    .word 0x8056301  @ Routine_Player+1
    .word 0x8058bf1  @ Routine_Woodman+1
    .word 0x8059911  @ Routine_Canodumb+1
    .word 0x8059c91  @ Routine_FireMan+1
    .word 0x805a551  @ Routine_Mettaur+1
    .word 0x805ab25  @ Routine_Vulgear+1
    .word 0x805b05d  @ FUN_0805b05c+1
    .word 0x805b155  @ FUN_0805b154+1
    .word 0x805b1fd  @ FUN_0805b1fc+1
    .word 0x805b475  @ Routine_Beetank+1
    .word 0x805b8a9  @ Routine_Spooky+1
    .word 0x805bf41  @ FUN_0805bf40+1
    .word 0x805c0f9  @ Routine_GutsMan+1
    .word 0x805c7a9  @ Routine_HardHead+1
    .word 0x805cad5  @ Routine_Fishy+1
    .word 0x805d1e9  @ Routine_NumberMan+1
    .word 0x805d779  @ Routine_Swordy+1
    .word 0x805e085  @ Routine_Puffy+1
    .word 0x805e369  @ Routine_Flappy+1
    .word 0x805e949  @ Routine_Piranha+1
    .word 0x805eec9  @ Routine_Cloudy+1
    .word 0x805f3b1  @ Routine_StoneMan+1
    .word 0x805f999  @ FUN_0805f998+1
    .word 0x805fb99  @ FUN_0805fb98+1
    .word 0x805fd95  @ Routine_Floshell+1
    .word 0x80603b5  @ FUN_080603b4+1
    .word 0x80605cd  @ Routine_Handy_Main+1
    .word 0x8060c15  @ Actor_IceMan+1
    .word 0x8061531  @ Routine_ColdBear+1
    .word 0x8061a65  @ FUN_08061a64+1
    .word 0x8061c71  @ FUN_08061c70+1
    .word 0x8061f05  @ Routine_Jelly+1
    .word 0x80623a5  @ Routine_Ratty+1
    .word 0x80628b5  @ Routine_Popper+1
    .word 0x8062cc5  @ Routine_SkullMan+1
    .word 0x80633c7  @ Routine_ColorMan+1
    .word 0x80639ed  @ Routine_ColorManDummy+1
    .word 0x8063de5  @ Routine_ElecMan+1
    .word 0x8064659  @ Routine_ProtoMan+1
    .word 0x8065075  @ Routine_Miney+1
    .word 0x806538d  @ Routine_Ammonicule+1
    .word 0x8065881  @ Routine_SharkMan+1
    .word 0x8066175  @ Routine_Prog+1
    .word 0x80665e5  @ Routine_Billy+1
    .word 0x8066a09  @ Routine_Megalian+1
    .word 0x806700d  @ Routine_Remobit+1
    .word 0x8067229  @ Routine_BombMan+1
    .word 0x8067971  @ FUN_08067970+1
    .word 0x8067bad  @ FUN_08067bac+1
    .word 0x8067f55  @ FUN_08067f54+1
    .word 0x80680fd  @ FUN_080680fc+1
    .word 0x806824d  @ FUN_0806824c+1
    .word 0x806841d  @ Routine_Fanner+1
    .word 0x80686fd  @ Routine_CanDevil+1
    .word 0x8068ac5  @ FUN_08068ac4+1
    .word 0x8068d45  @ Routine_Mosqurito+1
    .word 0x8069265  @ FUN_08069264+1
    .word 0x80694f1  @ Routine_LifeVirus+1
    .word 0x8069bc9  @ FUN_08069bc8+1
    .word 0x8069d6d  @ FUN_08069d6c+1
    .word 0x8069f75  @ FUN_08069f74+1
    .word 0x806a325  @ FUN_0806a324+1
    .word 0x806a609  @ FUN_0806a608+1
    .word 0x806a82d  @ Routine_MagicMan+1
    .word 0x806ada5  @ Routine_PharaohMan+1
    .word 0x806b1ed  @ Routine_Poitton+1
    .word 0x806b759  @ Routine_ShadowMan+1
    .word 0x806bdf9  @ Routine_BigSnake+1
    .word 0x806c37d  @ FUN_0806c37c+1
    .word 0x806c6ed  @ Routine_Gaia+1
    .word 0x806cc8d  @ Routine_Bass+1
    .word 0x806d495  @ Routine_Satella+1
    .word 0x806d859  @ FUN_0806d858+1
    .word 0x806daa5  @ FUN_0806daa4+1
    .word 0x806dc39  @ FUN_0806dc38+1
    .word 0x806de2d  @ FUN_0806de2c+1
    .word 0x806dfe1  @ FUN_0806dfe0+1
    .word 0x806e375  @ FUN_0806e374+1
    .word 0x806e5f9  @ FUN_0806e5f8+1
    .word 0x806e8c9  @ FUN_0806e8c8+1
    .word 0x806eb2d  @ FUN_0806eb2c+1
    .word 0x806ee6d  @ FUN_0806ee6c+1
    .word 0x806f059  @ Routine_Mole+1

thumb_func_start Actor_Alloc
Actor_Alloc:
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetActor_080034bc
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_080034c0
    ldr        r5,PTR_gEntityListActor_080034c4
    ldr        r3,PTR_gFadeSettings_080034c8
LAB_08003358:
    tst        r2,r1
    beq        LAB_08003366
    lsr        r1,r1,#0x1
    add        r5,#0xc0
    cmp        r5,r3
    bge        LAB_0800338c
    b          LAB_08003358
LAB_08003366:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r5
    mov        r1,#0xbc
    mov        r2,#0x0
    bl         memset
    mov        r0,#0x9
    strb       r0,[r5,#0x0]
    pop        { r0, r1, r2, r3, r4 }
    strb       r0,[r5,#0x1]
    str        r1,[r5,#0x28]
    str        r2,[r5,#0x2c]
    str        r3,[r5,#0x30]
    str        r4,[r5,#0x4]
    mov        r0,#0x0
    str        r0,[r5,#0x8]
    pop        { pc }
LAB_0800338c:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }
thumb_func_end Actor_Alloc

thumb_func_start Actor_Free
Actor_Free:
    push       { lr }
    ldr        r0,DAT_080034c0
    ldrb       r1,[r5,#0x3]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetActor_080034cc
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    bl         SpritePtr_FreeAffine
    pop        { pc }
thumb_func_end Actor_Free

thumb_func_start Actor_UpdateAll
Actor_UpdateAll:
    push       { lr }
    ldr        r5,PTR_gEntityListActor_080034d0
LAB_080033b0:
    mov        r1,#0x1
    ldrb       r0,[r5,#0x0]
    tst        r0,r1
    beq        LAB_080033e6
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080033c8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080033e6
LAB_080033c8:
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    ldrb       r1,[r7,#0x7]
    tst        r1,r1
    beq        LAB_080033d8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080033e6
LAB_080033d8:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_PTR_Routine_Player_1_080034d4
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_080033e6:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x18]
    tst        r1,r1
    bne        LAB_08003404
    mov        r6,r10
    ldr        r6,[r6,#0x54]
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_08003404
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_08003404
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_08003404:
    add        r5,#0xc0
    ldr        r0,PTR_gEntityListActor_080034d8
    ldr        r1,DAT_080034dc
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003412
    b          LAB_080033b0
LAB_08003412:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }
thumb_func_end Actor_UpdateAll

thumb_func_start Actor_Init
Actor_Init:
    push       { lr }
    ldr        r0,PTR_gFillValue_080034e0
    ldr        r1,PTR_gEntityListActor_080034e4
    ldr        r2,DAT_080034e8
    mov        r3,#0x3
    ldr        r4,DAT_080034ec
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x8
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListActor_080034f0
LAB_08003438:
    mov        r3,#0x91
    strb       r3,[r5,#0x2]
    strb       r1,[r5,#0x3]
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003438
    ldr        r0,PTR_gBitsetActor_080034f4
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Actor_Init

thumb_func_start Actor_LoadAll
Actor_LoadAll:
    push       { lr }
    mov        r0,#0x8
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListActor_080034f8
LAB_08003458:
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_0800347e
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x1
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_080034fc
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x90
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_08003498
LAB_0800347e:
    add        r4,r5,#0x0
    add        r4,#0x90
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08003498
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_08003498:
    add        r1,#0x1
    add        r5,#0xc0
    cmp        r1,r0
    blt        LAB_08003458
    pop        { pc }
thumb_func_end Actor_LoadAll

thumb_func_start Actor_UnloadAll
Actor_UnloadAll:
    mov        r0,#0x0
    ldr        r5,PTR_gEntityListActor_08003500
LAB_080034a8:
    add        r1,r5,#0x0
    add        r1,#0x90
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xc0
    add        r0,#0x1
    cmp        r0,#0x8
    blt        LAB_080034a8
    mov        pc,lr
thumb_func_end Actor_UnloadAll

    .align 2, 0

PTR_gBitsetActor_080034bc:              .word gBitsetActor
DAT_080034c0:                           .word 0x80000000
PTR_gEntityListActor_080034c4:          .word gEntityListActor
PTR_gFadeSettings_080034c8:             .word gFadeSettings
PTR_gBitsetActor_080034cc:              .word gBitsetActor
PTR_gEntityListActor_080034d0:          .word gEntityListActor
PTR_PTR_Routine_Player_1_080034d4:      .word listHandlerActor
PTR_gEntityListActor_080034d8:          .word gEntityListActor
DAT_080034dc:                           .word 0x600
PTR_gFillValue_080034e0:                .word gFillValue
PTR_gEntityListActor_080034e4:          .word gEntityListActor
DAT_080034e8:                           .word 0x180
DAT_080034ec:                           .word 0x85000000
PTR_gEntityListActor_080034f0:          .word gEntityListActor
PTR_gBitsetActor_080034f4:              .word gBitsetActor
PTR_gEntityListActor_080034f8:          .word gEntityListActor
PTR_SpriteFrame_LoadTileset_1_080034fc: .word SpriteFrame_LoadTileset
PTR_gEntityListActor_08003500:          .word gEntityListActor

.end
