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
    a_init_basic_npc_talk 284, 122, 18, SP_Overworld_Prog, frame=1, dialog=0x2C
    a_stop

NPC_804B601:
    a_init_basic_npc_talk 224, 222, 0, SP_Overworld_Prog, frame=5, dialog=0x2D
L_804B60F:
    a_move_f 10, d_sw, 8, 10
    a_wait_f 3, 30
    a_move_f 8, d_ne, 8, 10
    a_wait_f 3, 30
    a_jump L_804B60F

    .align 2, 0

NPC_804B628:
    a_init_basic_npc_talk 450, -202, -64, SP_Overworld_Prog, frame=5, dialog=0x33
    a_stop

NPC_804B63D:
    a_init_basic_npc_talk 144, -164, -64, SP_Overworld_Prog, frame=1, dialog=0x3A
L_804B64B:
    a_move_f 8, d_ne, 8, 10
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 10
    a_wait_f 3, 30
    a_jump L_804B64B

    .align 2, 0

NPC_804B664:
    a_init_basic_npc_talk -150, -228, -64, SP_Overworld_Prog3, frame=1, dialog=0x3B
L_804B672:
    a_jump_if_flag 0xB3, L_804B680
    a_wait 1
    a_jump L_804B672
L_804B680:
    a_destroy

NPC_804B681:
    a_init_basic_npc_talk -528, 36, -64, SP_Overworld_Prog3, frame=3, dialog=0x3C
L_804B68F:
    a_jump_if_flag 0xB4, L_804B69D
    a_wait 1
    a_jump L_804B68F
L_804B69D:
    a_destroy

NPC_804B69E:
    a_create_bmd 98, 204, -64, FLAG_ITEM_POWER_PLANT_COMP_1_RATTON1_D, dialog=0x1
NPC_804B6C2:
    a_create_bmd 130, -180, 0, FLAG_ITEM_POWER_PLANT_COMP_1_RECOV120_C, dialog=0x2
NPC_804B6E6:
    a_create_bmd -92, 396, -64, FLAG_ITEM_POWER_PLANT_COMP_1_5000Z, dialog=0x3
NPC_804B70A:
    a_create_bmd -444, 268, -64, FLAG_ITEM_POWER_PLANT_COMP_1_XPANEL3_G, dialog=0x4
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
    a_init_basic_npc_talk -420, -4, 0, SP_Overworld_Prog, frame=1, dialog=0x6A
    a_stop

NPC_804B7A1:
    a_init_basic_npc_talk 50, -4, 0, SP_Overworld_Prog, frame=5, dialog=0x64
    a_stop

NPC_804B7B6:
    a_init_basic_npc_talk 180, -62, 0, SP_Overworld_Prog, frame=3, dialog=0x63
    a_stop

NPC_804B7CB:
    a_init_basic_npc_talk 480, 94, 0, SP_Overworld_Prog, frame=3, dialog=0x6B
    a_stop

    .align 2, 0

NPC_804B7E0:
    a_init_basic_npc_talk -108, -164, 0, SP_Overworld_Prog3, frame=7, dialog=0x76
L_804B7EE:
    a_jump_if_flag 0xCA, L_804B7FC
    a_wait 1
    a_jump L_804B7EE
L_804B7FC:
    a_destroy

NPC_804B7FD:
    a_init_basic_npc_talk 274, -276, 0, SP_Overworld_Prog3, frame=7, dialog=0x77
L_804B80B:
    a_jump_if_flag 0xCB, L_804B819
    a_wait 1
    a_jump L_804B80B
L_804B819:
    a_destroy

NPC_804B81A:
    a_create_bmd -286, -370, 0, FLAG_ITEM_POWER_PLANT_COMP_2_1000Z, dialog=0x0
NPC_804B83E:
    a_create_bmd 442, -290, -64, FLAG_ITEM_POWER_PLANT_COMP_2_800Z, dialog=0x1
NPC_804B862:
    a_create_bmd 310, -4, 0, FLAG_ITEM_POWER_PLANT_COMP_2_1200Z, dialog=0x2
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
    a_init_basic_npc_talk -302, -260, 96, SP_Overworld_Prog, frame=1, dialog=0x6A
L_804B8D2:
    a_move_f 8, d_ne, 8, 10
    a_wait_f 3, 30
    a_move_f 10, d_sw, 8, 10
    a_wait_f 3, 30
    a_jump L_804B8D2

NPC_804B8EB:
    a_init_basic_npc_talk -110, -420, 96, SP_Overworld_Prog, frame=3, dialog=0x6B
    a_stop

    .align 2, 0

NPC_804B900:
    a_init_basic_npc_talk 530, -194, 0, SP_Overworld_Prog, frame=1, dialog=0x71
    a_stop

NPC_804B915:
    a_init_basic_npc_talk 242, -340, 0, SP_Overworld_Prog3, frame=3, dialog=0x7C
L_804B923:
    a_jump_if_flag 0xCC, L_804B94E
    a_wait 1
    a_jump L_804B923
    a_destroy

NPC_804B932:
    a_init_basic_npc_talk 50, -116, 0, SP_Overworld_Prog3, frame=3, dialog=0x7D
L_804B940:
    a_jump_if_flag 0xCD, L_804B94E
    a_wait 1
    a_jump L_804B940
L_804B94E:
    a_destroy

NPC_804B94F:
    a_init_basic_npc_talk 194, -130, 0, SP_Overworld_Prog3, frame=1, dialog=0x7E
L_804B95D:
    a_jump_if_flag 0xCE, L_804B96B
    a_wait 1
    a_jump L_804B95D
L_804B96B:
    a_destroy

    .align 2, 0

NPC_804B96C:
    a_init_basic_npc_talk 470, -320, 0, SP_Overworld_Prog3, frame=5, dialog=0x7F
L_804B97A:
    a_jump_if_flag 0xCF, L_804B988
    a_wait 1
    a_jump L_804B97A
L_804B988:
    a_destroy

NPC_804B989:
    a_create_bmd -300, -36, 96, FLAG_ITEM_POWER_PLANT_COMP_3_1000Z, dialog=0x0
NPC_804B9AD:
    a_create_bmd -172, -36, 96, FLAG_ITEM_POWER_PLANT_COMP_3_500Z, dialog=0x2
NPC_804B9D1:
    a_init_basic_npc_talk -334, 254, 0, SP_Overworld_Prog, frame=1, dialog=0x71
    a_stop

NPC_804B9E6:
    a_init_basic_npc_talk 178, 190, 0, SP_Overworld_Prog, frame=1, dialog=0x71
    a_stop

    .align 2, 0

global_label NPCList_804B9FC
    .word NPC_804BA04
    .word 0xFF

    .align 2, 0

NPC_804BA04:
    a_init
    a_set_sprite_at 60, -398, 0, SP_Overworld_ProtoMan, frame=19
L_804BA10:
    a_jump_if_flag 0xBE, L_804BA1E
    a_wait 1
    a_jump L_804BA10
L_804BA1E:
    a_wait_f 21, 4
    a_move d_sw, 40, 2
    a_clear_flag 0xBE
    a_move d_sw, 40, 2
    a_stop

global_label NPCList_804BA34
    .word NPC_804BA3C
    .word 0xFF

    .align 2, 0

NPC_804BA3C:
    a_init
    a_set_sprite_at 60, -398, 0, SP_Overworld_ProtoMan, frame=20
L_804BA48:
    a_jump_if_flag 0xBE, L_804BA56
    a_wait 1
    a_jump L_804BA48
L_804BA56:
    a_set_sprite_frame 24
    a_stop

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
    a_init_basic_npc_talk 232, 164, 0, SP_Overworld_Prog, frame=5, dialog=0x63
L_804BA9A:
    a_move_f 10, d_sw, 8, 10
    a_wait_f 7, 30
    a_move_f 8, d_ne, 8, 10
    a_wait_f 7, 30
    a_jump L_804BA9A

NPC_804BAB3:
    a_init_basic_npc_talk -278, 68, 0, SP_Overworld_Prog, frame=5, dialog=0x73
    a_stop

    .align 2, 0

NPC_804BAC8:
    a_init_basic_npc_talk -212, 354, -64, SP_Overworld_Prog3, frame=7, dialog=0x7E
L_804BAD6:
    a_jump_if_flag 0xD0, L_804BAE4
    a_wait 1
    a_jump L_804BAD6
L_804BAE4:
    a_destroy

NPC_804BAE5:
    a_create_bmd 170, 324, 0, FLAG_ITEM_POWER_PLANT_COMP_4_1800Z, dialog=0x0
NPC_804BB09:
    a_create_bmd 362, 152, 0, FLAG_ITEM_POWER_PLANT_COMP_4_2000Z, dialog=0x1
NPC_804BB2D:
    a_create_bmd -114, 196, -64, FLAG_ITEM_POWER_PLANT_COMP_4_TYPHOON_D, dialog=0x2
    .align 2, 0

global_label EntityAllocParams_804BB54
    entity Effect, EFI_MapObject, f(12, 124, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-40, 104, 0), 0xFF020050
    entity Attack, ACI_Battery, f(52, 94, 0), 0xFFFFFF50
    entity Attack, ACI_Battery, f(52, 126, 0), 0xFFFFFF51
    entity Attack, ACI_Battery, f(52, 158, 0), 0xFFFFFF52
    .word 0xFF

global_label EntityAllocParams_804BBBC
    entity Effect, EFI_MapObject, f(12, 124, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-40, 104, 0), 0xFF020050
    .word 0xFF

global_label EntityAllocParams_804BBE8
    entity Effect, EFI_MapObject, f(-214, -4, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-272, 40, 0), 0xFF020060
    entity Effect, EFI_LightBulb, f(-272, 96, 0), 0xFF000260
    entity Attack, ACI_Battery, f(-156, -34, 0), 0xFFFFFF60
    entity Attack, ACI_Battery, f(-156, -2, 0), 0xFFFFFF61
    entity Attack, ACI_Battery, f(-156, 30, 0), 0xFFFFFF62
    entity Attack, ACI_Battery, f(-108, -34, 0), 0xFFFFFF63
    entity Attack, ACI_Battery, f(-108, -2, 0), 0xFFFFFF64
    entity Attack, ACI_Battery, f(-108, 30, 0), 0xFFFFFF65
    entity Effect, EFI_MapObject, f(44, 316, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-16, 350, 0), 0xFF020070
    entity Effect, EFI_LightBulb, f(-16, 384, 0), 0xFF010170
    entity Effect, EFI_LightBulb, f(58, 384, 0), 0xFF000270
    entity Attack, ACI_Battery, f(84, 254, 0), 0xFFFFFF70
    entity Attack, ACI_Battery, f(84, 286, 0), 0xFFFFFF71
    entity Attack, ACI_Battery, f(84, 318, 0), 0xFFFFFF72
    entity Attack, ACI_Battery, f(116, 254, 0), 0xFFFFFF73
    entity Attack, ACI_Battery, f(116, 286, 0), 0xFFFFFF74
    entity Attack, ACI_Battery, f(116, 318, 0), 0xFFFFFF75
    entity Attack, ACI_Battery, f(148, 254, 0), 0xFFFFFF76
    entity Attack, ACI_Battery, f(148, 286, 0), 0xFFFFFF77
    entity Attack, ACI_Battery, f(148, 318, 0), 0xFFFFFF78
    .word 0xFF

global_label EntityAllocParams_804BDA4
    entity Effect, EFI_MapObject, f(-214, -4, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-272, 40, 0), 0xFF020060
    entity Effect, EFI_LightBulb, f(-272, 96, 0), 0xFF000260
    entity Effect, EFI_MapObject, f(44, 316, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-16, 350, 0), 0xFF020070
    entity Effect, EFI_LightBulb, f(-16, 384, 0), 0xFF010170
    entity Effect, EFI_LightBulb, f(58, 384, 0), 0xFF000270
    .word 0xFF

global_label EntityAllocParams_804BE34
    entity Effect, EFI_MapObject, f(434, -82, 0), 0x3D
    entity Effect, EFI_LightBulb, f(334, -66, 0), 0xFF020080
    entity Effect, EFI_LightBulb, f(334, 24, 0), 0xFF000280
    entity Effect, EFI_LightBulb, f(338, 98, 0), 0xFF010180
    entity Attack, ACI_Battery, f(404, -50, 0), 0xFFFFFF80
    entity Attack, ACI_Battery, f(404, -2, 0), 0xFFFFFF81
    entity Attack, ACI_Battery, f(404, 46, 0), 0xFFFFFF82
    entity Attack, ACI_Battery, f(436, -50, 0), 0xFFFFFF83
    entity Attack, ACI_Battery, f(436, -2, 0), 0xFFFFFF84
    entity Attack, ACI_Battery, f(436, 46, 0), 0xFFFFFF85
    entity Attack, ACI_Battery, f(468, -50, 0), 0xFFFFFF86
    entity Attack, ACI_Battery, f(468, -2, 0), 0xFFFFFF87
    entity Attack, ACI_Battery, f(468, 46, 0), 0xFFFFFF88
    entity Effect, EFI_MapObject, f(4, 44, 0), 0x3D
    entity Effect, EFI_LightBulb, f(170, 166, 0), 0xFF020090
    entity Effect, EFI_LightBulb, f(-50, 222, 0), 0xFF010190
    entity Effect, EFI_LightBulb, f(14, 256, 0), 0xFF000290
    entity Attack, ACI_Battery, f(36, 62, 0), 0xFFFFFF90
    entity Attack, ACI_Battery, f(36, 110, 0), 0xFFFFFF91
    entity Attack, ACI_Battery, f(36, 158, 0), 0xFFFFFF92
    entity Attack, ACI_Battery, f(68, 62, 0), 0xFFFFFF93
    entity Attack, ACI_Battery, f(68, 110, 0), 0xFFFFFF94
    entity Attack, ACI_Battery, f(68, 158, 0), 0xFFFFFF95
    entity Attack, ACI_Battery, f(100, 62, 0), 0xFFFFFF96
    entity Attack, ACI_Battery, f(100, 110, 0), 0xFFFFFF97
    entity Attack, ACI_Battery, f(100, 158, 0), 0xFFFFFF98
    entity Effect, EFI_MapObject, f(-316, 148, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-110, 72, 0), 0xFF0200A0
    entity Effect, EFI_LightBulb, f(-368, 120, 0), 0xFF0101A0
    entity Effect, EFI_LightBulb, f(-310, 288, 0), 0xFF0002A0
    entity Attack, ACI_Battery, f(-268, 126, 0), 0xFFFFFFA0
    entity Attack, ACI_Battery, f(-268, 174, 0), 0xFFFFFFA1
    entity Attack, ACI_Battery, f(-268, 222, 0), 0xFFFFFFA2
    entity Attack, ACI_Battery, f(-236, 126, 0), 0xFFFFFFA3
    entity Attack, ACI_Battery, f(-236, 174, 0), 0xFFFFFFA4
    entity Attack, ACI_Battery, f(-236, 222, 0), 0xFFFFFFA5
    entity Attack, ACI_Battery, f(-204, 126, 0), 0xFFFFFFA6
    entity Attack, ACI_Battery, f(-204, 174, 0), 0xFFFFFFA7
    entity Attack, ACI_Battery, f(-204, 222, 0), 0xFFFFFFA8
    entity Attack, ACI_Battery, f(-172, 126, 0), 0xFFFFFFA9
    entity Attack, ACI_Battery, f(-172, 174, 0), 0xFFFFFFAA
    entity Attack, ACI_Battery, f(-172, 222, 0), 0xFFFFFFAB
    entity Effect, EFI_MapObject, f(-116, 378, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-22, 358, 0), 0xFF0200B0
    entity Attack, ACI_Battery, f(-76, 382, 0), 0xFFFFFFB0
    .word 0xFF

global_label EntityAllocParams_804C1BC
    entity Effect, EFI_MapObject, f(434, -82, 0), 0x3D
    entity Effect, EFI_LightBulb, f(334, -66, 0), 0xFF020080
    entity Effect, EFI_LightBulb, f(334, 24, 0), 0xFF000280
    entity Effect, EFI_LightBulb, f(338, 98, 0), 0xFF010180
    entity Effect, EFI_MapObject, f(4, 44, 0), 0x3D
    entity Effect, EFI_LightBulb, f(170, 166, 0), 0xFF020090
    entity Effect, EFI_LightBulb, f(-50, 222, 0), 0xFF010190
    entity Effect, EFI_LightBulb, f(14, 256, 0), 0xFF000290
    entity Effect, EFI_MapObject, f(-316, 148, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-110, 72, 0), 0xFF0200A0
    entity Effect, EFI_LightBulb, f(-368, 120, 0), 0xFF0101A0
    entity Effect, EFI_LightBulb, f(-310, 288, 0), 0xFF0002A0
    entity Effect, EFI_MapObject, f(-116, 378, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-22, 358, 0), 0xFF0200B0
    .word 0xFF

global_label EntityAllocParams_804C2D8
    entity Effect, EFI_MapObject, f(-94, -26, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-126, -82, 0), 0xFF0200C0
    entity Effect, EFI_LightBulb, f(-62, -82, 0), 0xFF0101C0
    entity Effect, EFI_LightBulb, f(-22, -82, 0), 0xFF0002C0
    entity Attack, ACI_Battery, f(-52, -26, 0), 0xFFFFFFC0
    entity Attack, ACI_Battery, f(-52, 22, 0), 0xFFFFFFC1
    entity Attack, ACI_Battery, f(-52, 70, 0), 0xFFFFFFC2
    entity Attack, ACI_Battery, f(-20, -26, 0), 0xFFFFFFC3
    entity Attack, ACI_Battery, f(-20, 22, 0), 0xFFFFFFC4
    entity Attack, ACI_Battery, f(-20, 70, 0), 0xFFFFFFC5
    entity Attack, ACI_Battery, f(12, -26, 0), 0xFFFFFFC6
    entity Attack, ACI_Battery, f(12, 22, 0), 0xFFFFFFC7
    entity Attack, ACI_Battery, f(12, 70, 0), 0xFFFFFFC8
    entity Attack, ACI_Battery, f(44, -26, 0), 0xFFFFFFC9
    entity Attack, ACI_Battery, f(44, 22, 0), 0xFFFFFFCA
    entity Attack, ACI_Battery, f(44, 70, 0), 0xFFFFFFCB
global_label EntityAllocParams_804C418
    entity Effect, EFI_MapObject, f(-94, -26, 0), 0x3D
    entity Effect, EFI_LightBulb, f(-126, -82, 0), 0xFF0200C0
    entity Effect, EFI_LightBulb, f(-62, -82, 0), 0xFF0101C0
    entity Effect, EFI_LightBulb, f(-22, -82, 0), 0xFF0002C0
    .word 0xFF

listGridSolution:
    .word gridSolution0
    .word gridSolution1
    .word gridSolution2
    .word gridSolution3
    .word gridSolution4
    .word gridSolution5
    .word gridSolution6
    .word gridSolution7

gridSolution0:
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
gridSolution1:
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
gridSolution2:
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  1, -1,  0, -1, -1, -1,  2, -1, -1, -1, -1, -1, -1, -1
gridSolution3:
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1
gridSolution4:
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1,  2, -1,  1, -1, -1, -1, -1, -1, -1, -1, -1, -1
gridSolution5:
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
    .byte   -1, -1,  0, -1, -1, -1,  1, -1,  2, -1, -1, -1, -1, -1, -1, -1
gridSolution6:
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
    .byte    0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
gridSolution7:
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1
    .byte   -1,  1, -1, -1, -1, -1, -1, -1, -1,  2, -1,  0, -1, -1, -1, -1


_ts PowerPlant_Init
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


_ts PowerPlant_ResetState
    push       {lr}
    mov        r0,#Item_BatteryA
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BattA_Ct
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BatteryB
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BattB_Ct
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BatteryC
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BattC_Ct
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BatteryD
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BattD_Ct
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BatteryE
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#Item_BattE_Ct
    mov        r1,#0x0
    bl         KeyItem_SetAmount
    mov        r0,#FLAG_POWER_PLANT_BATTERY_A
    bl         Flag_ClearBase
    mov        r0,#FLAG_POWER_PLANT_BATTERY_B
    bl         Flag_ClearBase
    mov        r0,#FLAG_POWER_PLANT_BATTERY_C
    bl         Flag_ClearBase
    mov        r0,#FLAG_POWER_PLANT_BATTERY_D
    bl         Flag_ClearBase
    mov        r0,#FLAG_POWER_PLANT_BATTERY_E
    bl         Flag_ClearBase
    pop        {pc}

    .align 2, 0

PTR_Struct_2002070_0804c698:
    .word gPowerPlant


_ts PowerPlant_RandomizeAllSolutions
    push       {lr}
    mov        r0,#0x50
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0x60
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0x70
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0x80
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0x90
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0xa0
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0xb0
    bl         PowerPlant_RandomizeSolution
    mov        r0,#0xc0
    bl         PowerPlant_RandomizeSolution
    pop        {pc}


@@ Randomizes the specified grid solution to be one of 3 values. Since all 3
@@ are the same, this does nothing.
_ts PowerPlant_RandomizeSolution
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
    .word gPowerPlant

PTR_DAT_0804c728:
    .word DAT_0804c71c


_ts PowerPlant_GetBatteryCount
    push       {lr}
    ldr        r5,PTR_Struct_2002070_0804c76c
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    add        r6,r0,#0x0
    add        r0,#0x4
    ldrb       r2,[r5,r0]
    ldr        r7,PTR_listGridSolution_0804c770
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
    .word gPowerPlant

PTR_listGridSolution_0804c770:
    .word listGridSolution


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
    .word gPowerPlant

PTR_PTR_DAT_0804c7b8:
    .word listGridSolution


_ts PowerPlant_AddBattery
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


_ts PowerPlant_RemoveBattery
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


_ts PowerPlant_GetBatteryInSlot
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


_ts PowerPlant_SwitchOn
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


_ts PowerPlant_SwitchOff
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


_ts PowerPlant_TestSwitch
    sub        r0,#0x50
    lsr        r0,r0,#0x4
    mov        r1,#0x80
    lsr        r1,r0
    ldr        r7,PTR_Struct_2002070_0804c864
    ldr        r0,[r7,#0xc]
    tst        r0,r1
    mov        pc,lr


_ts PowerPlant_DrainBattery
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
    .word gPowerPlant


_ts PowerPlant_TestBatteryCount
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


_ts PowerPlant_CheckPaths
    push       {lr}
    add        r6,r0,#0x0
    sub        r6,#0x50
    lsr        r6,r6,#0x4
    lsl        r6,r6,#0x2
    ldr        r7,PTR_PTR_PowerPlant_CheckPaths_Grid_0_0804cc4c
    ldr        r7,[r7,r6]
    mov        lr,pc
    bx         r7
    pop        {pc}

PTR_PowerPlant_CheckPaths_Grid_0_0804c8b8:
    .word PowerPlant_CheckPaths_Grid_0
    .word PowerPlant_CheckPaths_Grid_1
    .word PowerPlant_CheckPaths_Grid_2
    .word PowerPlant_CheckPaths_Grid_3
    .word PowerPlant_CheckPaths_Grid_4
    .word PowerPlant_CheckPaths_Grid_5
    .word PowerPlant_CheckPaths_Grid_6
    .word PowerPlant_CheckPaths_Grid_7


_ts PowerPlant_CheckPaths_Grid_0
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c8ea
    bl         PowerPlant_SetPathPalette_0
    b          LAB_0804c8fa
LAB_0804c8ea:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc50
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    pop        {r5}
LAB_0804c8fa:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_1
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c90e
    bl         PowerPlant_SetPathPalette_0
    b          LAB_0804c924
LAB_0804c90e:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc54
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_02
    pop        {r5}
LAB_0804c924:
    pop        {pc}

    .align 2, 0


_ts PowerPlant_CheckPaths_Grid_2
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c93a
    bl         PowerPlant_SetPathPalette_1
    b          LAB_0804c956
LAB_0804c93a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049E48_0804cc58
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_03
    Flag_ClearIgnore F_IGNORE_WALL_04
    Flag_ClearIgnore F_IGNORE_WALL_05
    pop        {r5}
LAB_0804c956:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_3
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c96a
    bl         PowerPlant_SetPathPalette_0
    b          LAB_0804c986
LAB_0804c96a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc5c
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_01
    Flag_ClearIgnore F_IGNORE_WALL_02
    pop        {r5}
LAB_0804c986:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_4
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c99a
    bl         PowerPlant_SetPathPalette_1
    b          LAB_0804c9b6
LAB_0804c99a:
    push       {r5}
    ldr        r0,PTR_BgTask_8049E48_0804cc60
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_03
    Flag_ClearIgnore F_IGNORE_WALL_04
    Flag_ClearIgnore F_IGNORE_WALL_05
    pop        {r5}
LAB_0804c9b6:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_5
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804c9ca
    bl         PowerPlant_SetPathPalette_2
    b          LAB_0804c9e6
LAB_0804c9ca:
    push       {r5}
    ldr        r0,PTR_BgTask_8049F08_0804cc64
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_06
    Flag_ClearIgnore F_IGNORE_WALL_07
    Flag_ClearIgnore F_IGNORE_WALL_08
    pop        {r5}
LAB_0804c9e6:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_6
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804ca06
    push       {r5}
    ldr        r0,PTR_BgTask_8049FE0_0804cc68
    bl         BgTask_AddNew
    Flag_SetIgnore F_IGNORE_WALL_09
    pop        {r5}
    b          LAB_0804ca16
LAB_0804ca06:
    push       {r5}
    ldr        r0,PTR_BgTask_8049FC8_0804cc6c
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_09
    pop        {r5}
LAB_0804ca16:
    pop        {pc}


_ts PowerPlant_CheckPaths_Grid_7
    push       {lr}
    push       {r0}
    bl         PowerPlant_TestSwitch
    pop        {r0}
    beq        LAB_0804ca3c
    push       {r0}
    bl         PowerPlant_SetPathPalette_0
    pop        {r0}
    bl         PowerPlant_GetBatteryCount
    cmp        r0,#0x3
    bne        LAB_0804ca58
    Flag_SetBase 0xD7
    b          LAB_0804ca58
LAB_0804ca3c:
    push       {r5}
    ldr        r0,PTR_BgTask_8049D88_0804cc70
    bl         BgTask_AddNew
    Flag_ClearIgnore F_IGNORE_WALL_00
    Flag_ClearIgnore F_IGNORE_WALL_01
    Flag_ClearIgnore F_IGNORE_WALL_02
    pop        {r5}
LAB_0804ca58:
    pop        {pc}

    .align 2, 0


_ts PowerPlant_SetPathPalette_0
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804ca78
    push       {r0,r1,r5}
    Flag_SetIgnore F_IGNORE_WALL_00
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
    Flag_SetIgnore F_IGNORE_WALL_01
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
    Flag_SetIgnore F_IGNORE_WALL_02
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


_ts PowerPlant_SetPathPalette_1
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb04
    push       {r0,r1,r5}
    Flag_SetIgnore F_IGNORE_WALL_03
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
    Flag_SetIgnore F_IGNORE_WALL_04
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
    Flag_SetIgnore F_IGNORE_WALL_05
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


_ts PowerPlant_SetPathPalette_2
    push       {lr}
    mov        r1,#0x0
    push       {r0,r1}
    mov        r1,#0x0
    bl         FUN_0804c774
    pop        {r0,r1}
    bne        LAB_0804cb90
    push       {r0,r1,r5}
    Flag_SetIgnore F_IGNORE_WALL_06
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
    Flag_SetIgnore F_IGNORE_WALL_07
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
    Flag_SetIgnore F_IGNORE_WALL_08
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
    bl         PowerPlant_RandomizeSolution
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
    .word gPowerPlant

PTR_Struct_2002070_0804cc48:
    .word gPowerPlant

PTR_PTR_PowerPlant_CheckPaths_Grid_0_0804cc4c:
    .word PTR_PowerPlant_CheckPaths_Grid_0_0804c8b8

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
