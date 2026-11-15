#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    .asciz "SRAM_V112"

    .global ReadSram_Core
    .global ReadSram
    .global VerifySram_Core
    .global VerifySram

    @ the pointer table that follows the version string in the ROM
    .align 2, 0
    .word ReadSram_Core
    .word ReadSram
    .word VerifySram_Core
    .word VerifySram
