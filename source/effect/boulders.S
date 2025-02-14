#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_Boulders
    push       {lr}
    ldr        r0,PTR_PTR_E_Boulders_0_Init_0807e314
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_Boulders_0_Init_0807e1d4:
    .word E_Boulders_0_Init
    .word E_Boulders_1_Main
    .word E_Boulders_2_Free


_ts E_Boulders_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    ldr        r7,PTR_DAT_0807e318
    ldrb       r2,[r5,#0x4]
    ldrb       r1,[r7,r2]
    add        r2,#0x1
    ldrb       r2,[r7,r2]
    strb       r2,[r5,#0x14]
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoShadow
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    pop        {pc}


_ts E_Boulders_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    bne        LAB_0807e234
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0807e250
    b          E_Boulders_2_Free
LAB_0807e234:
    Flag_GetBase 0xA1
    bne        E_Boulders_2_Free
    Flag_GetBase 0xA0
    beq        LAB_0807e250
    Flag_ClearBase 0xA0
    mov        r4,#0x2
    bl         E_Boulders_Generate
LAB_0807e250:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_Boulders_2_Free
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x2
    beq        LAB_0807e298
    Flag_GetBase 0xA6
    bne        LAB_0807e298
    push       {r5}
    mov        r0,#0x76
    bl         Sound_PlaySE
    pop        {r5}
    mov        r3,#0x0
    ldr        r6,PTR_INT_ARRAY_ARRAY_0807e2a0
LAB_0807e272:
    push       {r3,r6}
    bl         Rng_RandomUint
    mov        r4,#0x3
    and        r4,r0
    add        r4,#0x1
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x30]
    ldr        r7,[r6,#0x4]
    ldr        r6,[r6,#0x0]
    mov        r0,#0x1
    bl         Effect_StonePiece_Create
    pop        {r3,r6}
    add        r6,#0x8
    add        r3,#0x1
    cmp        r3,#0x4
    bmi        LAB_0807e272
LAB_0807e298:
    bl         Effect_Free
    pop        {pc}

    .align 2, 0


PTR_INT_ARRAY_ARRAY_0807e2a0:
    .word INT_ARRAY_ARRAY_0807e2a4

INT_ARRAY_ARRAY_0807e2a4:
    .word 0x8000
    .word 0x28000
    .word 0xFFFF8000
    .word 0x30000
    .word 0x10000
    .word 0x28000
    .word 0xFFFF8000
    .word 0x18000


_ts E_Boulders_Generate
    push       {lr}
    push       {r5}
    push       {r4}
    bl         Rng_RandomUint
    add        r6,r0,#0x0
    mov        r7,#0x7
    mov        r0,#0x15
    ldrh       r1,[r5,#0x2a]
    add        r4,r6,#0x0
    and        r4,r7
    cmp        r4,#0x4
    ble        LAB_0807e2e6
    mov        r7,#0x3
    and        r4,r7
    add        r1,r1,r4
    b          LAB_0807e2e8
LAB_0807e2e6:
    sub        r1,r1,r4
LAB_0807e2e8:
    lsl        r1,r1,#0x10
    ldrh       r2,[r5,#0x2e]
    lsl        r2,r2,#0x10
    ldrh       r3,[r5,#0x32]
    lsr        r6,r6,#0x8
    add        r4,r6,#0x0
    mov        r7,#0x7
    and        r4,r7
    cmp        r4,#0x4
    ble        LAB_0807e302
    mov        r7,#0x3
    add        r3,r3,r4
    b          LAB_0807e304
LAB_0807e302:
    sub        r3,r3,r4
LAB_0807e304:
    lsl        r3,r3,#0x10
    pop        {r4}
    bl         Effect_Alloc
    pop        {r5}
    pop        {pc}

DAT_0807e310:
    .byte 0x8A

DAT_0807e311:
    .byte 0x00
    .byte 0xD3

    .align 2, 0


PTR_PTR_E_Boulders_0_Init_0807e314:
    .word PTR_E_Boulders_0_Init_0807e1d4

PTR_DAT_0807e318:
    .word DAT_0807e310
