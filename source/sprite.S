#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set SpritePtr_CalculateOcclusion, 0x3006b61
    .set listSpritePtr, 0x8012690

    .text

    .thumb


_ts Sprite_AddSpriteToOam
    push       { lr }
    ldr        r1,=Oam_AddSprite_far
    mov        lr,pc
    bx         r1
    pop        { pc }


_ts SpritePtr_InitFrames
    push       { r5, lr }
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    bl         Sprite_InitFrames
    pop        { r5, pc }


@@ Sets up frame data for a sprite
_ts Sprite_InitFrames
    push       { lr }
    @ Set up the pointer to the current animation frame using the frame index
    ldrb       r0,[r5,#Sprite_indexFrame]
    lsl        r0,r0,#0x2
    ldr        r1,[r5,#Sprite_spriteStart]
    ldr        r2,[r1,r0]
    add        r3,r2,r1
    str        r3,[r5,#Sprite_curFrame]
    @ Set up the pointer to the current sub animation frame using the sub frame index
    ldrb       r0,[r5,#Sprite_indexSubFrame]
    lsl        r0,r0,#0x2
    ldr        r2,[r3,#SpriteFrame_subFrames]
    add        r1,r1,r2
    ldr        r2,[r1,r0]
    add        r1,r1,r2
    str        r1,[r5,#Sprite_curSubFrame]
    @ Set up the delay and frame flags depending on whether a frame animation
    @ or a sub frame animation is playing
    ldrb       r6,[r5,#Sprite_spriteFlags]
    mov        r7,#SF_NoMiniAnimation
    and        r6,r7
    bne        .noMiniAnimation
    ldrb       r2,[r1,#SpriteSubFrame_delay]
    strb       r2,[r5,#Sprite_frameDelay]
    ldrb       r2,[r1,#SpriteSubFrame_flag]
    strb       r2,[r5,#Sprite_frameFlags]
    b          LAB_0800238a
.noMiniAnimation:
    ldrb       r2,[r3,#SpriteFrame_delay]
    strb       r2,[r5,#Sprite_frameDelay]
    ldrb       r2,[r3,#SpriteFrame_flags]
    strb       r2,[r5,#Sprite_frameFlags]
LAB_0800238a:
    pop        { pc }


_ts SpritePtr_ProcessFrameDelay
    push       { r5, lr }
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    bl         Sprite_ProcessFrameDelay
    pop        { r5, pc }


_ts Sprite_ProcessFrameDelay
    push       { lr }
start:
    ldrb       r0,[r5,#Sprite_frameDelay]
    sub        r0,#0x1
    strb       r0,[r5,#Sprite_frameDelay]
    cmp        r0,#0x0
    bge        .delayPresent
    ldrb       r0,[r5,#Sprite_spriteFlags]
    mov        r1,#SF_NoMiniAnimation
    and        r0,r1
    bne        .processFrameDelay
    @ If delay is 0 and the delay type is sub frame delay:
    @ First, check if sub frame is an end frame
    ldr        r1,[r5,#Sprite_curSubFrame]
    ldrb       r0,[r1,#SpriteSubFrame_flag]
    ldrb       r4,[r1,#SpriteSubFrame_delay]
    mov        r2,#FF_EndFrame
    tst        r0,r2
    bne        .isEndFrame
    @ If not an end frame, move to next sub frame and set up delay and flags
    add        r1,#0x3
    str        r1,[r5,#Sprite_curSubFrame]
    ldrb       r2,[r1,#SpriteSubFrame_delay]
    strb       r2,[r5,#Sprite_frameDelay]
    ldrb       r2,[r1,#SpriteSubFrame_flag]
    strb       r2,[r5,#Sprite_frameFlags]
    b          .goToStart
    @ If delay is 0 and delay is a frame delay...
.processFrameDelay:
    @ If delay is 0 and the delay type is frame delay:
    @ First, check if frame is an end frame
    ldr        r3,[r5,#Sprite_curFrame]
    ldrb       r0,[r3,#SpriteFrame_flags]
    ldrb       r4,[r3,#SpriteFrame_delay]
    mov        r2,#FF_EndFrame
    tst        r0,r2
    bne        .isEndFrame
    @ If not an end frame, move to next frame, and set up new sub frame, delay,
    @ and flags
    add        r3,#0x14
    str        r3,[r5,#Sprite_curFrame]
    ldr        r1,[r5,#Sprite_spriteStart]
    ldrb       r0,[r5,#Sprite_indexSubFrame]
    lsl        r0,r0,#0x2
    ldr        r2,[r3,#SpriteFrame_subFrames]
    add        r1,r1,r2
    ldr        r2,[r1,r0]
    add        r1,r1,r2
    str        r1,[r5,#Sprite_curSubFrame]
    ldrb       r2,[r3,#SpriteFrame_delay]
    strb       r2,[r5,#Sprite_frameDelay]
    ldrb       r2,[r3,#SpriteFrame_flags]
    strb       r2,[r5,#Sprite_frameFlags]
.goToStart:
    b          start
.isEndFrame:
    @ If an end frame, check next if it's a loop frame
    mov        r2,#FF_LoopFrame
    tst        r0,r2
    bne        .frameFlagIsLoop
    @ If not a loop frame, set delay to 1 and go back to start
    mov        r4,#0x1
    strb       r4,[r5,#Sprite_frameDelay]
    b          start
.frameFlagIsLoop:
    @ If loop frame reached, initialize frame data again
    bl         Sprite_InitFrames
    b          start
.delayPresent:
    @ If there is still frame delay left, set the obj pal
    @ index to the one specified by the sub frame and return
    ldr        r1,[r5,#Sprite_curSubFrame]
    ldrb       r2,[r1,#SpriteSubFrame_objectListIndex]
    lsl        r2,r2,#0x2
    ldr        r0,[r5,#Sprite_curFrame]
    ldr        r0,[r0,#SpriteFrame_objectLists]
    ldr        r1,[r5,#Sprite_spriteStart]
    add        r1,r1,r0
    ldr        r2,[r1,r2]
    add        r2,r2,r1
    ldrb       r4,[r2,#SpriteObjectEntry_flag2]
    lsr        r4,r4,#0x4
    strb       r4,[r5,#Sprite_palIndexSubFrame]
    pop        { pc }


_ts Sprite_InitSpritePtr
    push       { r5, lr }
    ldrb       r2,[r5,#0x0]
    mov        r3,#0x8
    bic        r2,r3
    strb       r2,[r5,#0x0]
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    push       { r0, r1 }
    add        r0,r1,#0x0
    bl         SpriteLz_GetSprite
    pop        { r1, r2 }
    tst        r0,r0
    beq        LAB_08002442
    b          LAB_08002452
LAB_08002442:
    ldr        r4,=listSpritePtr
    lsl        r2,r2,#0x2
    ldr        r0,[r4,r2]
    cmp        r0,#0x0
    bge        LAB_08002452
    ldr        r2,=0x112
    lsl        r2,r2,#0x2
    ldr        r0,[r4,r2]
LAB_08002452:
    push       { r1 }
    bl         Sprite_Init
    pop        { r1 }
    strb       r1,[r5,#0x4]
    pop        { r5, pc }


_ts Sprite_Init
    add        r0,#0x4
    str        r0,[r5,#Sprite_spriteStart]
    mov        r0,#0x0
    strb       r0,[r5,#Sprite_indexSubFrame]
    strb       r0,[r5,#Sprite_indexFrame]
    str        r0,[r5,#Sprite_curTilesetHeader]
    strb       r0,[r5,#Sprite_srcPalIndex]
    strh       r0,[r5,#0xa]
    str        r0,[r5,#0x2c]
    mvn        r0,r0
    str        r0,[r5,#0x28]
    mov        r0,#0x0
    strh       r0,[r5,#0x10]
    strh       r0,[r5,#0x12]
    strb       r0,[r5,#0x14]
    mov        r0,#0x8
    strb       r0,[r5,#0x15]
    mov        pc,lr


_ts Sprite_TransferPalettes
    push       { lr }
    ldr        r0,=eObjPalette0
    ldr        r1,=PAL_OBJ
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    pop        { pc }

    .align 2, 0

    .pool


_ts SpritePtr_AffineSetParams
    push       {r5,lr}
    push       {r0,r1,r2}
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    ldrb       r0,[r5,#0x11]
    mov        r1,#0x3
    tst        r0,r1
    beq        LAB_080024cc
    ldrb       r3,[r5,#0x13]
    mov        r1,#0x3e
    and        r3,r1
    lsr        r3,r3,#0x1
    pop        {r0,r1,r2}
    bl         Oam_AffineTransformSetParams
    pop        {r5,pc}
LAB_080024cc:
    pop        {r0,r1,r2}
    pop        {r5,pc}


_ts SpritePtr_ObjModeWindow
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r1,[r7,#0x11]
    mov        r0,#0xc
    bic        r1,r0
    mov        r0,#0x8
    orr        r1,r0
    strb       r1,[r7,#0x11]
    mov        pc,lr


_ts _SpritePtr_ObjModeNormal
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r1,[r7,#0x11]
    mov        r0,#0xc
    bic        r1,r0
    strb       r1,[r7,#0x11]
    mov        pc,lr


_ts SpritePtr_ObjModeSemiTransparent
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r1,[r7,#0x11]
    mov        r2,#0xc
    bic        r1,r2
    mov        r2,#0x4
    orr        r1,r2
    strb       r1,[r7,#0x11]
    mov        r7,r10
    ldr        r7,[r7,#0x3c]
    ldrb       r1,[r7,#0x0]
    mov        r2,#0xc0
    bic        r1,r2
    mov        r2,#0x0
    orr        r1,r2
    strb       r1,[r7,#0x0]
    strb       r0,[r7,#0x2]
    mov        pc,lr


_ts SpritePtr_ObjModeNormal
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r1,[r7,#0x11]
    mov        r0,#0xc
    bic        r1,r0
    strb       r1,[r7,#0x11]
    mov        pc,lr

    .align 2, 0


_ts LC_SpritePtr_CalculateOcclusion
    push       {lr}
    ldr        r7,PTR_SpritePtr_CalculateOcclusion_1_080026f4
    mov        lr,pc
    bx         r7
    pop        {pc}


_ts SpritePtr_AffineAlloc
    push       {r5,lr}
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    ldrb       r0,[r5,#0x11]
    mov        r1,#0x3
    tst        r1,r0
    bne        LAB_08002576
    bl         Oam_AffineTransformAlloc
    cmp        r0,#0xff
    beq        LAB_08002576
    ldrb       r2,[r5,#0x11]
    mov        r1,#0x3
    orr        r2,r1
    strb       r2,[r5,#0x11]
    ldrb       r3,[r5,#0x13]
    mov        r1,#0x3e
    bic        r3,r1
    lsl        r0,r0,#0x1
    orr        r3,r0
    strb       r3,[r5,#0x13]
    mov        r0,#0x1
    pop        {r5,pc}
LAB_08002576:
    mov        r0,#0x0
    pop        {r5,pc}


_ts SpritePtr_AffineFree
    push       {r5,lr}
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    ldrb       r0,[r5,#0x11]
    mov        r1,#0x3
    tst        r1,r0
    bne        LAB_0800259e
    ldrb       r0,[r5,#0x13]
    add        r2,r0,#0x0
    mov        r1,#0x3e
    and        r0,r1
    bic        r2,r1
    strb       r2,[r5,#0x13]
    bl         Oam_AffineTransformFree
LAB_0800259e:
    pop        {r5,pc}


_ts SpritePtr_SetPaletteIndex
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    strb       r0,[r7,#0x5]
    mov        pc,lr


_ts SpritePtr_SetSubFrameIndex
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    strb       r0,[r5,#0x1]
    mov        pc,lr


_ts SpritePtr_SetFrameIndex
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    strb       r0,[r7,#0x0]
    mov        pc,lr


_ts SpritePtr_SetFlashPalette
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x15]
    mov        r1,#0xf0
    orr        r0,r1
    strb       r0,[r7,#0x15]
    mov        pc,lr


_ts SpritePtr_ResetPalette
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x15]
    mov        r1,#0xf0
    bic        r0,r1
    strb       r0,[r7,#0x15]
    mov        pc,lr


_ts SpritePtr_GetFrameStatus
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x3]
    ldrb       r1,[r7,#0x2]
    cmp        r1,#0x0
    beq        LAB_08002600
    mov        r1,#0xc0
    bic        r0,r1
LAB_08002600:
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r7,#0x1]
    mov        pc,lr


_ts SpritePtr_CheckIfMultipleParts
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x4]
    mov        r1,#0x10
    and        r0,r1
    mov        pc,lr


_ts SpritePtr_SetPriority
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    mov        r2,#0xc
    ldrb       r1,[r7,#0x15]
    bic        r1,r2
    lsl        r0,r0,#0x2
    orr        r1,r0
    strb       r1,[r7,#0x15]
    mov        pc,lr


_ts SpritePtr_SetZClip
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x4]
    mov        r1,#0x4
    orr        r0,r1
    mov        r1,#0x8
    bic        r0,r1
    strb       r0,[r7,#0x4]
    mov        pc,lr


_ts SpritePtr_Flag_ClearZClip
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r0,[r7,#0x4]
    mov        r1,#0x4
    bic        r0,r1
    strb       r0,[r7,#0x4]
    mov        pc,lr


_ts Oam_Init
    push       {lr}
    ldr        r0,PTR_gFillValue_080026f8
    ldr        r1,PTR_OAM_080026fc
    ldr        r2,INT_08002700
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_08002704
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_gFillValue_08002708
    ldr        r1,PTR_OBJ_VRAM0_0800270c
    ldr        r2,INT_08002710
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_08002704
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    ldr        r0,PTR_paletteInitial_F0_08002714
    ldr        r1,PTR_PAL_OBJ_08002718
    mov        r2,#0x8
    mov        r3,#0x3
    ldr        r4,DmaCntFlag_0800271c
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    bl         PlayerLocation_Init
    bl         Actor_Init
    bl         Attack_Init
    bl         Effect_Init
    bl         NPC_Init
    bl         SpriteTilesetDetail_Init
    pop        {pc}


_ts FUN_080026b4
    ldr        r0,[r5,#0x1c]
    ldr        r0,[r0,#0x0]
    ldr        r1,[r5,#0x18]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    lsr        r0,r0,#0x5
    mov        pc,lr


_ts FUN_080026c4
    ldrb       r0,[r5,#0x0]
    tst        r0,r0
    beq        LAB_080026ea
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    mov        r2,#0xc
    ldrsh      r1,[r7,r2]
    mov        r2,#0xe
    ldrsb      r2,[r7,r2]
    mov        r0,#0x10
    lsl        r0,r0,#0x4
    add        r0,#0xff
    and        r1,r0
    mov        r0,#0xff
    and        r2,r0
    mov        r0,#0x1
    mov        pc,lr
LAB_080026ea:
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x0
    mov        pc,lr

    .align 2, 0

PTR_SpritePtr_CalculateOcclusion_1_080026f4: .word SpritePtr_CalculateOcclusion
PTR_gFillValue_080026f8: .word gFillValue
PTR_OAM_080026fc: .word OAM_BEGIN
INT_08002700: .word 0x100
DmaCntFlag_08002704: .word DMA_SRC_FIXED | DMA_32BIT | DMA_ENABLE
PTR_gFillValue_08002708: .word gFillValue
PTR_OBJ_VRAM0_0800270c: .word OBJ_VRAM0
INT_08002710: .word 0x2000
PTR_paletteInitial_F0_08002714: .word paletteInitial_F0
PTR_PAL_OBJ_08002718: .word 0x50003E0
DmaCntFlag_0800271c: .word DMA_32BIT | DMA_ENABLE


_ts InitializeSpriteTilesetOffset
    ldr        r0,PTR_gSpriteTilesetOffset0_0800280c
    mov        r1,#0x1
    str        r1,[r0,#0x0]
    mov        pc,lr
    mov r0, #0x0 @ TODO: part of below func maybe


_nt SpritePtr_SetFlipType
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldrb       r2,[r7,#0x13]
    mov        r1,#0x30
    bic        r2,r1
    lsl        r0,r0,#0x4
    orr        r2,r0
    strb       r2,[r7,#0x13]
    mov        pc,lr


_ts Sprite_LoadPalette
    ldr        r0,[r5,#0x1c]
    ldr        r0,[r0,#0x4]
    add        r0,#0x4
    ldr        r1,[r5,#0x18]
    add        r0,r0,r1
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x5
    add        r0,r0,r1
    ldrb       r1,[r5,#0x15]
    lsr        r1,r1,#0x4
    ldr        r3,PTR_eObjPalette0_08002810
    lsl        r1,r1,#0x5
    add        r3,r3,r1
    mov        r6,#0x0
LAB_0800275c:
    ldr        r2,[r0,r6]
    str        r2,[r3,r6]
    add        r6,#0x4
    cmp        r6,#0x20
    blt        LAB_0800275c
    mov        pc,lr


_ts Sprite_PaletteInit
    ldr        r0,PTR_gSpritePalettesLoaded_08002814
    mov        r1,#0x0
    str        r1,[r0,#0x0]
    mov        pc,lr


_ts SpritePtr_NoZClip
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    mov        r0,#0x8
    ldrb       r1,[r7,#0x4]
    orr        r1,r0
    strb       r1,[r7,#0x4]
    mov        pc,lr


_ts SpritePtr_SetObjectExcludeFlags
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    str        r0,[r7,#0x2c]
    mov        pc,lr


_ts SpritePtr_GetObjectExcludeFlags
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    ldr        r0,[r7,#0x2c]
    mov        pc,lr


_ts SpritePtr_SetObjectExcludeFlag
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    ldr        r0,[r7,#0x2c]
    orr        r0,r1
    str        r0,[r7,#0x2c]
    mov        pc,lr


_ts SpritePtr_ClearObjectExcludeFlag
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r7,r7,r5
    mov        r1,#0x80
    lsl        r1,r1,#0x18
    lsr        r1,r0
    ldr        r0,[r7,#0x2c]
    bic        r0,r1
    str        r0,[r7,#0x2c]
    mov        pc,lr


_ts Sprite_LoadTileset
    push       {r5,lr}
    ldr        r2,[r5,#0x24]
    ldr        r0,[r5,#0x1c]
    ldr        r0,[r0,#0x0]
    ldr        r1,[r5,#0x18]
    add        r0,r0,r1
    cmp        r0,r2
    beq        LAB_080027f0
    str        r0,[r5,#0x24]
    ldr        r2,[r0,#0x0]
    lsr        r2,r2,#0x2
    add        r0,#0x4
    ldr        r1,PTR_OBJ_VRAM0_08002818
    ldrh       r3,[r5,#0x8]
    lsl        r3,r3,#0x5
    add        r1,r1,r3
    bl         Dma_TransferListAdd
LAB_080027f0:
    pop        {r5,pc}


_ts SpriteTilesetDetail_Init
    push       {lr}
    ldr        r7,PTR_gSpriteTilesetDetailCount_0800281c
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    ldr        r0,PTR_gListSpriteTilesetDetail_08002820
    ldr        r1,INT_08002824
    mov        r2,#0x0
    mvn        r2,r2
    bl         memset_32
    pop        {pc}

    .align 2, 0

PTR_gSpriteTilesetOffset0_0800280c: .word gSpriteTilesetOffset0
PTR_eObjPalette0_08002810: .word eObjPalette0
PTR_gSpritePalettesLoaded_08002814: .word gSpritePalettesLoaded
PTR_OBJ_VRAM0_08002818: .word OBJ_VRAM0
PTR_gSpriteTilesetDetailCount_0800281c: .word gSpriteTilesetDetailCount
PTR_gListSpriteTilesetDetail_08002820: .word gListSpriteTilesetDetail
INT_08002824: .word 0x2C8


@@ Initializes SpriteLzDetails
@@ In:
@@ r0: ptrSpriteLzDest: A pointer to the location where decompressed sprites
@@ will be placed.
@ void SpriteLz_Init(void *ptrSpriteLzDest)
_ts SpriteLz_Init
    push       { r5, lr }
    ldr        r5,PTR_gSpriteLzDetails_08002990
    push       { r0, r5 }
    add        r0,r5,#0x0
    mov        r1,#0x38
    bl         memset0_32
    pop        { r0, r5 }
    str        r0,[r5,#SpriteLzDetails_m_next]
    push       { r5 }
    add        r0,r5,#0x0
    add        r0,#SpriteLzDetails_m_indexList
    mov        r1,#(2 * 8)
    ldr        r2,INT_08002994
    bl         memset_16
    pop        { r5 }
    push       { r5 }
    add        r0,r5,#0x0
    add        r0,#SpriteLzDetails_m_spritePtrList
    mov        r1,#(4 * 8)
    mov        r2,#0xff
    bl         memset
    pop        { r5 }
    pop        { r5, pc }

@@ Decompresses a list of sprites.
@@ In:
@@ r0: spriteList: A pointer to the list of sprite indexes.
@ bool SpriteLz_DecompressSpriteList(short *listSpriteIndices)
_ts SpriteLz_DecompressSpriteList
    push       { lr }
    ldr        r5,PTR_gSpriteLzDetails_08002998
    ldr        r1,[r5,#SpriteLzDetails_m_next]
    mov        r3,#0x0
    ldr        r4,PTR_listSpritePtr_0800299c
    ldr        r6,DAT_080029a0 @ 0x2040000
    add        r7,r0,#0x0
LAB_0800286a:
    @ Start iterating over the passed list of indexes.
    ldrsh      r0,[r7,r3]
    cmp        r0,#0x0
    @ If the given index is negative, then stop and return true.
    blt        LAB_080028b8
    lsl        r2,r0,#0x2
    @ Get pointer in listSpritePtr using current index in r0, and clear the
    @ top bit.
    ldr        r2,[r4,r2]
    lsl        r2,r2,#0x1
    lsr        r2,r2,#0x1
    mov        r8,r2
    ldr        r2,[r2,#0x0]
    lsr        r2,r2,#0x8
    @ Get the first 4 bytes of the lz archive, and shift right to get the
    @ uncompressed size. If the uncompressed size is too large, return
    @ false.
    cmp        r2,r6
    bge        LAB_080028bc
    mov        r12,r0
    @ Check to see that the uncompressed sprite count is under 8. If over,
    @ return false.
    ldrb       r0,[r5,#SpriteLzDetails_m_spriteCount]
    cmp        r0,#0x8
    mov        r0,r12
    bge        LAB_080028bc
    push       { r3, r7 }
    ldrb       r3,[r5,#SpriteLzDetails_m_spriteCount]
    lsl        r7,r3,#0x1
    add        r7,#SpriteLzDetails_m_indexList
    @ Store current index into indexlist
    strh       r0,[r5,r7]
    lsl        r7,r3,#0x2
    add        r7,#SpriteLzDetails_m_spritePtrList
    add        r1,#0x4
    @ Store next + 4 in the spritePtrList - this is the location of the sprite
    @ header once uncompressed.
    str        r1,[r5,r7]
    sub        r1,#0x4
    add        r3,#0x1
    strb       r3,[r5,#SpriteLzDetails_m_spriteCount]
    push       { r1, r2, r4, r5, r6 }
    mov        r0,r8
    @ r0 is the pointer to the sprite from listSpritePtr
    @ r1 is the dest pointed to by nextPtr
    bl         SWI_LZ77UnCompWram
    pop        { r1, r2, r4, r5, r6 }
    add        r1,r1,r2
    @ Store pointer to following block of free space to next
    str        r1,[r5,#SpriteLzDetails_m_next]
    pop        { r3, r7 }
    add        r3,#0x2
    b          LAB_0800286a
LAB_080028b8:
    mov        r0,#0x1
    pop        { pc }
LAB_080028bc:
    mov        r0,#0x0
    pop        { pc }

@@ Retrieves a sprite.
@@ In:
@@ r1: spriteIndex: The index of the sprite to retrieve
@ SpriteArchive_Header * SpriteLz_GetSprite(short index)
_ts SpriteLz_GetSprite
    push       { r5, lr }
    ldr        r5,PTR_gSpriteLzDetails_080029a4
    mov        r2,#0x0
LAB_080028c6:
    lsl        r1,r2,#0x1
    add        r1,#SpriteLzDetails_m_indexList
    ldrh       r1,[r5,r1]
    cmp        r0,r1
    bne        LAB_080028d8
    lsl        r1,r2,#0x2
    add        r1,#SpriteLzDetails_m_spritePtrList
    ldr        r0,[r5,r1]
    pop        { r5, pc }
LAB_080028d8:
    add        r2,#0x1
    cmp        r2,#0x8
    blt        LAB_080028c6
    mov        r0,#0x0
    pop        { r5, pc }

@@ Decompresses a list of enemy sprites.
@@ In:
@@ r0: enemyPositionList: A pointer to the list of enemy spawns.
@ bool SpriteLz_DecompressEnemyList(EnemySpawn *enemyPositionList)
_ts SpriteLz_DecompressEnemyList
    push       { r5, lr }
    ldr        r5,PTR_gSpriteLzDetails_080029a8
    ldr        r1,[r5,#SpriteLzDetails_m_next]
    ldr        r4,PTR_listSpritePtr_080029ac
    ldr        r6,DAT_080029a0
    add        r7,r0,#0x0
LAB_080028f0:
    @ If end of list is reached, return true
    ldrb       r0,[r7,#EnemySpawn_m_id]
    cmp        r0,#ED_Invalid
    beq        LAB_08002966
    push       { r1, r4, r5, r6, r7 }
    bl         Enemy_GetEnemyDetail
    @ Get sprite index of enemy, and compare it to 0xFF. If so, set index
    @ value to 0x7FFF
    ldrb       r0,[r0,#EnemyDetail_m_lzSpriteIndex]
    cmp        r0,#0xff
    bne        LAB_08002904
    ldr        r0,INT_08002994
LAB_08002904:
    pop        { r1, r4, r5, r6, r7 }
    add        r3,r5,#0x0
    add        r3,#SpriteLzDetails_m_indexList
    mov        r9,r1
    mov        r2,#0x0
LAB_0800290e:
    @ First, check indexList to see if sprite is loaded already. If so, go to
    @ the next enemy.
    ldrh       r1,[r3,r2]
    cmp        r0,r1
    mov        r1,r9
    beq        LAB_08002962
    @ This appears to be going through the indexList till it reaches the end,
    @ but if it reaches the last index it continues.
    add        r2,#0x2
    cmp        r2,#0x10
    blt        LAB_0800290e
    @ Index into listSpritePtr with the lzSpriteIndex of the enemy. Could
    @ possibly run into a problem here if the index list is full (no 0x7FFF
    @ val to match) enemy doesn't have a compressed sprite. This may apply to
    @ MegaMan, Flappy, Satella, Remobit, 0x5F, and all Navis.
    mov        r1,r9
    lsl        r2,r0,#0x2
    ldr        r2,[r4,r2]
    lsl        r2,r2,#0x1
    lsr        r2,r2,#0x1
    mov        r8,r2
    ldr        r2,[r2,#0x0]
    lsr        r2,r2,#0x8
    @ If the uncompressed size is too large, return false.
    cmp        r2,r6
    bge        LAB_0800296a
    mov        r12,r0
    @ Check to see that the uncompressed sprite count is under 8. If over,
    @ return false.
    ldrb       r0,[r5,#SpriteLzDetails_m_spriteCount]
    cmp        r0,#0x8
    mov        r0,r12
    bge        LAB_0800296a
    push       { r7 }
    ldrb       r3,[r5,#SpriteLzDetails_m_spriteCount]
    lsl        r7,r3,#0x1
    add        r7,#SpriteLzDetails_m_indexList
    @ Store curIndex into the index list
    strh       r0,[r5,r7]
    lsl        r7,r3,#0x2
    add        r7,#SpriteLzDetails_m_spritePtrList
    add        r1,#0x4
    @ Store next + 4 in the spritePtrList - this is the location of the sprite
    @ header once uncompressed.
    str        r1,[r5,r7]
    sub        r1,#0x4
    add        r3,#0x1
    strb       r3,[r5,#SpriteLzDetails_m_spriteCount]
    push       { r1, r2, r4, r5, r6 }
    mov        r0,r8
    bl         SWI_LZ77UnCompWram
    pop        { r1, r2, r4, r5, r6 }
    add        r1,r1,r2
    @ Store pointer to following block of free space to next
    str        r1,[r5,#SpriteLzDetails_m_next]
    pop        { r7 }
LAB_08002962:
    add        r7,#0x4
    b          LAB_080028f0
LAB_08002966:
    mov        r0,#0x1
    pop        { r5, pc }
LAB_0800296a:
    mov        r0,#0x0
    pop        { r5, pc }

_ts dummy_2970
    push       { r5, lr }
    ldr        r5,PTR_gSpriteLzDetails_080029b0
    ldr        r1,[r5,#SpriteLzDetails_m_next]
    ldr        r0,PTR_DAT_080029b4
    @ Passing the address of format text at 0x2980, and the pointer to the
    @ next available decompressed sprite block to a dummy function
    bl         PrintDebugString
    pop        { r5, pc }
    .align 2, 0

DAT_08002980:
    @ Format text for debugging?
    .byte 0x16, 0x0
    .asciz "UNCOMP\n%8x"

    .align 2, 0

PTR_gSpriteLzDetails_08002990:  .word gSpriteLzDetails
INT_08002994:                   .word 0x7FFF
PTR_gSpriteLzDetails_08002998:  .word gSpriteLzDetails
PTR_listSpritePtr_0800299c:     .word listSpritePtr
DAT_080029a0:                   .word 0x2040000
PTR_gSpriteLzDetails_080029a4:  .word gSpriteLzDetails
PTR_gSpriteLzDetails_080029a8:  .word gSpriteLzDetails
PTR_listSpritePtr_080029ac:     .word listSpritePtr
PTR_gSpriteLzDetails_080029b0:  .word gSpriteLzDetails
PTR_DAT_080029b4:               .word DAT_08002980
