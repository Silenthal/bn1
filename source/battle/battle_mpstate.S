#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts BattleMP_Main
    push       {lr}
    sub        sp,#0x8
    ldr        r0,PTR_PlayerMpState_080078c4
    ldr        r1,PTR_PlayerMpState_080078c0
    mov        r2,#0x10
    bl         memcpy_32
    mov        r0,#0xff
    strb       r0,[r5,#0x1e]
    ldr        r0,PTR_PlayerMpState_080078c0
    ldr        r1,PTR_gMpStateRecv_080078c8
    mov        r2,r10
    push       {r2,r5}
    bl         Sio_TransmitData
    pop        {r2,r5}
    mov        r10,r2
    add        r3,r0,#0x0
    mov        r1,#0xf
    and        r3,r1
    strb       r3,[r5,#0x1d]
    mov        r1,#0x80
    and        r0,r1
    cmp        r0,#0x80
    beq        LAB_080078a2
    push       {r1,r3}
    bl         SIO_GetMultiplayerId
    pop        {r1,r3}
    cmp        r0,#0x2
    bge        LAB_080078a2
    ldrb       r0,[r5,#0x1d]
    mov        r1,#0x3
    and        r0,r1
    cmp        r0,#0x3
    bne        LAB_080078a2
    bl         BattleMP_GetMatchState
    add        r6,r0,#0x0
    add        r7,r1,#0x0
    ldrb       r2,[r7,#0x1]
    cmp        r2,#0xfd
    bne        LAB_080078a2
    ldrb       r1,[r6,#0x0]
    ldrb       r2,[r7,#0x0]
    cmp        r1,r2
    bne        LAB_0800789a
    mov        r0,#0xff
    strb       r0,[r6,#0x0]
    strb       r0,[r7,#0x0]
    lsl        r1,r1,#0x2
    ldr        r4,PTR_PTR_BattleMP_0_None_080078cc
    ldr        r4,[r4,r1]
    mov        lr,pc
    bx         r4
    mov        r0,#0x0
    strh       r0,[r5,#0x30]
LAB_0800789a:
    mov        r0,#0xff
    strb       r0,[r6,#0x0]
    strb       r0,[r7,#0x0]
    b          LAB_080078bc
LAB_080078a2:
    ldrh       r0,[r5,#0x30]
    add        r0,#0x1
    strh       r0,[r5,#0x30]
    cmp        r0,#0x78
    bmi        LAB_080078bc
    mov        r0,#0xc
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0xff
    strb       r0,[r5,#0x1d]
    bl         Sio_SetReady
LAB_080078bc:
    add        sp,#0x8
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_080078c0:
    .word gMpStateSend
PTR_PlayerMpState_080078c4:
    .word gMpPlayerState
PTR_gMpStateRecv_080078c8:
    .word gMpStateRecv
PTR_PTR_BattleMP_0_None_080078cc:
    .word PTR_BattleMP_0_None_080078d0
PTR_BattleMP_0_None_080078d0:
    .word BattleMP_0_None
    .word BattleMP_1_UpdateStats
    .word BattleMP_2_UpdateHand
    .word BattleMP_3_None
    .word BattleMP_4_None


_ts BattleMP_0_None
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1e]
    pop        {pc}


_ts BattleMP_1_UpdateStats
    push       {lr}
    LoadMain matchBattleState, r4, r4
    ldrb       r0,[r6,#0x2]
    strb       r0,[r4,#MatchBattleState_p1_statAttack]
    ldrb       r0,[r6,#0x3]
    strb       r0,[r4,#MatchBattleState_p1_statSpeed]
    ldrb       r0,[r6,#0x4]
    strb       r0,[r4,#MatchBattleState_p1_statCharge]
    ldrb       r0,[r6,#0xb]
    strb       r0,[r4,#MatchBattleState_p1_armor]
    ldrh       r0,[r6,#0x6]
    strh       r0,[r4,#MatchBattleState_p1_hpCurrent]
    ldrh       r0,[r6,#0x8]
    strh       r0,[r4,#MatchBattleState_p1_hpMax]
    add        r4,#0x70
    ldrb       r0,[r7,#0x2]
    strb       r0,[r4,#0x9]
    ldrb       r0,[r7,#0x3]
    strb       r0,[r4,#0xa]
    ldrb       r0,[r7,#0x4]
    strb       r0,[r4,#0xb]
    ldrb       r0,[r7,#0xb]
    strb       r0,[r4,#0xf]
    ldrh       r0,[r7,#0x6]
    strh       r0,[r4,#0x26]
    ldrh       r0,[r7,#0x8]
    strh       r0,[r4,#0x28]
    bl         SIO_GetMultiplayerId
    tst        r0,r0
    beq        LAB_08007930
    ldrb       r0,[r7,#0xa]
    strb       r0,[r5,#0xd]
LAB_08007930:
    mov        r0,#0x1
    strb       r0,[r5,#0x1e]
    pop        {pc}

    .align 2, 0

    .word 0x3004920


_ts BattleMP_2_UpdateHand
    push       {lr}
    LoadMain matchBattleState, r4, r4
    ldrb       r0,[r6,#0x2]
    strb       r0,[r4,#MatchBattleState_p1_chipsUsedCount]
    add        r0,r6,#0x3
    mov        r1,#0x6a
    add        r1,r1,r4
    mov        r2,#0x6
    bl         memcpy_8
    ldrb       r0,[r6,#0x9]
    tst        r0,r0
    beq        LAB_08007962
    push       {r4,r5,r6,r7}
    mov        r0,#0x0
    bl         Routine_ClearBetaSigmaTimer
    pop        {r4,r5,r6,r7}
LAB_08007962:
    add        r4,#0x70
    ldrb       r0,[r7,#0x2]
    strb       r0,[r4,#0x1]
    add        r0,r7,#0x3
    mov        r1,#0x6a
    add        r1,r1,r4
    mov        r2,#0x6
    bl         memcpy_8
    ldrb       r0,[r7,#0x9]
    tst        r0,r0
    beq        LAB_08007984
    push       {r4,r5,r6,r7}
    mov        r0,#0x1
    bl         Routine_ClearBetaSigmaTimer
    pop        {r4,r5,r6,r7}
LAB_08007984:
    mov        r0,#0x2
    strb       r0,[r5,#0x1e]
    pop        {pc}


_nt BattleMP_3_None
    push       {lr}
    pop        {pc}


_nt BattleMP_4_None
    mov        r0,#0x4
    strb       r0,[r5,#0x1e]
    mov        pc,lr


_ts BattleMP_SendStats
    push       {lr}
    ldr        r7,PTR_PlayerMpState_080079c4
    LoadMain world, r6, r6
    mov        r0,#0x1
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    ldrb       r0,[r6,#World_statAttack]
    strb       r0,[r7,#0x2]
    ldrb       r0,[r6,#World_statSpeed]
    strb       r0,[r7,#0x3]
    ldrb       r0,[r6,#World_statCharge]
    strb       r0,[r7,#0x4]
    ldrh       r0,[r6,#World_hpMax]
    strh       r0,[r7,#0x6]
    ldrh       r0,[r6,#World_hpMax]
    strh       r0,[r7,#0x8]
    ldrb       r0,[r6,#World_armor]
    strb       r0,[r7,#0xb]
    ldrb       r0,[r5,#0xd]
    strb       r0,[r7,#0xa]
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_080079c4:
    .word gMpPlayerState


_ts BattleMP_SendHand
    push       {lr}
    ldr        r7,PTR_PlayerMpState_08007a00
    LoadMain battle, r6, r6
    mov        r0,#0x2
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    ldrb       r0,[r6,#Battle_srcBattleHandCount]
    strb       r0,[r7,#0x2]
    mov        r0,#0x78
    add        r0,r0,r6
    add        r1,r7,#0x3
    mov        r2,#0x6
    bl         memcpy_8
    mov        r0,#0x1
    ldr        r4,PTR_gCustomScreen_08007a04
    ldrb       r1,[r4,#0xf]
    tst        r1,r1
    bne        LAB_080079fa
    ldrb       r1,[r6,#Battle_customScreenSelectedChipCount]
    tst        r1,r1
    bne        LAB_080079fa
    mov        r0,#0x0
LAB_080079fa:
    strb       r1,[r7,#0x9]
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_08007a00:
    .word gMpPlayerState
PTR_gCustomScreen_08007a04:
    .word gCustomScreen


_ts BattleMP_UpdateInput
    push       {lr}
    LoadMain matchBattleState, r7, r7
    ldr        r6,PTR_gMpMoveState_08007a34
    ldrb       r0,[r5,#0x1b]
    lsl        r1,r0,#0x4
    add        r6,r6,r1
    mov        r0,#0x0
    bl         BattleMP_UpdatePlayerInput
    add        r7,#0x70
    ldr        r6,PTR_gMpMoveState_08007a34
    ldrb       r0,[r5,#0x1b]
    mov        r1,#0x1
    eor        r1,r0
    lsl        r1,r1,#0x4
    add        r6,r6,r1
    mov        r0,#0x1
    bl         BattleMP_UpdatePlayerInput
    pop        {pc}

    .align 2, 0

PTR_gMpMoveState_08007a34:
    .word gMpMoveState
    .word 0x200C220


@@ Takes an input state and switches the key input for
@@ d-pad left and d-pad right. Done so that the
@@ other player sprite in multiplayer battles
@@ moves correctly
_ts BattleMP_InputFlipLeftRight
    mov        r1,#0x10
    and        r1,r0
    mov        r2,#0x20
    and        r2,r0
    mov        r3,#0x30
    bic        r0,r3
    lsl        r1,r1,#0x1
    lsr        r2,r2,#0x1
    orr        r1,r2
    orr        r0,r1
    mov        pc,lr


_nt BattleMP_UpdatePlayerInput
    push       {lr}
    ldrb       r1,[r5,#0x1b]
    eor        r0,r1
    bne        LAB_08007a6a
    ldrh       r0,[r6,#0x2]
    ldrh       r1,[r7,#0x1e]
    bl         GetToggledKeys
    strh       r0,[r7,#0x1e]
    strh       r1,[r7,#0x24]
    strh       r2,[r7,#0x20]
    b          LAB_08007a96
LAB_08007a6a:
    ldrh       r0,[r7,#0x1e]
    bl         BattleMP_InputFlipLeftRight
    add        r1,r0,#0x0
    ldrh       r0,[r6,#0x2]
    bl         GetToggledKeys
    push       {r1,r2}
    bl         BattleMP_InputFlipLeftRight
    pop        {r1,r2}
    strh       r0,[r7,#0x1e]
    add        r0,r1,#0x0
    push       {r2}
    bl         BattleMP_InputFlipLeftRight
    pop        {r2}
    strh       r0,[r7,#0x24]
    add        r0,r2,#0x0
    bl         BattleMP_InputFlipLeftRight
    strh       r0,[r7,#0x20]
LAB_08007a96:
    pop        {pc}


_ts BattleMP_SendResult
    ldr        r7,PTR_PlayerMpState_08007aac
    mov        r4,#0x4
    strb       r4,[r7,#0x0]
    mov        r4,#0xfd
    strb       r4,[r7,#0x1]
    strb       r0,[r7,#0x2]
    strb       r1,[r7,#0x3]
    strb       r2,[r7,#0x4]
    strb       r3,[r7,#0x5]
    mov        pc,lr

    .align 2, 0

PTR_PlayerMpState_08007aac:
    .word gMpPlayerState


_ts BattleMP_GetMatchState
    push       {lr}
    bl         SIO_GetMultiplayerId
    ldr        r7,PTR_gMpStateRecv_08007ac8
    add        r2,r0,#0x0
    lsl        r0,r2,#0x4
    add        r0,r0,r7
    mov        r1,#0x1
    eor        r2,r1
    lsl        r1,r2,#0x4
    add        r1,r1,r7
    pop        {pc}

    .align 2, 0

PTR_gMpStateRecv_08007ac8:
    .word gMpStateRecv


_ts BattleMP_SyncInput
    push       {lr}
    ldr        r0,PTR_gMpMoveStateBuffer2_08007b90
    ldr        r1,PTR_PlayerMpState_08007b80
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gMpMoveStateBuffer2_08007b90
    ldr        r1,PTR_gMpMoveStateBuffer1_08007b98
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_PlayerMpState_08007b80
    ldr        r1,PTR_gMpStateRecv_08007b84
    mov        r2,r10
    push       {r2,r4}
    bl         Sio_TransmitData
    pop        {r2,r4}
    mov        r10,r2
    mov        r1,#0xf
    and        r0,r1
    strb       r0,[r5,#0x1d]
    mov        r10,r2
    bl         BattleMP_GetMatchState
    add        r7,r1,#0x0
    ldrb       r0,[r7,#0x0]
    cmp        r0,#0x80
    bne        LAB_08007b62
    ldr        r6,PTR_gMpMoveStateBuffer0_08007b94
    ldr        r0,[r6,#0xc]
    ldr        r1,[r7,#0xc]
    cmp        r0,r1
    bgt        LAB_08007b62
    add        r0,r7,#0x0
    ldr        r1,PTR_gMpMoveState_08007b8c
    ldrb       r2,[r5,#0x1b]
    mov        r3,#0x1
    eor        r2,r3
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gMpMoveStateBuffer0_08007b94
    ldr        r1,PTR_gMpMoveState_08007b8c
    ldrb       r2,[r5,#0x1b]
    lsl        r2,r2,#0x4
    add        r1,r1,r2
    mov        r2,#0x10
    bl         memcpy_32
    ldr        r0,PTR_gMpMoveStateBuffer1_08007b98
    ldr        r1,PTR_gMpMoveStateBuffer0_08007b94
    mov        r2,#0x10
    bl         memcpy_32
    LoadMain input, r6, r6
    ldr        r7,PTR_gMpMoveStateBuffer2_08007b90
    ldrh       r0,[r6,#Input_curKeyState]
    strh       r0,[r7,#0x2]
    ldrh       r0,[r6,#Input_toggleKeyState]
    strh       r0,[r7,#0x4]
    ldrh       r0,[r6,#Input_heldKeyState]
    strh       r0,[r7,#0x6]
    ldrh       r0,[r6,#Input_lastKeyState]
    strh       r0,[r7,#0x8]
    ldr        r0,[r7,#0xc]
    add        r0,#0x1
    str        r0,[r7,#0xc]
    mov        r0,#0x0
    strh       r0,[r5,#0x30]
    mov        r0,#0x1
    b          LAB_08007b7e
LAB_08007b62:
    ldrh       r0,[r5,#0x30]
    add        r0,#0x1
    strh       r0,[r5,#0x30]
    cmp        r0,#0x3c
    bmi        LAB_08007b7c
    mov        r0,#0xc
    strh       r0,[r5,#0x0]
    mov        r0,#0x0
    strh       r0,[r5,#0x2]
    mov        r0,#0xff
    strb       r0,[r5,#0x1d]
    bl         Sio_SetReady
LAB_08007b7c:
    mov        r0,#0x0
LAB_08007b7e:
    pop        {pc}

    .align 2, 0

PTR_PlayerMpState_08007b80:
    .word gMpStateSend
PTR_gMpStateRecv_08007b84:
    .word gMpStateRecv
    .word gMpPlayerState
PTR_gMpMoveState_08007b8c:
    .word gMpMoveState
PTR_gMpMoveStateBuffer2_08007b90:
    .word gMpMoveStateBuffer2
PTR_gMpMoveStateBuffer0_08007b94:
    .word gMpMoveStateBuffer0
PTR_gMpMoveStateBuffer1_08007b98:
    .word gMpMoveStateBuffer1


_ts BattleMP_MoveStateInit
    push       {lr}
    mov        r0,#0x0
    str        r0,[r5,#0x70]
    strh       r0,[r5,#0x30]
    strb       r0,[r5,#0x1d]
    ldr        r7,PTR_gMpMoveStateBuffer2_08007bec
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    ldr        r7,PTR_gMpMoveStateBuffer0_08007bf0
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    ldr        r7,PTR_gMpMoveStateBuffer1_08007bf4
    mov        r0,#0x0
    str        r0,[r7,#0x0]
    str        r0,[r7,#0x4]
    str        r0,[r7,#0x8]
    str        r0,[r7,#0xc]
    mov        r0,#0x80
    strb       r0,[r7,#0x0]
    mov        r0,#0x1
    strb       r0,[r5,#0x1c]
    ldr        r0,PTR_gMpMoveState_08007bf8
    mov        r1,#0x20
    bl         memset0_32
    ldr        r0,PTR_gMpStateRecv_08007bfc
    mov        r1,#0x40
    bl         memset0_32
    pop        {pc}

    .align 2, 0

PTR_gMpMoveStateBuffer2_08007bec:
    .word gMpMoveStateBuffer2
PTR_gMpMoveStateBuffer0_08007bf0:
    .word gMpMoveStateBuffer0
PTR_gMpMoveStateBuffer1_08007bf4:
    .word gMpMoveStateBuffer1
PTR_gMpMoveState_08007bf8:
    .word gMpMoveState
PTR_gMpStateRecv_08007bfc:
    .word gMpStateRecv


_ts BattleMP_PlayerStateInit
    push       {lr}
    mov        r0,#0x0
    strb       r0,[r5,#0x1c]
    strh       r0,[r5,#0x30]
    ldr        r0,PTR_gMpStateRecv_08007c24
    mov        r1,#0x40
    bl         memset0_32
    ldr        r0,PTR_PlayerMpState_08007c28
    mov        r1,#0x10
    bl         memset0_32
    ldr        r7,PTR_PlayerMpState_08007c28
    mov        r0,#0x0
    strb       r0,[r7,#0x0]
    mov        r0,#0xfd
    strb       r0,[r7,#0x1]
    pop        {pc}

    .align 2, 0

PTR_gMpStateRecv_08007c24:
    .word gMpStateRecv
PTR_PlayerMpState_08007c28:
    .word gMpPlayerState

_ts Battle_IsActive
    push       {lr}
    LoadMain world, r7, r7
    mov        r0,#0x1
    ldrb       r1,[r7,#World_battleType]
    cmp        r1,#0x8
    blt        LAB_08007c3c
    ldrb       r0,[r5,#0x1f]
LAB_08007c3c:
    pop        {pc}


_nt GetToggledKeys
    mvn        r2,r1
    and        r2,r0
    mov        pc,lr
