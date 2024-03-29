#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .text


_ts FieldObject_Init
    mov        r0,#0x0
    ldr        r7,PTR_gBitsetFieldObject_08002c7c
    str        r0,[r7,#0x0]
    mov        r3,#0x0
    ldr        r7,PTR_gListFieldObject_08002c78
LAB_08002c6a:
    strb       r0,[r7,#0x0]
    strb       r3,[r7,#0x1]
    add        r7,#0x18
    add        r3,#0x1
    cmp        r3,#0x20
    bmi        LAB_08002c6a
    mov        pc,lr
PTR_gListFieldObject_08002c78:
    .word gListFieldObject
PTR_gBitsetFieldObject_08002c7c:
    .word gBitsetFieldObject


_ts FieldObject_Alloc
    ldr        r7,PTR_gBitsetFieldObject_08002ccc
    ldr        r6,[r7,#0x0]
    mov        r1,#0x1
    lsl        r1,r1,#0x1f
    mov        r3,#0x0
LAB_08002c8a:
    tst        r6,r1
    beq        LAB_08002c9a
    lsr        r1,r1,#0x1
    add        r3,#0x1
    cmp        r3,#0x20
    bmi        LAB_08002c8a
    mov        r0,#0x0
    b          LAB_08002cc6
LAB_08002c9a:
    orr        r6,r1
    str        r6,[r7,#0x0]
    ldr        r7,PTR_FieldObject_ARRAY_08002cc8
    mov        r2,#0x1
    lsl        r2,r2,#0x1f
LAB_08002ca4:
    tst        r6,r2
    beq        LAB_08002cae
    ldr        r0,[r7,#0x14]
    bic        r0,r1
    str        r0,[r7,#0x14]
LAB_08002cae:
    add        r7,#0x18
    lsr        r2,r2,#0x1
    bne        LAB_08002ca4
    ldr        r0,PTR_FieldObject_ARRAY_08002cc8
    mov        r2,#0x18
    mul        r2,r3
    add        r0,r0,r2
    mov        r6,#0x7
    strb       r6,[r0,#0x0]
    str        r1,[r0,#0x10]
    ldrb       r2,[r5,#0x1]
    strb       r2,[r0,#0x7]
LAB_08002cc6:
    mov        pc,lr
PTR_FieldObject_ARRAY_08002cc8:
    .word gListFieldObject
PTR_gBitsetFieldObject_08002ccc:
    .word gBitsetFieldObject


_ts FieldObject_Free
    ldr        r7,PTR_gBitsetFieldObject_08002ce8
    ldr        r2,[r7,#0x0]
    ldrb       r3,[r0,#0x1]
    mov        r1,#0x1
    lsl        r1,r1,#0x1f
    lsr        r1,r3
    mvn        r1,r1
    and        r2,r1
    str        r2,[r7,#0x0]
    mov        r3,#0x0
    strb       r3,[r0,#0x0]
    mov        pc,lr
PTR_gBitsetFieldObject_08002ce8:
    .word gBitsetFieldObject


_ts FieldObject_CalcDamage
    push       {lr}
    sub        sp,#0x3c
    str        r6,[sp,#0x34]
    mov        r6,sp
    str        r0,[r6,#0x0]
    str        r1,[r6,#0x4]
    str        r2,[r6,#0x8]
    str        r3,[r6,#0xc]
    str        r4,[r6,#0x10]
    mov        r0,#0x0
    str        r0,[r6,#0x14]
    str        r0,[r6,#0x18]
    str        r0,[r6,#0x1c]
    str        r0,[r6,#0x20]
    str        r0,[r6,#0x24]
    str        r0,[r6,#0x28]
    str        r0,[r6,#0x2c]
    str        r0,[r6,#0x30]
    ldr        r0,[r6,#0x34]
    ldrb       r1,[r0,#0x0]
    mov        r0,#0x4
    and        r1,r0
    str        r1,[r6,#0x38]
    mov        r0,#0x80
    lsl        r0,r0,#0x18
    ldr        r1,PTR_gBitsetFieldObject
    ldr        r1,[r1,#0x0]
    ldr        r7,PTR_gListFieldObject_08002dc0
    @ Check for active object
LAB_08002d24:
    tst        r0,r1
    beq        LAB_08002d9e
    @ Check that cur object isn't the same as the target
    ldr        r2,[r6,#0x10]
    tst        r0,r2
    bne        LAB_08002d9e
    ldr        r2,[r6,#0xc]
    tst        r0,r2
    beq        LAB_08002d3e
    @ Check that cur object isn't marked as "hit"
    mov        r2,#0x2
    lsl        r2,r2,#0x8
    ldr        r3,[r7,#0xc]
    tst        r2,r3
    bne        LAB_08002d9e
    @ Check that cur object is marked with "IsLive" flag
LAB_08002d3e:
    mov        r2,#0x2
    ldrb       r3,[r7,#0x0]
    tst        r2,r3
    beq        LAB_08002d9e
    @ Check that passed in panelflag at least partially matches
    ldr        r3,[r6,#0x4]
    ldr        r2,[r7,#0xc]
    tst        r2,r3
    beq        LAB_08002d9e
    @ Check that cur object is within 1 square of target if cur object is a
    @ 3x3 attack
    mov        r2,#0x8
    ldrb       r3,[r7,#0x0]
    tst        r2,r3
    beq        LAB_08002d6c
    push       {r0,r1}
    ldrb       r0,[r6,#0x0]
    ldrb       r1,[r6,#0x1]
    ldrb       r2,[r7,#0x2]
    ldrb       r3,[r7,#0x3]
    bl         Field_IsClose_LeftUpBoundary
    tst        r0,r0
    pop        {r0,r1}
    beq        LAB_08002d9e
    b          LAB_08002d82
LAB_08002d6c:
    @ Check if cur object and target are on the same cell
    ldrh       r3,[r6,#0x0]
    ldrh       r2,[r7,#0x2]
    cmp        r2,r3
    beq        LAB_08002d82
    @ If not on the same cell, check if object is marked "new" and
    @ hasn't moved yet
    ldr        r3,[r6,#0x38]
    tst        r3,r3
    bne        LAB_08002d9e
    @ If object is not new, check if cur object is on the same cell as the
    @ target's prior cell position
    ldrh       r3,[r6,#0x0]
    ldrh       r2,[r7,#0x4]
    cmp        r2,r3
    bne        LAB_08002d9e
LAB_08002d82:
    @ Apply damage to the appropriate mem location, as well as the attacker's
    @ flags
    ldrb       r2,[r7,#0x6]
    lsl        r2,r2,#0x2
    add        r2,#0x20
    ldrh       r3,[r7,#0x8]
    ldr        r4,[r6,r2]
    add        r4,r4,r3
    str        r4,[r6,r2]
    ldr        r2,[r7,#0xc]
    ldr        r3,[r6,#0x18]
    orr        r3,r2
    str        r3,[r6,#0x18]
    ldr        r3,[r6,#0x1c]
    orr        r3,r0
    str        r3,[r6,#0x1c]
LAB_08002d9e:
    add        r7,#0x18
    lsr        r0,r0,#0x1
    bne        LAB_08002d24
    ldr        r0,[r6,#0x34]
    bl         FieldObject_MarkAsChecked
    ldr        r0,[r6,#0x18]
    ldr        r1,[r6,#0x1c]
    ldr        r2,[r6,#0x20]
    ldr        r3,[r6,#0x24]
    ldr        r4,[r6,#0x28]
    ldr        r7,[r6,#0x30]
    ldr        r6,[r6,#0x2c]
    add        sp,#0x3c
    pop        {pc}
PTR_gBitsetFieldObject:
    .word gBitsetFieldObject
PTR_gListFieldObject_08002dc0:
    .word gListFieldObject


_ts FieldObject_UpdateField
    mov        r8,r0
    mov        r3,#0x28
    ldr        r6,PTR_gAreaProperties_08002e5c
    ldr        r7,PTR_gPanelStatuses_08002e58
LAB_08002dcc:
    ldrb       r0,[r6,#0x0]
    str        r0,[r7,#0x0]
    add        r6,#0x1
    add        r7,#0x10
    sub        r3,#0x1
    bne        LAB_08002dcc
    mov        r0,#0x80
    lsl        r0,r0,#0x18
    ldr        r1,PTR_gBitsetFieldObject_08002e60
    ldr        r1,[r1,#0x0]
    ldr        r6,PTR_gPanelStatuses_08002e58
    ldr        r7,PTR_gListFieldObject_08002e64
LAB_08002de4:
    tst        r0,r1
    beq        LAB_08002e3a
    mov        r2,r8
    tst        r2,r0
    bne        LAB_08002e3a
    mov        r2,#0x2
    ldrb       r3,[r7,#0x0]
    tst        r2,r3
    beq        LAB_08002e3a
    mov        r2,#0x8
    tst        r2,r3
    bne        LAB_08002e12
    ldrb       r2,[r7,#0x3]
    lsl        r2,r2,#0x7
    ldrb       r3,[r7,#0x2]
    lsl        r3,r3,#0x4
    add        r2,r2,r3
    add        r4,r6,r2
    ldr        r3,[r7,#0xc]
    ldr        r2,[r4,#0x0]
    orr        r2,r3
    str        r2,[r4,#0x0]
    b          LAB_08002e3a
LAB_08002e12:
    ldrb       r2,[r7,#0x3]
    lsl        r2,r2,#0x7
    ldrb       r3,[r7,#0x2]
    lsl        r3,r3,#0x4
    add        r2,r2,r3
    add        r4,r6,r2
    push       {r0,r1,r6}
    ldr        r0,[r7,#0xc]
    mov        r2,#0x0
    ldr        r3,PTR_USHORT_ARRAY_08002e54
LAB_08002e26:
    lsl        r1,r2,#0x1
    ldrsh      r1,[r3,r1]
    add        r1,r1,r4
    ldr        r6,[r1,#0x0]
    orr        r6,r0
    str        r6,[r1,#0x0]
    add        r2,#0x1
    cmp        r2,#0x9
    blt        LAB_08002e26
    pop        {r0,r1,r6}
LAB_08002e3a:
    add        r7,#0x18
    lsr        r0,r0,#0x1
    bne        LAB_08002de4
    mov        pc,lr
USHORT_ARRAY_08002e42:
    .short 0xFF70, 0xFF80, 0xFF90
    .short 0xFFF0,    0x0, 0x10
    .short   0x70,   0x80, 0x90
PTR_USHORT_ARRAY_08002e54:          .word USHORT_ARRAY_08002e42
PTR_gPanelStatuses_08002e58:        .word gPanelStatuses
PTR_gAreaProperties_08002e5c:       .word gAreaProperties
PTR_gBitsetFieldObject_08002e60:    .word gBitsetFieldObject
PTR_gListFieldObject_08002e64:      .word gListFieldObject


_ts Field_IsClose_LeftUpBoundary
    add        r0,#0x1
    sub        r0,r0,r2
    cmp        r0,#0x2
    bhi        LAB_08002e7c
    add        r1,#0x1
    sub        r1,r1,r3
    cmp        r1,#0x2
    bhi        LAB_08002e7c
    mov        r0,#0x1
    b          LAB_08002e7e
LAB_08002e7c:
    mov        r0,#0x0
LAB_08002e7e:
    mov        pc,lr


_ts Field_GetPanelFlags
    ldr        r6,PTR_gPanelStatuses_08002e8c
    lsl        r0,r0,#0x4
    lsl        r1,r1,#0x7
    @ (r0 * 0x10) + (r1 * 0x80)
    add        r0,r0,r1
    ldr        r0,[r6,r0]
    mov        pc,lr
PTR_gPanelStatuses_08002e8c:    .word gPanelStatuses


_ts FieldObject_GetIdFlag
    mov        r2,#0x80
    lsl        r2,r2,#0x18
    ldrb       r1,[r0,#0x1]
    lsr        r2,r1
    add        r0,r2,#0x0
    mov        pc,lr


_ts Field_CalcDamageDealt
    mov        r8,r5
    ldr        r5,PTR_dmgMultNone_08002ee8
    add        r5,r5,r0
    ldrb       r0,[r5,#0x0]
    mul        r0,r2
    lsr        r0,r0,#0x4
    ldrb       r1,[r5,#0x5]
    mul        r1,r3
    lsr        r1,r1,#0x4
    add        r0,r0,r1
    ldrb       r1,[r5,#0xa]
    mul        r1,r4
    lsr        r1,r1,#0x4
    add        r0,r0,r1
    ldrb       r1,[r5,#0xf]
    mul        r1,r6
    lsr        r1,r1,#0x4
    add        r0,r0,r1
    ldrb       r1,[r5,#0x14]
    mul        r1,r7
    lsr        r1,r1,#0x4
    add        r0,r0,r1
    mov        r5,r8
    mov        pc,lr
dmgMultNone:
    .byte 0x10, 0x10, 0x10, 0x10, 0x10
dmgMultElec:
    .byte 0x10, 0x10, 0x10, 0x20, 0x10
dmgMultFire:
    .byte 0x10, 0x10, 0x10, 0x10, 0x20
dmgMultAqua:
    .byte 0x10, 0x10, 0x20, 0x10, 0x10
dmgMultWood:
    .byte 0x10, 0x20, 0x10, 0x10, 0x10

    .align 2, 0

PTR_dmgMultNone_08002ee8:   .word dmgMultNone


_ts Field_CalcDamageTaken
    mov        r8,r5
    ldr        r5,PTR_dmgEffectNone_08002f4c
    add        r5,r5,r0
    ldrb       r1,[r5,#0x0]
    tst        r1,r1
    beq        LAB_08002efc
    add        r2,#0x1
    lsr        r2,r1
LAB_08002efc:
    add        r0,r2,#0x0
    ldrb       r1,[r5,#0x5]
    tst        r1,r1
    beq        LAB_08002f08
    add        r3,#0x1
    lsr        r3,r3,#0x1
LAB_08002f08:
    add        r0,r0,r3
    ldrb       r1,[r5,#0xa]
    tst        r1,r1
    beq        LAB_08002f14
    add        r4,#0x1
    lsr        r4,r4,#0x1
LAB_08002f14:
    add        r0,r0,r4
    ldrb       r1,[r5,#0xf]
    tst        r1,r1
    beq        LAB_08002f20
    add        r6,#0x1
    lsr        r6,r6,#0x1
LAB_08002f20:
    add        r0,r0,r6
    ldrb       r1,[r5,#0x14]
    tst        r1,r1
    beq        LAB_08002f2c
    add        r7,#0x1
    lsr        r7,r7,#0x1
LAB_08002f2c:
    add        r0,r0,r7
    mov        r5,r8
    mov        pc,lr
dmgEffectNone:
    .byte 0, 1, 1, 1, 1
dmgEffectElec:
    .byte 0, 1, 1, 0, 1
dmgEffectFire:
    .byte 0, 1, 1, 1, 0
dmgEffectAqua:
    .byte 0, 1, 0, 1, 1
dmgEffectWood:
    .byte 0, 0, 1, 1, 1

    .align 2, 0

PTR_dmgEffectNone_08002f4c: .word dmgEffectNone


_ts Field_AddHp
    ldrh       r1,[r5,#0x20]
    tst        r1,r1
    beq        LAB_08002f62
    ldrh       r2,[r5,#0x22]
    add        r1,r1,r0
    cmp        r1,r2
    bmi        LAB_08002f60
    add        r1,r2,#0x0
LAB_08002f60:
    strh       r1,[r5,#0x20]
LAB_08002f62:
    mov        pc,lr


_ts Field_SubtractHP
    ldrh       r1,[r5,#0x20]
    sub        r1,r1,r0
    bpl        LAB_08002f6c
    mov        r1,#0x0
LAB_08002f6c:
    strh       r1,[r5,#0x20]
    mov        pc,lr


_ts Field_InitializeAreaProperties
    ldr        r6,PTR_areaPropertiesLeftPlayer_08002fec
    mov        r7,r10
    ldr        r7,[r7,#0x8]
    ldrb       r0,[r7,#0xf]
    cmp        r0,#0x8
    blt        LAB_08002f88
    mov        r7,r10
    ldr        r7,[r7,#0xc]
    ldrb       r0,[r7,#0x1b]
    tst        r0,r0
    beq        LAB_08002f88
    ldr        r6,PTR_areaPropertiesRightPlayer_08002ff0
LAB_08002f88:
    ldr        r7,PTR_gAreaProperties_08002fe8
    mov        r0,#0x0
LAB_08002f8c:
    ldrb       r1,[r6,r0]
    strb       r1,[r7,r0]
    add        r0,#0x1
    cmp        r0,#0x28
    bne        LAB_08002f8c
    mov        pc,lr
areaPropertiesLeftPlayer:
    .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 1, 1, 1, 3, 3, 3, 0
    .byte 0, 1, 1, 1, 3, 3, 3, 0
    .byte 0, 1, 1, 1, 3, 3, 3, 0
    .byte 0, 0, 0, 0, 0, 0, 0, 0

areaPropertiesRightPlayer:
    .byte 0, 0, 0, 0, 0, 0, 0, 0
    .byte 0, 3, 3, 3, 1, 1, 1, 0
    .byte 0, 3, 3, 3, 1, 1, 1, 0
    .byte 0, 3, 3, 3, 1, 1, 1, 0
    .byte 0, 0, 0, 0, 0, 0, 0, 0

PTR_gAreaProperties_08002fe8:           .word gAreaProperties
PTR_areaPropertiesLeftPlayer_08002fec:  .word areaPropertiesLeftPlayer
PTR_areaPropertiesRightPlayer_08002ff0: .word areaPropertiesRightPlayer


@@ Marks the field object as being able to deal damage
_nt FieldObject_SetDamageFlag
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    orr        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr


@@ Marks the field object so that it can't deal damage
_nt FieldObject_ClearDamageFlag
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x2
    bic        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr


_nt FieldObject_SetHitFlag
    ldr        r1,[r0,#0xc]
    mov        r2,#0x20
    lsl        r2,r2,#0x4
    orr        r1,r2
    str        r1,[r0,#0xc]
    mov        pc,lr


_nt FieldObject_ClearHitFlag
    ldr        r1,[r0,#0xc]
    mov        r2,#0x20
    lsl        r2,r2,#0x4
    bic        r1,r2
    str        r1,[r0,#0xc]
    mov        pc,lr


_ts FieldObject_DisableIfHitFlagSet
    push       {lr}
    ldr        r1,[r0,#0xc]
    mov        r2,#0x20
    lsl        r2,r2,#0x4
    tst        r1,r2
    beq        LAB_08003034
    bic        r1,r2
    str        r1,[r0,#0xc]
    bl         FieldObject_ClearDamageFlag
LAB_08003034:
    pop        {pc}


_nt Field_SetPanelProperty
    ldr        r7,PTR_gAreaProperties_08003040
    lsl        r1,r1,#0x3
    add        r0,r0,r1
    strb       r2,[r7,r0]
    mov        pc,lr
PTR_gAreaProperties_08003040:   .word gAreaProperties


_ts Field_GetPanelProperty
    ldr        r7,PTR_gAreaProperties_08003050
    lsl        r1,r1,#0x3
    add        r0,r0,r1
    ldrb       r2,[r7,r0]
    mov        pc,lr

    .align 2, 0

PTR_gAreaProperties_08003050:   .word gAreaProperties


_ts FieldObject_UpdateCellPosition
    ldrh       r1,[r0,#0x2]
    strh       r1,[r0,#0x4]
    ldrh       r1,[r5,#0x18]
    strh       r1,[r0,#0x2]
    mov        pc,lr


@@ Clear the "new object" flag from the field object. The next time the damage
@@ function is run, the object's previous cell position will also be checked
@@ in case it moves.
_nt FieldObject_MarkAsChecked
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x4
    bic        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr


_nt FieldObject_SetPanelFlag
    ldr        r2,[r0,#0xc]
    orr        r2,r1
    str        r2,[r0,#0xc]
    mov        pc,lr


_nt FieldObject_ClearPanelFlag
    ldr        r2,[r0,#0xc]
    bic        r2,r1
    str        r2,[r0,#0xc]
    mov        pc,lr


_nt FieldObject_MarkAsBigSquare
    ldrb       r1,[r0,#0x0]
    mov        r2,#0x8
    orr        r1,r2
    strb       r1,[r0,#0x0]
    mov        pc,lr

    .align 2, 0
