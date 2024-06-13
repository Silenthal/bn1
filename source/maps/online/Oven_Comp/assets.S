#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8043A38
    .word NPC_8043A74
    .word NPC_8043A89
    .word NPC_8043A9E
    .word NPC_8043AB3
    .word NPC_8043AC8
    .word NPC_8043ADE
    .word NPC_8043AF4
    .word NPC_8043B0A
    .word NPC_8043B20
    .word NPC_8043B44
    .word NPC_8043B68
    .word NPC_8043B8C
    .word NPC_8043BB0
    .word NPC_8043BD4
    .word 0xFF

    .align 2, 0

NPC_8043A74:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos 328, 92
    a_set_sprite_frame 3
L_8043A82:
    a_wait 1
    a_jump L_8043A82

NPC_8043A89:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Prog
    a_set_pos 422, 136
    a_set_sprite_frame 5
L_8043A97:
    a_wait 1
    a_jump L_8043A97

NPC_8043A9E:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_Prog
    a_set_pos 364, 177
    a_set_sprite_frame 7
L_8043AAC:
    a_wait 1
    a_jump L_8043AAC

NPC_8043AB3:
    a_init
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_Prog
    a_set_pos 150, 110
    a_set_sprite_frame 1
L_8043AC1:
    a_wait 1
    a_jump L_8043AC1

    .align 2, 0

NPC_8043AC8:
    a_init
    a_disable_turn
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_Prog
    a_set_pos -30, 175
    a_set_sprite_frame 15
L_8043AD7:
    a_wait 1
    a_jump L_8043AD7

NPC_8043ADE:
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_Prog
    a_set_pos -45, 78
    a_set_sprite_frame 12
L_8043AED:
    a_wait 1
    a_jump L_8043AED

    .align 2, 0

NPC_8043AF4:
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_Prog
    a_set_pos -42, -354
    a_set_sprite_frame 13
L_8043B03:
    a_wait 1
    a_jump L_8043B03

NPC_8043B0A:
    a_init
    a_disable_turn
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_Prog
    a_set_pos -372, -135
    a_set_sprite_frame 12
L_8043B19:
    a_wait 1
    a_jump L_8043B19

    .align 2, 0

NPC_8043B20:
    a_jump_if_flag 0x285, L_8043B43
    a_init
    a_disable_turn
    a_set_dialog 0x18
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -384, 130
    a_set_radius 4
    a_set_sprite_frame 0
L_8043B3A:
    a_wait 1
    a_jump_if_not_flag 0x285, L_8043B3A
L_8043B43:
    a_destroy

    .align 2, 0

NPC_8043B44:
    a_jump_if_flag 0x287, L_8043B67
    a_init
    a_disable_turn
    a_set_dialog 0x10
    a_set_sprite 0xE3
    a_set_palette 0x1
    a_set_pos 134, 48
    a_set_radius 4
    a_set_sprite_frame 0
L_8043B5E:
    a_wait 1
    a_jump_if_not_flag 0x287, L_8043B5E
L_8043B67:
    a_destroy

    .align 2, 0

NPC_8043B68:
    a_jump_if_flag 0x288, L_8043B8B
    a_init
    a_disable_turn
    a_set_dialog 0x11
    a_set_sprite 0xE3
    a_set_palette 0x2
    a_set_pos 6, 98
    a_set_radius 4
    a_set_sprite_frame 0
L_8043B82:
    a_wait 1
    a_jump_if_not_flag 0x288, L_8043B82
L_8043B8B:
    a_destroy

    .align 2, 0

NPC_8043B8C:
    a_jump_if_flag 0x289, L_8043BAF
    a_init
    a_disable_turn
    a_set_dialog 0x12
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos -116, -355
    a_set_radius 4
    a_set_sprite_frame 0
L_8043BA6:
    a_wait 1
    a_jump_if_not_flag 0x289, L_8043BA6
L_8043BAF:
    a_destroy

    .align 2, 0

NPC_8043BB0:
    a_jump_if_flag 0x28A, L_8043BD3
    a_init
    a_disable_turn
    a_set_dialog 0x13
    a_set_sprite 0xE3
    a_set_palette 0x1
    a_set_pos -196, 28
    a_set_radius 1
    a_set_sprite_frame 0
L_8043BCA:
    a_wait 1
    a_jump_if_not_flag 0x28A, L_8043BCA
L_8043BD3:
    a_destroy

    .align 2, 0

NPC_8043BD4:
    a_init
    a_set_dialog 0x1D
    a_set_sprite SP_Overworld_Prog
    a_set_pos -424, 138
    a_set_sprite_frame 7
L_8043BE2:
    a_wait 1
    a_jump L_8043BE2

    .align 2, 0

global_label NPCList_8043BEC
    .word NPC_8043BF4
    .word 0xFF

    .align 2, 0

NPC_8043BF4:
    a_init
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_Prog
    a_set_pos -372, -135
    a_set_sprite_frame 3
L_8043C02:
    a_wait 1
    a_jump L_8043C02

    .align 2, 0

global_label NPCList_8043C0C
    .word NPC_8043C14
    .word 0xFF

    .align 2, 0

NPC_8043C14:
    a_init
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_Prog
    a_set_pos -372, -135
    a_set_sprite_frame 3
L_8043C22:
    a_wait 1
    a_jump L_8043C22

    .align 2, 0

global_label NPCList_8043C2C
    .word NPC_8043C44
    .word NPC_8043C5A
    .word NPC_8043C6F
    .word NPC_8043C91
    .word NPC_8043CB3
    .word 0xFF

    .align 2, 0

NPC_8043C44:
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Prog
    a_set_pos -248, 8
    a_set_sprite_frame 15
L_8043C53:
    a_wait 1
    a_jump L_8043C53

NPC_8043C5A:
    a_init
    a_disable_turn
    a_disable_dialog
    a_set_sprite SP_Overworld_FireMan
    a_set_pos -310, -135
    a_set_sprite_frame 3
L_8043C68:
    a_wait 1
    a_jump L_8043C68

NPC_8043C6F:
    a_jump_if_flag 0x282, L_8043C90
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite 0xE3
    a_set_palette 0x0
    a_set_pos 144, 80
    a_set_sprite_frame 0
L_8043C87:
    a_wait 1
    a_jump_if_not_flag 0x282, L_8043C87
L_8043C90:
    a_destroy

NPC_8043C91:
    a_jump_if_flag 0x283, L_8043CB2
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite 0xE3
    a_set_palette 0x1
    a_set_pos 98, -78
    a_set_sprite_frame 0
L_8043CA9:
    a_wait 1
    a_jump_if_not_flag 0x283, L_8043CA9
L_8043CB2:
    a_destroy

NPC_8043CB3:
    a_jump_if_flag 0x284, L_8043CD4
    a_init
    a_disable_turn
    a_set_dialog 0x4
    a_set_sprite 0xE3
    a_set_palette 0x2
    a_set_pos -139, -79
    a_set_sprite_frame 0
L_8043CCB:
    a_wait 1
    a_jump_if_not_flag 0x284, L_8043CCB
L_8043CD4:
    a_destroy

    .align 2, 0

global_label NPCList_8043CD8
    .word NPC_8043CE0
    .word 0xFF

    .align 2, 0

NPC_8043CE0:
    a_init
    a_disable_turn
    a_disable_dialog
    a_set_sprite SP_Overworld_FireMan
    a_set_pos -310, -135
    a_set_sprite_frame 3
L_8043CEE:
    a_wait 1
    a_jump L_8043CEE

    .align 2, 0

global_label EntityAllocParams_8043CF8
    entity Effect, 0x8, f(122, 136, 0), 0x0
    entity Effect, 0x8, f(122, 112, 0), 0x1
    entity Effect, 0x8, f(-342, 116, 0), 0x2
    entity Effect, 0x8, f(-342, 140, 0), 0x3
    .word 0xFF

global_label EntityAllocParams_8043D4C
    entity Effect, 0x8, f(152, 212, 0), 0x4
    entity Effect, 0x8, f(168, 188, 0), 0x105
    entity Effect, 0x8, f(88, 212, 0), 0x6
    entity Effect, 0x8, f(88, 188, 0), 0x107
    entity Effect, 0x8, f(-96, 212, 0), 0x8
    entity Effect, 0x8, f(-96, 188, 0), 0x109
    entity Effect, 0x8, f(-180, 118, 0), 0xA
    entity Effect, 0x8, f(-156, 102, 0), 0x10B
    entity Effect, 0x8, f(196, 52, 0), 0xC
    entity Effect, 0x8, f(172, 52, 0), 0x10D
    entity Effect, 0x8, f(88, 92, 0), 0xE
    entity Effect, 0x8, f(88, 68, 0), 0x10F
    entity Effect, 0x8, f(12, 12, 0), 0x10
    entity Effect, 0x8, f(34, -18, 0), 0x111
    entity Effect, 0x8, f(34, 4, 0), 0x14
    entity Effect, 0x8, f(12, -10, 0), 0x115
    entity Attack, 0x15, f(-124, -10, 0), 0x1A
    entity Attack, 0x15, f(-116, 12, 0), 0x11C
    entity Attack, 0x15, f(-148, -10, 0), 0x19
    entity Attack, 0x15, f(-140, 12, 0), 0x11B
    entity Attack, 0x15, f(-180, -10, 0), 0x1D
    entity Attack, 0x15, f(-164, 12, 0), 0x11E
    entity Attack, 0x15, f(-188, 12, 0), 0x1F
    entity Attack, 0x15, f(34, -92, 0), 0x116
    entity Attack, 0x15, f(12, -92, 0), 0x17
    entity Attack, 0x15, f(12, -70, 0), 0x118
    .word 0xFF

