#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Routine_BrownCar
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_R_BrownCar_0_Init_0805b214
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_R_BrownCar_0_Init_0805b20c:
    .word R_BrownCar_0_Init
    .word R_BrownCar_1_Main

PTR_PTR_R_BrownCar_0_Init_0805b214:
    .word PTR_R_BrownCar_0_Init_0805b20c


_ts R_BrownCar_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0xd
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x6]
    lsl        r0,r0,#0x2
    ldr        r7,PTR_PTR_USHORT_0805b270
    ldr        r7,[r7,r0]
    str        r7,[r5,#0x60]
    mov        r0,#0x0
    strb       r0,[r5,#0x17]
    strb       r0,[r5,#0x10]
    strb       r0,[r5,#0x11]
    str        r0,[r5,#0x4c]
    strb       r0,[r5,#0x6]
    str        r0,[r5,#0x64]
    strh       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    mov        r3,#0x50
    add        r7,r5,r3
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x5]
    strb       r0,[r5,#0x7]
    bl         R_BrownCar_Direction
    strb       r0,[r5,#0x14]
    ldr        r0,DAT_0805b278
    str        r0,[r5,#0x4c]
    ldr        r0,DAT_0805b274
    str        r0,[r5,#0x8]
    bl         R_BrownCar_1_Main
    pop        {pc}

PTR_PTR_USHORT_0805b270:
    .word PTR_USHORT_0805b45c

DAT_0805b274:
    .word 0x804

DAT_0805b278:
    .word 0x30000


_ts R_BrownCar_1_Main
    push       {lr}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_R_BrownCar_1_0_0805b2b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    bl         UpdateSpriteFrameIndex
    bl         FUN_0805b3fa
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    pop        {pc}

    .align 2, 0


PTR_R_BrownCar_1_0_0805b2ac:
    .word R_BrownCar_1_0
    .word R_BrownCar_1_1
    .word R_BrownCar_1_2

PTR_PTR_R_BrownCar_1_0_0805b2b8:
    .word PTR_R_BrownCar_1_0_0805b2ac


_ts R_BrownCar_1_0
    push       {lr}
    pop        {pc}


_ts R_BrownCar_1_1
    push       {lr}
    bl         Rng_RandomUint
    mov        r1,#0x3
    and        r0,r1
    ldrb       r1,[r5,#0x5]
    ldr        r6,[r5,#0x60]
    lsl        r1,r1,#0x3
    add        r7,r6,r1
    mov        r4,#0x4
    add        r4,r4,r0
    ldrb       r1,[r7,r4]
    strb       r1,[r5,#0x5]
    cmp        r1,#0xff
    bne        LAB_0805b2ee
    mov        r7,#0x50
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    mov        r7,#0x28
    add        r7,r7,r5
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#0x7]
    strb       r0,[r5,#0x5]
LAB_0805b2ee:
    bl         R_BrownCar_Direction
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    bl         R_BrownCar_1_2_0
    pop        {pc}

    .align 2, 0

    .word PF_DieBombExplosion | PF_Apple


_ts R_BrownCar_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_R_BrownCar_1_2_0_0805b318
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_R_BrownCar_1_2_0_0805b318:
    .word PTR_R_BrownCar_1_2_0_0805b31c

PTR_R_BrownCar_1_2_0_0805b31c:
    .word R_BrownCar_1_2_0


_ts R_BrownCar_1_2_0
    push       {lr}
    bl         FUN_0805b3b4
    ldr        r1,INT_0805b38c
    tst        r0,r0
    beq        LAB_0805b32e
    ldr        r1,DAT_0805b390
LAB_0805b32e:
    ldr        r0,[r5,#0x4c]
    add        r0,r0,r1
    bmi        LAB_0805b340
    ldr        r1,DAT_0805b388
    cmp        r0,r1
    bhi        LAB_0805b33c
    b          LAB_0805b342
LAB_0805b33c:
    add        r0,r1,#0x0
    b          LAB_0805b342
LAB_0805b340:
    mov        r0,#0x0
LAB_0805b342:
    str        r0,[r5,#0x4c]
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x3
    ldr        r6,[r5,#0x60]
    add        r7,r6,r1
    ldrh       r2,[r7,#0x0]
    lsl        r2,r2,#0x10
    asr        r2,r2,#0xc
    ldrh       r3,[r7,#0x2]
    lsl        r3,r3,#0x10
    asr        r3,r3,#0xc
    ldr        r4,[r5,#0x4c]
    asr        r4,r4,#0xc
    ldr        r0,[r5,#0x28]
    asr        r0,r0,#0xc
    ldr        r1,[r5,#0x2c]
    asr        r1,r1,#0xc
    bl         IsCollision_Circle
    tst        r0,r0
    beq        LAB_0805b382
    ldrh       r0,[r7,#0x0]
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x28]
    ldrh       r0,[r7,#0x2]
    lsl        r0,r0,#0x10
    str        r0,[r5,#0x2c]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}
LAB_0805b382:
    bl         FUN_0805b394
    pop        {pc}

DAT_0805b388:
    .word 0x30000

INT_0805b38c:
    .word 0x1800

DAT_0805b390:
    .word 0xFFFFD000


_ts FUN_0805b394
    push       {lr}
    ldrb       r0,[r5,#0x10]
    ldr        r1,[r5,#0x4c]
    bl         AngleToVector
    str        r0,[r5,#0x44]
    str        r1,[r5,#0x48]
    ldr        r0,[r5,#0x28]
    ldr        r1,[r5,#0x44]
    add        r0,r0,r1
    str        r0,[r5,#0x28]
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x48]
    add        r0,r0,r1
    str        r0,[r5,#0x2c]
    pop        {pc}


_ts FUN_0805b3b4
    push       {lr}
    ldr        r0,[r5,#0x64]
    mov        r1,#0x1
    tst        r0,r1
    bne        LAB_0805b3f4
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0805b3ca
    mov        r4,#0x40
    mov        r1,#0x60
    b          LAB_0805b3ce
LAB_0805b3ca:
    mov        r4,#0x60
    mov        r1,#0x60
LAB_0805b3ce:
    lsl        r4,r4,#0x4
    push       {r1}
    bl         IsCollision_Player
    pop        {r1}
    tst        r0,r0
    beq        LAB_0805b3f4
    ldrb       r0,[r5,#0x10]
    push       {r1}
    bl         ActorFacingPlayerAngle
    pop        {r1}
    lsr        r2,r1,#0x1
    add        r0,r0,r2
    cmp        r0,r1
    bhi        LAB_0805b3f4
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    pop        {pc}
LAB_0805b3f4:
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    pop        {pc}


_nt FUN_0805b3fa
    push       {lr}
    push       {r5}
    mov        r3,#0x28
    add        r7,r5,r3
    ldmia      r7!,{r0,r1,r2}
    mov        r6,#0x64
    add        r6,r6,r5
    ldr        r3,DAT_0805b41c
    ldr        r4,DAT_0805b420
    ldr        r5,DAT_0805b424
    bl         EntityBounds_AddToList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x64]
    pop        {pc}

    .align 2, 0


DAT_0805b41c:
    .word 0x10

DAT_0805b420:
    .word 0x2

DAT_0805b424:
    .word 0x1


_ts R_BrownCar_Direction
    push       {lr}
    ldrb       r1,[r5,#0x5]
    ldr        r6,[r5,#0x60]
    lsl        r1,r1,#0x3
    add        r7,r6,r1
    mov        r3,#0x2
    ldrsh      r0,[r7,r3]
    lsl        r0,r0,#0x10
    mov        r3,#0x0
    ldrsh      r1,[r7,r3]
    lsl        r1,r1,#0x10
    ldr        r2,[r5,#0x2c]
    ldr        r3,[r5,#0x28]
    sub        r0,r0,r2
    sub        r1,r1,r3
    push       {r5}
    bl         VectorToAngle
    pop        {r5}
    strb       r0,[r5,#0x10]
    lsr        r0,r0,#0x5
    sub        r0,#0x1
    mov        r1,#0x7
    and        r0,r1
    pop        {pc}

    .align 2, 0


PTR_USHORT_0805b45c:
    .word USHORT_0805b460

USHORT_0805b460:
    .short 0x187
    .short 0x110
    .byte -1
    .byte -1
    .byte -1
    .byte -1
