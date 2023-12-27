#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label listEntityAlloc
    .word PlayerLocation_Alloc
    .word Actor_Alloc
    .word Attack_Alloc
    .word Effect_Alloc
    .word NPC_Alloc

global_label listEntityFree
    .word PlayerLocation_Free
    .word Actor_Free
    .word Attack_Free
    .word Effect_Free
    .word NPC_Free

global_label listEntityList
    .word gEntityListPlayerLocation
    .word gEntityListActor
    .word gEntityListAttack
    .word gListEffect
    .word gEntityListNpc

global_label listFlagSet
    .word gBitsetPlayerLocation
    .word gBitsetActor
    .word gBitsetAttack
    .word gBitsetEffect
    .word gBitsetNPC

global_label INT_08002324
    .word 0xB0
    .word 0xC0
    .word 0xB0
    .word 0xB0
    .word 0xC0

.end
