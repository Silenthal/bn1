#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_804B5C0
    .word NPC_804B5EC
    .word NPC_804B601
    .word NPC_804B628
    .word NPC_804B63D
    .word NPC_804B664
    .word NPC_804B681
    .word NPC_804B69E
    .word NPC_804B6C2
    .word NPC_804B6E6
    .word NPC_804B70A
    .word 0xFF

    .align 2, 0

NPC_804B5EC:
    a_init
    a_set_dialog 0x2C
    a_set_sprite SP_Overworld_Prog
    a_set_pos 284, 122, 18
    a_set_sprite_frame 1
L_804B5FA:
    a_wait 1
    a_jump L_804B5FA

NPC_804B601:
    a_init
    a_set_dialog 0x2D
    a_set_sprite SP_Overworld_Prog
    a_set_pos 224, 222
    a_set_sprite_frame 5
L_804B60F:
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_jump L_804B60F

    .align 2, 0

NPC_804B628:
    a_init
    a_set_dialog 0x33
    a_set_sprite SP_Overworld_Prog
    a_set_pos 450, -202, -64
    a_set_sprite_frame 5
L_804B636:
    a_wait 1
    a_jump L_804B636

NPC_804B63D:
    a_init
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_Prog
    a_set_pos 144, -164, -64
    a_set_sprite_frame 1
L_804B64B:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_jump L_804B64B

    .align 2, 0

NPC_804B664:
    a_init
    a_set_dialog 0x3B
    a_set_sprite SP_Overworld_Prog3
    a_set_pos -150, -228, -64
    a_set_sprite_frame 1
L_804B672:
    a_jump_if_flag 0xB3, L_804B680
    a_wait 1
    a_jump L_804B672
L_804B680:
    a_destroy

NPC_804B681:
    a_init
    a_set_dialog 0x3C
    a_set_sprite SP_Overworld_Prog3
    a_set_pos -528, 36, -64
    a_set_sprite_frame 3
L_804B68F:
    a_jump_if_flag 0xB4, L_804B69D
    a_wait 1
    a_jump L_804B68F
L_804B69D:
    a_destroy

NPC_804B69E:
    a_jump_if_flag 0x2C1, L_804B6C1
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 98, 204, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804B6B8:
    a_wait 1
    a_jump_if_not_flag 0x2C1, L_804B6B8
L_804B6C1:
    a_destroy

NPC_804B6C2:
    a_jump_if_flag 0x2C2, L_804B6E5
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 130, -180
    a_set_radius 4
    a_set_sprite_frame 0
L_804B6DC:
    a_wait 1
    a_jump_if_not_flag 0x2C2, L_804B6DC
L_804B6E5:
    a_destroy

NPC_804B6E6:
    a_jump_if_flag 0x2C3, L_804B709
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -92, 396, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804B700:
    a_wait 1
    a_jump_if_not_flag 0x2C3, L_804B700
L_804B709:
    a_destroy

NPC_804B70A:
    a_jump_if_flag 0x2C4, L_804B72D
    a_init
    a_disable_turn
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -444, 268, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804B724:
    a_wait 1
    a_jump_if_not_flag 0x2C4, L_804B724
L_804B72D:
    a_destroy

    .align 2, 0

global_label NPCList_804B730
    .word NPC_804B5EC
    .word NPC_804B628
    .word NPC_804B63D
    .word 0xFF

global_label NPCList_804B740
    .word NPC_804B69E
    .word NPC_804B6C2
    .word NPC_804B6E6
    .word NPC_804B70A
    .word 0xFF

global_label NPCList_804B754
    .word NPC_804B78C
    .word NPC_804B7A1
    .word NPC_804B7B6
    .word NPC_804B7CB
    .word NPC_804B7E0
    .word NPC_804B7FD
    .word NPC_804B81A
    .word NPC_804B83E
    .word NPC_804B862
    .word 0xFF

global_label NPCList_804B77C
    .word NPC_804B81A
    .word NPC_804B83E
    .word NPC_804B862
    .word 0xFF

    .align 2, 0

NPC_804B78C:
    a_init
    a_set_dialog 0x6A
    a_set_sprite SP_Overworld_Prog
    a_set_pos -420, -4
    a_set_sprite_frame 1
L_804B79A:
    a_wait 1
    a_jump L_804B79A

NPC_804B7A1:
    a_init
    a_set_dialog 0x64
    a_set_sprite SP_Overworld_Prog
    a_set_pos 50, -4
    a_set_sprite_frame 5
L_804B7AF:
    a_wait 1
    a_jump L_804B7AF

NPC_804B7B6:
    a_init
    a_set_dialog 0x63
    a_set_sprite SP_Overworld_Prog
    a_set_pos 180, -62
    a_set_sprite_frame 3
L_804B7C4:
    a_wait 1
    a_jump L_804B7C4

NPC_804B7CB:
    a_init
    a_set_dialog 0x6B
    a_set_sprite SP_Overworld_Prog
    a_set_pos 480, 94
    a_set_sprite_frame 3
L_804B7D9:
    a_wait 1
    a_jump L_804B7D9

    .align 2, 0

NPC_804B7E0:
    a_init
    a_set_dialog 0x76
    a_set_sprite SP_Overworld_Prog3
    a_set_pos -108, -164
    a_set_sprite_frame 7
L_804B7EE:
    a_jump_if_flag 0xCA, L_804B7FC
    a_wait 1
    a_jump L_804B7EE
L_804B7FC:
    a_destroy

NPC_804B7FD:
    a_init
    a_set_dialog 0x77
    a_set_sprite SP_Overworld_Prog3
    a_set_pos 274, -276
    a_set_sprite_frame 7
L_804B80B:
    a_jump_if_flag 0xCB, L_804B819
    a_wait 1
    a_jump L_804B80B
L_804B819:
    a_destroy

NPC_804B81A:
    a_jump_if_flag 0x2C5, L_804B83D
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -286, -370
    a_set_radius 4
    a_set_sprite_frame 0
L_804B834:
    a_wait 1
    a_jump_if_not_flag 0x2C5, L_804B834
L_804B83D:
    a_destroy

NPC_804B83E:
    a_jump_if_flag 0x2C6, L_804B861
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 442, -290, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804B858:
    a_wait 1
    a_jump_if_not_flag 0x2C6, L_804B858
L_804B861:
    a_destroy

NPC_804B862:
    a_jump_if_flag 0x2C7, L_804B885
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 310, -4
    a_set_radius 4
    a_set_sprite_frame 0
L_804B87C:
    a_wait 1
    a_jump_if_not_flag 0x2C7, L_804B87C
L_804B885:
    a_destroy

    .align 2, 0

global_label NPCList_804B888
    .word NPC_804B8C4
    .word NPC_804B8EB
    .word NPC_804B900
    .word NPC_804B915
    .word NPC_804B932
    .word NPC_804B94F
    .word NPC_804B96C
    .word NPC_804B989
    .word NPC_804B9AD
    .word NPC_804B9D1
    .word NPC_804B9E6
    .word 0xFF

global_label NPCList_804B8B8
    .word NPC_804B989
    .word NPC_804B9AD
    .word 0xFF

    .align 2, 0

NPC_804B8C4:
    a_init
    a_set_dialog 0x6A
    a_set_sprite SP_Overworld_Prog
    a_set_pos -302, -260, 96
    a_set_sprite_frame 1
L_804B8D2:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_jump L_804B8D2

NPC_804B8EB:
    a_init
    a_set_dialog 0x6B
    a_set_sprite SP_Overworld_Prog
    a_set_pos -110, -420, 96
    a_set_sprite_frame 3
L_804B8F9:
    a_wait 1
    a_jump L_804B8F9

    .align 2, 0

NPC_804B900:
    a_init
    a_set_dialog 0x71
    a_set_sprite SP_Overworld_Prog
    a_set_pos 530, -194
    a_set_sprite_frame 1
L_804B90E:
    a_wait 1
    a_jump L_804B90E

NPC_804B915:
    a_init
    a_set_dialog 0x7C
    a_set_sprite SP_Overworld_Prog3
    a_set_pos 242, -340
    a_set_sprite_frame 3
L_804B923:
    a_jump_if_flag 0xCC, L_804B94E
    a_wait 1
    a_jump L_804B923
    a_destroy

NPC_804B932:
    a_init
    a_set_dialog 0x7D
    a_set_sprite SP_Overworld_Prog3
    a_set_pos 50, -116
    a_set_sprite_frame 3
L_804B940:
    a_jump_if_flag 0xCD, L_804B94E
    a_wait 1
    a_jump L_804B940
L_804B94E:
    a_destroy

NPC_804B94F:
    a_init
    a_set_dialog 0x7E
    a_set_sprite SP_Overworld_Prog3
    a_set_pos 194, -130
    a_set_sprite_frame 1
L_804B95D:
    a_jump_if_flag 0xCE, L_804B96B
    a_wait 1
    a_jump L_804B95D
L_804B96B:
    a_destroy

    .align 2, 0

NPC_804B96C:
    a_init
    a_set_dialog 0x7F
    a_set_sprite SP_Overworld_Prog3
    a_set_pos 470, -320
    a_set_sprite_frame 5
L_804B97A:
    a_jump_if_flag 0xCF, L_804B988
    a_wait 1
    a_jump L_804B97A
L_804B988:
    a_destroy

NPC_804B989:
    a_jump_if_flag 0x2CA, L_804B9AC
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -300, -36, 96
    a_set_radius 4
    a_set_sprite_frame 0
L_804B9A3:
    a_wait 1
    a_jump_if_not_flag 0x2CA, L_804B9A3
L_804B9AC:
    a_destroy

NPC_804B9AD:
    a_jump_if_flag 0x2CC, L_804B9D0
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -172, -36, 96
    a_set_radius 4
    a_set_sprite_frame 0
L_804B9C7:
    a_wait 1
    a_jump_if_not_flag 0x2CC, L_804B9C7
L_804B9D0:
    a_destroy

NPC_804B9D1:
    a_init
    a_set_dialog 0x71
    a_set_sprite SP_Overworld_Prog
    a_set_pos -334, 254
    a_set_sprite_frame 1
L_804B9DF:
    a_wait 1
    a_jump L_804B9DF

NPC_804B9E6:
    a_init
    a_set_dialog 0x71
    a_set_sprite SP_Overworld_Prog
    a_set_pos 178, 190
    a_set_sprite_frame 1
L_804B9F4:
    a_wait 1
    a_jump L_804B9F4

    .align 2, 0

global_label NPCList_804B9FC
    .word NPC_804BA04
    .word 0xFF

    .align 2, 0

NPC_804BA04:
    a_init
    a_set_sprite SP_Overworld_ProtoMan
    a_set_pos 60, -398
    a_set_sprite_frame 19
L_804BA10:
    a_jump_if_flag 0xBE, L_804BA1E
    a_wait 1
    a_jump L_804BA10
L_804BA1E:
    a_set_sprite_frame 21
    a_wait 4
    a_move d_sw, 40, 2
    a_clear_flag 0xBE
    a_move d_sw, 40, 2
L_804BA2D:
    a_wait 1
    a_jump L_804BA2D

global_label NPCList_804BA34
    .word NPC_804BA3C
    .word 0xFF

    .align 2, 0

NPC_804BA3C:
    a_init
    a_set_sprite SP_Overworld_ProtoMan
    a_set_pos 60, -398
    a_set_sprite_frame 20
L_804BA48:
    a_jump_if_flag 0xBE, L_804BA56
    a_wait 1
    a_jump L_804BA48
L_804BA56:
    a_set_sprite_frame 24
L_804BA58:
    a_wait 1
    a_jump L_804BA58

    .align 2, 0

global_label NPCList_804BA60
    .word NPC_804BA8C
    .word NPC_804BAB3
    .word NPC_804BAC8
    .word NPC_804BAE5
    .word NPC_804BB09
    .word NPC_804BB2D
    .word 0xFF

global_label NPCList_804BA7C
    .word NPC_804BAE5
    .word NPC_804BB09
    .word NPC_804BB2D
    .word 0xFF

    .align 2, 0

NPC_804BA8C:
    a_init
    a_set_dialog 0x63
    a_set_sprite SP_Overworld_Prog
    a_set_pos 232, 164
    a_set_sprite_frame 5
L_804BA9A:
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_804BA9A

NPC_804BAB3:
    a_init
    a_set_dialog 0x73
    a_set_sprite SP_Overworld_Prog
    a_set_pos -278, 68
    a_set_sprite_frame 5
L_804BAC1:
    a_wait 1
    a_jump L_804BAC1

    .align 2, 0

NPC_804BAC8:
    a_init
    a_set_dialog 0x7E
    a_set_sprite SP_Overworld_Prog3
    a_set_pos -212, 354, -64
    a_set_sprite_frame 7
L_804BAD6:
    a_jump_if_flag 0xD0, L_804BAE4
    a_wait 1
    a_jump L_804BAD6
L_804BAE4:
    a_destroy

NPC_804BAE5:
    a_jump_if_flag 0x2CD, L_804BB08
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 170, 324
    a_set_radius 4
    a_set_sprite_frame 0
L_804BAFF:
    a_wait 1
    a_jump_if_not_flag 0x2CD, L_804BAFF
L_804BB08:
    a_destroy

NPC_804BB09:
    a_jump_if_flag 0x2CE, L_804BB2C
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos 362, 152
    a_set_radius 4
    a_set_sprite_frame 0
L_804BB23:
    a_wait 1
    a_jump_if_not_flag 0x2CE, L_804BB23
L_804BB2C:
    a_destroy

NPC_804BB2D:
    a_jump_if_flag 0x2CF, L_804BB50
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_MysteryData
    a_set_palette 0x0
    a_set_pos -114, 196, -64
    a_set_radius 4
    a_set_sprite_frame 0
L_804BB47:
    a_wait 1
    a_jump_if_not_flag 0x2CF, L_804BB47
L_804BB50:
    a_destroy

    .align 2, 0

global_label EntityAllocParams_804BB54
    entity Effect, 0x1, f(12, 124, 0), 0x3D
    entity Effect, 0x31, f(-40, 104, 0), 0xFF020050
    entity Attack, 0x40, f(52, 94, 0), 0xFFFFFF50
    entity Attack, 0x40, f(52, 126, 0), 0xFFFFFF51
    entity Attack, 0x40, f(52, 158, 0), 0xFFFFFF52
    .word 0xFF

global_label EntityAllocParams_804BBBC
    entity Effect, 0x1, f(12, 124, 0), 0x3D
    entity Effect, 0x31, f(-40, 104, 0), 0xFF020050
    .word 0xFF

global_label EntityAllocParams_804BBE8
    entity Effect, 0x1, f(-214, -4, 0), 0x3D
    entity Effect, 0x31, f(-272, 40, 0), 0xFF020060
    entity Effect, 0x31, f(-272, 96, 0), 0xFF000260
    entity Attack, 0x40, f(-156, -34, 0), 0xFFFFFF60
    entity Attack, 0x40, f(-156, -2, 0), 0xFFFFFF61
    entity Attack, 0x40, f(-156, 30, 0), 0xFFFFFF62
    entity Attack, 0x40, f(-108, -34, 0), 0xFFFFFF63
    entity Attack, 0x40, f(-108, -2, 0), 0xFFFFFF64
    entity Attack, 0x40, f(-108, 30, 0), 0xFFFFFF65
    entity Effect, 0x1, f(44, 316, 0), 0x3D
    entity Effect, 0x31, f(-16, 350, 0), 0xFF020070
    entity Effect, 0x31, f(-16, 384, 0), 0xFF010170
    entity Effect, 0x31, f(58, 384, 0), 0xFF000270
    entity Attack, 0x40, f(84, 254, 0), 0xFFFFFF70
    entity Attack, 0x40, f(84, 286, 0), 0xFFFFFF71
    entity Attack, 0x40, f(84, 318, 0), 0xFFFFFF72
    entity Attack, 0x40, f(116, 254, 0), 0xFFFFFF73
    entity Attack, 0x40, f(116, 286, 0), 0xFFFFFF74
    entity Attack, 0x40, f(116, 318, 0), 0xFFFFFF75
    entity Attack, 0x40, f(148, 254, 0), 0xFFFFFF76
    entity Attack, 0x40, f(148, 286, 0), 0xFFFFFF77
    entity Attack, 0x40, f(148, 318, 0), 0xFFFFFF78
    .word 0xFF

global_label EntityAllocParams_804BDA4
    entity Effect, 0x1, f(-214, -4, 0), 0x3D
    entity Effect, 0x31, f(-272, 40, 0), 0xFF020060
    entity Effect, 0x31, f(-272, 96, 0), 0xFF000260
    entity Effect, 0x1, f(44, 316, 0), 0x3D
    entity Effect, 0x31, f(-16, 350, 0), 0xFF020070
    entity Effect, 0x31, f(-16, 384, 0), 0xFF010170
    entity Effect, 0x31, f(58, 384, 0), 0xFF000270
    .word 0xFF

global_label EntityAllocParams_804BE34
    entity Effect, 0x1, f(434, -82, 0), 0x3D
    entity Effect, 0x31, f(334, -66, 0), 0xFF020080
    entity Effect, 0x31, f(334, 24, 0), 0xFF000280
    entity Effect, 0x31, f(338, 98, 0), 0xFF010180
    entity Attack, 0x40, f(404, -50, 0), 0xFFFFFF80
    entity Attack, 0x40, f(404, -2, 0), 0xFFFFFF81
    entity Attack, 0x40, f(404, 46, 0), 0xFFFFFF82
    entity Attack, 0x40, f(436, -50, 0), 0xFFFFFF83
    entity Attack, 0x40, f(436, -2, 0), 0xFFFFFF84
    entity Attack, 0x40, f(436, 46, 0), 0xFFFFFF85
    entity Attack, 0x40, f(468, -50, 0), 0xFFFFFF86
    entity Attack, 0x40, f(468, -2, 0), 0xFFFFFF87
    entity Attack, 0x40, f(468, 46, 0), 0xFFFFFF88
    entity Effect, 0x1, f(4, 44, 0), 0x3D
    entity Effect, 0x31, f(170, 166, 0), 0xFF020090
    entity Effect, 0x31, f(-50, 222, 0), 0xFF010190
    entity Effect, 0x31, f(14, 256, 0), 0xFF000290
    entity Attack, 0x40, f(36, 62, 0), 0xFFFFFF90
    entity Attack, 0x40, f(36, 110, 0), 0xFFFFFF91
    entity Attack, 0x40, f(36, 158, 0), 0xFFFFFF92
    entity Attack, 0x40, f(68, 62, 0), 0xFFFFFF93
    entity Attack, 0x40, f(68, 110, 0), 0xFFFFFF94
    entity Attack, 0x40, f(68, 158, 0), 0xFFFFFF95
    entity Attack, 0x40, f(100, 62, 0), 0xFFFFFF96
    entity Attack, 0x40, f(100, 110, 0), 0xFFFFFF97
    entity Attack, 0x40, f(100, 158, 0), 0xFFFFFF98
    entity Effect, 0x1, f(-316, 148, 0), 0x3D
    entity Effect, 0x31, f(-110, 72, 0), 0xFF0200A0
    entity Effect, 0x31, f(-368, 120, 0), 0xFF0101A0
    entity Effect, 0x31, f(-310, 288, 0), 0xFF0002A0
    entity Attack, 0x40, f(-268, 126, 0), 0xFFFFFFA0
    entity Attack, 0x40, f(-268, 174, 0), 0xFFFFFFA1
    entity Attack, 0x40, f(-268, 222, 0), 0xFFFFFFA2
    entity Attack, 0x40, f(-236, 126, 0), 0xFFFFFFA3
    entity Attack, 0x40, f(-236, 174, 0), 0xFFFFFFA4
    entity Attack, 0x40, f(-236, 222, 0), 0xFFFFFFA5
    entity Attack, 0x40, f(-204, 126, 0), 0xFFFFFFA6
    entity Attack, 0x40, f(-204, 174, 0), 0xFFFFFFA7
    entity Attack, 0x40, f(-204, 222, 0), 0xFFFFFFA8
    entity Attack, 0x40, f(-172, 126, 0), 0xFFFFFFA9
    entity Attack, 0x40, f(-172, 174, 0), 0xFFFFFFAA
    entity Attack, 0x40, f(-172, 222, 0), 0xFFFFFFAB
    entity Effect, 0x1, f(-116, 378, 0), 0x3D
    entity Effect, 0x31, f(-22, 358, 0), 0xFF0200B0
    entity Attack, 0x40, f(-76, 382, 0), 0xFFFFFFB0
    .word 0xFF

global_label EntityAllocParams_804C1BC
    entity Effect, 0x1, f(434, -82, 0), 0x3D
    entity Effect, 0x31, f(334, -66, 0), 0xFF020080
    entity Effect, 0x31, f(334, 24, 0), 0xFF000280
    entity Effect, 0x31, f(338, 98, 0), 0xFF010180
    entity Effect, 0x1, f(4, 44, 0), 0x3D
    entity Effect, 0x31, f(170, 166, 0), 0xFF020090
    entity Effect, 0x31, f(-50, 222, 0), 0xFF010190
    entity Effect, 0x31, f(14, 256, 0), 0xFF000290
    entity Effect, 0x1, f(-316, 148, 0), 0x3D
    entity Effect, 0x31, f(-110, 72, 0), 0xFF0200A0
    entity Effect, 0x31, f(-368, 120, 0), 0xFF0101A0
    entity Effect, 0x31, f(-310, 288, 0), 0xFF0002A0
    entity Effect, 0x1, f(-116, 378, 0), 0x3D
    entity Effect, 0x31, f(-22, 358, 0), 0xFF0200B0
    .word 0xFF

global_label EntityAllocParams_804C2D8
    entity Effect, 0x1, f(-94, -26, 0), 0x3D
    entity Effect, 0x31, f(-126, -82, 0), 0xFF0200C0
    entity Effect, 0x31, f(-62, -82, 0), 0xFF0101C0
    entity Effect, 0x31, f(-22, -82, 0), 0xFF0002C0
    entity Attack, 0x40, f(-52, -26, 0), 0xFFFFFFC0
    entity Attack, 0x40, f(-52, 22, 0), 0xFFFFFFC1
    entity Attack, 0x40, f(-52, 70, 0), 0xFFFFFFC2
    entity Attack, 0x40, f(-20, -26, 0), 0xFFFFFFC3
    entity Attack, 0x40, f(-20, 22, 0), 0xFFFFFFC4
    entity Attack, 0x40, f(-20, 70, 0), 0xFFFFFFC5
    entity Attack, 0x40, f(12, -26, 0), 0xFFFFFFC6
    entity Attack, 0x40, f(12, 22, 0), 0xFFFFFFC7
    entity Attack, 0x40, f(12, 70, 0), 0xFFFFFFC8
    entity Attack, 0x40, f(44, -26, 0), 0xFFFFFFC9
    entity Attack, 0x40, f(44, 22, 0), 0xFFFFFFCA
    entity Attack, 0x40, f(44, 70, 0), 0xFFFFFFCB
global_label EntityAllocParams_804C418
    entity Effect, 0x1, f(-94, -26, 0), 0x3D
    entity Effect, 0x31, f(-126, -82, 0), 0xFF0200C0
    entity Effect, 0x31, f(-62, -82, 0), 0xFF0101C0
    entity Effect, 0x31, f(-22, -82, 0), 0xFF0002C0
    .word 0xFF

PTR_DAT_0804c46c:
    .word DAT_0804c48c
    .word DAT_0804c4bc
    .word DAT_0804c4ec
    .word DAT_0804c51c
    .word DAT_0804c54c
    .word DAT_0804c57c
    .word DAT_0804c5ac
    .word DAT_0804c5dc

DAT_0804c48c:
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
DAT_0804c4bc:
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
DAT_0804c4ec:
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
DAT_0804c51c:
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
DAT_0804c54c:
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
DAT_0804c57c:
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
DAT_0804c5ac:
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
DAT_0804c5dc:
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1


_ts FUN_0804c60c
    push       {lr}
    ldr        r0,PTR_Struct_2002070_0804c698
    mov        r1,#0xa0
    bl         memset0_32
    ldr        r0,PTR_Struct_2002070_0804c698
    add        r0,#0x4
    mov        r1,#0x8
    mov        r2,#0x0
    bl         memset
    pop        {pc}


_ts PowerPlant_Init
    push       {lr}
    mov        r0,#0x9
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0x50
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0xa
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0x51
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0xb
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0x52
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0xc
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0x53
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0xd
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0x54
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#0xd8
    bl         Flag_ClearBase
    mov        r0,#0xd9
    bl         Flag_ClearBase
    mov        r0,#0xda
    bl         Flag_ClearBase
    mov        r0,#0xdb
    bl         Flag_ClearBase
    mov        r0,#0xdc
    bl         Flag_ClearBase
    pop        {pc}

    .align 2, 0

PTR_Struct_2002070_0804c698:
    .word 0x2002070


_ts FUN_0804c69c
    push       {lr}
    mov        r0,#0x50
    bl         FUN_0804c6d0
    mov        r0,#0x60
    bl         FUN_0804c6d0
    mov        r0,#0x70
    bl         FUN_0804c6d0
    mov        r0,#0x80
    bl         FUN_0804c6d0
    mov        r0,#0x90
    bl         FUN_0804c6d0
    mov        r0,#0xa0
    bl         FUN_0804c6d0
    mov        r0,#0xb0
    bl         FUN_0804c6d0
    mov        r0,#0xc0
    bl         FUN_0804c6d0
    pop        {pc}


_ts FUN_0804c6d0
    push       {lr}
    ldr        r5,PTR_Struct_2002070_0804c724
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    ldr        r7,PTR_DAT_0804c728
    ldrb       r7,[r7,r0]
    mov        r7,#0x3
    add        r0,#0x4
    add        r6,r0,#0x0
    ldrb       r2,[r5,r0]
    sub        sp,#0x4
    mov        r0,sp
    mov        r1,#0x0
    strb       r1,[r0,#0x0]
    mov        r1,#0x1
    strb       r1,[r0,#0x1]
    mov        r1,#0x2
    strb       r1,[r0,#0x2]
    push       {r0,r2,r6,r7}
    add        r1,r7,#0x0
    mov        r2,#0x4
    bl         ArrayShuffle
    pop        {r0,r2,r6,r7}
    mov        r4,#0x0
LAB_0804c702:
    ldrb       r1,[r0,r4]
    cmp        r1,r2
    bne        LAB_0804c714
    add        r4,#0x1
    cmp        r4,r7
    bge        LAB_0804c714
    cmp        r4,#0x3
    blt        LAB_0804c702
    mov        r1,#0x0
LAB_0804c714:
    strb       r1,[r5,r6]
    add        sp,#0x4
    pop        {pc}

    .align 2, 0

DAT_0804c71c:
    .byte 0x01
    .byte 0x02
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x03
    .byte 0x01
    .byte 0x03

PTR_Struct_2002070_0804c724:
    .word 0x2002070

PTR_DAT_0804c728:
    .word DAT_0804c71c


_ts FUN_0804c72c
    push       {lr}
    ldr        r5,PTR_Struct_2002070_0804c76c
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    add        r6,r0,#0x0
    add        r0,#0x4
    ldrb       r2,[r5,r0]
    ldr        r7,PTR_PTR_DAT_0804c770
    lsl        r6,r6,#0x2
    ldr        r7,[r7,r6]
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    lsr        r6,r6,#0x2
    add        r4,r5,#0x0
    add        r4,#0x20
    lsl        r6,r6,#0x4
    add        r4,r4,r6
    mov        r0,#0x0
    mov        r3,#0x0
LAB_0804c752:
    ldrb       r2,[r7,r0]
    cmp        r2,#0xff
    beq        LAB_0804c760
    ldrb       r1,[r4,r0]
    tst        r1,r1
    beq        LAB_0804c760
    add        r3,#0x1
LAB_0804c760:
    add        r0,#0x1
    cmp        r0,#0x10
    blt        LAB_0804c752
    add        r0,r3,#0x0
    pop        {pc}

    .align 2, 0

PTR_Struct_2002070_0804c76c:
    .word 0x2002070

PTR_PTR_DAT_0804c770:
    .word PTR_DAT_0804c46c


_ts FUN_0804c774
    push       {lr}
    ldr        r5,PTR_Struct_2002070_0804c7b4
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    add        r6,r0,#0x0
    add        r0,#0x4
    ldrb       r2,[r5,r0]
    ldr        r7,PTR_PTR_DAT_0804c7b8
    lsl        r6,r6,#0x2
    ldr        r7,[r7,r6]
    lsl        r2,r2,#0x4
    add        r7,r7,r2
    lsr        r6,r6,#0x2
    add        r4,r5,#0x0
    add        r4,#0x20
    lsl        r6,r6,#0x4
    add        r4,r4,r6
    mov        r0,#0x0
    mov        r3,#0x0
LAB_0804c79a:
    ldrb       r2,[r7,r0]
    cmp        r2,r1
    bne        LAB_0804c7aa
    ldrb       r1,[r4,r0]
    tst        r1,r1
    beq        LAB_0804c7b0
    mov        r0,#0x0
    pop        {pc}
LAB_0804c7aa:
    add        r0,#0x1
    cmp        r0,#0x10
    blt        LAB_0804c79a
LAB_0804c7b0:
    mov        r0,#0x1
    pop        {pc}

PTR_Struct_2002070_0804c7b4:
    .word 0x2002070

PTR_PTR_DAT_0804c7b8:
    .word PTR_DAT_0804c46c


_ts FUN_0804c7bc
    sub        r0,#0x50
    lsl        r2,r0,#0x1c
    lsr        r2,r2,#0x1c
    lsr        r0,r0,#0x4
    ldr        r7,PTR_Struct_2002070_0804c864
    add        r7,#0x20
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    strb       r1,[r7,r2]
    mov        pc,lr


_ts FUN_0804c7d0
    sub        r0,#0x50
    lsl        r2,r0,#0x1c
    lsr        r2,r2,#0x1c
    lsr        r0,r0,#0x4
    ldr        r7,PTR_Struct_2002070_0804c864
    add        r7,#0x20
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    mov        r1,#0x0
    strb       r1,[r7,r2]
    mov        pc,lr

    .align 2, 0


_ts FUN_0804c7e8
    sub        r0,#0x50
    lsl        r2,r0,#0x1c
    lsr        r2,r2,#0x1c
    lsr        r0,r0,#0x4
    ldr        r7,PTR_Struct_2002070_0804c864
    add        r7,#0x20
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    ldrb       r0,[r7,r2]
    tst        r0,r0
    mov        pc,lr

    .align 2, 0


_ts FUN_0804c800
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    mov        r1,#0x80
    lsr        r1,r0
    ldr        r7,PTR_Struct_2002070_0804c864
    ldr        r0,[r7,#0xc]
    orr        r0,r1
    str        r0,[r7,#0xc]
    mov        pc,lr

    .align 2, 0


_ts FUN_0804c814
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    mov        r1,#0x80
    lsr        r1,r0
    ldr        r7,PTR_Struct_2002070_0804c864
    ldr        r0,[r7,#0xc]
    bic        r0,r1
    str        r0,[r7,#0xc]
    mov        pc,lr

    .align 2, 0


_ts FUN_0804c828
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    mov        r1,#0x80
    lsr        r1,r0
    ldr        r7,PTR_Struct_2002070_0804c864
    ldr        r0,[r7,#0xc]
    tst        r0,r1
    mov        pc,lr


_ts FUN_0804c838
    push       {lr}
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    ldr        r7,PTR_Struct_2002070_0804c864
    add        r7,#0x20
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    mov        r2,#0x0
LAB_0804c848:
    ldrb       r0,[r7,r2]
    tst        r0,r0
    beq        LAB_0804c85a
    push       {r2,r7}
    add        r0,#0x47
    mov        r1,#0x1
    bl         KeyItem_SubtractAmount
    pop        {r2,r7}
LAB_0804c85a:
    add        r2,#0x1
    cmp        r2,#0x10
    blt        LAB_0804c848
    pop        {pc}

    .align 2, 0

PTR_Struct_2002070_0804c864:
    .word 0x2002070


_ts FUN_0804c868
    push       {lr}
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    ldr        r7,PTR_Struct_2002070_0804cc48
    add        r7,#0x20
    lsl        r0,r0,#0x4
    add        r7,r7,r0
    mov        r2,#0x0
    mov        r6,#0x0
LAB_0804c87a:
    ldrb       r0,[r7,r2]
    tst        r0,r0
    beq        LAB_0804c890
    push       {r2,r6,r7}
    add        r0,#0x47
    bl         KeyItem_IsPresent
    pop        {r2,r6,r7}
    add        r6,r6,r0
    tst        r0,r0
    beq        LAB_0804c89e
LAB_0804c890:
    add        r2,#0x1
    cmp        r2,#0x10
    blt        LAB_0804c87a
    tst        r6,r6
    beq        LAB_0804c89e
    mov        r0,#0x1
    pop        {pc}
LAB_0804c89e:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0


_ts FUN_0804c8a4
    push       {lr}
    add        r6,r0,#0x0
    sub        r6,#0x50
    lsr        r6,r6,#0x4
    lsl        r6,r6,#0x2
    ldr        r7,PTR_PTR_FUN_0804c8d8_0804cc4c
    ldr        r7,[r7,r6]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_FUN_0804c8d8_0804c8b8:
    .word FUN_0804c8d8
    .word FUN_0804c8fc
    .word FUN_0804c928
    .word FUN_0804c958
    .word FUN_0804c988
    .word FUN_0804c9b8
    .word FUN_0804c9e8
    .word FUN_0804ca18


_ts FUN_0804c8d8
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c8ea
    bl         FUN_0804ca5c
    b          LAB_0804c8fa
LAB_0804c8ea:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc50
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c8fa:
    pop        {pc}


_ts FUN_0804c8fc
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c90e
    bl         FUN_0804ca5c
    b          LAB_0804c924
LAB_0804c90e:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc54
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x2
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c924:
    pop        {pc}

    .align 2, 0


_ts FUN_0804c928
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c93a
    bl         FUN_0804cae8
    b          LAB_0804c956
LAB_0804c93a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049E48_0804cc58
    bl         BgTask_AddNew
    mov        r0,#0x3
    bl         Flag_Clear380
    mov        r0,#0x4
    bl         Flag_Clear380
    mov        r0,#0x5
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c956:
    pop        {pc}


_ts FUN_0804c958
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c96a
    bl         FUN_0804ca5c
    b          LAB_0804c986
LAB_0804c96a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc5c
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x2
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c986:
    pop        {pc}


_ts FUN_0804c988
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c99a
    bl         FUN_0804cae8
    b          LAB_0804c9b6
LAB_0804c99a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049E48_0804cc60
    bl         BgTask_AddNew
    mov        r0,#0x3
    bl         Flag_Clear380
    mov        r0,#0x4
    bl         Flag_Clear380
    mov        r0,#0x5
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c9b6:
    pop        {pc}


_ts FUN_0804c9b8
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804c9ca
    bl         FUN_0804cb74
    b          LAB_0804c9e6
LAB_0804c9ca:
    push       {r5}
    ldr        r0,PTR_BgTask_8049F08_0804cc64
    bl         BgTask_AddNew
    mov        r0,#0x6
    bl         Flag_Clear380
    mov        r0,#0x7
    bl         Flag_Clear380
    mov        r0,#0x8
    bl         Flag_Clear380
    pop        {r5}
LAB_0804c9e6:
    pop        {pc}


_ts FUN_0804c9e8
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804ca06
    push       {r5}
    ldr        r0,PTR_BgTask_8049FE0_0804cc68
    bl         BgTask_AddNew
    mov        r0,#0x9
    bl         Flag_Set380
    pop        {r5}
    b          LAB_0804ca16
LAB_0804ca06:
    push       {r5}
    ldr        r0,PTR_BgTask_8049FC8_0804cc6c
    bl         BgTask_AddNew
    mov        r0,#0x9
    bl         Flag_Clear380
    pop        {r5}
LAB_0804ca16:
    pop        {pc}


_ts FUN_0804ca18
    push       {lr}
    push       {r0}
    bl         FUN_0804c828
    pop        {r0}
    beq        LAB_0804ca3c
    push       {r0}
    bl         FUN_0804ca5c
    pop        {r0}
    bl         FUN_0804c72c
    cmp        r0,#0x3
    bne        LAB_0804ca58
    mov        r0,#0xd7
    bl         Flag_SetBase
    b          LAB_0804ca58
LAB_0804ca3c:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc70
    bl         BgTask_AddNew
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    mov        r0,#0x2
    bl         Flag_Clear380
    pop        {r5}
LAB_0804ca58:
    pop        {pc}

    .align 2, 0


_ts FUN_0804ca5c
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804ca78
    push       {r0,r1,r5}
    mov        r0,#0x0
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x1
LAB_0804ca78:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x1
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804ca94
    push       {r0,r1,r5}
    mov        r0,#0x1
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x2
LAB_0804ca94:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x2
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cab0
    push       {r0,r1,r5}
    mov        r0,#0x2
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x4
LAB_0804cab0:
    pop        {r2}
    add        r1,r1,r2
    pop        {r2}
    add        r1,r1,r2
    ldr        r7,PTR_PTR_0804cc74
    lsl        r1,r1,#0x2
    ldr        r0,[r7,r1]
    push       {r5}
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_BgTask_8049D88_0804cac8:
    .word BgTask_8049D88
    .word BgTask_8049DA0
    .word BgTask_8049DB8
    .word BgTask_8049DE8
    .word BgTask_8049DD0
    .word BgTask_8049E00
    .word BgTask_8049E18
    .word BgTask_8049E30


_ts FUN_0804cae8
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb04
    push       {r0,r1,r5}
    mov        r0,#0x3
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x1
LAB_0804cb04:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x1
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb20
    push       {r0,r1,r5}
    mov        r0,#0x4
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x2
LAB_0804cb20:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x2
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb3c
    push       {r0,r1,r5}
    mov        r0,#0x5
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x4
LAB_0804cb3c:
    pop        {r2}
    add        r1,r1,r2
    pop        {r2}
    add        r1,r1,r2
    ldr        r7,PTR_PTR_0804cc78
    lsl        r1,r1,#0x2
    ldr        r0,[r7,r1]
    push       {r5}
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_BgTask_8049E48_0804cb54:
    .word BgTask_8049E48
    .word BgTask_8049E60
    .word BgTask_8049E78
    .word BgTask_8049EA8
    .word BgTask_8049E90
    .word BgTask_8049EC0
    .word BgTask_8049ED8
    .word BgTask_8049EF0


_ts FUN_0804cb74
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb90
    push       {r0,r1,r5}
    mov        r0,#0x6
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x1
LAB_0804cb90:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x1
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cbac
    push       {r0,r1,r5}
    mov        r0,#0x7
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x2
LAB_0804cbac:
    push       {r1}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x2
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cbc8
    push       {r0,r1,r5}
    mov        r0,#0x8
    bl         Flag_Set380
    pop        {r0,r1,r5}
    mov        r1,#0x4
LAB_0804cbc8:
    pop        {r2}
    add        r1,r1,r2
    pop        {r2}
    add        r1,r1,r2
    ldr        r7,PTR_PTR_0804cc7c
    lsl        r1,r1,#0x2
    ldr        r0,[r7,r1]
    push       {r5}
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}

PTR_BgTask_8049F08_0804cbe0:
    .word BgTask_8049F08
    .word BgTask_8049F20
    .word BgTask_8049F38
    .word BgTask_8049F68
    .word BgTask_8049F50
    .word BgTask_8049F80
    .word BgTask_8049F98
    .word BgTask_8049FB0


_ts FUN_0804cc00
    push       {lr}
    push       {r0}
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    add        r0,#0x10
    ldr        r7,DAT_0804cc44
    ldrb       r1,[r7,r0]
    cmp        r1,#0xe
    pop        {r2}
    bge        LAB_0804cc1c
    add        r1,#0x1
    strb       r1,[r7,r0]
    mov        r0,#0x0
    pop        {pc}
LAB_0804cc1c:
    mov        r1,#0x0
    strb       r1,[r7,r0]
    add        r0,r2,#0x0
    bl         FUN_0804c6d0
    mov        r0,#0x1
    pop        {pc}

    .align 2, 0


_ts FUN_0804cc2c
    push       {lr}
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    add        r0,#0x10
    ldr        r7,DAT_0804cc44
    ldrb       r1,[r7,r0]
    cmp        r1,#0xe
    bge        LAB_0804cc40
    mov        r0,#0x0
    pop        {pc}
LAB_0804cc40:
    mov        r0,#0x1
    pop        {pc}

DAT_0804cc44:
    .word 0x2002070

PTR_Struct_2002070_0804cc48:
    .word 0x2002070

PTR_PTR_FUN_0804c8d8_0804cc4c:
    .word PTR_FUN_0804c8d8_0804c8b8

PTR_BgTask_8049D88_0804cc50:
    .word BgTask_8049D88

PTR_BgTask_8049D88_0804cc54:
    .word BgTask_8049D88

PTR_BgTask_8049E48_0804cc58:
    .word BgTask_8049E48

PTR_BgTask_8049D88_0804cc5c:
    .word BgTask_8049D88

PTR_BgTask_8049E48_0804cc60:
    .word BgTask_8049E48

PTR_BgTask_8049F08_0804cc64:
    .word BgTask_8049F08

PTR_BgTask_8049FE0_0804cc68:
    .word BgTask_8049FE0

PTR_BgTask_8049FC8_0804cc6c:
    .word BgTask_8049FC8

PTR_BgTask_8049D88_0804cc70:
    .word BgTask_8049D88

PTR_PTR_0804cc74:
    .word PTR_BgTask_8049D88_0804cac8

PTR_PTR_0804cc78:
    .word PTR_BgTask_8049E48_0804cb54

PTR_PTR_0804cc7c:
    .word PTR_BgTask_8049F08_0804cbe0
