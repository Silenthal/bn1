#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


    .asciz "SRAM_V112"

    .align 2, 0

    .word memcpy_8_sram_copy
    .word MemCpy_8_Sram
    .word memcmp_8
    .word MemCmp_8_Sram
