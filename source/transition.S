#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

_ts InitTransition
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x30]
    ldrb       r1,[r5,#0x3]
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    strb       r1,[r5,#0x3]
    pop        { pc }

_ts Transition_Main
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x30]
    ldr        r2,[r7,#0x8]
    ldrb       r0,[r2,#0x4]
    cmp        r0,#0x80
    bge        LAB_08017516
    ldr        r0,PTR_jumpTableJackIn_08017850
    b          LAB_08017518
LAB_08017516:
    ldr        r0,PTR_jumpTableJackOut_08017854
LAB_08017518:
    ldrb       r1,[r5,#0x0]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        { pc }

jumpTableJackIn:
    .word JackIn_Init
    .word JackIn_Animate
    .word JackIn_Finish
jumpTableJackOut:
    .word JackOut_Init
    .word JackOut_Animate
    .word JackOut_Finish


_ts JackIn_Init
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    ldr        r0,PTR_eFrameWaitValue_08017858
    mov        r1,#0x4
    strh       r1,[r0,#0x0]
    push       {r5}
    bl         dummy_177c4
    bl         Layout_LoadJackInLayout
    pop        {r5}
    ldr        r0,[r7,#0x10]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    mov        r0,#0x5
    bl         Sound_ChangeSong
    pop        {pc}


_ts JackIn_Animate
    push       {lr}
    ldr        r0,PTR_PTR_JackIn_StartAnimation_0801785c
    ldrb       r1,[r5,#0x1]
    lsl        r1,r1,#0x2
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_JackIn_StartAnimation_0801757c:
    .word JackIn_StartAnimation
    .word JackIn_PlayAnimation


_ts JackIn_Finish
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r0,PTR_eFrameWaitValue_08017860
    mov        r1,#0x1
    strh       r1,[r0,#0x0]
    push       {r5,r7}
    bl         Video_ClearAllTile0Maps
    pop        {r5,r7}
    ldr        r0,[r7,#0x8]
    mov        r1,#0x1
    strb       r1,[r0,#0x7]
    push       {r5}
    ldrb       r0,[r5,#0x3]
    bl         World_ChangeMap
    pop        {r5}
    bl         Sound_StopAllMusic
    pop        {pc}


_ts JackIn_StartAnimation
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    bl         Video_SetBgControl
    pop        {r5}
    push       {r5}
    mov        r0,#0x1
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1
    strb       r0,[r5,#0x1]
    pop        {pc}


_ts JackIn_PlayAnimation
    push       {lr}
    ldrb       r0,[r5,#0x2]
    lsl        r3,r0,#0x3
    mov        r1,#0x1
    and        r0,r1
    ldr        r1,PTR_PTR_lzTilesetJackInFrame00_08017864
    add        r1,r1,r3
    ldr        r2,[r1,#0x0]
    ldr        r3,[r1,#0x4]
    cmp        r2,#0x0
    blt        LAB_0801763e
    lsl        r0,r0,#0x2
    ldr        r4,PTR_DispCnt_08017868
    ldrh       r1,[r4,r0]
    mov        r7,r10
    ldr        r4,[r7,#0x10]
    strh       r1,[r4,#0x0]
    ldr        r1,PTR_PTR_BG_VRAM_BASE0_0801786c
    ldr        r1,[r1,r0]
    push       {r0,r1,r3,r5}
    add        r0,r2,#0x0
    ldr        r1,PTR_gTempMemory_08017870
    bl         SWI_LZ77UnCompWram
    pop        {r0,r1,r3,r5}
    push       {r0,r3,r5}
    ldr        r0,PTR_gTempMemory_08017870
    ldr        r2,INT_08017874
    mov        r3,#0x3
    ldr        r4,DAT_08017878
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    pop        {r0,r3,r5}
    ldr        r1,PTR_PTR_eBgPalette0_0801787c
    ldr        r1,[r1,r0]
    push       {r5}
    add        r0,r3,#0x0
    mov        r2,#0x8
    mov        r3,#0x3
    ldr        r4,DAT_08017878
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    pop        {r5}
    ldrb       r0,[r5,#0x2]
    add        r0,#0x1
    strb       r0,[r5,#0x2]
    b          LAB_08017664
LAB_0801763e:
    mov        r0,#0x0
    strb       r0,[r5,#0x1]
    strb       r0,[r5,#0x2]
    mov        r0,#0x2
    strb       r0,[r5,#0x0]
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,[r5,#0x4]
    str        r1,[r0,#0x14]
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0xff
    bl         Fade_Request
    pop        {r5}
LAB_08017664:
    pop        {pc}

    .align 2, 0

PTR_lzTilesetJackInFrame00_08017668:
    .word lzTilesetJackInFrame00
    .word paletteJackInFrame00
    .word lzTilesetJackInFrame01
    .word paletteJackInFrame01
    .word lzTilesetJackInFrame02
    .word paletteJackInFrame02
    .word lzTilesetJackInFrame03
    .word paletteJackInFrame03
    .word lzTilesetJackInFrame04
    .word paletteJackInFrame04
    .word lzTilesetJackInFrame05
    .word paletteJackInFrame05
    .word lzTilesetJackInFrame06
    .word paletteJackInFrame06
    .word lzTilesetJackInFrame07
    .word paletteJackInFrame07
    .word lzTilesetJackInFrame08
    .word paletteJackInFrame08
    .word lzTilesetJackInFrame09
    .word paletteJackInFrame09
    .word lzTilesetJackInFrame10
    .word paletteJackInFrame10
    .word lzTilesetJackInFrame11
    .word paletteJackInFrame11
    .word lzTilesetJackInFrame12
    .word paletteJackInFrame12
    .word lzTilesetJackInFrame13
    .word paletteJackInFrame13
    .word lzTilesetJackInFrame14
    .word paletteJackInFrame14
    .word lzTilesetJackInFrame05
    .word paletteJackInFrame05
    .word lzTilesetJackInFrame06
    .word paletteJackInFrame06
    .word lzTilesetJackInFrame07
    .word paletteJackInFrame07
    .word lzTilesetJackInFrame08
    .word paletteJackInFrame08
    .word lzTilesetJackInFrame09
    .word paletteJackInFrame09
    .word lzTilesetJackInFrame10
    .word paletteJackInFrame10
    .word lzTilesetJackInFrame11
    .word paletteJackInFrame11
    .word lzTilesetJackInFrame12
    .word paletteJackInFrame12
    .word lzTilesetJackInFrame13
    .word paletteJackInFrame13
    .word lzTilesetJackInFrame14
    .word paletteJackInFrame14
    .word lzTilesetJackInFrame05
    .word paletteJackInFrame05
    .word lzTilesetJackInFrame06
    .word paletteJackInFrame06
    .word lzTilesetJackInFrame07
    .word paletteJackInFrame07
    .word lzTilesetJackInFrame08
    .word paletteJackInFrame08
    .word lzTilesetJackInFrame09
    .word paletteJackInFrame09
    .word lzTilesetJackInFrame10
    .word paletteJackInFrame10
    .word lzTilesetJackInFrame11
    .word paletteJackInFrame11
    .word lzTilesetJackInFrame12
    .word paletteJackInFrame12
    .word lzTilesetJackInFrame13
    .word paletteJackInFrame13
    .word lzTilesetJackInFrame14
    .word paletteJackInFrame14
    .word lzTilesetJackInFrame15
    .word paletteJackInFrame15
    .word lzTilesetJackInFrame16
    .word paletteJackInFrame16
    .word lzTilesetJackInFrame17
    .word paletteJackInFrame17
    .word lzTilesetJackInFrame18
    .word paletteJackInFrame18
    .word lzTilesetJackInFrame19
    .word paletteJackInFrame19
    .word -1
PTR_BG_VRAM_BASE0_080177ac:
    .word BG_VRAM_BASE0
    .word 0x6006000
PTR_eBgPalette0_080177b4:
    .word eBgPalette0
    .word eBgPalette1
DispCnt_080177bc:
    .word 0x340
    .word 0x540


_ts dummy_177c4
    push       {lr}
    pop        {pc}


_ts Layout_LoadJackInLayout
    push       {lr}
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x1
    mov        r3,#0x0
LAB_080177d2:
    push       {r0,r1,r2,r3}
    bl         Screen_CopyTileMapEntry
    pop        {r0,r1,r2,r3}
    add        r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_080177d2
    add        r1,#0x1
    mov        r0,#0x0
    cmp        r1,#0x14
    bne        LAB_080177d2
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x2
    ldr        r3,PTR_DAT_08017880
LAB_080177f2:
    push       {r0,r1,r2,r3}
    bl         Screen_CopyTileMapEntry
    pop        {r0,r1,r2,r3}
    add        r3,#0x1
    add        r0,#0x1
    cmp        r0,#0x1e
    bne        LAB_080177f2
    add        r1,#0x1
    mov        r0,#0x0
    cmp        r1,#0x14
    bne        LAB_080177f2
    pop        {pc}


_ts JackOut_Init
    push       {lr}
    mov        r0,#0x1
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts JackOut_Animate
    push       {lr}
    mov        r0,#0x2
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts JackOut_Finish
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    push       {r5,r7}
    bl         Video_ClearAllTile0Maps
    pop        {r5,r7}
    ldr        r0,[r7,#0x8]
    mov        r1,#0x1
    strb       r1,[r0,#0x7]
    ldr        r0,[r7,#0x2c]
    mov        r1,#0x1
    strb       r1,[r0,#0x10]
    mov        r1,#0x1
    strb       r1,[r0,#0x12]
    ldr        r1,[r5,#0x4]
    str        r1,[r0,#0x14]
    push       {r5}
    ldrb       r0,[r5,#0x3]
    bl         World_ChangeMap
    pop        {r5}
    pop        {pc}

    .align 2, 0

PTR_jumpTableJackIn_08017850:
    .word jumpTableJackIn
PTR_jumpTableJackOut_08017854:
    .word jumpTableJackOut
PTR_eFrameWaitValue_08017858:
    .word eFrameWaitValue
PTR_PTR_JackIn_StartAnimation_0801785c:
    .word PTR_JackIn_StartAnimation_0801757c
PTR_eFrameWaitValue_08017860:
    .word eFrameWaitValue
PTR_PTR_lzTilesetJackInFrame00_08017864:
    .word PTR_lzTilesetJackInFrame00_08017668
PTR_DispCnt_08017868:
    .word DispCnt_080177bc
PTR_PTR_BG_VRAM_BASE0_0801786c:
    .word PTR_BG_VRAM_BASE0_080177ac
PTR_gTempMemory_08017870:
    .word gTempMemory
INT_08017874:
    .word 0x12C0
DAT_08017878:
    .word 0x84000000
PTR_PTR_eBgPalette0_0801787c:
    .word PTR_eBgPalette0_080177b4
PTR_DAT_08017880:
    .word 0x1100
