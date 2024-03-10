#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set gDecompDest, 0x2033000

    .text

    .thumb

dummy_113e4:
    .word 0x8024269 @ dummy_24268
    .word 0x802a515 @ dummy_2a514
    .word 0x8031319 @ dummy_31318
    .word 0x8035edd @ dummy_35edc
    .word 0x803bd91 @ dummy_3bd90
    .word 0x803d87d @ dummy_3d87c
listGraphicDataSetup_Offline:
    .word 0x802426d @ GraphicDataSetup_ACDC_Elementary
    .word 0x802a519 @ GraphicDataSetup_ACDC_Town
    .word 0x803131d @ GraphicDataSetup_Govt_Complex
    .word 0x8035ee1 @ GraphicDataSetup_DenTown
    .word 0x803bd95 @ GraphicDataSetup_SciLab
    .word 0x803d881 @ GraphicDataSetup_WWW_Base
dummy_11414:
    .word 0x8040509 @ dummy_40508
    .word 0x8043149 @ dummy_43148
    .word 0x80456a1 @ dummy_456a0
    .word 0x8047e5d @ dummy_47e5c
    .word 0x804a119 @ dummy_4a118
    .word 0x804d179 @ dummy_4d178
    .word dummy_114bc
    .word dummy_114bc
    .word 0x804eef9 @ dummy_4eef8
    .word 0x804f7f9 @ dummy_4f7f8
    .word 0x804fdd5 @ dummy_4fdd4
    .word 0x8050091 @ dummy_50090
    .word 0x80503cd @ dummy_503cc
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc
    .word 0x8051cf1 @ dummy_51cf0
listGraphicDataSetup_Online:
    .word 0x804050d @ GraphicDataSetup_School_Comp
    .word 0x804314d @ GraphicDataSetup_Oven_Comp
    .word 0x80456a5 @ GraphicDataSetup_Waterworks_Comp
    .word 0x8047e61 @ GraphicDataSetup_Traffic_Light_Comp
    .word 0x804a11d @ GraphicDataSetup_Power_Plant_Comp
    .word 0x804d17d @ GraphicDataSetup_WWW_Comp
    .word dummy_114bc
    .word dummy_114bc
    .word 0x804eefd @ GraphicDataSetup_ACDC_HP
    .word 0x804f7fd @ GraphicDataSetup_Govt_Complex_HP
    .word 0x804fdd9 @ GraphicDataSetup_DenTown_HP
    .word 0x8050095 @ GraphicDataSetup_SciLab_HP
    .word 0x80503d1 @ GraphicDataSetup_Other_Comp
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc
    .word 0x8051cf5 @ GraphicDataSetup_Internet
dummy_1149c:
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc
listGraphicDataSetup_Battle:
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc
    .word dummy_114bc


_ts dummy_114bc
    push       {lr}
    pop        {pc}


_ts dummy_114c0
    push       {r5,lr}
    cmp        r0,#0xf0
    bge        LAB_080114d4
    cmp        r0,#0x80
    bge        LAB_080114ce
    ldr        r1,PTR_dummy_113e4_08011508
    b          LAB_080114d8
LAB_080114ce:
    ldr        r1,PTR_dummy_11414_0801150c
    sub        r0,#0x80
    b          LAB_080114d8
LAB_080114d4:
    ldr        r1,PTR_dummy_1149c_08011510
    sub        r0,#0xf0
LAB_080114d8:
    lsl        r0,r0,#0x2
    ldr        r0,[r1,r0]
    mov        lr,pc
    bx         r0
    pop        {r5,pc}


_ts Map_SetupGraphicData
    push       {r5,lr}
    cmp        r0,#0xf0
    bge        LAB_080114f8
    cmp        r0,#0x80
    bge        LAB_080114f2
    ldr        r1,PTR_listGraphicDataSetup_Offline_08011514
    b          LAB_080114fc
LAB_080114f2:
    ldr        r1,PTR_listGraphicDataSetup_Online_08011518
    sub        r0,#0x80
    b          LAB_080114fc
LAB_080114f8:
    ldr        r1,PTR_listGraphicDataSetup_Battle_0801151c
    sub        r0,#0xf0
LAB_080114fc:
    lsl        r0,r0,#0x2
    ldr        r0,[r1,r0]
    mov        lr,pc
    bx         r0
    pop        {r5,pc}

    .align 2, 0

PTR_dummy_113e4_08011508:
    .word dummy_113e4
PTR_dummy_11414_0801150c:
    .word dummy_11414
PTR_dummy_1149c_08011510:
    .word dummy_1149c
PTR_listGraphicDataSetup_Offline_08011514:
    .word listGraphicDataSetup_Offline
PTR_listGraphicDataSetup_Online_08011518:
    .word listGraphicDataSetup_Online
PTR_listGraphicDataSetup_Battle_0801151c:
    .word listGraphicDataSetup_Battle


_ts Map_LoadNPCList
    push       { lr }
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldr        r1,[r6,#0x34]
    cmp        r7,r1
    beq        LAB_0801154e
    str        r7,[r6,#0x34]
    push       { r7 }
    mov        r0,#0x10
    bl         Entity_FreeAllMultiple
    pop        { r7 }
    mov        r1,#0x0
LAB_0801153a:
    ldr        r0,[r7,#0x0]
    cmp        r0,#0xff
    beq        LAB_0801154e
    push       { r0, r1, r7 }
    bl         Map_CreateNPC
    pop        { r0, r1, r7 }
    add        r1,#0x1
    add        r7,#0x4
    b          LAB_0801153a
LAB_0801154e:
    pop        { pc }

_ts Map_CreateNPC
    push       { lr }
    push       { r0, r1 }
    mov        r0,#0x0
    bl         NPC_Alloc
    pop        { r0, r1 }
    tst        r5,r5
    beq        LAB_08011564
    strb       r1,[r5,#0x10]
    str        r0,[r5,#0x5c]
LAB_08011564:
    pop        { pc }

_ts Map_LoadBackgroundData
    push       { lr }
    cmp        r0,#0xf0
    bge        .greaterThanEqualToF0
    cmp        r0,#0x80
    bge        .greaterThanEqualTo80
    ldr        r3,lz_pointer_c
    b          .afterLzSelect
.greaterThanEqualTo80:
    ldr        r3,lz_pointer_b
    sub        r0,#0x80
    b          .afterLzSelect
.greaterThanEqualToF0:
    ldr        r3,lz_pointer_a
    sub        r0,#0xf0
.afterLzSelect:
    lsl        r0,r0,#0x2
    add        r3,r3,r0
    ldr        r3,[r3,#0x0]
    lsl        r1,r1,#0x2
    add        r3,r3,r1
    ldr        r0,[r3,#0x0]
    push       { r0 }
    add        r0,#0x10
    ldr        r1,PTR_gDecompDest_080118c8
    bl         SWI_LZ77UnCompWram
    pop        { r6 }
    ldr        r7,PTR_gDecompDest_080118c8
    ldr        r0,[r6,#0x0]
    add        r0,r0,r7
    bl         Map_InitBoundary
    ldr        r0,[r6,#0x4]
    add        r0,r0,r7
    bl         Map_InitElevation
    ldr        r0,[r6,#0x8]
    add        r0,r0,r7
    bl         Map_InitCover
    ldr        r0,[r6,#0xc]
    add        r0,r0,r7
    bl         Map_InitEvent
    pop        { pc }

_ts Map_InitBoundary
    ldr        r5,PTR_gCurMapBoundaryData_080118cc
    ldr        r1,[r0,#0x0]
    strh       r1,[r5,#0x4]
    add        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r1,r10
    ldr        r1,[r1,#0x44]
    ldrb       r0,[r1,#0x0]
    strb       r0,[r5,#0x8]
    ldrb       r0,[r1,#0x1]
    strb       r0,[r5,#0x9]
    mov        pc,lr

_ts GetWallSegmentByIndex
    push       { lr }
    ldrh       r2,[r5,#0x4]
    cmp        r2,#0x0
    beq        LAB_0801161c
    mov        r2,#0x0
    ldrh       r3,[r5,#0x4]
    ldr        r6,[r5,#0x0]
    mov        r8,r6
LAB_080115e4:
    add        r4,r2,r3
    lsr        r4,r4,#0x1
    lsl        r7,r4,#0x2
    mov        r6,r8
    add        r6,r6,r7
    ldrh       r7,[r6,#0x0]
    cmp        r1,r7
    beq        LAB_08011602
    bgt        LAB_080115fa
    add        r3,r4,#0x0
    b          LAB_080115fe
LAB_080115fa:
    add        r2,r4,#0x0
    add        r2,#0x1
LAB_080115fe:
    cmp        r2,r3
    blt        LAB_080115e4
LAB_08011602:
    cmp        r1,r7
    bne        LAB_0801161c
    ldr        r2,[r5,#0x0]
LAB_08011608:
    sub        r6,#0x4
    cmp        r6,r2
    ble        LAB_08011616
    ldrh       r7,[r6,#0x0]
    cmp        r1,r7
    bne        LAB_08011616
    b          LAB_08011608
LAB_08011616:
    add        r6,#0x4
    add        r2,r6,#0x0
    pop        { pc }
LAB_0801161c:
    mov        r2,#0x0
    pop        { pc }

_ts Map_HandleCollisionBoundary
    push       { lr }
    ldr        r5,PTR_gCurMapBoundaryData_080118d0
    ldr        r2,PTR_gCurPlayerPos_080118d4
    str        r0,[r2,#0x0]
    mov        r4,#0x0
    mov        r12,r4
    strb       r4,[r5,#0xb]
LAB_0801162e:
    add        r1,r5,#0x0
    add        r1,#0x18
    str        r1,[r5,#0x14]
    mov        r1,#0x0
    strb       r1,[r5,#0xa]
    neg        r1,r1
    strh       r1,[r5,#0x6]
    bl         BuildMapSegmentHistory
    mov        r2,#0x18
    add        r2,r2,r5
    str        r2,[r5,#0x10]
LAB_08011646:
    ldr        r1,[r5,#0x14]
    cmp        r2,r1
    beq        LAB_080116b8
    ldrh       r1,[r2,#0x0]
    bl         GetWallSegmentByIndex
    cmp        r2,#0x0
    bne        LAB_0801165e
LAB_08011656:
    ldr        r2,[r5,#0x10]
    add        r2,#0x10
    str        r2,[r5,#0x10]
    b          LAB_08011646
LAB_0801165e:
    ldrh       r4,[r2,#0x0]
    cmp        r1,r4
    bne        LAB_08011656
    ldrh       r7,[r2,#0x2]
    ldr        r4,[r5,#0x0]
    add        r7,r7,r4
    mov        r4,#0x0
    ldrsb      r4,[r7,r4]
    mov        r6,#0xa
    ldrsh      r3,[r0,r6]
    cmp        r3,r4
    blt        LAB_080116b4
    ldrb       r6,[r7,#0x2]
    add        r4,r4,r6
    cmp        r3,r4
    bgt        LAB_080116b4
    ldrb       r6,[r7,#0x1]
    strb       r6,[r5,#0xc]
    mov        r4,#0x80
    tst        r6,r4
    beq        LAB_08011698
    push       { r0, r1, r2, r5, r7 }
    mov        r4,#0x7f
    and        r6,r4
    add        r0,r6,#0x0
    bl         Flag_Get380
    pop        { r0, r1, r2, r5, r7 }
    bne        LAB_080116b4
LAB_08011698:
    ldrb       r6,[r7,#0x3]
    lsl        r6,r6,#0x2
    ldr        r4,PTR_regionCollisionBoundary_080118d8
    add        r4,r4,r6
    ldr        r4,[r4,#0x0]
    mov        lr,pc
    bx         r4
    ldrb       r4,[r5,#0xb]
    add        r4,r4,r3
    strb       r4,[r5,#0xb]
    cmp        r4,#0x4
    bge        LAB_080116bc
    cmp        r3,#0x0
    bne        LAB_0801162e
LAB_080116b4:
    add        r2,#0x4
    b          LAB_0801165e
LAB_080116b8:
    mov        r0,r12
    pop        { pc }
LAB_080116bc:
    ldr        r0,PTR_gCurPlayerPos_080118dc
    ldr        r0,[r0,#0x0]
    ldr        r6,[r0,#0xc]
    str        r6,[r0,#0x0]
    ldr        r6,[r0,#0x10]
    str        r6,[r0,#0x4]
    ldr        r6,[r0,#0x14]
    str        r6,[r0,#0x8]
    mov        r0,#0x0
    pop        { pc }

    .align 2, 0

regionCollisionBoundary:
    .word 0
    .word 0x8011e68+1
    .word 0x8011e90+1
    .word 0x8011eb4+1
    .word 0x8011edc+1
    .word 0x8011f00+1
    .word 0x8011f58+1
    .word 0x8011fac+1
    .word 0x8012000+1
    .word 0x8011cc4+1
    .word 0x8011d10+1
    .word 0x8011d38+1
    .word 0x8011d64+1
    .word 0x8011da8+1
    .word 0x8011ddc+1
    .word 0x8011e0c+1
    .word 0x8011e3c+1

    .byte 0, 0
    .ascii "POS X:%D Y:%D Z:%D A:%D\nCELNO:%4X\x00"
    .byte 0, 2
    .ascii "C NUM:%D\nX:%8X Y:%8X\x00"
    .byte 0, 5
    .ascii "AT V %3D\x00"
    .byte 0, 6
    .ascii "PL\n%8x\n%8x\n%8x\x00"
    .align 2, 0

@@ Add bound
_ts BuildMapSegmentHistory
    push       { lr }
    push       { r0, r5 }
    mov        r2,#0xe
    ldrsh      r4,[r0,r2]
    mov        r2,#0x12
    ldrsh      r7,[r0,r2]
    bl         AddToMapSegmentHistory
    mov        r2,#0x2
    ldrsh      r1,[r0,r2]
    mov        r2,#0xe
    ldrsh      r2,[r0,r2]
    sub        r1,r1,r2
    add        r6,r1,#0x0
    cmp        r6,#0x0
    bge        LAB_0801178e
    neg        r6,r6
LAB_0801178e:
    mov        r3,#0x6
    ldrsh      r2,[r0,r3]
    mov        r3,#0x12
    ldrsh      r3,[r0,r3]
    sub        r2,r2,r3
    add        r7,r2,#0x0
    cmp        r7,#0x0
    bge        LAB_080117a0
    neg        r7,r7
LAB_080117a0:
    cmp        r6,r7
    bgt        LAB_080117ac
    blt        LAB_080117e8
    cmp        r1,#0x0
    bne        LAB_08011824
    b          LAB_08011852
LAB_080117ac:
    mov        r3,#0xe
    ldrsh      r4,[r0,r3]
    mov        r3,#0x2
    ldrsh      r6,[r0,r3]
    mov        r3,#0x12
    ldrsh      r7,[r0,r3]
    mov        r3,#0x1
    mov        r0,#0x1
    cmp        r1,#0x0
    bge        LAB_080117c4
    neg        r3,r3
    neg        r1,r1
LAB_080117c4:
    cmp        r2,#0x0
    bge        LAB_080117cc
    neg        r0,r0
    neg        r2,r2
LAB_080117cc:
    mvn        r5,r1
LAB_080117ce:
    add        r4,r4,r3
    cmp        r4,r6
    beq        LAB_08011852
    add        r5,r5,r2
    add        r5,r5,r2
    cmp        r5,r1
    blt        LAB_080117e2
    add        r7,r7,r0
    sub        r5,r5,r1
    sub        r5,r5,r1
LAB_080117e2:
    bl         AddToMapSegmentHistory
    b          LAB_080117ce
LAB_080117e8:
    mov        r3,#0x12
    ldrsh      r7,[r0,r3]
    mov        r3,#0x6
    ldrsh      r6,[r0,r3]
    mov        r3,#0xe
    ldrsh      r4,[r0,r3]
    mov        r3,#0x1
    mov        r0,#0x1
    cmp        r1,#0x0
    bge        LAB_08011800
    neg        r3,r3
    neg        r1,r1
LAB_08011800:
    cmp        r2,#0x0
    bge        LAB_08011808
    neg        r0,r0
    neg        r2,r2
LAB_08011808:
    mvn        r5,r2
LAB_0801180a:
    add        r7,r7,r0
    cmp        r7,r6
    beq        LAB_08011852
    add        r5,r5,r1
    add        r5,r5,r1
    cmp        r5,r2
    blt        LAB_0801181e
    add        r4,r4,r3
    sub        r5,r5,r2
    sub        r5,r5,r2
LAB_0801181e:
    bl         AddToMapSegmentHistory
    b          LAB_0801180a
LAB_08011824:
    mov        r3,#0x12
    ldrsh      r7,[r0,r3]
    mov        r3,#0x6
    ldrsh      r6,[r0,r3]
    mov        r3,#0xe
    ldrsh      r4,[r0,r3]
    mov        r3,#0x1
    mov        r0,#0x1
    cmp        r1,#0x0
    bge        LAB_0801183c
    neg        r3,r3
    neg        r1,r1
LAB_0801183c:
    cmp        r2,#0x0
    bge        LAB_08011844
    neg        r0,r0
    neg        r2,r2
LAB_08011844:
    add        r7,r7,r0
    cmp        r7,r6
    beq        LAB_08011852
    add        r4,r4,r3
    bl         AddToMapSegmentHistory
    b          LAB_08011844
LAB_08011852:
    pop        { r0, r5 }
    mov        r2,#0x2
    ldrsh      r4,[r0,r2]
    mov        r2,#0x6
    ldrsh      r7,[r0,r2]
    bl         AddToMapSegmentHistory
    pop        { pc }


_ts AddToMapSegmentHistory
    push       { r0, r5, lr }
    push       { r4, r7 }
    asr        r4,r4,#0x3
    asr        r7,r7,#0x3
    ldr        r5,PTR_gCurMapBoundaryData_080118e0
    ldrb       r0,[r5,#0x9]
    lsr        r0,r0,#0x1
    add        r7,r7,r0
    ldrb       r0,[r5,#0x8]
    lsr        r0,r0,#0x1
    add        r4,r4,r0
    lsl        r0,r0,#0x1
    mul        r7,r0
    add        r7,r7,r4
    ldrh       r0,[r5,#0x6]
    cmp        r0,r7
    beq        LAB_080118b6
    ldrb       r0,[r5,#0xa]
    add        r4,r0,#0x1
    cmp        r4,#0x10
    bge        LAB_080118b6
    strh       r7,[r5,#0x6]
    strb       r4,[r5,#0xa]
    ldr        r4,[r5,#0x14]
    add        r4,#0x10
    str        r4,[r5,#0x14]
    mov        r4,#0x10
    mul        r4,r0
    add        r4,#0x18
    add        r5,r5,r4
    strh       r7,[r5,#0x0]
    pop        { r4, r7 }
    mov        r0,#0x7
    mov        r8,r4
    bic        r4,r0
    str        r4,[r5,#0x4]
    add        r4,r7,#0x0
    bic        r4,r0
    str        r4,[r5,#0x8]
    mov        r4,r8
    pop        { r0, r5, pc }
LAB_080118b6:
    pop        { r4, r7 }
    pop        { r0, r5, pc }

    .align 2, 0

lz_pointer_c:                           .word MapData_Offline
lz_pointer_b:                           .word MapData_Online
lz_pointer_a:                           .word MapData_Battle
PTR_gDecompDest_080118c8:               .word gDecompDest
PTR_gCurMapBoundaryData_080118cc:       .word gCurMapBoundaryData
PTR_gCurMapBoundaryData_080118d0:       .word gCurMapBoundaryData
PTR_gCurPlayerPos_080118d4:             .word gCurPlayerPos
PTR_regionCollisionBoundary_080118d8:   .word regionCollisionBoundary
PTR_gCurPlayerPos_080118dc:             .word gCurPlayerPos
PTR_gCurMapBoundaryData_080118e0:       .word gCurMapBoundaryData


_ts Boundary_CheckPosition_AcceptBelow
    push       {lr}
    mov        r8,r6
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bge        LAB_08011956
    mov        r3,r8
    cmp        r3,#0x1
    beq        LAB_0801191c
    ldr        r3,[r0,#0xc]
    ldr        r4,[r0,#0x10]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    blt        LAB_08011956
LAB_0801191c:
    ldr        r3,[r0,#0x0]
    mul        r3,r6
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r7,#0x0
    push       {r6,r7}
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x4]
    sub        r4,r7,r4
    mov        r8,r4
    pop        {r6,r7}
    ldr        r3,[r0,#0x4]
    mul        r3,r7
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r6,#0x0
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x0]
    sub        r4,r7,r4
    mov        r9,r4
    mov        r0,r9
    mov        r1,r8
    pop        {pc}
LAB_08011956:
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {pc}


_ts Boundary_CheckPosition_AcceptBelow_2
    push       {lr}
    mov        r8,r6
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bge        LAB_080119ce
    mov        r3,r8
    cmp        r3,#0x1
    beq        LAB_08011994
    ldr        r3,[r0,#0xc]
    ldr        r4,[r0,#0x10]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    blt        LAB_080119ce
LAB_08011994:
    ldr        r3,[r0,#0x0]
    mul        r3,r6
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r7,#0x0
    push       {r6,r7}
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x4]
    sub        r4,r7,r4
    mov        r8,r4
    pop        {r6,r7}
    ldr        r3,[r0,#0x4]
    mul        r3,r7
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r6,#0x0
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x0]
    sub        r4,r7,r4
    mov        r9,r4
    mov        r0,r9
    mov        r1,r8
    pop        {pc}
LAB_080119ce:
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {pc}


_ts Boundary_CheckPosition_AcceptAbove
    push       {lr}
    mov        r8,r6
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    ble        LAB_08011a46
    mov        r3,r8
    cmp        r3,#0x1
    beq        LAB_08011a0c
    ldr        r3,[r0,#0xc]
    ldr        r4,[r0,#0x10]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bgt        LAB_08011a46
LAB_08011a0c:
    ldr        r3,[r0,#0x0]
    mul        r3,r6
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r7,#0x0
    push       {r6,r7}
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x4]
    sub        r4,r7,r4
    mov        r8,r4
    pop        {r6,r7}
    ldr        r3,[r0,#0x4]
    mul        r3,r7
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r6,#0x0
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x0]
    sub        r4,r7,r4
    mov        r9,r4
    mov        r0,r9
    mov        r1,r8
    pop        {pc}
LAB_08011a46:
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {pc}


_ts Boundary_CheckPosition_AcceptAbove_2
    push       {lr}
    mov        r8,r6
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    ble        LAB_08011abe
    mov        r3,r8
    cmp        r3,#0x1
    beq        LAB_08011a84
    ldr        r3,[r0,#0xc]
    ldr        r4,[r0,#0x10]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bgt        LAB_08011abe
LAB_08011a84:
    ldr        r3,[r0,#0x0]
    mul        r3,r6
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r7,#0x0
    push       {r6,r7}
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x4]
    sub        r4,r7,r4
    mov        r8,r4
    pop        {r6,r7}
    ldr        r3,[r0,#0x4]
    mul        r3,r7
    add        r3,r3,r2
    neg        r3,r3
    add        r4,r6,#0x0
    add        r6,r3,#0x0
    add        r7,r4,#0x0
    bl         Boundary_IntDiv
    ldr        r4,[r0,#0x0]
    sub        r4,r7,r4
    mov        r9,r4
    mov        r0,r9
    mov        r1,r8
    pop        {pc}
LAB_08011abe:
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {pc}
.byte 0, 13
.asciz "00 X:%8X Y:%8X"

.byte 0, 14
.asciz "01 X:%8X Y:%8X"

.byte 0, 15
.asciz "02 X:%8X Y:%8X"

.byte 0, 16
.asciz "03 X:%8X Y:%8X"


_ts Boundary_IntDiv
    push       {r2,r3,lr}
    mov        r2,#0x0
    mov        r3,#0x0
    cmp        r7,#0x0
    beq        LAB_08011b2c
    cmp        r6,#0x0
    bge        LAB_08011b1a
    neg        r6,r6
    mvn        r3,r3
LAB_08011b1a:
    cmp        r7,#0x0
    bge        LAB_08011b22
    neg        r7,r7
    mvn        r3,r3
LAB_08011b22:
    cmp        r6,r7
    blt        LAB_08011b2c
    sub        r6,r6,r7
    add        r2,#0x1
    b          LAB_08011b22
LAB_08011b2c:
    add        r7,r2,#0x0
    cmp        r3,#0x0
    beq        LAB_08011b36
    neg        r7,r7
    neg        r6,r6
LAB_08011b36:
    pop        {r2,r3,pc}


_ts Boundary_IntDiv_2
    push       {r2,r3,lr}
    mov        r2,#0x0
    mov        r3,#0x0
    cmp        r7,#0x0
    beq        LAB_08011b5c
    cmp        r6,#0x0
    bge        LAB_08011b4a
    neg        r6,r6
    mvn        r3,r3
LAB_08011b4a:
    cmp        r7,#0x0
    bge        LAB_08011b52
    neg        r7,r7
    mvn        r3,r3
LAB_08011b52:
    cmp        r6,r7
    blt        LAB_08011b5c
    sub        r6,r6,r7
    add        r2,#0x1
    b          LAB_08011b52
LAB_08011b5c:
    lsr        r7,r7,#0x1
    cmp        r6,r7
    blt        LAB_08011b64
    add        r2,#0x1
LAB_08011b64:
    add        r7,r2,#0x0
    cmp        r3,#0x0
    beq        LAB_08011b6e
    neg        r7,r7
    neg        r6,r6
LAB_08011b6e:
    pop        {r2,r3,pc}


_ts Boundary_UpdatePlayerPosition
    push       {lr}
    lsl        r0,r0,#0xe
    lsl        r1,r1,#0xe
    mov        r3,#0x1
    cmp        r0,#0x0
    beq        LAB_08011b7e
    b          LAB_08011b86
LAB_08011b7e:
    cmp        r1,#0x0
    beq        LAB_08011b84
    b          LAB_08011b86
LAB_08011b84:
    mov        r3,#0x0
LAB_08011b86:
    cmp        r3,#0x0
    beq        LAB_08011ba4
    ldr        r5,PTR_gCurPlayerPos_08011cac
    ldr        r5,[r5,#0x0]
    ldr        r4,PTR_gMapSegPos_08011cb0
    ldr        r6,[r5,#0x0]
    add        r6,r6,r0
    ldr        r2,[r4,#0x18]
    add        r6,r6,r2
    str        r6,[r5,#0x0]
    ldr        r6,[r5,#0x4]
    add        r6,r6,r1
    ldr        r2,[r4,#0x1c]
    add        r6,r6,r2
    str        r6,[r5,#0x4]
LAB_08011ba4:
    pop        {pc}


_ts Boundary_SetSubPosition
    push       {lr}
    ldr        r4,[r5,#0x10]
    ldr        r2,[r4,#0x4]
    lsl        r2,r2,#0x2
    ldr        r5,[r4,#0x8]
    lsl        r5,r5,#0x2
    ldr        r7,[r6,#0x0]
    ldr        r3,[r0,#0x18]
    add        r7,r7,r3
    asr        r7,r7,#0xe
    sub        r7,r7,r2
    str        r7,[r0,#0x0]
    ldr        r7,[r6,#0x4]
    ldr        r3,[r0,#0x1c]
    add        r7,r7,r3
    asr        r7,r7,#0xe
    sub        r7,r7,r5
    str        r7,[r0,#0x4]
    ldr        r7,[r6,#0xc]
    asr        r7,r7,#0xe
    sub        r7,r7,r2
    str        r7,[r0,#0xc]
    ldr        r7,[r6,#0x10]
    asr        r7,r7,#0xe
    sub        r7,r7,r5
    str        r7,[r0,#0x10]
    pop        {pc}


_ts Boundary_GetSubPosition_NoSlope
    @ Doesn't set boost
    push       {lr}
    add        r6,r0,#0x0
    ldr        r0,PTR_gMapSegPos_08011cb4
    mov        r2,#0x0
    mov        r3,#0x0
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
    bl         Boundary_SetSubPosition
    pop        {pc}


_ts Boundary_GetSubPosition_Right
    @ Sets boost if moving to right
    push       {lr}
    add        r6,r0,#0x0
    ldr        r0,PTR_gMapSegPos_08011cb8
    ldr        r2,[r6,#0xc]
    ldr        r7,[r6,#0x0]
    sub        r7,r7,r2
    str        r7,[r0,#0x18]
    ldr        r2,[r6,#0x10]
    ldr        r7,[r6,#0x4]
    sub        r7,r7,r2
    str        r7,[r0,#0x1c]
    ldr        r2,[r0,#0x18]
    ldr        r3,[r0,#0x1c]
    cmp        r2,#0x0
    bgt        LAB_08011c16
    blt        LAB_08011c26
    b          LAB_08011c26
LAB_08011c16:
    cmp        r3,#0x0
    bgt        LAB_08011c1c
    b          LAB_08011c26
LAB_08011c1c:
    cmp        r2,r3
    bne        LAB_08011c26
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
    b          LAB_08011c2e
LAB_08011c26:
    mov        r2,#0x0
    mov        r3,#0x0
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
LAB_08011c2e:
    bl         Boundary_SetSubPosition
    pop        {pc}


_ts Boundary_GetSubPosition_Left
    @ Sets boost if moving to left
    push       {lr}
    add        r6,r0,#0x0
    ldr        r0,PTR_gMapSegPos_08011cbc
    ldr        r2,[r6,#0xc]
    ldr        r7,[r6,#0x0]
    sub        r7,r7,r2
    str        r7,[r0,#0x18]
    ldr        r2,[r6,#0x10]
    ldr        r7,[r6,#0x4]
    sub        r7,r7,r2
    str        r7,[r0,#0x1c]
    ldr        r2,[r0,#0x18]
    ldr        r3,[r0,#0x1c]
    cmp        r2,#0x0
    bgt        LAB_08011c66
    blt        LAB_08011c56
    b          LAB_08011c66
LAB_08011c56:
    cmp        r3,#0x0
    blt        LAB_08011c5c
    b          LAB_08011c66
LAB_08011c5c:
    cmp        r2,r3
    bne        LAB_08011c66
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
    b          LAB_08011c6e
LAB_08011c66:
    mov        r2,#0x0
    mov        r3,#0x0
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
LAB_08011c6e:
    bl         Boundary_SetSubPosition
    pop        {pc}


_ts Boundary_GetSubPosition_Diagonal
    @ Set boost if moving on diagonal
    push       {lr}
    add        r6,r0,#0x0
    ldr        r0,PTR_gMapSegPos_08011cc0
    ldr        r2,[r6,#0xc]
    ldr        r7,[r6,#0x0]
    sub        r7,r7,r2
    str        r7,[r0,#0x18]
    ldr        r2,[r6,#0x10]
    ldr        r7,[r6,#0x4]
    sub        r7,r7,r2
    str        r7,[r0,#0x1c]
    ldr        r2,[r0,#0x18]
    ldr        r3,[r0,#0x1c]
    cmp        r2,#0x0
    beq        LAB_08011c98
    cmp        r3,#0x0
    beq        LAB_08011c98
    b          LAB_08011c9e
LAB_08011c98:
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
    b          LAB_08011ca6
LAB_08011c9e:
    mov        r2,#0x0
    mov        r3,#0x0
    str        r2,[r0,#0x18]
    str        r3,[r0,#0x1c]
LAB_08011ca6:
    bl         Boundary_SetSubPosition
    pop        {pc}

    .align 2, 0

PTR_gCurPlayerPos_08011cac: .word gCurPlayerPos
PTR_gMapSegPos_08011cb0:    .word gMapSegPos
PTR_gMapSegPos_08011cb4:    .word gMapSegPos
PTR_gMapSegPos_08011cb8:    .word gMapSegPos
PTR_gMapSegPos_08011cbc:    .word gMapSegPos
PTR_gMapSegPos_08011cc0:    .word gMapSegPos


_ts Collide_B_09
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    bl         Boundary_IsAbove
    mov        r3,#0x0
    cmp        r0,#0x0
    beq        LAB_08011d04
    pop        {r0,r1,r2,r5}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Diagonal
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow
    neg        r0,r0
    lsr        r0,r0,#0x1
    neg        r0,r0
    neg        r1,r1
    lsr        r1,r1,#0x1
    neg        r1,r1
    bl         Boundary_UpdatePlayerPosition
LAB_08011d04:
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0A
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow_2
    lsr        r0,r0,#0x1
    asr        r1,r1,#0x1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0B
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove
    neg        r0,r0
    lsr        r0,r0,#0x1
    neg        r0,r0
    lsr        r1,r1,#0x1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0C
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    bl         Boundary_IsBelow
    mov        r3,#0x0
    cmp        r0,#0x0
    beq        LAB_08011d9c
    pop        {r0,r1,r2,r5}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Diagonal
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove_2
    lsr        r0,r0,#0x1
    lsr        r1,r1,#0x1
    bl         Boundary_UpdatePlayerPosition
LAB_08011d9c:
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0D
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Diagonal
    mov        r2,#0x0
    mov        r4,#0x20
    sub        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    sub        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow
    neg        r0,r0
    lsr        r0,r0,#0x1
    neg        r0,r0
    neg        r1,r1
    lsr        r1,r1,#0x1
    neg        r1,r1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0E
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x0
    sub        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x20
    sub        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow_2
    lsr        r0,r0,#0x1
    neg        r1,r1
    lsr        r1,r1,#0x1
    neg        r1,r1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_0F
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_NoSlope
    mov        r2,#0x0
    mov        r4,#0x0
    add        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x20
    add        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove
    neg        r0,r0
    lsr        r0,r0,#0x1
    neg        r0,r0
    lsr        r1,r1,#0x1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_10
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Diagonal
    mov        r2,#0x0
    mov        r4,#0x20
    add        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x0
    add        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove_2
    lsr        r0,r0,#0x1
    lsr        r1,r1,#0x1
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_01
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x0
    sub        r2,#0x1
    mov        r4,#0x20
    mov        r3,#0x0
    sub        r3,#0x1
    mov        r5,#0x0
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_02
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x20
    mov        r4,#0x0
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptBelow_2
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_03
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x20
    mov        r4,#0x0
    sub        r4,#0x1
    mov        r3,#0x0
    mov        r5,#0x0
    sub        r5,#0x1
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x2
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_04
    push       {r0,r1,r2,r5,lr}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x1
    bl         Boundary_CheckPosition_AcceptAbove_2
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    mov        r1,#0x2
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5,pc}


_ts Collide_B_05
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x0
    sub        r2,#0x1
    mov        r4,#0x20
    mov        r3,#0x0
    sub        r3,#0x1
    mov        r5,#0x0
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptBelow
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    .byte 0x19, 0x00 @ mov r1,r3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
    cmp        r3,#0x1
    beq        LAB_08011f56
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x20
    mov        r4,#0x0
    sub        r4,#0x1
    mov        r3,#0x0
    mov        r5,#0x0
    sub        r5,#0x1
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptAbove
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    lsl        r1,r3,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
LAB_08011f56:
    pop        {pc}


_ts Collide_B_06
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x20
    mov        r4,#0x0
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptBelow_2
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    .byte 0x19, 0x00 @ mov r1,r3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
    cmp        r3,#0x1
    beq        LAB_08011faa
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x20
    mov        r4,#0x0
    sub        r4,#0x1
    mov        r3,#0x0
    mov        r5,#0x0
    sub        r5,#0x1
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptAbove
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    lsl        r1,r3,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
LAB_08011faa:
    pop        {pc}


_ts Collide_B_07
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Right
    mov        r2,#0x0
    sub        r2,#0x1
    mov        r4,#0x20
    mov        r3,#0x0
    sub        r3,#0x1
    mov        r5,#0x0
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptBelow
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    .byte 0x19, 0x00 @ mov r1,r3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
    cmp        r3,#0x1
    beq        LAB_08011ffe
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptAbove_2
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    lsl        r1,r3,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
LAB_08011ffe:
    pop        {pc}


_ts Collide_B_08
    push       {lr}
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x20
    mov        r4,#0x0
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptBelow_2
    mov        r1,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    .byte 0x19, 0x00 @ mov r1,r3
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
    cmp        r3,#0x1
    beq        LAB_0801204e
    push       {r0,r1,r2,r5}
    bl         Boundary_GetSubPosition_Left
    mov        r2,#0x0
    mov        r4,#0x20
    mov        r3,#0x20
    mov        r5,#0x20
    mov        r6,#0x0
    bl         Boundary_CheckPosition_AcceptAbove_2
    mov        r0,#0x0
    bl         Boundary_UpdatePlayerPosition
    mov        r0,r12
    lsl        r1,r3,#0x1
    orr        r0,r1
    mov        r12,r0
    pop        {r0,r1,r2,r5}
LAB_0801204e:
    pop        {pc}


_ts Boundary_IsAbove
    push       {lr}
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bge        LAB_08012072
    mov        r0,#0x1
    pop        {pc}
LAB_08012072:
    mov        r0,#0x0
    pop        {pc}


_ts Boundary_IsAbove_2
    push       {lr}
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    bge        LAB_0801209a
    mov        r0,#0x1
    pop        {pc}
LAB_0801209a:
    mov        r0,#0x0
    pop        {pc}


_ts Boundary_IsBelow_2
    push       {lr}
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    ble        LAB_080120c2
    mov        r0,#0x1
    pop        {pc}
LAB_080120c2:
    mov        r0,#0x0
    pop        {pc}


_ts Boundary_IsBelow
    push       {lr}
    sub        r6,r5,r4
    sub        r7,r2,r3
    mul        r3,r4
    mul        r2,r5
    sub        r2,r3,r2
    ldr        r3,[r0,#0x0]
    ldr        r4,[r0,#0x4]
    add        r5,r2,#0x0
    mul        r3,r6
    mul        r4,r7
    add        r3,r3,r4
    add        r5,r5,r3
    cmp        r5,#0x0
    ble        LAB_080120ea
    mov        r0,#0x1
    pop        {pc}
LAB_080120ea:
    mov        r0,#0x0
    pop        {pc}


_ts Map_InitElevation
    ldr        r5,PTR_gCurMapElevationData_0801224c
    ldr        r1,[r0,#0x0]
    strh       r1,[r5,#0x4]
    add        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r1,r10
    ldr        r1,[r1,#0x44]
    ldrb       r0,[r1,#0x0]
    strb       r0,[r5,#0x6]
    ldrb       r0,[r1,#0x1]
    strb       r0,[r5,#0x7]
    mov        pc,lr


_ts Map_HandleCollisionElevation
    push       {lr}
    ldr        r5,PTR_gCurMapElevationData_08012250
    ldr        r2,PTR_gCurPlayerPos_08012254
    str        r0,[r2,#0x0]
    bl         UpdatePlayerGridPosition
    bl         GetWallSegmentByIndex
    cmp        r2,#0x0
    beq        LAB_08012166
    mov        r3,#0x0
LAB_0801211e:
    ldrh       r4,[r2,#0x0]
    cmp        r1,r4
    bne        LAB_08012146
    ldrh       r7,[r2,#0x2]
    ldr        r4,[r5,#0x0]
    add        r7,r7,r4
    mov        r4,#0x0
    ldrsb      r4,[r7,r4]
    mov        r6,#0xa
    ldrsh      r6,[r0,r6]
    cmp        r6,r4
    blt        LAB_0801214c
    cmp        r3,#0x0
    beq        LAB_08012142
    mov        r6,#0x0
    ldrsb      r6,[r3,r6]
    cmp        r6,r4
    bgt        LAB_0801214c
LAB_08012142:
    add        r3,r7,#0x0
    b          LAB_0801214c
LAB_08012146:
    cmp        r3,#0x0
    beq        LAB_08012166
    b          LAB_08012150
LAB_0801214c:
    add        r2,#0x4
    b          LAB_0801211e
LAB_08012150:
    str        r3,[r5,#0x14]
    ldrb       r6,[r3,#0x3]
    cmp        r6,#0xff
    beq        LAB_08012166
    lsl        r6,r6,#0x2
    ldr        r4,PTR_regionCollisionElevation_08012258
    add        r4,r4,r6
    ldr        r4,[r4,#0x0]
    mov        lr,pc
    bx         r4
    b          LAB_0801216a
LAB_08012166:
    mov        r0,#0x0
    mov        r1,#0x0
LAB_0801216a:
    pop        {pc}

    .align 2, 0

regionCollisionElevation:
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word 0
    .word Collide_Z_11
    .word Collide_Z_12
    .word Collide_Z_13
    .word Collide_Z_14
    .word Collide_Z_15


_ts UpdatePlayerGridPosition
    push       {lr}
    mov        r2,#0x2
    ldrsh      r1,[r0,r2]
    mov        r2,#0x6
    ldrsh      r2,[r0,r2]
    asr        r1,r1,#0x3
    asr        r2,r2,#0x3
    ldrb       r3,[r5,#0x7]
    lsr        r3,r3,#0x1
    add        r2,r2,r3
    ldrb       r3,[r5,#0x6]
    lsr        r3,r3,#0x1
    add        r1,r1,r3
    lsl        r3,r3,#0x1
    mul        r2,r3
    add        r2,r2,r1
    strh       r2,[r5,#0x8]
    mov        r2,#0x2
    ldrsh      r1,[r0,r2]
    mov        r2,#0x6
    ldrsh      r2,[r0,r2]
    mov        r3,#0x7
    bic        r1,r3
    str        r1,[r5,#0xc]
    bic        r2,r3
    str        r2,[r5,#0x10]
    ldrh       r1,[r5,#0x8]
    pop        {pc}


_ts Map_SetSubPosition
    push       {lr}
    add        r6,r0,#0x0
    ldr        r0,PTR_gMapSegPos_0801225c
    ldr        r2,[r5,#0xc]
    lsl        r2,r2,#0x1
    ldr        r5,[r5,#0x10]
    lsl        r5,r5,#0x1
    ldr        r7,[r6,#0x0]
    asr        r7,r7,#0xf
    sub        r7,r7,r2
    str        r7,[r0,#0x0]
    ldr        r7,[r6,#0x4]
    asr        r7,r7,#0xf
    sub        r7,r7,r5
    str        r7,[r0,#0x4]
    ldr        r7,[r6,#0xc]
    asr        r7,r7,#0xf
    sub        r7,r7,r2
    str        r7,[r0,#0xc]
    ldr        r7,[r6,#0x10]
    asr        r7,r7,#0xf
    sub        r7,r7,r5
    str        r7,[r0,#0x10]
    pop        {pc}


_ts Elevation_GetWallParams
    push       {lr}
    ldr        r5,PTR_gCurMapElevationData_08012260
    cmp        r0,#0x1
    beq        LAB_08012236
    b          LAB_08012242
    @ If 1 is passed in:
    @ r0 = zCoord
    @ r1 = zRange
    @ r3 = attrib
LAB_08012236:
    ldr        r2,[r5,#0x14]
    mov        r0,#0x0
    ldrsb      r0,[r2,r0]
    ldrb       r1,[r2,#0x2]
    ldrb       r3,[r2,#0x1]
    pop        {pc}
    @ If 1 isn't passed in:
    @ r0 = zCoord
    @ r3 = attrib
LAB_08012242:
    ldr        r2,[r5,#0x14]
    mov        r0,#0x0
    ldrsb      r0,[r2,r0]
    ldrb       r3,[r2,#0x1]
    pop        {pc}

    .align 2, 0

PTR_gCurMapElevationData_0801224c:      .word gCurMapElevationData
PTR_gCurMapElevationData_08012250:      .word gCurMapElevationData
PTR_gCurPlayerPos_08012254:             .word gCurPlayerPos
PTR_regionCollisionElevation_08012258:  .word regionCollisionElevation
PTR_gMapSegPos_0801225c:                .word gMapSegPos
PTR_gCurMapElevationData_08012260:      .word gCurMapElevationData


_ts dummy_12264
    push       {lr}
    mov        r0,#0x0
    pop        {pc}


_ts Collide_Z_11
    push       {lr}
    mov        r0,#0x1
    bl         Elevation_GetWallParams
    add        r0,r0,r1
    mov        r1,#0x0
    pop        {pc}


_ts Collide_Z_12
    push       {lr}
    bl         Map_SetSubPosition
    push       {r0}
    mov        r0,#0x1
    bl         Elevation_GetWallParams
    add        r0,r0,r1
    lsl        r0,r0,#0x1
    pop        {r1}
    ldr        r2,[r1,#0x0]
    asr        r2,r3
    sub        r0,r0,r2
    asr        r0,r0,#0x1
    mov        r1,#0x2
    lsr        r1,r3
    pop        {pc}


_ts Collide_Z_13
    push       {lr}
    bl         Map_SetSubPosition
    push       {r0}
    mov        r0,#0x1
    bl         Elevation_GetWallParams
    add        r0,r0,r1
    mov        r1,#0x8
    asr        r1,r3
    sub        r0,r0,r1
    lsl        r0,r0,#0x1
    pop        {r1}
    ldr        r2,[r1,#0x0]
    asr        r2,r3
    add        r0,r0,r2
    asr        r0,r0,#0x1
    mov        r1,#0x2
    lsr        r1,r3
    pop        {pc}


_ts Collide_Z_14
    push       {lr}
    bl         Map_SetSubPosition
    push       {r0}
    mov        r0,#0x1
    bl         Elevation_GetWallParams
    add        r0,r0,r1
    lsl        r0,r0,#0x1
    pop        {r1}
    ldr        r2,[r1,#0x4]
    asr        r2,r3
    sub        r0,r0,r2
    asr        r0,r0,#0x1
    mov        r1,#0x2
    lsr        r1,r3
    pop        {pc}


_ts Collide_Z_15
    push       {lr}
    bl         Map_SetSubPosition
    push       {r0}
    mov        r0,#0x1
    bl         Elevation_GetWallParams
    add        r0,r0,r1
    mov        r1,#0x8
    asr        r1,r3
    sub        r0,r0,r1
    lsl        r0,r0,#0x1
    pop        {r1}
    ldr        r2,[r1,#0x4]
    asr        r2,r3
    add        r0,r0,r2
    asr        r0,r0,#0x1
    mov        r1,#0x2
    lsr        r1,r3
    pop        {pc}


_ts Map_InitCover
    ldr        r5,PTR_gCurMapCoverData_080123d8
    ldr        r1,[r0,#0x0]
    strh       r1,[r5,#0x4]
    add        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r1,r10
    ldr        r1,[r1,#0x44]
    ldrb       r0,[r1,#0x0]
    strb       r0,[r5,#0x6]
    ldrb       r0,[r1,#0x1]
    strb       r0,[r5,#0x7]
    mov        pc,lr


_ts Map_HandleCollisionCover
    push       {lr}
    ldr        r5,PTR_gCurMapCoverData_080123dc
    ldr        r2,PTR_gCurPlayerPos_080123e0
    str        r0,[r2,#0x0]
    bl         UpdatePlayerGridPosition
    bl         GetWallSegmentByIndex
    cmp        r2,#0x0
    beq        LAB_08012378
LAB_08012340:
    ldrh       r4,[r2,#0x0]
    cmp        r1,r4
    bne        LAB_08012378
    ldrh       r7,[r2,#0x2]
    ldr        r4,[r5,#0x0]
    add        r7,r7,r4
    mov        r4,#0x0
    ldrsb      r4,[r7,r4]
    mov        r6,#0xa
    ldrsh      r6,[r0,r6]
    cmp        r6,r4
    blt        LAB_08012362
    ldrb       r3,[r7,#0x2]
    add        r4,r4,r3
    cmp        r6,r4
    bgt        LAB_08012362
    b          LAB_08012366
LAB_08012362:
    add        r2,#0x4
    b          LAB_08012340
LAB_08012366:
    str        r7,[r5,#0x14]
    ldrb       r6,[r7,#0x3]
    lsl        r6,r6,#0x2
    ldr        r4,PTR_regionCollisionCovers_080123e4
    add        r4,r4,r6
    ldr        r4,[r4,#0x0]
    mov        lr,pc
    bx         r4
    b          LAB_0801237a
LAB_08012378:
    mov        r0,#0x1
LAB_0801237a:
    pop        {pc}

    .align 2, 0

regionCollisionCovers:
    .word 0
    .word Collide_C_01
    .word Collide_C_02
    .word Collide_C_03
    .word Collide_C_04
    .word 0
    .word 0
    .word 0
    .word 0
    .word Collide_C_09
    .word Collide_C_0A
    .word Collide_C_0B
    .word Collide_C_0C
    .word 0
    .word 0
    .word 0
    .word 0
    .word Collide_C_11


_ts GetCoverSpritePriority
    push       {lr}
    ldr        r5,PTR_gCurMapCoverData_080123e8
    cmp        r0,#0x1
    beq        LAB_080123ce
    b          LAB_080123d2
LAB_080123ce:
    mov        r0,#0x2
    pop        {pc}
LAB_080123d2:
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0

PTR_gCurMapCoverData_080123d8:      .word gCurMapCoverData
PTR_gCurMapCoverData_080123dc:      .word gCurMapCoverData
PTR_gCurPlayerPos_080123e0:         .word gCurPlayerPos
PTR_regionCollisionCovers_080123e4: .word regionCollisionCovers
PTR_gCurMapCoverData_080123e8:      .word gCurMapCoverData


_ts dummy_123ec
    push       {lr}
    mov        r0,#0x0
    pop        {pc}


_ts Collide_C_01
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x4
    mov        r4,#0x0
    mov        r3,#0x4
    mov        r5,#0x10
    bl         Boundary_IsAbove_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_02
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x8
    mov        r4,#0x0
    mov        r3,#0x8
    mov        r5,#0x10
    bl         Boundary_IsBelow_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_03
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x8
    mov        r3,#0x10
    mov        r5,#0x8
    bl         Boundary_IsBelow_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_04
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0xc
    mov        r3,#0x10
    mov        r5,#0xc
    bl         Boundary_IsAbove_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_09
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x10
    mov        r3,#0x10
    mov        r5,#0x0
    bl         Boundary_IsAbove
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_0A
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r3,#0x10
    mov        r5,#0x10
    bl         Boundary_IsAbove_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_0B
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r3,#0x10
    mov        r5,#0x10
    bl         Boundary_IsBelow_2
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_0C
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x10
    mov        r3,#0x10
    mov        r5,#0x0
    bl         Boundary_IsBelow
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Collide_C_11
    push       {lr}
    mov        r0,#0x1
    bl         GetCoverSpritePriority
    pop        {pc}


_ts Map_InitEvent
    ldr        r5,PTR_gCurMapEventData_080125a8
    ldr        r1,[r0,#0x0]
    strh       r1,[r5,#0x4]
    add        r0,#0x4
    str        r0,[r5,#0x0]
    mov        r1,r10
    ldr        r1,[r1,#0x44]
    ldrb       r0,[r1,#0x0]
    strb       r0,[r5,#0x6]
    ldrb       r0,[r1,#0x1]
    strb       r0,[r5,#0x7]
    mov        pc,lr


_ts Map_HandleCollisionEvent
    push       {lr}
    ldr        r5,PTR_gCurMapEventData_080125ac
    ldr        r2,PTR_gCurPlayerPos_080125b0
    str        r0,[r2,#0x0]
    bl         UpdatePlayerGridPosition
    bl         GetWallSegmentByIndex
    cmp        r2,#0x0
    beq        LAB_08012544
LAB_080124ec:
    ldrh       r4,[r2,#0x0]
    cmp        r1,r4
    bne        LAB_08012544
    ldrh       r7,[r2,#0x2]
    ldr        r4,[r5,#0x0]
    add        r7,r7,r4
    mov        r4,#0x0
    ldrsb      r4,[r7,r4]
    mov        r6,#0xa
    ldrsh      r6,[r0,r6]
    cmp        r6,r4
    blt        LAB_0801250e
    ldrb       r3,[r7,#0x2]
    add        r4,r4,r3
    cmp        r6,r4
    bgt        LAB_0801250e
    b          LAB_08012512
LAB_0801250e:
    add        r2,#0x4
    b          LAB_080124ec
LAB_08012512:
    str        r7,[r5,#0x14]
    ldrb       r6,[r7,#0x3]
    lsl        r6,r6,#0x2
    ldr        r4,PTR_handlerCollisionShapeEvents_080125b4
    add        r4,r4,r6
    ldr        r4,[r4,#0x0]
    push       {r0,r1,r2}
    mov        lr,pc
    bx         r4
    add        r3,r0,#0x0
    tst        r0,r0
    pop        {r0,r1,r2}
    beq        LAB_0801250e
    add        r0,r3,#0x0
    add        r1,r3,#0x0
    cmp        r0,#0xf
    bgt        LAB_08012548
    push       {r0,r1,r5}
    sub        r0,#0x1
    bl         Flag_Get410
    pop        {r0,r1,r5}
    bne        LAB_08012548
    mov        r0,#0x0
    b          LAB_08012548
LAB_08012544:
    mov        r0,#0x0
    mov        r1,#0x0
LAB_08012548:
    pop        {pc}

    .align 2, 0

handlerCollisionShapeEvents:
    .word 0
    .word Collide_E_01
    .word Collide_E_02
    .word Collide_E_03
    .word Collide_E_04
    .word 0
    .word 0
    .word 0
    .word 0
    .word Collide_E_09
    .word Collide_E_0A
    .word Collide_E_0B
    .word Collide_E_0C
    .word 0
    .word 0
    .word 0
    .word 0
    .word Collide_E_11


_ts Event_GetCurrWallAttribute
    push       {lr}
    ldr        r5,PTR_gCurMapEventData_080125b8
    cmp        r0,#0x1
    beq        LAB_0801259e
    b          LAB_080125a4
LAB_0801259e:
    ldr        r2,[r5,#0x14]
    ldrb       r0,[r2,#0x1]
    pop        {pc}
LAB_080125a4:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PTR_gCurMapEventData_080125a8:              .word gCurMapEventData
PTR_gCurMapEventData_080125ac:              .word gCurMapEventData
PTR_gCurPlayerPos_080125b0:                 .word gCurPlayerPos
PTR_handlerCollisionShapeEvents_080125b4:   .word handlerCollisionShapeEvents
PTR_gCurMapEventData_080125b8:              .word gCurMapEventData
    .short 0xB500
    .short 0x2000
    .short 0xBD00
    .short 0


_ts Collide_E_01
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x4
    mov        r4,#0x0
    mov        r3,#0x4
    mov        r5,#0x10
    bl         Boundary_IsAbove_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_02
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x8
    mov        r4,#0x0
    mov        r3,#0x8
    mov        r5,#0x10
    bl         Boundary_IsBelow_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_03
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x8
    mov        r3,#0x10
    mov        r5,#0x8
    bl         Boundary_IsBelow_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_04
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0xc
    mov        r3,#0x10
    mov        r5,#0xc
    bl         Boundary_IsAbove_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_09
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x10
    mov        r3,#0x10
    mov        r5,#0x0
    bl         Boundary_IsAbove
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_0A
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0x0
    mov        r3,#0x10
    mov        r5,#0x10
    bl         Boundary_IsAbove_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_0B
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x1
    mov        r4,#0x1
    mov        r3,#0x10
    mov        r5,#0x10
    bl         Boundary_IsBelow_2
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_0C
    push       {lr}
    bl         Map_SetSubPosition
    mov        r2,#0x0
    mov        r4,#0xe
    mov        r3,#0xe
    mov        r5,#0x0
    bl         Boundary_IsBelow
    bl         Event_GetCurrWallAttribute
    pop        {pc}


_ts Collide_E_11
    push       {lr}
    mov        r0,#0x1
    bl         Event_GetCurrWallAttribute
    pop        {pc}

    .align 2, 0
