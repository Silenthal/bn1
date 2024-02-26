#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set InitMapElevationData, 0x80120f0
    .set InitMapCoverData, 0x8012314
    .set InitMapEventData, 0x80124c0

    .set PTR_08013364, 0x8013364
    .set gDecompDest, 0x2033000
    .set gCurMapBoundaryData, 0x20070e0
    .set PTR_0200c230, 0x200c230

    .text

    .thumb

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
    bl         InitMapBoundaryData
    ldr        r0,[r6,#0x4]
    add        r0,r0,r7
    bl         InitMapElevationData
    ldr        r0,[r6,#0x8]
    add        r0,r0,r7
    bl         InitMapCoverData
    ldr        r0,[r6,#0xc]
    add        r0,r0,r7
    bl         InitMapEventData
    pop        { pc }

_ts InitMapBoundaryData
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

_ts FUN_08011620
    push       { lr }
    ldr        r5,PTR_gCurMapBoundaryData_080118d0
    ldr        r2,PTR_PTR_080118d4
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
    bl         FUN_0801176c
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
    ldr        r0,PTR_PTR_080118dc
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

_ts FUN_0801176c
    push       { lr }
    push       { r0, r5 }
    mov        r2,#0xe
    ldrsh      r4,[r0,r2]
    mov        r2,#0x12
    ldrsh      r7,[r0,r2]
    bl         FUN_08011864
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
    bl         FUN_08011864
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
    bl         FUN_08011864
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
    bl         FUN_08011864
    b          LAB_08011844
LAB_08011852:
    pop        { r0, r5 }
    mov        r2,#0x2
    ldrsh      r4,[r0,r2]
    mov        r2,#0x6
    ldrsh      r7,[r0,r2]
    bl         FUN_08011864
    pop        { pc }

_ts FUN_08011864
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
lz_pointer_c:
    .word bgPropDir_Offline
lz_pointer_b:
    .word bgPropDir_Online
lz_pointer_a:
    .word PTR_08013364
PTR_gDecompDest_080118c8:
    .word gDecompDest
PTR_gCurMapBoundaryData_080118cc:
    .word gCurMapBoundaryData
PTR_gCurMapBoundaryData_080118d0:
    .word gCurMapBoundaryData
PTR_PTR_080118d4:
    .word PTR_0200c230
PTR_regionCollisionBoundary_080118d8:
    .word regionCollisionBoundary
PTR_PTR_080118dc:
    .word PTR_0200c230
PTR_gCurMapBoundaryData_080118e0:
    .word gCurMapBoundaryData

    .end
