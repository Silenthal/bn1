#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    .asciz "SRAM_V112"

    .align 2, 0

    .word ReadSram_Core
    .word ReadSram
    .word VerifySram_Core
    .word VerifySram
