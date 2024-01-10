#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SpriteFrame_LoadTileset, 0x3006A00 + 1

    .text

listHandlerEffect:
    .word 0x807b475 @ DO_QuickEffect
    .word 0x807b9ad @ FUN_0807b9ac
    .word 0x807ba41 @ DO_BattleHP
    .word 0x807bbf1 @ dummy_7bbf0
    .word 0x807bc01 @ FUN_0807bc00
    .word 0x807bd65 @ FUN_0807bd64
    .word 0x807bed5 @ FUN_0807bed4
    .word 0x807bf01 @ FUN_0807bf00
    .word 0x807bfc1 @ FUN_0807bfc0
    .word 0x807c075 @ DO_BattleChip
    .word 0x807c1f1 @ FUN_0807c1f0
    .word 0x807c265 @ FUN_0807c264
    .word 0x807c311 @ FUN_0807c310
    .word 0x807cc8d @ FUN_0807cc8c
    .word 0x807cd61 @ DO_VirusDeleteExplosion
    .word 0x807ce31 @ DO_BattleResult
    .word 0x807dad9 @ FUN_0807dad8
    .word 0x807dce5 @ FUN_0807dce4
    .word 0x807de7d @ FUN_0807de7c
    .word 0x807df25 @ FUN_0807df24
    .word 0x807e011 @ FUN_0807e010
    .word 0x807e1c5 @ FUN_0807e1c4
    .word 0x807e31d @ DO_TeleportPortal
    .word 0x807e41b @ DO_BattleObject_Block
    .word 0x807e509 @ FUN_0807e508
    .word 0x807e5a9 @ FUN_0807e5a8
    .word 0x807e655 @ FUN_0807e654
    .word 0x807e6f5 @ FUN_0807e6f4
    .word 0x807e8a5 @ FUN_0807e8a4
    .word 0x807ea85 @ FUN_0807ea84
    .word 0x807eb19 @ FUN_0807eb18
    .word 0x807ebd9 @ FUN_0807ebd8
    .word 0x807ee19 @ FUN_0807ee18
    .word 0x807eec9 @ FUN_0807eec8
    .word 0x807efd5 @ FUN_0807efd4
    .word 0x807f0c1 @ FUN_0807f0c0
    .word 0x807f179 @ FUN_0807f178
    .word 0x807f22d @ FUN_0807f22c
    .word 0x807f2f5 @ FUN_0807f2f4
    .word 0x807f5f9 @ FUN_0807f5f8
    .word 0x807f691 @ FUN_0807f690
    .word 0x807f709 @ FUN_0807f708
    .word 0x807f86d @ FUN_0807f86c
    .word 0x807f9bd @ FUN_0807f9bc
    .word 0x807faa1 @ FUN_0807faa0
    .word 0x807fb41 @ FUN_0807fb40
    .word 0x807fbc9 @ FUN_0807fbc8
    .word 0x807fd1d @ FUN_0807fd1c
    .word 0x807ff29 @ FUN_0807ff28
    .word 0x807ffe9 @ FUN_0807ffe8
    .word 0x8080095 @ FUN_08080094
    .word 0x8080115 @ FUN_08080114
    .word 0x80801b9 @ FUN_080801b8
    .word 0x8080349 @ FUN_08080348
    .word 0x8080639 @ FUN_08080638
    .word 0x80807a1 @ FUN_080807a0
    .word 0x8080885 @ FUN_08080884
    .word 0x8080921 @ FUN_08080920
    .word 0x80809b9 @ FUN_080809b8
    .word 0x8080a71 @ FUN_08080a70
    .word 0x8080bb5 @ FUN_08080bb4
    .word 0x8080d09 @ FUN_08080d08
    .word 0x8080e05 @ FUN_08080e04
    .word 0x8080f35 @ FUN_08080f34
    .word 0x808108d @ FUN_0808108c
    .word 0x8081199 @ FUN_08081198
    .word 0x8081241 @ FUN_08081240
    .word 0x80813a1 @ FUN_080813a0
    .word 0x8081529 @ FUN_08081528
    .word 0x8081651 @ FUN_08081650
    .word 0x8081721 @ FUN_08081720
    .word 0x8081821 @ FUN_08081820
    .word 0x80818c9 @ FUN_080818c8
    .word 0x8081a11 @ FUN_08081a10
    .word 0x8081b15 @ FUN_08081b14
    .word 0x8081cc1 @ FUN_08081cc0

_ts Effect_Alloc
    push       { r0, r1, r2, r3, r4, lr }
    ldr        r0,PTR_gBitsetEffect_08003acc
    ldr        r2,[r0,#0x0]
    ldr        r1,DAT_08003ad0
    ldr        r5,PTR_gListEffect_08003ad4
    ldr        r3,PTR_Struct_20062d0_Sized_08003ad8
LAB_08003968:
    tst        r2,r1
    beq        LAB_08003976
    lsr        r1,r1,#0x1
    add        r5,#0xb0
    cmp        r5,r3
    bge        LAB_0800399c
    b          LAB_08003968
LAB_08003976:
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
LAB_0800399c:
    mov        r5,#0x0
    pop        { r0, r1, r2, r3, r4, pc }

_ts Effect_Free
    push       { lr }
    ldr        r0,DAT_08003ad0
    ldrb       r1,[r5,#0x3]
    lsr        r0,r1
    ldr        r1,PTR_gBitsetEffect_08003adc
    ldr        r2,[r1,#0x0]
    bic        r2,r0
    str        r2,[r1,#0x0]
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    bl         SpritePtr_AffineFree
    pop        { pc }

_ts Effect_UpdateAll
    push       { lr }
    ldr        r5,PTR_gListEffect_08003ae0
LAB_080039c0:
    mov        r1,#0x1
    ldrb       r0,[r5,#0x0]
    tst        r0,r1
    beq        LAB_080039f6
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x9]
    tst        r1,r1
    beq        LAB_080039d8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080039f6
LAB_080039d8:
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    ldrb       r1,[r7,#0x7]
    tst        r1,r1
    beq        LAB_080039e8
    mov        r1,#0x4
    tst        r0,r1
    beq        LAB_080039f6
LAB_080039e8:
    str        r5,[r7,#0x70]
    ldr        r0,PTR_listHandlerEffect_08003ae4
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_080039f6:
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r1,[r7,#0x18]
    tst        r1,r1
    bne        LAB_08003a14
    mov        r6,r10
    ldr        r6,[r6,#0x54]
    ldrb       r1,[r6,#0x7]
    tst        r1,r1
    beq        LAB_08003a14
    ldr        r1,[r6,#0x10]
    cmp        r1,r5
    blt        LAB_08003a14
    mov        r0,#0x0
    strb       r0,[r6,#0x7]
LAB_08003a14:
    add        r5,#0xb0
    ldr        r0,PTR_gListEffect_08003ae8
    ldr        r1,INT_08003aec
    add        r0,r0,r1
    cmp        r0,r5
    beq        LAB_08003a22
    b          LAB_080039c0
LAB_08003a22:
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r7,#0x70]
    pop        { pc }

_ts Effect_Init
    push       { lr }
    ldr        r0,PTR_gFillValue_08003af0
    ldr        r1,PTR_gListEffect_08003af4
    ldr        r2,DAT_08003af8
    mov        r3,#0x3
    ldr        r4,DAT_08003afc
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gListEffect_08003b00
LAB_08003a48:
    mov        r3,#0x83
    strb       r3,[r5,#0x2]
    strb       r1,[r5,#0x3]
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003a48
    ldr        r0,PTR_gBitsetEffect_08003b04
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }

_ts Effect_LoadAll
    push       { lr }
    mov        r0,#0x20
    mov        r1,#0x0
    ldr        r5,PTR_gListEffect_08003b08
LAB_08003a68:
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x2
    tst        r2,r3
    beq        LAB_08003a8e
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    mov        r0,#0x3
    ldr        r1,PTR_SpriteFrame_LoadTileset_1_08003b0c
    mov        lr,pc
    bx         r1
    mov        r0,#0x2
    add        r5,#0x80
    bl         Sprite_AddSpriteToOam
    pop        { r0, r1, r5 }
    b          LAB_08003aa8
LAB_08003a8e:
    add        r4,r5,#0x0
    add        r4,#0x80
    mov        r3,#0x0
    str        r3,[r4,#0x24]
    mov        r3,#0x1
    tst        r2,r3
    beq        LAB_08003aa8
    push       { r0, r1, r5 }
    add        r0,r5,#0x0
    add        r0,#0x28
    bl         LC_SpritePtr_CalculateOcclusion
    pop        { r0, r1, r5 }
LAB_08003aa8:
    add        r1,#0x1
    add        r5,#0xb0
    cmp        r1,r0
    blt        LAB_08003a68
    pop        { pc }

_ts Effect_UnloadAll
    mov        r0,#0x0
    ldr        r5,PTR_gListEffect_08003b10
LAB_08003ab8:
    add        r1,r5,#0x0
    add        r1,#0x80
    mov        r2,#0x0
    str        r2,[r1,#0x24]
    add        r5,#0xb0
    add        r0,#0x1
    cmp        r0,#0x20
    blt        LAB_08003ab8
    mov        pc,lr

    .align 2, 0
PTR_gBitsetEffect_08003acc:             .word gBitsetEffect
DAT_08003ad0:                           .word 0x80000000
PTR_gListEffect_08003ad4:               .word gListEffect
PTR_Struct_20062d0_Sized_08003ad8:      .word 0x20062d0
PTR_gBitsetEffect_08003adc:             .word gBitsetEffect
PTR_gListEffect_08003ae0:               .word gListEffect
PTR_listHandlerEffect_08003ae4:         .word listHandlerEffect
PTR_gListEffect_08003ae8:               .word gListEffect
INT_08003aec:                           .word 0x1600
PTR_gFillValue_08003af0:                .word gFillValue
PTR_gListEffect_08003af4:               .word gListEffect
DAT_08003af8:                           .word 0x580
DAT_08003afc:                           .word 0x85000000
PTR_gListEffect_08003b00:               .word gListEffect
PTR_gBitsetEffect_08003b04:             .word gBitsetEffect
PTR_gListEffect_08003b08:               .word gListEffect
PTR_SpriteFrame_LoadTileset_1_08003b0c: .word SpriteFrame_LoadTileset
PTR_gListEffect_08003b10:               .word gListEffect

.end
