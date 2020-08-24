#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set dummy_3cc4, 0x8003CC4
    .set listSpritePtr, 0x8012690

    .text

    .thumb

@@ Initializes SpriteLzDetails
@@ In:
@@ r0: ptrSpriteLzDest: A pointer to the location where decompressed sprites
@@ will be placed.
@ void SpriteLz_Init(void *ptrSpriteLzDest)
thumb_func_start SpriteLz_Init
SpriteLz_Init:
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
thumb_func_end SpriteLz_Init

@@ Decompresses a list of sprites.
@@ In:
@@ r0: spriteList: A pointer to the list of sprite indexes.
@ bool SpriteLz_DecompressSpriteList(short *listSpriteIndices)
thumb_func_start SpriteLz_DecompressSpriteList
SpriteLz_DecompressSpriteList:
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
thumb_func_end SpriteLz_DecompressSpriteList

@@ Retrieves a sprite.
@@ In:
@@ r1: spriteIndex: The index of the sprite to retrieve
@ SpriteArchive_Header * SpriteLz_GetSprite(short index)
thumb_func_start SpriteLz_GetSprite
SpriteLz_GetSprite:
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
thumb_func_end SpriteLz_GetSprite

@@ Decompresses a list of enemy sprites.
@@ In:
@@ r0: enemyPositionList: A pointer to the list of enemy spawns.
@ bool SpriteLz_DecompressEnemyList(EnemySpawn *enemyPositionList)
thumb_func_start SpriteLz_DecompressEnemyList
SpriteLz_DecompressEnemyList:
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
thumb_func_end SpriteLz_DecompressEnemyList

thumb_func_start dummy_2970
dummy_2970:
    push       { r5, lr }
    ldr        r5,PTR_gSpriteLzDetails_080029b0
    ldr        r1,[r5,#SpriteLzDetails_m_next]
    ldr        r0,PTR_DAT_080029b4
    @ Passing the address of format text at 0x2980, and the pointer to the
    @ next available decompressed sprite block to a dummy function
    bl         dummy_3cc4
    pop        { r5, pc }
thumb_func_end dummy_2970
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

    .end
