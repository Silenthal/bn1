#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


@@ Main game loop
_ts AgbMain
    bl         Main_Init
    LoadMain manager, r0, r7
    movs       r1,#MS_Splash
    strb       r1,[r0, #Manager_gameState]
.mainLoop:
    bl         Main_SoftResetCheck
    bl         Main_WaitFrames
    bl         BgUpdate_CallVBlankProc
    bl         Video_ApplySettings
    ldr        r0,=Oam_TransferData_far
    mov        lr,pc
    bx         r0
    bl         Sprite_TransferPalettes
    bl         Video_QueueBgPalTransfer
    bl         Dma_TransferListStartAll
    bl         SpriteTilesetDetail_Init
    bl         Video_BlitScreens
    bl         Main_ReadInput
    LoadMain frameCounter, r0, r0
    ldrh       r1,[r0,#FrameCounter_counter]
    add        r1,#0x1
    strh       r1,[r0,#FrameCounter_counter]
    bl         IncrementGameTimer
    ldr        r0,=jumpTableMain
    LoadMain manager, r1, r7
    ldrb       r1,[r1,#Manager_gameState]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Battle_IsBattleActive
    tst        r0,r0
    beq        1f
    bl         Fade_Apply
1:
    bl         Text_Main
    bl         Menu_LoadChipDetail
    bl         BgUpdate_CallProc
    bl         BgTask_Update
    b          .mainLoop

    .pool

jumpTableMain:
    .word MainMenu_Main
    .word World_Main
    .word Battle_Main
    .word Transition_Main
    .word Demo_Main
    .word Splash_Main
    .word Menu_Main
    .word Shop_Main
    .word GameOver_Main
    .word ChipTrader_Main
    .word Credits_Main


@@ Waits for a specific amount of frames to pass.
_ts Main_WaitFrames
    push       {lr}
1:
    ldr        r0,PTR_gFrameCounter
    ldrh       r2,[r0]
    ldr        r1,PTR_gFrameWaitValue_0
    ldrh       r1,[r1]
    cmp        r2,r1
    blt        1b
    mov        r1,#0x0
    strh       r1,[r0]
    pop        {pc}


@@ Reads input from the controls.
_ts Main_ReadInput
    LoadMain input, r0, r7
    ldrb       r7,[r0,#Input_frameCounter]
    add        r7,#0x1
    cmp        r7,#0x3
    ble        .resetCounter
    mov        r7,#0x0
.resetCounter:
    strb       r7,[r0,#Input_frameCounter]
    ldr        r4,PTR_REG_KEYINPUT
    ldrh       r4,[r4]
    mvn        r4,r4
    ldrh       r5,[r0]
    strh       r5,[r0,#Input_lastKeyState]
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
    ldrb       r7,[r0,#Input_frameCounter]
    cmp        r7,#0x0
    beq        .loopEnd
    b          .clearHeldKey
.loopEnd:
    add        r3,#0x1
    add        r1,#0x1
    cmp        r1,#0x12
    blt        .loopStart
    strh       r6,[r0,#Input_heldKeyState]
    mvn        r5,r5
    and        r4,r5
    strh       r4,[r0,#Input_toggleKeyState]
    mov        pc,lr


@@ Performs a soft reset check based on some conditions.
_ts Main_SoftResetCheck
    push       {lr}
    LoadMain fade, r0, r7
    ldrb       r0,[r0,#FadeSettings_isFadeActive]
    mov        r1,#0x1
    cmp        r0,r1
    beq        .end
    LoadMain input, r0, r7
    ldrh       r2,[r0,#Input_toggleKeyState]
    ldrh       r0,[r0,#Input_curKeyState]
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
    push       {r1}
    bl         InitializeInterruptVectors
    bl         Main_Init
    pop        {r1}
    mov        r4,#0xa
.storeCounter:
    strb       r4,[r1,#0x0]
.end:
    pop        {pc}

    .word .+4
    .word 0x200ace0


@@ Initializes the main state used by the game, as well as other subsystems.
_ts Main_Init
    push       {lr}
    ldr        r0,PTR_MainState
    mov        r10,r0
    LoadMain display, r0, r7
    mov        r1,#0x40
    strh       r1,[r0,#DisplaySettings_dispcnt]
    bl         Video_InitClearColor
    bl         Video_ApplySettings
    bl         Sound_Init
    bl         BgUpdate_Init
    bl         Video_Init
    bl         Oam_Init
    bl         InitMainMenu
    bl         Oam_InitTransferData
    bl         Dma_TransferListClear
    bl         Rng_Init
    bl         Text_Init
    bl         Oam_InitAffineData
    bl         InitWorld_LoadGame
    bl         InitWorld_NewGame
    bl         Scene_UnloadAndResetStepCounter
    bl         Scene_UnloadIfMarked
    bl         InitBgTask
    bl         Video_InitBlendSettings
    bl         InitFadeSettings
    mov        r0,r10
    push       {r0}
    bl         Sio_SetReady
    pop        {r0}
    mov        r10,r0
    @ Set gFrameWaitValue to 1
    ldr        r0,PTR_gFrameWaitValue_1
    mov        r1,#0x1
    strh       r1,[r0,#0x0]
    LoadMain manager, r0, r7
    mov        r1,#0x8
    bl         memset0_32
    pop        {pc}

PTR_MainState: .word MainState

MainState:
    .word gManager
    .word gInput
    .word gWorld
    .word gBattle
    .word gDisplaySettings
    .word gCamera
    .word gFadeSettings
    .word gBattleUi
    .word gMatchBattleState
    .word gMapEventState
    .word gScene
    .word gMapChange
    .word gTransition
    .word gMainMenu
    .word gWindowSettings
    .word gBlendSettings
    .word gDemo
    .word gBgDataManager
    .word gText
    .word gBattleMessageList
    .word gFrameCounter
    .word gScreenDim
    .word gBgAnimationTaskList
    .word gScreens
    .word gPetStatusControl
    .word gPasscodeEntry
    .word gTextUi
    .word gStartMenu
    .word gShop
    .word gMenu
    .word gGameStats
    .word gFieldObstacleManager


@@ Wait for vblank to finish.
_ts Main_WaitForVBlank
    push       {lr}
    ldr        r0,PTR_REG_DISPSTAT
    mov        r2,#0x1
1:
    ldrh       r1,[r0]
    tst        r1,r2
    beq        1b
    pop        {pc}

    .align 2, 0

PTR_gFrameCounter:      .word gVBlankFrameCounter
PTR_gFrameWaitValue_0:  .word gFrameWaitValue
PTR_REG_KEYINPUT:       .word REG_KEYINPUT
PTR_gFrameWaitValue_1:  .word gFrameWaitValue
PTR_REG_DISPSTAT:       .word REG_DISPSTAT
