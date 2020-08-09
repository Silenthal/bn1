    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

@@ Returns an item drop from an enemy.
@@ r0: 1 if zenny, 0 if a chip
@@ r1: The amount of zenny, or the chip ID
@@ r2: The chip code
@ Enemy_GetDrop(byte enemyId, byte bustingLevel)
non_word_aligned_thumb_func_start Enemy_GetDrop
Enemy_GetDrop:
    push       { lr }
    push       { r1 }
    bl         Enemy_GetEnemyDetail
    @ r0 = enemy detail ptr
    pop        { r1 }
    .byte 0x0E, 0x4F @ ldr        r7,PTR_arrayBustingLevelToRollChance_0807d854
    lsl        r1,r1,#0x4
    add        r7,r7,r1
    @ r7 = roll chance array for given busting level
    push       { r0 }
    push       { r7 }
    bl         Rng_RandomUint
    @ r0 = randnum
    mov        r1,#0xf
    and        r1,r0
    @ r1 = random number from 0 to 15
    pop        { r7 }
    ldrb       r1,[r7,r1]
    @ r1 = random index picked from roll chance array
    lsl        r1,r1,#0x2
    mov        r2,#0x10
    and        r2,r0
    lsr        r2,r2,#0x3
    @ r2 = 0 or 2
    add        r1,r1,r2
    add        r1,#0xc
    pop        { r0 }
    @ Enemy drop table is 5 groups of 2 rewards each
    @ Index selects the group, and the reward is
    @ picked at random from the group
    ldrsh      r0,[r0,r1]
    @ r0 = short from the enemy's drop table
    tst        r0,r0
    bmi        LAB_0807d84c
    @ Highest bit is 0, so it's a battle chip
    mov        r1,#0xff
    and        r1,r0
    @ r1 = chip ID
    lsr        r2,r0,#0x8
    @ r2 = chip code
    mov        r0,#0x0
    b          LAB_0807d852
LAB_0807d84c:
    @ If the highest bit is 1, then it's zenny 
    @ Max zenny reward is 0x7FFF, or 32767 zenny
    lsl        r1,r0,#0x11
    lsr        r1,r1,#0x11
    mov        r0,#0x1
LAB_0807d852:
    pop        { pc }
thumb_func_end Enemy_GetDrop
PTR_arrayBustingLevelToRollChance_0807d854:
    .word arrayBustingLevelToRollChance

arrayBustingLevelToRollChance:
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 0
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 1
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 2
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  @ Lv. 3
        .byte 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1  @ Lv. 4
        .byte 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2  @ Lv. 5
        .byte 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2  @ Lv. 6
        .byte 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3  @ Lv. 7
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3  @ Lv. 8
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4  @ Lv. 9
        .byte 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4  @ Lv. 10
        .byte 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4  @ Lv. S
    
    .end
