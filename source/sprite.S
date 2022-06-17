#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_08000d98, 0x8000D98
    .set listSpritePtr, 0x8012690

    .text

    .thumb

thumb_func_start Sprite_AddSpriteToOam
Sprite_AddSpriteToOam:
    push       { lr }
    ldr        r1,=Oam_AddSprite_far
    mov        lr,pc
    bx         r1
    pop        { pc }
thumb_func_end Sprite_AddSpriteToOam

thumb_func_start SpritePtr_InitFrames
SpritePtr_InitFrames:
    push       { r5, lr }
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    bl         Sprite_InitFrames
    pop        { r5, pc }
thumb_func_end SpritePtr_InitFrames

@@ Sets up frame data for a sprite
thumb_func_start Sprite_InitFrames
Sprite_InitFrames:
    push       { lr }
    @ Set up the pointer to the current animation frame using the frame index
    ldrb       r0,[r5,#Sprite_m_indexFrame]
    lsl        r0,r0,#0x2
    ldr        r1,[r5,#Sprite_m_spriteStart]
    ldr        r2,[r1,r0]
    add        r3,r2,r1
    str        r3,[r5,#Sprite_m_curFrame]
    @ Set up the pointer to the current sub animation frame using the sub frame index
    ldrb       r0,[r5,#Sprite_m_indexSubFrame]
    lsl        r0,r0,#0x2
    ldr        r2,[r3,#Frame_m_subAnimPtrOffset]
    add        r1,r1,r2
    ldr        r2,[r1,r0]
    add        r1,r1,r2
    str        r1,[r5,#Sprite_m_curSubFrame]
    @ Set up the delay and frame flags depending on whether a frame animation
    @ or a sub frame animation is playing
    ldrb       r6,[r5,#Sprite_m_spriteFlags]
    mov        r7,#SF_NoMiniAnim
    and        r6,r7
    bne        LAB_08002382
    ldrb       r2,[r1,#SubFrame_m_delayOffset]
    strb       r2,[r5,#Sprite_m_frameDelay]
    ldrb       r2,[r1,#SubFrame_m_flagOffset]
    strb       r2,[r5,#Sprite_m_frameFlags]
    b          LAB_0800238a
LAB_08002382:
    ldrb       r2,[r3,#Frame_m_delayOffset]
    strb       r2,[r5,#Sprite_m_frameDelay]
    ldrb       r2,[r3,#Frame_m_flagOffset]
    strb       r2,[r5,#Sprite_m_frameFlags]
LAB_0800238a:
    pop        { pc }
thumb_func_end Sprite_InitFrames

thumb_func_start FUN_0800238c
FUN_0800238c:
    push       { r5, lr }
    ldrb       r7,[r5,#0x2]
    lsr        r7,r7,#0x4
    lsl        r7,r7,#0x4
    add        r5,r5,r7
    bl         Sprite_ProcessFrameDelay
    pop        { r5, pc }
thumb_func_end FUN_0800238c

thumb_func_start Sprite_ProcessFrameDelay
Sprite_ProcessFrameDelay:
    push       { lr }
start:
    ldrb       r0,[r5,#Sprite_m_frameDelay]
    sub        r0,#0x1
    strb       r0,[r5,#Sprite_m_frameDelay]
    cmp        r0,#0x0
    bge        delayPresent
    ldrb       r0,[r5,#Sprite_m_spriteFlags]
    mov        r1,#SF_NoMiniAnim
    and        r0,r1
    bne        processFrameDelay
    @ If delay is 0 and the delay type is sub frame delay:
    @ First, check if sub frame is an end frame
    ldr        r1,[r5,#Sprite_m_curSubFrame]
    ldrb       r0,[r1,#SubFrame_m_flagOffset]
    ldrb       r4,[r1,#SubFrame_m_delayOffset]
    mov        r2,#FF_EndFrame
    tst        r0,r2
    bne        isEndFrame
    @ If not an end frame, move to next sub frame and set up delay and flags
    add        r1,#0x3
    str        r1,[r5,#Sprite_m_curSubFrame]
    ldrb       r2,[r1,#SubFrame_m_delayOffset]
    strb       r2,[r5,#Sprite_m_frameDelay]
    ldrb       r2,[r1,#SubFrame_m_flagOffset]
    strb       r2,[r5,#Sprite_m_frameFlags]
    b          goToStart
    @ If delay is 0 and delay is a frame delay...
processFrameDelay:
    @ If delay is 0 and the delay type is frame delay:
    @ First, check if frame is an end frame
    ldr        r3,[r5,#Sprite_m_curFrame]
    ldrb       r0,[r3,#Frame_m_flagOffset]
    ldrb       r4,[r3,#Frame_m_delayOffset]
    mov        r2,#FF_EndFrame
    tst        r0,r2
    bne        isEndFrame
    @ If not an end frame, move to next frame, and set up new sub frame, delay,
    @ and flags
    add        r3,#0x14
    str        r3,[r5,#Sprite_m_curFrame]
    ldr        r1,[r5,#Sprite_m_spriteStart]
    ldrb       r0,[r5,#Sprite_m_indexSubFrame]
    lsl        r0,r0,#0x2
    ldr        r2,[r3,#Frame_m_subAnimPtrOffset]
    add        r1,r1,r2
    ldr        r2,[r1,r0]
    add        r1,r1,r2
    str        r1,[r5,#Sprite_m_curSubFrame]
    ldrb       r2,[r3,#Frame_m_delayOffset]
    strb       r2,[r5,#Sprite_m_frameDelay]
    ldrb       r2,[r3,#Frame_m_flagOffset]
    strb       r2,[r5,#Sprite_m_frameFlags]
goToStart:
    b          start
isEndFrame:
    mov        r2,#FF_LoopFrame
    tst        r0,r2
    bne        frameFlagIsLoop
    mov        r4,#0x1
    strb       r4,[r5,#Sprite_m_frameDelay]
    b          start
frameFlagIsLoop:
    bl         Sprite_InitFrames
    b          start
    @ If there is still frame delay left, set the obj pal
    @ index to the one specified by the sub frame and return
delayPresent:
    ldr        r1,[r5,#Sprite_m_curSubFrame]
    ldrb       r2,[r1,#SubFrame_m_objListIndex]
    lsl        r2,r2,#0x2
    ldr        r0,[r5,#Sprite_m_curFrame]
    ldr        r0,[r0,#Frame_m_objListPtrOffset]
    ldr        r1,[r5,#Sprite_m_spriteStart]
    add        r1,r1,r0
    ldr        r2,[r1,r2]
    add        r2,r2,r1
    ldrb       r4,[r2,#Object_m_flag2]
    lsr        r4,r4,#0x4
    strb       r4,[r5,#Sprite_m_palIndexSubFrame]
    pop        { pc }
thumb_func_end Sprite_ProcessFrameDelay

thumb_func_start Sprite_InitSpritePtr
Sprite_InitSpritePtr:
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
thumb_func_end Sprite_InitSpritePtr

thumb_func_start Sprite_Init
Sprite_Init:
    add        r0,#0x4
    str        r0,[r5,#Sprite_m_spriteStart]
    mov        r0,#0x0
    strb       r0,[r5,#Sprite_m_indexSubFrame]
    strb       r0,[r5,#Sprite_m_indexFrame]
    str        r0,[r5,#Sprite_m_curTilesetHeader]
    strb       r0,[r5,#Sprite_m_srcPalIndex]
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
thumb_func_end Sprite_Init

thumb_func_start Sprite_TransferPalettes
Sprite_TransferPalettes:
    push       { lr }
    ldr        r0,=eObjPalette0
    ldr        r1,=PAL_OBJ
    mov        r2,#0x78
    bl         Dma_TransferListAdd
    pop        { pc }
thumb_func_end Sprite_TransferPalettes

    .align 2, 0

    .end
