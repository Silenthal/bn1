#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


SpriteIndex_ARRAY_0807e40c:
    .byte SP_BattleObject_IceBlock, 0
    .byte SP_BattleObject_StoneBlock, 0
    .byte SP_BattleObject_IceBlock_Emerging, 0
    .byte SP_BattleObject_StoneBlock, 2
    .byte SP_BattleObject_StoneBlock, 3
    .byte SP_BattleObject_StoneBlock, 4
    .byte SP_BattleObject_IceBlock_Emerging, 0


_nt Effect_CubeBreak
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_CubeBreak_0_Init_0807e428
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_CubeBreak_0_Init_0807e428:
    .word PTR_E_CubeBreak_0_Init_0807e42c

PTR_E_CubeBreak_0_Init_0807e42c:
    .word E_CubeBreak_0_Init
    .word E_CubeBreak_1_Main
    .word E_CubeBreak_2_Free


_ts E_CubeBreak_0_Init
    push       {lr}
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x2
    orr        r0,r1
    strb       r0,[r5,#0x0]
    ldr        r7,PTR_SpriteIndex_ARRAY_0807e4a4
    ldrb       r0,[r5,#0x4]
    lsl        r0,r0,#0x1
    add        r7,r7,r0
    mov        r0,#0x1
    ldrb       r1,[r7,#0x0]
    push       {r7}
    bl         Sprite_InitSpritePtr
    pop        {r7}
    ldrb       r0,[r7,#0x1]
    bl         SpritePtr_SetPaletteIndex
    bl         Rng_RandomUint
    mov        r1,#0xf
    and        r1,r0
    sub        r1,#0x7
    lsl        r1,r1,#0xf
    str        r1,[r5,#0x44]
    lsr        r0,r0,#0x4
    mov        r1,#0xf
    and        r1,r0
    sub        r1,#0x7
    lsl        r1,r1,#0xf
    str        r1,[r5,#0x48]
    lsr        r0,r0,#0x4
    mov        r1,#0xf
    and        r1,r0
    add        r1,#0x8
    lsl        r1,r1,#0xf
    str        r1,[r5,#0x4c]
    lsr        r0,r0,#0x4
    mov        r1,#0x1
    and        r0,r1
    @@ chunk 1 or 2
    add        r0,#0x2
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
    bl         SpritePtr_NoZClip
    mov        r0,#0x4
    strb       r0,[r5,#0x8]
    bl         E_CubeBreak_1_Main
    pop        {pc}

PTR_SpriteIndex_ARRAY_0807e4a4:
    .word SpriteIndex_ARRAY_0807e40c


_ts E_CubeBreak_1_Main
    push       {lr}
    bl         UpdateSpriteFrameIndex
    mov        r7,#0x44
    add        r7,r7,r5
    ldmia      r7!,{r3,r4,r6}
    mov        r7,#0x28
    add        r7,r7,r5
    ldmia      r7!,{r0,r1,r2}
    add        r0,r0,r3
    add        r1,r1,r4
    add        r2,r2,r6
    bpl        LAB_0807e4c4
    mov        r2,#0x0
LAB_0807e4c4:
    sub        r7,#0xc
    stmia      r7!,{r0,r1,r2}
    ldr        r0,DAT_0807e4dc
    add        r6,r6,r0
    str        r6,[r5,#0x4c]
    ldr        r0,[r5,#0x30]
    tst        r0,r0
    beq        LAB_0807e4d6
    pop        {pc}
LAB_0807e4d6:
    bl         E_CubeBreak_2_Free
    pop        {pc}

DAT_0807e4dc:
    .word 0xFFFEC000


_ts E_CubeBreak_2_Free
    push       {lr}
    bl         Effect_Free
    pop        {pc}


_ts Effect_CubeBreak_Create
    push       {lr}
    push       {r5}
    mov        r0,#0x17
    bl         Effect_Alloc
    add        r7,r5,#0x0
    pop        {r5}
    beq        LAB_0807e504
    ldrb       r0,[r5,#0x0]
    mov        r1,#0x4
    and        r0,r1
    ldrb       r1,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_0807e504:
    pop        {pc}

    .align 2, 0

