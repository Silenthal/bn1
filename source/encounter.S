#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set FUN_080055e8, 0x80055e8

    .text

    .thumb

thumb_func_start Encounter_Init
Encounter_Init:
    push       { lr }
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldr        r0,[r6,#0x2c]
    mov        r1,#0x0
    str        r1,[r6,#0x2c]
    tst        r0,r0
    bne        LAB_0800551c
    ldrb       r0,[r6,#0x4]
    ldrb       r1,[r6,#0x5]
    bl         Encounter_GetRandomEncounter
LAB_0800551c:
    str        r0,[r5,#0x74]
    pop        { pc }
thumb_func_end Encounter_Init

thumb_func_start Encounter_GetRandomEncounter
Encounter_GetRandomEncounter:
    push       { lr }
    push       { r1 }
    ldr        r7,=encounterGroupsList
    add        r2,r0,#0x0
    mov        r1,#0x80
    tst        r0,r1
    beq        LAB_08005532
    add        r7,#0x4
    sub        r0,#0x80
LAB_08005532:
    ldr        r7,[r7,#0x0]
    pop        { r1 }
    lsl        r0,r0,#0x2
    ldr        r7,[r7,r0]
    add        r0,r1,#0x0
    cmp        r2,#0x90
    bne        LAB_08005548
    push       { r7 }
    bl         FUN_080055e8
    pop        { r7 }
LAB_08005548:
    lsl        r0,r0,#0x2
    ldr        r0,[r7,r0]
    mov        r8,r0
    bl         Rng_RandomInt
    mov        r7,r8
    mov        r1,#0xff
    and        r0,r1
LAB_08005558:
    ldrb       r1,[r7,#0x0]
    sub        r0,r0,r1
    bls        LAB_08005562
    add        r7,#0x8
    b          LAB_08005558
LAB_08005562:
    ldr        r0,[r7,#0x4]
    ldrb       r1,[r7,#0x1]
    tst        r1,r1
    beq        LAB_0800557e
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    ldrb       r1,[r6,#0xf]
    mov        r2,#0x8
    cmp        r1,r2
    bge        LAB_0800557e
    mov        r6,r10
    ldr        r6,[r6,#0x8]
    mov        r1,#0x5
    strb       r1,[r6,#0xf]
LAB_0800557e:
    pop        { pc }
thumb_func_end Encounter_GetRandomEncounter

encounterGroupsIrl:
    .word encounterGroupSchoolComp
    .word encounterGroupSchoolComp
    .word encounterGroupSchoolComp
    .word encounterGroupSchoolComp
    .word encounterGroupSchoolComp
    .word encounterGroupSchoolComp

encounterGroupsWeb:
    .word encounterGroupSchoolComp
    .word encounterGroupOvenComp
    .word encounterGroupWaterworksComp
    .word encounterGroupTrafficLightComp
    .word encounterGroupPowerPlantComp
    .word encounterGroupWWWComp
    .word encounterGroupInternet
    .word encounterGroupInternet
    .word encounterGroupAcdcHP
    .word encounterGroupGovtComplexHP
    .word encounterGroupDenTownHP
    .word encounterGroupGovtComplex2HP
    .word encounterGroupOther
    .word encounterGroupInternet
    .word encounterGroupInternet
    .word encounterGroupInternet
    .word encounterGroupInternet

encounterGroupsList:
    .word encounterGroupsIrl
    .word encounterGroupsWeb

    .pool

    .end
