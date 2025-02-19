#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_LifeVirusSeed
    push       {lr}
    ldr        r0,PTR_PTR_E_LifeVirusSeed_0_Init_0808061c
    ldrb       r1,[r5,#Effect_state_s0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_E_LifeVirusSeed_0_Init_08080358:
    .word E_LifeVirusSeed_0_Init
    .word E_LifeVirusSeed_1_Main
    .word E_LifeVirusSeed_2_Free


_ts E_LifeVirusSeed_0_Init
    push       {lr}
    mov        r0,#0x3
    strb       r0,[r5,#Effect_header_entityFlags]
    mov        r0,#0x1
    ldr        r1,DAT_08080620
    bl         Sprite_InitSpritePtr
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x20
    and        r0,r1
    lsr        r0,r0,#0x4
    strb       r0,[r5,#Effect_frameIndexCurr]
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
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0xf
    and        r0,r1
    bl         SpritePtr_SetPaletteIndex
    mov        r1,#0x0
    str        r1,[r5,#Effect_diff_x]
    mov        r1,#0x0
    str        r1,[r5,#Effect_diff_y]
    ldr        r1,PTR_DAT_08080624
    str        r1,[r5,#Effect_diff_z]
    mov        r0,#0x1e
    strb       r0,[r5,#Effect_counterA]
    mov        r0,#0x1
    strb       r0,[r5,#Effect_state_s0]
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0xf0
    and        r0,r1
    tst        r0,r0
    bne        LAB_080803ce
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x6]
    cmp        r1,#0x53
    beq        LAB_080803e4
LAB_080803ce:
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x40
    and        r0,r1
    bne        LAB_080803e4
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_080803ea
    mov        r0,#0x0
    strb       r0,[r5,#Effect_state_s1]
    pop        {pc}
LAB_080803e4:
    mov        r0,#0x4
    strb       r0,[r5,#Effect_state_s1]
    pop        {pc}
LAB_080803ea:
    mov        r0,#0x46
    strb       r0,[r5,#Effect_counterA]
    mov        r0,#0xc
    strb       r0,[r5,#Effect_state_s1]
    pop        {pc}


_ts E_LifeVirusSeed_1_Main
    push       {lr}
    ldr        r0,PTR_PTR_E_LifeVirusSeed_1_0_08080628
    ldrb       r1,[r5,#Effect_state_s1]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    bx         r0

PTR_E_LifeVirusSeed_1_0_08080400:
    .word E_LifeVirusSeed_1_0
    .word E_LifeVirusSeed_1_1
    .word E_LifeVirusSeed_1_2
    .word E_LifeVirusSeed_1_3


_ts E_LifeVirusSeed_1_0
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strb       r0,[r5,#Effect_counterA]
    tst        r0,r0
    bne        LAB_08080440
    ldr        r1,[r5,#Effect_diff_z]
    neg        r1,r1
    str        r1,[r5,#Effect_diff_z]
    ldr        r1,[r5,#Effect_diff_z]
    cmp        r1,#0x0
    bmi        LAB_0808043c
LAB_0808043c:
    mov        r0,#0x1e
    strb       r0,[r5,#Effect_counterA]
LAB_08080440:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_LifeVirusSeed_1_1
    Flag_GetBase 0xA2
    beq        LAB_08080476
    ldrb       r1,[r5,#Effect_family_family]
    mov        r2,#0x40
    and        r1,r2
    beq        LAB_0808045a
    mov        r1,#0x6
    b          LAB_08080460
LAB_0808045a:
    ldrb       r1,[r5,#Effect_family_family]
    mov        r2,#0xf
    and        r1,r2
LAB_08080460:
    mov        r2,#0x8
    mul        r1,r2
    ldr        r7,DAT_0808062c
    ldr        r0,[r7,r1]
    str        r0,[r5,#Effect_diff_x]
    add        r1,#0x4
    ldr        r0,[r7,r1]
    str        r0,[r5,#Effect_diff_y]
    ldrb       r0,[r5,#Effect_state_s1]
    add        r0,#0x4
    strb       r0,[r5,#Effect_state_s1]
LAB_08080476:
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strb       r0,[r5,#Effect_counterA]
    tst        r0,r0
    bne        LAB_080804b6
    ldr        r1,[r5,#Effect_diff_z]
    neg        r1,r1
    str        r1,[r5,#Effect_diff_z]
    ldr        r1,[r5,#Effect_diff_z]
    cmp        r1,#0x0
    bmi        LAB_080804a2
LAB_080804a2:
    ldrb       r0,[r5,#Effect_state_s1]
    cmp        r0,#0x8
    bne        LAB_080804ae
    mov        r0,#0xdc
    bl         Sound_PlaySE
LAB_080804ae:
    mov        r0,#0x1e
    strb       r0,[r5,#Effect_counterA]
    ldr        r0,DAT_08080630
    strh       r0,[r5,#Effect_counterB]
LAB_080804b6:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}

INT_080804bc:
    .word 0xFFFFDB48
    .word 0x7D0
    .word 0x128E
    .word 0x7D0
    .word 0xFFFFF63C
    .word 0x7D0
    .word 0x3108
    .word 0x7D0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x0
    .word 0x1B30
    .word 0x0


_ts E_LifeVirusSeed_1_2
    ldrh       r0,[r5,#Effect_counterB]
    sub        r0,#0x1
    strh       r0,[r5,#Effect_counterB]
    tst        r0,r0
    bne        LAB_08080524
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x40
    and        r0,r1
    bne        LAB_08080520
    mov        r0,#0x1
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xe5
    bl         Sound_PlaySE
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_08080524
LAB_08080520:
    mov        r0,#0x2
    strb       r0,[r5,#Effect_state_s0]
LAB_08080524:
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldrb       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strb       r0,[r5,#Effect_counterA]
    tst        r0,r0
    bne        LAB_0808055a
    ldr        r1,[r5,#Effect_diff_z]
    neg        r1,r1
    str        r1,[r5,#Effect_diff_z]
    ldr        r1,[r5,#Effect_diff_z]
    cmp        r1,#0x0
    bmi        LAB_08080556
    mov        r0,#0xdc
    bl         Sound_PlaySE
LAB_08080556:
    mov        r0,#0x1e
    strb       r0,[r5,#Effect_counterA]
LAB_0808055a:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_ts E_LifeVirusSeed_1_3
    ldrb       r0,[r5,#Effect_counterA]
    sub        r0,#0x1
    strb       r0,[r5,#Effect_counterA]
    tst        r0,r0
    bne        LAB_08080580
    mov        r0,#0x1
    strb       r0,[r5,#Effect_frameIndexCurr]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    mov        r0,#0xe5
    bl         Sound_PlaySE
    mov        r0,#0x2
    strb       r0,[r5,#Effect_state_s0]
LAB_08080580:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


_nt E_LifeVirusSeed_2_Free
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x80
    and        r0,r1
    beq        LAB_0808059e
    bl         SpritePtr_GetFrameStatus
    mov        r1,#0x80
    and        r0,r1
    bne        LAB_0808059e
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}
LAB_0808059e:
    ldrb       r0,[r5,#Effect_family_family]
    mov        r1,#0x40
    and        r0,r1
    beq        LAB_080805ac
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}
LAB_080805ac:
    bl         Effect_Free
    pop        {pc}


_nt Effect_LifeVirusSeed_Create
    push       {lr}
    ldr        r0,PTR_USHORT_ARRAY_ARRAY_08080634
    mov        r2,#0x8
    mul        r2,r1
    add        r0,r0,r2
    ldrh       r1,[r0,#0x0]
    ldrh       r2,[r0,#0x2]
    ldrh       r3,[r0,#0x4]
    ldrh       r4,[r0,#0x6]
    lsl        r1,r1,#0x10
    lsl        r2,r2,#0x10
    lsl        r3,r3,#0x10
    mov        r0,#0x35
    bl         Effect_Alloc
    pop        {pc}

    .align 2, 0


USHORT_ARRAY_ARRAY_080805d4:
    .short 0x64
    .short 0xFF98
    .short 0x28
    .short 0x0
    .short 0x34
    .short 0xFF98
    .short 0x28
    .short 0x2
    .short 0x4
    .short 0xFF98
    .short 0x28
    .short 0x1
    .short 0xFFD4
    .short 0xFF98
    .short 0x28
    .short 0x3
    .short 0x20
    .short 0xFFA8
    .short 0x28
    .short 0x20
    .short 0xFFC8
    .short 0x5C
    .short 0x28
    .short 0x20
    .short 0x34
    .short 0xC
    .short 0x0
    .short 0x60
    .short 0x54
    .short 0x8
    .short 0x0
    .short 0xA0
    .short 0x1C2
    .short 0xFFFC
    .short 0x0
    .short 0x20

PTR_PTR_E_LifeVirusSeed_0_Init_0808061c:
    .word PTR_E_LifeVirusSeed_0_Init_08080358

DAT_08080620:
    .word 0x120

PTR_DAT_08080624:
    .word 0x2000

PTR_PTR_E_LifeVirusSeed_1_0_08080628:
    .word PTR_E_LifeVirusSeed_1_0_08080400

DAT_0808062c:
    .word INT_080804bc

DAT_08080630:
    .word 0x19A

PTR_USHORT_ARRAY_ARRAY_08080634:
    .word USHORT_ARRAY_ARRAY_080805d4
