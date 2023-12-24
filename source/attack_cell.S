#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SpriteFrame_LoadTileset, 0x3006A00 + 1

    .text

listHandlerAttackCell:
    .word 0x806f4b9 @ FUN_0806f4b8+1
    .word 0x806f5c5 @ FUN_0806f5c4+1
    .word 0x806f7f9 @ FUN_0806f7f8+1
    .word 0x806fa89 @ FUN_0806fa88+1
    .word 0x806fbe9 @ FUN_0806fbe8+1
    .word 0x806fcb5 @ FUN_0806fcb4+1
    .word 0x806fd69 @ FUN_0806fd68+1
    .word 0x806fe3f @ FUN_0806fe3e+1
    .word 0x806ff85 @ FUN_0806ff84+1
    .word 0x8070085 @ FUN_08070084+1
    .word 0x8070131 @ FUN_08070130+1
    .word 0x8070319 @ FUN_08070318+1
    .word 0x80703a9 @ FUN_080703a8+1
    .word 0x8070555 @ FUN_08070554+1
    .word 0x8070801 @ FUN_08070800_Routine_Shockwave+1
    .word 0x8070a35 @ FUN_08070a34+1
    .word 0x8070cf5 @ FUN_08070cf4+1
    .word 0x8070fbd @ FUN_08070fbc+1
    .word 0x8071199 @ FUN_08071198+1
    .word 0x80712b1 @ FUN_080712b0+1
    .word 0x807139d @ FUN_0807139c+1
    .word 0x80714c9 @ FUN_080714c8+1
    .word 0x8071589 @ FUN_08071588+1
    .word 0x80716b5 @ FUN_080716b4+1
    .word 0x8071849 @ FUN_08071848+1
    .word 0x807190d @ FUN_0807190c+1
    .word 0x80719d1 @ FUN_080719d0+1
    .word 0x8071bc1 @ FUN_08071bc0+1
    .word 0x8071d8d @ FUN_08071d8c+1
    .word 0x80721c9 @ FUN_080721c8+1
    .word 0x80723dd @ FUN_080723dc+1
    .word 0x80726a5 @ FUN_080726a4+1
    .word 0x8072765 @ FUN_08072764+1
    .word 0x80729bd @ FUN_080729bc+1
    .word 0x8072dad @ FUN_08072dac+1
    .word 0x8072fe9 @ FUN_08072fe8+1
    .word 0x80732b1 @ FUN_080732b0+1
    .word 0x80735f5 @ FUN_080735f4+1
    .word 0x80738f5 @ FUN_080738f4+1
    .word 0x8073a59 @ FUN_08073a58+1
    .word 0x8073ce9 @ FUN_08073ce8+1
    .word 0x8073e99 @ FUN_08073e98+1
    .word 0x807405d @ FUN_0807405c+1
    .word 0x8074201 @ FUN_08074200+1
    .word 0x807436d @ FUN_0807436c+1
    .word 0x80744fd @ FUN_080744fc+1
    .word 0x8074861 @ FUN_08074860+1
    .word 0x8074a45 @ FUN_08074a44+1
    .word 0x8074d45 @ FUN_08074d44+1
    .word 0x8074fb5 @ FUN_08074fb4+1
    .word 0x8075249 @ FUN_08075248+1
    .word 0x80753d5 @ FUN_080753d4+1
    .word 0x80755f5 @ FUN_080755f4+1
    .word 0x8075799 @ FUN_08075798+1
    .word 0x8075a65 @ FUN_08075a64+1
    .word 0x8075c85 @ FUN_08075c84+1
    .word 0x8075e21 @ FUN_08075e20+1
    .word 0x80760f1 @ FUN_080760f0+1
    .word 0x807667d @ FUN_0807667c+1
    .word 0x80768f5 @ FUN_080768f4+1
    .word 0x8076b7b @ FUN_08076b7a+1
    .word 0x8076dd9 @ FUN_08076dd8+1
    .word 0x8076fad @ FUN_08076fac+1
    .word 0x8077235 @ FUN_08077234+1
    .word 0x80773c5 @ FUN_080773c4+1
    .word 0x807747d @ FUN_0807747c+1
    .word 0x80775b1 @ FUN_080775b0+1
    .word 0x8077741 @ FUN_08077740+1
    .word 0x8077859 @ FUN_08077858+1
    .word 0x8077c2d @ FUN_08077c2c+1
    .word 0x8077df1 @ FUN_08077df0+1
    .word 0x8077f31 @ FUN_08077f30+1
    .word 0x80784a5 @ FUN_080784a4+1
    .word 0x8078861 @ FUN_08078860+1
    .word 0x8078d49 @ FUN_08078d48+1
    .word 0x80790a9 @ FUN_080790a8+1
    .word 0x80791f1 @ FUN_080791f0+1
    .word 0x8079335 @ FUN_08079334+1
    .word 0x807968d @ FUN_0807968c+1
    .word 0x8079a71 @ FUN_08079a70+1
    .word 0x8079bc9 @ FUN_08079bc8+1
    .word 0x8079d15 @ FUN_08079d14+1
    .word 0x8079ed9 @ FUN_08079ed8+1
    .word 0x807a087 @ FUN_0807a086+1
    .word 0x807a3b9 @ FUN_0807a3b8+1
    .word 0x807a629 @ FUN_0807a628+1
    .word 0x807a785 @ FUN_0807a784+1
    .word 0x807a9f5 @ FUN_0807a9f4+1
    .word 0x807ac75 @ FUN_0807ac74+1
    .word 0x807adcd @ FUN_0807adcc+1
    .word 0x807b239 @ FUN_0807b238+1
    .word 0x807b389 @ FUN_0807b388+1

thumb_func_start AttackCell_Alloc
AttackCell_Alloc:
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetAttackCell_080037e4
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_080037e8
    ldr        r5,PTR_gEntityListAttackCell_080037ec
    ldr        r3,PTR_gCurMapEventData_080037f0
LAB_08003680:
    tst        r2,r1
    beq        LAB_0800368e
    lsr        r1,r1,#0x1
    add        r5,#0xb0
    cmp        r5,r3
    bge        LAB_080036b4
    b          LAB_08003680
LAB_0800368e:
    orr        r2,r1
    str        r2,[r0,#0x0]
    mov        r0,#0x4
    add        r0,r0,r5
    mov        r1,#0x7c
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
LAB_080036b4:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }
thumb_func_end AttackCell_Alloc

thumb_func_start AttackCell_Free
AttackCell_Free:
    push       { lr }
    ldr        r0,DAT_080037e8
    ldrb       r1,[r5,#0x3]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetAttackCell_080037f4
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    bl         SpritePtr_FreeAffine
    pop        { pc }
thumb_func_end AttackCell_Free

thumb_func_start AttackCell_UpdateAll
AttackCell_UpdateAll:
    push       { lr }
    ldr        r5,PTR_gEntityListAttackCell_080037f8
LAB_080036d8:
    mov        r1,#0x1
    ldrb       r0,[r5,#0x0]
    tst        r0,r1
    beq        LAB_0800370e
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080036f0
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_0800370e
LAB_080036f0:
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    ldrb       r1,[r7,#0x7]
    tst        r1,r1
    beq        LAB_08003700
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_0800370e
LAB_08003700:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_listHandlerAttackCell_080037fc
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_0800370e:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x18]
    tst        r1,r1
    bne        LAB_0800372c
    mov        r6,r10
    ldr        r6,[r6,#0x54]
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_0800372c
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_0800372c
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_0800372c:
    add        r5,#0xb0
    ldr        r0,PTR_gEntityListAttackCell_08003800
    ldr        r1,INT_08003804
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_0800373a
    b          LAB_080036d8
LAB_0800373a:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }
thumb_func_end AttackCell_UpdateAll

thumb_func_start AttackCell_Init
AttackCell_Init:
    push       { lr }
    ldr        r0,PTR_gFillValue_08003808
    ldr        r1,PTR_gEntityListAttackCell_0800380c
    ldr        r2,DAT_08003810
    mov        r3,#0x3
    ldr        r4,DAT_08003814
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListAttackCell_08003818
LAB_08003760:
    mov        r3,#0x82
    strb       r3,[r5,#0x2]
    strb       r1,[r5,#0x3]
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003760
    ldr        r0,PTR_gBitsetAttackCell_0800381c
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end AttackCell_Init

thumb_func_start AttackCell_LoadAll
AttackCell_LoadAll:
    push       { lr }
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gEntityListAttackCell_08003820
LAB_08003780:
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_080037a6
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x2
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_08003824
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x80
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_080037c0
LAB_080037a6:
    add        r4,r5,#0x0
    add        r4,#0x80
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_080037c0
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_080037c0:
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003780
    pop        { pc }
thumb_func_end AttackCell_LoadAll

thumb_func_start AttackCell_UnloadAll
AttackCell_UnloadAll:
    mov        r0,#0x20
    ldr        r5,PTR_gEntityListAttackCell_08003828
LAB_080037d0:
    add        r1,r5,#0x0
    add        r1,#0x80
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xb0
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_080037d0
    mov        pc,lr
thumb_func_end AttackCell_UnloadAll

    .align 2, 0
PTR_gBitsetAttackCell_080037e4:         .word gBitsetAttackCell
DAT_080037e8:                           .word 0x80000000
PTR_gEntityListAttackCell_080037ec:     .word gEntityListAttackCell
PTR_gCurMapEventData_080037f0:          .word gCurMapEventData
PTR_gBitsetAttackCell_080037f4:         .word gBitsetAttackCell
PTR_gEntityListAttackCell_080037f8:     .word gEntityListAttackCell
PTR_listHandlerAttackCell_080037fc:     .word listHandlerAttackCell
PTR_gEntityListAttackCell_08003800:     .word gEntityListAttackCell
INT_08003804:                           .word 0x1600
PTR_gFillValue_08003808:                .word gFillValue
PTR_gEntityListAttackCell_0800380c:     .word gEntityListAttackCell
DAT_08003810:                           .word 0x580
DAT_08003814:                           .word 0x85000000
PTR_gEntityListAttackCell_08003818:     .word gEntityListAttackCell
PTR_gBitsetAttackCell_0800381c:         .word gBitsetAttackCell
PTR_gEntityListAttackCell_08003820:     .word gEntityListAttackCell
PTR_SpriteFrame_LoadTileset_1_08003824: .word SpriteFrame_LoadTileset
PTR_gEntityListAttackCell_08003828:     .word gEntityListAttackCell

.end
