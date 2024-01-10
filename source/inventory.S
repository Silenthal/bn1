#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

    .set Inventory_SetChecksum, 0x801b0d4
    .set FUN_0801b0f0, 0x801b0f0


@ Part of a prior function
    pop        { pc }

_nt Inventory_AddChip
    push       { lr }
    push       { r0, r1, r2 }
    bl         Flag_SetLibrary
    pop        { r0, r1, r2 }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    mov        r3,#0x1
    ldrb       r1,[r0,#0x0]
    cmp        r1,#0x63
    beq        LAB_08009bc8
    mov        r3,#0x0
    add        r1,r1,r2
    cmp        r1,#0x63
    ble        LAB_08009bc8
    mov        r1,#0x63
    mov        r3,#0x2
LAB_08009bc8:
    strb       r1,[r0,#0x0]
    push       { r3 }
    bl         Inventory_SetChecksum
    pop        { r3 }
    add        r0,r3,#0x0
    pop        { pc }

_nt Inventory_SetChip
    push       { lr }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    str        r2,[r0,#0x0]
    tst        r2,r2
    bne        LAB_08009bea
    bl         Inventory_SetChecksum
LAB_08009bea:
    pop        { pc }

_ts Inventory_SubtractChip
    push       { lr }
    push       { r2 }
    bl         Inventory_GetChipCountLocation
    pop        { r2 }
    mov        r3,#0x1
    ldrb       r1,[r0,#0x0]
    tst        r1,r1
    beq        LAB_08009bc8
    mov        r3,#0x0
    sub        r1,r1,r2
    bpl        LAB_08009c08
    mov        r3,#0x2
    add        r1,r1,r2
LAB_08009c08:
    strb       r1,[r0,#0x0]
    tst        r1,r1
    bne        LAB_08009c16
    push       { r3 }
    bl         FUN_0801b0f0
    pop        { r3 }
LAB_08009c16:
    add        r0,r3,#0x0
    pop        { pc }


@@ Gets the location of the amount of the battle chip specified, from the battle chip inventory.
@@ In:
@@ r0: chipID - The chip ID to check.
@@ r1: chipCode - The chip code to check.
@@
@@ Out:
@@ r0: chipCountLoc - The memory location containing the amount of the chip specified.
_nt Inventory_GetChipCountLocation
    push       { lr }
    add        r2,r0,#0x0
    push       { r1, r2 }
    bl         BattleChip_GetChipData
    pop        { r1, r2 }
    add        r0,#0x0
    mov        r3,#0x0
1: @ Code checking loop
    ldrb       r4,[r0,r3]
    cmp        r1,r4
    beq        2f
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        1b
    mov        r3,#0x0
2: @ Code found
    ldr        r7,PTR_gBattleChipInventory_08009c44
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    add        r0,r7,r3
    pop        { pc }

    .align 2, 0
PTR_gBattleChipInventory_08009c44:
    .word gBattleChipInventory


@@ Gets the location of the amount of the battle chip specified, from the battle chip inventory.
@@ In:
@@ r0: chipID - The chip ID to check.
@@ r1: chipCode - The chip code to check.
@@
@@ Out:
@@ r0: chipCountLoc - The memory location containing the checksum for the specified chip.
_ts Inventory_GetChipCountChecksum
    push       { lr }
    add        r2,r0,#0x0
    push       { r1, r2 }
    bl         BattleChip_GetChipData
    pop        { r1, r2 }
    add        r0,#0x0
    mov        r3,#0x0
1:
    ldrb       r4,[r0,r3]
    cmp        r1,r4
    beq        2f
    add        r3,#0x1
    cmp        r3,#0x5
    bmi        1b
    mov        r3,#0x0
2:
    ldr        r7,PTR_gBattleChipInventory_08009c74
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    lsl        r3,r3,#0x1
    add        r3,#0x6
    add        r0,r7,r3
    pop        { pc }
PTR_gBattleChipInventory_08009c74:
    .word gBattleChipInventory

_ts Inventory_GetChipCount
    push       { lr }
    bl         Inventory_GetChipCountLocation
    ldrb       r0,[r0,#0x0]
    pop        { pc }

_nt Inventory_AddZenny
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r1,[r7,#0x74]
    add        r0,r0,r1
    ldr        r1,maxZenny
    cmp        r0,r1
    ble        LAB_08009c94
    add        r0,r1,#0x0
LAB_08009c94:
    str        r0,[r7,#0x74]
    pop        { pc }
maxZenny:
    .word 999999

_ts Inventory_SubtractZenny
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r1,[r7,#0x74]
    sub        r1,r1,r0
    bpl        LAB_08009c94
    mov        r1,#0x0
    str        r1,[r7,#0x74]
    pop        { pc }

    @ Part of following function
    sub        r0,#0x1
    .end
