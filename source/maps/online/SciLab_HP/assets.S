#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label NPCList_8050288
    .word NPC_8050294
    .word NPC_80502B8
    .word 0xFF

    .align 2, 0

NPC_8050294:
    a_create_bmd 180, -164, 0, FLAG_ITEM_SCILAB_FISH_STAND_COMP_KEYMASA, dialog=0x5
    .align 2, 0

NPC_80502B8:
    a_create_gmd -172, -36, 0, FLAG_ITEM_SCILAB_FISH_STAND_COMP_TRISPEAR_J, dialog=0x6
global_label EntityAllocParams_80502DC
    entity Effect, EFI_TeleportPortal, f(50, -386, 0), 0x2000002
    entity Effect, EFI_TeleportPortal, f(162, 350, 0), 0x49010002
    .word 0xFF
