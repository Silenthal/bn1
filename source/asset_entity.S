#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

global_label listEntityAlloc
    .word PlayerLocation_Alloc
    .word Actor_Alloc
    .word AttackCell_Alloc
    .word DisplayObject_Alloc
    .word NPC_Alloc

global_label listEntityFree
    .word PlayerLocation_Free
    .word Actor_Free
    .word AttackCell_Free
    .word DisplayObject_Free
    .word NPC_Free

global_label listEntityList
    .word gEntityListPlayerLocation
    .word gEntityListActor
    .word gEntityListAttackCell
    .word gListDisplayObject
    .word gEntityListNpc

global_label listFlagSet
    .word gBitsetPlayerLocation
    .word gBitsetActor
    .word gBitsetAttackCell
    .word gBitsetDisplayObject
    .word gBitsetNPC

global_label INT_08002324
    .word 0xB0
    .word 0xC0
    .word 0xB0
    .word 0xB0
    .word 0xC0

.end
