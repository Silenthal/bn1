	.equiv TRACK_SIZE, 0x50
	.equiv NUM_TRACKS_BGM00, 1
	.equiv NUM_TRACKS_BGM01, 2
	.equiv NUM_TRACKS_BGM02, 1
    .equiv NUM_TRACKS_BGM03, 1
    .equiv NUM_TRACKS_BGM04, 1
    .equiv NUM_TRACKS_BGM05, 1
    .equiv NUM_TRACKS_BGM06, 1
    .equiv NUM_TRACKS_BGM07, 1
    .equiv NUM_TRACKS_BGM08, 1
    .equiv NUM_TRACKS_BGM09, 1
    .equiv NUM_TRACKS_BGM0A, 1
    .equiv NUM_TRACKS_BGM0B, 1
    .equiv NUM_TRACKS_BGM0C, 1
    .equiv NUM_TRACKS_BGM0D, 1
    .equiv NUM_TRACKS_BGM0E, 1
    .equiv NUM_TRACKS_BGM0F, 1
	.equiv NUM_TRACKS_BGM10, 1
	.equiv NUM_TRACKS_BGM11, 1
	.equiv NUM_TRACKS_BGM12, 1
    .equiv NUM_TRACKS_BGM13, 1
    .equiv NUM_TRACKS_BGM14, 1
    .equiv NUM_TRACKS_BGM15, 1
    .equiv NUM_TRACKS_BGM16, 1
    .equiv NUM_TRACKS_BGM17, 1
    .equiv NUM_TRACKS_BGM18, 1
    .equiv NUM_TRACKS_BGM19, 1
    .equiv NUM_TRACKS_BGM1A, 1
    .equiv NUM_TRACKS_BGM1B, 1
    .equiv NUM_TRACKS_BGM1C, 1
    .equiv NUM_TRACKS_BGM1D, 2
    .equiv NUM_TRACKS_BGM1E, 3
    .equiv NUM_TRACKS_BGM1F, 6

    .bss
    .align 2

global_label MusicPlayerTrack_02002748
    .space TRACK_SIZE * NUM_TRACKS_BGM00
    .size MusicPlayerTrack_02002748, . - MusicPlayerTrack_02002748

global_label MusicPlayerTrack_02002798
    .space TRACK_SIZE * NUM_TRACKS_BGM01
    .size MusicPlayerTrack_02002798, . - MusicPlayerTrack_02002798

global_label MusicPlayerTrack_02002838
    .space TRACK_SIZE * NUM_TRACKS_BGM02
    .size MusicPlayerTrack_02002838, . - MusicPlayerTrack_02002838

global_label MusicPlayerTrack_02002888
    .space TRACK_SIZE * NUM_TRACKS_BGM03
    .size MusicPlayerTrack_02002888, . - MusicPlayerTrack_02002888

global_label MusicPlayerTrack_020028D8
    .space TRACK_SIZE * NUM_TRACKS_BGM04
    .size MusicPlayerTrack_020028D8, . - MusicPlayerTrack_020028D8

global_label MusicPlayerTrack_02002928
    .space TRACK_SIZE * NUM_TRACKS_BGM05
    .size MusicPlayerTrack_02002928, . - MusicPlayerTrack_02002928

global_label MusicPlayerTrack_02002978
    .space TRACK_SIZE * NUM_TRACKS_BGM06
    .size MusicPlayerTrack_02002978, . - MusicPlayerTrack_02002978

global_label MusicPlayerTrack_020029C8
    .space TRACK_SIZE * NUM_TRACKS_BGM07
    .size MusicPlayerTrack_020029C8, . - MusicPlayerTrack_020029C8

global_label MusicPlayerTrack_02002A18
    .space TRACK_SIZE * NUM_TRACKS_BGM08
    .size MusicPlayerTrack_02002A18, . - MusicPlayerTrack_02002A18

global_label MusicPlayerTrack_02002A68
    .space TRACK_SIZE * NUM_TRACKS_BGM09
    .size MusicPlayerTrack_02002A68, . - MusicPlayerTrack_02002A68

global_label MusicPlayerTrack_02002AB8
    .space TRACK_SIZE * NUM_TRACKS_BGM0A
    .size MusicPlayerTrack_02002AB8, . - MusicPlayerTrack_02002AB8

global_label MusicPlayerTrack_02002B08
    .space TRACK_SIZE * NUM_TRACKS_BGM0B
    .size MusicPlayerTrack_02002B08, . - MusicPlayerTrack_02002B08

global_label MusicPlayerTrack_02002B58
    .space TRACK_SIZE * NUM_TRACKS_BGM0C
    .size MusicPlayerTrack_02002B58, . - MusicPlayerTrack_02002B58

global_label MusicPlayerTrack_02002BA8
    .space TRACK_SIZE * NUM_TRACKS_BGM0D
    .size MusicPlayerTrack_02002BA8, . - MusicPlayerTrack_02002BA8

global_label MusicPlayerTrack_02002BF8
    .space TRACK_SIZE * NUM_TRACKS_BGM0E
    .size MusicPlayerTrack_02002BF8, . - MusicPlayerTrack_02002BF8

global_label MusicPlayerTrack_02002C48
    .space TRACK_SIZE * NUM_TRACKS_BGM0F
    .size MusicPlayerTrack_02002C48, . - MusicPlayerTrack_02002C48

global_label MusicPlayerTrack_02002C98
    .space TRACK_SIZE * NUM_TRACKS_BGM10
    .size MusicPlayerTrack_02002C98, . - MusicPlayerTrack_02002C98

global_label MusicPlayerTrack_02002CE8
    .space TRACK_SIZE * NUM_TRACKS_BGM11
    .size MusicPlayerTrack_02002CE8, . - MusicPlayerTrack_02002CE8

global_label MusicPlayerTrack_02002D38
    .space TRACK_SIZE * NUM_TRACKS_BGM12
    .size MusicPlayerTrack_02002D38, . - MusicPlayerTrack_02002D38

global_label MusicPlayerTrack_02002D88
    .space TRACK_SIZE * NUM_TRACKS_BGM13
    .size MusicPlayerTrack_02002D88, . - MusicPlayerTrack_02002D88

global_label MusicPlayerTrack_02002DD8
    .space TRACK_SIZE * NUM_TRACKS_BGM14
    .size MusicPlayerTrack_02002DD8, . - MusicPlayerTrack_02002DD8

global_label MusicPlayerTrack_02002E28
    .space TRACK_SIZE * NUM_TRACKS_BGM15
    .size MusicPlayerTrack_02002E28, . - MusicPlayerTrack_02002E28

global_label MusicPlayerTrack_02002E78
    .space TRACK_SIZE * NUM_TRACKS_BGM16
    .size MusicPlayerTrack_02002E78, . - MusicPlayerTrack_02002E78

global_label MusicPlayerTrack_02002EC8
    .space TRACK_SIZE * NUM_TRACKS_BGM17
    .size MusicPlayerTrack_02002EC8, . - MusicPlayerTrack_02002EC8

global_label MusicPlayerTrack_02002F18
    .space TRACK_SIZE * NUM_TRACKS_BGM18
    .size MusicPlayerTrack_02002F18, . - MusicPlayerTrack_02002F18

global_label MusicPlayerTrack_02002F68
    .space TRACK_SIZE * NUM_TRACKS_BGM19
    .size MusicPlayerTrack_02002F68, . - MusicPlayerTrack_02002F68

global_label MusicPlayerTrack_02002FB8
    .space TRACK_SIZE * NUM_TRACKS_BGM1A
    .size MusicPlayerTrack_02002FB8, . - MusicPlayerTrack_02002FB8

global_label MusicPlayerTrack_02003008
    .space TRACK_SIZE * NUM_TRACKS_BGM1B
    .size MusicPlayerTrack_02003008, . - MusicPlayerTrack_02003008

global_label MusicPlayerTrack_02003058
    .space TRACK_SIZE * NUM_TRACKS_BGM1C
    .size MusicPlayerTrack_02003058, . - MusicPlayerTrack_02003058

global_label MusicPlayerTrack_020030A8
    .space TRACK_SIZE * NUM_TRACKS_BGM1D
    .size MusicPlayerTrack_020030A8, . - MusicPlayerTrack_020030A8

global_label MusicPlayerTrack_02003148
    .space TRACK_SIZE * NUM_TRACKS_BGM1E
    .size MusicPlayerTrack_02003148, . - MusicPlayerTrack_02003148

global_label MusicPlayerTrack_02003238
    .space TRACK_SIZE * NUM_TRACKS_BGM1F
    .size MusicPlayerTrack_02003238, . - MusicPlayerTrack_02003238

    // .rodata
	.text

	.align 2

global_label gMPlayTable
    music_player musicPlayerInfo_00, MusicPlayerTrack_02002748, NUM_TRACKS_BGM00, 0
    music_player musicPlayerInfo_01, MusicPlayerTrack_02002798, NUM_TRACKS_BGM01, 0
    music_player musicPlayerInfo_02, MusicPlayerTrack_02002838, NUM_TRACKS_BGM02, 0
    music_player musicPlayerInfo_03, MusicPlayerTrack_02002888, NUM_TRACKS_BGM03, 0
    music_player musicPlayerInfo_04, MusicPlayerTrack_020028D8, NUM_TRACKS_BGM04, 0
    music_player musicPlayerInfo_05, MusicPlayerTrack_02002928, NUM_TRACKS_BGM05, 0
    music_player musicPlayerInfo_06, MusicPlayerTrack_02002978, NUM_TRACKS_BGM06, 0
    music_player musicPlayerInfo_07, MusicPlayerTrack_020029C8, NUM_TRACKS_BGM07, 0
    music_player musicPlayerInfo_08, MusicPlayerTrack_02002A18, NUM_TRACKS_BGM08, 0
    music_player musicPlayerInfo_09, MusicPlayerTrack_02002A68, NUM_TRACKS_BGM09, 0
    music_player musicPlayerInfo_0A, MusicPlayerTrack_02002AB8, NUM_TRACKS_BGM0A, 0
    music_player musicPlayerInfo_0B, MusicPlayerTrack_02002B08, NUM_TRACKS_BGM0B, 0
    music_player musicPlayerInfo_0C, MusicPlayerTrack_02002B58, NUM_TRACKS_BGM0C, 0
    music_player musicPlayerInfo_0D, MusicPlayerTrack_02002BA8, NUM_TRACKS_BGM0D, 0
    music_player musicPlayerInfo_0E, MusicPlayerTrack_02002BF8, NUM_TRACKS_BGM0E, 0
    music_player musicPlayerInfo_0F, MusicPlayerTrack_02002C48, NUM_TRACKS_BGM0F, 0
    music_player musicPlayerInfo_10, MusicPlayerTrack_02002C98, NUM_TRACKS_BGM10, 0
    music_player musicPlayerInfo_11, MusicPlayerTrack_02002CE8, NUM_TRACKS_BGM11, 0
    music_player musicPlayerInfo_12, MusicPlayerTrack_02002D38, NUM_TRACKS_BGM12, 0
    music_player musicPlayerInfo_13, MusicPlayerTrack_02002D88, NUM_TRACKS_BGM13, 0
    music_player musicPlayerInfo_14, MusicPlayerTrack_02002DD8, NUM_TRACKS_BGM14, 0
    music_player musicPlayerInfo_15, MusicPlayerTrack_02002E28, NUM_TRACKS_BGM15, 0
    music_player musicPlayerInfo_16, MusicPlayerTrack_02002E78, NUM_TRACKS_BGM16, 0
    music_player musicPlayerInfo_17, MusicPlayerTrack_02002EC8, NUM_TRACKS_BGM17, 0
    music_player musicPlayerInfo_18, MusicPlayerTrack_02002F18, NUM_TRACKS_BGM18, 0
    music_player musicPlayerInfo_19, MusicPlayerTrack_02002F68, NUM_TRACKS_BGM19, 0
    music_player musicPlayerInfo_1A, MusicPlayerTrack_02002FB8, NUM_TRACKS_BGM1A, 0
    music_player musicPlayerInfo_1B, MusicPlayerTrack_02003008, NUM_TRACKS_BGM1B, 0
    music_player musicPlayerInfo_1C, MusicPlayerTrack_02003058, NUM_TRACKS_BGM1C, 0
    music_player musicPlayerInfo_1D, MusicPlayerTrack_020030A8, NUM_TRACKS_BGM1D, 0
    music_player musicPlayerInfo_1E, MusicPlayerTrack_02003148, NUM_TRACKS_BGM1E, 0
    music_player musicPlayerInfo_1F, MusicPlayerTrack_02003238, NUM_TRACKS_BGM1F, 0
