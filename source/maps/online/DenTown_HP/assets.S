#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


global_label NPCList_804FFCC
    .word NPC_804FFD8
    .word NPC_804FFFC
    .word 0xFF

    .align 2, 0

NPC_804FFD8:
    a_create_bmd 400, -4, 0, FLAG_ITEM_DENTOWN_ANTIQUE_COMP_KEYMIYU, dialog=0x5
    .align 2, 0

NPC_804FFFC:
    a_create_gmd 146, 236, 0, FLAG_ITEM_DENTOWN_ANTIQUE_COMP_BARRIER_S, dialog=0x6
global_label EntityAllocParams_8050020
    entity Effect, 0x16, f(-398, -18, 0), 0x603
    entity Effect, 0x16, f(-14, 110, 0), 0x4B010603
    .word 0xFF
