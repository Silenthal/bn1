#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_8028964
    .word NPC_8028984
    .word NPC_8028999
    .word NPC_80289B1
    .word NPC_80289D7
    .word NPC_80289EC
    .word NPC_8028A11
    .word NPC_8028A2B
    .word 0xFF

    .align 2, 0

NPC_8028984:
    a_init
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_Dex
    a_set_pos -134, -26
    a_set_sprite_frame 3
    a_stop

NPC_8028999:
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -12, -4
    a_set_radius 3
    a_set_sprite_frame 3
    a_stop

NPC_80289B1:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_Yai
    a_set_pos 74, -44
    a_set_sprite_frame 3
L_80289BF:
    a_wait 1
    a_jump_if_not_flag 0xD0, L_80289BF
    a_move_f 10, d_sw, 32, 20
    a_set_sprite_frame 5
    a_stop

NPC_80289D7:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 84, 90
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_80289EC:
    a_init
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -142, 82
L_80289F8:
    a_wait_f 3, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 7, 30
    a_move_f 9, d_se, 8, 6
    a_jump L_80289F8

NPC_8028A11:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -12, 12
    a_set_radius 3
    a_set_sprite_frame 7
    a_stop

NPC_8028A2B:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -118, 86
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_8028A44
    .word NPC_8028A94
    .word NPC_8028AA8
    .word NPC_8028ABC
    .word NPC_8028AD0
    .word NPC_8028AE4
    .word NPC_8028AF8
    .word NPC_8028B0E
    .word NPC_8028B24
    .word NPC_8028B37
    .word 0xFF

global_label NPCList_8028A6C
    .word NPC_8028A94
    .word NPC_8028AA8
    .word NPC_8028ABC
    .word NPC_8028AD0
    .word NPC_8028AE4
    .word NPC_8028AF8
    .word NPC_8028B0E
    .word NPC_8028B24
    .word NPC_8028B50
    .word 0xFF

    .align 2, 0

NPC_8028A94:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Dex
    a_set_pos -48, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028AA8:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028ABC:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Yai
    a_set_pos -96, -16, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028AD0:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 0, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028AE4:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -96, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028AF8:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_8028B0E:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -96, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028B24:
    a_init
    a_set_sprite SP_Overworld_Lan
    a_set_pos 0, -16, 18
    a_set_sprite_frame 25
    a_stop

NPC_8028B37:
    a_init
    a_set_sprite SP_Overworld_Mari
    a_set_pos 76, 50, 4
    a_move_f 11, d_nw, 8, 4
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_8028B50:
    a_init
    a_set_sprite SP_Overworld_Mari
    a_set_pos 76, 18, 4
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8028B64
    .word NPC_8028B84
    .word NPC_8028B99
    .word NPC_8028BB1
    .word NPC_8028BC6
    .word NPC_8028BDB
    .word NPC_8028C00
    .word NPC_8028C19
    .word 0xFF

    .align 2, 0

NPC_8028B84:
    a_init
    a_set_dialog 0x15
    a_set_sprite SP_Overworld_Dex
    a_set_pos -134, -26
    a_set_sprite_frame 3
    a_stop

NPC_8028B99:
    a_init
    a_disable_turn
    a_set_dialog 0x11
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -12, -4
    a_set_radius 3
    a_set_sprite_frame 3
    a_stop

NPC_8028BB1:
    a_init
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_Yai
    a_set_pos 74, -44
    a_set_sprite_frame 3
    a_stop

NPC_8028BC6:
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 84, 90
    a_set_sprite_frame 5
    a_stop

NPC_8028BDB:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -142, 82
L_8028BE7:
    a_wait_f 3, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 7, 30
    a_move_f 9, d_se, 8, 6
    a_jump L_8028BE7

    .align 2, 0

NPC_8028C00:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x12
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -12, 12
    a_set_radius 3
    a_set_sprite_frame 7
    a_stop

NPC_8028C19:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x13
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -118, 86
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_8028C30
    .word NPC_8028D84
    .word NPC_8028D98
    .word NPC_8028DAC
    .word NPC_8028DC0
    .word NPC_8028DD4
    .word NPC_8028DE8
    .word NPC_8028DFC
    .word NPC_8028E12
    .word NPC_8028E3B
    .word NPC_8028E4E
    .word 0xFF

global_label NPCList_8028C5C
    .word NPC_8028D84
    .word NPC_8028D98
    .word NPC_8028DAC
    .word NPC_8028DC0
    .word NPC_8028DD4
    .word NPC_8028DE8
    .word NPC_8028DFC
    .word NPC_8028E12
    .word NPC_8028E28
    .word NPC_8028E3B
    .word NPC_8028E4E
    .word 0xFF

global_label NPCList_8028C8C
    .word NPC_8028E61
    .word NPC_8028E76
    .word NPC_8028E8B
    .word NPC_8028EB0
    .word NPC_8028EC5
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word NPC_8028F0A
    .word 0xFF

global_label NPCList_8028CB0
    .word NPC_8028D84
    .word NPC_8028D98
    .word NPC_8028DAC
    .word NPC_8028DC0
    .word NPC_8028DD4
    .word NPC_8028DE8
    .word NPC_8028DFC
    .word NPC_8028E12
    .word NPC_8028E28
    .word NPC_8028F21
    .word 0xFF

global_label NPCList_8028CDC
    .word NPC_8028F7F
    .word NPC_8028E76
    .word NPC_8028E8B
    .word NPC_8028EB0
    .word NPC_8028F94
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word NPC_8028FA9
    .word 0xFF

global_label NPCList_8028D00
    .word NPC_8028FC0
    .word NPC_8029008
    .word NPC_802901D
    .word NPC_8028EB0
    .word NPC_8028F94
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word NPC_8028FA9
    .word 0xFF

global_label NPCList_8028D24
    .word NPC_8028FF3
    .word NPC_8029008
    .word NPC_802901D
    .word NPC_8028EB0
    .word NPC_8028F94
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word NPC_8028FA9
    .word 0xFF

global_label NPCList_8028D48
    .word NPC_8028FF3
    .word NPC_8029008
    .word NPC_802901D
    .word NPC_8028EB0
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word 0xFF

global_label NPCList_8028D64
    .word NPC_8029008
    .word NPC_8028EB0
    .word NPC_8028EDA
    .word NPC_8028EF1
    .word 0xFF

global_label NPCList_8028D78
    .word NPC_8029008
    .word NPC_8028EF1
    .word 0xFF

    .align 2, 0

NPC_8028D84:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Dex
    a_set_pos -48, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028D98:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028DAC:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Yai
    a_set_pos -96, -16, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028DC0:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 0, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028DD4:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -96, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028DE8:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -48, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028DFC:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_8028E12:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -96, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8028E28:
    a_init
    a_set_sprite SP_Overworld_Lan
    a_set_pos 0, -16, 18
    a_set_sprite_frame 25
    a_stop

NPC_8028E3B:
    a_init
    a_set_sprite SP_Overworld_Mari
    a_set_pos 76, 18, 4
    a_set_sprite_frame 5
    a_stop

NPC_8028E4E:
    a_init
    a_set_sprite SP_Overworld_Higsby
    a_set_pos 76, 48, 4
    a_set_sprite_frame 5
    a_stop

NPC_8028E61:
    a_init
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_Dex
    a_set_pos -144, 80
    a_set_sprite_frame 1
    a_stop

NPC_8028E76:
    a_init
    a_set_dialog 0x22
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -10, 30
    a_set_sprite_frame 7
    a_stop

NPC_8028E8B:
    a_init
    a_set_dialog 0x23
    a_set_sprite SP_Overworld_Yai
    a_set_pos -118, -28
L_8028E97:
    a_move_f 9, d_se, 8, 6
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 1, 30
    a_jump L_8028E97

    .align 2, 0

NPC_8028EB0:
    a_init
    a_set_dialog 0x25
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 80, -50
    a_set_sprite_frame 5
    a_stop

NPC_8028EC5:
    a_init
    a_set_dialog 0x26
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -110, 90
    a_set_sprite_frame 5
    a_stop

NPC_8028EDA:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x27
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -48, 80, 18
    a_set_sprite_frame 12
    a_stop

NPC_8028EF1:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x28
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_8028F0A:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x29
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 90, 40, 4
    a_set_sprite_frame 1
    a_stop

NPC_8028F21:
    a_init
    a_set_sprite SP_Overworld_Higsby
    a_set_pos 76, 50, 4
    a_move_f 11, d_nw, 8, 4
    a_set_sprite_frame 5
L_8028F33:
    a_jump_if_flag 0x96, L_8028F41
    a_wait 1
    a_jump L_8028F33
L_8028F41:
    a_move_f 8, d_ne, 8, 2
    a_wait_f 1, 1
    a_wait_f 12, 68
    a_set_flag 0xA0
    a_wait 26
    a_move_f 10, d_sw, 8, 2
    a_set_sprite_frame 5
    a_set_flag 0x97
L_8028F5F:
    a_jump_if_flag 0x98, L_8028F6D
    a_wait 1
    a_jump L_8028F5F
L_8028F6D:
    a_move_f 9, d_se, 8, 10
    a_set_sprite_frame 3
    a_set_flag 0x99
    a_stop

NPC_8028F7F:
    a_init
    a_set_dialog 0x2D
    a_set_sprite SP_Overworld_Dex
    a_set_pos 94, 44
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_8028F94:
    a_init
    a_set_dialog 0x31
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 84, 100
    a_set_sprite_frame 7
    a_stop

NPC_8028FA9:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x34
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -144, 94
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8028FC0:
    a_init
    a_set_sprite SP_Overworld_Dex
    a_set_pos 72, 18, 4
    a_set_sprite_frame 1
L_8028FCC:
    a_jump_if_flag 0x9C, L_8028FDA
    a_wait 1
    a_jump L_8028FCC
L_8028FDA:
    a_set_sprite_frame 14
L_8028FDC:
    a_jump_if_flag 0x9F, L_8028FEA
    a_wait 1
    a_jump L_8028FDC
L_8028FEA:
    a_set_sprite_frame 1
    a_stop

NPC_8028FF3:
    a_init
    a_set_dialog 0x3C
    a_set_sprite SP_Overworld_Dex
    a_set_pos 92, 0, 4
    a_set_sprite_frame 7
    a_stop

    .align 2, 0

NPC_8029008:
    a_init
    a_set_dialog 0x3D
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 94, 48, 4
    a_set_sprite_frame 5
    a_stop

NPC_802901D:
    a_init
    a_set_dialog 0x40
    a_set_sprite SP_Overworld_Yai
    a_set_pos 44, 46
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_8029034
    .word NPC_802904C
    .word NPC_8029061
    .word NPC_8029076
    .word NPC_802908B
    .word NPC_80290A0
    .word 0xFF

    .align 2, 0

NPC_802904C:
    a_init
    a_set_dialog 0x55
    a_set_sprite SP_Overworld_Dex
    a_set_pos -134, -26
    a_set_sprite_frame 3
    a_stop

NPC_8029061:
    a_init
    a_set_dialog 0x57
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -10, 30
    a_set_sprite_frame 7
    a_stop

NPC_8029076:
    a_init
    a_set_dialog 0x58
    a_set_sprite SP_Overworld_Yai
    a_set_pos 82, -50
    a_set_sprite_frame 5
    a_stop

NPC_802908B:
    a_init
    a_set_dialog 0x59
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 84, 90
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_80290A0:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x5A
    a_disable_turn
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

global_label NPCList_80290BC
    .word NPC_80290C4
    .word 0xFF

    .align 2, 0

NPC_80290C4:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x5F
    a_disable_turn
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

global_label NPCList_80290E0
    .word NPC_8029104
    .word NPC_8029119
    .word NPC_802912E
    .word NPC_8029153
    .word NPC_8029168
    .word NPC_802917D
    .word NPC_8029194
    .word NPC_80291AD
    .word 0xFF

    .align 2, 0

NPC_8029104:
    a_init
    a_set_dialog 0x64
    a_set_sprite SP_Overworld_Dex
    a_set_pos -144, 80
    a_set_sprite_frame 1
    a_stop

NPC_8029119:
    a_init
    a_set_dialog 0x65
    a_set_sprite SP_Overworld_Mayl
    a_set_pos -10, 30
    a_set_sprite_frame 7
    a_stop

NPC_802912E:
    a_init
    a_set_dialog 0x66
    a_set_sprite SP_Overworld_Yai
    a_set_pos -118, -28
L_802913A:
    a_move_f 9, d_se, 8, 6
    a_wait_f 1, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 1, 30
    a_jump L_802913A

NPC_8029153:
    a_init
    a_set_dialog 0x69
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 80, -50
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

NPC_8029168:
    a_init
    a_set_dialog 0x6A
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -110, 90
    a_set_sprite_frame 5
    a_stop

NPC_802917D:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x6B
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -48, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029194:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x6C
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_80291AD:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x6D
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 90, 40, 4
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_80291C4
    .word NPC_80291F0
    .word NPC_8029204
    .word NPC_8029218
    .word NPC_802922C
    .word NPC_8029240
    .word NPC_8029254
    .word NPC_8029268
    .word NPC_802927E
    .word NPC_8029294
    .word NPC_80292A7
    .word 0xFF

    .align 2, 0

NPC_80291F0:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Dex
    a_set_pos -48, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029204:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Mayl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029218:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_Yai
    a_set_pos -96, -16, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_802922C:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 0, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029240:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -96, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029254:
    a_init
    a_disable_collision
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -48, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029268:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_802927E:
    a_init
    a_disable_collision
    a_sprite_mask_set_flag 0x4
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos -96, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029294:
    a_init
    a_set_sprite SP_Overworld_Lan
    a_set_pos 0, -16, 18
    a_set_sprite_frame 25
    a_stop

NPC_80292A7:
    a_init
    a_set_sprite SP_Overworld_Mari
    a_set_pos 76, 18, 4
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_80292BC
    .word NPC_8029104
    .word NPC_8029119
    .word NPC_802912E
    .word NPC_8029153
    .word NPC_8029168
    .word NPC_802917D
    .word NPC_8029194
    .word NPC_80291AD
    .word NPC_80292E4
    .word 0xFF

    .align 2, 0

NPC_80292E4:
    a_init
    a_set_dialog 0x7A
    a_set_sprite SP_Overworld_Mari
    a_set_pos 86, 94
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_80292FC
    .word NPC_8029310
    .word NPC_8029325
    .word NPC_802933A
    .word NPC_8029353
    .word 0xFF

    .align 2, 0

NPC_8029310:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -130, 54
    a_set_sprite_frame 3
    a_stop

NPC_8029325:
    a_init
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 90, 50
    a_set_sprite_frame 5
    a_stop

NPC_802933A:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

NPC_8029353:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 80, -40
L_8029361:
    a_move_f 10, d_sw, 8, 26
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 26
    a_wait_f 1, 30
    a_jump L_8029361

    .align 2, 0

global_label NPCList_802937C
    .word NPC_8029384
    .word 0xFF

    .align 2, 0

NPC_8029384:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -134, -26
L_8029390:
    a_move_f 9, d_se, 8, 6
    a_wait_f 3, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 7, 30
    a_jump L_8029390

    .align 2, 0

global_label NPCList_80293AC
    .word NPC_8029384
    .word NPC_80293C0
    .word NPC_80293D5
    .word NPC_80293EE
    .word 0xFF

    .align 2, 0

NPC_80293C0:
    a_init
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 90, 50
    a_set_sprite_frame 5
    a_stop

NPC_80293D5:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_collision
    a_disable_turn
    a_set_dialog 0x11
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

NPC_80293EE:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x12
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 80, -40
L_80293FC:
    a_move_f 10, d_sw, 8, 26
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 26
    a_wait_f 1, 30
    a_jump L_80293FC

    .align 2, 0

global_label NPCList_8029418
    .word NPC_802942C
    .word 0xFF

global_label NPCList_8029420
    .word NPC_802942C
    .word NPC_8029447
    .word 0xFF

    .align 2, 0

NPC_802942C:
    a_init
    a_set_hitbox_offset 10, 0, 0
    a_set_radius 10
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos -206, 50
    a_set_sprite_frame 1
    a_stop

NPC_8029447:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x11
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 82, 62
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8029460
    .word NPC_8029470
    .word NPC_802948B
    .word NPC_80294A0
    .word 0xFF

    .align 2, 0

NPC_8029470:
    a_init
    a_set_hitbox_offset 10, 0, 0
    a_set_radius 10
    a_set_dialog 0x19
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos -206, 50
    a_set_sprite_frame 1
    a_stop

NPC_802948B:
    a_init
    a_set_dialog 0x1A
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 198, 54
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_80294A0:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x1D
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 84, 16
L_80294AE:
    a_move_f 9, d_se, 8, 6
    a_wait_f 3, 30
    a_move_f 11, d_nw, 8, 6
    a_wait_f 7, 30
    a_jump L_80294AE

    .align 2, 0

global_label NPCList_80294C8
    .word NPC_80294D0
    .word 0xFF

    .align 2, 0

NPC_80294D0:
    a_init
    a_set_hitbox_offset 10, 0, 0
    a_set_radius 10
    a_set_dialog 0x23
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos -206, 50
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_80294EC
    .word NPC_802950C
    .word 0xFF

global_label NPCList_80294F4
    .word NPC_8029522
    .word NPC_8029537
    .word 0xFF

global_label NPCList_8029500
    .word NPC_802955C
    .word NPC_8029571
    .word 0xFF

    .align 2, 0

NPC_802950C:
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 30, -4
    a_set_sprite_frame 7
    a_stop

NPC_8029522:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Dex
    a_set_pos 64, 26
    a_set_sprite_frame 5
    a_stop

NPC_8029537:
    a_init
    a_set_dialog 0xB
    a_set_sprite SP_Overworld_Yai
    a_set_pos -104, 28
L_8029543:
    a_move_f 8, d_ne, 8, 10
    a_wait_f 1, 30
    a_move_f 10, d_sw, 8, 10
    a_wait_f 5, 30
    a_jump L_8029543

    .align 2, 0

NPC_802955C:
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -320, 34
    a_set_sprite_frame 3
    a_stop

NPC_8029571:
    a_init
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 84, 54
L_802957D:
    a_move_f 8, d_ne, 8, 10
    a_wait_f 1, 30
    a_move_f 10, d_sw, 8, 10
    a_wait_f 5, 30
    a_jump L_802957D

    .align 2, 0

global_label NPCList_8029598
    .word NPC_80295A4
    .word NPC_80295C9
    .word 0xFF

    .align 2, 0

NPC_80295A4:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -96, 36
L_80295B0:
    a_move_f 10, d_sw, 8, 16
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 16
    a_wait_f 1, 30
    a_jump L_80295B0

NPC_80295C9:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x15
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 62, 30
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_80295E0
    .word NPC_80295E8
    .word 0xFF

    .align 2, 0

NPC_80295E8:
    a_init
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -96, 36
L_80295F4:
    a_move_f 10, d_sw, 8, 16
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 16
    a_wait_f 1, 30
    a_jump L_80295F4

    .align 2, 0

global_label NPCList_8029610
    .word NPC_802962C
    .word NPC_8029641
    .word NPC_8029657
    .word NPC_802966D
    .word NPC_8029683
    .word NPC_8029699
    .word 0xFF

    .align 2, 0

NPC_802962C:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos -136, -6
    a_set_sprite_frame 5
    a_stop

NPC_8029641:
    a_init
    a_disable_turn
    a_set_dialog 0x1
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos -136, 18
    a_set_sprite_frame 7
    a_stop

NPC_8029657:
    a_init
    a_disable_turn
    a_set_dialog 0x2
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos -136, -34
    a_set_sprite_frame 3
    a_stop

NPC_802966D:
    a_init
    a_disable_turn
    a_set_dialog 0x3
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos -150, 18
    a_set_sprite_frame 7
    a_stop

NPC_8029683:
    a_init
    a_disable_turn
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos -150, -6
    a_set_sprite_frame 7
    a_stop

NPC_8029699:
    a_init
    a_disable_turn
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos -150, -34
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_80296B0
    .word NPC_80296D8
    .word NPC_80296ED
    .word NPC_8029704
    .word NPC_802971B
    .word NPC_8029732
    .word NPC_8029749
    .word NPC_8029760
    .word NPC_8029777
    .word NPC_802978C
    .word 0xFF

    .align 2, 0

NPC_80296D8:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManTie
    a_set_pos 92, 8, 4
    a_set_sprite_frame 5
    a_stop

NPC_80296ED:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x4
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos 0, 80, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029704:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
    a_stop

NPC_802971B:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x6
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos 0, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_8029732:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x7
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos -48, 80, 18
    a_set_sprite_frame 12
    a_stop

NPC_8029749:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x8
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos -48, 32, 18
    a_set_sprite_frame 12
    a_stop

    .align 2, 0

NPC_8029760:
    a_init
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x9
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos -48, -16, 18
    a_set_sprite_frame 12
    a_stop

NPC_8029777:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_PreschoolGirl
    a_set_pos -142, 90
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_802978C:
    a_init
    a_disable_turn
    a_set_dialog 0xB
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos -142, -36
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_80297A4
    .word NPC_80297AC
    .word 0xFF

    .align 2, 0

NPC_80297AC:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos -4, 2
    a_set_radius 4
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_80297C4
    .word NPC_80297CC
    .word 0xFF

    .align 2, 0

NPC_80297CC:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos 104, -56
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_80297E4
    .word NPC_80297EC
    .word 0xFF

    .align 2, 0

NPC_80297EC:
    a_init
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos 0, 0
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8029804
    .word NPC_8029810
    .word NPC_8029830
    .word 0xFF

    .align 2, 0

NPC_8029810:
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos -18, -30
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8029828
    .word NPC_8029830
    .word 0xFF

    .align 2, 0

NPC_8029830:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 0, -34
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8029848
    .word NPC_8029850
    .word 0xFF

    .align 2, 0

NPC_8029850:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos 64, 24
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_8029868
    .word NPC_8029870
    .word 0xFF

    .align 2, 0

NPC_8029870:
    a_init
    a_set_dialog 0x5
    a_set_sprite SP_Overworld_YoungBoy
    a_set_pos 484, 30
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8029888
    .word NPC_8029898
    .word 0xFF

global_label NPCList_8029890
    .word NPC_80298B7
    .word 0xFF

    .align 2, 0

NPC_8029898:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Higsby
    a_set_pos 330, 24
    a_move_f 9, d_se, 12, 2
    a_move_f 8, d_ne, 12, 20
    a_stop

NPC_80298B7:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Higsby
    a_set_pos 138, 24
    a_move_f 9, d_se, 12, 2
    a_move_f 8, d_ne, 12, 20
    a_stop

    .align 2, 0

global_label NPCList_80298D8
    .word NPC_8029870
    .word NPC_80298E8
    .word NPC_802990D
    .word 0xFF

    .align 2, 0

NPC_80298E8:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Dex
    a_set_pos -32, 68
L_80298F4:
    a_move_f 8, d_ne, 8, 6
    a_wait_f 1, 30
    a_move_f 10, d_sw, 8, 6
    a_wait_f 5, 30
    a_jump L_80298F4

NPC_802990D:
    a_init
    a_set_dialog 0xB
    a_set_sprite SP_Overworld_Yai
    a_set_pos -292, 24
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

global_label NPCList_8029924
    .word NPC_8029930
    .word NPC_8029955
    .word 0xFF

    .align 2, 0

NPC_8029930:
    a_init
    a_set_dialog 0xF
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos -254, 44
L_802993C:
    a_move_f 10, d_sw, 8, 6
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 6
    a_wait_f 1, 30
    a_jump L_802993C

NPC_8029955:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x10
    a_set_sprite SP_Overworld_YoungGirl
    a_set_pos 398, 26
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_802996C
    .word NPC_8029974
    .word 0xFF

    .align 2, 0

NPC_8029974:
    a_init
    a_set_dialog 0x14
    a_set_sprite SP_Overworld_WomanSkirt
    a_set_pos 450, 24
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_802998C
    .word NPC_8029994
    .word 0xFF

    .align 2, 0

NPC_8029994:
    a_init
    a_set_dialog 0x1E
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos -32, 68
L_80299A0:
    a_move_f 8, d_ne, 8, 6
    a_wait_f 1, 30
    a_move_f 10, d_sw, 8, 6
    a_wait_f 5, 30
    a_jump L_80299A0

    .align 2, 0

global_label NPCList_80299BC
    .word NPC_80299C4
    .word 0xFF

    .align 2, 0

NPC_80299C4:
    a_init
    a_set_dialog 0x19
    a_set_sprite SP_Overworld_ManGreen
    a_set_pos -26, 4
    a_set_sprite_frame 3
    a_stop

    .align 2, 0

global_label NPCList_80299DC
    .word NPC_80299EC
    .word 0xFF

global_label NPCList_80299E4
    .word NPC_8029A20
    .word 0xFF

    .align 2, 0

NPC_80299EC:
    a_init
    a_sprite_auto_priority
    a_sprite_low_priority
    a_jump_if_flag 0xC6, L_8029A0B
    a_disable_turn
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Mari
    a_set_pos -10, -84
    a_set_sprite_frame 12
    a_stop
L_8029A0B:
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Mari
    a_set_pos -10, -84
    a_set_sprite_frame 1
    a_stop

    .align 2, 0

NPC_8029A20:
    a_init
    a_set_dialog 0xBE
    a_set_sprite SP_Overworld_PreschoolBoy
    a_set_pos 34, 40
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label NPCList_8029A38
    .word NPC_8029A4C
    .word NPC_8029A5F
    .word NPC_8029A72
    .word NPC_8029A85
    .word 0xFF

    .align 2, 0

NPC_8029A4C:
    a_init
    a_set_sprite SP_Overworld_Mari
    a_set_pos -140, -48
    a_set_sprite_frame 7
    a_stop

NPC_8029A5F:
    a_init
    a_set_sprite SP_Overworld_Higsby
    a_set_pos -180, -10
    a_set_sprite_frame 0
    a_stop

NPC_8029A72:
    a_init
    a_set_sprite SP_Overworld_Dex
    a_set_pos -184, -46
    a_set_sprite_frame 0
    a_stop

NPC_8029A85:
    a_init
    a_set_sprite SP_Overworld_Yai
    a_set_pos -184, -28
    a_set_sprite_frame 0
    a_stop

    .align 2, 0

global_label NPCList_8029A98
    .word NPC_8029AA0
    .word 0xFF

    .align 2, 0

NPC_8029AA0:
    a_init
    a_set_dialog 0x0
    a_set_sprite SP_Overworld_Mari
    a_set_pos -48, 88
L_8029AAC:
    a_move_f 8, d_ne, 8, 15
    a_wait_f 7, 60
    a_move_f 10, d_sw, 8, 15
    a_wait_f 7, 60
    a_jump L_8029AAC

    .align 2, 0

global_label NPCList_8029AC8
    .word NPC_8029AD0
    .word 0xFF

    .align 2, 0

NPC_8029AD0:
    a_init
    a_set_dialog 0xA
    a_set_sprite SP_Overworld_Mari
    a_set_pos 44, 52
L_8029ADC:
    a_move_f 10, d_sw, 8, 16
    a_wait_f 5, 30
    a_move_f 8, d_ne, 8, 16
    a_wait_f 1, 30
    a_jump L_8029ADC

    .align 2, 0

global_label NPCList_8029AF8
    .word NPC_8029B00
    .word 0xFF

    .align 2, 0

NPC_8029B00:
    a_init
    a_set_dialog 0x16
    a_set_sprite SP_Overworld_ManTie
    a_set_pos -180, 46
    a_set_sprite_frame 5
    a_stop

    .align 2, 0

global_label EntityAllocParams_8029B18
    entity Effect, 0x1, f(18, -18, 0), 0x0
    entity Effect, 0x1, f(18, 30, 0), 0x0
    entity Effect, 0x1, f(18, 78, 0), 0x0
    entity Effect, 0x1, f(-30, -18, 0), 0x0
    entity Effect, 0x1, f(-30, 30, 0), 0x0
    entity Effect, 0x1, f(-30, 78, 0), 0x0
    entity Effect, 0x1, f(-78, -18, 0), 0x0
    entity Effect, 0x1, f(-78, 30, 0), 0x0
    entity Effect, 0x1, f(-78, 78, 0), 0x0
    .word 0xFF

global_label EntityAllocParams_8029BD0
    entity Effect, 0x1, f(-109, 5, 0), 0x10
    entity Effect, 0x1, f(-113, -15, 0), 0x10
    entity Effect, 0x1, f(-200, 70, 0), 0x11
    .word 0xFF

global_label EntityAllocParams_8029C10
    entity Effect, 0x1, f(42, -26, 0), 0x1C
    entity Effect, 0x1, f(42, 22, 0), 0x1C
    entity Effect, 0x1, f(42, 70, 0), 0x1C
    entity Effect, 0x1, f(-6, -26, 0), 0x1C
    entity Effect, 0x1, f(-6, 22, 0), 0x1C
    entity Effect, 0x1, f(-6, 70, 0), 0x1C
    entity Effect, 0x1, f(-54, -26, 0), 0x1C
    entity Effect, 0x1, f(-54, 22, 0), 0x1C
    entity Effect, 0x1, f(-54, 70, 0), 0x1C
    .word 0xFF

global_label EntityAllocParams_8029CC8
    entity Effect, 0x1, f(-32, -32, 0), 0x6
    entity Effect, 0x1, f(20, 4, 36), 0x7
    .word 0xFF

global_label EntityAllocParams_8029CF4
    entity Effect, 0x1, f(122, -2, 0), 0x1
    entity Effect, 0x1, f(122, 30, 0), 0x2
    entity Effect, 0x1, f(24, 52, 0), 0x4
    entity Effect, 0x1, f(24, 20, 0), 0x4
    entity Effect, 0x1, f(24, -12, 0), 0x3
    .word 0xFF
