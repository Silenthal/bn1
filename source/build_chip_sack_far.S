#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_fts BuildChipSack
    push       {r5,lr}
    @@ r6 = current inventory slot
    ldr        r6,PTR_gBattleChipInventory_03007628
    @@ r0 = chip index
    mov        r0,#0x0
    mov        r1,#0x0
LAB_03007520:
    @@ r2 = chip code index for a particular chip
    mov        r2,#0x0
    mov        r8,r2
LAB_03007524:
    @@ r3 = quantity of a particular chip/code in the inventory
    ldrb       r3,[r6,#0x0]
    tst        r3,r3
    beq        LAB_030075aa
    @@ r5 = current battle chip in folder
    ldr        r5,PTR_gFolder_0300762c
    @@ r2 = current folder chip index (out of 30)
    mov        r2,#0x0
LAB_0300752e:
    @@ Compare the current inventory chip/code quantity with
    @@ the current chip in the folder until a match is made.
    @@ Once made, get chip data and store ptr in r0
    ldrb       r4,[r5,#0x0]
    cmp        r0,r4
    bne        LAB_03007552
    push       {r0}
    push       {r1,r2,r5}
    ldr        r7,PTR_BattleChip_GetChipData_03007630
    mov        lr,pc
    bx         r7
    pop        {r1,r2,r5}
    @@ r0 = chip data ptr
    mov        r4,#0x0
    @@ r4 = chip code index for a particular chip
    add        r4,r8
    @@ r4 = chip code as a value (A=0, B=1, etc.)
    ldrb       r4,[r0,r4]
    @@ Compare the code of the chip being checked to the code of
    @@ the current chip in the folder
    ldrb       r0,[r5,#0x1]
    cmp        r0,r4
    pop        {r0}
    bne        LAB_03007552
    @@ Continue if the amount of the particular chip/code
    @@ is at least 2
    sub        r3,#0x1
    ble        LAB_030075aa
LAB_03007552:
    @@ Go to the next chip in the folder (r5)
    @@ Increment folder chip index, loop if
    @@ less than 30
    add        r5,#0x2
    add        r2,#0x1
    cmp        r2,#0x1e
    blt        LAB_0300752e
    @@ Stack:
    @@ r3 = quantity of a chip code in the inventory
    push       {r3}
    mov        r2,r8
    @@ r3 = start address of the inventory slot
    sub        r3,r6,r2
    lsl        r2,r2,#0x1
    add        r2,#0x6
    @@ r3 = checksum for the specific chip code quantity
    ldrh       r3,[r3,r2]
    push       {r3}
    @@ Stack:
    @@ quantity of chip code
    @@ checksum for chip code quantity
    mov        r5,#0x0
    ldr        r7,PTR_SubMenuChipBagSlot_03007634
    mov        r9,r7
LAB_0300756e:
    @@ r1 = index of the sub menu bag being inserted into
    @@ r7 = base address of the sub menu bag slot
    @@ r5 = current bag slot index being looked at
    cmp        r5,r1
    beq        LAB_0300759a
    @@ Compare the checksum of the existing chip info to the
    @@ inserted chip - because of checksum ordering, greater
    @@ number = chip was acquired earlier
    ldrh       r2,[r7,#0x4]
    cmp        r2,r3
    bgt        LAB_0300757e
    add        r7,#0x8
    add        r5,#0x1
    b          LAB_0300756e
LAB_0300757e:
    @@ If the inserted chip was acquired later (lower # as checksum)
    @@ , perform insertion in place
    mov        r2,r9
    mov        r9,r5
    add        r5,r1,#0x0
    sub        r5,#0x1
    lsl        r3,r5,#0x3
    add        r2,r2,r3
LAB_0300758a:
    ldr        r3,[r2,#0x0]
    str        r3,[r2,#0x8]
    ldr        r3,[r2,#0x4]
    str        r3,[r2,#0xc]
    sub        r2,#0x8
    sub        r5,#0x1
    cmp        r5,r9
    bge        LAB_0300758a
LAB_0300759a:
    pop        {r2}
    pop        {r3}
    @@ r2 = checksum
    @@ r3 = quantity
    @@ 
    @@ Store the chip id, the chip code, the count,
    @@ and the checksum at the current slot
    strh       r0,[r7,#0x0]
    mov        r4,r8
    strh       r4,[r7,#0x2]
    strh       r3,[r7,#0x6]
    strh       r2,[r7,#0x4]
    add        r1,#0x1
LAB_030075aa:
    @@ Move to next chip code index within the inventory slot
    add        r6,#0x1
    mov        r2,r8
    add        r2,#0x1
    mov        r8,r2
    cmp        r2,#0x5
    blt        LAB_03007524
    @@ Move to next chip in inventory
    add        r6,#0xb
    add        r0,#0x1
    cmp        r0,#0xef
    ble        LAB_03007520
    @@ r7 = start of "chip bag slot"
    @@ r6 = start of "sub menu chip bag"
    @@ r1 = amount of chips in "sub menu chip bag"
    ldr        r7,PTR_gChipBag_03007638
    ldr        r6,PTR_SubMenuChipBagSlot_03007634
    push       {r1}
LAB_030075c4:
    cmp        r1,#0x0
    ble        LAB_03007622
    push       {r1}
    ldrh       r0,[r6,#0x0]
    push       {r0,r6,r7}
    ldr        r7,PTR_BattleChip_GetChipData_0300763c
    mov        lr,pc
    bx         r7
    pop        {r4,r6,r7}
    str        r4,[r7,#0x18]
    ldrb       r4,[r0,#0x9]
    lsl        r2,r4,#0x8
    ldrh       r3,[r6,#0x2]
    add        r3,#0x0
    ldrb       r3,[r0,r3]
    orr        r2,r3
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x8]
LAB_030075ea:
    lsl        r3,r4,#0x10
    orr        r3,r2
    str        r3,[r7,#0x0]
LAB_030075f0:
    ldrh       r3,[r6,#0x6]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x14]
    ldrb       r3,[r0,#0x9]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
    ldrh       r3,[r0,#0xc]
    lsl        r3,r3,#0x10
LAB_03007604:
    orr        r3,r2
    str        r3,[r7,#0xc]
    ldrb       r3,[r0,#0x5]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x10]
    ldrb       r3,[r0,#0xa]
    lsl        r3,r3,#0x10
    orr        r3,r2
    str        r3,[r7,#0x4]
LAB_03007618:
    pop        {r1}
    add        r6,#0x8
    add        r7,#0x20
    sub        r1,#0x1
    b          LAB_030075c4
LAB_03007622:
    pop        {r0}
    pop        {r5,pc}

    .align 2, 0


PTR_gBattleChipInventory_03007628:
    .word gBattleChipInventory

PTR_gFolder_0300762c:
    .word gFolder

PTR_BattleChip_GetChipData_03007630:
    .word BattleChip_GetChipData

PTR_SubMenuChipBagSlot_03007634:
    .word 0x2024000

PTR_gChipBag_03007638:
    .word gChipBag

PTR_BattleChip_GetChipData_0300763c:
    .word BattleChip_GetChipData

    @@ Everything after here isn't copied to RAM
    bge        LAB_03007618
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    mov        r0,sp
    ldmia      r0!,{r2,r3,r7}
    stmia      r1!,{r2,r3,r7}
    ldmia      r0!,{r4,r6,r7}
    stmia      r1!,{r4,r6,r7}
    ldmia      r0!,{r2,r3}
    stmia      r1!,{r2,r3}
    mov        r2,r12
    cmp        r2,r8
    blt        LAB_030075f0
    add        r0,r5,#0x0
    mov        r1,#0x3
    ldr        r5,DAT_0300771c
    mov        lr,pc
    bx         r5
    add        r5,r0,#0x0
    cmp        r0,#0x0
    bgt        LAB_030075ea
    add        sp,#0x24
    pop        {r0,r7}
    mov        r10,r0
    mov        pc,r7

_ts FUN_03007674
    mov        r7,r10
    push       {r7,lr}
    sub        sp,#0x24
    mov        r10,r0
    mov        r8,r1
    mov        r9,r2
    mov        r5,#0x1
    cmp        r5,r8
    bgt        LAB_03007704
LAB_03007686:
    lsl        r0,r5,#0x1
LAB_03007688:
    add        r0,r0,r5
    add        r5,r0,#0x1
    cmp        r5,r8
    ble        LAB_03007686
    b          LAB_03007704
LAB_03007692:
    add        r2,r0,#0x0
    cmp        r2,r8
    bge        LAB_03007704
LAB_03007698:
    lsl        r1,r2,#0x5
    mov        r0,sp
    add        r1,r10
    ldmia      r1!,{r3,r4,r6}
    stmia      r0!,{r3,r4,r6}
    ldmia      r1!,{r3,r4,r7}
    stmia      r0!,{r3,r4,r7}
    ldmia      r1!,{r6,r7}
    stmia      r0!,{r6,r7}
    sub        r3,r2,r5
    add        r2,#0x1
    mov        r12,r2
    cmp        r3,#0x0
    blt        LAB_030076ea
    mov        r0,r9
    lsl        r4,r0,#0x2
    mov        r1,sp
    add        r0,r4,r1
    ldr        r0,[r0,#0x0]
    str        r0,[sp,#0x20]
LAB_030076c0:
    lsl        r0,r3,#0x5
    mov        r6,r10
    add        r2,r0,r6
    add        r0,r4,r2
    ldr        r0,[r0,#0x0]
    ldr        r7,[sp,#0x20]
    cmp        r0,r7
    bge        LAB_030076ea
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    add        r0,r2,#0x0
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6,r7}
    stmia      r1!,{r2,r6,r7}
    ldmia      r0!,{r2,r6}
    stmia      r1!,{r2,r6}
    sub        r3,r3,r5
    cmp        r3,#0x0
    bge        LAB_030076c0
LAB_030076ea:
    add        r1,r3,r5
    lsl        r1,r1,#0x5
    add        r1,r10
    mov        r0,sp
    ldmia      r0!,{r2,r3,r7}
    stmia      r1!,{r2,r3,r7}
    ldmia      r0!,{r4,r6,r7}
    stmia      r1!,{r4,r6,r7}
    ldmia      r0!,{r2,r3}
    stmia      r1!,{r2,r3}
    mov        r2,r12
    cmp        r2,r8
    blt        LAB_03007698
LAB_03007704:
    add        r0,r5,#0x0
    mov        r1,#0x3
    ldr        r5,DAT_03007720
    mov        lr,pc
    bx         r5
    add        r5,r0,#0x0
    cmp        r0,#0x0
    bgt        LAB_03007692
    add        sp,#0x24
    pop        {r0,r7}
    mov        r10,r0
    mov        pc,r7

DAT_0300771c:
    .word 0x8075F99

DAT_03007720:
    .word 0x8075F99
    push       {lr}
    mov        r1,#0x4
LAB_03007728:
    mov        r0,#0x7
LAB_0300772a:
    bl         FUN_03007738
    sub        r0,#0x1
    bpl        LAB_0300772a
    sub        r1,#0x1
    bpl        LAB_03007728
    pop        {pc}
