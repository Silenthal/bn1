    .include "constants.inc"
    .include "macros.inc"

    .set tileSetKeyboardNumberChars, 0x086132a8
    .set paletteKeyboardNumberChars, 0x0861baa8
    .text

    .thumb

thumb_func_start Video_ClearAndLoadSmallNumbers
Video_ClearAndLoadSmallNumbers:
    push       { lr }
    ldr        r0,PTR_gFillValue_08001b2c
    ldr        r1,PTR_BG_VRAM_SCREEN0_08001b30
    ldr        r2,INT_08001b34
    mov        r3,#0x3
    ldr        r4,DAT_08001b38
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    bl         Video_ClearScreenBuffersToValue
    ldr        r0,PTR_tileSetKeyboardNumberChars_08001b3c
    ldr        r1,vram_off_c
    ldr        r2,INT_08001b44
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_08001b48
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_paletteKeyboardNumberChars_08001b4c
    ldr        r1,PTR_eBgPaletteF_08001b50
    mov        r2,#0x8
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_08001b48
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r0,#0x0
    bl         Video_SetBgControl
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Video_ClearAndLoadSmallNumbers

thumb_func_start Video_BlitScreens
Video_BlitScreens:
    push       { lr }
    mov        r0,r10
    ldr        r0,[r0,#0x5c]
    ldr        r1,PTR_BG_VRAM_SCREEN0_08001b30
    ldr        r2,INT_08001b34
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_08001b48
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_gFillValue_08001b54
    ldr        r1,UINT_08001b58
    str        r1,[r0,#0x0]
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,INT_08001b44
    mov        r3,#0x3
    ldr        r4,DAT_08001b38
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_gFillValue_08001b5c
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Video_BlitScreens

thumb_func_start Video_SetBgControl
Video_SetBgControl:
    push       { lr }
    ldr        r1,PTR_BgControl_ARRAY_08001b60
    lsl        r0,r0,#0x3
    add        r1,r1,r0
    mov        r7,r10
    ldr        r2,[r7,#0x10]
    add        r2,#0x4
    ldr        r0,[r1,#0x0]
    str        r0,[r2,#0x0]
    add        r1,#0x4
    add        r2,#0x4
    ldr        r0,[r1,#0x0]
    str        r0,[r2,#0x0]
    pop        { pc }
thumb_func_end Video_SetBgControl

BgControl_ARRAY_080019a8:
    .short 0x3c08
    .short 0x3d83
    .short 0x3e87
    .short 0x3f8b
    .short 0x3c08
    .short 0x0000
    .short 0x0000
    .short 0x0000
    .short 0x3c08
    .short 0x3d01
    .short 0x0000
    .short 0x0000
    .short 0x3c08
    .short 0x3d03
    .short 0x3e02
    .short 0x3f05
    .short 0x3c08
    .short 0x3d03
    .short 0x3e06
    .short 0x0000
    .short 0x3c08
    .short 0x3d83
    .short 0x3e82
    .short 0x3f85
    .short 0x3c08
    .short 0x3d03
    .short 0x3e02
    .short 0x3f85

thumb_func_start Video_ApplySettings
Video_ApplySettings:
    push       { lr }
    mov        r7,r10
    ldr        r5,[r7,#0x10]
    ldr        r1,PTR_REG_DISPCNT_08001b64
    ldrh       r2,[r5,#0x0]
    strh       r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG0CNT_08001b68
    ldr        r2,[r5,#0x4]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG2CNT_08001b6c
    ldr        r2,[r5,#0x8]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG0HOFS_08001b70
    ldr        r2,[r5,#0xc]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG1HOFS_08001b74
    ldr        r2,[r5,#0x10]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG2HOFS_08001b78
    ldr        r2,[r5,#0x14]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_BG3HOFS_08001b7c
    ldr        r2,[r5,#0x18]
    str        r2,[r1,#0x0]
    ldr        r5,[r7,#0x38]
    ldr        r1,PTR_REG_WIN0H_08001b80
    ldr        r2,[r5,#0x0]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_WIN0V_08001b84
    ldr        r2,[r5,#0x4]
    str        r2,[r1,#0x0]
    ldr        r1,PTR_REG_WININ_08001b88
    ldr        r2,[r5,#0x8]
    str        r2,[r1,#0x0]
    ldr        r5,[r7,#0x3c]
    ldr        r2,PTR_jumpTable_08001b8c
    @ Before applying BLD changes, adjust params based on blend mode
    ldrb       r1,[r5,#0x0]
    lsr        r1,r1,#0x6
    lsl        r1,r1,#0x2
    ldr        r2,[r2,r1]
    mov        lr,pc
    bx         r2
    ldr        r1,PTR_REG_BLDCNT_08001b90
    ldrh       r2,[r5,#0x0]
    strh       r2,[r1,#0x0]
    ldr        r1,PTR_REG_BLDALPHA_08001b94
    ldrh       r2,[r5,#0x2]
    strh       r2,[r1,#0x0]
    ldr        r1,PTR_REG_BLDY_08001b98
    ldrh       r2,[r5,#0x4]
    strh       r2,[r1,#0x0]
    pop        { pc }
thumb_func_end Video_ApplySettings

jumpTable:
    .word handlerNone
    .word handlerAlphaBlend
    .word handlerBrightnessIncrease
    .word handlerBrightnessDecrease

thumb_func_start handlerNone
handlerNone:
    push       { lr }
    @ EVB = 1 - EVA
    ldrb       r1,[r5,#0x2]
    sub        r1,#0x10
    neg        r1,r1
    strb       r1,[r5,#0x3]
    @ Set 0 for all 1st targets
    mov        r1,#0x0
    strb       r1,[r5,#0x0]
    @ Set 1 for all 2nd targets
    mov        r1,#0x3f
    strb       r1,[r5,#0x1]
    @ EVY = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x4]
    pop        { pc }
thumb_func_end handlerNone

thumb_func_start handlerAlphaBlend
handlerAlphaBlend:
    push       { lr }
    @ EVB = special val
    ldrh       r1,[r5,#0x6]
    lsr        r1,r1,#0x4
    strb       r1,[r5,#0x3]
    @ EVA = 1 - EVB
    sub        r1,#0x10
    neg        r1,r1
    strb       r1,[r5,#0x2]
    @ EVY = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x4]
    @ Set 1 for all 2nd targets except BG0
    mov        r1,#0x3e
    strb       r1,[r5,#0x1]
    pop        { pc }
thumb_func_end handlerAlphaBlend

thumb_func_start handlerBrightnessIncrease
handlerBrightnessIncrease:
    push       { lr }
    @ EVA = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x2]
    @ EVB = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x3]
    @ Set all 2nd targets to 0
    mov        r1,#0x0
    strb       r1,[r5,#0x1]
    @ EVY = special val
    ldrh       r1,[r5,#0x6]
    lsr        r1,r1,#0x4
    strb       r1,[r5,#0x4]
    pop        { pc }
thumb_func_end handlerBrightnessIncrease

thumb_func_start handlerBrightnessDecrease
handlerBrightnessDecrease:
    push       { lr }
    @ EVA = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x2]
    @ EVB = 0
    mov        r1,#0x0
    strb       r1,[r5,#0x3]
    @ Set all 2nd targets to 0
    mov        r1,#0x0
    strb       r1,[r5,#0x1]
    @ EVY = special val
    ldrh       r1,[r5,#0x6]
    lsr        r1,r1,#0x4
    strb       r1,[r5,#0x4]
    pop        { pc }
thumb_func_end handlerBrightnessDecrease

thumb_func_start Video_ClearAllTile0Maps
Video_ClearAllTile0Maps:
    push       { lr }
    ldr        r0,vram_off_0
    mov        r1,#0x40
    bl         memset0_32
    ldr        r0,vram_off_4
    mov        r1,#0x40
    bl         memset0_32
    ldr        r0,vram_off_8
    mov        r1,#0x40
    bl         memset0_32
    ldr        r0,vram_off_c
    mov        r1,#0x20
    bl         memset0_32
    pop        { pc }
thumb_func_end Video_ClearAllTile0Maps

thumb_func_start Video_InitPaletteColor0
Video_InitPaletteColor0:
    push       { lr }
    ldr        r0,PTR_eBgPalette0_08001ba8
    mov        r1,#0x2
    bl         memset0_16
    ldr        r0,PTR_PAL_BG_08001bac
    mov        r1,#0x2
    bl         memset0_16
    pop        { pc }
thumb_func_end Video_InitPaletteColor0

thumb_func_start Video_InitBlendSettings
Video_InitBlendSettings:
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x3c]
    mov        r1,#0x8
    bl         memset0_32
    pop        { pc }
thumb_func_end Video_InitBlendSettings

thumb_func_start Video_QueueBgPalTransfer
Video_QueueBgPalTransfer:
    push       { lr }
    ldr        r0,PTR_eBgPalette0_08001bb0
    ldr        r1,PTR_PAL_BG_08001bac
    mov        r2,#0x80
    bl         Dma_TransferListAdd
    pop        { pc }
thumb_func_end Video_QueueBgPalTransfer

thumb_func_start Video_ClearScreenBuffersToValue
Video_ClearScreenBuffersToValue:
    push       { lr }
    ldr        r0,PTR_gFillValue_08001bb4
    mov        r1,r10
    ldr        r1,[r1,#0x5c]
    ldr        r2,INT_08001b34
    mov        r3,#0x3
    ldr        r4,DAT_08001b38
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    pop        { pc }
thumb_func_end Video_ClearScreenBuffersToValue

    .align 2, 0

PTR_gFillValue_08001b2c:                    .word gFillValue
PTR_BG_VRAM_SCREEN0_08001b30:               .word BG_VRAM_SCREEN0
INT_08001b34:                               .word 0x800
DAT_08001b38:                               .word 0x85000000
PTR_tileSetKeyboardNumberChars_08001b3c:    .word tileSetKeyboardNumberChars
vram_off_c:                                 .word BG_VRAM_BASE3
INT_08001b44:                               .word 0x200
DmaCntFlag_08001b48:                        .word DMA_32BIT | DMA_ENABLE
PTR_paletteKeyboardNumberChars_08001b4c:    .word paletteKeyboardNumberChars
PTR_eBgPaletteF_08001b50:                   .word eBgPaletteF
PTR_gFillValue_08001b54:                    .word gFillValue
UINT_08001b58:                              .word 0x2000200
PTR_gFillValue_08001b5c:                    .word gFillValue
PTR_BgControl_ARRAY_08001b60:               .word BgControl_ARRAY_080019a8
PTR_REG_DISPCNT_08001b64:                   .word REG_DISPCNT
PTR_REG_BG0CNT_08001b68:                    .word REG_BG0CNT
PTR_REG_BG2CNT_08001b6c:                    .word REG_BG2CNT
PTR_REG_BG0HOFS_08001b70:                   .word REG_BG0HOFS
PTR_REG_BG1HOFS_08001b74:                   .word REG_BG1HOFS
PTR_REG_BG2HOFS_08001b78:                   .word REG_BG2HOFS
PTR_REG_BG3HOFS_08001b7c:                   .word REG_BG3HOFS
PTR_REG_WIN0H_08001b80:                     .word REG_WIN0H
PTR_REG_WIN0V_08001b84:                     .word REG_WIN0V
PTR_REG_WININ_08001b88:                     .word REG_WININ
PTR_jumpTable_08001b8c:                     .word jumpTable
PTR_REG_BLDCNT_08001b90:                    .word REG_BLDCNT
PTR_REG_BLDALPHA_08001b94:                  .word REG_BLDALPHA
PTR_REG_BLDY_08001b98:                      .word REG_BLDY
vram_off_0:                                 .word BG_VRAM_BASE0
vram_off_4:                                 .word BG_VRAM_BASE1
vram_off_8:                                 .word BG_VRAM_BASE2
PTR_eBgPalette0_08001ba8:                   .word eBgPalette0
PTR_PAL_BG_08001bac:                        .word PAL_BG
PTR_eBgPalette0_08001bb0:                   .word eBgPalette0
PTR_gFillValue_08001bb4:                    .word gFillValue

    .end
