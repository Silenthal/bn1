#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_802F994
    .word NPC_802FA00
    .word NPC_802FA15
    .word NPC_802FA2A
    .word NPC_802FA41
    .word NPC_802FA66
    .word NPC_802FA7B
    .word NPC_802FA90
    .word NPC_802FAA6
    .word NPC_802FAC7
    .word NPC_802FAEE
    .word NPC_802FB13
    .word NPC_802FB38
    .word NPC_802FB5D
    .word 0xFF

global_label NPCList_802F9CC
    .word NPC_802FA00
    .word NPC_802FA15
    .word NPC_802FA2A
    .word NPC_802FA41
    .word NPC_802FA66
    .word NPC_802FA7B
    .word NPC_802FA90
    .word NPC_802FAA6
    .word NPC_802FAC7
    .word NPC_802FAEE
    .word NPC_802FB13
    .word NPC_802FB38
    .word 0xFF

    .align 2, 0

NPC_802FA00:
    a_init_basic_npc_talk 280, -134, 0, SP_Overworld_OldMan, frame=5, dialog=0x0
    a_stop

NPC_802FA15:
    a_init_basic_npc_talk -308, -298, 0, SP_Overworld_WomanApron, frame=5, dialog=0x3
    a_stop

NPC_802FA2A:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x10
    a_set_sprite_at 130, -366, 0, SP_Overworld_YoungGirl, frame=3
    a_stop

NPC_802FA41:
    a_init_basic_npc_talk -280, 230, 0, SP_Overworld_ManTie, dialog=0x5
L_802FA4D:
    a_wait_f 7, 30
    a_move_f 8, d_ne, 8, 6
    a_wait_f 7, 30
    a_move_f 10, d_sw, 8, 6
    a_jump L_802FA4D

NPC_802FA66:
    a_init_basic_npc_talk 180, 94, 0, SP_Overworld_ManTie, frame=5, dialog=0x6
    a_stop

NPC_802FA7B:
    a_init_basic_npc_talk -150, 10, 0, SP_Overworld_YoungBoy, frame=5, dialog=0x7
    a_stop

    .align 2, 0

NPC_802FA90:
    a_init
    a_disable_turn
    a_set_dialog 0x8
    a_set_sprite_at 242, 176, 0, SP_Overworld_PreschoolBoy, frame=1
    a_stop

NPC_802FAA6:
    a_init_basic_npc_talk 144, 152, 0, SP_Overworld_PreschoolBoy, dialog=0x9
L_802FAB2:
    a_wait_f 9, 10
    a_wait_f 10, 10
    a_wait_f 11, 10
    a_wait_f 8, 10
    a_jump L_802FAB2

NPC_802FAC7:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0xB
    a_set_sprite_at -220, -134, 0, SP_Overworld_YoungGirl
L_802FAD5:
    a_wait_f 7, 30
    a_move_f 10, d_sw, 8, 8
    a_wait_f 7, 30
    a_move_f 8, d_ne, 8, 8
    a_jump L_802FAD5

NPC_802FAEE:
    a_init_basic_npc_talk 72, -132, 0, SP_Overworld_YoungBoy, dialog=0xF
L_802FAFA:
    a_wait_f 5, 120
    a_move_f 8, d_ne, 8, 6
    a_wait_f 1, 120
    a_move_f 10, d_sw, 8, 6
    a_jump L_802FAFA

NPC_802FB13:
    a_init_basic_npc_talk 84, -224, 0, SP_Overworld_OldWoman, dialog=0x13
L_802FB1F:
    a_move_f 8, d_ne, 8, 16
    a_wait_f 1, 30
    a_move_f 10, d_sw, 8, 16
    a_wait_f 5, 30
    a_jump L_802FB1F

    .align 2, 0

NPC_802FB38:
    a_init_basic_npc_talk 12, 164, 0, SP_Overworld_Scientist, dialog=0x12
L_802FB44:
    a_move_f 9, d_se, 8, 5
    a_wait_f 3, 60
    a_move_f 11, d_nw, 8, 5
    a_wait_f 7, 60
    a_jump L_802FB44

NPC_802FB5D:
    a_init_basic_npc_talk 72, -272, 0, SP_Overworld_Yai, frame=5, dialog=0x2D
    a_set_radius 4
    a_stop

global_label NPCList_802FB74
    .word NPC_802FB7C
    .word 0xFF

    .align 2, 0

NPC_802FB7C:
    a_init_basic_npc 348, -88, 0, SP_Overworld_Higsby, frame=1
    a_stop

    .align 2, 0

global_label NPCList_802FB90
    .word NPC_802FBB4
    .word NPC_802FBC9
    .word NPC_802FBF2
    .word NPC_802FC1B
    .word NPC_802FC30
    .word NPC_802FC55
    .word NPC_802FC6A
    .word NPC_802FFA4
    .word 0xFF

    .align 2, 0

NPC_802FBB4:
    a_init_basic_npc_talk 280, -134, 0, SP_Overworld_OldMan, frame=1, dialog=0x23
    a_stop

NPC_802FBC9:
    a_init_basic_npc_talk 148, 84, 0, SP_Overworld_PreschoolBoy, dialog=0x24
L_802FBD5:
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_jump L_802FBD5

NPC_802FBF2:
    a_init_basic_npc_talk 76, 156, 0, SP_Overworld_PreschoolBoy, dialog=0x25
L_802FBFE:
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_jump L_802FBFE

NPC_802FC1B:
    a_init_basic_npc_talk 180, 94, 0, SP_Overworld_ManGreen, frame=5, dialog=0x26
    a_stop

    .align 2, 0

NPC_802FC30:
    a_init_basic_npc_talk 84, -224, 0, SP_Overworld_OldWoman, dialog=0x27
L_802FC3C:
    a_move_f 8, d_ne, 8, 16
    a_wait_f 5, 30
    a_move_f 10, d_sw, 8, 16
    a_wait_f 1, 30
    a_jump L_802FC3C

NPC_802FC55:
    a_init_basic_npc_talk 160, -136, 0, SP_Overworld_YoungBoy, frame=3, dialog=0x28
    a_stop

NPC_802FC6A:
    a_init_basic_npc_talk -164, 66, 0, SP_Overworld_ManTie, frame=7, dialog=0x29
    a_stop

    .align 2, 0

global_label NPCList_802FC80
    .word NPC_802FCAC
    .word NPC_802FCC1
    .word NPC_802FCEA
    .word NPC_802FD13
    .word NPC_802FD28
    .word NPC_802FD4D
    .word NPC_802FD62
    .word NPC_802FD77
    .word NPC_802FD9C
    .word NPC_802FFA4
    .word 0xFF

    .align 2, 0

NPC_802FCAC:
    a_init_basic_npc_talk 280, -134, 0, SP_Overworld_OldMan, frame=1, dialog=0x23
    a_stop

NPC_802FCC1:
    a_init_basic_npc_talk 148, 84, 0, SP_Overworld_PreschoolBoy, dialog=0x24
L_802FCCD:
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_jump L_802FCCD

NPC_802FCEA:
    a_init_basic_npc_talk 76, 156, 0, SP_Overworld_PreschoolBoy, dialog=0x25
L_802FCF6:
    a_move_f 8, d_ne, 16, 9
    a_move_f 11, d_nw, 16, 9
    a_move_f 10, d_sw, 16, 9
    a_move_f 9, d_se, 16, 9
    a_jump L_802FCF6

NPC_802FD13:
    a_init_basic_npc_talk 180, 94, 0, SP_Overworld_ManGreen, frame=5, dialog=0x26
    a_stop

    .align 2, 0

NPC_802FD28:
    a_init_basic_npc_talk 84, -224, 0, SP_Overworld_OldWoman, dialog=0x27
L_802FD34:
    a_move_f 8, d_ne, 8, 16
    a_wait_f 5, 30
    a_move_f 10, d_sw, 8, 16
    a_wait_f 1, 30
    a_jump L_802FD34

NPC_802FD4D:
    a_init_basic_npc_talk 160, -136, 0, SP_Overworld_YoungBoy, frame=3, dialog=0x28
    a_stop

NPC_802FD62:
    a_init_basic_npc_talk -164, 66, 0, SP_Overworld_ManTie, frame=7, dialog=0x33
    a_stop

NPC_802FD77:
    a_init_basic_npc_talk -280, -146, 0, SP_Overworld_YoungBoy, dialog=0x34
L_802FD83:
    a_move_f 8, d_ne, 8, 6
    a_wait_f 5, 30
    a_move_f 10, d_sw, 8, 6
    a_wait_f 1, 30
    a_jump L_802FD83

    .align 2, 0

NPC_802FD9C:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x35
    a_set_sprite_at -166, -324, 0, SP_Overworld_YoungGirl, frame=5
    a_stop

    .align 2, 0

global_label NPCList_802FDB4
    .word NPC_802FCAC
    .word NPC_802FCC1
    .word NPC_802FCEA
    .word NPC_802FD13
    .word NPC_802FD28
    .word NPC_802FD4D
    .word NPC_802FD62
    .word NPC_802FD77
    .word NPC_802FD9C
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word 0xFF

global_label NPCList_802FDE8
    .word NPC_802FE08
    .word NPC_802FE1D
    .word NPC_802FE32
    .word NPC_802FE47
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word 0xFF

    .align 2, 0

NPC_802FE08:
    a_init_basic_npc_talk 184, 62, 0, SP_Overworld_ManJacket, frame=1, dialog=0x46
    a_stop

NPC_802FE1D:
    a_init_basic_npc_talk 164, -136, 0, SP_Overworld_OldMan, frame=3, dialog=0x47
    a_stop

NPC_802FE32:
    a_init_basic_npc_talk -282, 210, 0, SP_Overworld_WomanApron, frame=3, dialog=0x49
    a_stop

NPC_802FE47:
    a_init_basic_npc_talk -70, -134, 0, SP_Overworld_PreschoolBoy, dialog=0x4A
L_802FE53:
    a_move_f 10, d_sw, 8, 29
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 29
    a_wait_f 1, 30
    a_jump L_802FE53

    .align 2, 0

global_label NPCList_802FE6C
    .word NPC_802FE90
    .word NPC_802FE32
    .word NPC_802FEA5
    .word NPC_802FEBA
    .word NPC_802FECF
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word 0xFF

NPC_802FE90:
    a_init_basic_npc_talk 164, -136, 0, SP_Overworld_OldMan, frame=7, dialog=0x50
    a_stop

NPC_802FEA5:
    a_init_basic_npc_talk -292, 188, 0, SP_Overworld_PreschoolBoy, frame=1, dialog=0x53
    a_stop

NPC_802FEBA:
    a_init_basic_npc_talk 184, 62, 0, SP_Overworld_WomanSkirt, frame=1, dialog=0x54
    a_stop

NPC_802FECF:
    a_init_basic_npc_talk -180, 72, 0, SP_Overworld_OldWoman, dialog=0x55
L_802FEDB:
    a_move_f 11, d_nw, 8, 3
    a_wait_f 7, 30
    a_move_f 9, d_se, 8, 3
    a_wait_f 3, 30
    a_jump L_802FEDB

    .align 2, 0

global_label NPCList_802FEF4
    .word NPC_802FEFC
    .word 0xFF

    .align 2, 0

NPC_802FEFC:
    a_init_basic_npc_talk 304, -148, 0, SP_Overworld_YoungBoy, dialog=0x50
    a_move_f 13, d_ne, 12, 3
    a_wait_f 14, 30
    a_set_sprite_frame 15
L_802FF14:
    a_jump_if_flag 0xB2, L_802FF22
    a_wait 1
    a_jump L_802FF14
L_802FF22:
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_802FF2C
    .word NPC_802FE90
    .word NPC_802FE32
    .word NPC_802FEA5
    .word NPC_802FEBA
    .word NPC_802FECF
    .word NPC_802FF54
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word 0xFF

NPC_802FF54:
    a_init_basic_npc_talk 346, -138, 0, SP_Overworld_YoungBoy, frame=5, dialog=0x5A
    a_stop

    .align 2, 0

global_label NPCList_802FF6C
    .word NPC_802FF78
    .word NPC_802FF8D
    .word 0xFF

    .align 2, 0

NPC_802FF78:
    a_init_basic_npc_talk 328, -148, 0, SP_Overworld_YoungBoy, frame=7, dialog=0x50
    a_stop

NPC_802FF8D:
    a_init_basic_npc_talk 324, -188, 0, SP_Overworld_ManGovt, frame=3, dialog=0x50
    a_stop

    .align 2, 0


NPC_802FFA4:
    a_init_basic_npc_talk -274, -268, 0, SP_Overworld_YoungBoy, frame=3, dialog=0xBE
    a_stop

    .align 2, 0

NPC_802FFBC:
    a_init_basic_npc_talk 250, -344, 0, SP_Overworld_OldMan, frame=1, dialog=0xC6
    a_stop

    .align 2, 0

NPC_802FFD4:
    a_init_basic_npc_talk -304, 320, 0, SP_Overworld_OldMan, frame=5, dialog=0xCB
    a_stop

    .align 2, 0

NPC_802FFEC:
    a_init_basic_npc_talk 378, 218, 0, SP_Overworld_ManTie, frame=5, dialog=0xD2
    a_stop

    .align 2, 0

global_label NPCList_8030004
    .word NPC_8030058
    .word NPC_803007D
    .word NPC_8030092
    .word NPC_80300A7
    .word NPC_80300BC
    .word NPC_80300E1
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word 0xFF

global_label NPCList_803002C
    .word NPC_8030058
    .word NPC_803007D
    .word NPC_8030092
    .word NPC_80300A7
    .word NPC_80300BC
    .word NPC_80300E1
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word NPC_802FFEC
    .word 0xFF

    .align 2, 0

NPC_8030058:
    a_init_basic_npc_talk -224, 214, 0, SP_Overworld_YoungBoy, dialog=0x64
L_8030064:
    a_move_f 10, d_sw, 8, 8
    a_wait_f 3, 30
    a_move_f 8, d_ne, 8, 8
    a_wait_f 3, 30
    a_jump L_8030064

NPC_803007D:
    a_init_basic_npc_talk -148, 8, 0, SP_Overworld_OldMan, frame=7, dialog=0x68
    a_stop

NPC_8030092:
    a_init_basic_npc_talk 140, -136, 0, SP_Overworld_ManGreen, frame=3, dialog=0x69
    a_stop

NPC_80300A7:
    a_init_basic_npc_talk 180, 80, 0, SP_Overworld_PreschoolGirl, frame=5, dialog=0x6A
    a_stop

    .align 2, 0

NPC_80300BC:
    a_init_basic_npc_talk 50, 218, 0, SP_Overworld_OldWoman, dialog=0x6C
L_80300C8:
    a_move_f 8, d_ne, 8, 16
    a_wait_f 5, 30
    a_move_f 10, d_sw, 8, 16
    a_wait_f 1, 30
    a_jump L_80300C8

NPC_80300E1:
    a_init_basic_npc_talk -220, -148, 0, SP_Overworld_WomanApron, frame=5, dialog=0x6D
    a_stop

    .align 2, 0

global_label NPCList_80300F8
    .word NPC_8030100
    .word 0xFF

    .align 2, 0

NPC_8030100:
    a_init
    a_set_sprite_at -130, 220, 0, SP_Overworld_Mayl
    a_move_f 10, d_sw, 16, 14
L_8030110:
    a_jump_if_flag 0x96, L_8030120
    a_wait_f 5, 1
    a_jump L_8030110
L_8030120:
    a_move_f 8, d_ne, 16, 14
    a_destroy
    a_end

    .align 2, 0

global_label NPCList_8030128
    .word NPC_80301AC
    .word NPC_80301D1
    .word NPC_80301E6
    .word NPC_80301FB
    .word NPC_8030210
    .word NPC_8030235
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word NPC_802FFEC
    .word 0xFF

global_label NPCList_8030154
    .word NPC_80301AC
    .word NPC_80301E6
    .word NPC_80301FB
    .word NPC_8030210
    .word NPC_8030235
    .word NPC_803024A
    .word NPC_802FFA4
    .word NPC_802FFBC
    .word NPC_802FFD4
    .word NPC_802FFEC
    .word 0xFF

global_label NPCList_8030180
    .word NPC_8030260
    .word NPC_8030293
    .word NPC_80302D6
    .word NPC_80302FD
    .word NPC_8030310
    .word NPC_8030323
    .word NPC_8030336
    .word NPC_803035D
    .word NPC_8030370
    .word NPC_8030385
    .word 0xFF

    .align 2, 0

NPC_80301AC:
    a_init_basic_npc_talk -224, 214, 0, SP_Overworld_YoungBoy, dialog=0x82
L_80301B8:
    a_move_f 10, d_sw, 8, 8
    a_wait_f 3, 30
    a_move_f 8, d_ne, 8, 8
    a_wait_f 3, 30
    a_jump L_80301B8

NPC_80301D1:
    a_init_basic_npc_talk -148, 8, 0, SP_Overworld_OldMan, frame=7, dialog=0x83
    a_stop

NPC_80301E6:
    a_init_basic_npc_talk 140, -136, 0, SP_Overworld_ManGreen, frame=3, dialog=0x86
    a_stop

NPC_80301FB:
    a_init_basic_npc_talk 180, 80, 0, SP_Overworld_PreschoolGirl, frame=5, dialog=0x87
    a_stop

    .align 2, 0

NPC_8030210:
    a_init_basic_npc_talk 50, 218, 0, SP_Overworld_OldWoman, dialog=0x89
L_803021C:
    a_move_f 8, d_ne, 8, 16
    a_wait_f 5, 30
    a_move_f 10, d_sw, 8, 16
    a_wait_f 1, 30
    a_jump L_803021C

NPC_8030235:
    a_init_basic_npc_talk -220, -148, 0, SP_Overworld_WomanApron, frame=5, dialog=0x8A
    a_stop

NPC_803024A:
    a_init_basic_npc_talk 28, -148, 0, SP_Overworld_Chaud, frame=3, dialog=0xAB
    a_stop

    a_destroy

NPC_8030260:
    a_init
    a_set_sprite_at -98, -144, 0, SP_Overworld_Yuichiro, frame=3
L_803026C:
    a_jump_if_flag 0xAE, L_803027A
    a_wait 1
    a_jump L_803026C
L_803027A:
    a_set_sprite_frame 5
L_803027C:
    a_jump_if_not_flag 0xAE, L_803028A
    a_wait 1
    a_jump L_803027C
L_803028A:
    a_set_sprite_frame 3
    a_stop

NPC_8030293:
    a_init
    a_set_sprite_at -114, -144, 0, SP_Overworld_Haruka, frame=3
L_803029F:
    a_jump_if_flag 0xA4, L_80302AD
    a_wait 1
    a_jump L_803029F
L_80302AD:
    a_set_sprite_frame 1
L_80302AF:
    a_jump_if_not_flag 0xA4, L_80302BD
    a_wait 1
    a_jump L_80302AF
L_80302BD:
    a_set_sprite_frame 3
L_80302BF:
    a_jump_if_flag 0xA4, L_80302CD
    a_wait 1
    a_jump L_80302BF
L_80302CD:
    a_set_sprite_frame 5
    a_stop

NPC_80302D6:
    a_init
    a_set_sprite_at -130, -132, 0, SP_Overworld_Mayl, frame=1
L_80302E2:
    a_jump_if_flag 0xF9, L_80302F0
    a_wait 1
    a_jump L_80302E2
L_80302F0:
    a_wait_f 17, 60
    a_set_sprite_frame 1
    a_stop

NPC_80302FD:
    a_init_basic_npc -110, -108, 0, SP_Overworld_Chaud, frame=7
    a_stop

    .align 2, 0

NPC_8030310:
    a_init_basic_npc -160, -112, 0, SP_Overworld_Higsby, frame=1
    a_stop

NPC_8030323:
    a_init_basic_npc -94, -132, 0, SP_Overworld_Yai, frame=5
    a_stop

NPC_8030336:
    a_init
    a_set_sprite_at -94, -108, 0, SP_Overworld_Dex, frame=5
L_8030342:
    a_jump_if_flag 0x93, L_8030350
    a_wait 1
    a_jump L_8030342
L_8030350:
    a_wait_f 15, 180
    a_set_sprite_frame 5
    a_stop

NPC_803035D:
    a_init_basic_npc -82, -106, 0, SP_Overworld_Mari, frame=6
    a_stop

    .align 2, 0

NPC_8030370:
    a_init
    a_set_palette 0x1
    a_set_sprite_at -66, -106, 0, SP_Overworld_Mari, frame=6
    a_stop

NPC_8030385:
    a_init_basic_npc -110, -80, 0, SP_Overworld_ManGovt, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8030398
    .word NPC_80303A4
    .word NPC_80303B9
    .word 0xFF

    .align 2, 0

NPC_80303A4:
    a_init_basic_npc_talk -224, 158, 0, SP_Overworld_ManTie, frame=7, dialog=0xA
    a_stop

NPC_80303B9:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0xB
    a_set_sprite_at 0, 164, 0, SP_Overworld_YoungGirl, frame=5
    a_stop

    .align 2, 0

global_label NPCList_80303D0
    .word NPC_80303D8
    .word 0xFF

    .align 2, 0

NPC_80303D8:
    a_init
    a_set_sprite_at -96, 24, 0, SP_Overworld_Mayl, frame=2
L_80303E4:
    a_jump_if_flag 0xA4, L_80303F2
    a_wait 1
    a_jump L_80303E4
L_80303F2:
    a_move_f 11, d_nw, 16, 9
    a_move_f 8, d_ne, 16, 14
    a_stop

    .align 2, 0

global_label NPCList_8030408
    .word NPC_8030410
    .word 0xFF

    .align 2, 0

NPC_8030410:
    a_init_basic_npc_talk -254, 145, 0, SP_Overworld_PreschoolBoy, dialog=0x14
    a_move_f 8, d_ne, 16, 12
    a_move_f 11, d_nw, 16, 8
    a_move_f 8, d_ne, 16, 4
    a_move_f 11, d_nw, 16, 4
    a_move_f 8, d_ne, 16, 11
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 1
    a_move_f 8, d_ne, 16, 1
    a_move_f 11, d_nw, 16, 10
    a_move_f 8, d_ne, 16, 3
    a_move_f 11, d_nw, 16, 2
    a_destroy
    a_end

    .align 2, 0

global_label NPCList_80304A4
    .word NPC_80304B0
    .word NPC_80304C5
    .word 0xFF

    .align 2, 0

NPC_80304B0:
    a_init_basic_npc_talk 0, 164, 0, SP_Overworld_YoungBoy, frame=5, dialog=0x1A
    a_stop

NPC_80304C5:
    a_init_basic_npc_talk -30, 124, 0, SP_Overworld_PreschoolGirl, frame=7, dialog=0x1B
    a_stop

    .align 2, 0

global_label NPCList_80304DC
    .word NPC_80304E4
    .word 0xFF

    .align 2, 0

NPC_80304E4:
    a_init
    a_set_sprite_at -220, 114, 0, SP_Overworld_ManGreen
    a_move_f 8, d_ne, 8, 8
    a_move_f 11, d_nw, 8, 12
    a_move_f 8, d_ne, 8, 8
    a_set_flag 0xAC
    a_set_sprite_frame 1
L_8030505:
    a_jump_if_flag 0xAD, L_8030513
    a_wait 1
    a_jump L_8030505
L_8030513:
    a_wait_f 12, 12
    a_set_sprite_frame 13
    a_set_flag 0xAE
L_803051C:
    a_jump_if_flag 0xAF, L_803052A
    a_wait 1
    a_jump L_803051C
L_803052A:
    a_set_sprite_frame 14
    a_stop

    .align 2, 0

global_label NPCList_8030534
    .word NPC_803053C
    .word 0xFF

    .align 2, 0

NPC_803053C:
    a_init
    a_disable_turn
    a_set_hitbox_offset 8, 0, 0
    a_set_radius 10
    a_set_dialog 0x1E
    a_set_sprite_at -120, 38, 0, SP_Overworld_ManGreen, frame=15
    a_stop

    .align 2, 0

global_label NPCList_8030558
    .word NPC_8030564
    .word NPC_8030579
    .word 0xFF

    .align 2, 0

NPC_8030564:
    a_init_basic_npc_talk 0, 168, 0, SP_Overworld_PreschoolBoy, frame=5, dialog=0x23
    a_stop

NPC_8030579:
    a_init_basic_npc_talk -218, 116, 0, SP_Overworld_ManTie, frame=3, dialog=0x24
    a_stop

    .align 2, 0

global_label NPCList_8030590
    .word NPC_8030598
    .word 0xFF

    .align 2, 0

NPC_8030598:
    a_init_basic_npc -220, 140, 0, SP_Overworld_Mayl, frame=0
    a_stop

    .align 2, 0

global_label NPCList_80305AC
    .word NPC_80305B8
    .word NPC_8030605
    .word 0xFF

    .align 2, 0

NPC_80305B8:
    a_init_basic_npc_talk -72, -6, 0, SP_Overworld_Haruka, dialog=0x0
L_80305C4:
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 9, d_se, 8, 3
    a_jump L_80305C4

NPC_8030605:
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite_at 12, -28, 16, SP_Overworld_Breakfast, frame=0
    a_set_radius 6
    a_set_hitbox_offset 244, 32, 240
    a_disable_collision
L_803061B:
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_LAN_LIVING_ROOM_RECOV10_A, L_803061B
    a_destroy
    a_end

    .align 2, 0

global_label NPCList_8030628
    .word NPC_8030634
    .word NPC_8030649
    .word 0xFF

    .align 2, 0

NPC_8030634:
    a_init_basic_npc_talk 40, -8, 0, SP_Overworld_Haruka, frame=3, dialog=0x5
    a_stop

NPC_8030649:
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite_at 64, 36, 0, SP_Overworld_Match
L_8030656:
    a_set_sprite_frame 13
L_8030658:
    a_wait 1
    a_jump_if_not_flag 0xD4, L_8030658
    a_set_sprite_frame 5
L_8030663:
    a_wait 1
    a_jump_if_flag 0xD4, L_8030663
    a_jump L_8030656

    .align 2, 0

global_label NPCList_8030674
    .word NPC_803067C
    .word 0xFF

    .align 2, 0

NPC_803067C:
    a_init_basic_npc_talk -114, -4, 0, SP_Overworld_Haruka, dialog=0xA
L_8030688:
    a_move_f 12, d_ne, 16, 4
    a_move_f 14, d_sw, 16, 4
    a_jump L_8030688

    .align 2, 0

global_label NPCList_803069C
    .word NPC_80306A4
    .word 0xFF

    .align 2, 0

NPC_80306A4:
    a_init
    a_disable_turn
    a_set_dialog 0x14
    a_set_sprite_at -116, 0, 0, SP_Overworld_Haruka, frame=15
    a_stop

    .align 2, 0

global_label NPCList_80306BC
    .word NPC_80306C4
    .word 0xFF

    .align 2, 0

NPC_80306C4:
    a_init
    a_disable_dialog
    a_set_sprite_at -116, -4, 0, SP_Overworld_Haruka, frame=7
    a_stop

global_label NPCList_80306D8
    .word NPC_80306E0
    .word 0xFF

    .align 2, 0

NPC_80306E0:
    a_init_basic_npc_talk -116, -4, 0, SP_Overworld_Haruka, frame=7, dialog=0x19
    a_stop

    .align 2, 0

global_label NPCList_80306F8
    .word NPC_8030700
    .word 0xFF

    .align 2, 0

NPC_8030700:
    a_init_basic_npc_talk -80, -4, 0, SP_Overworld_Haruka, frame=5, dialog=0x1E
    a_stop

    .align 2, 0

global_label NPCList_8030718
    .word NPC_8030720
    .word 0xFF

    .align 2, 0

NPC_8030720:
    a_init_basic_npc_talk -72, -6, 0, SP_Overworld_Haruka, dialog=0x23
L_803072C:
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 9, d_se, 8, 3
    a_jump L_803072C

    .align 2, 0

global_label NPCList_8030770
    .word NPC_8030778
    .word 0xFF

    .align 2, 0

NPC_8030778:
    a_init
    a_sprite_auto_priority
    a_sprite_low_priority
    a_set_dialog 0x2D
    a_set_sprite_at -20, 42, 0, SP_Overworld_Haruka, frame=1
    a_stop

    .align 2, 0

global_label NPCList_8030790
    .word NPC_8030798
    .word 0xFF

    .align 2, 0

NPC_8030798:
    a_init
    a_sprite_auto_priority
    a_sprite_low_priority
    a_set_dialog 0x32
    a_set_sprite_at 64, 70, 0, SP_Overworld_Haruka, frame=1
    a_stop

    .align 2, 0

global_label NPCList_80307B0
    .word NPC_80307B8
    .word 0xFF

    .align 2, 0

NPC_80307B8:
    a_init_basic_npc_talk -72, -6, 0, SP_Overworld_Haruka, dialog=0x3C
L_80307C4:
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 10, d_sw, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 8, d_ne, 8, 3
    a_wait_f 7, 10
    a_move_f 9, d_se, 8, 3
    a_jump L_80307C4

    .align 2, 0

global_label NPCList_8030808
    .word NPC_8030810
    .word 0xFF

    .align 2, 0

NPC_8030810:
    a_init
    a_set_sprite_at -74, 36, 0, SP_Overworld_Haruka, frame=5
L_803081C:
    a_jump_if_flag 0x96, L_803082A
    a_wait 1
    a_jump L_803081C
L_803082A:
    a_move_f 8, d_ne, 16, 20
    a_destroy

    .align 2, 0

global_label NPCList_8030834
    .word NPC_803083C
    .word 0xFF

    .align 2, 0

NPC_803083C:
    a_init_basic_npc_talk 64, 74, 0, SP_Overworld_Haruka, frame=1, dialog=0x4B
L_803084A:
    a_jump_if_flag 0xA4, L_8030858
    a_wait 1
    a_jump L_803084A
L_8030858:
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8030864
    .word NPC_803086C
    .word 0xFF

    .align 2, 0

NPC_803086C:
    a_init
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite_at 34, 70, 8, SP_Overworld_PET, frame=0
    a_set_radius 8
    a_set_hitbox_offset 0, 8, 248
    a_disable_collision
L_8030882:
    a_set_no_z_clip
    a_wait 1
    a_jump_if_not_flag FLAG_ITEM_ACDC_LAN_ROOM_PET, L_8030882
    a_destroy

    .align 2, 0

global_label NPCList_8030890
    .word NPC_8030898
    .word 0xFF

    .align 2, 0

NPC_8030898:
    a_init_basic_npc_talk -130, 54, 0, SP_Overworld_Mayl, frame=3, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_80308B0
    .word NPC_80308B8
    .word 0xFF

    .align 2, 0

NPC_80308B8:
    a_init_basic_npc_talk -34, 54, 0, SP_Overworld_Mayl, dialog=0xF
L_80308C4:
    a_move_f 11, d_nw, 8, 4
    a_wait_f 7, 30
    a_move_f 9, d_se, 8, 4
    a_wait_f 3, 30
    a_jump L_80308C4

    .align 2, 0

global_label NPCList_80308E0
    .word NPC_80308E8
    .word 0xFF

    .align 2, 0

NPC_80308E8:
    a_init_basic_npc_talk 2, 52, 0, SP_Overworld_Mayl, frame=1, dialog=0xA
    a_stop

    .align 2, 0

global_label NPCList_8030900
    .word NPC_8030908
    .word 0xFF

    .align 2, 0

NPC_8030908:
    a_init_basic_npc_talk -10, 108, 0, SP_Overworld_Mayl, frame=7, dialog=0x23
    a_stop

    .align 2, 0

global_label NPCList_8030920
    .word NPC_8030928
    .word 0xFF

    .align 2, 0

NPC_8030928:
    a_init_basic_npc_talk -34, 6, 0, SP_Overworld_Dex, frame=3, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_8030940
    .word NPC_8030948
    .word 0xFF

    .align 2, 0

NPC_8030948:
    a_init_basic_npc_talk -34, 6, 0, SP_Overworld_Dex, frame=3, dialog=0xF
    a_stop

    .align 2, 0

global_label NPCList_8030960
    .word NPC_8030968
    .word 0xFF

    .align 2, 0

NPC_8030968:
    a_init_basic_npc_talk -8, 72, 0, SP_Overworld_Dex, frame=1, dialog=0x23
    a_stop

    .align 2, 0

global_label NPCList_8030980
    .word NPC_8030988
    .word 0xFF

    .align 2, 0

NPC_8030988:
    a_init_basic_npc_talk -8, 72, 0, SP_Overworld_Dex, frame=1, dialog=0x2D
    a_stop

    .align 2, 0

global_label NPCList_80309A0
    .word NPC_80309A8
    .word 0xFF

    .align 2, 0

NPC_80309A8:
    a_init_basic_npc_talk -20, 80, 0, SP_Overworld_Yai, frame=5, dialog=0x0
    a_stop

    .align 2, 0

global_label NPCList_80309C0
    .word NPC_80309C8
    .word 0xFF

    .align 2, 0

NPC_80309C8:
    a_init_basic_npc_talk -20, 80, 0, SP_Overworld_Yai, frame=5, dialog=0xA
    a_stop

    .align 2, 0

global_label NPCList_80309E0
    .word NPC_80309E8
    .word 0xFF

    .align 2, 0

NPC_80309E8:
    a_init_basic_npc_talk -10, 38, 0, SP_Overworld_Yai, dialog=0x14
L_80309F4:
    a_move_f 8, d_ne, 8, 4
    a_move_f 9, d_se, 8, 8
    a_move_f 10, d_sw, 8, 4
    a_move_f 11, d_nw, 8, 8
    a_jump L_80309F4

    .align 2, 0

global_label NPCList_8030A14
    .word NPC_8030A1C
    .word 0xFF

    .align 2, 0

NPC_8030A1C:
    a_init_basic_npc_talk -90, -4, 0, SP_Overworld_Yai, dialog=0x23
L_8030A28:
    a_move_f 9, d_se, 8, 8
    a_wait_f 1, 60
    a_move_f 11, d_nw, 8, 8
    a_wait_f 1, 60
    a_jump L_8030A28

    .align 2, 0

global_label NPCList_8030A44
    .word NPC_8030A4C
    .word 0xFF

    .align 2, 0

NPC_8030A4C:
    a_init_basic_npc_talk 34, 100, 0, SP_Overworld_Yai, frame=5, dialog=0x2A
    a_stop

    .align 2, 0

global_label NPCList_8030A64
    .word NPC_8030A78
    .word NPC_8030A8D
    .word NPC_8030AAA
    .word NPC_8030ABF
    .word 0xFF

    .align 2, 0

NPC_8030A78:
    a_init_basic_npc_talk 48, 2, 0, SP_Overworld_Higsby, frame=5, dialog=0x0
    a_stop

NPC_8030A8D:
    a_init_no_sprite
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 234, 7, 0
    a_set_radius 2
    a_set_dialog 0x0
    a_set_sprite_at 48, 2, 0, SP_Overworld_Higsby, frame=5
    a_stop

NPC_8030AAA:
    a_init_basic_npc_talk -46, 2, 0, SP_Overworld_YoungBoy, frame=7, dialog=0x29
    a_stop

NPC_8030ABF:
    a_init
    a_set_dialog 0x2A
    a_sprite_mask_set_flag 0x4
    a_set_sprite_at -134, 118, 0, SP_Overworld_YoungGirl, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8030AD8
    .word NPC_8030A78
    .word NPC_8030A8D
    .word NPC_8030ABF
    .word 0xFF

global_label NPCList_8030AE8
    .word NPC_8030AFC
    .word NPC_8030B11
    .word NPC_8030B2E
    .word NPC_8030B43
    .word 0xFF

    .align 2, 0

NPC_8030AFC:
    a_init_basic_npc_talk 48, 2, 0, SP_Overworld_Higsby, frame=5, dialog=0x0
    a_stop

NPC_8030B11:
    a_init_no_sprite
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 234, 7, 0
    a_set_radius 2
    a_set_dialog 0x0
    a_set_sprite_at 48, 2, 0, SP_Overworld_Higsby, frame=5
    a_stop

NPC_8030B2E:
    a_init_basic_npc_talk -46, 2, 0, SP_Overworld_YoungBoy, frame=7, dialog=0x29
    a_stop

NPC_8030B43:
    a_init
    a_set_dialog 0x2A
    a_sprite_mask_set_flag 0x4
    a_set_sprite_at -134, 118, 0, SP_Overworld_YoungGirl, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8030B5C
    .word NPC_8030B7C
    .word NPC_8030B91
    .word NPC_8030BAE
    .word NPC_8030BC3
    .word 0xFF

global_label NPCList_8030B70
    .word NPC_8030BAE
    .word NPC_8030BC3
    .word 0xFF

    .align 2, 0

NPC_8030B7C:
    a_init_basic_npc_talk 48, 2, 0, SP_Overworld_Higsby, frame=5, dialog=0x0
    a_stop

NPC_8030B91:
    a_init_no_sprite
    a_disable_turn
    a_disable_collision
    a_set_hitbox_offset 234, 7, 0
    a_set_radius 2
    a_set_dialog 0x0
    a_set_sprite_at 48, 2, 0, SP_Overworld_Higsby, frame=5
    a_stop

NPC_8030BAE:
    a_init_basic_npc_talk -46, 2, 0, SP_Overworld_YoungBoy, frame=7, dialog=0x50
    a_stop

NPC_8030BC3:
    a_init
    a_set_dialog 0x2A
    a_sprite_mask_set_flag 0x4
    a_set_sprite_at -134, 118, 0, SP_Overworld_YoungGirl, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8030BDC
    .word NPC_8030BF0
    .word NPC_8030C05
    .word NPC_8030C1B
    .word NPC_8030C31
    .word 0xFF

    .align 2, 0

NPC_8030BF0:
    a_init_basic_npc_talk -26, 26, 0, SP_Overworld_Conductor, dialog=0x0
    a_wait_f 5, 1
    a_jump L_8030C14

NPC_8030C05:
    a_init
    a_set_dialog 0x2
    a_disable_turn
    a_set_sprite_at -26, 46, 0, SP_Overworld_ManTie, frame=7
L_8030C14:
    a_wait 1
    a_jump L_8030C14

NPC_8030C1B:
    a_init
    a_set_dialog 0x3
    a_disable_turn
    a_set_sprite_at -40, 12, 0, SP_Overworld_WomanSkirt, frame=3
    a_stop

NPC_8030C31:
    a_init_basic_npc_talk -34, -128, 0, SP_Overworld_Conductor, frame=3, dialog=0x4
    a_stop

    .align 2, 0

global_label NPCList_8030C48
    .word NPC_8030C64
    .word NPC_8030C79
    .word 0xFF

global_label NPCList_8030C54
    .word NPC_8030C64
    .word NPC_8030C79
    .word NPC_8030D20
    .word 0xFF

    .align 2, 0

NPC_8030C64:
    a_init_basic_npc_talk -50, 60, 0, SP_Overworld_Conductor, frame=5, dialog=0xF
    a_stop

NPC_8030C79:
    a_init_basic_npc_talk -36, -116, 0, SP_Overworld_Conductor, frame=5, dialog=0x10
    a_stop

    .align 2, 0

global_label NPCList_8030C90
    .word NPC_8030CA0
    .word NPC_8030CB5
    .word NPC_8030CCA
    .word 0xFF

    .align 2, 0

NPC_8030CA0:
    a_init_basic_npc_talk -50, 60, 0, SP_Overworld_Conductor, frame=5, dialog=0x28
    a_stop

NPC_8030CB5:
    a_init_basic_npc_talk -36, -116, 0, SP_Overworld_Conductor, frame=5, dialog=0x29
    a_stop

NPC_8030CCA:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x2A
    a_set_sprite_at -70, -132, 0, SP_Overworld_YoungGirl, frame=7
    a_stop

    .align 2, 0

global_label NPCList_8030CE4
    .word NPC_8030CF4
    .word NPC_8030D09
    .word NPC_8030D20
    .word 0xFF

    .align 2, 0

NPC_8030CF4:
    a_init_basic_npc_talk -50, 60, 0, SP_Overworld_Conductor, frame=5, dialog=0x37
    a_stop

NPC_8030D09:
    a_init_basic_npc_talk -36, -116, 0, SP_Overworld_Conductor, frame=5, dialog=0x38
    a_stop

    .align 2, 0

NPC_8030D20:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0xBE
    a_set_sprite_at -94, -116, 0, SP_Overworld_YoungGirl, frame=3
    a_stop

    .align 2, 0

global_label EntityAllocParams_8030D38
    entity Actor, ACT_BrownCar, f(-360, 272, 0), 0x0
    .word 0xFF

global_label EntityAllocParams_8030D50
    entity Effect, EFI_MapObject, f(190, -144, 12), 0x3C
    .word 0xFF

global_label EntityAllocParams_8030D68
    entity Effect, EFI_MapObject, f(294, -150, 0), 0x1F
    .word 0xFF

global_label EntityAllocParams_8030D80
    entity Effect, EFI_MapObject, f(-44, -106, 0), 0x1B
    entity Effect, EFI_MapObject, f(-28, -28, 24), 0x1E
    entity Effect, EFI_MapObject, f(24, 144, 0), 0x45
    entity Effect, EFI_MapObject, f(24, 126, 0), 0x46
    .word 0xFF

global_label EntityAllocParams_8030DD4
    entity Effect, EFI_MapObject, f(26, 70, 0), 0xA
    entity Effect, EFI_MapObject, f(72, 22, 0), 0xB
    .word 0xFF

global_label EntityAllocParams_8030E00
    entity Effect, EFI_MapObject, f(-102, -48, 0), 0x8
    entity Effect, EFI_MapObject, f(-96, -48, 4), 0xE
    entity Effect, EFI_MapObject, f(-84, -48, 12), 0xE
    entity Effect, EFI_MapObject, f(-86, -44, 0), 0x8
    .word 0xFF

global_label EntityAllocParams_8030E54
    entity Effect, EFI_MapObject, f(-102, -48, 0), 0x8
    entity Effect, EFI_MapObject, f(-96, -48, 4), 0xE
    entity Effect, EFI_MapObject, f(-84, -48, 12), 0xE
    entity Effect, EFI_MapObject, f(-86, -44, 0), 0x8
    entity Effect, EFI_MapObject, f(-54, -54, 16), 0x8
    entity Effect, EFI_MapObject, f(-75, -30, 0), 0xE
    entity Effect, EFI_MapObject, f(-65, -32, 0), 0x8
    entity Effect, EFI_MapObject, f(-123, -26, 0), 0xE
    entity Effect, EFI_MapObject, f(-92, -54, 16), 0xE
    .word 0xFF

global_label EntityAllocParams_8030F0C
    entity Effect, EFI_MapObject, f(-54, -54, 16), 0x8
    entity Effect, EFI_MapObject, f(-75, -30, 0), 0xE
    entity Effect, EFI_MapObject, f(-65, -32, 0), 0x8
    entity Effect, EFI_MapObject, f(-123, -26, 0), 0xE
    .word 0xFF

global_label EntityAllocParams_8030F60
    entity Effect, EFI_MapObject, f(-56, -12, 0), 0xC
    .word 0xFF

global_label EntityAllocParams_8030F78
    entity Effect, EFI_MapObject, f(10, 162, 0), 0x12
    entity Effect, EFI_MapObject, f(-170, -14, 76), 0x12
    entity Effect, EFI_MapObject, f(-106, 22, 0), 0x15
    entity Effect, EFI_MapObject, f(-108, 44, 0), 0x16
    entity Effect, EFI_MapObject, f(-6, 60, 0), 0x17
    .word 0xFF

global_label EntityAllocParams_8030FE0
    entity Effect, EFI_MapObject, f(-38, 54, 64), 0x18
    .word 0xFF

global_label EntityAllocParams_8030FF8
    entity Effect, EFI_MapObject, f(-80, 16, 0), 0x19
    entity Effect, EFI_MapObject, f(-20, 40, 0), 0x1A
    .word 0xFF

global_label EntityAllocParams_8031024
    entity Effect, EFI_MapObject, f(0, 108, 0), 0x13
    entity Effect, EFI_MapObject, f(-8, -4, 0), 0x14
    .word 0xFF

