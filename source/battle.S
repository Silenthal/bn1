#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_08007828, 0x8007828
    .set Battle_IsActive, 0x8007c2c
    .set Battle_SetFieldTilemap, 0x80064b0
    .set AdvanceInBattleTimer, 0x8009cf8
    .set FUN_08007acc, 0x8007acc
    .set Battle_IsTimerPaused, 0x8006a04
    
    .text

    .thumb

thumb_func_start Battle_Main
Battle_Main:
    push       { lr }
    mov        r5,r10
    ldr        r5,[r5,#0xc]
    mov        r0,#0x1
    strb       r0,[r5,#0x1f]
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08005890
    ldrb       r0,[r5,#0x1d]
    cmp        r0,#0xff
    beq        LAB_08005890
    ldrb       r0,[r5,#0x1c]
    tst        r0,r0
    beq        LAB_0800588c
    bl         FUN_08007acc
    strb       r0,[r5,#0x1f]
    b          LAB_08005890
LAB_0800588c:
    bl         FUN_08007828
LAB_08005890:
    ldr        r0,=jumpTableBattleMain
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Battle_IsActive
    tst        r0,r0
    beq        LAB_080058aa
    bl         dummy_10280
    bl         Battle_SetFieldTilemap
LAB_080058aa:
    bl         BattleSpriteQueue_TransferAll
    push       { r5 }
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         AttackCell_LoadAll
    bl         DisplayObject_LoadAll
    pop        { r5 }
    ldrb       r0,[r5,#0x1f]
    tst        r0,r0
    beq        LAB_080058e0
    bl         Battle_IsTimerPaused
    tst        r0,r0
    bne        LAB_080058e0
    ldr        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_080058e0:
    bl         AdvanceInBattleTimer
    pop        { pc }
thumb_func_end Battle_Main
    .align 2, 0
jumpTableBattleMain:
    .word 0x80058fc+1
    .word 0x8005a7c+1
    .word 0x8005aec+1
    .word 0x8005d62+1

    .pool

    .end
