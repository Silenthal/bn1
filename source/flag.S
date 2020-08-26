#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

thumb_func_start FUN_080102dc
FUN_080102dc:
    push       { lr }
    ldr        r0,PTR_DAT_080103f8
    mov        r1,#0x8c
    bl         memset0_32
    pop        { pc }
thumb_func_end FUN_080102dc

thumb_func_start FUN_080102e8
FUN_080102e8:
    push       { lr }
    ldr        r0,PTR_DAT_080102f4
    ldr        r1,DAT_080102f8
    bl         memset0_16
    pop        { pc }
thumb_func_end FUN_080102e8
PTR_DAT_080102f4:   .word 0x2000012
DAT_080102f8:       .word 0xE


thumb_func_start FUN_080102fc
FUN_080102fc:
    push       { lr }
    ldr        r0,PTR_DAT_08010308
    ldr        r1,DAT_0801030c
    bl         memset0_16
    pop        { pc }
thumb_func_end FUN_080102fc
PTR_DAT_08010308:       .word 0x2000082
DAT_0801030c:           .word 2

thumb_func_start FUN_08010310
FUN_08010310:
    push       { lr }
    ldr        r0,PTR_DAT_0801031c
    ldr        r1,DAT_08010320
    bl         memset0_16
    pop        { pc }
thumb_func_end FUN_08010310
PTR_DAT_0801031c:   .word 0x2000070
DAT_08010320:       .word 0x10

global_label Flag_Set420
    add        r0,#0x10
global_label Flag_Set410
    add        r0,#0x10
global_label Flag_Set400
    add        r0,#0x80
global_label Flag_Set380
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_Set280
    add        r0,#0x40
global_label Flag_Set240
    add        r0,#0x40
global_label Flag_Set200
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_Set100
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_SetBase
    ldr        r7,PTR_DAT_080103fc
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0
global_label Flag_Clear420
    add        r0,#0x10
global_label Flag_Clear410
    add        r0,#0x10
global_label Flag_Clear400
    add        r0,#0x80
global_label Flag_Clear380
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_Clear280
    add        r0,#0x40
    add        r0,#0x40
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_ClearBase
    ldr        r7,PTR_DAT_08010400
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    mvn        r1,r1
    ldrb       r0,[r7,#0x0]
    and        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

        .align 2, 0
global_label Flag_Get420
    add        r0,#0x10
global_label Flag_Get410
    add        r0,#0x10
global_label Flag_Get400
    add        r0,#0x80
global_label Flag_Get380
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_Get280
    add        r0,#0x40
global_label Flag_Get240
    add        r0,#0x40
global_label Flag_Get200
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_Get100
    add        r0,#0x80
    add        r0,#0x80

global_label Flag_GetBase
    ldr        r7,PTR_DAT_08010404
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    and        r0,r1
    mov        pc,lr
        
        .align 2, 0

global_label Flag_Toggle420
    add        r0,#0x10
    add        r0,#0x10
    add        r0,#0x80

global_label Flag_Toggle380
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x40
    add        r0,#0x40
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_ToggleBase
    ldr        r7,PTR_DAT_08010408
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    eor        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

global_label Flag_SetEmail
    push       { lr }
    push       { r0 }
    bl         Flag_Set240
    pop        { r0 }
    push       { r0 }
    bl         Flag_Set200
    pop        { r0 }
    ldr        r7,PTR_gEmailIndexes_0801040c
    ldr        r6,PTR_gEmailCount_08010410
    ldr        r1,[r6,#0x0]
    strb       r0,[r7,r1]
    add        r1,#0x1
    str        r1,[r6,#0x0]
    pop        { pc }

PTR_DAT_080103f8:           .word gFlagBase
PTR_DAT_080103fc:           .word gFlagBase
PTR_DAT_08010400:           .word gFlagBase
PTR_DAT_08010404:           .word gFlagBase
PTR_DAT_08010408:           .word gFlagBase
PTR_gEmailIndexes_0801040c: .word gEmailIndexes
PTR_gEmailCount_08010410:   .word gEmailCount
