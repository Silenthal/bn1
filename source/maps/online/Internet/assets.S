#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8053E14
    .word NPC_8053FE0
    .word 0xFF

    .align 2, 0

global_label NPC_8053E1C
    a_create_bmd 164, 20, 64, FLAG_ITEM_INTERNET_1_MD_1, dialog=0x32, no_shadow=1
global_label NPC_8053E42
    a_create_gmd -330, 404, 0, FLAG_ITEM_INTERNET_1_MD_2, dialog=0x36, no_shadow=1

    .align 2, 0

global_label NPC_8053E68
    a_create_gmd 220, 282, 64, FLAG_ITEM_INTERNET_1_MD_3, dialog=0x3A, no_shadow=1
global_label NPC_8053E8E
    a_create_gmd -4, 424, 0, FLAG_ITEM_INTERNET_1_MD_4, dialog=0x3E, no_shadow=1

    .align 2, 0

global_label NPC_8053EB4
    a_create_gmd 272, -172, 64, FLAG_ITEM_INTERNET_1_MD_5, dialog=0x42, no_shadow=1
global_label NPC_8053EDA
    a_create_gmd -92, -276, 0, FLAG_ITEM_INTERNET_1_MD_6, dialog=0x46, no_shadow=1

    .align 2, 0

global_label NPC_8053F00
    a_create_gmd -242, 190, 0, FLAG_ITEM_INTERNET_1_MD_7, dialog=0x4A, no_shadow=1
global_label NPC_8053F26
    a_create_gmd 284, -354, 0, FLAG_ITEM_INTERNET_1_MD_8, dialog=0x4E, no_shadow=1

    .align 2, 0

global_label NPC_8053F4C
    a_create_gmd 436, -152, 64, FLAG_ITEM_INTERNET_1_TRILANCE_M, dialog=0x25, no_shadow=1
global_label NPC_8053F72
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite_at 108, -172, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

global_label NPC_8053F89
    a_jump_if_flag 0xE2, L_8053FA7
    a_init_basic_npc_talk -180, -4, 0, SP_Overworld_Glyde, frame=5, dialog=0x5A
L_8053F9E:
    a_wait 1
    a_jump_if_not_flag 0xE2, L_8053F9E
L_8053FA7:
    a_destroy

    .align 2, 0

global_label NPC_8053FA8
    a_init_no_sprite
    a_disable_dialog
    a_disable_collision
    a_set_dialog 0x5E
    a_set_sprite_at -6, 186, 0, SP_Overworld_Prog
L_8053FB6:
    a_wait 1
    a_jump_if_flag 0xE1, L_8053FC4
    a_jump L_8053FB6
L_8053FC4:
    a_init
    a_enable_dialog
    a_enable_collision
L_8053FC7:
    a_wait_f 7, 30
    a_move_f 9, d_se, 8, 6
    a_wait_f 3, 30
    a_move_f 11, d_nw, 8, 6
    a_jump L_8053FC7

    .align 2, 0

NPC_8053FE0:
    a_init
    a_set_dialog 0x15
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -180, -4, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0


global_label PTR_NPC_8054050_08053ff8
    .word NPC_8054050
global_label PTR_NPC_8054076_08053ffc
    .word NPC_8054076
global_label PTR_NPC_805409C_08054000
    .word NPC_805409C
global_label PTR_NPC_80540C2_08054004
    .word NPC_80540C2
global_label PTR_NPC_80540E8_08054008
    .word NPC_80540E8
global_label PTR_NPC_805410E_0805400c
    .word NPC_805410E
global_label PTR_NPC_8054134_08054010
    .word NPC_8054134
global_label PTR_NPC_805415A_08054014
    .word NPC_805415A
global_label PTR_NPC_8054180_08054018
    .word NPC_8054180
global_label PTR_NPC_80541A6_0805401c
    .word NPC_80541A6
global_label PTR_NPC_80541CC_08054020
    .word NPC_80541CC
global_label PTR_NPC_80541F2_08054024
    .word NPC_80541F2
global_label PTR_NPC_8054218_08054028
    .word NPC_8054218
global_label PTR_NPC_805423E_0805402c
    .word NPC_805423E
global_label PTR_NPC_8054264_08054030
    .word NPC_8054264
global_label PTR_NPC_805428A_08054034
    .word NPC_805428A
global_label PTR_NPC_80542B0_08054038
    .word NPC_80542B0
global_label PTR_NPC_80542C5_0805403c
    .word NPC_80542C5
global_label PTR_NPC_80542E9_08054040
    .word NPC_80542E9
global_label PTR_NPC_805430D_08054044
    .word NPC_805430D
global_label PTR_NPC_8054324_08054048
    .word NPC_8054324
    .word 0xFF


NPC_8054050:
    a_create_bmd -570, 344, 64, FLAG_ITEM_INTERNET_2_MD_1, dialog=0x32, no_shadow=1
NPC_8054076:
    a_create_gmd -270, 476, 64, FLAG_ITEM_INTERNET_2_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_805409C:
    a_create_gmd -118, 356, 0, FLAG_ITEM_INTERNET_2_MD_3, dialog=0x3A, no_shadow=1
NPC_80540C2:
    a_create_gmd -88, 50, 128, FLAG_ITEM_INTERNET_2_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_80540E8:
    a_create_gmd 64, -450, 0, FLAG_ITEM_INTERNET_2_MD_5, dialog=0x42, no_shadow=1
NPC_805410E:
    a_create_gmd -10, -102, 0, FLAG_ITEM_INTERNET_2_MD_6, dialog=0x46, no_shadow=1
    .align 2, 0

NPC_8054134:
    a_create_gmd -156, -396, 0, FLAG_ITEM_INTERNET_2_MD_7, dialog=0x4A, no_shadow=1
NPC_805415A:
    a_create_gmd -220, 200, 64, FLAG_ITEM_INTERNET_2_MD_8, dialog=0x4E, no_shadow=1
    .align 2, 0

NPC_8054180:
    a_create_gmd 398, 34, 64, FLAG_ITEM_INTERNET_2_MD_9, dialog=0x52, no_shadow=1
NPC_80541A6:
    a_create_gmd -328, 240, 64, FLAG_ITEM_INTERNET_2_MD_10, dialog=0x56, no_shadow=1
    .align 2, 0

NPC_80541CC:
    a_create_gmd -428, -136, 64, FLAG_ITEM_INTERNET_2_MD_11, dialog=0x5A, no_shadow=1
NPC_80541F2:
    a_create_gmd 218, 246, 0, FLAG_ITEM_INTERNET_2_MD_12, dialog=0x5E, no_shadow=1
    .align 2, 0

NPC_8054218:
    a_create_gmd -48, 76, 0, FLAG_ITEM_INTERNET_2_MD_13, dialog=0x62, no_shadow=1
NPC_805423E:
    a_create_gmd 356, -40, 0, FLAG_ITEM_INTERNET_2_MD_14, dialog=0x66, no_shadow=1
    .align 2, 0

NPC_8054264:
    a_create_gmd 250, 196, 0, FLAG_ITEM_INTERNET_2_MD_15, dialog=0x6A, no_shadow=1
NPC_805428A:
    a_create_gmd 204, -20, 0, FLAG_ITEM_INTERNET_2_MD_16, dialog=0x6E, no_shadow=1
    .align 2, 0

NPC_80542B0:
    a_init_basic_npc_talk -78, -458, 64, SP_Overworld_StoneMan, frame=3, dialog=0x0
    a_stop

NPC_80542C5:
    a_create_gmd -112, 478, 64, FLAG_ITEM_INTERNET_2_POWERUP_1, dialog=0x16
NPC_80542E9:
    a_create_gmd 506, -60, 64, FLAG_ITEM_INTERNET_2_POWERUP_2, dialog=0x19
NPC_805430D:
    a_init
    a_set_dialog 0xE
    a_sprite_mask_set_flag 0x3
    a_set_sprite_at -302, 30, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

    .align 2, 0

NPC_8054324:
    a_jump_if_flag 0x75, L_8054344
    a_init
    a_set_dialog 0x78
    a_set_sprite SP_Overworld_NormalNavi
    a_set_palette 0x2
    a_set_pos -78, -432, 64
    a_set_sprite_frame 3
L_805433B:
    a_wait 1
    a_jump_if_not_flag 0x75, L_805433B
L_8054344:
    a_destroy

    .align 2, 0

global_label NPCList_8054348
    .word NPC_8054368
    .word NPC_805438E
    .word NPC_80543B4
    .word NPC_80543DA
    .word NPC_8054400
    .word NPC_8054426
    .word NPC_805444C
    .word 0xFF

    .align 2, 0

NPC_8054368:
    a_create_bmd -90, -114, 64, FLAG_ITEM_INTERNET_3_MD_1, dialog=0x32, no_shadow=1
NPC_805438E:
    a_create_gmd 86, -264, 64, FLAG_ITEM_INTERNET_3_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_80543B4:
    a_create_gmd 76, 200, 0, FLAG_ITEM_INTERNET_3_MD_3, dialog=0x3A, no_shadow=1
NPC_80543DA:
    a_create_gmd -684, 138, 128, FLAG_ITEM_INTERNET_3_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054400:
    a_create_gmd -210, -370, 128, FLAG_ITEM_INTERNET_3_ROCKCUBE_O, dialog=0x14, no_shadow=1
NPC_8054426:
    a_create_gmd -268, -40, 0, FLAG_ITEM_INTERNET_3_FTRSWORD_B, dialog=0x17, no_shadow=1
    .align 2, 0

NPC_805444C:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite_at -78, -96, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

global_label NPCList_8054464
    .word NPC_8054484
    .word NPC_80544AA
    .word NPC_80544D0
    .word NPC_80544F6
    .word NPC_805451C
    .word NPC_8054542
    .word NPC_8054568
    .word 0xFF

    .align 2, 0

NPC_8054484:
    a_create_bmd 100, -356, 0, FLAG_ITEM_INTERNET_4_MD_1, dialog=0x32, no_shadow=1
NPC_80544AA:
    a_create_gmd -244, 212, 64, FLAG_ITEM_INTERNET_4_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_80544D0:
    a_create_gmd -154, -396, 64, FLAG_ITEM_INTERNET_4_MD_3, dialog=0x3A, no_shadow=1
NPC_80544F6:
    a_create_gmd -118, 452, 0, FLAG_ITEM_INTERNET_4_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_805451C:
    a_create_gmd 130, -180, 0, FLAG_ITEM_INTERNET_4_AQUASWRD_A, dialog=0x1E, no_shadow=1
NPC_8054542:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_HPMEMORY, L_8054567
    a_init_no_sprite
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite_gmd_at 450, -174, 0
    a_set_radius 4
    a_set_sprite_frame 0
L_805455C:
    a_shadow_off
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_HPMEMORY, L_805455C
L_8054567:
    a_destroy

    .align 2, 0

NPC_8054568:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite_at 554, -366, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

global_label NPCList_8054580
    .word NPC_80545AC
    .word NPC_80545D2
    .word NPC_80545F8
    .word NPC_805461E
    .word NPC_8054644
    .word NPC_805466A
    .word NPC_8054690
    .word NPC_80546A7
    .word NPC_80546BE
    .word NPC_80546D5
    .word 0xFF

    .align 2, 0

NPC_80545AC:
    a_create_bmd -52, -236, 0, FLAG_ITEM_UNDERNET_1_MD_1, dialog=0x32, no_shadow=1
NPC_80545D2:
    a_create_gmd 284, 308, 64, FLAG_ITEM_UNDERNET_1_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_80545F8:
    a_create_gmd 28, -412, 0, FLAG_ITEM_UNDERNET_1_MD_3, dialog=0x3A, no_shadow=1
NPC_805461E:
    a_create_gmd 436, -48, 0, FLAG_ITEM_UNDERNET_1_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054644:
    a_create_gmd -380, 200, 0, FLAG_ITEM_UNDERNET_1_THUNDER1_H, dialog=0x1E, no_shadow=1
NPC_805466A:
    a_create_gmd 194, 330, 0, FLAG_ITEM_UNDERNET_1_HPMEMORY, dialog=0x21, no_shadow=1
    .align 2, 0

NPC_8054690:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite_at 96, -86, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_80546A7:
    a_init
    a_set_dialog 0x10
    a_set_palette 0x2
    a_set_sprite_at -288, -112, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_80546BE:
    a_init
    a_set_dialog 0x11
    a_set_palette 0x2
    a_set_sprite_at 594, -48, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_80546D5:
    a_init
    a_set_dialog 0x12
    a_set_palette 0x2
    a_set_sprite_at 480, 154, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

global_label NPCList_80546EC
    .word NPC_8054704
    .word NPC_805472A
    .word NPC_8054750
    .word NPC_8054776
    .word NPC_805479C
    .word 0xFF

    .align 2, 0

NPC_8054704:
    a_create_bmd -334, -292, 0, FLAG_ITEM_UNDERNET_2_MD_1, dialog=0x32, no_shadow=1
NPC_805472A:
    a_create_gmd -428, 266, 0, FLAG_ITEM_UNDERNET_2_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054750:
    a_create_gmd -86, 276, 0, FLAG_ITEM_UNDERNET_2_MD_3, dialog=0x3A, no_shadow=1
NPC_8054776:
    a_create_gmd 180, -342, 0, FLAG_ITEM_UNDERNET_2_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_805479C:
    a_create_gmd 378, 160, 0, FLAG_ITEM_UNDERNET_2_6000Z, dialog=0x1E, no_shadow=1
    .align 2, 0

global_label NPCList_80547C4
    .word NPC_80547DC
    .word NPC_8054802
    .word NPC_8054828
    .word NPC_805484E
    .word NPC_8054874
    .word 0xFF

    .align 2, 0

NPC_80547DC:
    a_create_bmd 356, 220, -64, FLAG_ITEM_UNDERNET_3_MD_1, dialog=0x32, no_shadow=1
NPC_8054802:
    a_create_gmd -92, 372, 0, FLAG_ITEM_UNDERNET_3_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054828:
    a_create_gmd -296, 124, 64, FLAG_ITEM_UNDERNET_3_MD_3, dialog=0x3A, no_shadow=1
NPC_805484E:
    a_create_gmd 142, -252, 0, FLAG_ITEM_UNDERNET_3_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054874:
    a_create_gmd 356, 112, 0, FLAG_ITEM_UNDERNET_3_REMOBIT1_N, dialog=0x1E, no_shadow=1
    .align 2, 0

global_label NPCList_805489C
    .word NPC_80548D8
    .word NPC_80548FE
    .word NPC_8054924
    .word NPC_805494A
    .word NPC_8054970
    .word NPC_8054996
    .word NPC_80549AB
    .word 0xFF

global_label NPCList_80548BC
    .word NPC_80548D8
    .word NPC_80548FE
    .word NPC_8054924
    .word NPC_805494A
    .word NPC_8054970
    .word NPC_80549AB
    .word 0xFF

    .align 2, 0

NPC_80548D8:
    a_create_bmd -470, 280, 64, FLAG_ITEM_UNDERNET_4_MD_1, dialog=0x32, no_shadow=1
NPC_80548FE:
    a_create_gmd 264, 44, 64, FLAG_ITEM_UNDERNET_4_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054924:
    a_create_gmd 142, -266, 128, FLAG_ITEM_UNDERNET_4_MD_3, dialog=0x3A, no_shadow=1
NPC_805494A:
    a_create_gmd -208, -388, 64, FLAG_ITEM_UNDERNET_4_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054970:
    a_create_gmd 306, 288, 64, FLAG_ITEM_UNDERNET_4_10000Z, dialog=0x1E, no_shadow=1
NPC_8054996:
    a_init_basic_npc_talk 420, -172, 0, SP_Overworld_BombMan, frame=4, dialog=0x0
    a_stop

NPC_80549AB:
    a_jump_if_flag FLAG_ITEM_30E, L_80549CC
    a_init
    a_disable_turn
    a_set_sprite_gmd_at 400, -152, 0
    a_set_sprite_frame 0
L_80549C1:
    a_shadow_off
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_30E, L_80549C1
L_80549CC:
    a_destroy

    .align 2, 0

global_label NPCList_80549D0
    .word NPC_80549EC
    .word NPC_8054A12
    .word NPC_8054A38
    .word NPC_8054A5E
    .word NPC_8054A84
    .word NPC_8054AAA
    .word 0xFF

    .align 2, 0

NPC_80549EC:
    a_create_bmd -200, 100, 0, FLAG_ITEM_UNDERNET_5_MD_1, dialog=0x32, no_shadow=1
NPC_8054A12:
    a_create_gmd 300, -206, 0, FLAG_ITEM_UNDERNET_5_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054A38:
    a_create_gmd 112, 172, 0, FLAG_ITEM_UNDERNET_5_MD_3, dialog=0x3A, no_shadow=1
NPC_8054A5E:
    a_create_gmd 376, 304, 0, FLAG_ITEM_UNDERNET_5_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054A84:
    a_create_gmd 108, 356, 64, FLAG_ITEM_UNDERNET_5_RINGZAP1_H, dialog=0x1E, no_shadow=1
NPC_8054AAA:
    a_init
    a_set_dialog 0x10
    a_set_palette 0x2
    a_set_sprite_at -24, -260, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

global_label NPCList_8054AC4
    .word NPC_8054AE8
    .word NPC_8054B0E
    .word NPC_8054B34
    .word NPC_8054B5A
    .word NPC_8054B80
    .word NPC_8054BA6
    .word NPC_8054BCC
    .word NPC_8054BE3
    .word 0xFF

    .align 2, 0

NPC_8054AE8:
    a_create_bmd -298, 252, 64, FLAG_ITEM_UNDERNET_6_MD_1, dialog=0x32, no_shadow=1
NPC_8054B0E:
    a_create_gmd 280, 150, 64, FLAG_ITEM_UNDERNET_6_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054B34:
    a_create_gmd 44, 4, 0, FLAG_ITEM_UNDERNET_6_MD_3, dialog=0x3A, no_shadow=1
NPC_8054B5A:
    a_create_gmd -316, -190, 0, FLAG_ITEM_UNDERNET_6_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054B80:
    a_create_gmd 132, -400, 0, FLAG_ITEM_UNDERNET_6_WIDESWRD_S, dialog=0x1E, no_shadow=1
NPC_8054BA6:
    a_create_gmd -118, 304, 0, FLAG_ITEM_UNDERNET_6_HPMEMORY, dialog=0x21, no_shadow=1
    .align 2, 0

NPC_8054BCC:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite_at 90, 196, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8054BE3:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -344, 118, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8054BFA:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite_at -344, 140, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

global_label NPCList_8054C14
    .word NPC_8054C34
    .word NPC_8054C5A
    .word NPC_8054C80
    .word NPC_8054CA6
    .word NPC_8054CCC
    .word NPC_8054CF2
    .word NPC_8054D09
    .word 0xFF

    .align 2, 0

NPC_8054C34:
    a_create_bmd -356, 170, 64, FLAG_ITEM_UNDERNET_7_MD_1, dialog=0x32, no_shadow=1
NPC_8054C5A:
    a_create_gmd 68, 64, 64, FLAG_ITEM_UNDERNET_7_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054C80:
    a_create_gmd -194, -340, 0, FLAG_ITEM_UNDERNET_7_MD_3, dialog=0x3A, no_shadow=1
NPC_8054CA6:
    a_create_gmd 150, 12, 0, FLAG_ITEM_UNDERNET_7_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054CCC:
    a_create_gmd -240, 284, 0, FLAG_ITEM_UNDERNET_7_10000Z, dialog=0x1E, no_shadow=1
NPC_8054CF2:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite_at -194, 20, 64, SP_Overworld_NormalNavi, frame=7
    a_stop

NPC_8054D09:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -184, -124, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

global_label NPCList_8054D20
    .word NPC_8054D40
    .word NPC_8054D66
    .word NPC_8054D8C
    .word NPC_8054DB2
    .word NPC_8054DD8
    .word NPC_8054DFE
    .word NPC_8054E15
    .word 0xFF

    .align 2, 0

NPC_8054D40:
    a_create_bmd 108, 328, 0, FLAG_ITEM_UNDERNET_8_MD_1, dialog=0x32, no_shadow=1
NPC_8054D66:
    a_create_gmd 190, -28, 0, FLAG_ITEM_UNDERNET_8_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054D8C:
    a_create_gmd 10, -220, 64, FLAG_ITEM_UNDERNET_8_MD_3, dialog=0x3A, no_shadow=1
NPC_8054DB2:
    a_create_gmd 416, 212, 64, FLAG_ITEM_UNDERNET_8_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054DD8:
    a_create_gmd 610, -88, 0, FLAG_ITEM_UNDERNET_8_KNGTSWRD_B, dialog=0x1E, no_shadow=1
NPC_8054DFE:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite_at -270, 222, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8054E15:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -466, -42, 0, SP_Overworld_NormalNavi, frame=3
    a_stop

global_label NPCList_8054E2C
    .word NPC_8054E4C
    .word NPC_8054E72
    .word NPC_8054E98
    .word NPC_8054EBE
    .word NPC_8054EE4
    .word NPC_8054F0A
    .word NPC_8054F30
    .word 0xFF

    .align 2, 0

NPC_8054E4C:
    a_create_bmd -366, 204, 0, FLAG_ITEM_UNDERNET_9_MD_1, dialog=0x32, no_shadow=1
NPC_8054E72:
    a_create_gmd -6, -156, 0, FLAG_ITEM_UNDERNET_9_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054E98:
    a_create_gmd 154, 132, 0, FLAG_ITEM_UNDERNET_9_MD_3, dialog=0x3A, no_shadow=1
NPC_8054EBE:
    a_create_gmd 440, -154, 0, FLAG_ITEM_UNDERNET_9_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8054EE4:
    a_create_gmd -166, 2, 0, FLAG_ITEM_UNDERNET_9_8000Z, dialog=0x1E, no_shadow=1
NPC_8054F0A:
    a_create_gmd 250, 34, 0, FLAG_ITEM_UNDERNET_9_RECOV150_A, dialog=0x21, no_shadow=1
    .align 2, 0

NPC_8054F30:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -368, -70, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8054F48
    .word NPC_8054F6C
    .word NPC_8054F92
    .word NPC_8054FB8
    .word NPC_8054FDE
    .word NPC_8055004
    .word NPC_805502A
    .word NPC_8055050
    .word NPC_8055067
    .word 0xFF

    .align 2, 0

NPC_8054F6C:
    a_create_bmd 394, -204, 0, FLAG_ITEM_UNDERNET_10_MD_1, dialog=0x32, no_shadow=1
NPC_8054F92:
    a_create_gmd 8, 154, 0, FLAG_ITEM_UNDERNET_10_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_8054FB8:
    a_create_gmd 140, -236, 64, FLAG_ITEM_UNDERNET_10_MD_3, dialog=0x3A, no_shadow=1
NPC_8054FDE:
    a_create_gmd 300, 200, 64, FLAG_ITEM_UNDERNET_10_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8055004:
    a_create_gmd 476, -190, 64, FLAG_ITEM_UNDERNET_10_5000Z, dialog=0x1E, no_shadow=1
NPC_805502A:
    a_create_gmd 50, 380, 64, FLAG_ITEM_UNDERNET_10_POWERUP, dialog=0x21, no_shadow=1
    .align 2, 0

NPC_8055050:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -190, -182, 0, SP_Overworld_NormalNavi, frame=7
    a_stop

NPC_8055067:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite_at 264, -266, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

    .align 2, 0

global_label NPCList_8055080
    .word NPC_80550A0
    .word NPC_80550C6
    .word NPC_80550EC
    .word NPC_8055112
    .word NPC_8055138
    .word NPC_805515E
    .word NPC_8055175
    .word 0xFF

    .align 2, 0

NPC_80550A0:
    a_create_bmd -20, -72, 64, FLAG_ITEM_UNDERNET_11_MD_1, dialog=0x32, no_shadow=1
NPC_80550C6:
    a_create_gmd 208, 292, 64, FLAG_ITEM_UNDERNET_11_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_80550EC:
    a_create_gmd 210, 214, 64, FLAG_ITEM_UNDERNET_11_MD_3, dialog=0x3A, no_shadow=1
NPC_8055112:
    a_create_gmd 104, -324, 0, FLAG_ITEM_UNDERNET_11_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8055138:
    a_create_gmd 428, 154, 0, FLAG_ITEM_UNDERNET_11_REDWAVE_J, dialog=0x1E, no_shadow=1
NPC_805515E:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite_at 80, -160, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8055175:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -266, -220, 64, SP_Overworld_NormalNavi, frame=5
    a_stop

global_label NPCList_805518C
    .word NPC_80551C0
    .word NPC_80551E6
    .word NPC_805520C
    .word NPC_8055232
    .word NPC_8055258
    .word NPC_805527E
    .word NPC_80552A4
    .word NPC_80552CA
    .word NPC_80552F0
    .word NPC_8055316
    .word NPC_805533C
    .word NPC_8055353
    .word 0xFF

    .align 2, 0

NPC_80551C0:
    a_create_bmd -220, -286, 0, FLAG_ITEM_UNDERNET_12_MD_1, dialog=0x32, no_shadow=1
NPC_80551E6:
    a_create_gmd 254, -286, 0, FLAG_ITEM_UNDERNET_12_MD_2, dialog=0x36, no_shadow=1
    .align 2, 0

NPC_805520C:
    a_create_gmd 254, 186, 0, FLAG_ITEM_UNDERNET_12_MD_3, dialog=0x3A, no_shadow=1
NPC_8055232:
    a_create_gmd -218, 186, 0, FLAG_ITEM_UNDERNET_12_MD_4, dialog=0x3E, no_shadow=1
    .align 2, 0

NPC_8055258:
    a_create_gmd -98, 58, 0, FLAG_ITEM_UNDERNET_12_MD_5, dialog=0x42, no_shadow=1
NPC_805527E:
    a_create_gmd 70, 64, 0, FLAG_ITEM_UNDERNET_12_MD_6, dialog=0x46, no_shadow=1
    .align 2, 0

NPC_80552A4:
    a_create_gmd 434, 200, 0, FLAG_ITEM_UNDERNET_12_MD_7, dialog=0x4A, no_shadow=1
NPC_80552CA:
    a_create_gmd -266, -410, 0, FLAG_ITEM_UNDERNET_12_MD_8, dialog=0x4E, no_shadow=1
    .align 2, 0

NPC_80552F0:
    a_create_gmd 364, 216, 64, FLAG_ITEM_UNDERNET_12_HEROSWRD_I, dialog=0x1E, no_shadow=1
NPC_8055316:
    a_create_gmd -28, 30, 64, FLAG_ITEM_UNDERNET_12_20000Z, dialog=0x1F, no_shadow=1
    .align 2, 0

NPC_805533C:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite_at -208, -56, 0, SP_Overworld_NormalNavi, frame=5
    a_stop

NPC_8055353:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite_at -84, -88, 0, SP_Overworld_NormalNavi, frame=1
    a_stop

    .align 2, 0

global_label EntityAllocParams_805536C
    entity Effect, 0x8, f(284, -378, 0), 0x100000
    entity Effect, 0x16, f(-468, 22, 0), 0x10000
    entity Effect, 0x16, f(-374, 310, 0), 0xC010000
    entity Effect, 0x16, f(-280, -298, 0), 0xD010000
    entity Effect, 0x16, f(184, 310, 0), 0xE010000
    .word 0xFF

global_label EntityAllocParams_80553D4
    entity Effect, 0x16, f(-468, 22, 0), 0x10000
    entity Effect, 0x16, f(-374, 310, 0), 0xC010000
    entity Effect, 0x16, f(-280, -298, 0), 0xD010000
    entity Effect, 0x16, f(184, 310, 0), 0xE010000
    .word 0xFF

global_label EntityAllocParams_8055428
    entity Effect, 0x15, f(-70, -550, 64), 0x0
    .word 0xFF
