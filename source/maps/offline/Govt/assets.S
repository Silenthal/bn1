#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_8034E90
    .word NPC_8034EB0
    .word NPC_8034EC5
    .word NPC_8034EDA
    .word NPC_8034EEF
    .word NPC_8034F04
    .word NPC_8034F19
    .word NPC_8034F2E
    .word 0xFF

    .align 2, 0

NPC_8034EB0:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -164, -20
    a_set_sprite_frame 7
    a_stop

NPC_8034EC5:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -208, -224
    a_set_sprite_frame 1
    a_stop

NPC_8034EDA:
    a_init
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -180, -138
    a_set_sprite_frame 5
    a_stop

NPC_8034EEF:
    a_init
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos 116, -204
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_8034F04:
    a_init
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 470, -88
    a_set_sprite_frame 3
    a_stop

NPC_8034F19:
    a_init
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_OldWoman
    a_set_pos 496, -226
    a_set_sprite_frame 5
    a_stop

NPC_8034F2E:
    a_init
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_Sal
    a_set_pos 472, -132
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8034F44
    .word NPC_8034F2E
    .word 0xFF

global_label NPCList_8034F4C
    .word NPC_8034F90
    .word NPC_8034FA5
    .word NPC_8034FBA
    .word NPC_8034FCF
    .word NPC_8034FE4
    .word NPC_8034FF9
    .word NPC_803500E
    .word NPC_8035023
    .word 0xFF

global_label NPCList_8034F70
    .word NPC_8034F90
    .word NPC_8034FA5
    .word NPC_8034FBA
    .word NPC_8034FE4
    .word NPC_8034FF9
    .word NPC_803500E
    .word NPC_8035023
    .word 0xFF

    .align 2, 0

NPC_8034F90:
    a_init
    a_set_dialog 0x43
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -164, -20
    a_set_sprite_frame 7
    a_stop

NPC_8034FA5:
    a_init
    a_set_dialog 0x44
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -208, -224
    a_set_sprite_frame 1
    a_stop

NPC_8034FBA:
    a_init
    a_set_dialog 0x45
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -180, -138
    a_set_sprite_frame 5
    a_stop

NPC_8034FCF:
    a_init
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos 116, -204
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_8034FE4:
    a_init
    a_set_dialog 0x47
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 470, -88
    a_set_sprite_frame 3
    a_stop

NPC_8034FF9:
    a_init
    a_set_dialog 0x48
    a_set_sprite SP_Overworld_OldWoman
    a_set_pos 496, -226
    a_set_sprite_frame 5
    a_stop

NPC_803500E:
    a_init
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_Sal
    a_set_pos 472, -132
    a_set_sprite_frame 5
    a_stop

NPC_8035023:
    a_init
    a_set_dialog 0x57
    a_set_sprite SP_Overworld_Masa
    a_set_pos 408, -146
    a_set_sprite_frame 4
    a_stop

global_label NPCList_8035038
    .word NPC_8035058
    .word NPC_803506D
    .word NPC_8035082
    .word NPC_8035097
    .word NPC_80350AC
    .word NPC_80350C1
    .word NPC_80350D6
    .word 0xFF

    .align 2, 0

NPC_8035058:
    a_init
    a_set_dialog 0x5A
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -164, -20
    a_set_sprite_frame 7
    a_stop

NPC_803506D:
    a_init
    a_set_dialog 0x5B
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -208, -224
    a_set_sprite_frame 1
    a_stop

NPC_8035082:
    a_init
    a_set_dialog 0x5C
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -180, -138
    a_set_sprite_frame 5
    a_stop

NPC_8035097:
    a_init
    a_set_dialog 0x5D
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos 116, -204
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_80350AC:
    a_init
    a_set_dialog 0x5E
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 470, -88
    a_set_sprite_frame 3
    a_stop

NPC_80350C1:
    a_init
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_Sal
    a_set_pos 472, -132
    a_set_sprite_frame 5
    a_stop

NPC_80350D6:
    a_init
    a_set_dialog 0x57
    a_set_sprite SP_Overworld_Masa
    a_set_pos 408, -146
    a_set_sprite_frame 4
    a_stop

    .align 2, 0

global_label NPCList_80350EC
    .word NPC_80350F8
    .word NPC_803510D
    .word 0xFF

    .align 2, 0

NPC_80350F8:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Conductor
    a_set_pos -58, 0
    a_set_sprite_frame 1
    a_stop

NPC_803510D:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -90, -110
L_8035119:
    a_move_f 8, d_ne, 8, 6
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 6
    a_wait_f 3, 30
    a_jump L_8035119

    .align 2, 0

global_label NPCList_8035134
    .word NPC_80350F8
    .word 0xFF

global_label NPCList_803513C
    .word NPC_803517C
    .word NPC_80351A5
    .word NPC_80351BA
    .word NPC_80351D7
    .word NPC_80351EC
    .word NPC_8035209
    .word 0xFF

global_label NPCList_8035158
    .word NPC_803517C
    .word NPC_80351A5
    .word NPC_80351BA
    .word NPC_80351D7
    .word NPC_80351EC
    .word NPC_8035209
    .word NPC_803539C
    .word NPC_80353B4
    .word 0xFF

    .align 2, 0

NPC_803517C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -300, 72
L_8035188:
    a_move_f 8, d_ne, 8, 35
    a_move_f 9, d_se, 8, 5
    a_move_f 10, d_sw, 8, 35
    a_move_f 11, d_nw, 8, 5
    a_jump L_8035188

NPC_80351A5:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -164, 94
    a_set_sprite_frame 5
    a_stop

NPC_80351BA:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 232, 8, 0
    a_set_radius 10
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 218, 76
    a_set_sprite_frame 5
    a_stop

NPC_80351D7:
    a_init
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_OldMan
    a_set_pos -154, -30
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_80351EC:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 178, -134
    a_set_sprite_frame 3
    a_stop

NPC_8035209:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 122, -134
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8035228
    .word NPC_803527C
    .word NPC_8035291
    .word NPC_80352A6
    .word NPC_80352C2
    .word NPC_80352DF
    .word NPC_80352FC
    .word NPC_8035312
    .word NPC_8035328
    .word NPC_803533E
    .word NPC_8035354
    .word 0xFF

global_label NPCList_8035254
    .word NPC_803527C
    .word NPC_8035291
    .word NPC_80352A6
    .word NPC_80352C2
    .word NPC_80352DF
    .word NPC_80352FC
    .word NPC_8035312
    .word NPC_8035328
    .word NPC_803533E
    .word 0xFF

    .align 2, 0

NPC_803527C:
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -290, 98
    a_set_sprite_frame 7
    a_stop

NPC_8035291:
    a_init
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_WomanApron
    a_set_pos -148, 68
    a_set_sprite_frame 3
    a_stop

NPC_80352A6:
    a_init
    a_disable_collision
    a_set_hitbox_offset 232, 8, 0
    a_set_radius 10
    a_set_dialog 0x11
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 218, 76
    a_set_sprite_frame 5
    a_stop

NPC_80352C2:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 206, -134
    a_set_sprite_frame 3
    a_stop

NPC_80352DF:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x15
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 152, -134
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_80352FC:
    a_init
    a_disable_turn
    a_set_dialog 0x16
    a_set_sprite SP_Overworld_ManTie
    a_set_pos 216, -96
    a_set_sprite_frame 7
    a_stop

NPC_8035312:
    a_init
    a_disable_turn
    a_set_dialog 0x17
    a_set_sprite SP_Overworld_OldMan
    a_set_pos 178, -96
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

NPC_8035328:
    a_init
    a_disable_turn
    a_set_dialog 0x18
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos 154, -96
    a_set_sprite_frame 7
    a_stop

NPC_803533E:
    a_init
    a_disable_turn
    a_set_dialog 0x19
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos 116, -96
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

NPC_8035354:
    a_init
    a_disable_turn
    a_set_dialog 0x1C
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 174, 90
    a_set_sprite_frame 1
L_8035363:
    a_jump_if_flag 0xBA, L_8035371
    a_wait 1
    a_jump L_8035363
L_8035371:
    a_set_sprite_frame 5
L_8035373:
    a_jump_if_flag 0xBC, L_8035381
    a_wait 1
    a_jump L_8035373
L_8035381:
    a_move_f 9, d_se, 8, 5
    a_move_f 10, d_sw, 8, 6
    a_move_f 9, d_se, 8, 16
    a_destroy

global_label NPCList_8035394
    .word NPC_803527C
    .word 0xFF

    .align 2, 0

NPC_803539C:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -290, -90
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

    .align 2, 0

NPC_80353B4:
    a_init
    a_set_dialog 0xC8
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 238, -94
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_80353CC
    .word NPC_80353F0
    .word NPC_8035419
    .word NPC_803542E
    .word NPC_803544B
    .word NPC_8035460
    .word NPC_803547D
    .word NPC_803539C
    .word NPC_80353B4
    .word 0xFF

    .align 2, 0

NPC_80353F0:
    a_init
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -300, 72
L_80353FC:
    a_move_f 8, d_ne, 8, 35
    a_move_f 9, d_se, 8, 5
    a_move_f 10, d_sw, 8, 35
    a_move_f 11, d_nw, 8, 5
    a_jump L_80353FC

NPC_8035419:
    a_init
    a_set_dialog 0x47
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -164, 94
    a_set_sprite_frame 5
    a_stop

NPC_803542E:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 232, 8, 0
    a_set_radius 10
    a_set_dialog 0x48
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 218, 76
    a_set_sprite_frame 5
    a_stop

NPC_803544B:
    a_init
    a_set_dialog 0x49
    a_set_sprite SP_Overworld_OldMan
    a_set_pos -154, -30
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8035460:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x4A
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 178, -134
    a_set_sprite_frame 3
    a_stop

NPC_803547D:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x4B
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 122, -134
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_803549C
    .word NPC_80354BC
    .word NPC_80354D9
    .word NPC_80354F6
    .word NPC_8035513
    .word NPC_8035554
    .word NPC_8035569
    .word NPC_803557E
    .word 0xFF

    .align 2, 0

NPC_80354BC:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 248, 24, 0
    a_set_radius 10
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -42, -250
    a_set_sprite_frame 3
    a_stop

NPC_80354D9:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 166, -210
    a_set_sprite_frame 5
    a_stop

NPC_80354F6:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 166, -154
    a_set_sprite_frame 5
    a_stop

NPC_8035513:
    a_init
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 128, 224
L_803551F:
    a_move_f 10, d_sw, 8, 21
    a_move_f 11, d_nw, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_move_f 11, d_nw, 8, 13
    a_move_f 9, d_se, 8, 13
    a_move_f 10, d_sw, 8, 21
    a_move_f 9, d_se, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_jump L_803551F

    .align 2, 0

NPC_8035554:
    a_init
    a_set_dialog 0x9
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 98, 58
    a_set_sprite_frame 7
    a_stop

NPC_8035569:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -244, -144
    a_set_sprite_frame 7
    a_stop

NPC_803557E:
    a_init
    a_set_dialog 0xB
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -64, 80
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8035594
    .word NPC_8035513
    .word 0xFF

global_label NPCList_803559C
    .word NPC_80355E0
    .word NPC_80355FC
    .word NPC_8035619
    .word NPC_8035636
    .word NPC_8035677
    .word NPC_80356AB
    .word NPC_80356C0
    .word 0xFF

global_label NPCList_80355BC
    .word NPC_80355E0
    .word NPC_80355FC
    .word NPC_8035619
    .word NPC_8035636
    .word NPC_80356AB
    .word NPC_80356C0
    .word 0xFF

global_label NPCList_80355D8
    .word NPC_8035677
    .word 0xFF

    .align 2, 0

NPC_80355E0:
    a_init
    a_disable_turn
    a_set_hitbox_offset 248, 24, 0
    a_set_radius 10
    a_set_dialog 0x28
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -42, -250
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

NPC_80355FC:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x29
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 166, -210
    a_set_sprite_frame 5
    a_stop

NPC_8035619:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x2A
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 166, -154
    a_set_sprite_frame 5
    a_stop

NPC_8035636:
    a_init
    a_set_dialog 0x39
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 128, 224
L_8035642:
    a_move_f 10, d_sw, 8, 21
    a_move_f 11, d_nw, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_move_f 11, d_nw, 8, 13
    a_move_f 9, d_se, 8, 13
    a_move_f 10, d_sw, 8, 21
    a_move_f 9, d_se, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_jump L_8035642

NPC_8035677:
    a_init
    a_disable_turn
    a_set_dialog 0x38
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 98, 58
    a_set_sprite_frame 7
L_8035686:
    a_jump_if_flag 0x9A, L_8035694
    a_wait 1
    a_jump L_8035686
L_8035694:
    a_set_sprite_frame 4
L_8035696:
    a_jump_if_flag 0x99, L_80356A4
    a_wait 1
    a_jump L_8035696
L_80356A4:
    a_move_f 10, d_sw, 8, 50
    a_destroy

NPC_80356AB:
    a_init
    a_set_dialog 0x2D
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -244, -144
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

NPC_80356C0:
    a_init
    a_set_dialog 0x3A
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -64, 80
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_80356D8
    .word NPC_80356E4
    .word NPC_8035707
    .word 0xFF

    .align 2, 0

NPC_80356E4:
    a_init
    a_set_sprite SP_Overworld_Yuichiro
    a_set_pos 98, 58
    a_set_sprite_frame 3
L_80356F0:
    a_jump_if_flag 0x9E, L_80356FE
    a_wait 1
    a_jump L_80356F0
L_80356FE:
    a_set_sprite_frame 5
    a_stop

NPC_8035707:
    a_init
    a_set_sprite SP_Overworld_WomanPurple
    a_set_pos -70, 56
    a_set_sprite_frame 8
L_8035713:
    a_jump_if_flag 0x9D, L_8035721
    a_wait 1
    a_jump L_8035713
L_8035721:
    a_move_f 8, d_ne, 16, 18
    a_set_sprite_frame 1
    a_stop

global_label NPCList_8035730
    .word NPC_803576C
    .word NPC_8035789
    .word NPC_80357A6
    .word NPC_80357C3
    .word NPC_8035804
    .word NPC_8035819
    .word NPC_803582E
    .word 0xFF

global_label NPCList_8035750
    .word NPC_803576C
    .word NPC_8035789
    .word NPC_80357A6
    .word NPC_8035804
    .word NPC_8035819
    .word NPC_803582E
    .word 0xFF

    .align 2, 0

NPC_803576C:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 248, 24, 0
    a_set_radius 10
    a_set_dialog 0x41
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -42, -250
    a_set_sprite_frame 3
    a_stop

NPC_8035789:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x42
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 166, -210
    a_set_sprite_frame 5
    a_stop

NPC_80357A6:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 236, 6, 0
    a_set_radius 10
    a_set_dialog 0x43
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 166, -154
    a_set_sprite_frame 5
    a_stop

NPC_80357C3:
    a_init
    a_set_dialog 0x44
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 128, 224
L_80357CF:
    a_move_f 10, d_sw, 8, 21
    a_move_f 11, d_nw, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_move_f 11, d_nw, 8, 13
    a_move_f 9, d_se, 8, 13
    a_move_f 10, d_sw, 8, 21
    a_move_f 9, d_se, 8, 46
    a_move_f 8, d_ne, 8, 21
    a_jump L_80357CF

    .align 2, 0

NPC_8035804:
    a_init
    a_set_dialog 0x45
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 98, 58
    a_set_sprite_frame 7
    a_stop

NPC_8035819:
    a_init
    a_set_dialog 0x46
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -244, -144
    a_set_sprite_frame 7
    a_stop

NPC_803582E:
    a_init
    a_set_dialog 0x47
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -64, 80
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8035844
    .word NPC_803584C
    .word 0xFF

    .align 2, 0

NPC_803584C:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 44, -190
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_803586C
    .word NPC_803588C
    .word NPC_80358A9
    .word 0xFF

global_label NPCList_8035878
    .word NPC_803588C
    .word 0xFF

global_label NPCList_8035880
    .word NPC_80358BE
    .word NPC_80358E1
    .word 0xFF

    .align 2, 0

NPC_803588C:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x2D
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos 44, -190
    a_set_sprite_frame 3
    a_stop

NPC_80358A9:
    a_init
    a_set_dialog 0x2E
    a_set_sprite SP_Overworld_Yuichiro
    a_set_pos -38, 248
    a_set_sprite_frame 3
    a_stop

NPC_80358BE:
    a_init
    a_set_sprite SP_Overworld_Yuichiro
    a_set_pos 100, 206
    a_set_sprite_frame 1
L_80358CA:
    a_jump_if_flag 0xAE, L_80358D8
    a_wait 1
    a_jump L_80358CA
L_80358D8:
    a_set_sprite_frame 7
    a_stop

NPC_80358E1:
    a_init
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 100, 80
    a_set_sprite_frame 3
L_80358ED:
    a_jump_if_flag 0xAD, L_80358FB
    a_wait 1
    a_jump L_80358ED
L_80358FB:
    a_move_f 9, d_se, 16, 13
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_803590C
    .word NPC_8035920
    .word NPC_8035935
    .word NPC_8035952
    .word NPC_8035967
    .word 0xFF

    .align 2, 0

NPC_8035920:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 80, 228
    a_set_sprite_frame 1
    a_stop

NPC_8035935:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -72, -50
    a_set_sprite_frame 3
    a_stop

NPC_8035952:
    a_init
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 38, 92
    a_set_sprite_frame 1
    a_stop

NPC_8035967:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -246, -30
L_8035973:
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 5
    a_wait_f 3, 30
    a_move_f 8, d_ne, 8, 5
    a_jump L_8035973

global_label NPCList_803598C
    .word NPC_8035994
    .word 0xFF

    .align 2, 0

NPC_8035994:
    a_init
    a_set_sprite SP_Overworld_Madd
    a_set_pos 114, 174
    a_set_sprite_frame 5
L_80359A0:
    a_jump_if_flag 0xC0, L_80359AE
    a_wait 1
    a_jump L_80359A0
L_80359AE:
    a_move_f 10, d_sw, 8, 9
    a_set_sprite_frame 7
L_80359B6:
    a_jump_if_flag 0xC1, L_80359C4
    a_wait 1
    a_jump L_80359B6
L_80359C4:
    a_destroy

    .align 2, 0

global_label NPCList_80359C8
    .word NPC_80359DC
    .word NPC_80359F1
    .word NPC_8035A0E
    .word NPC_8035A34
    .word 0xFF

    .align 2, 0

NPC_80359DC:
    a_init
    a_set_dialog 0x19
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 80, 228
    a_set_sprite_frame 1
    a_stop

NPC_80359F1:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x1A
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -72, -50
    a_set_sprite_frame 3
    a_stop

NPC_8035A0E:
    a_init
    a_set_dialog 0x1B
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -246, -30
L_8035A1A:
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 5
    a_wait_f 3, 30
    a_move_f 8, d_ne, 8, 5
    a_jump L_8035A1A

    .align 2, 0

    .align 2, 0

NPC_8035A34:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos -224, -6
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8035A4C
    .word NPC_8035A5C
    .word NPC_8035A71
    .word NPC_8035A34
    .word 0xFF

    .align 2, 0

NPC_8035A5C:
    a_init
    a_set_dialog 0x23
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 80, 228
    a_set_sprite_frame 1
    a_stop

NPC_8035A71:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 250, 20, 0
    a_set_radius 10
    a_set_dialog 0x24
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -72, -50
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8035A90
    .word NPC_8035AB4
    .word NPC_8035AC9
    .word NPC_8035ADF
    .word NPC_8035AF5
    .word 0xFF

global_label NPCList_8035AA4
    .word NPC_8035AC9
    .word NPC_8035ADF
    .word NPC_8035AF5
    .word 0xFF

    .align 2, 0

NPC_8035AB4:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_ManGovt
    a_set_pos 118, -80
    a_set_sprite_frame 1
    a_stop

NPC_8035AC9:
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 6, -4
    a_set_sprite_frame 1
    a_stop

NPC_8035ADF:
    a_init
    a_disable_turn
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 6, -42
    a_set_sprite_frame 1
    a_stop

NPC_8035AF5:
    a_init
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_Scientist
    a_set_pos 88, 54
L_8035B01:
    a_move_f 8, d_ne, 8, 6
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 6
    a_wait_f 3, 30
    a_jump L_8035B01

    .align 2, 0

global_label NPCList_8035B1C
    .word NPC_8035B2C
    .word NPC_8035B41
    .word NPC_8035B66
    .word 0xFF

    .align 2, 0

NPC_8035B2C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos -76, 98
    a_set_sprite_frame 1
    a_stop

NPC_8035B41:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Scientist
    a_set_pos -100, -112
L_8035B4D:
    a_move_f 9, d_se, 8, 15
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 15
    a_wait_f 1, 30
    a_jump L_8035B4D

NPC_8035B66:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 88, 120
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

global_label NPCList_8035B7C
    .word NPC_8035B8C
    .word NPC_8035BA1
    .word NPC_8035BB7
    .word 0xFF

    .align 2, 0

NPC_8035B8C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_WomanJacket
    a_set_pos -72, 2
    a_set_sprite_frame 1
    a_stop

NPC_8035BA1:
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_Chaud
    a_set_pos 30, -220
    a_set_sprite_frame 1
    a_stop

NPC_8035BB7:
    a_init
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_ManJacket
    a_set_pos 30, 224
    a_set_sprite_frame 7
    a_stop

global_label NPCList_8035BCC
    .word NPC_8035B8C
    .word NPC_8035BB7
    .word 0xFF

global_label NPCList_8035BD8
    .word NPC_8035B8C
    .word NPC_8035BB7
    .word NPC_8035BE8
    .word 0xFF

    .align 2, 0

NPC_8035BE8:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_ManTie
    a_set_pos 20, -228
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label EntityAllocParams_8035C00
    entity Effect, 0x1, f(460, -120, 0), 0x21
    .word 0xFF

global_label EntityAllocParams_8035C18
    entity Effect, 0x1, f(460, -120, 0), 0x21
    entity Effect, 0x1, f(398, -136, 0), 0x40
    .word 0xFF

global_label EntityAllocParams_8035C44
    entity Effect, 0x1, f(-122, -2, 0), 0x20
    entity Effect, 0x1, f(-174, -70, 0), 0x20
    .word 0xFF

global_label EntityAllocParams_8035C70
    entity Effect, 0x1, f(34, 90, 0), 0x20
    entity Effect, 0x1, f(102, 142, 0), 0x20
    .word 0xFF

