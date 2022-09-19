#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label listEntityAlloc
    .word PlayerLocation_Alloc
    .word Actor_Alloc
    .word AttackCell_Alloc
    .word Struct4CD0_Alloc
    .word NPC_Alloc

global_label listEntityFree
    .word PlayerLocation_Free
    .word Actor_Free
    .word AttackCell_Free
    .word Struct4CD0_Free
    .word NPC_Free

global_label listEntityList
    .word gEntityListPlayerLocation
    .word gEntityListActor
    .word gEntityListAttackCell
    .word gEntityList4CD0
    .word gEntityListNpc

global_label listFlagSet
    .word gBitsetPlayerLocation
    .word gBitsetActor
    .word gBitsetAttackCell
    .word gBitset4CD0
    .word gBitsetNPC

global_label INT_08002324
    .word 0xB0
    .word 0xC0
    .word 0xB0
    .word 0xB0
    .word 0xC0

.end
