#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .set Flag_SetPlayerActive, 0x8056044
    .set InitStartMenuState, 0x80191c8
    .set Inventory_InitChecksum, 0x801b0bc
    .set Inventory_InitChecksumIndex, 0x801b108
    .set FUN_0801f6c4, 0x801f6c4
    .set ClearEmailIndexes, 0x801c54c
    .set FUN_0804c60c, 0x804c60c
    .set dummy_114c0, 0x80114c0
    .set InitPetStatusControl, 0x8017284
    .set Scene_UnloadIfMarked, 0x801882c
    .set PetStatusControl_Main, 0x80172c0
    .set dummy_187a0, 0x80187a0
    .set ClearFlagRange280, 0x805287c
    .set FUN_08052528, 0x8052528
    .set StartMenu_GetState, 0x80194e8
    .set InitStartMenuFromSubMenu, 0x80191ac
    .set Shop_Init, 0x801ef74
    .set GetBattleChipTotalCount, 0x801e7e4
    .set SetupMapFlags, 0x8018554
    .set Scene_MarkForUnloading, 0x8018820
    .set Event_HandleMapEvents, 0x80185b0
    .set StartMenu_Main, 0x8019224
    .set Scene_GetActiveScene, 0x801883c
    .set FUN_080521cc, 0x80521cc
    .set SetupMapEntities, 0x8018580
    .set Map_HandleCollisionEvent, 0x80124d8
    .set InitStartMenu, 0x8019180
    .set SetupBackgroundAndSprites, 0x80114e4

_ts InitWorld_LoadGame
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    mov        r0,#0x0
    ldrb       r2,[r5,#0x4]
    ldrb       r3,[r5,#0xc]
    cmp        r2,r3
    bne        LAB_08004032
    mov        r0,#0x4
LAB_08004032:
    strb       r0,[r5,#0x0]
    mov        r0,#0x3
    strb       r0,[r5,#0x7]
    mov        r0,#0x10
    strb       r0,[r5,#0x13]
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    strb       r0,[r5,#0x12]
    str        r0,[r5,#0x2c]
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    mov        r0,#0xff
    strb       r0,[r5,#0x18]
    mov        r0,#0x0
    strb       r0,[r5,#0x1b]
    strb       r0,[r5,#0x1a]
    ldr        r1,PTR_BYTE_08004084
    strb       r0,[r1,#0x0]
    ldr        r1,PTR_gPlayerFixedAnimationState_08004080
    mov        r0,#0x0
    strb       r0,[r1,#0x0]
    push       {r5}
    bl         Flag_SetPlayerActive
    pop        {r5}
    push       {r5}
    bl         InitStartMenuState
    pop        {r5}
    push       {r5}
    bl         InitChipTrader
    pop        {r5}
    ldr        r7,PTR_gIsObjectXFlipped_08004088
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    bl         DisableScreenDim
    pop        {pc}
PTR_gPlayerFixedAnimationState_08004080:
    .word gPlayerFixedAnimationState
PTR_BYTE_08004084:
    .word 0x200c51a
PTR_gIsObjectXFlipped_08004088:
    .word gIsObjectXFlipped


_ts InitWorld_NewGame
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    mov        r0,#0x0
    str        r0,[r5,#0x24]
    str        r0,[r5,#0x34]
    ldr        r0,DAT_08004118
    strh       r0,[r5,#0xc]
    mov        r0,#0x0
    str        r0,[r5,#0x74]
    ldr        r1,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r1,#0x18]
    mov        r0,#0x0
    str        r0,[r1,#0x24]
    str        r0,[r1,#0x28]
    strh       r0,[r1,#0x14]
    strh       r0,[r1,#0x16]
    str        r0,[r1,#0x0]
    strb       r0,[r1,#0x4]
    strh       r0,[r1,#0x10]
    strb       r0,[r1,#0xe]
    strb       r0,[r1,#0xd]
    strb       r0,[r1,#0xf]
    str        r0,[r1,#0x1c]
    strb       r0,[r1,#0x12]
    mov        r0,#0xa
    strb       r0,[r1,#0x5]
    ldr        r0,DAT_0800412c
    strh       r0,[r5,#0x1c]
    strh       r0,[r5,#0x1e]
    mov        r0,#0x0
    strb       r0,[r5,#0x14]
    strb       r0,[r5,#0x15]
    strb       r0,[r5,#0x16]
    strb       r0,[r5,#0x17]
    push       {r5}
    bl         FUN_080102dc
    bl         InitKeyItem
    bl         FUN_0801f6c4
    bl         Inventory_InitDefaultChipFolder
    bl         Inventory_InitChecksum
    bl         Inventory_InitChecksumIndex
    bl         ClearEmailIndexes
    bl         FUN_0804c60c
    pop        {r5}
    ldr        r0,DAT_08004114
    strh       r0,[r5,#0x4]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    ldr        r6,PTR_DAT_0800411c
    ldr        r0,[r6,#0x0]
    str        r0,[r5,#0x38]
    ldr        r0,[r6,#0x4]
    str        r0,[r5,#0x3c]
    ldr        r0,[r6,#0x8]
    str        r0,[r5,#0x40]
    bl         DisableScreenDim
    pop        {pc}
DAT_08004114:
    .word 0x301
DAT_08004118:
    .word 0xFFFF
PTR_DAT_0800411c:
    .word DAT_08004120
DAT_08004120:
    .word 0x80000
DAT_08004124:
    .word 0xFFFC0000
DAT_08004128:
    .word 0
DAT_0800412c:
    .word 0x64


_ts World_Main
    push       { lr }
    ldr        r0,=jumpTableWorldMain
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldrb       r1,[r5,#0x0]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Rng_RandomUint
    pop        { pc }

    .pool

jumpTableWorldMain:
    .word World_0_AreaChange
    .word World_1_SubAreaChange
    .word World_2_Overworld
    .word World_3_Battle
    .word World_4_MapChange
    .word World_5_Transition
    .word World_6_StartMenu
    .word World_7_SubMenu
    .word World_8_Shop
    .word World_9_ChipTrader


_ts World_0_AreaChange
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08004192
    ldrb       r0,[r5,#0x4]
    bl         dummy_114c0
    ldrb       r0,[r5,#0x4]
    bl         SetupMapFlags
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08004192:
    pop        {pc}

    
_ts World_1_SubAreaChange
    push       {lr}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0800420a
    push       {r5}
    bl         InitPetStatusControl
    pop        {r5}
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    bl         FUN_080102fc
    bl         FUN_08010310
    bl         Scene_MarkForUnloading
    bl         Scene_UnloadIfMarked
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x12]
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         SetupMapEntities
    ldrb       r0,[r5,#0x4]
    bl         SetupBackgroundAndSprites
    push       {r5}
    mov        r0,#0x3
    bl         Video_SetBgControl
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DispCnt_0800420c
    strh       r1,[r0,#0x0]
    push       {r5}
    ldrb       r0,[r5,#0x7]
    ldrb       r1,[r5,#0x13]
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x3
    strb       r0,[r5,#0x7]
    mov        r0,#0x10
    strb       r0,[r5,#0x13]
    mov        r0,r10
    ldr        r0,[r0,#0x2c]
    mov        r1,#0x0
    strb       r1,[r0,#0x10]
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
LAB_0800420a:
    pop        {pc}
DispCnt_0800420c:
    .word DISPCNT_OMAP1D | DISPCNT_BGALL | DISPCNT_OBJ



_ts World_2_Overworld
    push       {lr}
    push       {r5}
    bl         Scene_UnloadIfMarked
    pop        {r5}
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    bl         Event_HandleMapEvents
    mov        r0,#0x0
    strb       r0,[r5,#0xe]
    push       {r5}
    bl         EntityBounds_InitList
    bl         PlayerLocation_UpdateAll
    bl         Actor_UpdateAll
    bl         Attack_UpdateAll
    bl         Effect_UpdateAll
    bl         NPC_UpdateAll
    bl         PetStatusControl_Main
    bl         EntityBounds_UpdateAll
    bl         Camera_UpdatePos
    bl         BGDM_UpdateMapEdge
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    bl         World_HandleMapExit
    bl         World_HandleRandomEncounter
    bl         World_CheckStartMenuOpen
    pop        {pc}


_ts World_3_Battle
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080042e6
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    bl         NPC_UnloadAll
    bl         Battle_Init
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x8
    strb       r1,[r0,#0x0]
    push       {r5}
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_080042e8
    strh       r1,[r0,#0x0]
LAB_080042e6:
    pop        {pc}
DAT_080042e8:
    .word 0x40


_ts World_4_MapChange
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0800433e
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x0
    mov        r7,r10
    ldr        r6,[r7,#0x2c]
    ldrb       r6,[r6,#0x12]
    cmp        r6,#0xf
    bne        LAB_08004338
    ldr        r6,[r7,#0x8]
    mov        r1,#0x1
    strb       r1,[r6,#0x7]
    mov        r0,#0x1
LAB_08004338:
    bl         World_ChangeMap
    pop        {r5}
LAB_0800433e:
    pop        {pc}


_ts World_5_Transition
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080043a0
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    bl         InitTransition
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0xc
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_080043a4
    strh       r1,[r0,#0x0]
LAB_080043a0:
    pop        {pc}
    .align 2, 0
DAT_080043a4:
    .word 0x40


_ts World_6_StartMenu
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    push       {r5}
    bl         StartMenu_Main
    pop        {r5}
    cmp        r0,#0x1
    beq        LAB_080043e0
    cmp        r0,#0x2
    beq        LAB_080043f2
    pop        {pc}
LAB_080043e0:
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x1c
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_080043f2:
    mov        r0,#0x8
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts World_7_SubMenu
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    bl         StartMenu_Main
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08004462
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    bl         NPC_UnloadAll
    bl         InitMenu_0
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x18
    strb       r1,[r0,#0x0]
    mov        r0,#0x3
    bl         Video_SetBgControl
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,SHORT_08004464
    strh       r1,[r0,#0x0]
LAB_08004462:
    pop        {pc}
SHORT_08004464:
    .short 0x40


_nt World_8_Shop
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_080044ba
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    bl         NPC_UnloadAll
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x1c
    strb       r1,[r0,#0x0]
LAB_080044ba:
    pop        {pc}


_ts World_9_ChipTrader
    push       {lr}
    push       {r5}
    bl         PetStatusControl_Main
    bl         InitializeSpriteTilesetOffset
    bl         Sprite_PaletteInit
    bl         PlayerLocation_LoadAll
    bl         Actor_LoadAll
    bl         NPC_LoadAll
    bl         Attack_LoadAll
    bl         Effect_LoadAll
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08004510
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0xf
    bl         Entity_FreeAllMultiple
    bl         NPC_UnloadAll
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x24
    strb       r1,[r0,#0x0]
LAB_08004510:
    pop        {pc}


_ts World_HandleMapExit
    push       {lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x8
    bne        LAB_08004598
    bl         dummy_187a0
    bne        LAB_08004598
    mov        r0,#0x1
    bl         Flag_Get400
    bne        LAB_08004598
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    ldrb       r1,[r0,#0x10]
    cmp        r1,#0x0
    bne        LAB_08004598
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_08004598
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08004598
    bl         Scene_GetActiveScene
    bne        LAB_08004598
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08004598
    push       {r5,r7}
    ldr        r0,[r5,#0x28]
    add        r0,#0x24
    bl         Map_HandleCollisionEvent
    add        r0,r1,#0x0
    pop        {r5,r7}
    cmp        r0,#0x1
    blt        LAB_08004598
    cmp        r0,#0xf
    bgt        LAB_08004598
    push       {r0,r5,r7}
    mov        r1,#0x0
    sub        r0,#0x1
    add        r0,r0,r1
    bl         Flag_Get410
    pop        {r1,r5,r7}
    bne        LAB_08004598
    ldr        r2,[r7,#0x2c]
    mov        r0,#0x1
    strb       r0,[r2,#0x10]
    strb       r1,[r2,#0x12]
    mov        r0,#0x10
    strb       r0,[r5,#0x0]
    mov        r0,#0x4
    cmp        r1,#0xf
    bne        LAB_0800458e
    mov        r0,#0x2
LAB_0800458e:
    push       {r5}
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
LAB_08004598:
    pop        {pc}


_ts World_HandleRandomEncounter
    push       {lr}
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x8
    bne        LAB_0800460c
    bl         dummy_187a0
    bne        LAB_0800460c
    mov        r0,#0x2
    bl         Flag_Get400
    bne        LAB_0800460c
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    ldrb       r1,[r0,#0x10]
    cmp        r1,#0x0
    bne        LAB_0800460c
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_0800460c
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_0800460c
    bl         Scene_GetActiveScene
    bne        LAB_0800460c
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_0800460c
    bl         Battle_IsRandomEncounter
    tst        r0,r0
    beq        LAB_0800460c
    bl         World_GetBackgroundId
    mov        r2,#0x0
    mov        r1,#0x0
    mov        r3,#0x1
    mov        r4,#0x1
    mov        r6,#0x0
    bl         World_SetBattleParams
    push       {r5}
    mov        r0,#0x2
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    bl         Sound_StopAllMusic
    mov        r0,#0xc7
    bl         Sound_PlaySongImmediate
LAB_0800460c:
    pop        {pc}


_ts World_SetBattleParams
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    strb       r0,[r5,#0xb]
    strb       r1,[r5,#0xf]
    tst        r2,r2
    bne        LAB_08004622
    ldr        r2,PTR_gFolder_08004670
    mov        r3,#0x1
LAB_08004622:
    str        r2,[r5,#0x30]
    strb       r3,[r5,#0x11]
    mov        r0,#0xc
    strb       r0,[r5,#0x0]
    push       {r7}
    mov        r0,#0x8
    tst        r6,r6
    beq        LAB_08004638
    bl         Flag_Set400
    b          LAB_0800463c
LAB_08004638:
    bl         Flag_Clear400
LAB_0800463c:
    pop        {r7}
    mov        r0,#0x1
    tst        r4,r0
    beq        LAB_08004656
    ldr        r7,[r5,#0x28]
    ldr        r0,[r7,#0x24]
    str        r0,[r5,#0x38]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x3c]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x40]
    ldrb       r0,[r7,#0x10]
    str        r0,[r5,#0x44]
LAB_08004656:
    mov        r0,#0x80
    tst        r4,r0
    beq        LAB_0800466a
    mov        r0,#0x0
    str        r0,[r5,#0x34]
    mov        r0,#0x1f
    push       {r5}
    bl         Entity_FreeAllMultiple
    pop        {r5}
LAB_0800466a:
    pop        {pc}
.align 2, 0
    .word folderSrcInitialFolder
PTR_gFolder_08004670:
    .word gFolder


_ts World_GetBackgroundId
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldrb       r0,[r5,#0x4]
    cmp        r0,#0x80
    bmi        LAB_08004680
    sub        r0,#0x80
LAB_08004680:
    ldr        r7,PTR_BackgroundId_ARRAY_ARRAY_080047a0
    lsl        r0,r0,#0x4
    ldrb       r1,[r5,#0x5]
    add        r0,r0,r1
    ldrb       r0,[r7,r0]
    mov        pc,lr
BackgroundId_ARRAY_ARRAY_0800468c:

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan
.byte BG_FireMan

.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan
.byte BG_IceMan

.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan
.byte BG_ColorMan

.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan
.byte BG_ElecMan

.byte BG_FireMan
.byte BG_NumberMan
.byte BG_IceMan
.byte BG_ColorMan
.byte BG_ElecMan
.byte BG_WWW
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_LanHp
.byte BG_MaylHp
.byte BG_YaiHp
.byte BG_DexHp
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid

.byte BG_HikariHp
.byte BG_SalHp
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid

.byte BG_MiyuHp
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid

.byte BG_MasaHp
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid
.byte BG_Invalid

.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic
.byte BG_Generic

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan
.byte BG_NumberMan

.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet
.byte BG_Internet

    .word BackgroundId_ARRAY_ARRAY_0800468c
PTR_BackgroundId_ARRAY_ARRAY_080047a0:
    .word BackgroundId_ARRAY_ARRAY_0800468c


_ts World_ChangeMap
    push       {lr}
    push       {r0}
    mov        r5,r10
    ldr        r5,[r5,#0x8]
    ldr        r0,[r5,#0x24]
    add        r0,#0x1
    str        r0,[r5,#0x24]
    mov        r0,#0x0
    str        r0,[r5,#0x34]
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    mov        r0,#0x2
    bl         Flag_Clear400
    mov        r5,r10
    ldr        r1,[r5,#0x2c]
    ldr        r0,[r1,#0x14]
    mov        r2,#0x10
    ldrb       r3,[r1,#0x12]
    cmp        r3,#0xf
    beq        LAB_080047d8
    sub        r3,#0x1
    mul        r3,r2
    add        r0,r0,r3
    b          LAB_080047da
LAB_080047d8:
    ldr        r0,PTR_MapEntrance_0800491c
LAB_080047da:
    bl         memcpy_32
    mov        r0,#0x3
    bl         Video_SetBgControl
    mov        r5,r10
    ldr        r0,[r5,#0x10]
    ldr        r1,DAT_08004afc
    strh       r1,[r0,#0x0]
    ldr        r7,[r5,#0x2c]
    ldr        r5,[r5,#0x8]
    ldrb       r1,[r7,#0x0]
    ldrb       r2,[r5,#0x4]
    mov        r3,#0x80
    add        r4,r1,#0x0
    eor        r4,r2
    tst        r4,r3
    beq        LAB_08004826
    tst        r1,r3
    bne        LAB_08004806
    mov        r6,#0x5c
    b          LAB_08004808
LAB_08004806:
    mov        r6,#0x48
LAB_08004808:
    ldr        r0,[r5,#0x28]
    ldr        r1,[r0,#0x24]
    ldr        r2,[r0,#0x28]
    ldr        r3,[r0,#0x2c]
    ldrb       r4,[r0,#0x10]
    add        r6,r6,r5
    str        r1,[r6,#0x0]
    str        r2,[r6,#0x4]
    str        r3,[r6,#0x8]
    str        r4,[r6,#0xc]
    ldrb       r0,[r5,#0x4]
    ldrb       r1,[r5,#0x5]
    lsl        r1,r1,#0x8
    orr        r1,r0
    str        r1,[r6,#0x10]
LAB_08004826:
    pop        {r0}
    cmp        r0,#0x1
    beq        LAB_08004840
    cmp        r0,#0x2
    beq        LAB_0800484c
    mov        r1,#0x2
    @ Jack in, map change
    strb       r1,[r7,#0x10]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    ldr        r3,[r7,#0xc]
    ldrb       r4,[r7,#0x3]
    ldrh       r6,[r7,#0x0]
    b          LAB_08004856
LAB_08004840:
    @ Jack out
    ldr        r1,[r5,#0x48]
    ldr        r2,[r5,#0x4c]
    ldr        r3,[r5,#0x50]
    ldr        r4,[r5,#0x54]
    ldr        r6,[r5,#0x58]
    b          LAB_08004856
LAB_0800484c:
    ldr        r1,[r5,#0x5c]
    ldr        r2,[r5,#0x60]
    ldr        r3,[r5,#0x64]
    ldr        r4,[r5,#0x68]
    ldr        r6,[r5,#0x6c]
LAB_08004856:
    str        r1,[r5,#0x38]
    str        r2,[r5,#0x3c]
    str        r3,[r5,#0x40]
    str        r4,[r5,#0x44]
    lsr        r7,r6,#0x8
    mov        r0,#0xff
    and        r6,r0
    ldrb       r0,[r5,#0x4]
    cmp        r0,r6
    beq        LAB_0800486e
    mov        r1,#0x0
    b          LAB_08004870
LAB_0800486e:
    mov        r1,#0x4
LAB_08004870:
    strb       r1,[r5,#0x0]
    ldrb       r1,[r5,#0x5]
    strb       r1,[r5,#0xd]
    ldrb       r1,[r5,#0x4]
    ldrb       r2,[r5,#0xc]
    strb       r1,[r5,#0xc]
    strb       r6,[r5,#0x4]
    strb       r7,[r5,#0x5]
    cmp        r1,#0x90
    bge        LAB_08004910
    push       {r5,r7}
    mov        r0,#0x11
    mov        r1,#0x8
    bl         ClearFlagRange280
    mov        r0,#0x19
    mov        r1,#0x10
    bl         ClearFlagRange280
    mov        r0,#0x67
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x71
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x77
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x7d
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x83
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x89
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x8f
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x95
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0x9b
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0xa1
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0xa7
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0xad
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0xb3
    mov        r1,#0x4
    bl         ClearFlagRange280
    mov        r0,#0xb9
    mov        r1,#0x8
    bl         ClearFlagRange280
    bl         FUN_08052528
    bl         FUN_080521cc
    pop        {r5,r7}
LAB_08004910:
    mov        r7,r10
    ldr        r7,[r7,#0x78]
    mov        r0,#0x0
    str        r0,[r7,#0x24]
    str        r0,[r7,#0x28]
    pop        {pc}
PTR_MapEntrance_0800491c:
    .word MapEntrance_08004920
MapEntrance_08004920:
    MapEntrance Map_School_Class_5A, 0, 0, 0, 0


_ts World_SetTransitionLocation
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldr        r2,[r7,#0x30]
    str        r0,[r2,#0x4]
    strb       r1,[r2,#0x3]
    mov        r0,#0x14
    strb       r0,[r5,#0x0]
    pop        {pc}


_ts FUN_08004944
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    push       {r0,r5}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    pop        {r0,r5}
    push       {r5}
    bl         InitDemo
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x10
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_08004afc
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    pop        {pc}

_ts World_CheckStartMenuOpen
    push       {lr}
    mov        r0,#0x20
    bl         StartMenu_GetState
    bne        LAB_08004a00
    ldrb       r0,[r5,#0x0]
    cmp        r0,#0x8
    bne        LAB_08004a0c
    bl         dummy_187a0
    bne        LAB_08004a0c
    mov        r0,#0x7
    bl         Flag_Get400
    bne        LAB_08004a0c
    mov        r7,r10
    ldr        r0,[r7,#0x2c]
    ldrb       r1,[r0,#0x10]
    cmp        r1,#0x0
    bne        LAB_08004a0c
    mov        r0,#0x80
    bl         StartMenu_GetState
    bne        LAB_08004a0c
    mov        r0,#0x40
    bl         StartMenu_GetState
    bne        LAB_08004a0c
    ldr        r0,[r7,#0x18]
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08004a0c
    bl         Scene_GetActiveScene
    bne        LAB_08004a0c
    mov        r0,#0x80
    bl         Text_CheckOption
    bne        LAB_08004a0c
    mov        r0,r10
    ldr        r0,[r0,#0x4]
    ldrh       r0,[r0,#0x2]
    mov        r1,#0x8
    tst        r1,r0
    beq        LAB_08004a0c
    ldr        r7,[r5,#0x28]
    ldr        r0,[r7,#0x24]
    str        r0,[r5,#0x38]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x3c]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x40]
    ldrb       r0,[r7,#0x10]
    str        r0,[r5,#0x44]
    push       {r5}
    bl         InitStartMenu
    pop        {r5}
    b          LAB_08004a08
LAB_08004a00:
    push       {r5}
    bl         InitStartMenuFromSubMenu
    pop        {r5}
LAB_08004a08:
    mov        r0,#0x18
    strb       r0,[r5,#0x0]
LAB_08004a0c:
    pop        {pc}


_ts World_StartShop
    push       {lr}
    bl         Shop_Init
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldr        r7,[r5,#0x28]
    ldr        r0,[r7,#0x24]
    str        r0,[r5,#0x38]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x3c]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x40]
    ldrb       r0,[r7,#0x10]
    str        r0,[r5,#0x44]
    mov        r1,#0x20
    strb       r1,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    pop        {pc}


_ts World_StartGameOver
    push       {lr}
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    bl         InitGameOver
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x20
    strb       r1,[r0,#0x0]
    bl         BgUpdate_Init
    bl         InitBgTask
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_08004afc
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    pop        {pc}


_ts World_StartChipTrader
    push       {lr}
    push       {r0}
    bl         GetBattleChipTotalCount
    sub        r0,#0x1e
    add        r1,r0,#0x0
    pop        {r0}
    cmp        r1,r0
    bge        LAB_08004a8a
    mov        r0,#0x1
    pop        {pc}
LAB_08004a8a:
    bl         InitChipTraderFromScript
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    ldr        r7,[r5,#0x28]
    ldr        r0,[r7,#0x24]
    str        r0,[r5,#0x38]
    ldr        r0,[r7,#0x28]
    str        r0,[r5,#0x3c]
    ldr        r0,[r7,#0x2c]
    str        r0,[r5,#0x40]
    ldrb       r0,[r7,#0x10]
    str        r0,[r5,#0x44]
    mov        r1,#0x24
    strb       r1,[r5,#0x0]
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x10
    bl         Fade_Request
    pop        {r5}
    mov        r0,#0x0
    pop        {pc}


_ts World_StartCredits
    push       {lr}
    mov        r7,r10
    ldr        r5,[r7,#0x8]
    push       {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x34]
    mov        r0,#0x1f
    bl         Entity_FreeAllMultiple
    bl         InitCredits
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x0]
    mov        r1,#0x28
    strb       r1,[r0,#0x0]
    push       {r5}
    bl         BgUpdate_Init
    bl         InitBgTask
    pop        {r5}
    mov        r7,r10
    ldr        r0,[r7,#0x10]
    ldr        r1,DAT_08004afc
    strh       r1,[r0,#0x0]
    mov        r1,#0x0
    strh       r1,[r0,#0x10]
    strh       r1,[r0,#0x12]
    strh       r1,[r0,#0x14]
    strh       r1,[r0,#0x16]
    strh       r1,[r0,#0x18]
    strh       r1,[r0,#0x1a]
    pop        {pc}
DAT_08004afc:
    .word 0x40
