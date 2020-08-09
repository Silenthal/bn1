#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

@@ Calculates the rank given at the end of a battle.
@@ Out:
@@ r0: The rank, ranging from 1 to 11 (S) inclusive
@@ r1: The busting time, as a BCD number
@@ r2: The score given to the busting time
thumb_func_start Battle_CalculateRank
Battle_CalculateRank:
    push       { lr }
    sub        sp,#0xc
    @ Figure out which scoring to use based on the type of battle
    @ Virus busting uses different thresholds than boss busting
    mov        r1,#0x0
    LoadStateTo r4, Main_unk_08, r4
    ldrb       r0,[r4,#Struct_Unk08_m_battleType]
    cmp        r0,#BattleType_5_InvElecMan
    beq        LAB_0807d5ca
    cmp        r0,#BattleType_7_Boss
    beq        LAB_0807d5ca
    cmp        r0,#BattleType_8_Save
    bge        LAB_0807d5ca
    b          LAB_0807d5cc
LAB_0807d5ca:
    mov        r1,#0x1
LAB_0807d5cc:
    str        r1,[sp,#0x8]
    @ Figure out the score for battle time
    @ First, get time and cap it at 9 minutes, 59.99 seconds
    LoadStateTo r7, Main_unk_0C
    push       { r7 }
    ldrh       r0,[r7,#Struct_Unk0C_m_possibleBattleTime]
    bl         FrameTimeToBcdRealTime
    pop        { r7 }
    ldr        r1,maxTime
    cmp        r0,r1
    bmi        LAB_0807d5e4
    add        r0,r1,#0x0
LAB_0807d5e4:
    str        r0,[sp,#0x0]
    @ Select the time threshold array for either viruses or
    @ bosses
    ldr        r6,PTR_timeScoreThresholdVirus_0807d674
    ldr        r3,[sp,#0x8]
    tst        r3,r3
    beq        LAB_0807d5f0
    ldr        r6,PTR_timeScoreThresholdBoss_0807d678
    @ Calculate points for the time threshold
LAB_0807d5f0:
    mov        r3,#0x0
LAB_0807d5f2:
    add        r4,r3,r3
    ldrh       r1,[r6,r4]
    cmp        r0,r1
    ble        LAB_0807d600
    add        r3,#0x1
    cmp        r3,#0x3
    bmi        LAB_0807d5f2
LAB_0807d600:
    ldr        r6,PTR_scoreVirusBustingTime_0807d668
    ldr        r0,[sp,#0x8]
    tst        r0,r0
    beq        LAB_0807d60a
    ldr        r6,PTR_scoreBossBustingTime_0807d66c
LAB_0807d60a:
    ldrb       r0,[r6,r3]
    str        r3,[sp,#0x4]
    ldrb       r2,[r7,#Struct_Unk0C_m_multipleDeletionCount]
    @ Calculate points for multiple deletion - double delete
    @ is +2, triple delete is +4
    ldr        r6,PTR_scoreMultipleDeletion_0807d670
    ldrb       r2,[r6,r2]
    add        r0,r0,r2
    @ Calculate points for hits taken - start off at +1
    @ and subtract 1 for every hit taken up to 4
    LoadStateTo r7, Main_unk_20
    mov        r2,#0x1
    ldrb       r1,[r7,#Struct_Unk20_m_hitsTaken]
    tst        r1,r1
    beq        LAB_0807d636
    mov        r2,#0x0
    cmp        r1,#0x1
    beq        LAB_0807d636
    sub        r2,#0x1
    cmp        r1,#0x2
    beq        LAB_0807d636
    sub        r2,#0x1
    cmp        r1,#0x3
    beq        LAB_0807d636
    sub        r2,#0x1
LAB_0807d636:
    add        r0,r0,r2
    @ Calculate points for steps taken - +1 for less than
    @ 3 steps
    mov        r2,#0x1
    ldrb       r1,[r7,#Struct_Unk20_m_moveCount]
    cmp        r1,#0x3
    bmi        LAB_0807d642
    mov        r2,#0x0
LAB_0807d642:
    add        r0,r0,r2
    @ Clamp rank between 1 and S (11)
    cmp        r0,#0x1
    bge        LAB_0807d64a
    mov        r0,#0x1
LAB_0807d64a:
    cmp        r0,#0xb
    ble        LAB_0807d650
    mov        r0,#0xb
    @ Return rank in R0, time points in R1, and battle time
    @ in R2
LAB_0807d650:
    ldr        r1,[sp,#0x0]
    ldr        r2,[sp,#0x4]
    add        sp,#0xc
    pop        { pc }

scoreVirusBustingTime:
    .byte 7,  6,  5,  4
scoreBossBustingTime:
    .byte 10,  8,  6,  4
scoreMultipleDeletion:
    .byte 0, 0, 2, 4
maxTime:
    time_msf 09 59 99

thumb_func_end Battle_CalculateRank

PTR_scoreVirusBustingTime_0807d668:     .word scoreVirusBustingTime
PTR_scoreBossBustingTime_0807d66c:      .word scoreBossBustingTime
PTR_scoreMultipleDeletion_0807d670:     .word scoreMultipleDeletion
PTR_timeScoreThresholdVirus_0807d674:   .word timeScoreThresholdVirus
PTR_timeScoreThresholdBoss_0807d678:    .word timeScoreThresholdBoss

timeScoreThresholdVirus:
    time_sf 05 00
    time_sf 12 00
    time_sf 36 00

timeScoreThresholdBoss:
    time_sf 30 00
    time_sf 40 00
    time_sf 50 00

    .end
