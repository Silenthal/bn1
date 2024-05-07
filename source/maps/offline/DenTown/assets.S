#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_8038DAC
    .word NPC_08038DC0
    .word NPC_08038DE5
    .word NPC_08038DFA
    .word NPC_08038E0F
    .word 0xFF

    .align 2, 0

NPC_08038DC0:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xB
    a_set_pos -114, 272
L_8038DCC:
    a_set_sprite_frame 11
    a_move d_nw, 8, 16
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 16
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_8038DCC

NPC_08038DE5:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x18
    a_set_pos 84, 140
    a_set_sprite_frame 1
L_8038DF3:
    a_wait 1
    a_jump L_8038DF3

NPC_08038DFA:
    a_init
    a_set_dialog 0x2
    a_set_sprite 0x1A
    a_set_pos -100, -60
    a_set_sprite_frame 5
L_8038E08:
    a_wait 1
    a_jump L_8038E08

NPC_08038E0F:
    a_init
    a_set_dialog 0x3
    a_set_sprite 0x1B
    a_set_pos 164, -60
L_8038E1B:
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_8038E1B

global_label NPCList_8038E34
    .word NPC_08038E4C
    .word NPC_08038E61
    .word NPC_08038E76
    .word NPC_08038EAC
    .word NPC_08038EE2
    .word 0xFF

    .align 2, 0

NPC_08038E4C:
    a_init
    a_set_dialog 0x18
    a_set_sprite 0x2E
    a_set_pos -168, 228
    a_set_sprite_frame 5
L_8038E5A:
    a_wait 1
    a_jump L_8038E5A

NPC_08038E61:
    a_init
    a_set_dialog 0xE
    a_set_sprite 0xB
    a_set_pos -100, -80
    a_set_sprite_frame 5
L_8038E6F:
    a_wait 1
    a_jump L_8038E6F

NPC_08038E76:
    a_jump_if_flag 0xA2, L_8038EAB
    a_init
    a_set_dialog 0xF
    a_set_sprite 0x18
    a_set_pos -170, 200
    a_set_sprite_frame 3
L_8038E8B:
    a_jump_if_flag 0xA2, L_8038E99
    a_wait 1
    a_jump L_8038E8B
L_8038E99:
    a_set_sprite_frame 10
    a_move d_sw, 8, 8
    a_set_sprite_frame 11
    a_move d_nw, 8, 9
    a_set_sprite_frame 10
    a_move d_sw, 8, 13
L_8038EAB:
    a_destroy

    .align 2, 0

NPC_08038EAC:
    a_jump_if_flag 0xA3, L_8038EE1
    a_init
    a_set_dialog 0x12
    a_set_sprite 0x1A
    a_set_pos -196, 228
    a_set_sprite_frame 1
L_8038EC1:
    a_jump_if_flag 0xA3, L_8038ECF
    a_wait 1
    a_jump L_8038EC1
L_8038ECF:
    a_set_sprite_frame 10
    a_move d_sw, 8, 7
    a_set_sprite_frame 11
    a_move d_nw, 8, 11
    a_set_sprite_frame 10
    a_move d_sw, 8, 11
L_8038EE1:
    a_destroy

NPC_08038EE2:
    a_jump_if_flag 0xA4, L_8038F11
    a_init
    a_set_dialog 0x15
    a_set_sprite 0x1B
    a_set_pos -178, 258
    a_set_sprite_frame 7
L_8038EF7:
    a_jump_if_flag 0xA4, L_8038F05
    a_wait 1
    a_jump L_8038EF7
L_8038F05:
    a_set_sprite_frame 8
    a_move d_ne, 8, 6
    a_set_sprite_frame 9
    a_move d_se, 8, 10
L_8038F11:
    a_destroy

    .align 2, 0

global_label NPCList_8038F14
    .word NPC_08038F1C
    .word 0xFF

    .align 2, 0

NPC_08038F1C:
    a_init
    a_disable_collision
    a_set_sprite 0x2E
    a_set_pos -168, 228
    a_set_sprite_frame 1
L_8038F29:
    a_jump_if_flag 0xA0, L_8038F37
    a_wait 1
    a_jump L_8038F29
L_8038F37:
    a_set_sprite_frame 10
    a_move d_sw, 8, 18
    a_destroy

    .align 2, 0

global_label NPCList_8038F40
    .word NPC_08038E61
    .word 0xFF

global_label NPCList_8038F48
    .word NPC_08038F50
    .word 0xFF

    .align 2, 0

NPC_08038F50:
    a_init
    a_set_sprite 0xF
    a_set_pos -100, 8
    a_set_sprite_frame 3
L_8038F5C:
    a_jump_if_flag 0xBE, L_8038F6A
    a_wait 1
    a_jump L_8038F5C
L_8038F6A:
    a_set_sprite_frame 9
    a_move d_se, 8, 1
    a_set_sprite_frame 3
L_8038F72:
    a_jump_if_flag 0xBF, L_8038F80
    a_wait 1
    a_jump L_8038F72
L_8038F80:
    a_set_sprite_frame 11
    a_move d_nw, 16, 6
    a_set_sprite_frame 8
    a_move d_ne, 16, 40
    a_destroy

    .align 2, 0

global_label NPCList_8038F90
    .word NPC_08038FA8
    .word NPC_08038FCD
    .word NPC_08038FE2
    .word NPC_08038FF7
    .word NPC_0803900C
    .word 0xFF

    .align 2, 0

NPC_08038FA8:
    a_init
    a_set_dialog 0x50
    a_set_sprite 0xB
    a_set_pos -114, 272
L_8038FB4:
    a_set_sprite_frame 11
    a_move d_nw, 8, 16
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 16
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_8038FB4

NPC_08038FCD:
    a_init
    a_set_dialog 0x51
    a_set_sprite 0x18
    a_set_pos 84, 140
    a_set_sprite_frame 1
L_8038FDB:
    a_wait 1
    a_jump L_8038FDB

NPC_08038FE2:
    a_init
    a_set_dialog 0x52
    a_set_sprite 0x1A
    a_set_pos -100, -60
    a_set_sprite_frame 5
L_8038FF0:
    a_wait 1
    a_jump L_8038FF0

NPC_08038FF7:
    a_init
    a_set_dialog 0x53
    a_set_sprite 0x1B
    a_set_pos 164, -60
    a_set_sprite_frame 5
L_8039005:
    a_wait 1
    a_jump L_8039005

    .align 2, 0

NPC_0803900C:
    a_jump_if_not_flag 0x94, L_8039043
    a_jump_if_flag 0x97, L_8039043
    a_disable_turn
    a_init
    a_set_dialog 0x60
    a_set_sprite 0xA
    a_set_pos 150, -60
    a_set_sprite_frame 1
L_8039029:
    a_jump_if_flag 0x96, L_8039037
    a_wait 1
    a_jump L_8039029
L_8039037:
    a_set_sprite_frame 9
    a_move d_se, 8, 2
    a_set_sprite_frame 10
    a_move d_sw, 8, 12
L_8039043:
    a_destroy

global_label NPCList_8039044
    .word NPC_08038FF7
    .word 0xFF

global_label NPCList_803904C
    .word NPC_08039058
    .word NPC_0803906D
    .word 0xFF

    .align 2, 0

NPC_08039058:
    a_init
    a_set_dialog 0xF
    a_set_sprite 0x2B
    a_set_pos -18, 62
    a_set_sprite_frame 5
L_8039066:
    a_wait 1
    a_jump L_8039066

NPC_0803906D:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x10
    a_set_sprite 0x1D
    a_set_pos -30, -70
L_803907B:
    a_set_sprite_frame 11
    a_move d_nw, 8, 5
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 5
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_803907B

global_label NPCList_8039094
    .word NPC_08039058
    .word 0xFF

global_label NPCList_803909C
    .word NPC_080390AC
    .word NPC_080390D3
    .word NPC_080390F8
    .word 0xFF

    .align 2, 0

NPC_080390AC:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xC
    a_set_pos 80, 164
L_80390B8:
    a_set_sprite_frame 9
    a_move d_se, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_wait 1
    a_jump L_80390B8

NPC_080390D3:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x40
    a_set_pos 112, -70
L_80390DF:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_jump L_80390DF

    .align 2, 0

NPC_080390F8:
    a_init
    a_set_dialog 0x2
    a_set_sprite 0x1E
    a_set_pos -112, 234
    a_set_sprite_frame 1
L_8039106:
    a_wait 1
    a_jump L_8039106

    .align 2, 0

global_label NPCList_8039110
    .word NPC_0803911C
    .word NPC_0803913F
    .word 0xFF

    .align 2, 0

NPC_0803911C:
    a_init
    a_set_sprite 0x1A
    a_set_pos -80, 114
    a_set_sprite_frame 1
L_8039128:
    a_jump_if_flag 0x99, L_8039136
    a_wait 1
    a_jump L_8039128
L_8039136:
    a_set_sprite_frame 7
L_8039138:
    a_wait 1
    a_jump L_8039138

NPC_0803913F:
    a_init
    a_set_sprite 0x1B
    a_set_pos -84, 96
    a_set_sprite_frame 1
L_803914B:
    a_jump_if_flag 0x99, L_8039159
    a_wait 1
    a_jump L_803914B
L_8039159:
    a_set_sprite_frame 7
L_803915B:
    a_wait 1
    a_jump L_803915B

    .align 2, 0

global_label NPCList_8039164
    .word NPC_08039174
    .word NPC_0803918B
    .word NPC_080391A2
    .word 0xFF

    .align 2, 0

NPC_08039174:
    a_init
    a_set_sprite 0x1A
    a_set_pos -74, 112
    a_set_sprite_frame 12
    a_move d_se, 8, 25
L_8039184:
    a_wait 1
    a_jump L_8039184

NPC_0803918B:
    a_init
    a_set_sprite 0x1B
    a_set_pos -98, 120
    a_set_sprite_frame 12
    a_move d_se, 8, 25
L_803919B:
    a_wait 1
    a_jump L_803919B

NPC_080391A2:
    a_init
    a_set_sprite 0x1E
    a_set_pos -88, 174
    a_set_sprite_frame 16
    a_move d_se, 8, 25
L_80391B2:
    a_wait 1
    a_jump L_80391B2

    .align 2, 0

global_label NPCList_80391BC
    .word NPC_080391D4
    .word NPC_080391FB
    .word NPC_08039220
    .word 0xFF

global_label NPCList_80391CC
    .word NPC_08039220
    .word 0xFF

    .align 2, 0

NPC_080391D4:
    a_init
    a_set_dialog 0x2D
    a_set_sprite 0xC
    a_set_pos 80, 164
L_80391E0:
    a_set_sprite_frame 9
    a_move d_se, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_wait 1
    a_jump L_80391E0

NPC_080391FB:
    a_init
    a_set_dialog 0x2E
    a_set_sprite 0x40
    a_set_pos 112, -70
L_8039207:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 3
    a_wait 30
    a_jump L_8039207

    .align 2, 0

NPC_08039220:
    a_init
    a_set_dialog 0x2F
    a_set_sprite 0x1E
    a_set_pos -112, 234
    a_set_sprite_frame 1
L_803922E:
    a_wait 1
    a_jump L_803922E

    .align 2, 0

global_label NPCList_8039238
    .word NPC_08039244
    .word NPC_08039267
    .word 0xFF

    .align 2, 0

NPC_08039244:
    a_init
    a_set_sprite 0x1A
    a_set_pos -80, 114
    a_set_sprite_frame 1
L_8039250:
    a_jump_if_flag 0x99, L_803925E
    a_wait 1
    a_jump L_8039250
L_803925E:
    a_set_sprite_frame 7
L_8039260:
    a_wait 1
    a_jump L_8039260

NPC_08039267:
    a_init
    a_set_sprite 0x1B
    a_set_pos -84, 96
    a_set_sprite_frame 1
L_8039273:
    a_jump_if_flag 0x99, L_8039281
    a_wait 1
    a_jump L_8039273
L_8039281:
    a_set_sprite_frame 7
L_8039283:
    a_wait 1
    a_jump L_8039283

    .align 2, 0

global_label NPCList_803928C
    .word NPC_0803929C
    .word NPC_080392B3
    .word NPC_080392CA
    .word 0xFF

    .align 2, 0

NPC_0803929C:
    a_init
    a_set_sprite 0x1A
    a_set_pos -74, 112
    a_set_sprite_frame 12
    a_move d_se, 8, 25
L_80392AC:
    a_wait 1
    a_jump L_80392AC

NPC_080392B3:
    a_init
    a_set_sprite 0x1B
    a_set_pos -98, 120
    a_set_sprite_frame 12
    a_move d_se, 8, 25
L_80392C3:
    a_wait 1
    a_jump L_80392C3

NPC_080392CA:
    a_init
    a_set_sprite 0x1E
    a_set_pos -88, 174
    a_set_sprite_frame 16
    a_move d_se, 8, 25
L_80392DA:
    a_wait 1
    a_jump L_80392DA

    .align 2, 0

global_label NPCList_80392E4
    .word NPC_080392F4
    .word NPC_08039309
    .word NPC_0803932E
    .word 0xFF

    .align 2, 0

NPC_080392F4:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x40
    a_set_pos -238, -16
    a_set_sprite_frame 1
L_8039302:
    a_wait 1
    a_jump L_8039302

NPC_08039309:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x1C
    a_set_pos 18, 272
L_8039315:
    a_set_sprite_frame 11
    a_move d_nw, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_8039315

NPC_0803932E:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x2
    a_set_sprite 0x1D
    a_set_pos 24, -50
    a_set_sprite_frame 5
L_803933E:
    a_wait 1
    a_jump L_803933E

    .align 2, 0

global_label NPCList_8039348
    .word NPC_08039360
    .word NPC_08039375
    .word NPC_0803939A
    .word 0xFF

global_label NPCList_8039358
    .word NPC_0803939A
    .word 0xFF

    .align 2, 0

NPC_08039360:
    a_init
    a_set_dialog 0x23
    a_set_sprite 0x40
    a_set_pos -238, -16
    a_set_sprite_frame 1
L_803936E:
    a_wait 1
    a_jump L_803936E

NPC_08039375:
    a_init
    a_set_dialog 0x24
    a_set_sprite 0x1C
    a_set_pos 18, 272
L_8039381:
    a_set_sprite_frame 11
    a_move d_nw, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 9
    a_move d_se, 8, 6
    a_set_sprite_frame 1
    a_wait 30
    a_jump L_8039381

NPC_0803939A:
    a_init
    a_sprite_mask_set_flag 0x4
    a_set_dialog 0x25
    a_set_sprite 0x1D
    a_set_pos 24, -50
    a_set_sprite_frame 5
L_80393AA:
    a_wait 1
    a_jump L_80393AA

    .align 2, 0

global_label NPCList_80393B4
    .word NPC_080393D8
    .word NPC_080393FF
    .word NPC_08039414
    .word 0xFF

global_label NPCList_80393C4
    .word NPC_080393D8
    .word NPC_080393FF
    .word NPC_08039414
    .word NPC_080394CC
    .word 0xFF

    .align 2, 0

NPC_080393D8:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x1E
    a_set_pos -148, -148
L_80393E4:
    a_set_sprite_frame 8
    a_move d_ne, 8, 5
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 5
    a_set_sprite_frame 3
    a_wait 30
    a_wait 1
    a_jump L_80393E4

NPC_080393FF:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0x19
    a_set_pos 114, 92
    a_set_sprite_frame 7
L_803940D:
    a_wait 1
    a_jump L_803940D

    .align 2, 0

NPC_08039414:
    a_init
    a_set_dialog 0x2
    a_set_sprite 0xC
    a_set_pos 112, -118
    a_set_sprite_frame 7
L_8039422:
    a_wait 1
    a_jump L_8039422

    .align 2, 0

global_label NPCList_803942C
    .word NPC_080393D8
    .word NPC_08039414
    .word 0xFF

global_label NPCList_8039438
    .word NPC_0803945C
    .word NPC_08039483
    .word NPC_08039498
    .word NPC_080394AD
    .word NPC_080394CC
    .word 0xFF

global_label NPCList_8039450
    .word NPC_08039483
    .word NPC_080394CC
    .word 0xFF

    .align 2, 0

NPC_0803945C:
    a_init
    a_set_dialog 0x19
    a_set_sprite 0x1E
    a_set_pos -148, -148
L_8039468:
    a_set_sprite_frame 8
    a_move d_ne, 8, 5
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 5
    a_set_sprite_frame 3
    a_wait 30
    a_wait 1
    a_jump L_8039468

NPC_08039483:
    a_init
    a_set_dialog 0x1A
    a_set_sprite 0x19
    a_set_pos 114, 92
    a_set_sprite_frame 7
L_8039491:
    a_wait 1
    a_jump L_8039491

    .align 2, 0

NPC_08039498:
    a_init
    a_set_dialog 0x1B
    a_set_sprite 0xC
    a_set_pos 112, -118
    a_set_sprite_frame 7
L_80394A6:
    a_wait 1
    a_jump L_80394A6

NPC_080394AD:
    a_jump_if_not_flag 0x97, L_80394C9
    a_init
    a_set_dialog 0x1C
    a_set_sprite 0xA
    a_set_pos -150, 86
    a_set_sprite_frame 7
L_80394C2:
    a_wait 30
    a_jump L_80394C2
L_80394C9:
    a_destroy

    .align 2, 0

    .align 2, 0

NPC_080394CC:
    a_init
    a_set_dialog 0xBE
    a_set_sprite 0x1C
    a_set_pos 124, 196
    a_set_sprite_frame 5
L_80394DA:
    a_wait 1
    a_jump L_80394DA

    .align 2, 0

global_label NPCList_80394E4
    .word NPC_080394F4
    .word NPC_08039519
    .word NPC_0803953E
    .word 0xFF

    .align 2, 0

NPC_080394F4:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0x1B
    a_set_pos 256, 28
L_8039500:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 5
    a_wait 30
    a_jump L_8039500

NPC_08039519:
    a_init
    a_set_dialog 0x1
    a_set_sprite 0xB
    a_set_pos 26, -178
L_8039525:
    a_set_sprite_frame 9
    a_move d_se, 8, 4
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 4
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_8039525

NPC_0803953E:
    a_init
    a_set_dialog 0x2
    a_set_sprite 0x1A
    a_set_pos 10, 148
    a_set_sprite_frame 7
L_803954C:
    a_wait 1
    a_jump L_803954C

    .align 2, 0

global_label NPCList_8039554
    .word NPC_0803953E
    .word 0xFF

global_label NPCList_803955C
    .word NPC_0803956C
    .word NPC_08039591
    .word NPC_080395B6
    .word 0xFF

    .align 2, 0

NPC_0803956C:
    a_init
    a_set_dialog 0x14
    a_set_sprite 0x1B
    a_set_pos 256, 28
L_8039578:
    a_set_sprite_frame 8
    a_move d_ne, 8, 10
    a_set_sprite_frame 1
    a_wait 30
    a_set_sprite_frame 10
    a_move d_sw, 8, 10
    a_set_sprite_frame 5
    a_wait 30
    a_jump L_8039578

NPC_08039591:
    a_init
    a_set_dialog 0x15
    a_set_sprite 0xB
    a_set_pos 26, -178
L_803959D:
    a_set_sprite_frame 9
    a_move d_se, 8, 4
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 11
    a_move d_nw, 8, 4
    a_set_sprite_frame 7
    a_wait 30
    a_jump L_803959D

NPC_080395B6:
    a_init
    a_set_dialog 0x16
    a_set_sprite 0x1A
    a_set_pos 10, 148
    a_set_sprite_frame 7
L_80395C4:
    a_wait 1
    a_jump L_80395C4

    .align 2, 0

global_label NPCList_80395CC
    .word NPC_08039591
    .word 0xFF

global_label NPCList_80395D4
    .word NPC_080395DC
    .word 0xFF

    .align 2, 0

NPC_080395DC:
    a_init
    a_disable_collision
    a_set_hitbox_offset 4, 10, 0
    a_disable_turn
    a_set_dialog 0xA
    a_set_sprite 0x54
    a_set_pos -40, 40, 16
    a_set_sprite_frame 0
L_80395F0:
    a_wait 1
    a_jump L_80395F0

    .align 2, 0

global_label NPCList_80395F8
    .word NPC_08039624
    .word NPC_0803964B
    .word NPC_08039664
    .word 0xFF

global_label NPCList_8039608
    .word NPC_08039624
    .word NPC_0803964B
    .word NPC_08039664
    .word NPC_0803967C
    .word 0xFF

global_label NPCList_803961C
    .word NPC_0803967C
    .word 0xFF

    .align 2, 0

NPC_08039624:
    a_init
    a_set_dialog 0x0
    a_set_sprite 0xB
    a_set_pos 28, -46
L_8039630:
    a_set_sprite_frame 10
    a_move d_sw, 8, 6
    a_set_sprite_frame 3
    a_wait 30
    a_set_sprite_frame 8
    a_move d_ne, 8, 6
    a_set_sprite_frame 3
    a_wait 30
    a_wait 1
    a_jump L_8039630

NPC_0803964B:
    a_init
    a_sprite_mask_set_flag 0x4
    a_disable_turn
    a_disable_collision
    a_set_dialog 0x1
    a_set_sprite 0x1D
    a_set_pos 0, 32, 18
    a_set_sprite_frame 12
L_803965D:
    a_wait 1
    a_jump L_803965D

    .align 2, 0

NPC_08039664:
    a_init
    a_set_palette 0x1
    a_set_dialog 0x2
    a_set_sprite 0x6
    a_set_pos 88, 12
    a_set_sprite_frame 5
L_8039674:
    a_wait 1
    a_jump L_8039674

    .align 2, 0

    .align 2, 0

NPC_0803967C:
    a_init
    a_set_dialog 0xBE
    a_set_sprite 0xC
    a_set_pos -78, -38
    a_set_sprite_frame 3
L_803968A:
    a_wait 1
    a_jump L_803968A

    .align 2, 0

global_label EntityAllocParams_8039694
    entity Effect, 0x1A, f(16, 90, 0), 0xFFFF0000
    entity Effect, 0x1A, f(-90, 90, 0), 0xFF000001
    entity Effect, 0x1A, f(-90, -16, 0), 0xFFFF0002
    entity Effect, 0x1A, f(16, -16, 0), 0xFFFF0003
    entity Effect, 0x1B, f(12, 90, 8), 0x0
    entity Effect, 0x1B, f(-82, 124, 8), 0x200
    entity Effect, 0x1D, f(52, 90, 8), 0x0
    entity Effect, 0x1D, f(20, -20, 8), 0x200
    entity Effect, 0x1B, f(-90, -12, 8), 0x301
    entity Effect, 0x1B, f(-124, 82, 8), 0x101
    entity Effect, 0x1D, f(20, 122, 8), 0x101
    entity Effect, 0x1D, f(-90, 90, 8), 0x301
    entity Effect, 0x1B, f(-82, -20, 8), 0x202
    entity Effect, 0x1B, f(12, -54, 8), 0x2
    entity Effect, 0x1D, f(-90, 90, 8), 0x2
    entity Effect, 0x1D, f(-122, -20, 8), 0x202
    entity Effect, 0x1B, f(20, 82, 8), 0x103
    entity Effect, 0x1B, f(54, -12, 8), 0x303
    entity Effect, 0x1D, f(20, -20, 8), 0x103
    entity Effect, 0x1D, f(-90, -52, 8), 0x303
    .word 0xFF

global_label EntityAllocParams_8039828
    entity Effect, 0x1, f(14, 192, 0), 0x28
    entity Effect, 0x1, f(-162, -14, 0), 0x29
    entity Effect, 0x1, f(-322, -14, 0), 0x2A
    entity Effect, 0x1, f(14, -54, 0), 0x2B
    .word 0xFF

global_label EntityAllocParams_803987C
    entity Effect, 0x1E, f(16, 90, 0), 0x0
    entity Effect, 0x1E, f(-90, 90, 0), 0x10001
    entity Effect, 0x1E, f(-90, -16, 0), 0x102
    entity Effect, 0x1E, f(16, -16, 0), 0x103
    entity Effect, 0x22, f(12, 90, 8), 0x0
    entity Effect, 0x22, f(-82, 124, 8), 0x2
    entity Effect, 0x22, f(52, 90, 8), 0x10200
    entity Effect, 0x22, f(20, -20, 8), 0x10202
    entity Effect, 0x22, f(-90, -12, 8), 0x103
    entity Effect, 0x22, f(-124, 82, 8), 0x101
    entity Effect, 0x22, f(20, 122, 8), 0x10401
    entity Effect, 0x22, f(-90, 90, 8), 0x10403
    entity Effect, 0x22, f(-82, -20, 8), 0x2
    entity Effect, 0x22, f(12, -54, 8), 0x0
    entity Effect, 0x22, f(-90, 90, 8), 0x10200
    entity Effect, 0x22, f(-122, -20, 8), 0x10202
    entity Effect, 0x22, f(20, 82, 8), 0x101
    entity Effect, 0x22, f(54, -12, 8), 0x103
    entity Effect, 0x22, f(20, -20, 8), 0x10401
    entity Effect, 0x22, f(-90, -52, 8), 0x10403
    .word 0xFF

global_label EntityAllocParams_8039A10
    entity Effect, 0x1E, f(16, 90, 0), 0x0
    entity Effect, 0x1E, f(-90, 90, 0), 0x10001
    entity Effect, 0x1E, f(-90, -16, 0), 0x2
    entity Effect, 0x1E, f(16, -16, 0), 0x103
    entity Effect, 0x22, f(12, 90, 8), 0x0
    entity Effect, 0x22, f(-82, 124, 8), 0x2
    entity Effect, 0x22, f(52, 90, 8), 0x10400
    entity Effect, 0x22, f(20, -20, 8), 0x10402
    entity Effect, 0x22, f(-90, -12, 8), 0x3
    entity Effect, 0x22, f(-124, 82, 8), 0x1
    entity Effect, 0x22, f(20, 122, 8), 0x10401
    entity Effect, 0x22, f(-90, 90, 8), 0x10403
    entity Effect, 0x22, f(-82, -20, 8), 0x102
    entity Effect, 0x22, f(12, -54, 8), 0x100
    entity Effect, 0x22, f(-90, 90, 8), 0x10400
    entity Effect, 0x22, f(-122, -20, 8), 0x10402
    entity Effect, 0x22, f(20, 82, 8), 0x1
    entity Effect, 0x22, f(54, -12, 8), 0x3
    entity Effect, 0x22, f(20, -20, 8), 0x10201
    entity Effect, 0x22, f(-90, -52, 8), 0x10203
    .word 0xFF

global_label EntityAllocParams_8039BA4
    entity Effect, 0x1E, f(16, 90, 0), 0x0
    entity Effect, 0x1E, f(-90, 90, 0), 0x10001
    entity Effect, 0x1E, f(-90, -16, 0), 0x102
    entity Effect, 0x1E, f(16, -16, 0), 0x2000103
    entity Effect, 0x22, f(12, 90, 8), 0x0
    entity Effect, 0x22, f(-82, 124, 8), 0x2
    entity Effect, 0x22, f(52, 90, 8), 0x2010400
    entity Effect, 0x22, f(20, -20, 8), 0x10402
    entity Effect, 0x22, f(-90, -12, 8), 0x103
    entity Effect, 0x22, f(-124, 82, 8), 0x101
    entity Effect, 0x22, f(20, 122, 8), 0x10401
    entity Effect, 0x22, f(-90, 90, 8), 0x10403
    entity Effect, 0x22, f(-82, -20, 8), 0x2000102
    entity Effect, 0x22, f(12, -54, 8), 0x2000100
    entity Effect, 0x22, f(-90, 90, 8), 0x10200
    entity Effect, 0x22, f(-122, -20, 8), 0x10202
    entity Effect, 0x22, f(20, 82, 8), 0x1
    entity Effect, 0x22, f(54, -12, 8), 0x3
    entity Effect, 0x22, f(20, -20, 8), 0x1010201
    entity Effect, 0x22, f(-90, -52, 8), 0x1010203
    .word 0xFF

global_label EntityAllocParams_8039D38
    entity Effect, 0x1E, f(16, 90, 0), 0x100
    entity Effect, 0x1E, f(-90, 90, 0), 0x10001
    entity Effect, 0x1E, f(-90, -16, 0), 0x2000102
    entity Effect, 0x1E, f(16, -16, 0), 0x2000103
    entity Effect, 0x22, f(12, 90, 8), 0x0
    entity Effect, 0x22, f(-82, 124, 8), 0x2
    entity Effect, 0x22, f(52, 90, 8), 0x10200
    entity Effect, 0x22, f(20, -20, 8), 0x10202
    entity Effect, 0x22, f(-90, -12, 8), 0x2000103
    entity Effect, 0x22, f(-124, 82, 8), 0x2000101
    entity Effect, 0x22, f(20, 122, 8), 0x10401
    entity Effect, 0x22, f(-90, 90, 8), 0x10403
    entity Effect, 0x22, f(-82, -20, 8), 0x2000102
    entity Effect, 0x22, f(12, -54, 8), 0x2000100
    entity Effect, 0x22, f(-90, 90, 8), 0x1010200
    entity Effect, 0x22, f(-122, -20, 8), 0x1010202
    entity Effect, 0x22, f(20, 82, 8), 0x101
    entity Effect, 0x22, f(54, -12, 8), 0x103
    entity Effect, 0x22, f(20, -20, 8), 0x1010201
    entity Effect, 0x22, f(-90, -52, 8), 0x1010203
    .word 0xFF

global_label EntityAllocParams_8039ECC
    entity Effect, 0x1E, f(16, 90, 0), 0x2000100
    entity Effect, 0x1E, f(-90, 90, 0), 0x10101
    entity Effect, 0x1E, f(-90, -16, 0), 0x2000102
    entity Effect, 0x1E, f(16, -16, 0), 0x2000103
    entity Effect, 0x22, f(12, 90, 8), 0x100
    entity Effect, 0x22, f(-82, 124, 8), 0x102
    entity Effect, 0x22, f(52, 90, 8), 0x1010200
    entity Effect, 0x22, f(20, -20, 8), 0x1010202
    entity Effect, 0x22, f(-90, -12, 8), 0x2000103
    entity Effect, 0x22, f(-124, 82, 8), 0x2000101
    entity Effect, 0x22, f(20, 122, 8), 0x10201
    entity Effect, 0x22, f(-90, 90, 8), 0x10203
    entity Effect, 0x22, f(-82, -20, 8), 0x2000102
    entity Effect, 0x22, f(12, -54, 8), 0x2000100
    entity Effect, 0x22, f(-90, 90, 8), 0x1010200
    entity Effect, 0x22, f(-122, -20, 8), 0x1010202
    entity Effect, 0x22, f(20, 82, 8), 0x2000101
    entity Effect, 0x22, f(54, -12, 8), 0x2000103
    entity Effect, 0x22, f(20, -20, 8), 0x1010201
    entity Effect, 0x22, f(-90, -52, 8), 0x1010203
    .word 0xFF

global_label EntityAllocParams_803A060
    entity Effect, 0x1E, f(16, 90, 0), 0x2000100
    entity Effect, 0x1E, f(-90, 90, 0), 0x2010101
    entity Effect, 0x1E, f(-90, -16, 0), 0x2000102
    entity Effect, 0x1E, f(16, -16, 0), 0x2000103
    entity Effect, 0x22, f(12, 90, 8), 0x2000100
    entity Effect, 0x22, f(-82, 124, 8), 0x2000102
    entity Effect, 0x22, f(52, 90, 8), 0x1010200
    entity Effect, 0x22, f(20, -20, 8), 0x1010202
    entity Effect, 0x22, f(-90, -12, 8), 0x2000103
    entity Effect, 0x22, f(-124, 82, 8), 0x2000101
    entity Effect, 0x22, f(20, 122, 8), 0x10201
    entity Effect, 0x22, f(-90, 90, 8), 0x10203
    entity Effect, 0x22, f(-82, -20, 8), 0x2000102
    entity Effect, 0x22, f(12, -54, 8), 0x2000100
    entity Effect, 0x22, f(-90, 90, 8), 0x1010200
    entity Effect, 0x22, f(-122, -20, 8), 0x1010202
    entity Effect, 0x22, f(20, 82, 8), 0x2000101
    entity Effect, 0x22, f(54, -12, 8), 0x2000103
    entity Effect, 0x22, f(20, -20, 8), 0x1010201
    entity Effect, 0x22, f(-90, -52, 8), 0x1010203
    .word 0xFF

global_label EntityAllocParams_803A1F4
    entity Effect, 0x1E, f(16, 90, 0), 0x2000100
    entity Effect, 0x1E, f(-90, 90, 0), 0x2010101
    entity Effect, 0x1E, f(-90, -16, 0), 0x2000102
    entity Effect, 0x1E, f(16, -16, 0), 0x2000103
    entity Effect, 0x22, f(12, 90, 8), 0x2000100
    entity Effect, 0x22, f(-82, 124, 8), 0x2000102
    entity Effect, 0x22, f(52, 90, 8), 0x1010200
    entity Effect, 0x22, f(20, -20, 8), 0x1010202
    entity Effect, 0x22, f(-90, -12, 8), 0x2000103
    entity Effect, 0x22, f(-124, 82, 8), 0x2000101
    entity Effect, 0x22, f(20, 122, 8), 0x10201
    entity Effect, 0x22, f(-90, 90, 8), 0x10203
    entity Effect, 0x22, f(-82, -20, 8), 0x2000102
    entity Effect, 0x22, f(12, -54, 8), 0x2000100
    entity Effect, 0x22, f(-90, 90, 8), 0x1010200
    entity Effect, 0x22, f(-122, -20, 8), 0x1010202
    entity Effect, 0x22, f(20, 82, 8), 0x2000101
    entity Effect, 0x22, f(54, -12, 8), 0x2000103
    entity Effect, 0x22, f(20, -20, 8), 0x1010201
    entity Effect, 0x22, f(-90, -52, 8), 0x1010203
    entity Effect, 0x1, f(-68, 7, 8), 0x3E
    .word 0xFF

global_label EntityAllocParams_803A39C
    .word 0xFF

global_label EntityAllocParams_803A3A0
    entity Effect, 0x1E, f(48, 74, 0), 0x0
    entity Effect, 0x1E, f(-58, 74, 0), 0x1
    entity Effect, 0x1E, f(-58, -32, 0), 0x10102
    entity Effect, 0x1E, f(48, -32, 0), 0x103
    entity Effect, 0x22, f(44, 74, 8), 0x0
    entity Effect, 0x22, f(-50, 108, 8), 0x2
    entity Effect, 0x22, f(84, 74, 8), 0x10200
    entity Effect, 0x22, f(52, -36, 8), 0x10202
    entity Effect, 0x22, f(-58, -28, 8), 0x103
    entity Effect, 0x22, f(-92, 66, 8), 0x101
    entity Effect, 0x22, f(52, 106, 8), 0x10401
    entity Effect, 0x22, f(-58, 74, 8), 0x10403
    entity Effect, 0x22, f(-50, -36, 8), 0x2
    entity Effect, 0x22, f(44, -70, 8), 0x0
    entity Effect, 0x22, f(-58, 74, 8), 0x10200
    entity Effect, 0x22, f(-90, -36, 8), 0x10202
    entity Effect, 0x22, f(52, 66, 8), 0x101
    entity Effect, 0x22, f(86, -28, 8), 0x103
    entity Effect, 0x22, f(52, -36, 8), 0x10401
    entity Effect, 0x22, f(-58, -68, 8), 0x10403
    entity Effect, 0x1, f(46, 176, 0), 0x34
    entity Effect, 0x1, f(-242, -30, 0), 0x35
    entity Effect, 0x1, f(-146, -30, 0), 0x36
    entity Effect, 0x1, f(-102, -40, 0), 0x23
    .word 0xFF

global_label EntityAllocParams_803A584
    entity Effect, 0x1E, f(48, 74, 0), 0x0
    entity Effect, 0x1E, f(-58, 74, 0), 0x1
    entity Effect, 0x1E, f(-58, -32, 0), 0x10102
    entity Effect, 0x1E, f(48, -32, 0), 0x103
    .word 0xFF

global_label EntityAllocParams_803A5D8
    entity Effect, 0x1A, f(48, 74, 0), 0xFFFF0000
    entity Effect, 0x1A, f(-58, 74, 0), 0xFFFF0001
    entity Effect, 0x1A, f(-58, -32, 0), 0xFF000002
    entity Effect, 0x1A, f(48, -32, 0), 0xFFFF0003
    entity Effect, 0x1B, f(44, 74, 8), 0x0
    entity Effect, 0x1B, f(-50, 108, 8), 0x200
    entity Effect, 0x1D, f(84, 74, 8), 0x0
    entity Effect, 0x1D, f(52, -36, 8), 0x200
    entity Effect, 0x1B, f(-58, -28, 8), 0x301
    entity Effect, 0x1B, f(-92, 66, 8), 0x101
    entity Effect, 0x1D, f(52, 106, 8), 0x101
    entity Effect, 0x1D, f(-58, 74, 8), 0x301
    entity Effect, 0x1B, f(-50, -36, 8), 0x202
    entity Effect, 0x1B, f(44, -70, 8), 0x2
    entity Effect, 0x1D, f(-58, 74, 8), 0x2
    entity Effect, 0x1D, f(-90, -36, 8), 0x202
    entity Effect, 0x1B, f(52, 66, 8), 0x103
    entity Effect, 0x1B, f(86, -28, 8), 0x303
    entity Effect, 0x1D, f(52, -36, 8), 0x103
    entity Effect, 0x1D, f(-58, -68, 8), 0x303
    .word 0xFF

global_label EntityAllocParams_803A76C
    entity Effect, 0x1, f(46, 176, 0), 0x34
    entity Effect, 0x1, f(-242, -30, 0), 0x35
    entity Effect, 0x1, f(-146, -30, 0), 0x36
    entity Effect, 0x1, f(-102, -40, 0), 0x23
    .word 0xFF

global_label EntityAllocParams_803A7C0
    entity Effect, 0x1A, f(-24, 130, 0), 0xFFFF0000
    entity Effect, 0x1A, f(-130, 130, 0), 0xFFFF0001
    entity Effect, 0x1A, f(-130, 24, 0), 0xFFFF0002
    entity Effect, 0x1A, f(-24, 24, 0), 0xFF000003
    entity Effect, 0x1B, f(-28, 130, 8), 0x0
    entity Effect, 0x1B, f(-122, 164, 8), 0x200
    entity Effect, 0x1D, f(12, 130, 8), 0x0
    entity Effect, 0x1D, f(-20, 20, 8), 0x200
    entity Effect, 0x1B, f(-130, 28, 8), 0x301
    entity Effect, 0x1B, f(-164, 122, 8), 0x101
    entity Effect, 0x1D, f(-20, 162, 8), 0x101
    entity Effect, 0x1D, f(-130, 130, 8), 0x301
    entity Effect, 0x1B, f(-122, 20, 8), 0x202
    entity Effect, 0x1B, f(-28, -14, 8), 0x2
    entity Effect, 0x1D, f(-130, 130, 8), 0x2
    entity Effect, 0x1D, f(-162, 20, 8), 0x202
    entity Effect, 0x1B, f(-20, 122, 8), 0x103
    entity Effect, 0x1B, f(14, 28, 8), 0x303
    entity Effect, 0x1D, f(-20, 20, 8), 0x103
    entity Effect, 0x1D, f(-130, -12, 8), 0x303
    .word 0xFF

global_label EntityAllocParams_803A954
    entity Effect, 0x1, f(-26, -24, 0), 0x2D
    entity Effect, 0x1, f(-26, 232, 0), 0x2E
    entity Effect, 0x1, f(-202, 26, 0), 0x2F
    entity Effect, 0x1, f(-16, -32, 0), 0x22
    .word 0xFF

global_label EntityAllocParams_803A9A8
    entity Effect, 0x1E, f(-24, 130, 0), 0x0
    entity Effect, 0x1E, f(-130, 130, 0), 0x1
    entity Effect, 0x1E, f(-130, 24, 0), 0x102
    entity Effect, 0x1E, f(-24, 24, 0), 0x10103
    entity Effect, 0x22, f(-28, 130, 8), 0x0
    entity Effect, 0x22, f(-122, 164, 8), 0x2
    entity Effect, 0x22, f(12, 130, 8), 0x10200
    entity Effect, 0x22, f(-20, 20, 8), 0x10202
    entity Effect, 0x22, f(-130, 28, 8), 0x103
    entity Effect, 0x22, f(-164, 122, 8), 0x101
    entity Effect, 0x22, f(-20, 162, 8), 0x10401
    entity Effect, 0x22, f(-130, 130, 8), 0x10403
    entity Effect, 0x22, f(-122, 20, 8), 0x2
    entity Effect, 0x22, f(-28, -14, 8), 0x0
    entity Effect, 0x22, f(-130, 130, 8), 0x10200
    entity Effect, 0x22, f(-162, 20, 8), 0x10202
    entity Effect, 0x22, f(-20, 122, 8), 0x101
    entity Effect, 0x22, f(14, 28, 8), 0x103
    entity Effect, 0x22, f(-20, 20, 8), 0x10401
    entity Effect, 0x22, f(-130, -12, 8), 0x10403
    .word 0xFF

global_label EntityAllocParams_803AB3C
    entity Effect, 0x1E, f(-24, 130, 0), 0x100
    entity Effect, 0x1E, f(-130, 130, 0), 0x1
    entity Effect, 0x1E, f(-130, 24, 0), 0x102
    entity Effect, 0x1E, f(-24, 24, 0), 0x10103
    entity Effect, 0x22, f(-28, 130, 8), 0x100
    entity Effect, 0x22, f(-122, 164, 8), 0x102
    entity Effect, 0x22, f(12, 130, 8), 0x10200
    entity Effect, 0x22, f(-20, 20, 8), 0x10202
    entity Effect, 0x22, f(-130, 28, 8), 0x103
    entity Effect, 0x22, f(-164, 122, 8), 0x101
    entity Effect, 0x22, f(-20, 162, 8), 0x10201
    entity Effect, 0x22, f(-130, 130, 8), 0x10203
    entity Effect, 0x22, f(-122, 20, 8), 0x2
    entity Effect, 0x22, f(-28, -14, 8), 0x0
    entity Effect, 0x22, f(-130, 130, 8), 0x10200
    entity Effect, 0x22, f(-162, 20, 8), 0x10202
    entity Effect, 0x22, f(-20, 122, 8), 0x101
    entity Effect, 0x22, f(14, 28, 8), 0x103
    entity Effect, 0x22, f(-20, 20, 8), 0x10401
    entity Effect, 0x22, f(-130, -12, 8), 0x10403
    entity Effect, 0x1, f(-26, -24, 0), 0x2D
    entity Effect, 0x1, f(-26, 232, 0), 0x2E
    entity Effect, 0x1, f(-202, 26, 0), 0x2F
    entity Effect, 0x1, f(-16, -32, 0), 0x22
    .word 0xFF

global_label EntityAllocParams_803AD20
    entity Effect, 0x1A, f(48, 26, 0), 0xFF000000
    entity Effect, 0x1A, f(-58, 26, 0), 0xFFFF0001
    entity Effect, 0x1A, f(-58, -80, 0), 0xFFFF0002
    entity Effect, 0x1A, f(48, -80, 0), 0xFFFF0003
    entity Effect, 0x1B, f(44, 26, 8), 0x0
    entity Effect, 0x1B, f(-50, 60, 8), 0x200
    entity Effect, 0x1D, f(84, 26, 8), 0x0
    entity Effect, 0x1D, f(52, -84, 8), 0x200
    entity Effect, 0x1B, f(-58, -76, 8), 0x301
    entity Effect, 0x1B, f(-92, 18, 8), 0x101
    entity Effect, 0x1D, f(52, 58, 8), 0x101
    entity Effect, 0x1D, f(-58, 26, 8), 0x301
    entity Effect, 0x1B, f(-50, -84, 8), 0x202
    entity Effect, 0x1B, f(44, -118, 8), 0x2
    entity Effect, 0x1D, f(-58, 26, 8), 0x2
    entity Effect, 0x1D, f(-90, -84, 8), 0x202
    entity Effect, 0x1B, f(52, 18, 8), 0x103
    entity Effect, 0x1B, f(86, -76, 8), 0x303
    entity Effect, 0x1D, f(52, -84, 8), 0x103
    entity Effect, 0x1D, f(-58, -116, 8), 0x303
    .word 0xFF

global_label EntityAllocParams_803AEB4
    entity Effect, 0x1, f(46, -118, 0), 0x30
    entity Effect, 0x1, f(46, 128, 0), 0x31
    entity Effect, 0x1, f(86, -78, 0), 0x32
    entity Effect, 0x1, f(-130, -78, 0), 0x33
    entity Effect, 0x1, f(102, 32, 0), 0x23
    .word 0xFF

global_label EntityAllocParams_803AF1C
    entity Effect, 0x1E, f(48, 26, 0), 0x10000
    entity Effect, 0x1E, f(-58, 26, 0), 0x101
    entity Effect, 0x1E, f(-58, -80, 0), 0x102
    entity Effect, 0x1E, f(48, -80, 0), 0x103
    entity Effect, 0x22, f(44, 26, 8), 0x100
    entity Effect, 0x22, f(-50, 60, 8), 0x102
    entity Effect, 0x22, f(84, 26, 8), 0x10400
    entity Effect, 0x22, f(52, -84, 8), 0x10402
    entity Effect, 0x22, f(-58, -76, 8), 0x103
    entity Effect, 0x22, f(-92, 18, 8), 0x101
    entity Effect, 0x22, f(52, 58, 8), 0x10201
    entity Effect, 0x22, f(-58, 26, 8), 0x10203
    entity Effect, 0x22, f(-50, -84, 8), 0x102
    entity Effect, 0x22, f(44, -118, 8), 0x100
    entity Effect, 0x22, f(-58, 26, 8), 0x10200
    entity Effect, 0x22, f(-90, -84, 8), 0x10202
    entity Effect, 0x22, f(52, 18, 8), 0x1
    entity Effect, 0x22, f(86, -76, 8), 0x3
    entity Effect, 0x22, f(52, -84, 8), 0x10201
    entity Effect, 0x22, f(-58, -116, 8), 0x10203
    entity Effect, 0x1, f(46, -118, 0), 0x30
    entity Effect, 0x1, f(46, 128, 0), 0x31
    entity Effect, 0x1, f(86, -78, 0), 0x32
    entity Effect, 0x1, f(-130, -78, 0), 0x33
    entity Effect, 0x1, f(102, 32, 0), 0x23
    .word 0xFF

global_label EntityAllocParams_803B114
    entity Effect, 0x1A, f(152, 2, 0), 0xFFFF0000
    entity Effect, 0x1A, f(46, 2, 0), 0xFF000001
    entity Effect, 0x1A, f(46, -104, 0), 0xFFFF0002
    entity Effect, 0x1A, f(152, -104, 0), 0xFFFF0003
    entity Effect, 0x1B, f(148, 2, 8), 0x0
    entity Effect, 0x1B, f(54, 36, 8), 0x200
    entity Effect, 0x1D, f(188, 2, 8), 0x0
    entity Effect, 0x1D, f(156, -108, 8), 0x200
    entity Effect, 0x1B, f(46, -100, 8), 0x301
    entity Effect, 0x1B, f(12, -6, 8), 0x101
    entity Effect, 0x1D, f(156, 34, 8), 0x101
    entity Effect, 0x1D, f(46, 2, 8), 0x301
    entity Effect, 0x1B, f(54, -108, 8), 0x202
    entity Effect, 0x1B, f(148, -142, 8), 0x2
    entity Effect, 0x1D, f(46, 2, 8), 0x2
    entity Effect, 0x1D, f(14, -108, 8), 0x202
    entity Effect, 0x1B, f(156, -6, 8), 0x103
    entity Effect, 0x1B, f(190, -100, 8), 0x303
    entity Effect, 0x1D, f(156, -108, 8), 0x103
    entity Effect, 0x1D, f(46, -140, 8), 0x303
    .word 0xFF

global_label EntityAllocParams_803B2A8
    entity Effect, 0x1, f(150, 88, 0), 0x38
    entity Effect, 0x1, f(150, 184, 0), 0x39
    entity Effect, 0x1, f(-42, -102, 0), 0x3A
    entity Effect, 0x1, f(-138, -102, 0), 0x3B
    entity Effect, 0x1, f(40, 104, 0), 0x22
    .word 0xFF

global_label EntityAllocParams_803B310
    entity Effect, 0x1E, f(152, 2, 0), 0x1000100
    entity Effect, 0x1E, f(46, 2, 0), 0x10001
    entity Effect, 0x1E, f(46, -104, 0), 0x102
    entity Effect, 0x1E, f(152, -104, 0), 0x103
    entity Effect, 0x22, f(148, 2, 8), 0x0
    entity Effect, 0x22, f(54, 36, 8), 0x2
    entity Effect, 0x22, f(188, 2, 8), 0x10200
    entity Effect, 0x22, f(156, -108, 8), 0x10202
    entity Effect, 0x22, f(46, -100, 8), 0x103
    entity Effect, 0x22, f(12, -6, 8), 0x101
    entity Effect, 0x22, f(156, 34, 8), 0x10401
    entity Effect, 0x22, f(46, 2, 8), 0x10403
    entity Effect, 0x22, f(54, -108, 8), 0x102
    entity Effect, 0x22, f(148, -142, 8), 0x100
    entity Effect, 0x22, f(46, 2, 8), 0x10200
    entity Effect, 0x22, f(14, -108, 8), 0x10202
    entity Effect, 0x22, f(156, -6, 8), 0x101
    entity Effect, 0x22, f(190, -100, 8), 0x103
    entity Effect, 0x22, f(156, -108, 8), 0x10201
    entity Effect, 0x22, f(46, -140, 8), 0x10203
    entity Effect, 0x1, f(150, 88, 0), 0x38
    entity Effect, 0x1, f(150, 184, 0), 0x39
    entity Effect, 0x1, f(-42, -102, 0), 0x3A
    entity Effect, 0x1, f(-138, -102, 0), 0x3B
    entity Effect, 0x1, f(40, 104, 0), 0x22
    .word 0xFF

global_label EntityAllocParams_803B508
    entity Effect, 0x1, f(18, -18, 0), 0x37
    entity Effect, 0x1, f(18, 30, 0), 0x37
    entity Effect, 0x1, f(18, 78, 0), 0x37
    entity Effect, 0x1, f(-30, -18, 0), 0x37
    entity Effect, 0x1, f(-30, 30, 0), 0x37
    entity Effect, 0x1, f(-30, 78, 0), 0x37
    .word 0xFF

PTR_EntityAllocParams_8039694_0803b584:
    .word EntityAllocParams_8039694
    .word 0
    .word EntityAllocParams_803A5D8
    .word EntityAllocParams_803A7C0
    .word EntityAllocParams_803AD20
    .word EntityAllocParams_803B114

PTR_NPCParamList_803B5B4_0803b59c:
    .word NPCParamList_803B5B4
    .word 0
    .word NPCParamList_803B5F4
    .word NPCParamList_803B634
    .word NPCParamList_803B674
    .word NPCParamList_803B6B4

NPCParamList_803B5B4:
    .word f(-56, 308, 0), 0
    .word f(-308, 12, 0), 1
    .word f(-14, -235, 0), 2
    .word f(237, 58, 0), 3

NPCParamList_803B5F4:
    .word f(-24, 284, 0), 0
    .word f(-240, -4, 0), 1
    .word f(18, -184, 0), 2
    .word f(233, 42, 0), 3

NPCParamList_803B634:
    .word f(-96, 307, 0), 0
    .word f(-348, 52, 0), 1
    .word f(-54, -156, 0), 2
    .word f(156, 98, 0), 3

NPCParamList_803B674:
    .word f(-24, 208, 0), 0
    .word f(-247, -52, 0), 1
    .word f(18, -299, 0), 2
    .word f(228, -6, 0), 3

NPCParamList_803B6B4:
    .word f(80, 179, 0), 0
    .word f(-131, -76, 0), 1
    .word f(122, -284, 0), 2
    .word f(364, -30, 0), 3


_ts FUN_0803b6f4
    push       {r5,lr}
    ldr        r5,PTR_DAT_0803b900
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    bne        LAB_0803b70c
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    beq        LAB_0803b736
LAB_0803b70c:
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    bl         FUN_0803b890
    ldr        r0,DAT_0803b904
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Set380
    pop        {r5}
    b          LAB_0803b766
LAB_0803b736:
    ldrb       r0,[r5,#0x6]
    tst        r0,r0
    bne        LAB_0803b756
    push       {r5}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x0
    bl         Flag_Clear380
    ldrb       r0,[r5,#0x5]
    mov        r1,#0x1
    eor        r0,r1
    add        r0,#0x0
    bl         Flag_Set380
    pop        {r5}
    b          LAB_0803b766
LAB_0803b756:
    push       {r5}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    pop        {r5}
LAB_0803b766:
    push       {r5}
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldrb       r1,[r1,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_EntityAllocParams_8039694_0803b908
    ldr        r0,[r0,r1]
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    pop        {r5,pc}

    .align 2, 0


_ts FUN_0803b788
    push       {r5,lr}
    ldr        r5,PTR_DAT_0803b90c
    ldr        r0,PTR_PTR_FUN_0803b7a4_0803b910
    ldrb       r1,[r5,#0x4]
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {r5,pc}

PTR_FUN_0803b7a4_0803b798:
    .word FUN_0803b7a4
    .word FUN_0803b7f4
    .word FUN_0803b810


_ts FUN_0803b7a4
    push       {lr}
    ldrh       r0,[r5,#0x2]
    sub        r0,#0x1
    strh       r0,[r5,#0x2]
    bgt        LAB_0803b7e0
    push       {r5}
    bl         GetCollisionEventAttribute
    pop        {r5}
    ldrb       r1,[r5,#0x5]
    mov        r2,#0x1
    eor        r1,r2
    add        r1,#0x10
    cmp        r0,r1
    beq        LAB_0803b7dc
    mov        r0,#0x1
    strb       r0,[r5,#0x6]
    push       {r0}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Clear380
    pop        {r0}
    mov        r0,#0x4
    strb       r0,[r5,#0x4]
    b          LAB_0803b7f0
LAB_0803b7dc:
    mov        r0,#0x1
    strh       r0,[r5,#0x2]
LAB_0803b7e0:
    ldrh       r0,[r5,#0x0]
    sub        r0,#0x1
    strh       r0,[r5,#0x0]
    bgt        LAB_0803b7f0
    bl         FUN_0803b840
    bl         FUN_0803b890
LAB_0803b7f0:
    pop        {pc}

    .align 2, 0


_ts FUN_0803b7f4
    push       {lr}
    ldrb       r0,[r5,#0x5]
    add        r0,#0x8
    add        r0,r0,r5
    ldrb       r1,[r0,#0x0]
    ldrb       r2,[r0,#0x2]
    add        r1,r1,r2
    tst        r1,r1
    bne        LAB_0803b80e
    mov        r0,#0x3c
    strh       r0,[r5,#0x2]
    mov        r0,#0x8
    strb       r0,[r5,#0x4]
LAB_0803b80e:
    pop        {pc}


_ts FUN_0803b810
    push       {lr}
    ldrh       r0,[r5,#0x2]
    sub        r0,#0x1
    strh       r0,[r5,#0x2]
    bgt        LAB_0803b83e
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    ldrb       r0,[r5,#0x5]
    push       {r0}
    add        r0,#0x0
    bl         Flag_Set380
    pop        {r0}
    mov        r1,#0x1
    eor        r0,r1
    strb       r0,[r5,#0x5]
    add        r0,#0x0
    bl         Flag_Clear380
    ldr        r0,DAT_0803b904
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
LAB_0803b83e:
    pop        {pc}


_ts FUN_0803b840
    push       {lr}
    ldrb       r0,[r5,#0x7]
    cmp        r0,#0x2
    bne        LAB_0803b850
    mov        r0,#0x0
    strb       r0,[r5,#0x7]
    mov        r0,#0x1
    b          LAB_0803b85c
LAB_0803b850:
    push       {r5}
    bl         Rng_RandomUint
    pop        {r5}
    mov        r1,#0x3
    and        r0,r1
LAB_0803b85c:
    add        r1,r5,#0x0
    add        r1,#0x8
    ldrb       r2,[r1,r0]
    tst        r2,r2
    bne        LAB_0803b88c
    mov        r2,#0x1
    strb       r2,[r1,r0]
    lsl        r0,r0,#0x4
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldrb       r1,[r1,#0x5]
    lsl        r1,r1,#0x2
    ldr        r7,PTR_PTR_NPCParamList_803B5B4_0803b914
    ldr        r7,[r7,r1]
    add        r7,r7,r0
    push       {r5}
    mov        r0,#0x1c
    ldr        r1,[r7,#0x0]
    ldr        r2,[r7,#0x4]
    ldr        r3,[r7,#0x8]
    ldr        r4,[r7,#0xc]
    bl         Effect_Alloc
    pop        {r5}
LAB_0803b88c:
    pop        {pc}

    .align 2, 0


_ts FUN_0803b890
    push       {lr}
    mov        r1,#0x1
    ldrb       r0,[r5,#0x7]
    cmp        r0,#0x1
    bne        LAB_0803b8a0
    mov        r0,#0x2
    strb       r0,[r5,#0x7]
    b          LAB_0803b8b0
LAB_0803b8a0:
    push       {r5}
    bl         Rng_RandomUint
    pop        {r5}
    mov        r1,#0x3
    and        r1,r0
    ldr        r2,PTR_DAT_0803b918
    ldrb       r1,[r2,r1]
LAB_0803b8b0:
    strh       r1,[r5,#0x0]
    pop        {pc}

DAT_0803b8b4:
    .byte 30
    .byte 90
    .byte 150
    .byte 210


_ts FUN_0803b8b8
    push       {r5,lr}
    ldr        r5,PTR_DAT_0803b91c
    mov        r0,#0x1
    strb       r0,[r5,#0x7]
    mov        r0,#0x0
    strb       r0,[r5,#0x5]
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    bl         FUN_0803b890
    ldr        r0,DAT_0803b904
    strh       r0,[r5,#0x2]
    mov        r0,#0x0
    strb       r0,[r5,#0x6]
    mov        r0,#0x0
    strb       r0,[r5,#0x8]
    strb       r0,[r5,#0x9]
    strb       r0,[r5,#0xa]
    strb       r0,[r5,#0xb]
    push       {r5}
    mov        r1,r10
    ldr        r1,[r1,#0x8]
    ldrb       r1,[r1,#0x5]
    lsl        r1,r1,#0x2
    ldr        r0,PTR_PTR_EntityAllocParams_8039694_0803b920
    ldr        r0,[r0,r1]
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0x0
    bl         Flag_Clear380
    mov        r0,#0x1
    bl         Flag_Set380
    pop        {r5,pc}

PTR_DAT_0803b900:
    .word 0x2000120

DAT_0803b904:
    .word 0x168

PTR_PTR_EntityAllocParams_8039694_0803b908:
    .word PTR_EntityAllocParams_8039694_0803b584

PTR_DAT_0803b90c:
    .word 0x2000120

PTR_PTR_FUN_0803b7a4_0803b910:
    .word PTR_FUN_0803b7a4_0803b798

PTR_PTR_NPCParamList_803B5B4_0803b914:
    .word PTR_NPCParamList_803B5B4_0803b59c

PTR_DAT_0803b918:
    .word DAT_0803b8b4

PTR_DAT_0803b91c:
    .word 0x2000120

PTR_PTR_EntityAllocParams_8039694_0803b920:
    .word PTR_EntityAllocParams_8039694_0803b584
