#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8053E14
    .word NPC_8053FE0
    .word 0xFF

    .align 2, 0

global_label NPC_8053E1C
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_1, L_8053E41
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 164, 20, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8053E36:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_1, L_8053E36
L_8053E41:
    a_destroy

global_label NPC_8053E42
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_2, L_8053E67
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -330, 404
    a_set_radius 4
    a_set_sprite_frame 0
L_8053E5C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_2, L_8053E5C
L_8053E67:
    a_destroy

    .align 2, 0

global_label NPC_8053E68
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_3, L_8053E8D
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 220, 282, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8053E82:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_3, L_8053E82
L_8053E8D:
    a_destroy

global_label NPC_8053E8E
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_4, L_8053EB3
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -4, 424
    a_set_radius 4
    a_set_sprite_frame 0
L_8053EA8:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_4, L_8053EA8
L_8053EB3:
    a_destroy

    .align 2, 0

global_label NPC_8053EB4
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_5, L_8053ED9
    a_init
    a_disable_turn
    a_set_dialog 0x42
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 272, -172, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8053ECE:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_5, L_8053ECE
L_8053ED9:
    a_destroy

global_label NPC_8053EDA
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_6, L_8053EFF
    a_init
    a_disable_turn
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -92, -276
    a_set_radius 4
    a_set_sprite_frame 0
L_8053EF4:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_6, L_8053EF4
L_8053EFF:
    a_destroy

    .align 2, 0

global_label NPC_8053F00
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_7, L_8053F25
    a_init
    a_disable_turn
    a_set_dialog 0x4A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -242, 190
    a_set_radius 4
    a_set_sprite_frame 0
L_8053F1A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_7, L_8053F1A
L_8053F25:
    a_destroy

global_label NPC_8053F26
    a_jump_if_flag FLAG_ITEM_INTERNET_1_MD_8, L_8053F4B
    a_init
    a_disable_turn
    a_set_dialog 0x4E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 284, -354
    a_set_radius 4
    a_set_sprite_frame 0
L_8053F40:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_MD_8, L_8053F40
L_8053F4B:
    a_destroy

    .align 2, 0

global_label NPC_8053F4C
    a_jump_if_flag FLAG_ITEM_INTERNET_1_TRILANCE_M, L_8053F71
    a_init
    a_disable_turn
    a_set_dialog 0x25
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 436, -152, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8053F66:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_1_TRILANCE_M, L_8053F66
L_8053F71:
    a_destroy

global_label NPC_8053F72
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 108, -172
    a_set_sprite_frame 5
L_8053F82:
    a_wait 1
    a_jump L_8053F82

global_label NPC_8053F89
    a_jump_if_flag 0xE2, L_8053FA7
    a_init
    a_set_dialog 0x5A
    a_set_sprite SP_Overworld_Glyde
    a_set_pos -180, -4
    a_set_sprite_frame 5
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
    a_set_sprite SP_Overworld_Prog
    a_set_pos -6, 186
L_8053FB6:
    a_wait 1
    a_jump_if_flag 0xE1, L_8053FC4
    a_jump L_8053FB6
L_8053FC4:
    a_init
    a_enable_dialog
    a_enable_collision
L_8053FC7:
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 6
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 6
    a_jump L_8053FC7

    .align 2, 0

NPC_8053FE0:
    a_init
    a_set_dialog 0x15
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -180, -4
    a_set_sprite_frame 5
L_8053FF0:
    a_wait 1
    a_jump L_8053FF0

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
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_1, L_8054075
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -570, 344, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_805406A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_1, L_805406A
L_8054075:
    a_destroy

NPC_8054076:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_2, L_805409B
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -270, 476, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054090:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_2, L_8054090
L_805409B:
    a_destroy

    .align 2, 0

NPC_805409C:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_3, L_80540C1
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -118, 356
    a_set_radius 4
    a_set_sprite_frame 0
L_80540B6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_3, L_80540B6
L_80540C1:
    a_destroy

NPC_80540C2:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_4, L_80540E7
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -88, 50, 128
    a_set_radius 4
    a_set_sprite_frame 0
L_80540DC:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_4, L_80540DC
L_80540E7:
    a_destroy

    .align 2, 0

NPC_80540E8:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_5, L_805410D
    a_init
    a_disable_turn
    a_set_dialog 0x42
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 64, -450
    a_set_radius 4
    a_set_sprite_frame 0
L_8054102:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_5, L_8054102
L_805410D:
    a_destroy

NPC_805410E:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_6, L_8054133
    a_init
    a_disable_turn
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -10, -102
    a_set_radius 4
    a_set_sprite_frame 0
L_8054128:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_6, L_8054128
L_8054133:
    a_destroy

    .align 2, 0

NPC_8054134:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_7, L_8054159
    a_init
    a_disable_turn
    a_set_dialog 0x4A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -156, -396
    a_set_radius 4
    a_set_sprite_frame 0
L_805414E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_7, L_805414E
L_8054159:
    a_destroy

NPC_805415A:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_8, L_805417F
    a_init
    a_disable_turn
    a_set_dialog 0x4E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -220, 200, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054174:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_8, L_8054174
L_805417F:
    a_destroy

    .align 2, 0

NPC_8054180:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_9, L_80541A5
    a_init
    a_disable_turn
    a_set_dialog 0x52
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 398, 34, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_805419A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_9, L_805419A
L_80541A5:
    a_destroy

NPC_80541A6:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_10, L_80541CB
    a_init
    a_disable_turn
    a_set_dialog 0x56
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -328, 240, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80541C0:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_10, L_80541C0
L_80541CB:
    a_destroy

    .align 2, 0

NPC_80541CC:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_11, L_80541F1
    a_init
    a_disable_turn
    a_set_dialog 0x5A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -428, -136, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80541E6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_11, L_80541E6
L_80541F1:
    a_destroy

NPC_80541F2:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_12, L_8054217
    a_init
    a_disable_turn
    a_set_dialog 0x5E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 218, 246
    a_set_radius 4
    a_set_sprite_frame 0
L_805420C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_12, L_805420C
L_8054217:
    a_destroy

    .align 2, 0

NPC_8054218:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_13, L_805423D
    a_init
    a_disable_turn
    a_set_dialog 0x62
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -48, 76
    a_set_radius 4
    a_set_sprite_frame 0
L_8054232:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_13, L_8054232
L_805423D:
    a_destroy

NPC_805423E:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_14, L_8054263
    a_init
    a_disable_turn
    a_set_dialog 0x66
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 356, -40
    a_set_radius 4
    a_set_sprite_frame 0
L_8054258:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_14, L_8054258
L_8054263:
    a_destroy

    .align 2, 0

NPC_8054264:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_15, L_8054289
    a_init
    a_disable_turn
    a_set_dialog 0x6A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 250, 196
    a_set_radius 4
    a_set_sprite_frame 0
L_805427E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_15, L_805427E
L_8054289:
    a_destroy

NPC_805428A:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_MD_16, L_80542AF
    a_init
    a_disable_turn
    a_set_dialog 0x6E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 204, -20
    a_set_radius 4
    a_set_sprite_frame 0
L_80542A4:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_MD_16, L_80542A4
L_80542AF:
    a_destroy

    .align 2, 0

NPC_80542B0:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_StoneMan
    a_set_pos -78, -458, 64
    a_set_sprite_frame 3
L_80542BE:
    a_wait 1
    a_jump L_80542BE

NPC_80542C5:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_POWERUP_1, L_80542E8
    a_init
    a_disable_turn
    a_set_dialog 0x16
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -112, 478, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80542DF:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_POWERUP_1, L_80542DF
L_80542E8:
    a_destroy

NPC_80542E9:
    a_jump_if_flag FLAG_ITEM_INTERNET_2_POWERUP_2, L_805430C
    a_init
    a_disable_turn
    a_set_dialog 0x19
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 506, -60, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054303:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_2_POWERUP_2, L_8054303
L_805430C:
    a_destroy

NPC_805430D:
    a_init
    a_set_dialog 0xE
    a_sprite_mask_set_flag 0x3
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -302, 30
    a_set_sprite_frame 7
L_805431D:
    a_wait 1
    a_jump L_805431D

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
    a_jump_if_flag FLAG_ITEM_INTERNET_3_MD_1, L_805438D
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -90, -114, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054382:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_MD_1, L_8054382
L_805438D:
    a_destroy

NPC_805438E:
    a_jump_if_flag FLAG_ITEM_INTERNET_3_MD_2, L_80543B3
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 86, -264, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80543A8:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_MD_2, L_80543A8
L_80543B3:
    a_destroy

    .align 2, 0

NPC_80543B4:
    a_jump_if_flag FLAG_ITEM_INTERNET_3_MD_3, L_80543D9
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 76, 200
    a_set_radius 4
    a_set_sprite_frame 0
L_80543CE:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_MD_3, L_80543CE
L_80543D9:
    a_destroy

NPC_80543DA:
    a_jump_if_flag FLAG_ITEM_INTERNET_3_MD_4, L_80543FF
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -684, 138, 128
    a_set_radius 4
    a_set_sprite_frame 0
L_80543F4:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_MD_4, L_80543F4
L_80543FF:
    a_destroy

    .align 2, 0

NPC_8054400:
    a_jump_if_flag FLAG_ITEM_INTERNET_3_ROCKCUBE_O, L_8054425
    a_init
    a_disable_turn
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -210, -370, 128
    a_set_radius 4
    a_set_sprite_frame 0
L_805441A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_ROCKCUBE_O, L_805441A
L_8054425:
    a_destroy

NPC_8054426:
    a_jump_if_flag FLAG_ITEM_INTERNET_3_FTRSWORD_B, L_805444B
    a_init
    a_disable_turn
    a_set_dialog 0x17
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -268, -40
    a_set_radius 4
    a_set_sprite_frame 0
L_8054440:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_3_FTRSWORD_B, L_8054440
L_805444B:
    a_destroy

    .align 2, 0

NPC_805444C:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -78, -96, 64
    a_set_sprite_frame 5
L_805445C:
    a_wait 1
    a_jump L_805445C

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
    a_jump_if_flag FLAG_ITEM_INTERNET_4_MD_1, L_80544A9
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 100, -356
    a_set_radius 4
    a_set_sprite_frame 0
L_805449E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_MD_1, L_805449E
L_80544A9:
    a_destroy

NPC_80544AA:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_MD_2, L_80544CF
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -244, 212, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80544C4:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_MD_2, L_80544C4
L_80544CF:
    a_destroy

    .align 2, 0

NPC_80544D0:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_MD_3, L_80544F5
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -154, -396, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80544EA:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_MD_3, L_80544EA
L_80544F5:
    a_destroy

NPC_80544F6:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_MD_4, L_805451B
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -118, 452
    a_set_radius 4
    a_set_sprite_frame 0
L_8054510:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_MD_4, L_8054510
L_805451B:
    a_destroy

    .align 2, 0

NPC_805451C:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_AQUASWRD_A, L_8054541
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 130, -180
    a_set_radius 4
    a_set_sprite_frame 0
L_8054536:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_AQUASWRD_A, L_8054536
L_8054541:
    a_destroy

NPC_8054542:
    a_jump_if_flag FLAG_ITEM_INTERNET_4_HPMEMORY, L_8054567
    a_init_no_sprite
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 450, -174
    a_set_radius 4
    a_set_sprite_frame 0
L_805455C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_INTERNET_4_HPMEMORY, L_805455C
L_8054567:
    a_destroy

    .align 2, 0

NPC_8054568:
    a_init
    a_sprite_mask_set_flag 0x3
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 554, -366
    a_set_sprite_frame 5
L_8054578:
    a_wait 1
    a_jump L_8054578

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_MD_1, L_80545D1
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -52, -236
    a_set_radius 4
    a_set_sprite_frame 0
L_80545C6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_MD_1, L_80545C6
L_80545D1:
    a_destroy

NPC_80545D2:
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_MD_2, L_80545F7
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 284, 308, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80545EC:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_MD_2, L_80545EC
L_80545F7:
    a_destroy

    .align 2, 0

NPC_80545F8:
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_MD_3, L_805461D
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 28, -412
    a_set_radius 4
    a_set_sprite_frame 0
L_8054612:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_MD_3, L_8054612
L_805461D:
    a_destroy

NPC_805461E:
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_MD_4, L_8054643
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 436, -48
    a_set_radius 4
    a_set_sprite_frame 0
L_8054638:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_MD_4, L_8054638
L_8054643:
    a_destroy

    .align 2, 0

NPC_8054644:
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_THUNDER1_H, L_8054669
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -380, 200
    a_set_radius 4
    a_set_sprite_frame 0
L_805465E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_THUNDER1_H, L_805465E
L_8054669:
    a_destroy

NPC_805466A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_1_HPMEMORY, L_805468F
    a_init
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 194, 330
    a_set_radius 4
    a_set_sprite_frame 0
L_8054684:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_1_HPMEMORY, L_8054684
L_805468F:
    a_destroy

    .align 2, 0

NPC_8054690:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 96, -86
    a_set_sprite_frame 5
L_80546A0:
    a_wait 1
    a_jump L_80546A0

NPC_80546A7:
    a_init
    a_set_dialog 0x10
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -288, -112
    a_set_sprite_frame 5
L_80546B7:
    a_wait 1
    a_jump L_80546B7

NPC_80546BE:
    a_init
    a_set_dialog 0x11
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 594, -48
    a_set_sprite_frame 5
L_80546CE:
    a_wait 1
    a_jump L_80546CE

NPC_80546D5:
    a_init
    a_set_dialog 0x12
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 480, 154
    a_set_sprite_frame 7
L_80546E5:
    a_wait 1
    a_jump L_80546E5

global_label NPCList_80546EC
    .word NPC_8054704
    .word NPC_805472A
    .word NPC_8054750
    .word NPC_8054776
    .word NPC_805479C
    .word 0xFF

    .align 2, 0

NPC_8054704:
    a_jump_if_flag FLAG_ITEM_UNDERNET_2_MD_1, L_8054729
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -334, -292
    a_set_radius 4
    a_set_sprite_frame 0
L_805471E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_2_MD_1, L_805471E
L_8054729:
    a_destroy

NPC_805472A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_2_MD_2, L_805474F
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -428, 266
    a_set_radius 4
    a_set_sprite_frame 0
L_8054744:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_2_MD_2, L_8054744
L_805474F:
    a_destroy

    .align 2, 0

NPC_8054750:
    a_jump_if_flag FLAG_ITEM_UNDERNET_2_MD_3, L_8054775
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -86, 276
    a_set_radius 4
    a_set_sprite_frame 0
L_805476A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_2_MD_3, L_805476A
L_8054775:
    a_destroy

NPC_8054776:
    a_jump_if_flag FLAG_ITEM_UNDERNET_2_MD_4, L_805479B
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 180, -342
    a_set_radius 4
    a_set_sprite_frame 0
L_8054790:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_2_MD_4, L_8054790
L_805479B:
    a_destroy

    .align 2, 0

NPC_805479C:
    a_jump_if_flag FLAG_ITEM_UNDERNET_2_6000Z, L_80547C1
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 378, 160
    a_set_radius 4
    a_set_sprite_frame 0
L_80547B6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_2_6000Z, L_80547B6
L_80547C1:
    a_destroy

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_3_MD_1, L_8054801
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 356, 220, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_80547F6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_3_MD_1, L_80547F6
L_8054801:
    a_destroy

NPC_8054802:
    a_jump_if_flag FLAG_ITEM_UNDERNET_3_MD_2, L_8054827
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -92, 372
    a_set_radius 4
    a_set_sprite_frame 0
L_805481C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_3_MD_2, L_805481C
L_8054827:
    a_destroy

    .align 2, 0

NPC_8054828:
    a_jump_if_flag FLAG_ITEM_UNDERNET_3_MD_3, L_805484D
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -296, 124, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054842:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_3_MD_3, L_8054842
L_805484D:
    a_destroy

NPC_805484E:
    a_jump_if_flag FLAG_ITEM_UNDERNET_3_MD_4, L_8054873
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 142, -252
    a_set_radius 4
    a_set_sprite_frame 0
L_8054868:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_3_MD_4, L_8054868
L_8054873:
    a_destroy

    .align 2, 0

NPC_8054874:
    a_jump_if_flag FLAG_ITEM_UNDERNET_3_REMOBIT1_N, L_8054899
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 356, 112
    a_set_radius 4
    a_set_sprite_frame 0
L_805488E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_3_REMOBIT1_N, L_805488E
L_8054899:
    a_destroy

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_4_MD_1, L_80548FD
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -470, 280, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80548F2:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_4_MD_1, L_80548F2
L_80548FD:
    a_destroy

NPC_80548FE:
    a_jump_if_flag FLAG_ITEM_UNDERNET_4_MD_2, L_8054923
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 264, 44, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054918:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_4_MD_2, L_8054918
L_8054923:
    a_destroy

    .align 2, 0

NPC_8054924:
    a_jump_if_flag FLAG_ITEM_UNDERNET_4_MD_3, L_8054949
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 142, -266, 128
    a_set_radius 4
    a_set_sprite_frame 0
L_805493E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_4_MD_3, L_805493E
L_8054949:
    a_destroy

NPC_805494A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_4_MD_4, L_805496F
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -208, -388, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054964:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_4_MD_4, L_8054964
L_805496F:
    a_destroy

    .align 2, 0

NPC_8054970:
    a_jump_if_flag FLAG_ITEM_UNDERNET_4_10000Z, L_8054995
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 306, 288, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_805498A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_4_10000Z, L_805498A
L_8054995:
    a_destroy

NPC_8054996:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_BombMan
    a_set_pos 420, -172
    a_set_sprite_frame 4
L_80549A4:
    a_wait 1
    a_jump L_80549A4

NPC_80549AB:
    a_jump_if_flag FLAG_ITEM_30E, L_80549CC
    a_init
    a_disable_turn
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 400, -152
    a_set_sprite_frame 0
L_80549C1:
    a_set_no_z_clip
    a_clear_z_clip
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
    a_jump_if_flag FLAG_ITEM_UNDERNET_5_MD_1, L_8054A11
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -200, 100
    a_set_radius 4
    a_set_sprite_frame 0
L_8054A06:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_5_MD_1, L_8054A06
L_8054A11:
    a_destroy

NPC_8054A12:
    a_jump_if_flag FLAG_ITEM_UNDERNET_5_MD_2, L_8054A37
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 300, -206
    a_set_radius 4
    a_set_sprite_frame 0
L_8054A2C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_5_MD_2, L_8054A2C
L_8054A37:
    a_destroy

    .align 2, 0

NPC_8054A38:
    a_jump_if_flag FLAG_ITEM_UNDERNET_5_MD_3, L_8054A5D
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 112, 172
    a_set_radius 4
    a_set_sprite_frame 0
L_8054A52:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_5_MD_3, L_8054A52
L_8054A5D:
    a_destroy

NPC_8054A5E:
    a_jump_if_flag FLAG_ITEM_UNDERNET_5_MD_4, L_8054A83
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 376, 304
    a_set_radius 4
    a_set_sprite_frame 0
L_8054A78:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_5_MD_4, L_8054A78
L_8054A83:
    a_destroy

    .align 2, 0

NPC_8054A84:
    a_jump_if_flag FLAG_ITEM_UNDERNET_5_RINGZAP1_H, L_8054AA9
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 108, 356, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054A9E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_5_RINGZAP1_H, L_8054A9E
L_8054AA9:
    a_destroy

NPC_8054AAA:
    a_init
    a_set_dialog 0x10
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -24, -260
    a_set_sprite_frame 5
L_8054ABA:
    a_wait 1
    a_jump L_8054ABA

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_MD_1, L_8054B0D
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -298, 252, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054B02:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_MD_1, L_8054B02
L_8054B0D:
    a_destroy

NPC_8054B0E:
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_MD_2, L_8054B33
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 280, 150, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054B28:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_MD_2, L_8054B28
L_8054B33:
    a_destroy

    .align 2, 0

NPC_8054B34:
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_MD_3, L_8054B59
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 44, 4
    a_set_radius 4
    a_set_sprite_frame 0
L_8054B4E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_MD_3, L_8054B4E
L_8054B59:
    a_destroy

NPC_8054B5A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_MD_4, L_8054B7F
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -316, -190
    a_set_radius 4
    a_set_sprite_frame 0
L_8054B74:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_MD_4, L_8054B74
L_8054B7F:
    a_destroy

    .align 2, 0

NPC_8054B80:
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_WIDESWRD_S, L_8054BA5
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 132, -400
    a_set_radius 4
    a_set_sprite_frame 0
L_8054B9A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_WIDESWRD_S, L_8054B9A
L_8054BA5:
    a_destroy

NPC_8054BA6:
    a_jump_if_flag FLAG_ITEM_UNDERNET_6_HPMEMORY, L_8054BCB
    a_init
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -118, 304
    a_set_radius 4
    a_set_sprite_frame 0
L_8054BC0:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_6_HPMEMORY, L_8054BC0
L_8054BCB:
    a_destroy

    .align 2, 0

NPC_8054BCC:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 90, 196, 64
    a_set_sprite_frame 5
L_8054BDC:
    a_wait 1
    a_jump L_8054BDC

NPC_8054BE3:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -344, 118, 64
    a_set_sprite_frame 5
L_8054BF3:
    a_wait 1
    a_jump L_8054BF3

NPC_8054BFA:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -344, 140, 64
    a_set_sprite_frame 5
L_8054C0A:
    a_wait 1
    a_jump L_8054C0A

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_7_MD_1, L_8054C59
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -356, 170, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054C4E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_7_MD_1, L_8054C4E
L_8054C59:
    a_destroy

NPC_8054C5A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_7_MD_2, L_8054C7F
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 68, 64, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054C74:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_7_MD_2, L_8054C74
L_8054C7F:
    a_destroy

    .align 2, 0

NPC_8054C80:
    a_jump_if_flag FLAG_ITEM_UNDERNET_7_MD_3, L_8054CA5
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -194, -340
    a_set_radius 4
    a_set_sprite_frame 0
L_8054C9A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_7_MD_3, L_8054C9A
L_8054CA5:
    a_destroy

NPC_8054CA6:
    a_jump_if_flag FLAG_ITEM_UNDERNET_7_MD_4, L_8054CCB
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 150, 12
    a_set_radius 4
    a_set_sprite_frame 0
L_8054CC0:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_7_MD_4, L_8054CC0
L_8054CCB:
    a_destroy

    .align 2, 0

NPC_8054CCC:
    a_jump_if_flag FLAG_ITEM_UNDERNET_7_10000Z, L_8054CF1
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -240, 284
    a_set_radius 4
    a_set_sprite_frame 0
L_8054CE6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_7_10000Z, L_8054CE6
L_8054CF1:
    a_destroy

NPC_8054CF2:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -194, 20, 64
    a_set_sprite_frame 7
L_8054D02:
    a_wait 1
    a_jump L_8054D02

NPC_8054D09:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -184, -124, 64
    a_set_sprite_frame 5
L_8054D19:
    a_wait 1
    a_jump L_8054D19

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_8_MD_1, L_8054D65
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 108, 328
    a_set_radius 4
    a_set_sprite_frame 0
L_8054D5A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_8_MD_1, L_8054D5A
L_8054D65:
    a_destroy

NPC_8054D66:
    a_jump_if_flag FLAG_ITEM_UNDERNET_8_MD_2, L_8054D8B
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 190, -28
    a_set_radius 4
    a_set_sprite_frame 0
L_8054D80:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_8_MD_2, L_8054D80
L_8054D8B:
    a_destroy

    .align 2, 0

NPC_8054D8C:
    a_jump_if_flag FLAG_ITEM_UNDERNET_8_MD_3, L_8054DB1
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 10, -220, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054DA6:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_8_MD_3, L_8054DA6
L_8054DB1:
    a_destroy

NPC_8054DB2:
    a_jump_if_flag FLAG_ITEM_UNDERNET_8_MD_4, L_8054DD7
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 416, 212, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054DCC:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_8_MD_4, L_8054DCC
L_8054DD7:
    a_destroy

    .align 2, 0

NPC_8054DD8:
    a_jump_if_flag FLAG_ITEM_UNDERNET_8_KNGTSWRD_B, L_8054DFD
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 610, -88
    a_set_radius 4
    a_set_sprite_frame 0
L_8054DF2:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_8_KNGTSWRD_B, L_8054DF2
L_8054DFD:
    a_destroy

NPC_8054DFE:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -270, 222
    a_set_sprite_frame 5
L_8054E0E:
    a_wait 1
    a_jump L_8054E0E

NPC_8054E15:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -466, -42
    a_set_sprite_frame 3
L_8054E25:
    a_wait 1
    a_jump L_8054E25

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_MD_1, L_8054E71
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -366, 204
    a_set_radius 4
    a_set_sprite_frame 0
L_8054E66:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_MD_1, L_8054E66
L_8054E71:
    a_destroy

NPC_8054E72:
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_MD_2, L_8054E97
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -6, -156
    a_set_radius 4
    a_set_sprite_frame 0
L_8054E8C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_MD_2, L_8054E8C
L_8054E97:
    a_destroy

    .align 2, 0

NPC_8054E98:
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_MD_3, L_8054EBD
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 154, 132
    a_set_radius 4
    a_set_sprite_frame 0
L_8054EB2:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_MD_3, L_8054EB2
L_8054EBD:
    a_destroy

NPC_8054EBE:
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_MD_4, L_8054EE3
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 440, -154
    a_set_radius 4
    a_set_sprite_frame 0
L_8054ED8:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_MD_4, L_8054ED8
L_8054EE3:
    a_destroy

    .align 2, 0

NPC_8054EE4:
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_8000Z, L_8054F09
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -166, 2
    a_set_radius 4
    a_set_sprite_frame 0
L_8054EFE:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_8000Z, L_8054EFE
L_8054F09:
    a_destroy

NPC_8054F0A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_9_RECOV150_A, L_8054F2F
    a_init
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 250, 34
    a_set_radius 4
    a_set_sprite_frame 0
L_8054F24:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_9_RECOV150_A, L_8054F24
L_8054F2F:
    a_destroy

    .align 2, 0

NPC_8054F30:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -368, -70
    a_set_sprite_frame 7
L_8054F40:
    a_wait 1
    a_jump L_8054F40

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_MD_1, L_8054F91
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 394, -204
    a_set_radius 4
    a_set_sprite_frame 0
L_8054F86:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_MD_1, L_8054F86
L_8054F91:
    a_destroy

NPC_8054F92:
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_MD_2, L_8054FB7
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 8, 154
    a_set_radius 4
    a_set_sprite_frame 0
L_8054FAC:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_MD_2, L_8054FAC
L_8054FB7:
    a_destroy

    .align 2, 0

NPC_8054FB8:
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_MD_3, L_8054FDD
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 140, -236, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054FD2:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_MD_3, L_8054FD2
L_8054FDD:
    a_destroy

NPC_8054FDE:
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_MD_4, L_8055003
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 300, 200, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8054FF8:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_MD_4, L_8054FF8
L_8055003:
    a_destroy

    .align 2, 0

NPC_8055004:
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_5000Z, L_8055029
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 476, -190, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_805501E:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_5000Z, L_805501E
L_8055029:
    a_destroy

NPC_805502A:
    a_jump_if_flag FLAG_ITEM_UNDERNET_10_POWERUP, L_805504F
    a_init
    a_disable_turn
    a_set_dialog 0x21
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 50, 380, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8055044:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_10_POWERUP, L_8055044
L_805504F:
    a_destroy

    .align 2, 0

NPC_8055050:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -190, -182
    a_set_sprite_frame 7
L_8055060:
    a_wait 1
    a_jump L_8055060

NPC_8055067:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 264, -266
    a_set_sprite_frame 5
L_8055077:
    a_wait 1
    a_jump L_8055077

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_11_MD_1, L_80550C5
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -20, -72, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80550BA:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_11_MD_1, L_80550BA
L_80550C5:
    a_destroy

NPC_80550C6:
    a_jump_if_flag FLAG_ITEM_UNDERNET_11_MD_2, L_80550EB
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 208, 292, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_80550E0:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_11_MD_2, L_80550E0
L_80550EB:
    a_destroy

    .align 2, 0

NPC_80550EC:
    a_jump_if_flag FLAG_ITEM_UNDERNET_11_MD_3, L_8055111
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 210, 214, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8055106:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_11_MD_3, L_8055106
L_8055111:
    a_destroy

NPC_8055112:
    a_jump_if_flag FLAG_ITEM_UNDERNET_11_MD_4, L_8055137
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 104, -324
    a_set_radius 4
    a_set_sprite_frame 0
L_805512C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_11_MD_4, L_805512C
L_8055137:
    a_destroy

    .align 2, 0

NPC_8055138:
    a_jump_if_flag FLAG_ITEM_UNDERNET_11_REDWAVE_J, L_805515D
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 428, 154
    a_set_radius 4
    a_set_sprite_frame 0
L_8055152:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_11_REDWAVE_J, L_8055152
L_805515D:
    a_destroy

NPC_805515E:
    a_init
    a_set_dialog 0x0
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos 80, -160
    a_set_sprite_frame 5
L_805516E:
    a_wait 1
    a_jump L_805516E

NPC_8055175:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -266, -220, 64
    a_set_sprite_frame 5
L_8055185:
    a_wait 1
    a_jump L_8055185

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
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_1, L_80551E5
    a_init
    a_disable_turn
    a_set_dialog 0x32
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -220, -286
    a_set_radius 4
    a_set_sprite_frame 0
L_80551DA:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_1, L_80551DA
L_80551E5:
    a_destroy

NPC_80551E6:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_2, L_805520B
    a_init
    a_disable_turn
    a_set_dialog 0x36
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 254, -286
    a_set_radius 4
    a_set_sprite_frame 0
L_8055200:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_2, L_8055200
L_805520B:
    a_destroy

    .align 2, 0

NPC_805520C:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_3, L_8055231
    a_init
    a_disable_turn
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 254, 186
    a_set_radius 4
    a_set_sprite_frame 0
L_8055226:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_3, L_8055226
L_8055231:
    a_destroy

NPC_8055232:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_4, L_8055257
    a_init
    a_disable_turn
    a_set_dialog 0x3E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -218, 186
    a_set_radius 4
    a_set_sprite_frame 0
L_805524C:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_4, L_805524C
L_8055257:
    a_destroy

    .align 2, 0

NPC_8055258:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_5, L_805527D
    a_init
    a_disable_turn
    a_set_dialog 0x42
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -98, 58
    a_set_radius 4
    a_set_sprite_frame 0
L_8055272:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_5, L_8055272
L_805527D:
    a_destroy

NPC_805527E:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_6, L_80552A3
    a_init
    a_disable_turn
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 70, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8055298:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_6, L_8055298
L_80552A3:
    a_destroy

    .align 2, 0

NPC_80552A4:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_7, L_80552C9
    a_init
    a_disable_turn
    a_set_dialog 0x4A
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 434, 200
    a_set_radius 4
    a_set_sprite_frame 0
L_80552BE:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_7, L_80552BE
L_80552C9:
    a_destroy

NPC_80552CA:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_MD_8, L_80552EF
    a_init
    a_disable_turn
    a_set_dialog 0x4E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -266, -410
    a_set_radius 4
    a_set_sprite_frame 0
L_80552E4:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_MD_8, L_80552E4
L_80552EF:
    a_destroy

    .align 2, 0

NPC_80552F0:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_HEROSWRD_I, L_8055315
    a_init
    a_disable_turn
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos 364, 216, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_805530A:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_HEROSWRD_I, L_805530A
L_8055315:
    a_destroy

NPC_8055316:
    a_jump_if_flag FLAG_ITEM_UNDERNET_12_20000Z, L_805533B
    a_init
    a_disable_turn
    a_set_dialog 0x1F
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x1
    a_set_pos -28, 30, 64
    a_set_radius 4
    a_set_sprite_frame 0
L_8055330:
    a_set_no_z_clip
    a_clear_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_UNDERNET_12_20000Z, L_8055330
L_805533B:
    a_destroy

    .align 2, 0

NPC_805533C:
    a_init
    a_set_dialog 0x14
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -208, -56
    a_set_sprite_frame 5
L_805534C:
    a_wait 1
    a_jump L_805534C

NPC_8055353:
    a_init
    a_set_dialog 0x15
    a_set_palette 0x2
    a_set_sprite SP_Overworld_NormalNavi
    a_set_pos -84, -88
    a_set_sprite_frame 1
L_8055363:
    a_wait 1
    a_jump L_8055363

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
