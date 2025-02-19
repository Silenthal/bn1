
#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Scene_Prepare
    push       {r5,lr}
    LoadMain scene, r5, r5
    push       {r0,r1,r5}
    add        r0,r5,#0x0
    mov        r1,#0x30
    bl         memset0_32
    pop        {r0,r1,r5}
    str        r0,[r5,#Scene_scenePointer]
    str        r1,[r5,#Scene_dialogueIndex]
    pop        {r5,pc}


_ts Scene_UnloadAndResetStepCounter
    LoadMain scene, r5, r7
    mov        r0,#0x1
    str        r0,[r5,#Scene_scenePointer]
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r7,#0x24]
    str        r0,[r7,#0x28]
    mov        pc,lr


_ts Scene_MarkForUnloading
    LoadMain scene, r5, r7
    mov        r0,#0x1
    str        r0,[r5,#Scene_scenePointer]
    mov        pc,lr


_ts Scene_UnloadIfMarked
    LoadMain scene, r5, r5
    ldr        r0,[r5,#Scene_scenePointer]
    cmp        r0,#0x1
    bne        LAB_0801883a
    mov        r0,#0x0
    str        r0,[r5,#Scene_scenePointer]
LAB_0801883a:
    mov        pc,lr


_ts Scene_IsSceneActive
    LoadMain scene, r0, r0
    ldr        r0,[r0,#0xc]
    tst        r0,r0
    mov        pc,lr


_ts Scene_IsStartPressed
    LoadMain input, r0, r0
    ldrh       r0,[r0,#0x0]
    mov        r1,#0x8
    and        r0,r1
    mov        pc,lr
