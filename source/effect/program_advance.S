#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts Effect_ProgramAdvance
    push       {lr}
    ldrb       r0,[r5,#0x8]
    ldr        r7,PTR_PTR_E_ProgramAdvance_0_Init_0807c32c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_E_ProgramAdvance_0_Init_0807c320:
    .word E_ProgramAdvance_0_Init
    .word E_ProgramAdvance_1_Main
    .word E_ProgramAdvance_2_Free

PTR_PTR_E_ProgramAdvance_0_Init_0807c32c:
    .word PTR_E_ProgramAdvance_0_Init_0807c320


_ts E_ProgramAdvance_0_Init
    push       {lr}
    bl         FUN_0807c7b0
    tst        r0,r0
    bne        LAB_0807c340
    bl         E_ProgramAdvance_2_Free
    b          LAB_0807c360
LAB_0807c340:
    push       {r5}
    ldr        r7,PTR_PTR_Color_ARRAY_0807c364
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r5}
    mov        r0,#0x4
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    mov        r0,#0xff
    strb       r0,[r5,#0xc]
    bl         E_ProgramAdvance_1_Main
LAB_0807c360:
    pop        {pc}

    .align 2, 0


PTR_PTR_Color_ARRAY_0807c364:
    .word PTR_Color_ARRAY_0807c368

PTR_Color_ARRAY_0807c368:
    .word palette_0647A9C
    .word eBgPaletteC
    .word 0x18


_ts E_ProgramAdvance_1_Main
    push       {lr}
    ldrb       r0,[r5,#0x9]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_0_Darken_0807c388
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    ldrb       r0,[r5,#0xc]
    cmp        r0,#0xff
    beq        LAB_0807c386
LAB_0807c386:
    pop        {pc}

PTR_PTR_E_ProgramAdvance_1_0_Darken_0807c388:
    .word PTR_E_ProgramAdvance_1_0_Darken_0807c38c

PTR_E_ProgramAdvance_1_0_Darken_0807c38c:
    .word E_ProgramAdvance_1_0_Darken
    .word E_ProgramAdvance_1_1
    .word E_ProgramAdvance_1_2
    .word E_ProgramAdvance_1_3
    .word E_ProgramAdvance_1_4
    .word E_ProgramAdvance_1_5
    .word E_ProgramAdvance_1_6


_ts E_ProgramAdvance_1_0_Darken
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_0_0_Darken_0807c3b8
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_ProgramAdvance_1_0_0_Darken_0807c3b8:
    .word PTR_E_ProgramAdvance_1_0_0_Darken_0807c3bc

PTR_E_ProgramAdvance_1_0_0_Darken_0807c3bc:
    .word E_ProgramAdvance_1_0_0_Darken
    .word E_ProgramAdvance_1_0_1_Wait


_ts E_ProgramAdvance_1_0_0_Darken
    push       {lr}
    mov        r0,#0xc
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x5a
    strh       r0,[r5,#0x1c]
    pop        {pc}


_ts E_ProgramAdvance_1_0_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c3ee
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807c3ee:
    pop        {pc}


_ts E_ProgramAdvance_1_1
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_1_0_ShowMessage_0807c40c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x1
    bl         BattleMessage_Main_2
    pop        {r5}
    pop        {pc}

    .align 2, 0


PTR_PTR_E_ProgramAdvance_1_1_0_ShowMessage_0807c40c:
    .word PTR_E_ProgramAdvance_1_1_0_ShowMessage_0807c410

PTR_E_ProgramAdvance_1_1_0_ShowMessage_0807c410:
    .word E_ProgramAdvance_1_1_0_ShowMessage
    .word E_ProgramAdvance_1_1_1_Wait


_ts E_ProgramAdvance_1_1_0_ShowMessage
    push       {lr}
    push       {r5}
    mov        r0,#0x3
    bl         BattleMessage_Load
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt E_ProgramAdvance_1_1_1_Wait
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c444
    mov        r0,#0x8
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807c444:
    pop        {pc}


_nt E_ProgramAdvance_1_2
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_2_0_0807c460
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x1
    bl         BattleMessage_Main_2
    pop        {r5}
    pop        {pc}

PTR_PTR_E_ProgramAdvance_1_2_0_0807c460:
    .word PTR_E_ProgramAdvance_1_2_0_0807c464

PTR_E_ProgramAdvance_1_2_0_0807c464:
    .word E_ProgramAdvance_1_2_0
    .word E_ProgramAdvance_1_2_1
    .word E_ProgramAdvance_1_2_2


_ts E_ProgramAdvance_1_2_0
    push       {lr}
    mov        r7,#0x60
    add        r7,r7,r5
    ldr        r2,PTR_iwBufferUITextTile_0807c4cc
    ldr        r3,PTR_DAT_0807c4d0
    ldrb       r4,[r5,#0xd]
LAB_0807c47c:
    push       {r4,r5}
    push       {r2,r3,r7}
    ldrb       r1,[r7,#0x0]
    mov        r4,#0x9
    mov        r5,#0x1
    ldr        r0,PTR_TextData_BattleChip_Names_0807c4c4
    ldr        r6,PTR_tilesetBoldAlphanumeric_0807c4d4
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r2,r3,r7}
    mov        r0,#0x24
    lsl        r0,r0,#0x4
    add        r2,r2,r0
    add        r3,r3,r0
    push       {r2,r3,r7}
    ldrb       r1,[r7,#0x1]
    mov        r4,#0x1
    mov        r5,#0x1
    ldr        r0,PTR_TextData_BattleChip_Codes_0807c4c8
    ldr        r6,PTR_tilesetBoldAlphanumeric_0807c4d4
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r2,r3,r7}
    pop        {r4,r5}
    add        r2,#0x40
    add        r3,#0x40
    add        r7,#0x2
    sub        r4,#0x1
    bne        LAB_0807c47c
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    pop        {pc}

PTR_TextData_BattleChip_Names_0807c4c4:
    .word TextData_BattleChip_Names

PTR_TextData_BattleChip_Codes_0807c4c8:
    .word TextData_BattleChip_Codes

PTR_iwBufferUITextTile_0807c4cc:
    .word iwBufferUITextTile

PTR_DAT_0807c4d0:
    .word 0x600B200

PTR_tilesetBoldAlphanumeric_0807c4d4:
    .word tilesetBoldAlphanumeric


_ts E_ProgramAdvance_1_2_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c506
    mov        r4,#0x0
LAB_0807c4e4:
    push       {r4}
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    mov        r2,#0xc
    bl         FUN_0807cbf0
    pop        {r4}
    add        r4,#0x1
    ldrb       r6,[r5,#0xd]
    cmp        r4,r6
    blt        LAB_0807c4e4
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
LAB_0807c506:
    pop        {pc}
    .byte 0x90
    .byte 0xC3

    .align 2, 0



_ts E_ProgramAdvance_1_2_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c51e
    mov        r0,#0xc
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807c51e:
    pop        {pc}


_ts E_ProgramAdvance_1_3
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_3_0_0807c53c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x1
    bl         BattleMessage_Main_2
    pop        {r5}
    pop        {pc}

    .align 2, 0


PTR_PTR_E_ProgramAdvance_1_3_0_0807c53c:
    .word PTR_E_ProgramAdvance_1_3_0_0807c540

PTR_E_ProgramAdvance_1_3_0_0807c540:
    .word E_ProgramAdvance_1_3_0
    .word E_ProgramAdvance_1_3_1
    .word E_ProgramAdvance_1_3_2


_ts E_ProgramAdvance_1_3_0
    push       {lr}
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0xe3
    bl         Sound_PlaySongImmediate
    pop        {pc}


_nt E_ProgramAdvance_1_3_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c56e
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    b          LAB_0807c592
LAB_0807c56e:
    ldrb       r3,[r5,#0x1b]
    ldrb       r4,[r5,#0xf]
LAB_0807c572:
    ldrh       r2,[r5,#0x1c]
    mov        r1,#0x10
    and        r2,r1
    lsr        r2,r2,#0x4
    add        r2,#0xd
    push       {r3,r4}
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    bl         FUN_0807cbf0
    pop        {r3,r4}
    add        r4,#0x1
    sub        r3,#0x1
    bgt        LAB_0807c572
LAB_0807c592:
    pop        {pc}


_ts E_ProgramAdvance_1_3_2
    push       {lr}
    ldrb       r3,[r5,#0x1b]
    ldrb       r4,[r5,#0xf]
LAB_0807c59a:
    push       {r3,r4}
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    bl         FUN_0807cc24
    pop        {r3,r4}
    add        r4,#0x1
    sub        r3,#0x1
    bgt        LAB_0807c59a
    mov        r0,#0x10
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    pop        {pc}


_nt E_ProgramAdvance_1_4
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_4_0_0807c5d4
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x1
    bl         BattleMessage_Main_2
    pop        {r5}
    pop        {pc}

PTR_PTR_E_ProgramAdvance_1_4_0_0807c5d4:
    .word PTR_E_ProgramAdvance_1_4_0_0807c5d8

PTR_E_ProgramAdvance_1_4_0_0807c5d8:
    .word E_ProgramAdvance_1_4_0
    .word E_ProgramAdvance_1_4_1
    .word E_ProgramAdvance_1_4_2


_ts E_ProgramAdvance_1_4_0
    push       {lr}
    ldrb       r0,[r5,#0xf]
    mov        r1,#0x28
    lsl        r1,r1,#0x4
    mul        r0,r1
    ldr        r2,PTR_iwBufferUITextTile_0807c618
    add        r2,r2,r0
    ldr        r3,PTR_DAT_0807c61c
    add        r3,r3,r0
    push       {r5}
    ldr        r0,PTR_TextData_BattleChip_Names_0807c614
    ldrb       r1,[r5,#0xe]
    mov        r4,#0xa
    mov        r5,#0x1
    ldr        r6,PTR_tilesetBoldAlphanumeric_0807c620
    mov        r7,#0x0
    bl         Text_CopyCharTileUI
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x14
    strh       r0,[r5,#0x1c]
    pop        {pc}

PTR_TextData_BattleChip_Names_0807c614:
    .word TextData_BattleChip_Names

PTR_iwBufferUITextTile_0807c618:
    .word iwBufferUITextTile

PTR_DAT_0807c61c:
    .word 0x600B200

PTR_tilesetBoldAlphanumeric_0807c620:
    .word tilesetBoldAlphanumeric


_ts E_ProgramAdvance_1_4_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c64c
    ldrb       r4,[r5,#0xf]
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    mov        r2,#0xc
    bl         FUN_0807cbf0
    mov        r0,#0x3c
    strh       r0,[r5,#0x1c]
    mov        r0,#0x8
    strh       r0,[r5,#0xa]
    mov        r0,#0xdf
    bl         Sound_PlaySongImmediate
LAB_0807c64c:
    pop        {pc}


_nt E_ProgramAdvance_1_4_2
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c662
    mov        r0,#0x14
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
    b          LAB_0807c67a
LAB_0807c662:
    ldrh       r2,[r5,#0x1c]
    mov        r1,#0x8
    and        r2,r1
    lsr        r2,r2,#0x3
    add        r2,#0xd
    ldrb       r4,[r5,#0xf]
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    bl         FUN_0807cbf0
LAB_0807c67a:
    pop        {pc}


_ts E_ProgramAdvance_1_5
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_5_0_0807c68c
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0


PTR_PTR_E_ProgramAdvance_1_5_0_0807c68c:
    .word PTR_E_ProgramAdvance_1_5_0_0807c690

PTR_E_ProgramAdvance_1_5_0_0807c690:
    .word E_ProgramAdvance_1_5_0
    .word E_ProgramAdvance_1_5_1


_ts E_ProgramAdvance_1_5_0
    push       {lr}
    mov        r4,#0x0
LAB_0807c69c:
    push       {r4}
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    bl         FUN_0807cc24
    pop        {r4}
    add        r4,#0x1
    ldrb       r6,[r5,#0xd]
    cmp        r4,r6
    blt        LAB_0807c69c
    mov        r0,#0x0
    strb       r0,[r5,#0xc]
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x0
    bl         BattleMessage_Main_2
    pop        {r5}
    pop        {pc}


_nt E_ProgramAdvance_1_5_1
    push       {lr}
    push       {r5}
    mov        r0,#0x3
    mov        r1,#0x0
    bl         BattleMessage_Main_2
    pop        {r5}
    tst        r0,r0
    bne        LAB_0807c6ec
    mov        r0,#0x0
    strh       r0,[r5,#0x1c]
    mov        r0,#0x18
    strb       r0,[r5,#0x9]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807c6ec:
    pop        {pc}


_nt E_ProgramAdvance_1_6
    push       {lr}
    ldrb       r0,[r5,#0xa]
    ldr        r7,PTR_PTR_E_ProgramAdvance_1_6_0_0807c6fc
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PTR_E_ProgramAdvance_1_6_0_0807c6fc:
    .word PTR_E_ProgramAdvance_1_6_0_0807c700

PTR_E_ProgramAdvance_1_6_0_0807c700:
    .word E_ProgramAdvance_1_6_0
    .word E_ProgramAdvance_1_6_1


_ts E_ProgramAdvance_1_6_0
    push       {lr}
    mov        r4,#0x0
LAB_0807c70c:
    push       {r4}
    mov        r0,#0x3
    add        r1,r4,r4
    add        r1,r1,r4
    add        r1,#0x6
    bl         FUN_0807cc24
    pop        {r4}
    add        r4,#0x1
    ldrb       r6,[r5,#0xd]
    cmp        r4,r6
    blt        LAB_0807c70c
    mov        r0,#0xb
    mov        r1,#0x4
    push       {r5}
    bl         Fade_Request
    pop        {r5}
    bl         FUN_0807cc46
    mov        r0,#0x4
    strb       r0,[r5,#0xa]
    mov        r0,#0x28
    strh       r0,[r5,#0x1c]
    pop        {pc}


_nt E_ProgramAdvance_1_6_1
    push       {lr}
    ldrh       r0,[r5,#0x1c]
    sub        r0,#0x1
    strh       r0,[r5,#0x1c]
    bne        LAB_0807c750
    mov        r0,#0x8
    strh       r0,[r5,#0x8]
    mov        r0,#0x0
    strh       r0,[r5,#0xa]
LAB_0807c750:
    pop        {pc}


_nt E_ProgramAdvance_2_Free
    push       {lr}
    LoadMain battle, r7, r7
    mov        r0,#0x1
    strh       r0,[r7,#0x2e]
    push       {r5}
    ldr        r7,PTR_PTR_paletteCustomScreenBg_1_0807c774
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r5}
    bl         Effect_Free
    pop        {pc}

    .align 2, 0


PTR_PTR_paletteCustomScreenBg_1_0807c774:
    .word PTR_paletteCustomScreenBg_1_0807c778

PTR_paletteCustomScreenBg_1_0807c778:
    .word paletteCustomScreenBg_1
    .word eBgPaletteC
    .word 0x8


_ts FUN_0807c784
    ldrb       r3,[r0,#0x0]
    ldrb       r4,[r1,#0x0]
    cmp        r3,r4
    bne        LAB_0807c796
    add        r0,#0x1
    add        r1,#0x1
    sub        r2,#0x1
    beq        LAB_0807c79a
    b          FUN_0807c784
LAB_0807c796:
    mov        r0,#0x1
    mov        pc,lr
LAB_0807c79a:
    mov        r0,#0x0
    mov        pc,lr


_nt Effect_ProgramAdvance_Create
    push       {lr}
    mov        r0,#0xc
    bl         Effect_Alloc
    tst        r5,r5
    beq        LAB_0807c7ae
    mov        r0,#0xd
    strb       r0,[r5,#0x0]
LAB_0807c7ae:
    pop        {pc}


_ts FUN_0807c7b0
    push       {lr}
    sub        sp,#0x4
    LoadMain battle, r7, r7
    ldrb       r0,[r7,#0x19]
    add        r0,#0x78
    add        r7,r7,r0
    mov        r0,#0x0
LAB_0807c7c0:
    ldrb       r1,[r7,r0]
    cmp        r1,#0xff
    beq        LAB_0807c7ca
    add        r0,#0x1
    b          LAB_0807c7c0
LAB_0807c7ca:
    strb       r0,[r5,#0xd]
    push       {r7}
    add        r6,r7,#0x0
    mov        r7,#0x60
    add        r7,r7,r5
    add        r2,r0,#0x0
LAB_0807c7d6:
    sub        r2,#0x1
    blt        LAB_0807c7e8
    ldrb       r3,[r6,#0x0]
    strb       r3,[r7,#0x0]
    ldrb       r3,[r6,#0x6]
    strb       r3,[r7,#0x1]
    add        r6,#0x1
    add        r7,#0x2
    b          LAB_0807c7d6
LAB_0807c7e8:
    pop        {r7}
    mov        r1,#0x5
LAB_0807c7ec:
    cmp        r0,r1
    blt        LAB_0807c810
    mov        r2,#0x0
LAB_0807c7f2:
    add        r3,r1,r2
    cmp        r0,r3
    blt        LAB_0807c810
    push       {r0,r1,r2}
    add        r0,r7,r2
    push       {r7}
    bl         FUN_0807cb58
    add        r3,r1,#0x0
    pop        {r7}
    tst        r0,r0
    pop        {r0,r1,r2}
    bne        LAB_0807c818
    add        r2,#0x1
    b          LAB_0807c7f2
LAB_0807c810:
    sub        r1,#0x1
    cmp        r1,#0x2
    ble        LAB_0807c822
    b          LAB_0807c7ec
LAB_0807c818:
    mov        r0,#0x1
    strb       r1,[r5,#0x1b]
    strb       r2,[r5,#0xf]
    strb       r3,[r5,#0xe]
    b          LAB_0807c824
LAB_0807c822:
    mov        r0,#0x0
LAB_0807c824:
    add        sp,#0x4
    pop        {pc}

listProgramAdvance3Chip:
    .byte 0x01, 0x00
    .byte 0x01, 0x01
    .byte 0x01, 0x02
    .byte 0xCA, 0x00
    .byte 0x01, 0x01
    .byte 0x01, 0x02
    .byte 0x01, 0x03
    .byte 0xCA, 0x00
    .byte 0x01, 0x02
    .byte 0x01, 0x03
    .byte 0x01, 0x04
    .byte 0xCA, 0x00
    .byte 0x02, 0x05
    .byte 0x02, 0x06
    .byte 0x02, 0x07
    .byte 0xCB, 0x00
    .byte 0x02, 0x06
    .byte 0x02, 0x07
    .byte 0x02, 0x08
    .byte 0xCB, 0x00
    .byte 0x02, 0x07
    .byte 0x02, 0x08
    .byte 0x02, 0x09
    .byte 0xCB, 0x00
    .byte 0x03, 0x0A
    .byte 0x03, 0x0B
    .byte 0x03, 0x0C
    .byte 0xCC, 0x00
    .byte 0x03, 0x0B
    .byte 0x03, 0x0C
    .byte 0x03, 0x0D
    .byte 0xCC, 0x00
    .byte 0x03, 0x0C
    .byte 0x03, 0x0D
    .byte 0x03, 0x0E
    .byte 0xCC, 0x00
    .byte 0x0A, 0x07
    .byte 0x0A, 0x08
    .byte 0x0A, 0x09
    .byte 0xCD, 0x00
    .byte 0x0A, 0x08
    .byte 0x0A, 0x09
    .byte 0x0A, 0x0A
    .byte 0xCD, 0x00
    .byte 0x0A, 0x09
    .byte 0x0A, 0x0A
    .byte 0x0A, 0x0B
    .byte 0xCD, 0x00
    .byte 0x3A, 0x00
    .byte 0x3A, 0x01
    .byte 0x3A, 0x02
    .byte 0xCE, 0x00
    .byte 0x3A, 0x01
    .byte 0x3A, 0x02
    .byte 0x3A, 0x03
    .byte 0xCE, 0x00
    .byte 0x3A, 0x02
    .byte 0x3A, 0x03
    .byte 0x3A, 0x04
    .byte 0xCE, 0x00
    .byte 0x3B, 0x05
    .byte 0x3B, 0x06
    .byte 0x3B, 0x07
    .byte 0xCF, 0x00
    .byte 0x3B, 0x06
    .byte 0x3B, 0x07
    .byte 0x3B, 0x08
    .byte 0xCF, 0x00
    .byte 0x3B, 0x07
    .byte 0x3B, 0x08
    .byte 0x3B, 0x09
    .byte 0xCF, 0x00
    .byte 0x3C, 0x0A
    .byte 0x3C, 0x0B
    .byte 0x3C, 0x0C
    .byte 0xD0, 0x00
    .byte 0x3C, 0x0B
    .byte 0x3C, 0x0C
    .byte 0x3C, 0x0D
    .byte 0xD0, 0x00
    .byte 0x3C, 0x0C
    .byte 0x3C, 0x0D
    .byte 0x3C, 0x0E
    .byte 0xD0, 0x00
    .byte 0x25, 0x00
    .byte 0x25, 0x01
    .byte 0x25, 0x02
    .byte 0xD1, 0x00
    .byte 0x25, 0x01
    .byte 0x25, 0x02
    .byte 0x25, 0x03
    .byte 0xD1, 0x00
    .byte 0x25, 0x02
    .byte 0x25, 0x03
    .byte 0x25, 0x04
    .byte 0xD1, 0x00
    .byte 0x26, 0x05
    .byte 0x26, 0x06
    .byte 0x26, 0x07
    .byte 0xD2, 0x00
    .byte 0x26, 0x06
    .byte 0x26, 0x07
    .byte 0x26, 0x08
    .byte 0xD2, 0x00
    .byte 0x26, 0x07
    .byte 0x26, 0x08
    .byte 0x26, 0x09
    .byte 0xD2, 0x00
    .byte 0x27, 0x0A
    .byte 0x27, 0x0B
    .byte 0x27, 0x0C
    .byte 0xD3, 0x00
    .byte 0x27, 0x0B
    .byte 0x27, 0x0C
    .byte 0x27, 0x0D
    .byte 0xD3, 0x00
    .byte 0x27, 0x0C
    .byte 0x27, 0x0D
    .byte 0x27, 0x0E
    .byte 0xD3, 0x00
    .byte 0x1C, 0x01
    .byte 0x1D, 0x01
    .byte 0x1F, 0x01
    .byte 0xE8, 0x00
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0xDE, 0x00
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0xDF, 0x00
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0xE0, 0x00
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0xE1, 0x00
    .byte 0x22, 0x06
    .byte 0x1F, 0x06
    .byte 0xA3, 0x06
    .byte 0xEB, 0x00
    .byte 0x22, 0x06
    .byte 0x1F, 0x06
    .byte 0xA4, 0x06
    .byte 0xEB, 0x00
    .byte 0x22, 0x06
    .byte 0x1F, 0x06
    .byte 0xA5, 0x06
    .byte 0xEB, 0x00
    .byte 0x93, 0x11
    .byte 0x55, 0x11
    .byte 0xA0, 0x11
    .byte 0xEC, 0x00
    .byte 0x93, 0x11
    .byte 0x55, 0x11
    .byte 0xA1, 0x11
    .byte 0xEC, 0x00
    .byte 0x93, 0x11
    .byte 0x55, 0x11
    .byte 0xA2, 0x11
    .byte 0xEC, 0x00
    .byte -1

    .align 2, 0


listProgramAdvance4Chip:
    .byte 0x0E, 0x0A
    .byte 0x0F, 0x0A
    .byte 0x0A, 0x0A
    .byte 0x03, 0x0A
    .byte 0xE6, 0x00
    .byte 0x7F, 0x02
    .byte 0x80, 0x02
    .byte 0x81, 0x02
    .byte 0x18, 0x02
    .byte 0xE7, 0x00
    .byte 0x79, 0x00
    .byte 0x7A, 0x00
    .byte 0x7B, 0x00
    .byte 0x85, 0x00
    .byte 0xE9, 0x00
    .byte 0x28, 0x06
    .byte 0x29, 0x06
    .byte 0x2A, 0x06
    .byte 0x58, 0x06
    .byte 0xEA, 0x00
    .byte 0x1E, 0x01
    .byte 0x20, 0x01
    .byte 0x21, 0x01
    .byte 0xA6, 0x01
    .byte 0xED, 0x00
    .byte 0x1E, 0x01
    .byte 0x20, 0x01
    .byte 0x21, 0x01
    .byte 0xA7, 0x01
    .byte 0xED, 0x00
    .byte 0x1E, 0x01
    .byte 0x20, 0x01
    .byte 0x21, 0x01
    .byte 0xA8, 0x01
    .byte 0xED, 0x00
    .byte -1

    .align 2, 0


listProgramAdvance5Chip:
    .byte 0x01, 0x00
    .byte 0x01, 0x01
    .byte 0x01, 0x02
    .byte 0x01, 0x03
    .byte 0x01, 0x04
    .byte 0xD4, 0x00
    .byte 0x02, 0x05
    .byte 0x02, 0x06
    .byte 0x02, 0x07
    .byte 0x02, 0x08
    .byte 0x02, 0x09
    .byte 0xD5, 0x00
    .byte 0x03, 0x0A
    .byte 0x03, 0x0B
    .byte 0x03, 0x0C
    .byte 0x03, 0x0D
    .byte 0x03, 0x0E
    .byte 0xD6, 0x00
    .byte 0x0A, 0x07
    .byte 0x0A, 0x08
    .byte 0x0A, 0x09
    .byte 0x0A, 0x0A
    .byte 0x0A, 0x0B
    .byte 0xD7, 0x00
    .byte 0x3A, 0x00
    .byte 0x3A, 0x01
    .byte 0x3A, 0x02
    .byte 0x3A, 0x03
    .byte 0x3A, 0x04
    .byte 0xD8, 0x00
    .byte 0x3B, 0x05
    .byte 0x3B, 0x06
    .byte 0x3B, 0x07
    .byte 0x3B, 0x08
    .byte 0x3B, 0x09
    .byte 0xD9, 0x00
    .byte 0x3C, 0x0A
    .byte 0x3C, 0x0B
    .byte 0x3C, 0x0C
    .byte 0x3C, 0x0D
    .byte 0x3C, 0x0E
    .byte 0xDA, 0x00
    .byte 0x25, 0x00
    .byte 0x25, 0x01
    .byte 0x25, 0x02
    .byte 0x25, 0x03
    .byte 0x25, 0x04
    .byte 0xDB, 0x00
    .byte 0x26, 0x05
    .byte 0x26, 0x06
    .byte 0x26, 0x07
    .byte 0x26, 0x08
    .byte 0x26, 0x09
    .byte 0xDC, 0x00
    .byte 0x27, 0x0A
    .byte 0x27, 0x0B
    .byte 0x27, 0x0C
    .byte 0x27, 0x0D
    .byte 0x27, 0x0E
    .byte 0xDD, 0x00
    .byte 0x07, 0x01
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x07, 0x01
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x07, 0x01
    .byte 0x07, 0x01
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x08, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x07, 0x01
    .byte 0x08, 0x01
    .byte 0x09, 0x01
    .byte 0x09, 0x01
    .byte 0x09, 0x01
    .byte 0xE2, 0x00
    .byte 0x04, 0x12
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x04, 0x12
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x04, 0x12
    .byte 0x04, 0x12
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x05, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x04, 0x12
    .byte 0x05, 0x12
    .byte 0x06, 0x12
    .byte 0x06, 0x12
    .byte 0x06, 0x12
    .byte 0xE3, 0x00
    .byte 0x10, 0x02
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x10, 0x02
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x10, 0x02
    .byte 0x10, 0x02
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x11, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x10, 0x02
    .byte 0x11, 0x02
    .byte 0x12, 0x02
    .byte 0x12, 0x02
    .byte 0x12, 0x02
    .byte 0xE4, 0x00
    .byte 0x16, 0x10
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte 0x16, 0x10
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte 0x16, 0x10
    .byte 0x16, 0x10
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x17, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte 0x16, 0x10
    .byte 0x17, 0x10
    .byte 0x18, 0x10
    .byte 0x18, 0x10
    .byte 0x18, 0x10
    .byte 0xE5, 0x00
    .byte -1

    .align 2, 0



_ts FUN_0807cb58
    push       {lr}
    sub        sp,#0x14
    add        r6,r0,#0x0
    mov        r7,sp
    add        r2,r1,#0x0
LAB_0807cb62:
    sub        r2,#0x1
    blt        LAB_0807cb74
    ldrb       r3,[r6,#0x0]
    strb       r3,[r7,#0x0]
    ldrb       r3,[r6,#0x6]
    strb       r3,[r7,#0x1]
    add        r6,#0x1
    add        r7,#0x2
    b          LAB_0807cb62
LAB_0807cb74:
    mov        r7,sp
    ldr        r6,PTR_listProgramAdvance_0807cbb0
    sub        r2,r1,#0x3
    lsl        r2,r2,#0x2
    ldr        r6,[r6,r2]
LAB_0807cb7e:
    ldrb       r2,[r6,#0x0]
    cmp        r2,#0xff
    beq        LAB_0807cbaa
    mov        r4,#0x0
LAB_0807cb86:
    push       {r4}
    add        r4,r4,r4
    ldrh       r2,[r7,r4]
    ldrh       r3,[r6,r4]
    pop        {r4}
    cmp        r2,r3
    bne        LAB_0807cba2
    add        r4,#0x1
    cmp        r4,r1
    blt        LAB_0807cb86
    mov        r0,#0x1
    add        r4,r4,r4
    ldrb       r1,[r6,r4]
    b          LAB_0807cbac
LAB_0807cba2:
    add        r2,r1,r1
    add        r2,#0x2
    add        r6,r6,r2
    b          LAB_0807cb7e
LAB_0807cbaa:
    mov        r0,#0x0
LAB_0807cbac:
    add        sp,#0x14
    pop        {pc}

PTR_listProgramAdvance_0807cbb0:
    .word listProgramAdvance

listProgramAdvance:
    .word listProgramAdvance3Chip
    .word listProgramAdvance4Chip
    .word listProgramAdvance5Chip


_ts FUN_0807cbc0
    push       {lr}
    ldr        r2,PTR_DAT_0807cbd8
    mov        r3,#0x0
LAB_0807cbc6:
    ldrb       r4,[r2,r3]
    add        r4,r4,r1
    strh       r4,[r0,#0x0]
    add        r0,#0x2
    add        r3,#0x1
    cmp        r3,#0x14
    blt        LAB_0807cbc6
    pop        {pc}

    .align 2, 0


PTR_DAT_0807cbd8:
    .word DAT_0807cbdc

DAT_0807cbdc:
    .byte 0x00

DAT_0807cbdd:
    .byte 0x02
    .byte 0x04
    .byte 0x06
    .byte 0x08
    .byte 0x0A
    .byte 0x0C
    .byte 0x0E
    .byte 0x10
    .byte 0x12
    .byte 0x01
    .byte 0x03
    .byte 0x05
    .byte 0x07
    .byte 0x09
    .byte 0x0B
    .byte 0x0D
    .byte 0x0F
    .byte 0x11
    .byte 0x13


_ts FUN_0807cbf0
    push       {r5,lr}
    sub        sp,#0x28
    mov        r6,sp
    push       {r0,r1}
    lsl        r0,r4,#0x2
    lsl        r1,r4,#0x4
    add        r0,r0,r1
    ldr        r1,DAT_0807cc20
    add        r1,r1,r0
    lsl        r2,r2,#0xc
    orr        r1,r2
    add        r0,r6,#0x0
    bl         FUN_0807cbc0
    pop        {r0,r1}
    mov        r2,#0x3
    mov        r3,sp
    mov        r4,#0xa
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    add        sp,#0x28
    pop        {r5,pc}

    .align 2, 0


DAT_0807cc20:
    .word 0xC390


_ts FUN_0807cc24
    push       {r5,lr}
    sub        sp,#0x28
    mov        r6,sp
    push       {r0,r1}
    add        r0,r6,#0x0
    mov        r1,#0x28
    bl         memset0_16
    pop        {r0,r1}
    mov        r2,#0x3
    mov        r3,sp
    mov        r4,#0xa
    mov        r5,#0x2
    bl         Screen_CopyTileMapRect
    add        sp,#0x28
    pop        {r5,pc}


_nt FUN_0807cc46
    push       {lr}
    LoadMain battle, r7, r7
    mov        r6,#0x78
    ldrb       r0,[r7,#0x19]
    add        r6,r6,r0
    ldrb       r0,[r5,#0xf]
    add        r6,r6,r0
    add        r6,r6,r7
    add        r0,r6,#0x0
    ldrb       r1,[r5,#0x1b]
    mov        r2,#0xff
    bl         memset
    ldrb       r0,[r5,#0xe]
    strb       r0,[r6,#0x0]
    mov        r0,#0x78
    add        r0,r0,r7
    mov        r1,#0x6
    push       {r7}
    bl         CustomScreen_NormalizeChipGroup
    pop        {r7}
    mov        r6,#0x7e
    ldrb       r0,[r7,#0x19]
    add        r6,r6,r0
    ldrb       r0,[r5,#0xf]
    add        r6,r6,r0
    add        r6,r6,r7
    add        r0,r6,#0x0
    ldrb       r1,[r5,#0x1b]
    mov        r2,#0xff
    bl         memset
    pop        {pc}
