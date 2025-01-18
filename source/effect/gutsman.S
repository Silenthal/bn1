#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_GutsMan
    push       {lr}
    ldr        r0,PTR_PTR_E_GutsMan_0_Init_0808107c
    ldrb       r1,[r5,#0x8]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_GutsMan_0_Init_08080f44:
    .word E_GutsMan_0_Init
    .word E_GutsMan_1_Main
    .word E_GutsMan_2_Free


_ts E_GutsMan_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#0x0]
    mov        r0,#0x1
    mov        r1,#0x5d
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_ProcessFrameDelay
    bl         SpritePtr_NoZClip
    add        r0,r5,#0x0
    add        r0,#0x28
    push       {r5}
    bl         Map_HandleCollisionCover
    pop        {r5}
    bl         SpritePtr_SetPriority
    ldr        r0,DAT_08081080
    bl         SpritePtr_SetObjectExcludeFlags
    mov        r1,#0x0
    str        r1,[r5,#0x44]
    str        r1,[r5,#0x48]
    str        r1,[r5,#0x4c]
    mov        r0,#0x1
    strb       r0,[r5,#0x8]
    mov        r0,#0x0
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    pop        {pc}


_nt E_GutsMan_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_GutsMan_1_0_08081084
    ldrb       r1,[r5,#0x9]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

    .align 2, 0


PTR_E_GutsMan_1_0_08080fa8:
    .word E_GutsMan_1_0
    .word E_GutsMan_1_1
    .word E_GutsMan_1_2


_ts E_GutsMan_1_0
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    bpl        LAB_08080fca
    mov        r2,#0x0
LAB_08080fca:
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldr        r0,DAT_08081000
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    ldr        r0,[r5,#0x30]
    tst        r0,r0
    bne        LAB_08080ffa
    mov        r0,#0xd
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x0
    bl         SpritePtr_SetObjectExcludeFlags
    mov        r0,#0x5
    strb       r0,[r5,#0x1c]
    mov        r0,#0x7e
    bl         Sound_PlaySE
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
LAB_08080ffa:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

DAT_08081000:
    .word 0xFFFFC000


_ts E_GutsMan_1_1
    ldrb       r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_08081010
    sub        r0,#0x1
    strb       r0,[r5,#0x1c]
    b          LAB_0808104c
LAB_08081010:
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    bne        LAB_08081032
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x40
    bl         Camera_EnableScreenShake
    pop        {r5}
    mov        r0,#0x95
    bl         Sound_PlaySE
    Flag_SetBase 0xF9
LAB_08081032:
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0808104c
    mov        r0,#0x7
    strb       r0,[r5,#0x14]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
LAB_0808104c:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_GutsMan_1_2
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_GutsMan_2_Free
    bl         Effect_Free
    pop        {pc}


_nt Effect_GutsMan_Create
    push       {lr}
    ldr        r1,DAT_08081088
    mov        r2,#0x2e
    mov        r3,#0x64
    mov        r4,#0x0
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x3f
    bl         Effect_Alloc
    mov        r0,#0xc
    strh       r0,[r5,#0x14]
    pop        {pc}

    .align 2, 0


PTR_PTR_E_GutsMan_0_Init_0808107c:
    .word PTR_E_GutsMan_0_Init_08080f44

DAT_08081080:
    .word 0x80000000

PTR_PTR_E_GutsMan_1_0_08081084:
    .word PTR_E_GutsMan_1_0_08080fa8

DAT_08081088:
    .word 0xFFFFFE04
