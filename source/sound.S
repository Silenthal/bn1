#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


@@ Initializes audio.
_ts Sound_Init
    push       { lr }
    bl         m4aSoundInit
    ldr        r0,PTR_soundMode
    bl         m4aSoundMode
    @ Set VCOUNT interrupt handler to 0x3006940+1
    ldr        r0,PTR_interruptHandler
    ldr        r1,PTR_handlerVcount
    str        r1,[r0, #8]
    ldr        r0,PTR_REG_DISPSTAT
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

    .align 2, 0

PTR_soundMode:          .word 0x93040D
PTR_REG_DISPSTAT:       .word REG_DISPSTAT
PTR_interruptHandler:   .word interruptVector
PTR_handlerVcount:      .word IRQ_VCount_far


@@ Sound function during vcount that handles general audio.
_ts Sound_Main
    push       { lr }
    bl         m4aSoundMain
    pop        { pc }

    .align 2, 0

    .word 0x2002310
    .word DAT_08000658
DAT_08000658:
    debug_str 0x1C, 0x12, "%D"


@@ Sound function during vsync that transfers audio data.
_ts Sound_VSync
    push       { lr }
    bl         m4aSoundVSync
    pop        { pc }


@@ Play a sound effect immediately.
@@ In:
@@ r0: SongId songid - The ID of the sound to play.
_ts Sound_PlaySE
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
LAB_0800066a:
    mov        r1,r10
    push       { r1 }
    bl         m4aSongNumStart
    pop        { r1 }
    mov        r10,r1
LAB_08000676:
    pop        { r1, r2, r3, r4, r5, r6, r7, pc }


@@ Plays background music.
@@ In:
@@ r0: SongId songid - The ID of the track to play.
_ts Sound_PlayBGM
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x18]
    cmp        r0,r1
    beq        LAB_08000676
    strb       r0,[r7,#0x18]
    b          LAB_0800066a


@@ Plays background music without checking what's playing.
@@ In:
@@ r0: SongId songid - The ID of the track to play.
_ts Sound_ForcePlayBGM
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    LoadMain world, r7, r7
    strb       r0,[r7,#0x18]
    b          LAB_0800066a


@@ Fades out the specified music track.
@@ In:
@@ r0: int musicPlayerId - The index of the music player to fade.
@@ r1: ushort speed - The speed at which to fade.
_nt Sound_FadeOut
    push       { r5, lr }
    ldr        r7,PTR_musicPlayerList
    lsl        r0,r0,#0x2
    ldr        r0,[r7,r0]
    mov        r2,r10
    push       { r2 }
    bl         MPlayFadeOut
    pop        { r2 }
    mov        r10,r2
    pop        { r5, pc }

    .align 2, 0

PTR_musicPlayerList:
    .word musicPlayerList

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


@@ Stops all playing music.
_ts Sound_StopAllMusic
    push       { lr }
    mov        r1,r10
    push       { r1 }
    bl         m4aMPlayAllStop
    pop        { r1 }
    mov        r10,r1
    LoadMain world, r7, r7
    mov        r0,#0xff
    strb       r0,[r7,#0x18]
    pop        { pc }


@@ Changes the currently playing BGM based on the current area.
_ts Sound_AreaSongChange
    push       { lr }
    LoadMain world, r7, r7
    ldr        r6,PTR_songTableOffline
    ldrb       r0,[r7,#0x4]
    cmp        r0,#0x80
    bmi        LAB_08000756
    ldr        r6,PTR_songTableOnline
    sub        r0,#0x80
LAB_08000756:
    lsl        r0,r0,#0x2
    ldr        r6,[r6,r0]
    ldrb       r0,[r7,#0x5]
    ldrb       r0,[r6,r0]
    cmp        r0,#0xff
    beq        LAB_080007a6
    push       { r0 }
    Flag_GetBase 0x05
    pop        { r0 }
    bne        LAB_080007a0
    LoadMain world, r7, r7
    ldrb       r1,[r7,#0x4]
    cmp        r1,#0x80
    bpl        LAB_080007a0
    ldrb       r1,[r7,#0x4]
    cmp        r1,#0x5
    beq        LAB_080007a0
    ldrh       r1,[r7,#0x4]
    ldr        r2,=0x209 @@ BUG: should be 0x902 for Waterworks Pump Room
    cmp        r1,r2
    beq        LAB_080007a0
    ldr        r2,=0x20B @@ BUG: should be 0xB02 for Waterworks Purification Room
    cmp        r1,r2
    beq        LAB_080007a0
    ldrb       r1,[r7,#0x6]
    cmp        r1,#0x50
    blt        LAB_080007a0
    push       { r0 }
    Flag_GetBase 0xA3
    pop        { r0 }
    beq        LAB_080007a0
    mov        r0,#0x3
LAB_080007a0:
    bl         Sound_PlayBGM
    b          LAB_080007a6
LAB_080007a6:
    pop        { pc }

    .align 2, 0

PTR_songTableOffline:   .word songTableOffline
PTR_songTableOnline:    .word songTableOnline

songTableOffline:
    .word songGroup_School
    .word songGroup_ACDC
    .word songGroup_Govt
    .word songGroup_DenTown
    .word songGroup_SciLab
    .word songGroup_WWW

songTableOnline:
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

songGroup_School:
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
songGroup_ACDC:
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
songGroup_Govt:
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
songGroup_SciLab:
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
songGroup_WWW:
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


@@ Stops the specified song.
@@ In:
@@ r0: SongId songid - The ID of the track to stop.
_ts Sound_StopBGM
    push       { r1, r2, r3, r4, r5, r6, r7, lr }
    mov        r1,r10
    push       { r1 }
    bl         m4aSongNumStop
    pop        { r1 }
    mov        r10,r1
    pop        { r1, r2, r3, r4, r5, r6, r7, pc }

    .pool
