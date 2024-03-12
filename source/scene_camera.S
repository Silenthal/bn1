
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts SceneCamera_Init
    push       {r5,lr}
    ldr        r5,PTR_gSceneCamera_08018944
    str        r0,[r5,#0x0]
    mov        r0,#0x0
    str        r0,[r5,#0x4]
    push       {r5}
    mov        r0,#0x0
    bl         Camera_SetEnabled
    pop        {r5}
    pop        {r5,pc}


_ts SceneCamera_Main
    push       {r5,lr}
    ldr        r5,PTR_gSceneCamera_08018948
    ldr        r1,[r5,#0x0]
    ldrh       r2,[r1,#0x0]
    ldr        r0,PTR_PTR_SceneCamera_0_SetPosition_0801894c
    add        r0,r0,r2
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    str        r1,[r5,#0x0]
    pop        {r5,pc}

    .align 2, 0

PTR_SceneCamera_0_SetPosition_08018884:
    .word SceneCamera_0_SetPosition
    .word SceneCamera_1_MoveCamera
    .word SceneCamera_2_None
    .word SceneCamera_3_Delay
    .word SceneCamera_4_ScreenShake


_ts SceneCamera_0_SetPosition
    ldrh       r2,[r1,#0x2]
    lsl        r2,r2,#0x10
    ldrh       r3,[r1,#0x4]
    lsl        r3,r3,#0x10
    ldrh       r4,[r1,#0x6]
    lsl        r4,r4,#0x10
    mov        r6,r10
    ldr        r6,[r6,#0x14]
    str        r2,[r6,#0x2c]
    str        r3,[r6,#0x30]
    str        r4,[r6,#0x34]
    mov        r0,#0x1
    add        r1,#0x8
    mov        pc,lr


_ts SceneCamera_1_MoveCamera
    ldrb       r2,[r5,#0x6]
    cmp        r2,#0x0
    bne        LAB_080188c2
    mov        r2,#0x1
    strb       r2,[r5,#0x6]
    ldrh       r2,[r1,#0x8]
    strh       r2,[r5,#0x4]
LAB_080188c2:
    mov        r6,r10
    ldr        r6,[r6,#0x14]
    mov        r3,#0x2
    ldrsh      r2,[r1,r3]
    lsl        r2,r2,#0x8
    ldr        r3,[r6,#0x2c]
    add        r2,r2,r3
    str        r2,[r6,#0x2c]
    mov        r3,#0x4
    ldrsh      r2,[r1,r3]
    lsl        r2,r2,#0x8
    ldr        r3,[r6,#0x30]
    add        r2,r2,r3
    str        r2,[r6,#0x30]
    mov        r3,#0x6
    ldrsh      r2,[r1,r3]
    lsl        r2,r2,#0x8
    ldr        r3,[r6,#0x34]
    add        r2,r2,r3
    str        r2,[r6,#0x34]
    ldrh       r2,[r5,#0x4]
    sub        r2,#0x1
    strh       r2,[r5,#0x4]
    cmp        r2,#0x0
    bgt        LAB_080188fe
    mov        r2,#0x0
    strb       r2,[r5,#0x6]
    mov        r0,#0x1
    add        r1,#0xa
    mov        pc,lr
LAB_080188fe:
    mov        r0,#0x1
    mov        pc,lr


_ts SceneCamera_2_None
    mov        r0,#0x0
    mov        pc,lr


_ts SceneCamera_3_Delay
    ldrb       r2,[r5,#0x6]
    cmp        r2,#0x0
    bne        LAB_08018916
    mov        r2,#0x1
    strb       r2,[r5,#0x6]
    ldrh       r2,[r1,#0x2]
    strh       r2,[r5,#0x4]
LAB_08018916:
    ldrh       r2,[r5,#0x4]
    sub        r2,#0x1
    strh       r2,[r5,#0x4]
    cmp        r2,#0x0
    bge        LAB_0801892a
    mov        r2,#0x0
    strb       r2,[r5,#0x6]
    mov        r0,#0x1
    add        r1,#0x4
    mov        pc,lr
LAB_0801892a:
    mov        r0,#0x1
    mov        pc,lr


_ts SceneCamera_4_ScreenShake
    push       {lr}
    push       {r1,r5}
    ldrh       r0,[r1,#0x2]
    ldrh       r1,[r1,#0x4]
    bl         Camera_EnableScreenShake
    pop        {r1,r5}
    mov        r0,#0x1
    add        r1,#0x6
    pop        {pc}
PTR_gSceneCamera_08018944:
    .word gSceneCamera
PTR_gSceneCamera_08018948:
    .word gSceneCamera
PTR_PTR_SceneCamera_0_SetPosition_0801894c:
    .word PTR_SceneCamera_0_SetPosition_08018884
