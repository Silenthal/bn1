#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_803E5D0
    .word NPC_803E5D8
    .word 0xFF

    .align 2, 0

NPC_803E5D8:
    a_init
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_Higsby
    a_set_pos -44, 128
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_803E5F0
    .word NPC_803E5D8
    .word NPC_803E5FC
    .word 0xFF

    .align 2, 0

NPC_803E5FC:
    a_init
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_Dex
    a_set_pos 0, 128, 64
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_803E614
    .word NPC_803E620
    .word NPC_803E637
    .word 0xFF

    .align 2, 0

NPC_803E620:
    a_init
    a_set_sprite SP_Overworld_Chaud
    a_set_pos -194, 130, -64
    a_set_sprite_frame 11
    a_move d_nw, 16, 20
    a_stop

NPC_803E637:
    a_init
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -194, 110, -64
    a_set_sprite_frame 11
    a_move d_nw, 16, 20
    a_stop

    .align 2, 0

global_label NPCList_803E650
    .word NPC_803E668
    .word NPC_803E67B
    .word NPC_803E68E
    .word NPC_803E6A1
    .word NPC_803E6B4
    .word 0xFF

    .align 2, 0

NPC_803E668:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos 116, -42
    a_set_sprite_frame 1
    a_stop

NPC_803E67B:
    a_init
    a_set_sprite SP_Overworld_Yahoot
    a_set_pos 114, -68
    a_set_sprite_frame 5
    a_stop

NPC_803E68E:
    a_init
    a_set_sprite SP_Overworld_CountZap
    a_set_pos 54, -34
    a_set_sprite_frame 1
    a_stop

NPC_803E6A1:
    a_init
    a_set_sprite SP_Overworld_Madd
    a_set_pos 54, -54
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_803E6B4:
    a_init
    a_set_sprite SP_Overworld_Match
    a_set_pos 54, -14
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_803E6C8
    .word NPC_803E68E
    .word NPC_803E6A1
    .word NPC_803E6B4
    .word 0xFF

global_label NPCList_803E6D8
    .word NPC_803E6E0
    .word 0xFF

    .align 2, 0

NPC_803E6E0:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos 116, -42
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_803E6F4
    .word NPC_803E6E0
    .word NPC_803E67B
    .word NPC_803E68E
    .word NPC_803E6A1
    .word 0xFF

global_label NPCList_803E708
    .word NPC_803E740
    .word 0xFF

global_label NPCList_803E710
    .word NPC_803E7C5
    .word NPC_803E800
    .word 0xFF

global_label NPCList_803E71C
    .word NPC_803E813
    .word NPC_803E83C
    .word 0xFF

global_label NPCList_803E728
    .word NPC_803E84F
    .word NPC_803E877
    .word 0xFF

global_label NPCList_803E734
    .word NPC_803E89F
    .word NPC_803E8B4
    .word 0xFF

    .align 2, 0

NPC_803E740:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos 114, -42
    a_set_sprite_frame 5
L_803E74C:
    a_jump_if_flag 0x93, L_803E75A
    a_wait 1
    a_jump L_803E74C
L_803E75A:
    a_set_sprite_frame 12
L_803E75C:
    a_jump_if_not_flag 0x93, L_803E76A
    a_wait 1
    a_jump L_803E75C
L_803E76A:
    a_set_sprite_frame 13
    a_wait 1
    a_set_sprite_frame 14
L_803E770:
    a_jump_if_flag 0x93, L_803E77E
    a_wait 1
    a_jump L_803E770
L_803E77E:
    a_set_sprite_frame 11
    a_move d_nw, 8, 5
    a_set_sprite_frame 5
L_803E786:
    a_jump_if_not_flag 0x93, L_803E794
    a_wait 1
    a_jump L_803E786
L_803E794:
    a_set_sprite_frame 13
    a_wait 1
    a_set_sprite_frame 14
L_803E79A:
    a_jump_if_flag 0x93, L_803E7A8
    a_wait 1
    a_jump L_803E79A
L_803E7A8:
    a_set_sprite_frame 5
L_803E7AA:
    a_jump_if_not_flag 0x93, L_803E7B8
    a_wait 1
    a_jump L_803E7AA
L_803E7B8:
    a_set_sprite_frame 13
    a_wait 1
    a_set_sprite_frame 14
    a_stop

NPC_803E7C5:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos 30, -70
    a_set_sprite_frame 7
L_803E7D1:
    a_jump_if_flag 0x93, L_803E7DF
    a_wait 1
    a_jump L_803E7D1
L_803E7DF:
    a_set_sprite_frame 12
    a_wait 60
    a_set_sprite_frame 13
    a_wait 1
    a_set_sprite_frame 14
L_803E7E9:
    a_jump_if_not_flag 0x93, L_803E7F7
    a_wait 1
    a_jump L_803E7E9
L_803E7F7:
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_803E800:
    a_init
    a_set_sprite SP_Overworld_Yahoot
    a_set_pos 6, -48
    a_set_sprite_frame 7
    a_stop

NPC_803E813:
    a_init
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 114, 60
    a_set_sprite_frame 3
L_803E81F:
    a_jump_if_flag 0x96, L_803E82D
    a_wait 1
    a_jump L_803E81F
L_803E82D:
    a_set_sprite_frame 9
    a_move d_se, 8, 2
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_803E83C:
    a_init
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 126, 98
    a_set_sprite_frame 16
    a_stop

NPC_803E84F:
    a_init
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 0, -48
    a_set_sprite_frame 1
L_803E85B:
    a_jump_if_flag 0x96, L_803E869
    a_wait 1
    a_jump L_803E85B
L_803E869:
    a_set_no_z_clip
    a_set_sprite_frame 10
    a_move d_sw, 16, 10
    a_stop

NPC_803E877:
    a_init
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 0, -32
    a_set_sprite_frame 1
L_803E883:
    a_jump_if_flag 0xF9, L_803E891
    a_wait 1
    a_jump L_803E883
L_803E891:
    a_set_no_z_clip
    a_set_sprite_frame 10
    a_move d_sw, 16, 10
    a_stop

NPC_803E89F:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 120, 60
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_803E8B4:
    a_init
    a_set_dialog 0x9
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 120, 108
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

global_label NPCList_803E8CC
    .word NPC_803E8F0
    .word NPC_803E955
    .word 0xFF

global_label NPCList_803E8D8
    .word NPC_803E976
    .word 0xFF

global_label NPCList_803E8E0
    .word NPC_803E9ED
    .word 0xFF

global_label NPCList_803E8E8
    .word NPC_803EA00
    .word 0xFF

    .align 2, 0

NPC_803E8F0:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos -86, 92
    a_set_sprite_frame 1
L_803E8FC:
    a_jump_if_flag 0x93, L_803E90A
    a_wait 1
    a_jump L_803E8FC
L_803E90A:
    a_set_sprite_frame 12
    a_wait 60
    a_set_sprite_frame 13
    a_wait 2
    a_set_sprite_frame 14
L_803E914:
    a_jump_if_not_flag 0x93, L_803E922
    a_wait 1
    a_jump L_803E914
L_803E922:
    a_set_sprite_frame 5
L_803E924:
    a_jump_if_flag 0xF9, L_803E932
    a_wait 1
    a_jump L_803E924
L_803E932:
    a_wait 60
    a_set_sprite_frame 1
L_803E936:
    a_jump_if_flag 0x93, L_803E944
    a_wait 1
    a_jump L_803E936
L_803E944:
    a_set_sprite_frame 12
    a_wait 60
    a_set_sprite_frame 13
    a_wait 2
    a_set_sprite_frame 14
    a_stop

NPC_803E955:
    a_init
    a_set_sprite SP_Overworld_Yahoot
    a_set_pos -112, 110
    a_set_sprite_frame 1
L_803E961:
    a_jump_if_flag 0xF9, L_803E96F
    a_wait 1
    a_jump L_803E961
L_803E96F:
    a_set_sprite_frame 10
    a_move d_sw, 8, 20
    a_destroy

NPC_803E976:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos -20, 62
    a_set_sprite_frame 1
L_803E982:
    a_jump_if_flag 0x93, L_803E990
    a_wait 1
    a_jump L_803E982
L_803E990:
    a_set_sprite_frame 5
    a_wait 20
    a_set_sprite_frame 12
    a_wait 60
    a_set_sprite_frame 13
    a_wait 2
    a_set_sprite_frame 14
L_803E99E:
    a_jump_if_not_flag 0x93, L_803E9AC
    a_wait 1
    a_jump L_803E99E
L_803E9AC:
    a_set_sprite_frame 5
L_803E9AE:
    a_jump_if_flag 0x93, L_803E9BC
    a_wait 1
    a_jump L_803E9AE
L_803E9BC:
    a_set_sprite_frame 16
    a_wait 7
    a_set_sprite_frame 17
L_803E9C2:
    a_jump_if_not_flag 0x93, L_803E9D0
    a_wait 1
    a_jump L_803E9C2
L_803E9D0:
    a_set_sprite_frame 18
    a_wait 3
    a_set_sprite_frame 19
L_803E9D6:
    a_jump_if_flag 0x93, L_803E9E4
    a_wait 1
    a_jump L_803E9D6
L_803E9E4:
    a_set_sprite_frame 20
    a_stop

NPC_803E9ED:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos -20, 62
    a_set_sprite_frame 20
    a_stop

    .align 2, 0

NPC_803EA00:
    a_init
    a_set_sprite SP_Overworld_Wily
    a_set_pos -20, 62
    a_set_sprite_frame 1
L_803EA0C:
    a_jump_if_flag 0xF9, L_803EA1A
    a_wait 1
    a_jump L_803EA0C
L_803EA1A:
    a_set_sprite_frame 13
    a_wait 2
    a_set_sprite_frame 14
    a_stop

    .align 2, 0

global_label NPCList_803EA28
    .word NPC_803EA6C
    .word NPC_803EA81
    .word NPC_803EA96
    .word 0xFF

global_label NPCList_803EA38
    .word NPC_803EA6C
    .word NPC_803EA81
    .word NPC_803EA96
    .word NPC_803EAAD
    .word 0xFF

global_label NPCList_803EA4C
    .word NPC_803EA81
    .word NPC_803EA96
    .word NPC_803EAAD
    .word 0xFF

global_label NPCList_803EA5C
    .word NPC_803EAC2
    .word NPC_803EAD5
    .word NPC_803EAE8
    .word 0xFF

    .align 2, 0

NPC_803EA6C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Higsby
    a_set_pos -26, 182
    a_set_sprite_frame 5
    a_stop

NPC_803EA81:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_OldMan
    a_set_pos -26, 224
    a_set_sprite_frame 5
    a_stop

NPC_803EA96:
    a_init
    a_set_palette 0x1
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_Mari
    a_set_pos -26, 200
    a_set_sprite_frame 5
    a_stop

NPC_803EAAD:
    a_init
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_Yai
    a_set_pos -54, -110, 64
    a_set_sprite_frame 5
    a_stop

NPC_803EAC2:
    a_init
    a_set_sprite SP_Overworld_Higsby
    a_set_pos -26, 182
    a_set_sprite_frame 13
    a_stop

NPC_803EAD5:
    a_init
    a_set_sprite SP_Overworld_OldMan
    a_set_pos -26, 224
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_803EAE8:
    a_init
    a_set_palette 0x1
    a_set_sprite SP_Overworld_Mari
    a_set_pos -26, 200
    a_set_sprite_frame 13
    a_stop

    .align 2, 0

global_label NPCList_803EB00
    .word NPC_803EB08
    .word 0xFF

    .align 2, 0

NPC_803EB08:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_ManGovt
    a_set_pos -54, -110, 64
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label EntityAllocParams_803EB20
    entity Effect, 0x1, f(100, -104, 32), 0x41
    entity Effect, 0x1, f(52, -104, 32), 0x42
    entity Effect, 0x1, f(4, -104, 32), 0x43
    entity Effect, 0x1, f(-44, -104, 32), 0x44
    .word 0xFF
