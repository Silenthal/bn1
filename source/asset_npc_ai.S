    .include "constants.inc"
    .include "macros.inc"

    .text

PTR_DAT_08028964:
    .word DAT_08028984
    .word DAT_08028999
    .word DAT_080289B1
    .word DAT_080289D7
    .word DAT_080289EC
    .word DAT_08028A11
    .word DAT_08028A2B
    .word NPC_LIST_END


DAT_08028984:
    a_init
    a_set_dialog 0x6
    a_set_sprite OSP_Yai
    a_set_pos -134, -26
    a_set_sprite_frame 0x3
1:  a_wait 1
    a_jump 1b

DAT_08028999:
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite OSP_Car
    a_set_pos -12, -4
    a_set_radius 3
    a_set_sprite_frame 3
1:  a_wait 1
    a_jump 1b

DAT_080289B1:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x4
    a_set_pos 74, -44
    a_set_sprite_frame 3
1:  a_wait 1
    a_jump_if_not_flag 0xD0, 1b
    a_set_sprite_frame 10
    a_move d_sw, 32, 20
    a_set_sprite_frame 5
2:  a_wait 1
    a_jump 2b

DAT_080289D7:
    a_init
    a_set_dialog 0x0
    a_set_sprite OSP_Chaud
    a_set_pos 84, 90
    a_set_sprite_frame 5
1:  a_wait 1
    a_jump 1b

DAT_080289EC:
    a_init
    a_set_dialog 0x5
    a_set_sprite OSP_Chaud
    a_set_pos -142, 82
1:  a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 6
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 6
    a_jump 1b

DAT_08028A11:
    a_init
    a_sprite_mask_set_flag 4
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite OSP_Girl_2
    a_set_pos -12, 12
    a_set_radius 3
    a_set_sprite_frame 7
1:  a_wait 1
    a_jump 1b

DAT_08028A2B:
    a_init
    a_sprite_mask_set_flag 4
    a_set_dialog 0x4
    a_set_sprite OSP_Girl_2
    a_set_pos -118, 86
    a_set_sprite_frame 1
1:  a_wait 1
    a_jump 1b

