#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_0801fec0, 0x801fec0
    .set FUN_0801fe84, 0x801fe84
    .set DAT_06017200, 0x6017200
    .set DAT_06017400, 0x6017400
    .set DAT_06017600, 0x6017600
    .set paletteOfflineIcons, 0x869c25c
    .set tilesetPETIcon, 0x869c27c
    .set tilesetAlert0, 0x869c47c
    .set tilesetAlert1, 0x869c67c
    .set tilesetAlert2, 0x869c87c
    .set tilesetAlert3, 0x869ca7c
    .set tilesetAlert4, 0x869cc7c
    .set tilesetAlert5, 0x869ce7c
    .set tilesetMegaManIcon, 0x869d07c



_ts InitPetStatusControl
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x60]
    push       {r5}
    add        r0,r5,#0x0
    mov        r1,#0x8
    bl         memset0_32
    ldr        r0,PTR_tilesetPETIcon_080174b0
    ldr        r1,PTR_DAT_080174b4
    mov        r2,#0x80
    bl         Dma_TransferListAdd
    ldr        r0,PTR_tilesetMegaManIcon_080174b8
    ldr        r1,PTR_DAT_080174bc
    mov        r2,#0x20
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteOfflineIcons_080174c0
    ldr        r1,PTR_eObjPaletteD_080174c4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x4]
    bl         FUN_0801fec0
    pop        {pc}


_ts PetStatusControl_Main
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x8]
    ldrb       r1,[r0,#0x4]
    cmp        r1,#0x80
    bge        LAB_080172d8
    ldr        r5,[r7,#0x60]
    ldr        r0,PTR_PTR_PSC_0_DrawEmptyPet_080174c8
    ldrb       r1,[r5,#0x4]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
LAB_080172d8:
    bl         FUN_0801fe84
    pop        {pc}

    .align 2, 0

PTR_PSC_0_DrawEmptyPet_080172e0:
    .word PSC_0_DrawEmptyPet
    .word PSC_1_DrawPet
    .word PSC_2_DrawEmptyPetAlertActive
    .word PSC_3_DrawPetAlertActive
    .word dummy_1733c
    .word PSC_5_DrawEmptyPetAlert
    .word PSC_6_DrawPetAlert


_ts PSC_0_DrawEmptyPet
    push       {lr}
    mov        r0,#0x0
    bl         PSC_AnimatePetIcon
    pop        {pc}


_ts PSC_1_DrawPet
    push       {lr}
    mov        r0,#0x0
    bl         PSC_AnimatePetIcon
    mov        r0,#0x0
    bl         PSC_DrawMegamanHeadIcon
    pop        {pc}


_ts PSC_2_DrawEmptyPetAlertActive
    push       {lr}
    mov        r0,#0x1
    bl         PSC_AnimatePetIcon
    bl         PSC_AnimateAlertWithSound
    pop        {pc}


_ts PSC_3_DrawPetAlertActive
    push       {lr}
    mov        r0,#0x1
    bl         PSC_AnimatePetIcon
    bl         PSC_AnimateAlertWithSound
    mov        r0,#0x1
    bl         PSC_DrawMegamanHeadIcon
    pop        {pc}


_ts dummy_1733c
    push       {lr}
    pop        {pc}


_ts PSC_5_DrawEmptyPetAlert
    push       {lr}
    mov        r0,#0x1
    bl         PSC_AnimatePetIcon
    bl         PSC_DrawAlert
    pop        {pc}


_ts PSC_6_DrawPetAlert
    push       {lr}
    mov        r0,#0x1
    bl         PSC_AnimatePetIcon
    bl         PSC_DrawAlert
    mov        r0,#0x1
    bl         PSC_DrawMegamanHeadIcon
    pop        {pc}


_ts PSC_AnimatePetIcon
    push       {lr}
    mov        r2,#0x18
    mul        r2,r0
    ldrb       r0,[r5,#0x5]
    add        r0,r0,r2
    ldr        r1,PTR_BYTE_ARRAY_080174cc
    ldrb       r1,[r1,r0]
    push       {r5}
    ldr        r0,DAT_080174d0
    lsl        r1,r1,#0x10
    orr        r0,r1
    ldr        r1,ObjectTileAttributes_080174d4
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x1
    cmp        r0,#0x18
    blt        LAB_08017390
    mov        r0,#0x0
LAB_08017390:
    strb       r0,[r5,#0x5]
    pop        {pc}
BYTE_ARRAY_08017394:
    .byte 0,  0,  0,  0
    .byte 0,  0,  0,  0
    .byte 0,  0,  0,  0
    .byte 0,  0,  0,  0
    .byte 0,  0,  0,  0
    .byte 0,  0,  0,  0

    .byte 0,  1,  2,  3
    .byte 2,  1,  0,  1
    .byte 2,  3,  2,  1
    .byte 0,  1,  2,  3
    .byte 2,  1,  0,  1
    .byte 2,  3,  2,  1


_ts PSC_DrawMegamanHeadIcon
    push       {lr}
    push       {r5}
    ldr        r0,ObjectXYAttributes_080174d8
    ldr        r1,ObjectTileAttributes_080174dc
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    pop        {pc}


_ts PSC_AnimateAlertWithSound
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldr        r1,PTR_petAlertAnimationFrames_080174e0
    ldr        r0,[r1,r0]
    push       {r5}
    ldr        r1,PTR_DAT_080174e4
    mov        r2,#0x80
    bl         Dma_TransferListAdd
    pop        {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    cmp        r0,#0x48
    blt        LAB_080173f6
    mov        r0,#0x0
LAB_080173f6:
    strb       r0,[r5,#0x6]
    push       {r5}
    ldr        r0,ObjectXYAttributes_080174e8
    ldr        r1,ObjectTileAttributes_080174ec
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    ldrb       r0,[r5,#0x7]
    sub        r0,#0x1
    bgt        LAB_0801741a
    mov        r0,#0x86
    bl         Sound_PlaySongImmediate
    mov        r0,#0x2a
    strb       r0,[r5,#0x7]
    b          LAB_0801741c
LAB_0801741a:
    strb       r0,[r5,#0x7]
LAB_0801741c:
    pop        {pc}


_ts PSC_DrawAlert
    push       {lr}
    ldrb       r0,[r5,#0x6]
    ldr        r1,PTR_petAlertAnimationFrames_080174f0
    ldr        r0,[r1,r0]
    push       {r5}
    ldr        r1,PTR_DAT_080174e4
    mov        r2,#0x80
    bl         Dma_TransferListAdd
    pop        {r5}
    ldrb       r0,[r5,#0x6]
    add        r0,#0x4
    cmp        r0,#0x48
    blt        LAB_0801743e
    mov        r0,#0x0
LAB_0801743e:
    strb       r0,[r5,#0x6]
    push       {r5}
    ldr        r0,ObjectXYAttributes_080174e8
    ldr        r1,ObjectTileAttributes_080174ec
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    pop        {pc}

    .align 2, 0

petAlertAnimationFrames:
    .word tilesetAlert0
    .word tilesetAlert0
    .word tilesetAlert0
    .word tilesetAlert1
    .word tilesetAlert1
    .word tilesetAlert1
    .word tilesetAlert2
    .word tilesetAlert2
    .word tilesetAlert2
    .word tilesetAlert3
    .word tilesetAlert3
    .word tilesetAlert3
    .word tilesetAlert4
    .word tilesetAlert4
    .word tilesetAlert4
    .word tilesetAlert5
    .word tilesetAlert5
    .word tilesetAlert5


_ts PetStatusControl_SetState
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x60]
    strb       r0,[r5,#0x4]
    cmp        r0,#0x14
    blt        LAB_080174ae
    mov        r0,#0xaa
    bl         Sound_PlaySongImmediate
LAB_080174ae:
    pop        {pc}

PTR_tilesetPETIcon_080174b0:
    .word tilesetPETIcon
PTR_DAT_080174b4:
    .word DAT_06017200
PTR_tilesetMegaManIcon_080174b8:
    .word tilesetMegaManIcon
PTR_DAT_080174bc:
    .word DAT_06017400
PTR_paletteOfflineIcons_080174c0:
    .word paletteOfflineIcons
PTR_eObjPaletteD_080174c4:
    .word eObjPaletteD
PTR_PTR_PSC_0_DrawEmptyPet_080174c8:
    .word PTR_PSC_0_DrawEmptyPet_080172e0
PTR_BYTE_ARRAY_080174cc:
    .word BYTE_ARRAY_08017394
DAT_080174d0:
    .word 0x80000003
ObjectTileAttributes_080174d4:
    .word 0xD790
ObjectXYAttributes_080174d8:
    .word 0x400E0006
ObjectTileAttributes_080174dc:
    .word 0xD7A0
PTR_petAlertAnimationFrames_080174e0:
    .word petAlertAnimationFrames
PTR_DAT_080174e4:
    .word DAT_06017600
ObjectXYAttributes_080174e8:
    .word 0x80100002
ObjectTileAttributes_080174ec:
    .word 0xD7B0
PTR_petAlertAnimationFrames_080174f0:
    .word petAlertAnimationFrames
