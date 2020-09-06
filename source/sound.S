    .include "constants.inc"
    .include "macros.inc"

    .set m4aSoundInit, 0x0809cb90
    .set m4aSoundMode, 0x0809d0bc
    .set m4aSoundMain, 0x809CC1C
    .set m4aSoundVSync, 0x809c568
    .set m4aSongNumStart, 0x809cc2c
    .set MPlayFadeOut, 0x809cb70
    .set m4aMPlayAllStop, 0x809cd60
    .set m4aSongNumStop, 0x0809ccf8

    .text

    .thumb

@@ Initializes audio
@ void __stdcall Sound_Init(void)
thumb_func_start Sound_Init
Sound_Init:
    push       { lr }
    bl         m4aSoundInit
    ldr        r0,initVal
    bl         m4aSoundMode
    @ Set VCOUNT interrupt handler to 0x3006940+1
    ldr        r0,ptrIntrVec
    ldr        r1,longcall_4169
    str        r1,[r0, #8]
    ldr        r0,regDispStat
    @ Set DISPSTAT to perform VCOUNT interrupt on LYC 80
    ldrh       r1,[r0]
    mov        r2,#0xff
    and        r1,r2
    mov        r2,#0x20
    orr        r1,r2
    mov        r2,#0x50
    lsl        r2,r2,#0x8
    orr        r1,r2
    strh       r1,[r0,#0x0]
    pop        { pc }
thumb_func_end Sound_Init

initVal:        .word 0x93040D
regDispStat:    .word REG_DISPSTAT
ptrIntrVec:     .word interruptVector
longcall_4169:  .word 0x03006941

thumb_func_start Sound_Main
Sound_Main:
    push       { lr }
    bl         m4aSoundMain
    pop        { pc }
thumb_func_end Sound_Main

@ unknown
    .word 0x2002310
    .word .unused
.unused:
    .word 0x4425121c
    .word 0

thumb_func_start Sound_VSync
Sound_VSync:
    push       { lr }
    bl         m4aSoundVSync
    pop        { pc }
thumb_func_end Sound_VSync

thumb_func_start Sound_PlaySongImmediate
Sound_PlaySongImmediate:
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
LAB_0800066a:
    mov        r1,r10
    push       { r1 }
    bl         m4aSongNumStart
    pop        { r1 }
    mov        r10,r1
LAB_08000676:
    pop        { r1, r2, r3, r4, r5, r6, r7, pc }
thumb_func_end Sound_PlaySongImmediate

thumb_func_start Sound_ChangeSong
Sound_ChangeSong:
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x18]
    cmp        r0,r1
    beq        LAB_08000676
    strb       r0,[r7,#0x18]
    b          LAB_0800066a
thumb_func_end Sound_ChangeSong

thumb_func_start Sound_PlaySong
Sound_PlaySong:
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    strb       r0,[r7,#0x18]
    b          LAB_0800066a
thumb_func_end Sound_PlaySong

non_word_aligned_thumb_func_start Song_FadeOut
Song_FadeOut:
    push       { r5, lr }
    ldr        r7,PTR_musicPlayerList_080006a8
    lsl        r0,r0,#0x2
    ldr        r0,[r7,r0]
    mov        r2,r10
    push       { r2 }
    bl         MPlayFadeOut
    pop        { r2 }
    mov        r10,r2
    pop        { r5, pc }
thumb_func_end Song_FadeOut

PTR_musicPlayerList_080006a8: .word musicPlayerList
musicPlayerList:
        .word musicPlayerInfo_00
        .word musicPlayerInfo_01
        .word musicPlayerInfo_02
        .word musicPlayerInfo_03
        .word musicPlayerInfo_04
        .word musicPlayerInfo_05
        .word musicPlayerInfo_06
        .word musicPlayerInfo_07
        .word musicPlayerInfo_08
        .word musicPlayerInfo_09
        .word musicPlayerInfo_0A
        .word musicPlayerInfo_0B
        .word musicPlayerInfo_0C
        .word musicPlayerInfo_0D
        .word musicPlayerInfo_0E
        .word musicPlayerInfo_0F
        .word musicPlayerInfo_10
        .word musicPlayerInfo_11
        .word musicPlayerInfo_12
        .word musicPlayerInfo_13
        .word musicPlayerInfo_14
        .word musicPlayerInfo_15
        .word musicPlayerInfo_16
        .word musicPlayerInfo_17
        .word musicPlayerInfo_18
        .word musicPlayerInfo_19
        .word musicPlayerInfo_1A
        .word musicPlayerInfo_1B
        .word musicPlayerInfo_1C
        .word musicPlayerInfo_1D
        .word musicPlayerInfo_1E
        .word musicPlayerInfo_1F

thumb_func_start Sound_StopAllMusic
Sound_StopAllMusic:
    push       { lr }
    mov        r1,r10
    push       { r1 }
    bl         m4aMPlayAllStop
    pop        { r1 }
    mov        r10,r1
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    mov        r0,#0xff
    strb       r0,[r7,#0x18]
    pop        { pc }
thumb_func_end Sound_StopAllMusic

thumb_func_start Sound_AreaSongChange
Sound_AreaSongChange:
    push       { lr }
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldr        r6,PTR_songTableRealWorld_080007a8
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0x80
    bmi        LAB_08000756
    ldr        r6,PTR_songTableInternet_080007ac
    sub        r0,#0x80
LAB_08000756:
    lsl        r0,r0,#0x2
    ldr        r6,[r6,r0]
    ldrb       r0,[r7,#0x5]
    ldrb       r0,[r6,r0]
    cmp        r0,#0xff
    beq        LAB_080007a6
    push       { r0 }
    mov        r0,#0x5
    bl         Flag_GetBase
    pop        { r0 }
    bne        LAB_080007a0
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r1,[r7,#0x4]
    cmp        r1,#0x80
    bpl        LAB_080007a0
    ldrb       r1,[r7,#0x4]
    cmp        r1,#0x5
    beq        LAB_080007a0
    ldrh       r1,[r7,#0x4]
    ldr        r2,DAT_0800093c
    cmp        r1,r2
    beq        LAB_080007a0
    ldr        r2,DAT_08000940
    cmp        r1,r2
    beq        LAB_080007a0
    ldrb       r1,[r7,#0x6]
    cmp        r1,#0x50
    blt        LAB_080007a0
    push       { r0 }
    mov        r0,#0xa3
    bl         Flag_GetBase
    pop        { r0 }
    beq        LAB_080007a0
    mov        r0,#0x3
LAB_080007a0:
    bl         Sound_ChangeSong
    b          LAB_080007a6
LAB_080007a6:
    pop        { pc }
thumb_func_end Sound_AreaSongChange

PTR_songTableRealWorld_080007a8:        .word songTableRealWorld
PTR_songTableInternet_080007ac:         .word songTableInternet

songTableRealWorld:
    .word songGroup_ACCD_Elementary
    .word songGroup_ACDC_Town
    .word songGroup_GovernmentComplex
    .word songGroup_DenTown
    .word songGroup_SciLab_Basement
    .word songGroup_WWW_Base

songTableInternet:
    .word songGroup_School_Comp
    .word songGroup_Oven_Comp
    .word songGroup_Waterworks_Comp
    .word songGroup_TrafficLight_Comp
    .word songGroup_Power_Plant_Comp
    .word songGroup_WWW_Comp
    .word songGroup_Oven_Comp
    .word songGroup_Oven_Comp
    .word songGroup_ACDC_Homepage
    .word songGroup_Government_Complex_Homepage
    .word songGroup_DenTown_Homepage
    .word songGroup_Government_Complex_Homepage_2
    .word songGroup_Other_Comp
    .word songGroup_Oven_Comp
    .word songGroup_Oven_Comp
    .word songGroup_Oven_Comp
    .word songGroup_Internet

songGroup_ACCD_Elementary:
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
    .byte T_School
songGroup_ACDC_Town:
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
songGroup_GovernmentComplex:
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_NoSong
    .byte SE_Driving
    .byte T_NoSong
    .byte SE_Driving
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
songGroup_DenTown:
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_Home_Town
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
songGroup_SciLab_Basement:
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
    .byte T_In_The_Room
songGroup_WWW_Base:
    .byte T_Suspicious_Mood
    .byte T_Suspicious_Mood
    .byte T_Suspicious_Mood
    .byte T_Suspicious_Mood
    .byte T_Suspicious_Mood
    .byte T_Suspicious_Mood
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
    .byte T_Hour_of_Fate
songGroup_School_Comp:
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
    .byte T_Running_Through_the_Cyber_World
songGroup_Oven_Comp:
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
    .byte T_Fire_Field
songGroup_Waterworks_Comp:
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
    .byte T_Cold_and_Silent
songGroup_TrafficLight_Comp:
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
    .byte T_Red_or_Blue
songGroup_Power_Plant_Comp:
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
    .byte T_Electrical_Crisis
songGroup_WWW_Comp:
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
    .byte T_Void
songGroup_ACDC_Homepage:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
songGroup_Government_Complex_Homepage:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
songGroup_DenTown_Homepage:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
songGroup_Government_Complex_Homepage_2:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
songGroup_Other_Comp:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
songGroup_Internet:
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network
    .byte T_Boundless_Network

thumb_func_start Sound_StopSong
Sound_StopSong:
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    mov        r1,r10
    push       { r1 }
    bl         m4aSongNumStop
    pop        { r1 }
    mov        r10,r1
    pop        { r1, r2, r3, r4, r5, r6, r7, pc }
thumb_func_end Sound_StopSong

DAT_0800093c: .word 0x209
DAT_08000940: .word 0x20B

    .end
