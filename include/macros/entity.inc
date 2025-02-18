    .macro entity type, routine, x, y, z, family
    .byte ET_\type
    .byte \routine & 0xFF
    .short 0
    .word \x
    .word \y
    .word \z
    .word \family
    .endm

    .macro entity_bounds x, y, z, radius, height, id, mask
    .word \x
    .word \y
    .word \z
    .byte \radius
    .byte \height
    .short 0
    .word \id
    .word \mask
    .endm

    .macro FieldObject_Create panelFlagIndex, offset, offset_reg = 1
    mov        r0,#\panelFlagIndex
.if \offset_reg == 3
    mov        r3,#\offset
    add        r1,r5,r3
.else
    mov        r1,#\offset
    add        r1,r1,r5
.endif
    bl         Field_CreateEntity
    .endm

    .macro FieldObject_CreateInitMoving offset, inherit_element=0
    bl         FieldObject_Alloc
    str        r0,[r5,#\offset]
    mov        r1,#0x4
    lsl        r1,r1,#0x8 @ PF_Teleporting
    str        r1,[r0,#0xC] @ FieldObject_panelFlags
.if \inherit_element
    ldrb       r1,[r5,#0x1A] @ Entity_element
.else
    mov        r1,#0x0
.endif
    strb       r1,[r0,#0x6] @ FieldObject_element
    mov        r1,#0x0
    strh       r1,[r0,#0x8] @ FieldObject_damage
    bl         FieldObject_Disable
    .endm

    .macro FieldObject_SetAttributeGroup attributeGroupIndex, offset
    mov        r0,#\attributeGroupIndex
    ldr        r1,[r5,#\offset]
    bl         Field_SetPanelFlagsOnEntity
    .endm

    .macro FieldObject_GetDamage attributeGroupIndex, offset
    mov        r0,#\attributeGroupIndex
    ldr        r1,[r5,#\offset]
    bl         Field_GetDamageOnEntity
    .endm

    .macro strike_attribute attribute, effect_target=0, effect_type=0xFF
    .byte \effect_type
    .byte 0x00
    .byte \attribute & 0xFF
    .byte \effect_target
    .endm
