
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Prepare
    push       {r5,lr}
    mov        r5,r10
    ldr        r5,[r5,#0x28]
    push       {r0,r1,r5}
    add        r0,r5,#0x0
    mov        r1,#0x30
    bl         memset0_32
    pop        {r0,r1,r5}
    str        r0,[r5,#0xc]
    str        r1,[r5,#0x4]
    pop        {r5,pc}


_ts Scene_UnloadAndResetStepCounter
    mov        r7,r10
    ldr        r5,[r7,#0x28]
    mov        r0,#0x1
    str        r0,[r5,#0xc]
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r7,#0x24]
    str        r0,[r7,#0x28]
    mov        pc,lr


_ts Scene_MarkForUnloading
    mov        r7,r10
    ldr        r5,[r7,#0x28]
    mov        r0,#0x1
    str        r0,[r5,#0xc]
    mov        pc,lr


_ts Scene_UnloadIfMarked
    mov        r5,r10
    ldr        r5,[r5,#0x28]
    ldr        r0,[r5,#0xc]
    cmp        r0,#0x1
    bne        LAB_0801883a
    mov        r0,#0x0
    str        r0,[r5,#0xc]
LAB_0801883a:
    mov        pc,lr


_ts Scene_IsSceneActive
    mov        r0,r10
    ldr        r0,[r0,#0x28]
    ldr        r0,[r0,#0xc]
    tst        r0,r0
    mov        pc,lr


_ts Scene_IsStartPressed
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x0]
    mov        r1,#0x8
    and        r0,r1
    mov        pc,lr
