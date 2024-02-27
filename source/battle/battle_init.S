#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set Attack_Cube_Create_MP, 0x80738b8
    .set Sio_SetReady, 0x809bdf0
    .set BgTask_0803ed68, 0x803ed68
    .set BgTask_0803f138, 0x803f138
    .set Status_GetLevel, 0x801bf58
    .set BgTask_08042958, 0x8042958
    .set BgTask_080442e8, 0x80442e8
    .set BgTask_080475a4, 0x80475a4
    .set BgTask_08049ff8, 0x8049ff8
    .set PTR_DAT_0804ccb0, 0x804ccb0
    .set BgTask_08051780, 0x8051780
    .set BgTask_08051820, 0x8051820
    .set PTR_DAT_0804f728, 0x804f728
    .set DAT_0804eda8, 0x804eda8
    .set PTR_DAT_0804edd8, 0x804edd8
    .set PTR_DAT_0804ee18, 0x804ee18
    .set PTR_DAT_0804ee48, 0x804ee48
    .set PTR_DAT_0804f728, 0x804f728
    .set PTR_DAT_0804f7b8, 0x804f7b8
    .set PTR_DAT_0804fd64, 0x804fd64
    .set PTR_DAT_08050060, 0x8050060
    .set PTR_eBgPalette0_0804cd68, 0x804cd68

_ts Battle_InitBackground
    push       {r5,lr}
    push       {r5}
    mov        r0,#0xf0
    ldrb       r1,[r5,#0xf]
    bl         BGDM_Init
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    mov        r1,#0x0
    mov        r2,#0x0
    mov        r3,#0xf0
    ldrb       r4,[r5,#0xf]
    bl         Camera_Init
    pop        {r5}
    push       {r5}
    mov        r0,#0x0
    bl         Camera_SetEnabled
    bl         BGDM_Load
    bl         Battle_SetupBackground
    pop        {r5}
    ldrb       r0,[r5,#0xf]
    mov        r1,#0xc
    mul        r0,r1
    ldr        r7,=listBattleFieldTiles
    add        r7,r7,r0
    ldr        r0,[r7,#0x0]
    ldr        r1,[r7,#0x4]
    ldr        r2,[r7,#0x8]
    bl         Dma_TransferListAdd
    pop        {r5,pc}

    .align 2, 0

listBattleFieldTiles:
    @ 0x0
    .word 0x869849C
    .word 0x6004020
    .word 0x118
    @ 0x1
    .word 0x8698D3C
    .word 0x6004020
    .word 0x1D0
    @ 0x2
    .word 0x869975C
    .word 0x6004020
    .word 0xF0
    @ 0x3
    .word 0x8699DFC
    .word 0x6004020
    .word 0x120
    @ 0x4
    .word 0x869A55C
    .word 0x6004020
    .word 0x120
    @ 0x5
    .word 0x869ACBC
    .word 0x6004020
    .word 0x120
    @ 0x6
    .word 0x869B41C
    .word 0x6004020
    .word 0x100
    @ 0x7
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0x8
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0x9
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xA
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xB
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xC
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xD
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xE
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0xF
    .word 0x869BAFC
    .word 0x6004020
    .word 0x120
    @ 0x10
    .word 0x869ACBC
    .word 0x6004020
    .word 0x120

    .pool


_ts Battle_InitPlayer
    push       {lr}
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    bge        LAB_0800506e
    mov        r0,#0x2
    mov        r1,#0x2
    mov        r2,#0x0
    bl         Battle_AddPlayerEntity
    ldrb       r0,[r5,#0x4]
    add        r0,#0x1
    strb       r0,[r5,#0x4]
    bl         Battle_InitEnemyEntityList
    b          LAB_080050e4
LAB_0800506e:
    bl         Rng_Init
    ldr        r6,PTR_listMpStartPositions_080050f0
    ldrb       r1,[r5,#0xd]
    lsl        r1,r1,#0x2
    add        r6,r6,r1
    mov        r2,#0x0
    ldrb       r0,[r5,#0x1a]
    tst        r0,r0
    beq        LAB_08005084
    mov        r2,#0x1
LAB_08005084:
    push       {r2}
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    bl         Battle_AddPlayerEntity
    pop        {r2}
    mov        r1,#0x1
    eor        r2,r1
    push       {r2}
    ldrb       r0,[r6,#0x2]
    ldrb       r1,[r6,#0x3]
    bl         Battle_AddPlayerEntity
    pop        {r2}
    mov        r0,#0x1
    strb       r0,[r5,#0x4]
    strb       r0,[r5,#0x5]
    ldr        r6,PTR_listMPBattleLayouts_08005124
    ldrb       r0,[r5,#0xd]
    lsl        r0,r0,#0x2
    ldrb       r1,[r5,#0x1b]
    ldr        r6,[r6,r0]
LAB_080050b0:
    ldrb       r0,[r6,#0x0]
    cmp        r0,#0xff
    beq        LAB_080050e4
    push       {r6}
    mov        r0,#0x0
    ldrb       r1,[r6,#0x0]
    ldrb       r2,[r6,#0x1]
    ldrb       r3,[r6,#0x3]
    tst        r3,r3
    bne        LAB_080050c8
    mov        r3,#0xfa
    add        r3,r3,r3
LAB_080050c8:
    ldrb       r4,[r6,#0x2]
    mov        r6,#0xc8
    mov        r7,#0x0
    bl         Attack_Cube_Create_MP
    tst        r7,r7
    beq        LAB_080050de
    ldrb       r0,[r7,#0x0]
    mov        r1,#0x4
    orr        r0,r1
    strb       r0,[r7,#0x0]
LAB_080050de:
    pop        {r6}
    add        r6,#0x4
    b          LAB_080050b0
LAB_080050e4:
    ldrb       r0,[r5,#0x4]
    strh       r0,[r5,#0x22]
    ldrb       r0,[r5,#0x5]
    strh       r0,[r5,#0x24]
    pop        {pc}

    .align 2, 0

PTR_listMpStartPositions_080050f0:
    .word listMpStartPositions
listMpStartPositions:
    @ 0x0
    cell_pos 1, 2
    cell_pos 6, 2
    @ 0x1
    cell_pos 1, 2
    cell_pos 6, 2
    @ 0x2
    cell_pos 2, 2
    cell_pos 5, 2
    @ 0x3
    cell_pos 2, 2
    cell_pos 5, 2
    @ 0x4
    cell_pos 2, 3
    cell_pos 5, 1
    @ 0x5
    cell_pos 2, 3
    cell_pos 5, 1
    @ 0x6
    cell_pos 1, 2
    cell_pos 6, 2
    @ 0x7
    cell_pos 1, 2
    cell_pos 6, 2
    @ 0x8
    cell_pos 2, 3
    cell_pos 5, 1
    @ 0x9
    cell_pos 2, 1
    cell_pos 5, 3
    @ 0xA
    cell_pos 2, 2
    cell_pos 5, 2
    @ 0xB
    cell_pos 2, 2
    cell_pos 5, 2

PTR_listMPBattleLayouts_08005124:
    .word listMPBattleLayouts
listMPBattleLayouts:
    .word AttackParams_0
    .word AttackParams_1
    .word AttackParams_2
    .word AttackParams_3
    .word AttackParams_4
    .word AttackParams_5
    .word AttackParams_6
    .word AttackParams_7
    .word AttackParams_8
    .word AttackParams_9
    .word AttackParams_10
    .word AttackParams_11
AttackParams_0:
    .byte 3, 2, 4, 1
    .byte 4, 2, 4, 1
    .byte 4, 1, 5, 0
    .byte 3, 3, 5, 0
    .byte 0xFF
AttackParams_1:
    .byte 4, 2, 4, 1
    .byte 3, 2, 4, 1
    .byte 3, 1, 5, 0
    .byte 4, 3, 5, 0
    .byte 0xFF
AttackParams_2:
    .byte 3, 2, 5, 0
    .byte 4, 2, 5, 0
    .byte 0xFF
AttackParams_3:
    .byte 4, 2, 5, 0
    .byte 3, 2, 5, 0
    .byte 0xFF
AttackParams_4:
    .byte 3, 2, 4, 1
    .byte 4, 2, 4, 1
    .byte 2, 2, 5, 0
    .byte 5, 2, 5, 0
    .byte 0xFF
AttackParams_5:
    .byte 4, 2, 4, 1
    .byte 3, 2, 4, 1
    .byte 5, 2, 5, 0
    .byte 2, 2, 5, 0
    .byte 0xFF
AttackParams_6:
    .byte 2, 2, 5, 0
    .byte 5, 2, 5, 0
    .byte 0xFF
AttackParams_7:
    .byte 5, 2, 5, 0
    .byte 2, 2, 5, 0
    .byte 0xFF
AttackParams_8:
    .byte 2, 1, 5, 0
    .byte 5, 3, 5, 0
    .byte 0xFF
AttackParams_9:
    .byte 5, 1, 5, 0
    .byte 2, 3, 5, 0
    .byte 0xFF
AttackParams_10:
    .byte 3, 1, 4, 1
    .byte 4, 2, 4, 1
    .byte 4, 1, 5, 0
    .byte 3, 2, 5, 0
    .byte 0xFF
AttackParams_11:
    .byte 4, 1, 4, 1
    .byte 3, 2, 4, 1
    .byte 3, 1, 5, 0
    .byte 4, 2, 5, 0
    .byte 0xFF


_ts Battle_Init
    push       {r5,lr}
    mov        r5,r10
    ldr        r5,[r5,#0xc]
    add        r0,r5,#0x0
    mov        r1,#0x84
    bl         memset0_32
    mov        r0,#0x78
    add        r0,r0,r5
    mov        r1,#0x6
    mov        r2,#0xff
    bl         memset
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldrb       r0,[r6,#0xb]
    strb       r0,[r5,#0xf]
    mov        r0,#0x1
    strb       r0,[r5,#0xc]
    strb       r0,[r5,#0x17]
    mov        r0,#0x5
    strb       r0,[r5,#0x10]
    mov        r0,#0x0
    sub        r0,#0x1
    str        r0,[r5,#0x64]
    bl         Sio_SetReady
    mov        r7,r10
    ldr        r7,[r7,#0x50]
    ldrh       r0,[r7,#0x0]
    mov        r1,#0xc
    bl         SWI_Div
    strb       r1,[r5,#0xd]
    mov        r0,#0x4
    strb       r0,[r5,#0x9]
    mov        r0,#0x20
    strb       r0,[r5,#0x12]
    mov        r7,r10
    ldr        r7,[r7,#0x20]
    mov        r0,#0x0
    strh       r0,[r7,#0x1e]
    strh       r0,[r7,#0x20]
    strh       r0,[r7,#0x22]
    add        r7,#0x70
    strh       r0,[r7,#0x1e]
    strh       r0,[r7,#0x20]
    strh       r0,[r7,#0x22]
    ldr        r0,=gPanelStatuses
    mov        r1,#0x28
    lsl        r1,r1,#0x4
    bl         memset0_16
    mov        r0,#0x32
    bl         Flag_Clear420
    mov        r0,#0x0
    ldr        r7,=gIsObjectXFlipped
    strb       r0,[r7,#0x0]
    bl         BattleSpriteQueue_Clear
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    mov        r0,#0x0
    strb       r0,[r7,#0x7]
    bl         FieldObject_Init
    pop        {r5,pc}

    .pool


_ts Battle_InitEnemyEntityList
    push       {lr}
    push       {r5}
    ldr        r0,[r5,#0x74]
    bl         InitializeEnemyEntityList
    pop        {r5}
    pop        {pc}


_nt InitializeEnemyEntityList
    push       {lr}
    add        r6,r0,#0x0
    mov        r3,#0x0
LAB_08005298:
    ldrb       r0,[r6,#0x0]
    cmp        r0,#0xff
    beq        LAB_08005306
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r1,#0x64
    add        r1,r1,r3
    strb       r0,[r7,r1]
    push       {r3}
    bl         Enemy_GetEnemyDetail
    add        r7,r0,#0x0
    push       {r7}
    ldrb       r0,[r6,#0x1]
    ldrb       r1,[r6,#0x2]
    bl         Battle_CellCoordsToSprite
    mov        r3,#0x0
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    pop        {r7}
    ldrb       r0,[r7,#0x4]
    ldr        r4,[r7,#0x8]
    push       {r6}
    bl         Actor_Alloc
    pop        {r6}
    pop        {r3}
    tst        r5,r5
    beq        LAB_08005302
    ldrb       r0,[r6,#0x0]
    strb       r0,[r5,#0x13]
    bl         Enemy_GetEnemyDetail
    ldrb       r1,[r0,#0x2]
    strb       r1,[r5,#0x1a]
    ldrb       r0,[r6,#0x1]
    ldrb       r1,[r6,#0x2]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    mov        r0,#0x1
    strb       r0,[r5,#0x16]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    lsl        r0,r3,#0x2
    mov        r1,#0x54
    add        r0,r0,r1
    str        r5,[r7,r0]
    strb       r3,[r5,#0x12]
    add        r3,#0x1
    ldrb       r0,[r7,#0x5]
    add        r0,#0x1
    strb       r0,[r7,#0x5]
LAB_08005302:
    add        r6,#0x4
    b          LAB_08005298
LAB_08005306:
    strb       r3,[r7,#0xb]
    pop        {pc}


_nt Battle_SetupBackground
    push       {lr}
    ldr        r7,PTR_PTR_BgAnimate_NumberMan_08005364
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldrb       r0,[r6,#0xb]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0

PTR_BgAnimate_NumberMan_08005320:
    .word BgAnimate_NumberMan
    .word BgAnimate_FireMan
    .word BgAnimate_IceMan
    .word BgAnimate_ColorMan
    .word BgAnimate_ElecMan
    .word BgAnimate_WWW
    .word BgAnimate_Internet
    .word BgAnimate_Generic
    .word BgAnimate_LanHP
    .word BgAnimate_MaylHP
    .word BgAnimate_YaiHP
    .word BgAnimate_DexHP
    .word BgAnimate_HikariHP
    .word BgAnimate_SalHP
    .word BgAnimate_MiyuHP
    .word BgAnimate_MasaHP
    .word BgAnimate_LifeVirus
PTR_PTR_BgAnimate_NumberMan_08005364:
    .word PTR_BgAnimate_NumberMan_08005320


_ts dummy_5368
    mov        pc,lr


_nt BgAnimate_NumberMan
    push       {lr}
    ldr        r0,PTR_BgTask_0800537c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_08005380
    bl         BgTask_AddNew
    pop        {pc}

    .align 2, 0

PTR_BgTask_0800537c:
    .word BgTask_0803ed68
PTR_BgTask_08005380:
    .word BgTask_0803f138


_nt BgAnimate_FireMan
    push       {lr}
    ldr        r0,PTR_BgTask_0800577c
    bl         BgTask_AddNew
    pop        {pc}


_nt BgAnimate_IceMan
    push       {lr}
    mov        r7,r10
    ldr        r6,[r7,#0x8]
    ldrb       r7,[r6,#0x6]
    cmp        r7,#0x30
    bge        LAB_080053a2
LAB_0800539a:
    ldr        r0,PTR_BgTask_08005780
    bl         BgTask_AddNew
    b          LAB_080053b4
LAB_080053a2:
    ldrb       r7,[r6,#0x4]
    cmp        r7,#0x85
    beq        LAB_0800539a
    ldr        r0,PTR_BgTask_08005784
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_08005788
    bl         BgTask_AddNew
LAB_080053b4:
    ldr        r0,PTR_dummy_1cb8_0800578c
    ldr        r1,PTR_BgUpdate_MoveUp_08005790
    ldr        r2,PTR_dummy_6928_08005794
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_ColorMan
    push       {lr}
    ldr        r0,PTR_BgTask_08005798
    bl         BgTask_AddNew
    pop        {pc}


_nt BgAnimate_ElecMan
    push       {lr}
    ldr        r0,PTR_BgTask_0800579c
    bl         BgTask_AddNew
    pop        {pc}


_nt BgAnimate_WWW
    push       {lr}
    ldr        r0,PTR_PTR_DAT_080057a0

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057a4
    ldr        r1,PTR_BgUpdate_MoveLeft_080057a8
    ldr        r2,PTR_dummy_6928_080057ac
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_Internet
    push       {lr}
    ldr        r0,PTR_BgTask_080057b0
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_080057b4
    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057b8
    ldr        r1,PTR_BgUpdate_MoveUpLeft_080057bc
    ldr        r2,PTR_dummy_6928_080057c0
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_Generic
    push       {lr}
    ldr        r0,PTR_PTR_DAT_080057c4

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057c8
    ldr        r1,PTR_BgUpdate_MoveUpLeft_080057cc
    ldr        r2,PTR_dummy_6928_080057d0
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_LanHP
    push       {lr}
    ldr        r0,PTR_DAT_080057d4

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057d8
    ldr        r1,PTR_BgUpdate_MoveUpLeft_080057dc
    ldr        r2,PTR_dummy_6928_080057e0
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_MaylHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_080057e4

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057e8
    ldr        r1,PTR_BgUpdate_MoveUpLeft_080057ec
    ldr        r2,PTR_dummy_6928_080057f0
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_YaiHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_080057f4

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_080057f8
    ldr        r1,PTR_BgUpdate_MoveUpLeft_080057fc
    ldr        r2,PTR_dummy_6928_08005800
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_DexHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_08005804

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005808
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0800580c
    ldr        r2,PTR_dummy_6928_08005810
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_HikariHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_08005814

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005818
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0800581c
    ldr        r2,PTR_dummy_6928_08005820
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_SalHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_08005824

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005828
    ldr        r1,PTR_BgUpdate_MoveLeft_0800582c
    ldr        r2,PTR_dummy_6928_08005830
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_MiyuHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_08005834

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005838
    ldr        r1,PTR_BgUpdate_MoveUpLeft_0800583c
    ldr        r2,PTR_dummy_6928_08005840
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_MasaHP
    push       {lr}
    ldr        r0,PTR_PTR_DAT_08005844

    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005848
    ldr        r1,PTR_BgUpdate_MoveRight_0800584c
    ldr        r2,PTR_dummy_6928_08005850
    bl         BgUpdate_Set
    pop        {pc}


_nt BgAnimate_LifeVirus
    push       {lr}
    ldr        r0,PTR_PTR_eBgPalette0_08005854
    bl         BgTask_AddNew
    ldr        r0,PTR_dummy_1cb8_08005858
    ldr        r1,PTR_BgUpdate_MoveLeftSlow_0800585c
    ldr        r2,PTR_dummy_6928_08005860
    bl         BgUpdate_Set
    pop        {pc}


_nt Battle_AddPlayerEntity
    push       {r5,r6,lr}
    push       {r0,r1,r2}
    mov        r0,#0x0
    bl         Actor_Alloc
    pop        {r0,r1,r2}
    tst        r5,r5
    beq        LAB_08005502
    strb       r2,[r5,#0x16]
    mov        r3,#0x0
    strb       r3,[r5,#0x13]
    strb       r0,[r5,#0x18]
    strb       r1,[r5,#0x19]
    bl         Battle_CellCoordsToSprite
    str        r0,[r5,#0x28]
    str        r1,[r5,#0x2c]
    mov        r2,#0x0
    str        r2,[r5,#0x30]
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    mov        r0,#0x40
    ldrb       r2,[r5,#0x16]
    tst        r2,r2
    beq        LAB_08005500
    str        r5,[r7,#0x54]
    mov        r0,#0x44
LAB_08005500:
    str        r5,[r7,r0]
LAB_08005502:
    pop        {r5,r6,pc}


_ts Battle_InitEnemyList
    push       { lr }
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldr        r0,[r6,#0x2c]
    mov        r1,#0x0
    str        r1,[r6,#0x2c]
    tst        r0,r0
    bne        LAB_0800551c
    ldrb       r0,[r6,#0x4]
    ldrb       r1,[r6,#0x5]
    bl         Battle_GetRandomAreaEnemySpawnList
LAB_0800551c:
    str        r0,[r5,#0x74]
    pop        { pc }

_ts Battle_GetRandomAreaEnemySpawnList
    push       { lr }
    push       { r1 }
    ldr        r7,PTR_EncounterData_List
    add        r2,r0,#0x0
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08005532
    add        r7,#0x4
    sub        r0,#0x80
LAB_08005532:
    ldr        r7,[r7,#0x0]
    pop        { r1 }
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    add        r0,r1,#0x0
    cmp        r2,#0x90
    bne        LAB_08005548
    push       { r7 }
    bl         Battle_GetInternetSpawnListIndex
    pop        { r7 }
LAB_08005548:
    lsl        r0,r0,#0x2
    ldr        r0,[r7,r0]
    mov        r8,r0
    bl         Rng_RandomInt
    mov        r7,r8
    mov        r1,#0xff
    and        r0,r1
LAB_08005558:
    ldrb       r1,[r7,#0x0]
    sub        r0,r0,r1
    bls        LAB_08005562
    add        r7,#0x8
    b          LAB_08005558
LAB_08005562:
    ldr        r0,[r7,#0x4]
    ldrb       r1,[r7,#0x1]
    tst        r1,r1
    beq        LAB_0800557e
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldrb       r1,[r6,#0xf]
    mov        r2,#0x8
    cmp        r1,r2
    bge        LAB_0800557e
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    mov        r1,#0x5
    strb       r1,[r6,#0xf]
LAB_0800557e:
    pop        { pc }

EncounterData_Offline:
    .word EncounterData_School_Comp
    .word EncounterData_School_Comp
    .word EncounterData_School_Comp
    .word EncounterData_School_Comp
    .word EncounterData_School_Comp
    .word EncounterData_School_Comp

EncounterData_Online:
    .word EncounterData_School_Comp
    .word EncounterData_Oven_Comp
    .word EncounterData_Waterworks_Comp
    .word EncounterData_Traffic_Light_Comp
    .word EncounterData_Power_Plant_Comp
    .word EncounterData_WWW_Comp
    .word EncounterData_Internet
    .word EncounterData_Internet
    .word EncounterData_ACDC_HP
    .word EncounterData_Govt_Complex_HP
    .word EncounterData_DenTown_HP
    .word EncounterData_SciLab_HP
    .word EncounterData_Other_Comp
    .word EncounterData_Internet
    .word EncounterData_Internet
    .word EncounterData_Internet
    .word EncounterData_Internet

EncounterData_List:
    .word EncounterData_Offline
    .word EncounterData_Online

PTR_EncounterData_List:
    .word EncounterData_List


_ts Battle_GetInternetSpawnListIndex
    push       {lr}
    lsl        r1,r0,#0x2
    ldr        r7,PTR_PTR_EncounterCheck_Internet1
    ldr        r7,[r7,r1]
    mov        lr,pc
    bx         r7
    pop        {pc}

    .align 2, 0
PTR_PTR_EncounterCheck_Internet1:
    .word PTR_EncounterCheck_Internet1
PTR_EncounterCheck_Internet1:
    .word EncounterCheck_Internet1
    .word dummy_5748
    .word EncounterCheck_Internet3
    .word dummy_5748
    .word dummy_5748
    .word EncounterCheck_Undernet2
    .word dummy_5748
    .word dummy_5748
    .word EncounterCheck_Undernet5
    .word dummy_5748
    .word EncounterCheck_Undernet7
    .word EncounterCheck_Undernet8
    .word dummy_5748
    .word EncounterCheck_Undernet10
    .word EncounterCheck_Undernet11
    .word EncounterCheck_Undernet12


_ts EncounterCheck_Internet1
    push       {lr}
    push       {r0}
    mov        r0,#0x5c
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_0800564e
    add        r0,#0x10
LAB_0800564e:
    pop        {pc}


_ts EncounterCheck_Internet3
    push       {lr}
    push       {r0}
    mov        r0,#0x55
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_08005662
    add        r0,#0x10
LAB_08005662:
    pop        {pc}


_ts EncounterCheck_Undernet2
    push       {lr}
    push       {r0}
    mov        r0,#0x5e
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_08005676
    add        r0,#0x10
LAB_08005676:
    pop        {pc}


_ts EncounterCheck_Undernet5
    push       {lr}
    push       {r0}
    mov        r0,#0x5d
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_0800568a
    add        r0,#0x10
LAB_0800568a:
    pop        {pc}


_ts EncounterCheck_Undernet7
    push       {lr}
    push       {r0}
    mov        r0,#0x5f
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_0800569e
    add        r0,#0x10
LAB_0800569e:
    pop        {pc}


_ts EncounterCheck_Undernet8
    push       {lr}
    push       {r0}
    mov        r0,#0x12
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_080056cc
    push       {r0}
    mov        r0,#0x5
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_080056cc
    push       {r0}
    bl         Status_GetLevel
    cmp        r0,#0x46
    pop        {r0}
    blt        LAB_080056cc
    add        r0,#0x10
LAB_080056cc:
    pop        {pc}


_nt EncounterCheck_Undernet10
    push       {lr}
    push       {r0}
    mov        r0,#0x60
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_080056e0
    add        r0,#0x10
LAB_080056e0:
    pop        {pc}


_nt EncounterCheck_Undernet11
    push       {lr}
    push       {r0}
    mov        r0,#0x8f
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_0800571a
    push       {r0}
    bl         EncounterCheck_GetLibraryCount
    cmp        r0,#0x8c
    pop        {r0}
    blt        LAB_0800571a
    push       {r0}
    mov        r0,#0x5
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_0800571a
    push       {r0}
    bl         Status_GetLevel
    cmp        r0,#0x46
    pop        {r0}
    blt        LAB_0800571a
    add        r0,#0x10
LAB_0800571a:
    pop        {pc}


_ts EncounterCheck_Undernet12
    push       {lr}
    push       {r0}
    bl         EncounterCheck_GetLibraryCount
    cmp        r0,#0xae
    pop        {r0}
    blt        LAB_08005746
    push       {r0}
    mov        r0,#0x5
    bl         Flag_GetBase
    tst        r0,r0
    pop        {r0}
    beq        LAB_08005746
    push       {r0}
    bl         Status_GetLevel
    cmp        r0,#0x46
    pop        {r0}
    blt        LAB_08005746
    add        r0,#0x10
LAB_08005746:
    pop        {pc}


_ts dummy_5748
    mov        pc,lr

_nt EncounterCheck_GetLibraryCount
    push       {lr}
    mov        r0,#0x1
    mov        r1,#0x0
LAB_08005750:
    push       {r0,r1}
    bl         Flag_GetLibrary
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_0800575e
    add        r1,#0x1
LAB_0800575e:
    add        r0,#0x1
    cmp        r0,#0xc7
    ble        LAB_08005750
    add        r0,r1,#0x0
    pop        {pc}


_ts DisableScreenDim
    push       {lr}
    mov        r0,#0x0
    mov        r6,r10
    ldr        r6,[r6,#0xc]
    strb       r0,[r6,#0x18]
    mov        r7,r10
    ldr        r7,[r7,#0x54]
    strb       r0,[r7,#0x7]
    pop        {pc}
    
    .align 2, 0

PTR_BgTask_0800577c:
    .word BgTask_08042958
PTR_BgTask_08005780:
    .word BgTask_08044108
PTR_BgTask_08005784:
    .word BgTask_080442e8
PTR_BgTask_08005788:
    .word BgTask_08044330
PTR_dummy_1cb8_0800578c:
    .word dummy_1cb8
PTR_BgUpdate_MoveUp_08005790:
    .word BgUpdate_MoveUp
PTR_dummy_6928_08005794:
    .word dummy_6928_far
PTR_BgTask_08005798:
    .word BgTask_080475a4
PTR_BgTask_0800579c:
    .word BgTask_08049ff8
PTR_PTR_DAT_080057a0:
    .word PTR_DAT_0804ccb0
PTR_dummy_1cb8_080057a4:
    .word dummy_1cb8
PTR_BgUpdate_MoveLeft_080057a8:
    .word BgUpdate_MoveLeft
PTR_dummy_6928_080057ac:
    .word dummy_6928_far
PTR_BgTask_080057b0:
    .word BgTask_08051780
PTR_BgTask_080057b4:
    .word BgTask_08051820
PTR_dummy_1cb8_080057b8:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_080057bc:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_080057c0:
    .word dummy_6928_far
PTR_PTR_DAT_080057c4:
    .word PTR_DAT_0804f728
PTR_dummy_1cb8_080057c8:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_080057cc:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_080057d0:
    .word dummy_6928_far
PTR_DAT_080057d4:
    .word DAT_0804eda8
PTR_dummy_1cb8_080057d8:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_080057dc:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_080057e0:
    .word dummy_6928_far
PTR_PTR_DAT_080057e4:
    .word PTR_DAT_0804edd8
PTR_dummy_1cb8_080057e8:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_080057ec:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_080057f0:
    .word dummy_6928_far
PTR_PTR_DAT_080057f4:
    .word PTR_DAT_0804ee18
PTR_dummy_1cb8_080057f8:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_080057fc:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_08005800:
    .word dummy_6928_far
PTR_PTR_DAT_08005804:
    .word PTR_DAT_0804ee48
PTR_dummy_1cb8_08005808:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_0800580c:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_08005810:
    .word dummy_6928_far
PTR_PTR_DAT_08005814:
    .word PTR_DAT_0804f728
PTR_dummy_1cb8_08005818:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_0800581c:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_08005820:
    .word dummy_6928_far
PTR_PTR_DAT_08005824:
    .word PTR_DAT_0804f7b8
PTR_dummy_1cb8_08005828:
    .word dummy_1cb8
PTR_BgUpdate_MoveLeft_0800582c:
    .word BgUpdate_MoveLeft
PTR_dummy_6928_08005830:
    .word dummy_6928_far
PTR_PTR_DAT_08005834:
    .word PTR_DAT_0804fd64
PTR_dummy_1cb8_08005838:
    .word dummy_1cb8
PTR_BgUpdate_MoveUpLeft_0800583c:
    .word BgUpdate_MoveUpLeft
PTR_dummy_6928_08005840:
    .word dummy_6928_far
PTR_PTR_DAT_08005844:
    .word PTR_DAT_08050060
PTR_dummy_1cb8_08005848:
    .word dummy_1cb8
PTR_BgUpdate_MoveRight_0800584c:
    .word BgUpdate_MoveRight
PTR_dummy_6928_08005850:
    .word dummy_6928_far
PTR_PTR_eBgPalette0_08005854:
    .word PTR_eBgPalette0_0804cd68
PTR_dummy_1cb8_08005858:
    .word dummy_1cb8
PTR_BgUpdate_MoveLeftSlow_0800585c:
    .word BgUpdate_MoveLeftSlow
PTR_dummy_6928_08005860:
    .word dummy_6928_far

    .end
