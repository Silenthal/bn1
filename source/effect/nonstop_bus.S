#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Nonstop_Bus
    push       {lr}
    ldr        r0,PTR_PTR_E_Nonstop_Bus_0_Init_0807f5e0
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Nonstop_Bus_0_Init_0807f304:
    .word E_Nonstop_Bus_0_Init
    .word E_Nonstop_Bus_1_Main
    .word E_Nonstop_Bus_2_Free


_ts E_Nonstop_Bus_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    ldr        r1,DAT_0807f5e4
    mov        r0,#0x1
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    ldrb       r1,[r5,#0x6]
    cmp        r1,#0x5
    bne        LAB_0807f33e
    mov        r0,#0x1
    bl         SpritePtr_SetPriority
    b          LAB_0807f34e
LAB_0807f33e:
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
LAB_0807f34e:
    Flag_ClearBase 0xB2
    ldr        r0,DAT_0807f5e8
    str        r0,[r5,#0x68]
    mov        r0,#0x8
    str        r0,[r5,#0x74]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x1
    bne        LAB_0807f378
    mov        r0,#0x30
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x60]
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    str        r0,[r5,#0x70]
    mov        r0,#0x2
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x6c]
    b          LAB_0807f402
LAB_0807f378:
    cmp        r0,#0x2
    bne        LAB_0807f392
    mov        r0,#0x30
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x6c]
    mov        r0,#0x2
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x70]
    b          LAB_0807f402
LAB_0807f392:
    cmp        r0,#0x5
    bne        LAB_0807f3b0
    mov        r0,#0x37
    str        r0,[r5,#0x7c]
    mov        r0,#0x20
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x60]
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    str        r0,[r5,#0x70]
    mov        r0,#0x2
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x6c]
    b          LAB_0807f402
LAB_0807f3b0:
    cmp        r0,#0x7
    bne        LAB_0807f3ca
    mov        r0,#0x30
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x6c]
    mov        r0,#0x2
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x70]
    b          LAB_0807f402
LAB_0807f3ca:
    mov        r0,#0xaf
    ldrb       r1,[r5,#0x6]
    cmp        r1,#0x3
    beq        LAB_0807f3d4
    ldr        r0,DAT_0807f5ec
LAB_0807f3d4:
    str        r0,[r5,#0x68]
    ldrb       r1,[r5,#0x6]
    cmp        r1,#0x6
    beq        LAB_0807f3f6
    mov        r0,#0x8
    str        r0,[r5,#0x74]
    mov        r0,#0x8
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x64]
    mov        r0,#0x1
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x70]
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x6c]
    b          LAB_0807f402
LAB_0807f3f6:
    mov        r0,#0x0
    str        r0,[r5,#0x74]
    str        r0,[r5,#0x64]
    str        r0,[r5,#0x70]
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x6c]
LAB_0807f402:
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xb]
    pop        {pc}


_nt E_Nonstop_Bus_1_Main
    push       {lr}
    ldr        r0,[r5,#0x68]
    ldr        r1,DAT_0807f5ec
    cmp        r0,r1
    beq        LAB_0807f424
    sub        r0,#0x1
    str        r0,[r5,#0x68]
    bne        LAB_0807f424
    mov        r0,#0x2
    strb       r0,[r5,#0x8]
    b          LAB_0807f48e
LAB_0807f424:
    Flag_GetBase 0xB2
    beq        LAB_0807f47e
    ldrb       r0,[r5,#0x9]
    tst        r0,r0
    bne        LAB_0807f452
    mov        r0,#0x1
    strb       r0,[r5,#0x9]
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    push       {r5}
    ldrh       r1,[r5,#0x2a]
    ldrh       r2,[r5,#0x2e]
    ldrh       r3,[r5,#0x32]
    ldr        r4,[r5,#0x14]
    mov        r6,#0x1
    and        r4,r6
    bl         Effect_ElectricField_Create
    add        r6,r5,#0x0
    pop        {r5}
    str        r6,[r5,#0x78]
LAB_0807f452:
    ldr        r0,[r5,#0x74]
    tst        r0,r0
    beq        LAB_0807f46c
    sub        r0,#0x1
    str        r0,[r5,#0x74]
    ldr        r1,[r5,#0x60]
    ldr        r0,[r5,#0x6c]
    add        r1,r1,r0
    str        r1,[r5,#0x60]
    ldr        r1,[r5,#0x64]
    ldr        r0,[r5,#0x70]
    add        r1,r1,r0
    str        r1,[r5,#0x64]
LAB_0807f46c:
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x60]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x64]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    b          LAB_0807f48e
LAB_0807f47e:
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x60]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x64]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
LAB_0807f48e:
    Flag_GetBase 0xB2
    beq        LAB_0807f4be
    ldrb       r0,[r5,#0xa]
    add        r0,#0x1
    strb       r0,[r5,#0xa]
    mov        r1,#0x4
    and        r0,r1
    beq        LAB_0807f4aa
    mov        r0,#0x1
    bl         SpritePtr_SetPaletteIndex
    b          LAB_0807f4b0
LAB_0807f4aa:
    mov        r0,#0x0
    bl         SpritePtr_SetPaletteIndex
LAB_0807f4b0:
    ldr        r4,[r5,#0x78]
    ldr        r0,[r5,#0x28]
    str        r0,[r4,#0x28]
    ldr        r0,[r5,#0x2c]
    str        r0,[r4,#0x2c]
    ldr        r0,[r5,#0x30]
    str        r0,[r4,#0x30]
LAB_0807f4be:
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x5
    bne        LAB_0807f52e
    Flag_GetBase 0xB2
    beq        LAB_0807f52e
    ldr        r0,[r5,#0x7c]
    sub        r0,#0x1
    str        r0,[r5,#0x7c]
    tst        r0,r0
    bne        LAB_0807f52e
    ldrb       r0,[r5,#0xb]
    cmp        r0,#0x0
    bne        LAB_0807f508
    mov        r0,#0x1
    strb       r0,[r5,#0xb]
    mov        r0,#0x5a
    str        r0,[r5,#0x7c]
    mov        r0,#0x8
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x70]
    ldrb       r0,[r5,#0x14]
    cmp        r0,#0x6
    beq        LAB_0807f52e
    mov        r0,#0x6
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    b          LAB_0807f52e
LAB_0807f508:
    mov        r0,#0x5a
    str        r0,[r5,#0x7c]
    mov        r0,#0x10
    neg        r0,r0
    lsl        r0,r0,#0xc
    str        r0,[r5,#0x64]
    mov        r0,#0x0
    str        r0,[r5,#0x60]
    str        r0,[r5,#0x6c]
    str        r0,[r5,#0x70]
    ldrb       r0,[r5,#0x14]
    cmp        r0,#0x7
    beq        LAB_0807f52e
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_0807f52e:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_Nonstop_Bus_2_Free
    bl         Effect_Free
    pop        {pc}


_nt FUN_0807f53a
    push       {lr}
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_0807f5f0
    mov        r2,#0x8
    mul        r2,r7
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r4,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x1f
    bl         Effect_Alloc
    ldrb       r1,[r5,#0x4]
    strb       r1,[r5,#0x14]
    mov        r1,#0x0
    strb       r1,[r5,#0x5]
    pop        {pc}

    .align 2, 0


USHORT_ARRAY_ARRAY_0807f564:
    .short 0xFF5E
    .short 0xE
    .short 0x0
    .short 0x1
    .short 0x2
    .short 0xA8
    .short 0x0
    .short 0x7


_ts Effect_Nonstop_Bus_Create
    push       {lr}
    push       {r7}
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_0807f5f4
    mov        r2,#0x8
    mul        r2,r7
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r4,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x26
    bl         Effect_Alloc
    ldrb       r1,[r5,#0x4]
    cmp        r1,#0x8
    bne        LAB_0807f59c
    mov        r1,#0x7
LAB_0807f59c:
    strb       r1,[r5,#0x14]
    mov        r1,#0x1
    strb       r1,[r5,#0x5]
    pop        {r7}
    strb       r7,[r5,#0x6]
    pop        {pc}

USHORT_ARRAY_ARRAY_0807f5a8:
    .short 0x64
    .short 0xB4
    .short 0x0
    .short 0x7
    .short 0xFFB0
    .short 0xFEAC
    .short 0x0
    .short 0x2
    .short 0xE4
    .short 0xA
    .short 0x28
    .short 0x5
    .short 0xFFC8
    .short 0x12C
    .short 0x0
    .short 0x8
    .short 0xFFC8
    .short 0xC8
    .short 0x0
    .short 0x8
    .short 0xFFBC
    .short 0x36
    .short 0x4
    .short 0x8
    .short 0xFFBC
    .short 0x6
    .short 0x8
    .short 0x8

PTR_PTR_E_Nonstop_Bus_0_Init_0807f5e0:
    .word PTR_E_Nonstop_Bus_0_Init_0807f304

DAT_0807f5e4:
    .word 0x104

DAT_0807f5e8:
    .word 0x12C

DAT_0807f5ec:
    .word 0x3E8

PTR_USHORT_ARRAY_ARRAY_0807f5f0:
    .word USHORT_ARRAY_ARRAY_0807f564

PTR_USHORT_ARRAY_ARRAY_0807f5f4:
    .word USHORT_ARRAY_ARRAY_0807f5a8
