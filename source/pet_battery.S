#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts PETBattery_Init
    push       {lr}
    ldr        r5,PTR_gPETBattery_0801fed0
    push       {r0,r5}
    add        r0,r5,#0x0
    mov        r1,#0xc
    bl         memset0_32
    ldr        r0,PTR_tilesetBatteryUI_0801fed4
    ldr        r1,PTR_DAT_0801fed8
    ldr        r2,DAT_0801fedc
    bl         Dma_TransferListAdd
    ldr        r0,PTR_paletteBatteryUI_0801fee0
    ldr        r1,PTR_eObjPaletteC_0801fee4
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r0,r5}
    strb       r0,[r5,#0x3]
    mov        r0,#0x1
    strb       r0,[r5,#0xa]
    pop        {pc}


_ts PETBattery_Main
    push       {lr}
    ldr        r5,PTR_gPETBattery_0801fee8
    strb       r0,[r5,#0x1]
    ldr        r0,PTR_PTR_PETBattery_0_DischargeMode_0801feec
    ldrb       r1,[r5,#0x3]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_PETBattery_0_DischargeMode_0801fc0c:
    .word PETBattery_0_DischargeMode
    .word PETBattery_1_RechargeMode


_ts PETBattery_0_DischargeMode
    push       {lr}
    bl         PETBattery_IsBatteryActive
    pop        {pc}


_ts PETBattery_1_RechargeMode
    push       {lr}
    bl         PETBattery_ManualRecharge
    pop        {pc}


_ts PETBattery_DrawGauge
    push       {lr}
    mov        r6,r10
    ldr        r6,[r6,#0x78]
    ldrb       r6,[r6,#0x5]
    mov        r0,#0x0
    mov        r7,#0x0
LAB_0801fc30:
    add        r0,#0x1
    push       {r0,r5,r6,r7}
    ldr        r1,DAT_0801fef0
    cmp        r0,r6
    ble        LAB_0801fc3c
    add        r1,#0x2
LAB_0801fc3c:
    ldr        r0,DAT_0801fef4
    lsl        r7,r7,#0x10
    sub        r0,r0,r7
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r5,r6,r7}
    add        r7,#0x8
    cmp        r7,#0x50
    blt        LAB_0801fc30
    push       {r5}
    ldr        r0,DAT_0801fef8
    ldr        r1,DAT_0801fefc
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,DAT_0801ff00
    ldr        r1,DAT_0801ff04
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    pop        {pc}


_ts PETBattery_FlashIfMoving
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x78]
    ldrh       r1,[r0,#0x10]
    ldrb       r0,[r0,#0x5]
    ldr        r6,[r7,#0x8]
    ldr        r6,[r6,#0x28]
    ldr        r2,[r6,#0x24]
    ldr        r3,[r6,#0x30]
    cmp        r2,r3
    bne        LAB_0801fc9c
    ldr        r2,[r6,#0x28]
    ldr        r3,[r6,#0x34]
    cmp        r2,r3
    bne        LAB_0801fc9c
    ldrh       r2,[r5,#0x4]
    sub        r2,#0x1
    blt        LAB_0801fc98
    strh       r2,[r5,#0x4]
    b          LAB_0801fca0
LAB_0801fc98:
    cmp        r0,#0x0
    bgt        LAB_0801fcc2
LAB_0801fc9c:
    mov        r0,#0x10
    strh       r0,[r5,#0x4]
LAB_0801fca0:
    push       {r5}
    ldr        r7,[r7,#0x50]
    ldrh       r7,[r7,#0x0]
    mov        r0,#0xf
    and        r0,r7
    mov        r2,#0x0
    cmp        r0,#0x7
    bge        LAB_0801fcb2
    mov        r2,#0x20
LAB_0801fcb2:
    ldr        r0,PTR_paletteBatteryUI_0801fee0
    add        r0,r0,r2
    ldr        r1,PTR_eObjPaletteC_0801ff08
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}
LAB_0801fcc2:
    mov        r0,#0x0
    strh       r0,[r5,#0x4]
    push       {r5}
    ldr        r0,PTR_paletteBatteryUI_0801fee0
    ldr        r1,PTR_eObjPaletteC_0801ff0c
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5}
    pop        {pc}


_ts PETBattery_DrawRechargeState
    push       {r5,lr}
    mov        r2,#0x0
    ldrb       r0,[r5,#0x0]
    tst        r0,r0
    beq        LAB_0801fce4
    mov        r2,#0x20
LAB_0801fce4:
    ldr        r0,PTR_paletteBatteryUI_0801fee0
    ldr        r1,PTR_eObjPaletteC_0801ff10
    add        r0,r0,r2
    mov        r2,#0x20
    bl         memcpy_32
    pop        {r5,pc}


_ts PETBattery_DrawRechargeTimer
    push       {lr}
    push       {r5}
    ldrh       r0,[r5,#0x4]
    bl         FrameTimeToBcdRealTime
    pop        {r5}
    push       {r0,r5}
    lsr        r0,r0,#0xc
    ldr        r1,DAT_0801ff14
    mov        r2,#0xf
    and        r2,r0
    lsl        r2,r2,#0x1
    add        r1,r1,r2
    ldr        r0,ObjectXYAttributes_0801ff18
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r5}
    push       {r0,r5}
    lsr        r0,r0,#0x8
    ldr        r1,DAT_0801ff14
    mov        r2,#0xf
    and        r2,r0
    lsl        r2,r2,#0x1
    add        r1,r1,r2
    ldr        r0,ObjectXYAttributes_0801ff1c
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_0801ff20
    ldr        r1,ObjectTileAttributes_0801ff24
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r5}
    push       {r0,r5}
    lsr        r0,r0,#0x4
    ldr        r1,DAT_0801ff14
    mov        r2,#0xf
    and        r2,r0
    lsl        r2,r2,#0x1
    add        r1,r1,r2
    ldr        r0,ObjectXYAttributes_0801ff28
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r5}
    push       {r0,r5}
    .byte 0, 0 @ mov        r0,r0
    ldr        r1,DAT_0801ff14
    mov        r2,#0xf
    and        r2,r0
    lsl        r2,r2,#0x1
    add        r1,r1,r2
    ldr        r0,ObjectXYAttributes_0801ff2c
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r0,r5}
    push       {r5}
    ldr        r0,ObjectXYAttributes_0801ff30
    ldr        r1,ObjectTileAttributes_0801ff34
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_0801ff38
    ldr        r1,ObjectTileAttributes_0801ff3c
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    ldr        r0,ObjectXYAttributes_0801ff40
    ldr        r1,ObjectTileAttributes_0801ff3c
    mov        r2,#0x1
    mov        r3,#0x0
    bl         Oam_AddObject
    pop        {r5}
    pop        {pc}


_ts PETBattery_SetRechargeParams
    ldr        r5,PTR_gPETBattery_0801ff44
    ldr        r7,PTR_listRechargeTarget_0801ff48
    ldrb       r1,[r7,r0]
    strb       r1,[r5,#0x2]
    ldr        r7,PTR_listRechargeTime_0801ff4c
    lsl        r0,r0,#0x2
    ldr        r1,[r7,r0]
    strh       r1,[r5,#0x4]
    mov        r1,#0x0
    strh       r1,[r5,#0x6]
    mov        pc,lr

    .align 2, 0

listRechargeTime:
    .word 20 * 60
    .word 20 * 60
    .word 20 * 60
listRechargeTarget:
    .byte 10
    .byte 15
    .byte 20


_ts PETBattery_ManualRecharge
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0x5]
    cmp        r0,#0xa
    bge        LAB_0801fe32
    ldrb       r0,[r5,#0x1]
    tst        r0,r0
    bne        LAB_0801fe32
    ldrh       r0,[r5,#0x4]
    sub        r0,#0x1
    ble        LAB_0801fe2e
    strh       r0,[r5,#0x4]
    mov        r7,r10
    ldr        r7,[r7,#0x4]
    ldrh       r7,[r7,#0x2]
    mov        r2,#0x2
    and        r2,r7
    beq        LAB_0801fe2a
    ldrh       r0,[r5,#0x6]
    add        r0,#0x1
    strh       r0,[r5,#0x6]
    push       {r0}
    mov        r0,#0x6e
    bl         Sound_PlaySongImmediate
    pop        {r0}
    mov        r1,#0x1
    strb       r1,[r5,#0x0]
    ldrb       r1,[r5,#0x2]
    cmp        r0,r1
    blt        LAB_0801fe2a
    mov        r0,#0x0
    strh       r0,[r5,#0x6]
    push       {r0}
    mov        r0,#0xc6
    bl         Sound_PlaySongImmediate
    pop        {r0}
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0x5]
    add        r0,#0x1
    strb       r0,[r7,#0x5]
    cmp        r0,#0xa
    blt        LAB_0801fe2a
    mov        r0,#0xa
    strb       r0,[r7,#0x5]
    b          LAB_0801fe32
LAB_0801fe2a:
    mov        r0,#0x0
    pop        {pc}
LAB_0801fe2e:
    mov        r0,#0x0
    strh       r0,[r5,#0x4]
LAB_0801fe32:
    mov        r0,#0x1
    pop        {pc}


_ts PETBattery_IsBatteryActive
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    ldrb       r0,[r7,#0x5]
    ldrh       r1,[r7,#0x10]
    cmp        r0,#0x0
    beq        LAB_0801fe58
    ldr        r2,INT_0801ff50
    cmp        r1,r2
    blt        LAB_0801fe54
    sub        r0,#0x1
    strb       r0,[r7,#0x5]
    mov        r1,#0x0
    strh       r1,[r7,#0x10]
LAB_0801fe54:
    mov        r0,#0x1
    pop        {pc}
LAB_0801fe58:
    ldr        r2,DAT_0801ff54
    cmp        r1,r2
    blt        LAB_0801fe54
    mov        r0,#0x0
    pop        {pc}


_ts PETBattery_ResetStepCounter
    mov        r7,r10
    ldr        r6,[r7,#0x8]
    ldrb       r0,[r6,#0x4]
    ldrb       r1,[r6,#0xc]
    cmp        r0,r1
    beq        LAB_0801fe76
    mov        r0,#0x0
    ldr        r7,[r7,#0x78]
    strh       r0,[r7,#0x10]
LAB_0801fe76:
    mov        pc,lr


_ts PETBattery_RestoreBattery
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0xa
    strb       r0,[r7,#0x5]
    mov        pc,lr


_ts PETBattery_DrawUi
    push       {lr}
    ldr        r5,PTR_gPETBattery_0801ff58
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r7,[r7,#0x0]
    cmp        r7,#0x18
    beq        LAB_0801feb8
    cmp        r7,#0x1c
    beq        LAB_0801feb8
    ldrb       r0,[r5,#0xa]
    tst        r0,r0
    beq        LAB_0801feb8
    ldrb       r0,[r5,#0x3]
    cmp        r0,#0x0
    bne        LAB_0801feac
    bl         PETBattery_DrawGauge
    bl         PETBattery_FlashIfMoving
    b          LAB_0801feb8
LAB_0801feac:
    bl         PETBattery_DrawGauge
    bl         PETBattery_DrawRechargeState
    bl         PETBattery_DrawRechargeTimer
LAB_0801feb8:
    mov        r0,#0x0
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts PETBattery_Disable
    ldr        r5,PTR_gPETBattery_0801ff5c
    mov        r0,#0x0
    strb       r0,[r5,#0xa]
    mov        pc,lr


_ts PETBattery_CheckActive
    ldr        r5,PTR_gPETBattery_0801ff60
    ldrb       r0,[r5,#0x0]
    tst        r0,r0
    mov        pc,lr
PTR_gPETBattery_0801fed0:
    .word gPETBattery
PTR_tilesetBatteryUI_0801fed4:
    .word tilesetBatteryUI
PTR_DAT_0801fed8:
    .word 0x6016800
DAT_0801fedc:
    .word 0x110
PTR_paletteBatteryUI_0801fee0:
    .word paletteBatteryUI
PTR_eObjPaletteC_0801fee4:
    .word eObjPaletteC
PTR_gPETBattery_0801fee8:
    .word gPETBattery
PTR_PTR_PETBattery_0_DischargeMode_0801feec:
    .word PTR_PETBattery_0_DischargeMode_0801fc0c
DAT_0801fef0:
    .word 0xC75E
DAT_0801fef4:
    .word 0xE08000
DAT_0801fef8:
    .word 0x908000
DAT_0801fefc:
    .word 0xC75A
DAT_0801ff00:
    .word 0xE88000
DAT_0801ff04:
    .word 0xC75C
PTR_eObjPaletteC_0801ff08:
    .word eObjPaletteC
PTR_eObjPaletteC_0801ff0c:
    .word eObjPaletteC
PTR_eObjPaletteC_0801ff10:
    .word eObjPaletteC
DAT_0801ff14:
    .word 0xC740
ObjectXYAttributes_0801ff18:
    .word 0x108000
ObjectXYAttributes_0801ff1c:
    .word 0x188000
ObjectXYAttributes_0801ff20:
    .word 0x208000
ObjectTileAttributes_0801ff24:
    .word 0xC754
ObjectXYAttributes_0801ff28:
    .word 0x288000
ObjectXYAttributes_0801ff2c:
    .word 0x308000
ObjectXYAttributes_0801ff30:
    .word 0x88000
ObjectTileAttributes_0801ff34:
    .word 0xC758
ObjectXYAttributes_0801ff38:
    .word 0x10008000
ObjectTileAttributes_0801ff3c:
    .word 0xC756
ObjectXYAttributes_0801ff40:
    .word 0x388000
PTR_gPETBattery_0801ff44:
    .word gPETBattery
PTR_listRechargeTarget_0801ff48:
    .word listRechargeTarget
PTR_listRechargeTime_0801ff4c:
    .word listRechargeTime
INT_0801ff50:
    .word 0x1388
DAT_0801ff54:
    .word 0x9C4
PTR_gPETBattery_0801ff58:
    .word gPETBattery
PTR_gPETBattery_0801ff5c:
    .word gPETBattery
PTR_gPETBattery_0801ff60:
    .word gPETBattery
