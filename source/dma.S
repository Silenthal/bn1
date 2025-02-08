    .include "constants.inc"
    .include "macros.inc"


@@ Sets the settings for a particular DMA channel.
@@ In:
@@ r0: void* startAddress - The address to read data from.
@@ r1: void* endAddress - The address to write data to.
@@ r2: int wordCount - The amount of 16-bit or 32-bit words to write.
@@ r3: int channel - The channel to write to.
@@ r4: int control - The control settings of the channel.
_ts Dma_SetDirect
    lsl        r3,r3,#0x2
    ldr        r5,PTR_listDmaChannel
    ldr        r5,[r5,r3]
    mov        r3,#0x8
    ldr        r7,PTR_dmaEnableMask
1:
    ldr        r6,[r5,r3]
    and        r6,r7
    bne        1b
    str        r0,[r5]
    str        r1,[r5,#0x4]
    orr        r4,r2
    str        r4,[r5,#0x8]
    mov        pc,lr

    .align 2,0

listDmaChannel:
    .word REG_DMA0
    .word REG_DMA1
    .word REG_DMA2
    .word REG_DMA3


@@ Waits for any active DMA transfers to end.
@@ In:
@@ r0: WaitDmaFlag flags - The DMA registers to check. Bit 1 set checks DMA1, Bit 2 DMA2, and so on.
_ts Dma_WaitForEnd
    ldr        r3,PTR_REG_DMA0
.checkDma0:
    mov        r1,#0x0
    mov        r4,#0x1
    tst        r0,r4
    beq        .checkDma1
    ldr        r2,[r3,#0x8]
    orr        r1,r2
.checkDma1:
    mov        r4,#0x2
    tst        r0,r4
    beq        .checkDma2
    ldr        r2,[r3,#0x14]
    orr        r1,r2
.checkDma2:
    mov        r4,#0x4
    tst        r0,r4
    beq        .checkDma3
    ldr        r2,[r3,#0x20]
    orr        r1,r2
.checkDma3:
    mov        r4,#0x8
    tst        r0,r4
    beq        .checkFlags
    ldr        r2,[r3,#0x2c]
    orr        r1,r2
.checkFlags:
    ldr        r2,PTR_dmaEnableMask
    and        r1,r2
    bne        .checkDma0
    mov        pc,lr


@@ Clears the list of pending DMA transfers.
_ts Dma_TransferListClear
    ldr        r0,PTR_dmaListSz_0
    mov        r1,#0x0
    str        r1,[r0]
    mov        pc,lr


@@ Adds params for channel 3 DMA transfer to the transfer queue.
@@ In:
@@ r0: void* startAddress - The address to read data from.
@@ r1: void* endAddress - The address to write data to.
@@ r2: int wordCount - The amount of words being transferred.
_ts Dma_TransferListAdd
    mov        r3,#0x0
    add        r7,r3,#0x0
    ldr        r3,PTR_dmaListSz_1
    ldr        r4,[r3]
    cmp        r4,#0x40
    bge        1f
    add        r5,r4,#0x0
    add        r4,#0x1
    str        r4,[r3]
    ldr        r4,PTR_gDmaParamList
    mov        r6,#0x10
    mul        r5,r6
    add        r4,r4,r5
    str        r0,[r4,#0x0]
    str        r1,[r4,#0x4]
    str        r2,[r4,#0x8]
    ldr        r3,val4
    lsl        r7,r7,#0x2
    ldr        r3,[r3,r7]
    str        r3,[r4,#0xc]
1:
    mov        pc,lr

    .align 2,0

val4:
    .word pList
pList:
    .word 0x84000000
    .word 0x85000000


@@ Performs all queued DMA channel 3 transfers.
_ts Dma_TransferListStartAll
    push       { lr }
    ldr        r0,=gDmaParamListSize
    ldr        r1,[r0]
    ldr        r2,=gDmaParamList
LAB_080009ec:
    cmp        r1,#0x0
    beq        LAB_08000a12
    mov        r8,r1
    mov        r9,r2
    ldr        r4,[r2,#0xc]
    ldr        r0,[r2,#0x0]
    ldr        r1,[r2,#0x4]
    ldr        r2,[r2,#0x8]
    mov        r3,#0x3
    bl         Dma_SetDirect
    mov        r0,#0x8
    bl         Dma_WaitForEnd
    mov        r1,r8
    mov        r2,r9
    sub        r1,#0x1
    add        r2,#0x10
    b          LAB_080009ec
LAB_08000a12:
    bl         Dma_TransferListClear
    pop        { pc }

PTR_listDmaChannel: .word listDmaChannel
PTR_dmaEnableMask:  .word DMA_ENABLE
PTR_REG_DMA0:       .word REG_DMA0
PTR_dmaListSz_0:    .word gDmaParamListSize
PTR_dmaListSz_1:    .word gDmaParamListSize
PTR_gDmaParamList:  .word gDmaParamList
