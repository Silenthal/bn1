#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"
    .text

    .thumb

thumb_func_start Enemy_GetEnemyDetail
Enemy_GetEnemyDetail:
    mov        r1,#0x20
    mul        r1,r0
    ldr        r0,=arrayEnemyDetails
    add        r0,r0,r1
    mov        pc,lr
thumb_func_end Enemy_GetEnemyDetail

    .align 2, 0

    .pool

    .include "data/enemy/attribute.inc"
    .include "data/encounter/Tutorial/main.inc"
    .include "data/encounter/Fixed/main.inc"
    .include "data/encounter/SchoolComp/main.inc"
    .include "data/encounter/OvenComp/main.inc"
    .include "data/encounter/WaterworksComp/main.inc"
    .include "data/encounter/TrafficLightComp/main.inc"
    .include "data/encounter/PowerPlantComp/main.inc"
    .include "data/encounter/WWWComp/main.inc"
    .include "data/encounter/ACDCHP/main.inc"
    .include "data/encounter/GovernmentComplexHP/main.inc"
    .include "data/encounter/DenTownHP/main.inc"
    .include "data/encounter/GovernmentComplex2HP/main.inc"
    .include "data/encounter/Other/main.inc"
    .include "data/encounter/Internet/main.inc"

thumb_func_start dummy_10280
dummy_10280:
    push       { lr }
    ldr        r7,PTR_PTR_dummy_102d8_08010290
    ldrb       r0,[r5,#0xf]
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    mov        lr,pc
    bx         r7
    pop        { pc }
thumb_func_end dummy_10280
PTR_PTR_dummy_102d8_08010290: .word PTR_dummy_102d8_08010294
PTR_dummy_102d8_08010294:
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8
    .word dummy_102d8

thumb_func_start dummy_102d8
dummy_102d8:
    push       { lr }
    pop        { pc }
thumb_func_end dummy_102d8

    .end
