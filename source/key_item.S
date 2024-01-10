
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts InitKeyItem
    push       { lr }
    ldr        r0,PTR_gKeyItemInventory_08018c80
    mov        r1,#0x60
    bl         memset0_32
    mov        r0,#Item_Armor
    mov        r1,#0x1
    bl         KeyItem_AddAmount
    pop        { pc }

_ts KeyItem_AddAmount
    ldr        r2,PTR_gKeyItemInventory_08018c84
    ldrb       r3,[r2,r0]
    cmp        r3,#0xff
    beq        LAB_08018c34
    add        r3,r3,r1
    cmp        r3,#0xff
    bgt        LAB_08018c38
    @ For successful add, set return to 0
    strb       r3,[r2,r0]
    mov        r0,#0x0
    b          KeyItem_HpMemoryRecalculate
LAB_08018c34:
    @ If item is at max, set return to 1
    mov        r0,#0x1
    b          KeyItem_HpMemoryRecalculate
LAB_08018c38:
    @ If item plus amount is greater than 255, cap at 255 and set return to 2
    mov        r3,#0xff
    strb       r3,[r2,r0]
    mov        r0,#0x2

_nt KeyItem_HpMemoryRecalculate
    add        r2,#0x40
    ldrb       r2,[r2,#0x0]
    mov        r3,#0x14
    mul        r2,r3
    mov        r3,r10
    ldr        r3,[r3,#0x8]
    mov        r4,#0x64
    @ HPMemory * 20 + 100 = Current HP
    add        r2,r2,r4
    strh       r2,[r3,#0x1e]
    strh       r2,[r3,#0x1c]
    mov        pc,lr

_ts KeyItem_SetAmount
    ldr        r2,PTR_gKeyItemInventory_08018c88
    strb       r1,[r2,r0]
    b          KeyItem_HpMemoryRecalculate

_ts KeyItem_SubtractAmount
    ldr        r2,PTR_gKeyItemInventory_08018c8c
    ldrb       r3,[r2,r0]
    cmp        r3,#0x0
    beq        LAB_08018c70
    sub        r3,r3,r1
    cmp        r3,#0x0
    blt        LAB_08018c74
    strb       r3,[r2,r0]
    mov        r0,#0x0
    mov        pc,lr
LAB_08018c70:
    mov        r0,#0x1
    mov        pc,lr
LAB_08018c74:
    mov        r0,#0x2
    mov        pc,lr

_ts KeyItem_IsPresent
    ldr        r1,PTR_gKeyItemInventory_08018c90
    ldrb       r0,[r1,r0]
    tst        r0,r0
    mov        pc,lr

PTR_gKeyItemInventory_08018c80:
    .word gKeyItemInventory
PTR_gKeyItemInventory_08018c84:
    .word gKeyItemInventory
PTR_gKeyItemInventory_08018c88:
    .word gKeyItemInventory
PTR_gKeyItemInventory_08018c8c:
    .word gKeyItemInventory
PTR_gKeyItemInventory_08018c90:
    .word gKeyItemInventory
