#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

.set Flag_SetPlayerActive, 0x8056044
.set InitStartMenuState, 0x80191c8
.set DisableScreenDim, 0x8005768
.set Inventory_InitChecksum, 0x801b0bc
.set Inventory_InitChecksumIndex, 0x801b108
.set FUN_0801f6c4, 0x801f6c4
.set ClearEmailIndexes, 0x801c54c
.set FUN_0804c60c, 0x804c60c

_ts InitWorld_LoadGame
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    mov        r0,#0x0
    ldrb       r2,[r5,#0x4]
    ldrb       r3,[r5,#0xc]
    cmp        r2,r3
    bne        LAB_08004032
    mov        r0,#0x4
LAB_08004032:
    strb       r0,[r5,#0x0]
    mov        r0,#0x3
    strb       r0,[r5,#0x7]
    mov        r0,#0x10
    strb       r0,[r5,#0x13]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0x12]
    str        r0,[r5,#0x2c]
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    mov        r0,#0xff
    strb       r0,[r5,#0x18]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    strb       r0,[r5,#0x1a]
    ldr        r1,PTR_BYTE_08004084
    strb       r0,[r1,#0x0]
    ldr        r1,PTR_gPlayerFixedAnimationState_08004080
    mov        r0,#0x0
    strb       r0,[r1,#0x0]
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    bl         InitStartMenuState
    pop        {r5}
    push       {r5}
    bl         InitChipTrader
    pop        {r5}
    ldr        r7,PTR_gIsObjectXFlipped_08004088
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    bl         DisableScreenDim
    pop        {pc}
PTR_gPlayerFixedAnimationState_08004080:
    .word gPlayerFixedAnimationState
PTR_BYTE_08004084:
    .word 0x200c51a
PTR_gIsObjectXFlipped_08004088:
    .word gIsObjectXFlipped


_ts InitWorld_NewGame
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x24]
    str        r0,[r5,#0x34]
    ldr        r0,DAT_08004118
    strh       r0,[r5,#0xc]
    mov        r0,#0x0
    str        r0,[r5,#0x74]
    ldr        r1,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r1,#0x18]
    mov        r0,#0x0
    str        r0,[r1,#0x24]
    str        r0,[r1,#0x28]
    strh       r0,[r1,#0x14]
    strh       r0,[r1,#0x16]
    str        r0,[r1,#0x0]
    strb       r0,[r1,#0x4]
    strh       r0,[r1,#0x10]
    strb       r0,[r1,#0xe]
    strb       r0,[r1,#0xd]
    strb       r0,[r1,#0xf]
    str        r0,[r1,#0x1c]
    strb       r0,[r1,#0x12]
    mov        r0,#0xa
    strb       r0,[r1,#0x5]
    ldr        r0,DAT_0800412c
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    strb       r0,[r5,#0x16]
    strb       r0,[r5,#0x17]
    push       {r5}
    bl         FUN_080102dc
    bl         InitKeyItem
    bl         FUN_0801f6c4
    bl         Inventory_InitDefaultChipFolder
    bl         Inventory_InitChecksum
    bl         Inventory_InitChecksumIndex
    bl         ClearEmailIndexes
    bl         FUN_0804c60c
    pop        {r5}
    ldr        r0,DAT_08004114
    strh       r0,[r5,#0x4]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    ldr        r6,PTR_DAT_0800411c
    ldr        r0,[r6,#0x0]
    str        r0,[r5,#0x38]
    ldr        r0,[r6,#0x4]
    str        r0,[r5,#0x3c]
    ldr        r0,[r6,#0x8]
    str        r0,[r5,#0x40]
    bl         DisableScreenDim
    pop        {pc}
DAT_08004114:
    .word 0x301
DAT_08004118:
    .word 0xFFFF
PTR_DAT_0800411c:
    .word DAT_08004120
DAT_08004120:
    .word 0x80000
DAT_08004124:
    .word 0xFFFC0000
DAT_08004128:
    .word 0
DAT_0800412c:
    .word 0x64


_ts World_Main
    push       { lr }
    ldr        r0,=jumpTableWorldMain
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Rng_RandomUint
    pop        { pc }

    .pool

jumpTableWorldMain:
    .word 0x8004174+1
    .word 0x8004194+1
    .word 0x8004210+1
    .word 0x800427c+1
    .word 0x80042ec+1
    .word 0x8004340+1
    .word 0x80043a8+1
    .word 0x80043f8+1
    .word 0x8004466+1
    .word 0x80044bc+1

    .end
