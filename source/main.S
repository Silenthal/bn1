#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"
    
    .set FUN_08001d60               , 0x8001d60
    .set FUN_080027f4               , 0x80027f4
    .set FUN_080063b2               , 0x80063b2
    .set FUN_0801996c               , 0x801996c
    .set InitMainState_34           , 0x8010414
    .set ClearMemAtOffsets          , 0x8010a5c
    .set InitMainState0x58          , 0x8001d0c
    .set InitMainStateVar0x18       , 0x8004c20
    .set Sio_SetReady               , 0x809bdf0

    .text

    .thumb

thumb_func_start AgbMain
AgbMain:
    bl         Main_Init
    LoadStateTo r0, Main_manager
    movs       r1,#0x14
    strb       r1,[r0]
LAB_08000290:
    bl         Main_SoftResetCheck
    bl         Main_WaitFrames
    bl         BgUpdate_CallPreLoopFunction
    bl         Video_ApplySettings
    ldr        r0,=Oam_TransferData_far
    mov        lr,pc
    bx         r0
    bl         Sprite_TransferPalettes
    bl         Video_QueueBgPalTransfer
    bl         Dma_TransferListStartAll
    bl         FUN_080027f4
    bl         Video_BlitScreens
    bl         Main_ReadInput
    mov        r0,r10
    ldr        r0,[r0,#0x50]
    ldrh       r1,[r0]
    add        r1,#0x1
    strh       r1,[r0]
    bl         IncrementGameTimer
    ldr        r0,=jumpTableState
    mov        r7,r10
    ldr        r1,[r7]
    ldrb       r1,[r1]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         FUN_080063b2
    tst        r0,r0
    beq        LAB_080002e6
    bl         Fade_Apply
LAB_080002e6:
    bl         Text_Main
    bl         FUN_0801996c
    bl         BgUpdate_CallPostLoopFunction
    bl         FUN_08001d60
    b          LAB_08000290
thumb_func_end AgbMain

    .pool

jumpTableState:
    .word 0x8010424+1
    .word 0x8004130+1
    .word 0x8005864+1
    .word 0x8017504+1
    .word Demo_Main
    .word 0x8018ca4+1
    .word 0x8019808+1
    .word 0x801e8ac+1
    .word 0x801ff78+1
    .word 0x80200f8+1
    .word 0x80214a4+1

@@ Waits for a certain amount of frames.
@ void Main_WaitFrames(void)
thumb_func_start Main_WaitFrames
Main_WaitFrames:
    push       { lr }
1:
    ldr        r0,frameCounter
    ldrh       r2,[r0]
    ldr        r1,frameWait0
    ldrh       r1,[r1]
    cmp        r2,r1
    blt        1b
    mov        r1,#0x0
    strh       r1,[r0]
    pop        { pc }
thumb_func_end Main_WaitFrames

@@ Reads the input.
@ void Main_ReadInput(void)
thumb_func_start Main_ReadInput
Main_ReadInput:
    mov        r7,r10
    ldr        r0,[r7,#0x4]
    ldrb       r7,[r0,#0x13]
    add        r7,#0x1
    cmp        r7,#0x3
    ble        .resetCounter
    mov        r7,#0x0
.resetCounter:
    strb       r7,[r0,#0x13]
    ldr        r4,keyInput
    ldrh       r4,[r4]
    mvn        r4,r4
    ldrh       r5,[r0]
    strh       r5,[r0,#0x6]
    strh       r4,[r0]
    add        r6,r4,#0x0
    and        r6,r5
    mov        r1,#0x8
    mov        r3,#0x0
.loopStart:
    mov        r2,#0x1
    lsl        r2,r3
    and        r2,r6
    beq        .keyNotHeld
    ldrb       r2,[r0,r1]
    cmp        r2,#0x10
    bge        .checkCounter
    add        r2,#0x1
    strb       r2,[r0,r1]
    cmp        r2,#0x1
    beq        .loopEnd
.clearHeldKey:
    mov        r2,#0x1
    lsl        r2,r3
    mvn        r2,r2
    and        r6,r2
    b          .loopEnd
.keyNotHeld:
    mov        r2,#0x0
    strb       r2,[r0,r1]
    b          .loopEnd
.checkCounter:
    ldrb       r7,[r0,#0x13]
    cmp        r7,#0x0
    beq        .loopEnd
    b          .clearHeldKey
.loopEnd:
    add        r3,#0x1
    add        r1,#0x1
    cmp        r1,#0x12
    blt        .loopStart
    strh       r6,[r0,#0x4]
    mvn        r5,r5
    and        r4,r5
    strh       r4,[r0,#0x2]
    mov        pc,lr
thumb_func_end Main_ReadInput

@@ Performs a soft reset check based on some conditions.
@ void Main_SoftResetCheck(void)
thumb_func_start Main_SoftResetCheck
Main_SoftResetCheck:
    push       { lr }
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        .end
    mov        r7,r10
    ldr        r0,[r7,#0x4]
    ldrh       r2,[r0,#0x2]
    ldrh       r0,[r0,#0x0]
    ldr        r1,[r7,#0x0]
    add        r1,#0x4
    ldrb       r4,[r1,#0x0]
    sub        r4,#0x1
    cmp        r4,#0x0
    bgt        .storeCounter
    mov        r4,#0x0
    mov        r3,#0xf
    and        r0,r3
    cmp        r0,r3
    bne        .storeCounter
    and        r2,r3
    tst        r2,r2
    beq        .storeCounter
    @ Soft reset check (A + B + Start + Select)
    push       { r1 }
    bl         InitializeInterruptVectors
    bl         0x80003F0 @ Main_Init
    pop        { r1 }
    mov        r4,#0xa
.storeCounter:
    strb       r4,[r1,#0x0]
.end:
    pop        { pc }

    .word .+4
    .word 0x200ace0
thumb_func_end Main_SoftResetCheck

@@ Initializes the main state used by the game.
@ void Main_Init(void)
thumb_func_start Main_Init
Main_Init:
    push       { lr }
    ldr        r0,PTR_MainState_08000468
    mov        r10,r0
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    mov        r1,#0x40
    strh       r1,[r0,#0x0]
    bl         Video_InitPaletteColor0
    bl         Video_ApplySettings
    bl         Sound_Init
    bl         BgUpdate_Init
    bl         0x80018fc
    bl         0x800265c
    bl         InitMainState_34
    bl         ClearMemAtOffsets
    bl         Dma_TransferListClear
    bl         Rng_Init
    bl         Text_Init
    bl         0x8010bbc
    bl         0x8004020
    bl         0x800408c
    bl         0x801880c
    bl         0x801882c
    bl         InitMainState0x58
    bl         Video_InitBlendSettings
    bl         InitMainStateVar0x18
    mov        r0,r10
    push       { r0 }
    bl         Sio_SetReady
    pop        { r0 }
    mov        r10,r0
    @ Set eFrameWait to 1
    ldr        r0,frameWait
    mov        r1,#0x1
    strh       r1,[r0,#0x0]
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x8
    bl         memset0_32
    pop        { pc }

PTR_MainState_08000468: .word MainState

MainState:
    .word eMainState0x00
    .word gInput
    .word gGameState
    .word eMainState0x0C
    .word gDisplaySettings
    .word eMainState0x14
    .word eMainState0x18
    .word eMainState0x1C
    .word eMainState0x20
    .word eMainState0x24
    .word eMainState0x28
    .word eMainState0x2C
    .word eMainState0x30
    .word gMainMenu
    .word gWindowSettings
    .word gBlendSettings
    .word gDemo
    .word eMainState0x44
    .word gText
    .word eMainState0x4C
    .word gFrameCounter
    .word eMainState0x54
    .word eMainState0x58
    .word iwScreens
    .word eMainState0x60
    .word eMainState0x64
    .word eMainState0x68
    .word eMainState0x6C
    .word gShop
    .word eMainState0x74
    .word eMainState0x78
    .word eMainState0x7C
thumb_func_end Main_Init

thumb_func_start waitForVBlank
waitForVBlank:
    push       { lr }
    ldr        r0,dispStat
    mov        r2,#0x1
1:
    ldrh       r1,[r0]
    tst        r1,r2
    beq        1b
    pop        { pc }

    .byte 0
    .byte 0
thumb_func_end waitForVBlank

frameCounter:    .word eFrameCounter
frameWait0:        .word eFrameWaitValue
keyInput:        .word REG_KEYINPUT
frameWait:        .word eFrameWaitValue
dispStat:        .word REG_DISPSTAT

    .end

