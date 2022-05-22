#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_08007828, 0x8007828
    .set FUN_08007c2c, 0x8007c2c
    .set FUN_080064b0, 0x80064b0
    .set FUN_08009d8c, 0x8009d8c
    .set FUN_08002720, 0x8002720
    .set FUN_08002768, 0x8002768
    .set FUN_08003154, 0x8003154
    .set FUN_08003450, 0x8003450
    .set FUN_08003778, 0x8003778
    .set FUN_08003a60, 0x8003a60
    .set FUN_08006a04, 0x8006a04
    .set FUN_08009cf8, 0x8009cf8
    .set FUN_08007acc, 0x8007acc
    .set FUN_08009d8c_TransferQueuedObjects, 0x8009d8c
    .set FUN_08006a04_IsBattleTimerPaused, 0x8006a04
    
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
    bl         FUN_08007c2c
    tst        r0,r0
    beq        LAB_080058aa
    bl         dummy_10280
    bl         FUN_080064b0
LAB_080058aa:
    bl         FUN_08009d8c_TransferQueuedObjects
    push       { r5 }
    bl         FUN_08002720
    bl         FUN_08002768
    bl         FUN_08003154
    bl         FUN_08003450
    bl         FUN_08003778
    bl         FUN_08003a60
    pop        { r5 }
    ldrb       r0,[r5,#0x1f]
    tst        r0,r0
    beq        LAB_080058e0
    bl         FUN_08006a04_IsBattleTimerPaused
    tst        r0,r0
    bne        LAB_080058e0
    ldr        r0,[r5,#0x68]
    str        r0,[r5,#0x6c]
    mov        r0,#0x0
    str        r0,[r5,#0x68]
LAB_080058e0:
    bl         FUN_08009cf8
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
