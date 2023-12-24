#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .thumb


thumb_func_start Entity_AllocList
Entity_AllocList:
    push       {lr}
    add        r7,r0,#0x0
    mov        r4,#0x0
LAB_080029be:
    ldr        r0,PTR_listEntityAlloc_08002afc
    ldrb       r1,[r7,#0x0]
    cmp        r1,#0xff
    beq        LAB_080029e6
    lsl        r1,r1,#0x2
    ldr        r6,[r0,r1]
    push       {r4,r7}
    ldrb       r0,[r7,#0x1]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    ldr        r4,[r7,#0x10]
    mov        lr,pc
    bx         r6
    pop        {r4,r7}
    tst        r5,r5
    beq        LAB_080029e2
    add        r4,#0x1
LAB_080029e2:
    add        r7,#0x14
    b          LAB_080029be
LAB_080029e6:
    add        r0,r4,#0x0
    pop        {pc}
thumb_func_end Entity_AllocList


thumb_func_start Entity_FreeAllMultiple
Entity_FreeAllMultiple:
    push       {lr}
    ldr        r1,PTR_listEntityFree_08002b00
    ldr        r2,PTR_listEntityList_08002b04
    ldr        r3,PTR_listFlagSet_08002b08
    ldr        r4,PTR_INT_08002b0c
LAB_080029f6:
    mov        r5,#0x0
    cmp        r0,r5
    beq        LAB_08002a3a
    mov        r5,#0x1
    and        r5,r0
    beq        LAB_08002a2e
    push       {r0}
    ldr        r0,[r2,#0x0]
    ldr        r5,DAT_08002b10
    ldr        r6,[r3,#0x0]
    ldr        r6,[r6,#0x0]
LAB_08002a0c:
    tst        r6,r5
    beq        LAB_08002a1c
    push       {r0,r1,r2,r3,r4,r5,r6}
    ldr        r7,[r1,#0x0]
    add        r5,r0,#0x0
    mov        lr,pc
    bx         r7
    pop        {r0,r1,r2,r3,r4,r5,r6}
LAB_08002a1c:
    mov        r7,#0x0
    bic        r6,r5
    lsr        r5,r5,#0x1
    cmp        r6,r7
    beq        LAB_08002a2c
    ldr        r7,[r4,#0x0]
    add        r0,r0,r7
    b          LAB_08002a0c
LAB_08002a2c:
    pop        {r0}
LAB_08002a2e:
    lsr        r0,r0,#0x1
    add        r1,#0x4
    add        r2,#0x4
    add        r3,#0x4
    add        r4,#0x4
    b          LAB_080029f6
LAB_08002a3a:
    pop        {pc}
thumb_func_end Entity_FreeAllMultiple


@@ Converts a set of center origin coordinates to top left
@@ origin coordinates.                                              
@@ In:
@@ stack[0]: relative X
@@ stack[1]: relative Y
@@ stack[2]: relative Y offset
@@ Out:
@@ r0: X: -120 to 136
@@ r1: Y: -80 to 112
@@ r2: isDraw: True if the given position is on screen
thumb_func_start ConvertToObjectPosition
ConvertToObjectPosition:
    push       {lr}
    mov        r3,r10
    ldr        r3,[r3,#0x14]
    mov        r2,#0x2
    ldrsh      r1,[r0,r2]
    ldr        r4,[r3,#0x38]
    asr        r4,r4,#0x10
    sub        r1,r1,r4
    ldr        r6,PTR_gIsObjectXFlipped_08002b14
        ldrb       r6,[r6,#0x0]
        tst        r6,r6
    beq        LAB_08002a56
    neg        r1,r1
LAB_08002a56:
    add        r1,#120
    mov        r2,#0x6
    ldrsh      r6,[r0,r2]
    ldr        r4,[r3,#0x3c]
    asr        r4,r4,#0x10
    sub        r6,r6,r4
    add        r6,#0x50
    mov        r2,#0xa
    ldrsh      r4,[r0,r2]
    ldr        r2,[r3,#0x40]
    asr        r2,r2,#0x10
    sub        r4,r4,r2
    sub        r6,r6,r4
    ldr        r2,DAT_08002b18
    cmp        r1,r2
    blt        LAB_08002a90
    ldr        r2,DAT_08002b1c
    cmp        r1,r2
    bge        LAB_08002a90
    ldr        r2,DAT_08002b18
    cmp        r6,r2
    blt        LAB_08002a90
    mov        r2,#224
    cmp        r6,r2
    bge        LAB_08002a90
    add        r0,r1,#0x0
    add        r1,r6,#0x0
    mov        r2,#0x1
    pop        {pc}
LAB_08002a90:
    mov        r0,#0xa0
    mov        r1,#0x50
    mov        r2,#0x0
    pop        {pc}
thumb_func_end ConvertToObjectPosition


thumb_func_start FUN_08002a98
FUN_08002a98:
    push       {lr}
    mov        r3,r10
    ldr        r3,[r3,#0x14]
    ldr        r1,[r0,#0x0]
    asr        r1,r1,#0xf
    ldr        r4,[r3,#0x38]
    asr        r4,r4,#0xf
    sub        r1,r1,r4
    ldr        r6,[r0,#0x4]
    asr        r6,r6,#0xf
    ldr        r4,[r3,#0x3c]
    asr        r4,r4,#0xf
    sub        r6,r6,r4
    add        r7,r6,#0x0
    mov        r8,r1
    add        r1,r1,r6
    asr        r1,r1,#0x1
    add        r1,#0x78
    add        r6,r7,#0x0
    mov        r2,r8
    sub        r6,r6,r2
    asr        r6,r6,#0x2
    ldr        r4,[r0,#0x8]
    asr        r4,r4,#0x10
    sub        r6,r6,r4
    ldr        r2,[r3,#0x40]
    asr        r2,r2,#0x10
    add        r6,r6,r2
    add        r6,#0x52
    ldr        r2,DAT_08002b18
    cmp        r1,r2
    blt        LAB_08002af2
    ldr        r2,DAT_08002b1c
    cmp        r1,r2
    bge        LAB_08002af2
    ldr        r2,DAT_08002b18
    cmp        r6,r2
    blt        LAB_08002af2
    mov        r2,#0xe0
    cmp        r6,r2
    bge        LAB_08002af2
    add        r0,r1,#0x0
    add        r1,r6,#0x0
    mov        r2,#0x1
    pop        {pc}
LAB_08002af2:
    mov        r0,#0xa0
    mov        r1,#0x50
    mov        r2,#0x0
    pop        {pc}
thumb_func_end FUN_08002a98

    .align 2, 0
PTR_listEntityAlloc_08002afc:   .word listEntityAlloc
PTR_listEntityFree_08002b00:    .word listEntityFree
PTR_listEntityList_08002b04:    .word listEntityList
PTR_listFlagSet_08002b08:       .word listFlagSet
PTR_INT_08002b0c:               .word INT_08002324
DAT_08002b10:                   .word 0x80000000
PTR_gIsObjectXFlipped_08002b14: .word gIsObjectXFlipped
DAT_08002b18:                   .word 0xFFFFFFE0
DAT_08002b1c:                   .word 0x110
