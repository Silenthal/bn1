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

    .macro FieldObject_Create panelFlagIndex, offset
    mov        r0,#\panelFlagIndex
    mov        r1,#\offset
    add        r1,r1,r5
    bl         Field_CreateEntity
    .endm
