#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


@@ Converts a vector (dx, dy) to an angle.
@@ Angles start at 0 pointing up, and increment clockwise.
@@ In:
@@ r0: int dy: The Y coordinate of the vector.
@@ r1: int dx: The X coordinate of the vector.
@@ Out:
@@ r0: byte angle: The arctan of dy/dx.
_ts VectorToAngle
    push       {lr}
    mov        r2,r10
    push       {r2}
    add        r2,r1,#0x0
    neg        r1,r0
    neg        r0,r2
    mov        r7,#0x0
    tst        r0,r0
    bpl        LAB_08000cb2
    add        r7,#0x2
    neg        r0,r0
LAB_08000cb2:
    tst        r1,r1
    bpl        LAB_08000cba
    add        r7,#0x1
    neg        r1,r1
LAB_08000cba:
    sub        r2,r7,#0x1
    cmp        r2,#0x1
    bhi        LAB_08000cc6
    add        r2,r0,#0x0
    add        r0,r1,#0x0
    add        r1,r2,#0x0
LAB_08000cc6:
    asr        r1,r1,#0x10
    beq        LAB_08000d0c
    bl         Divide
    lsr        r0,r0,#0x8
    mov        r10,r0
    mov        r0,#0x0
    mov        r8,r0
    mov        r0,#0x40
    mov        r9,r0
LAB_08000cda:
    mov        r2,r8
    add        r2,r9
    lsr        r2,r2,#0x1
    bcs        LAB_08000cf6
    lsl        r2,r2,#0x1
    ldr        r3,PTR_SHORT_ARRAY_08000d10
    ldrsh      r0,[r3,r2]
    lsr        r2,r2,#0x1
    cmp        r0,r10
    bcs        LAB_08000cf2
    mov        r8,r2
    b          LAB_08000cda
LAB_08000cf2:
    mov        r9,r2
    b          LAB_08000cda
LAB_08000cf6:
    mov        r0,r8
LAB_08000cf8:
    ldr        r1,PTR_DAT_08000d14
    ldrb       r2,[r1,r7]
    add        r0,r0,r2
    ldr        r1,DAT_08000d18
    sub        r0,r1,r0
    mov        r1,#0xff
    and        r0,r1
    pop        {r2}
    mov        r10,r2
    pop        {pc}
LAB_08000d0c:
    mov        r0,#0x40
    b          LAB_08000cf8

PTR_SHORT_ARRAY_08000d10:   .word tanTable
PTR_DAT_08000d14:           .word DAT_08000d1a
DAT_08000d18:               .short 0x100
DAT_08000d1a:               .byte 0x0, 0x40, 0xC0, 0x80


@@ Calculates the angle formed by a line between the actor and the player.
@@ In:
@@ r0: int angleOffset - Offset to add to the angle after the calculation.
@@ r5: Actor actor - The actor to check.
@@ Out:
@@ r0: int angle - The angle.
_ts ActorFacingPlayerAngle
    push       {r5,lr}
    push       {r0}
    ldr        r0,[r5,#0x2c]
    ldr        r1,[r5,#0x28]
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    ldr        r2,[r7,#0x28]
    ldr        r3,[r7,#0x24]
    sub        r0,r2,r0
    sub        r1,r3,r1
    bl         VectorToAngle
    pop        {r1}
    sub        r0,r0,r1
    lsl        r0,r0,#0x18
    asr        r0,r0,#0x18
    pop        {r5,pc}


@@ Converts an angle to a vector (dx, dy).
@@ In:
@@ r0: int angle: The angle to convert.
@@ r1: int unit: The scale factor to apply to the conversion.
@@ Out:
@@ r0: int dx: The X coordinate of the vector.
@@ r1: int dy: The Y coordinate of the vector.
_ts AngleToVector
    lsl        r0,r0,#0x1
    ldr        r2,PTR_sinTable_08000d5c
    ldrsh      r3,[r2,r0]
    ldr        r2,PTR_cosTable_08000d60
    ldrsh      r2,[r2,r0]
    neg        r2,r2
    mul        r3,r1
    asr        r0,r3,#0x8
    mul        r2,r1
    asr        r1,r2,#0x8
    mov        pc,lr

    .align 2, 0

PTR_sinTable_08000d5c: .word sinTable
PTR_cosTable_08000d60: .word cosTable


@@ Updates an entity's animation frame index.
@@ In:
@@ r5: void* entity - The calling entity.
_nt UpdateSpriteFrameIndex
    push       {lr}
    ldrb       r0,[r5,#0x14]
    ldrb       r1,[r5,#0x15]
    cmp        r0,r1
    beq        LAB_08000d78
    strb       r0,[r5,#0x15]
    bl         SpritePtr_SetFrameIndex
    bl         SpritePtr_InitFrames
LAB_08000d78:
    bl         SpritePtr_ProcessFrameDelay
    pop        {pc}


@@ Checks if two square bounding boxes intersect.
@@ In:
@@ r0: int x1 - The X coordinate of the first bounding box.
@@ r1: int y1 - The y coordinate of the first bounding box.
@@ r2: int x2 - The X coordinate of the second bounding box.
@@ r3: int y2 - The y coordinate of the second bounding box.
@@ r4: int radius - Half of the side length of a bounding box.
@@ Out:
@@ r0: bool isIntersect - True if the two bounding boxes intersect.
_nt IsCollision_Square
    sub        r0,r0,r2
    add        r0,r0,r4
    lsl        r2,r4,#0x1
    cmp        r0,r2
    bcs        LAB_08000d94
    sub        r1,r1,r3
    add        r1,r1,r4
    cmp        r1,r2
    bcs        LAB_08000d94
    mov        r0,#0x1
    mov        pc,lr
LAB_08000d94:
    mov        r0,#0x0
    mov        pc,lr


@@ Checks if two circular bounding boxes intersect.
@@ In:
@@ r0: int x1 - The X coordinate of the first bounding circle.
@@ r1: int y1 - The y coordinate of the first bounding circle.
@@ r2: int x2 - The X coordinate of the second bounding circle.
@@ r3: int y2 - The y coordinate of the second bounding circle.
@@ r4: int radius - The radius of the two circles.
@@ Out:
@@ r0: bool isIntersect - True if the two circles intersect.
_nt IsCollision_Circle
    sub        r0,r0,r2
    sub        r1,r1,r3
    add        r2,r4,#0x0
    mul        r4,r2
    add        r2,r0,#0x0
    mul        r0,r2
    add        r2,r1,#0x0
    mul        r1,r2
    add        r0,r0,r1
    cmp        r4,r0
    bmi        LAB_08000db2
    mov        r0,#0x1
    mov        pc,lr
LAB_08000db2:
    mov        r0,#0x0
    mov        pc,lr


@@ Checks if an actor is colliding with the player.
@@ In:
@@ r5: Actor actor - The actor.
@@ r4: int minDistance - The minimum distance between the player and actor.
@@ Out:
@@ r0: bool isIntersect - True if the actor is closer than the minimum distance.
_nt IsCollision_Player
    push       {lr}
    ldr        r0,[r5,#0x28]
    asr        r0,r0,#0xc
    ldr        r1,[r5,#0x2c]
    asr        r1,r1,#0xc
    LoadMain world, r7, r7
    ldr        r7,[r7,#0x28]
    ldr        r2,[r7,#0x24]
    asr        r2,r2,#0xc
    ldr        r3,[r7,#0x28]
    asr        r3,r3,#0xc
    bl         IsCollision_Circle
    pop        {pc}


@@ Calculates the trajectory of a given object.
@@ In:
@@ r0: PositionXYZ pos - The position of the object.
@@ r1: int dx - The X position of the target.
@@ r2: int dy - The Y position of the target.
@@ r3: int dz - The Z position of the target.
@@ r4: int v - The initial velocity.
@@ r6: int a - The gravity constant.
@@ Out:
@@ r0: int vz - The initial drop speed.
@@ r1: int time - The ammount of frames to reach the target.
_nt Field_CalculateTrajectoryZ
    push       {r5,lr}
    tst        r4,r4
    bne        LAB_08000e02
LAB_08000dda:
    ldr        r0,[r0,#0x8]
    sub        r0,r3,r0
    bmi        LAB_08000de6
    add        r0,r4,#0x0
    mov        r1,#0x0
    pop        {r5,pc}
LAB_08000de6:
    lsr        r1,r6,#0x8
    bl         SWI_Div
    bl         SWI_Sqrt
    mov        r2,#0x0
    mov        r1,#0xff
    tst        r0,r1
    beq        LAB_08000dfa
    mov        r2,#0x1
LAB_08000dfa:
    lsr        r0,r0,#0x8
    add        r1,r0,r2
    mov        r0,#0x0
    pop        {r5,pc}
LAB_08000e02:
    ldmia      r0!,{r5,r7}
    push       {r0,r3}
    sub        r1,r1,r5
    lsr        r1,r1,#0x8
    add        r5,r1,#0x0
    mul        r1,r5
    sub        r2,r2,r7
    lsr        r2,r2,#0x8
    add        r5,r2,#0x0
    mul        r2,r5
    add        r0,r1,r2
    bl         SWI_Sqrt
    lsl        r0,r0,#0x8
    push       {r4}
    add        r1,r4,#0x0
    bl         SWI_Div
    pop        {r4}
    lsr        r4,r4,#0x1
    cmp        r1,r4
    bmi        LAB_08000e30
    add        r0,#0x1
LAB_08000e30:
    add        r1,r0,#0x0
    pop        {r0,r3}
    tst        r1,r1
    beq        LAB_08000dda
    ldr        r0,[r0,#0x0]
    sub        r0,r3,r0
    push       {r1}
    bl         SWI_Div
    pop        {r1}
    neg        r2,r6
    mul        r2,r1
    lsr        r2,r2,#0x1
    add        r0,r0,r2
    pop        {r5,pc}


@@ Calculates the trajectory of a given object.
@@ In:
@@ r0: PositionXYZ pos - The position of the object.
@@ r1: int dx - The X position of the target.
@@ r2: int dy - The Y position of the target.
@@ r3: int v - The initial velocity.
@@ r4: int a - The gravity constant.
@@ Out:
@@ r0: int time - The ammount of frames to reach the target.
@@ r1: int vx - The velocity in the X direction.
@@ r2: int vy - The velocity in the Y direction.
_nt Field_CalculateTrajectoryXY
    push       {lr}
    ldr        r7,[r0,#0x0]
    sub        r1,r1,r7
    ldr        r7,[r0,#0x4]
    sub        r2,r2,r7
    push       {r1,r2}
    lsl        r0,r3,#0x1
    neg        r1,r4
    bl         SWI_Div
    lsr        r3,r3,#0x1
    cmp        r1,r3
    bmi        LAB_08000e6a
    add        r0,#0x1
LAB_08000e6a:
    pop        {r1,r2}
    push       {r0,r1}
    add        r1,r0,#0x0
    add        r0,r2,#0x0
    bl         SWI_Div
    add        r2,r0,#0x0
    pop        {r0,r1}
    push       {r0,r2}
    add        r2,r1,#0x0
    add        r1,r0,#0x0
    add        r0,r2,#0x0
    bl         SWI_Div
    add        r1,r0,#0x0
    pop        {r0,r2}
    pop        {pc}


@@ Checks if an entity's field position is valid.
@@ In:
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: bool isValid - True if the entity's X position is between 1 and 6
@@ inclusive, and the Y position is between 1 and 3 inclusive.
_nt Field_IsEntityCellPositionValid
    push       {lr}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    bl         Field_IsCellPositionValid
    pop        {pc}


@@ Checks if a given field position is valid.
@@ In:
@@ r0: byte x - The X position.
@@ r5: byte y - The Y position.
@@ Out:
@@ r0: bool isValid - True if the X position is between 1 and 6 inclusive, and
@@ the Y position is between 1 and 3 inclusive.
_nt Field_IsCellPositionValid
    sub        r0,#0x1
    cmp        r0,#0x6
    bcs        LAB_08000ea8
    sub        r1,#0x1
    cmp        r1,#0x3
    bcs        LAB_08000ea8
    mov        r0,#0x1
    mov        pc,lr
LAB_08000ea8:
    mov        r0,#0x0
    mov        pc,lr


@@ Searches for all panels that fill the specified criteria.
@@ In:
@@ r0: byte* panelList - A list that holds found panels by index.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ Out:
@@ r1: int found - The amount of panels found.
_nt Field_Search
    push       {lr}
    add        r7,r0,#0x0
    add        r4,r1,#0x0
    add        r6,r2,#0x0
    mov        r1,#0x1
    mov        r2,#0x0
LAB_08000eb8:
    mov        r0,#0x1
LAB_08000eba:
    push       {r0,r1,r2,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r4,r6,r7}
    tst        r3,r6
    bne        LAB_08000ed8
    and        r3,r4
    cmp        r3,r4
    bne        LAB_08000ed8
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,#0x0]
    add        r7,#0x1
    add        r2,#0x1
LAB_08000ed8:
    add        r0,#0x1
    cmp        r0,#0x7
    bne        LAB_08000eba
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_08000eb8
    add        r1,r2,#0x0
    pop        {pc}


@@ Searches for all panels that fill the specified criteria.
@@ In:
@@ r0: byte* panelList - A list that holds found panels by index.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ r3: int owner - The owner flag. Has no effect.
@@ Out:
@@ r1: int found - The amount of panels found.
_nt Field_SearchWithOwner
    push       {r5,lr}
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r3,r4
    add        r7,r0,#0x0
    ldr        r6,PTR_listStartX_08000f40
    lsl        r3,r3,#0x1
    add        r6,r6,r3
    ldrb       r0,[r6,#0x0]
    mov        r4,#0x1
    ldrsb      r4,[r6,r4]
    add        r3,r1,#0x0
    mov        r1,#0x3
    mov        r6,#0x0
LAB_08000f06:
    push       {r0}
LAB_08000f08:
    push       {r0,r1,r2,r3,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r5,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r6,r7}
    tst        r2,r5
    bne        LAB_08000f28
    and        r5,r3
    cmp        r5,r3
    bne        LAB_08000f28
    push       {r3}
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,r6]
    add        r6,#0x1
    pop        {r3}
LAB_08000f28:
    add        r0,r0,r4
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08000f08
    pop        {r0}
    sub        r1,#0x1
    bne        LAB_08000f06
    add        r1,r6,#0x0
    pop        {r5,pc}

    .align 2, 0

PTR_listStartX_08000f40: .word listStartX
listStartX:
    .byte 1, 1
    .byte 1, 1


@@ Searches for all panels that fill the specified criteria, excluding the
@@ leftmost column.
@@ In:
@@ r0: byte* panelList - A list that holds found panels by index.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ r3: int owner - The owner flag. Has no effect.
@@ Out:
@@ r1: int found - The amount of panels found.
_ts Field_SearchExcludeFirstCol
    push       {r5,lr}
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r3,r4
    add        r7,r0,#0x0
    ldr        r6,PTR_BYTE_ARRAY_ARRAY_08000fa0
    lsl        r3,r3,#0x1
    add        r6,r6,r3
    ldrb       r0,[r6,#0x0]
    mov        r4,#0x1
    ldrsb      r4,[r6,r4]
    add        r3,r1,#0x0
    mov        r1,#0x3
    mov        r6,#0x0
LAB_08000f66:
    push       {r0}
LAB_08000f68:
    push       {r0,r1,r2,r3,r4,r6,r7}
    bl         Field_GetPanelFlags
    add        r5,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r6,r7}
    tst        r2,r5
    bne        LAB_08000f88
    and        r5,r3
    cmp        r5,r3
    bne        LAB_08000f88
    push       {r3}
    lsl        r3,r1,#0x3
    add        r3,r3,r0
    strb       r3,[r7,r6]
    add        r6,#0x1
    pop        {r3}
LAB_08000f88:
    add        r0,r0,r4
    push       {r0}
    sub        r0,#0x2
    cmp        r0,#0x4
    pop        {r0}
    bcc        LAB_08000f68
    pop        {r0}
    sub        r1,#0x1
    bne        LAB_08000f66
    add        r1,r6,#0x0
    pop        {r5,pc}

    .align 2, 0

PTR_BYTE_ARRAY_ARRAY_08000fa0:  .word BYTE_ARRAY_ARRAY_08000fa4
BYTE_ARRAY_ARRAY_08000fa4:
    .byte 2, 1
    .byte 2, 1


@@ Finds the first column on the opponent's side of the field that has a
@@ walkable panel.
@@ In:
@@ r0: int owner - The owner flag.
@@ Out:
@@ r1: int column - The index of the column found. 
_ts Field_GetFirstWalkableOpponentColumnFront
    push       {lr}
    lsl        r2,r0,#0x1
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r0,r4
    ldr        r7,PTR_listOffsetX_1004_08000ff8
    ldrsb      r6,[r7,r0]
    ldr        r7,PTR_listStartX_1006_08000ffc
    ldrb       r0,[r7,r0]
LAB_08000fbc:
    mov        r1,#0x1
LAB_08000fbe:
    push       {r0,r1,r2,r6}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r6}
    mov        r4,#0x1
    tst        r3,r4
    beq        LAB_08000fda
    mov        r4,#0x2
    and        r3,r4
    ldr        r7,PTR_listTerritoryFlag_08000ff4
    ldrh       r4,[r7,r2]
    cmp        r3,r4
    bne        LAB_08000ff2
LAB_08000fda:
    add        r1,#0x1
    push       {r1}
    sub        r1,#0x1
    cmp        r1,#0x3
    pop        {r1}
    bcc        LAB_08000fbe
    add        r0,r0,r6
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08000fbc
LAB_08000ff2:
    pop        {pc}

PTR_listTerritoryFlag_08000ff4: .word listTerritoryFlag
PTR_listOffsetX_1004_08000ff8:  .word listOffsetX_1004
PTR_listStartX_1006_08000ffc:   .word listStartX_1006
listTerritoryFlag:
    .short 0
    .short 2
listOffsetX_1004:
    .byte 1, -1
listStartX_1006:
    .byte 1, 6


@@ Searches forward from the user's position to find the first panel that fits
@@ the specified criteria.
@@ In:
@@ r0: int owner - The owner flag.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ Out:
@@ r0: int x - The X index of the found panel. Returns 0 if no panel is found.
@@ r1: int y - The Y index of the found panel.
_ts Field_GetFirstPanelForward
    push       {r5,lr}
    LoadMain battle, r3, r3
    ldrb       r3,[r3,#0x1a]
    eor        r0,r3
    ldr        r7,PTR_listOffsetX_105C_08001054
    ldrsb      r6,[r7,r0]
    ldr        r7,PTR_listStartX_105E_08001058
    ldrb       r0,[r7,r0]
    add        r4,r1,#0x0
    add        r5,r2,#0x0
    lsl        r2,r0,#0x1
LAB_08001020:
    mov        r1,#0x1
LAB_08001022:
    push       {r0,r1,r2,r4,r6}
    bl         Field_GetPanelFlags
    add        r3,r0,#0x0
    pop        {r0,r1,r2,r4,r6}
    tst        r3,r5
    bne        LAB_08001036
    and        r3,r4
    cmp        r3,r4
    beq        LAB_08001050
LAB_08001036:
    add        r1,#0x1
    push       {r1}
    sub        r1,#0x1
    cmp        r1,#0x3
    pop        {r1}
    bcc        LAB_08001022
    add        r0,r0,r6
    push       {r0}
    sub        r0,#0x1
    cmp        r0,#0x6
    pop        {r0}
    bcc        LAB_08001020
    mov        r0,#0x0
LAB_08001050:
    pop        {r5,pc}

    .align 2, 0

PTR_listOffsetX_105C_08001054:  .word listOffsetX_105C
PTR_listStartX_105E_08001058:   .word listStartX_105E
listOffsetX_105C:
    .byte 1, -1
listStartX_105E:
    .byte 1, 6


@@ Converts a cell index into coordinates.
@@ In:
@@ r0: int cellIndex - The cell index.
@@ Out:
@@ r0: int x - The X index.
@@ r1: int y - The Y index.
_ts Field_IndexToCellXY
    lsr        r1,r0,#0x3
    mov        r2,#0x7
    and        r0,r2
    mov        pc,lr


@@ Creates a FieldObject with a standard set of panel flags.
@@ In:
@@ r0: PanelFlagIndex pfi: Index indicating which set of panel flags to set.
@@ r1: FieldObject** fieldObjectPtr - Pointer which will hold the created
@@ FieldObject.
@@ r5: void* entity - The entity to base the FieldObject on.
_ts Field_CreateEntity
    push       {lr}
    push       {r0,r1}
    bl         FieldObject_Alloc
    push       {r0}
    bl         FieldObject_GetIdFlag
    pop        {r7}
    add        r2,r0,#0x0
    pop        {r0,r1}
    str        r7,[r1,#0x0]
    str        r2,[r7,#0x10]
    mov        r2,#0x0
    str        r2,[r7,#0x14]
    ldrb       r1,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    strb       r1,[r7,#0x2]
    strb       r1,[r7,#0x4]
    strb       r2,[r7,#0x3]
    strb       r2,[r7,#0x5]
    ldrb       r1,[r5,#0x1a]
    strb       r1,[r7,#0x6]
    push       {r7}
    bl         Field_GetPanelFlagGroup
    pop        {r7}
    str        r1,[r7,#0xc]
    ldrh       r1,[r5,#0x24]
    strh       r1,[r7,#0x8]
    pop        {pc}


@@ Gets all damage on an entity based on the given panel flag group.
@@ In:
@@ r0: PanelFlagIndex pfi: Index indicating the attacker panel flag group.
@@ r1: FieldObject* obj: The field object to apply damage to.
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: PanelFlag attackerPanelFlags - The panel flags of the attacker.
@@ r1: int attackerIdFlag - The ID flag of the attacker.
@@ r2: int damageNone - The total untyped damage.
@@ r3: int damageElec - The total electric damage.
@@ r4: int damageFire - The total fire damage.
@@ r6: int damageWatr - The total water damage.
@@ r7: int damageWood - The total wood damage.
_ts Field_GetDamageOnEntity
    push       {lr}
    push       {r1}
    bl         Field_GetPanelFlagGroup
    pop        {r6}
    ldrb       r0,[r5,#0x18]
    ldrb       r2,[r5,#0x19]
    lsl        r2,r2,#0x8
    orr        r0,r2
    ldrb       r2,[r5,#0x1a]
    ldr        r3,[r6,#0x14]
    ldr        r4,[r6,#0x10]
    push       {r6}
    bl         FieldObject_CalcDamage
    mov        r8,r6
    pop        {r6}
    str        r1,[r6,#0x14]
    mov        r6,r8
    pop        {pc}


@@ Assigns a set of panel flags to a given field object.
@@ In:
@@ r0: PanelFlagIndex pfi: Index indicating the panel flag group.
@@ r1: FieldObject* obj: The field object to apply the panel flags to.
@@ r5: void* entity - The calling entity.
_ts Field_SetPanelFlagsOnEntity
    push       {r5,lr}
    push       {r1}
    bl         Field_GetPanelFlagGroup
    pop        {r7}
    str        r1,[r7,#0xc]
    pop        {r5,pc}


@@ Creates a simple attack.
@@ In:
@@ r0: byte element - The element of the attack.
@@ r1: int x - The X position to place the attack.
@@ r2: int y - The Y position to place the attack.
@@ r3: int z - The Z position to place the attack.
@@ r4: int family - The family detail for the attack.
@@ r5: void* entity - The calling entity.
@@ r6: ushort damage - The damage the attack does.
@@ r7: short delay - The amount of frames to wait before the attack takes
@@ effect.
_nt Field_CreateSharpStrikeAttack
    push       {lr}
    bl         Attack_SharpStrike_Create
    pop        {pc}


@@ Returns a set of panels.
@@ In:
@@ r0: PanelFlagIndex index - The index number.
@@ Out:
@@ r1: PanelFlag flags - The panel flags corresponding to the index number.
_nt Field_GetPanelFlagGroup
    ldrb       r1,[r5,#0x16]
    lsl        r1,r1,#0x2
    lsl        r0,r0,#0x3
    add        r0,r0,r1
    ldr        r7,PTR_PanelFlag_ARRAY_ARRAY_080010f0
    ldr        r1,[r7,r0]
    mov        pc,lr

PTR_PanelFlag_ARRAY_ARRAY_080010f0: .word PanelFlag_ARRAY_ARRAY_080010f4
PanelFlag_ARRAY_ARRAY_080010f4:
    @ 0 | 0x00
    .word 0x0
    .word 0x0
    @ 1 | 0x01
    .word PF_Player
    .word PF_Enemy
    @ 2 | 0x02
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
    @ 3 | 0x03
    .word PF_Ground | PF_Player
    .word PF_Ground | PF_Enemy
    @ 4 | 0x04
    .word PF_Player
    .word PF_Ground | PF_Enemy
    @ 5 | 0x05
    .word PF_EnemyOccupied | PF_Solid | PF_FieldBlock
    .word PF_PlayerOccupied | PF_Solid | PF_FieldBlock | 0x100
    @ 6 | 0x06
    .word 0x100
    .word 0x100
    @ 7 | 0x07
    .word PF_Enemy | PF_Solid | PF_FieldBlock
    .word PF_Player | PF_Solid | PF_FieldBlock
    @ 8 | 0x08
    .word PF_Ground | 0x100
    .word PF_Ground | 0x100
    @ 9 | 0x09
    .word PF_PlayerOccupied | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_ActorEnemy
    @ 10 | 0x0A
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | PF_FieldBlock | PF_Apple
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Apple
    @ 11 | 0x0B
    .word PF_Ground | PF_PlayerOccupied | PF_ActorPlayer
    .word PF_Ground | PF_EnemyOccupied | PF_ActorEnemy
    @ 12 | 0x0C
    .word PF_PlayerOccupied | PF_Armor | PF_ActorPlayer
    .word PF_EnemyOccupied | PF_Armor | PF_ActorEnemy
    @ 13 | 0x0D
    .word PF_PlayerOccupied
    .word PF_EnemyOccupied
    @ 14 | 0x0E
    .word PF_PlayerOccupied | PF_ActorPlayer | PF_Drain
    .word PF_EnemyOccupied | PF_ActorEnemy | PF_Drain
    @ 15 | 0x0F
    .word PF_Teleporting
    .word PF_Teleporting
    @ 16 | 0x10
    .word PF_Solid | PF_FieldBlock
    .word PF_Solid | PF_FieldBlock
    @ 17 | 0x11
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | PF_Break | PF_FieldBlock
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Player | PF_Enemy | PF_Solid | PF_Break | PF_FieldBlock
    @ 18 | 0x12
    .word PF_Player | PF_PlayerPush
    .word PF_Enemy | PF_EnemyPush
    @ 19 | 0x13
    .word PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_Solid
    @ 20 | 0x14
    .word PF_Ground | PF_Player | PF_PlayerPush
    .word PF_Ground | PF_Enemy | PF_EnemyPush
    @ 21 | 0x15
    .word PF_Player | PF_DieBombExplosion
    .word PF_Enemy | PF_DieBombExplosion
    @ 22 | 0x16
    .word PF_Player | PF_Freeze
    .word PF_Enemy | PF_Freeze
    @ 23 | 0x17
    .word PF_Ground | PF_Player | PF_Freeze
    .word PF_Ground | PF_Enemy | PF_Freeze
    @ 24 | 0x18
    .word PF_Player | PF_Break
    .word PF_Enemy | PF_Break
    @ 25 | 0x19
    .word PF_PlayerOccupied | PF_Player
    .word PF_EnemyOccupied | PF_Enemy
    @ 26 | 0x1A
    .word PF_Ground | PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
    @ 27 | 0x1B
    .word PF_PlayerOccupied | PF_Player
    .word PF_Ground | PF_EnemyOccupied | PF_Enemy
    @ 28 | 0x1C
    .word PF_PlayerOccupied | PF_Player | PF_Teleporting
    .word PF_EnemyOccupied | PF_Enemy | PF_Teleporting
    @ 29 | 0x1D
    .word PF_PlayerOccupied | PF_Player | PF_Armor
    .word PF_EnemyOccupied | PF_Enemy | PF_Armor
    @ 30 | 0x1E
    .word PF_Player | PF_FieldBlock
    .word PF_Enemy | PF_FieldBlock
    @ 31 | 0x1F
    .word PF_Ground | PF_Player | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_FieldBlock
    @ 32 | 0x20
    .word PF_Player | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_FieldBlock
    @ 33 | 0x21
    .word PF_PlayerOccupied | PF_FieldBlock
    .word PF_EnemyOccupied | PF_FieldBlock
    @ 34 | 0x22
    .word PF_Ground | PF_PlayerOccupied | PF_FieldBlock
    .word PF_Ground | PF_EnemyOccupied | PF_FieldBlock
    @ 35 | 0x23
    .word PF_Player | PF_PlayerPush | PF_FieldBlock
    .word PF_Enemy | PF_EnemyPush | PF_FieldBlock
    @ 36 | 0x24
    .word PF_Ground | PF_Player | PF_PlayerPush | PF_FieldBlock
    .word PF_Ground | PF_Enemy | PF_EnemyPush | PF_FieldBlock
    @ 37 | 0x25
    .word PF_PlayerOccupied | PF_Break | PF_Chaser
    .word PF_EnemyOccupied | PF_Break | PF_Chaser
    @ 38 | 0x26
    .word PF_EnemyOccupied | PF_Enemy
    .word PF_PlayerOccupied | PF_Player
    @ 39 | 0x27
    .word PF_Ground
    .word PF_Ground
    @ 40 | 0x28
    .word PF_Player | PF_Enemy
    .word PF_Player | PF_Enemy
    @ 41 | 0x29
    .word PF_Ground | PF_Player | PF_Enemy
    .word PF_Ground | PF_Player | PF_Enemy
    @ 42 | 0x2A
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Solid
    @ 43 | 0x2B
    .word PF_Player | PF_Enemy | PF_Trap
    .word PF_Player | PF_Enemy | PF_Trap
    @ 44 | 0x2C
    .word PF_Player | PF_Numb
    .word PF_Enemy | PF_Numb
    @ 45 | 0x2D
    .word PF_Ground | PF_Player | PF_Numb
    .word PF_Ground | PF_Enemy | PF_Numb
    @ 46 | 0x2E
    .word PF_Player | PF_Numb
    .word PF_Ground | PF_Enemy | PF_Numb
    @ 47 | 0x2F
    .word PF_PlayerOccupied | PF_Numb
    .word PF_EnemyOccupied | PF_Numb
    @ 48 | 0x30
    .word PF_PlayerOccupied | PF_Player | PF_Numb
    .word PF_EnemyOccupied | PF_Enemy | PF_Numb
    @ 49 | 0x31
    .word PF_EnemyOccupied | PF_Enemy | PF_Solid | PF_FieldBlock | PF_Drain
    .word PF_PlayerOccupied | PF_Player | PF_Solid | PF_FieldBlock | PF_Drain
    @ 50 | 0x32
    .word PF_Sealed
    .word PF_Sealed
    @ 51 | 0x33
    .word PF_Enemy | PF_Break | PF_FieldBlock
    .word PF_Player | PF_Break | PF_FieldBlock
    @ 52 | 0x34
    .word PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed
    .word PF_PlayerOccupied | PF_Teleporting | PF_Solid | PF_Sealed


@@ Gets the direction of an attack being used relative to the user.
@@ In:
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: int direction - Returns 1 if attack is moving to the right, and -1 if
@@ moving to the left.
_ts Field_GetAttackDirectionOffset_MP
    ldrb       r0,[r5,#0x16]


@@ Gets the direction of an attack being used relative to the user.
@@ In:
@@ r0: int ownerId - The ID of the calling entity.
@@ Out:
@@ r0: int direction - Returns 1 if attack is moving to the right, and -1 if
@@ moving to the left.
_nt Field_GetAttackDirectionOffset
    LoadMain battle, r1, r1
    ldrb       r1,[r1,#0x1a]
    eor        r0,r1
    lsl        r0,r0,#0x1
    sub        r0,#0x1
    neg        r0,r0
    mov        pc,lr


@@ Returns a random position centered on a target.
@@ In:
@@ r0: int rangeMask - The range of the returned coordinates.
@@ r1: int x - The X position in the center of the range.
@@ r3: int z - The Z position in the center of the range.
@@ Out:
@@ r1: int x - The X position plus or minus half the range.
@@ r3: int z - The Z position plus or minus half the range.
_nt Field_GetRandomXZPosOnTarget
    push       {lr}
    push       {r0,r1,r2,r3}
    bl         Rng_RandomUint
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    add        r4,r7,#0x0
    and        r4,r0
    lsr        r6,r0,#0x1
    sub        r4,r4,r6
    lsl        r4,r4,#0x10
    add        r1,r1,r4
    lsr        r7,r7,#0x10
    and        r7,r0
    lsr        r0,r0,#0x1
    sub        r7,r7,r0
    lsl        r7,r7,#0x10
    add        r3,r3,r7
    pop        {pc}


@@ Searches for the leftmost panel in each row that is in the player's
@@ territory and isn't in the opponent's row.
@@ In:
@@ r0: int depth - The amount of panels to search.
@@ r1: int excludeY - The row index to exclude when searching.
@@ r5: void* entity - The calling entity.
@@ r7: byte* panelList - A list that holds found panels by index.
@@ Out:
@@ r1: int found - The amount of panels found.
_ts Field_FindWalkablePlayerPanelsLeft
    push       {r7,lr}
    add        r3,r1,#0x0
    mov        r1,#0x1
    mov        r6,#0x0
    add        r4,r0,#0x0
LAB_080012de:
    push       {r1,r3,r4,r6,r7}
    add        r0,r1,#0x0
    bl         Field_GetFirstWalkablePlayerPanelLeft
    pop        {r1,r3,r4,r6,r7}
    tst        r0,r0
    beq        LAB_08001306
    ldrb       r2,[r5,#0x18]
    cmp        r2,r0
    bne        LAB_080012f8
    ldrb       r2,[r5,#0x19]
    cmp        r2,r1
    beq        LAB_08001306
LAB_080012f8:
    cmp        r1,r3
    beq        LAB_08001306
    lsl        r2,r1,#0x3
    add        r2,r2,r0
    strb       r2,[r7,#0x0]
    add        r7,#0x1
    add        r6,#0x1
LAB_08001306:
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_080012de
    add        r1,r6,#0x0
    pop        {r7,pc}


@@ Searches within a row for the first panel from the left that is walkable
@@ and in the player's territory.
@@ In:
@@ r0: int searchY - The row index to search.
@@ r4: int depth - The amount of panels to search.
@@ Out:
@@ r0: int x - The X index of either the found panel, the first enemy panel,
@@ or 0 if no matching panels could be found.
_ts Field_GetFirstWalkablePlayerPanelLeft
    push       {lr}
    add        r1,r0,#0x0
    mov        r0,#0x0
    mov        r6,#0x0
LAB_08001318:
    add        r0,#0x1
    cmp        r0,#0x7
    beq        LAB_0800133a
    push       {r0,r1,r4,r6}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1,r4,r6}
    mov        r7,#0x1
    tst        r2,r7
    beq        LAB_08001318
    mov        r7,#0x2
    tst        r2,r7
    beq        LAB_08001318
    add        r6,r0,#0x0
    sub        r4,#0x1
    bpl        LAB_08001318
LAB_0800133a:
    add        r0,r6,#0x0
    pop        {pc}


@@ Searches for the rightmost panel in each row that is in the player's
@@ territory and isn't in the opponent's row.
@@ In:
@@ r0: int depth - The amount of panels to search.
@@ r1: int excludeY - The row index to exclude when searching.
@@ r5: void* entity - The calling entity.
@@ r7: byte* panelList - A list that holds found panels by index.
@@ Out:
@@ r1: int found - The amount of panels found.
_nt Field_FindWalkablePlayerPanelsRight
    push       {r7,lr}
    add        r3,r1,#0x0
    mov        r1,#0x1
    mov        r6,#0x0
    add        r4,r0,#0x0
LAB_08001348:
    push       {r1,r3,r4,r6,r7}
    add        r0,r1,#0x0
    bl         Field_GetFirstWalkablePlayerPanelRight
    pop        {r1,r3,r4,r6,r7}
    tst        r0,r0
    beq        LAB_08001370
    ldrb       r2,[r5,#0x18]
    cmp        r2,r0
    bne        LAB_08001362
    ldrb       r2,[r5,#0x19]
    cmp        r2,r1
    beq        LAB_08001370
LAB_08001362:
    cmp        r1,r3
    beq        LAB_08001370
    lsl        r2,r1,#0x3
    add        r2,r2,r0
    strb       r2,[r7,#0x0]
    add        r7,#0x1
    add        r6,#0x1
LAB_08001370:
    add        r1,#0x1
    cmp        r1,#0x4
    bne        LAB_08001348
    add        r1,r6,#0x0
    pop        {r7,pc}


@@ Searches within a row for the first panel from the right that is walkable
@@ and in the player's territory.
@@ In:
@@ r0: int searchY - The row index to search.
@@ r4: int depth - The amount of panels to search.
@@ Out:
@@ r0: int x - The X index of either the found panel, the first enemy panel,
@@ or 0 if no matching panels could be found.
_nt Field_GetFirstWalkablePlayerPanelRight
    push       {lr}
    add        r1,r0,#0x0
    mov        r0,#0x7
    mov        r6,#0x0
LAB_08001382:
    sub        r0,#0x1
    tst        r0,r0
    beq        LAB_080013a4
    push       {r0,r1,r4,r6}
    bl         Field_GetPanelFlags
    add        r2,r0,#0x0
    pop        {r0,r1,r4,r6}
    mov        r7,#0x1
    tst        r2,r7
    beq        LAB_08001382
    mov        r7,#0x2
    tst        r2,r7
    beq        LAB_08001382
    add        r6,r0,#0x0
    sub        r4,#0x1
    bpl        LAB_08001382
LAB_080013a4:
    add        r0,r6,#0x0
    pop        {pc}


@@ Searches for the first panel in each row that matches the given conditions.
@@ In:
@@ r0: int ownerId - The owner ID of the caller.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ r3: byte* panelList - A list that holds found panels by index.
@@ Out:
@@ r0: int found - The amount of panels found.
_ts Field_SearchEdgeLeftToRight
    push       {lr}
    LoadMain battle, r4, r4
    ldrb       r4,[r4,#0x1a]
    eor        r0,r4
    mov        r4,#0x1
    mov        r7,#0x0
LAB_080013b6:
    push       {r0,r1,r2,r3,r4,r7}
    LoadMain battle, r6, r6
    ldrb       r6,[r6,#0x1a]
    eor        r0,r6
    bl         Field_GetColumnInRowLeftToRight
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r6
    beq        LAB_080013da
    push       {r0}
    lsl        r0,r4,#0x3
    orr        r0,r6
    strb       r0,[r3,#0x0]
    pop        {r0}
    add        r3,#0x1
    add        r7,#0x1
LAB_080013da:
    add        r4,#0x1
    cmp        r4,#0x4
    bne        LAB_080013b6
    add        r0,r7,#0x0
    pop        {pc}


@@ Searches row for the first panel that matches the given conditions.
@@ In:
@@ r0: int ownerId - The owner ID of the caller.
@@ r1: PanelFlag include - Include panels that match this flag.
@@ r2: PanelFlag exclude - Exclude panels that match this flag.
@@ r4: int searchY - The row index to search in.
@@ Out:
@@ r0: int x - The column index of the panel.
_ts Field_GetColumnInRowLeftToRight
    push       {r5,lr}
    LoadMain battle, r6, r6
    ldrb       r6,[r6,#0x1a]
    eor        r0,r6
    lsl        r5,r0,#0x1
    ldr        r7,PTR_listSearchDirection_0800141c
    ldrb       r0,[r7,r5]
    add        r5,#0x1
    ldrsb      r5,[r7,r5]
LAB_080013f8:
    push       {r0,r1,r2,r3,r4}
    add        r1,r4,#0x0
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3,r4}
    tst        r7,r2
    bne        LAB_0800140e
    and        r7,r1
    cmp        r7,r1
    beq        LAB_0800141a
LAB_0800140e:
    add        r0,r0,r5
    add        r6,r0,#0x0
    sub        r6,#0x1
    cmp        r6,#0x6
    bcc        LAB_080013f8
    mov        r0,#0x0
LAB_0800141a:
    pop        {r5,pc}

    .align 2, 0

PTR_listSearchDirection_0800141c:   .word listSearchDirection
listSearchDirection:
    .byte 6, -1
    .byte 1,  1


@@ Searches row from right to left for panels that matches the given
@@ conditions.
@@ In:
@@ r0: PanelFlag include - Include panels that match this flag.
@@ r1: PanelFlag exclude - Exclude panels that match this flag.
@@ r2: int searchY - The row index to search in.
@@ r3: byte* panelList - A list that holds found panels by index.
@@ Out:
@@ r1: int found - The amount of panels found.
_ts Field_SearchRowRightToLeft
    push       {lr}
    add        r6,r0,#0x0
    add        r7,r1,#0x0
    mov        r0,#0x6
    add        r1,r2,#0x0
    mov        r2,#0x0
LAB_08001430:
    push       {r0,r1,r2,r6,r7}
    bl         Field_GetPanelFlags
    add        r4,r0,#0x0
    pop        {r0,r1,r2,r6,r7}
    tst        r4,r7
    bne        LAB_0800144c
    and        r4,r6
    cmp        r4,r6
    bne        LAB_0800144c
    lsl        r4,r1,#0x3
    orr        r4,r0
    strb       r4,[r3,r2]
    add        r2,#0x1
LAB_0800144c:
    sub        r0,#0x1
    bne        LAB_08001430
    add        r1,r2,#0x0
    pop        {pc}


@@ Finds an empty panel in the opponent's territory.
@@ In:
@@ r0: int ownerId - The ID of the caller.
@@ Out:
@@ r0: int x - The X index of the found panel.
@@ r1: int y - The Y index of the found panel.
_ts Field_FindEmptyEnemyPanelForward
    push       {r5,lr}
    lsl        r3,r0,#0x2
    push       {r3}
    ldr        r7,PTR_PanelFlag_ARRAY_080014f0
    ldr        r1,[r7,r3]
    ldr        r7,PTR_PanelFlag_ARRAY_080014f4
    ldr        r2,[r7,r3]
    bl         Field_GetFirstPanelForward
    pop        {r5}
    tst        r0,r0
    bne        LAB_0800146e
    pop        {r5,pc}
LAB_0800146e:
    sub        sp,#0x4
    mov        r7,sp
    mov        r1,#0x3
    mov        r2,#0x0
    ldr        r6,PTR_PanelFlag_ARRAY_080014f8
    ldr        r4,[r6,r5]
    ldr        r6,PTR_PanelFlag_ARRAY_080014fc
    ldr        r3,[r6,r5]
LAB_0800147e:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    bne        LAB_0800149a
    and        r6,r4
    cmp        r6,r4
    bne        LAB_0800149a
    lsl        r6,r1,#0x3
    orr        r6,r0
    strb       r6,[r7,r2]
    add        r2,#0x1
LAB_0800149a:
    sub        r1,#0x1
    bne        LAB_0800147e
    tst        r2,r2
    bne        LAB_080014d6
    mov        r1,#0x3
    ldr        r6,PTR_PanelFlag_ARRAY_080014f0
    ldr        r4,[r6,r5]
    ldr        r6,PTR_PanelFlag_ARRAY_080014f4
    ldr        r3,[r6,r5]
LAB_080014ac:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    bne        LAB_080014c8
    and        r6,r4
    cmp        r6,r4
    bne        LAB_080014c8
    lsl        r6,r1,#0x3
    orr        r6,r0
    strb       r6,[r7,r2]
    add        r2,#0x1
LAB_080014c8:
    sub        r1,#0x1
    bne        LAB_080014ac
    tst        r2,r2
    bne        LAB_080014d6
    mov        r0,#0x0
    add        sp,#0x4
    pop        {r5,pc}
LAB_080014d6:
    push       {r2,r7}
    bl         Rng_RandomInt
    pop        {r2,r7}
    add        r1,r2,#0x0
    bl         SWI_DivMod
    ldrb       r0,[r7,r0]
    bl         Field_IndexToCellXY
    add        sp,#0x4
    pop        {r5,pc}

    .align 2, 0

PTR_PanelFlag_ARRAY_080014f0:   .word PanelFlag_ARRAY_08001500
PTR_PanelFlag_ARRAY_080014f4:   .word PanelFlag_ARRAY_08001508
PTR_PanelFlag_ARRAY_080014f8:   .word PanelFlag_ARRAY_08001510
PTR_PanelFlag_ARRAY_080014fc:   .word PanelFlag_ARRAY_08001518

PanelFlag_ARRAY_08001500:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Walkable
PanelFlag_ARRAY_08001508:
    .word 0
    .word PF_EnemyTerritory
PanelFlag_ARRAY_08001510:
    .word PF_Walkable | PF_EnemyTerritory
    .word PF_Walkable
PanelFlag_ARRAY_08001518:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_EnemyTerritory


@@ Cracks a panel, or breaks a panel if the panel is cracked.
@@ In:
@@ r0: int x - The column index of the panel.
@@ r1: int y - The row index of the panel.
@@ Out:
@@ r0: bool success - True if the panel was cracked or broken by this function.
_ts Field_CrackPanel
    push       {lr}
    push       {r0,r1}
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1}
    mov        r2,#0x1
    tst        r7,r2
    beq        LAB_08001566
    mov        r2,#0x4
    tst        r7,r2
    bne        LAB_0800154c
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x4
    orr        r2,r3
    bl         Field_SetPanelProperty
    mov        r0,#0x1
    pop        {pc}
LAB_0800154c:
    ldr        r2,PanelFlag_0800156c
    tst        r7,r2
    bne        LAB_08001562
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x1
    bic        r2,r3
    bl         Field_SetPanelProperty
LAB_08001562:
    mov        r0,#0x1
    pop        {pc}
LAB_08001566:
    mov        r0,#0x0
    pop        {pc}

    .align 2, 0

PanelFlag_0800156c:
    .word PF_PlayerOccupied | PF_EnemyOccupied | PF_Teleporting | PF_Solid | PF_Sealed


@@ Cracks all panels within the opponent's territory.
@@ In:
@@ r0: int ownerId - The ID of the caller.
_ts Field_CrackAllEnemyPanels
    push       {lr}
    ldr        r7,PTR_listPanelFilter_080015ac
    add        r7,r7,r0
    ldrb       r2,[r7,#0x0]
    ldrb       r3,[r7,#0x2]
    mov        r1,#0x2
LAB_0800157c:
    mov        r0,#0x5
LAB_0800157e:
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r7,r3
    bne        LAB_080015a2
    and        r7,r2
    cmp        r7,r2
    bne        LAB_080015a2
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_CrackPanel
    pop        {r0,r1,r2,r3}
LAB_080015a2:
    sub        r0,#0x1
    bpl        LAB_0800157e
    sub        r1,#0x1
    bpl        LAB_0800157c
    pop        {pc}

PTR_listPanelFilter_080015ac:
    .word listPanelFilter

listPanelFilter:
    @ include
    .byte PF_Walkable | PF_EnemyTerritory
    .byte PF_Walkable
    @ exclude
    .byte 0
    .byte PF_EnemyTerritory


@@ Cracks all panels.
_ts Field_CrackAllPanels
    push       {lr}
    mov        r2,#0x1
    mov        r3,#0x0
    mov        r1,#0x2
LAB_080015bc:
    mov        r0,#0x5
LAB_080015be:
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_GetPanelFlags
    add        r7,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r7,r3
    bne        LAB_080015e2
    and        r7,r2
    cmp        r7,r2
    bne        LAB_080015e2
    push       {r0,r1,r2,r3}
    add        r0,#0x1
    add        r1,#0x1
    bl         Field_CrackPanel
    pop        {r0,r1,r2,r3}
LAB_080015e2:
    sub        r0,#0x1
    bpl        LAB_080015be
    sub        r1,#0x1
    bpl        LAB_080015bc
    pop        {pc}


@@ Retrives an entity.
@@ In:
@@ r0: int entityTypeIndex - The type of entity to get.
@@ r1: int entityListIndex - The index of the entity.
@@ Out:
@@ r0: void* entity - A pointer to the entity.
_nt Field_GetEntityFromIndex
    ldr        r2,listEntitySize
    ldrb       r2,[r2,r0]
    mul        r2,r1
    ldr        r3,listEntityType
    lsl        r0,r0,#0x2
    ldr        r0,[r3,r0]
    add        r0,r0,r2
    mov        pc,lr

    .align 2, 0

    .word listEntityType
    .word listEntitySize
listEntityType:
    .word gEntityListPlayerLocation
    .word gEntityListActor
    .word gEntityListAttack
    .word gEntityListEffect
listEntitySize:
    .byte 0xb0
    .byte 0xc0
    .byte 0xb0
    .byte 0xb0


@@ Gets an entity's type and index.
@@ In:
@@ r0: void* entity - A pointer to the entity.
@@ Out:
@@ r0: int entityTypeIndex - The type of entity.
@@ r1: int entityListIndex - The index of the entity.
_ts Field_GetIndexFromEntity
    mov        r4,#0xc
    ldr        r2,ptrListEntityType
    ldr        r3,[r2,r4]
LAB_0800161e:
    cmp        r0,r3
    bpl        LAB_08001628
    sub        r4,#0x4
    ldr        r3,[r2,r4]
    bne        LAB_0800161e
LAB_08001628:
    lsr        r4,r4,#0x2
    sub        r0,r0,r3
    ldr        r2,ptrListEntitySize
    ldr        r1,[r2,r4]
    bl         SWI_Div
    add        r1,r0,#0x0
    ldr        r2,PTR_DAT_08001644
    ldrb       r0,[r2,r4]
    mov        pc,lr

    .align 2, 0

ptrListEntityType:  .word listEntityType
ptrListEntitySize:  .word listEntitySize
PTR_DAT_08001644:   .word listEntityTypeIndex
listEntityTypeIndex:
    .byte 0, 1, 2, 3


_nt Battle_SetBattleFlag
    mov        r1,#0x1
    lsl        r1,r0
    LoadMain battle, r7, r7
    ldr        r0,[r7,#0x68]
    orr        r0,r1
    str        r0,[r7,#0x68]
    mov        pc,lr


_nt Battle_GetBattleFlagCurrent
    mov        r1,#0x1
    lsl        r1,r0
    LoadMain battle, r7, r7
    ldr        r0,[r7,#0x68]
    ldr        r2,[r7,#0x6c]
    orr        r0,r2
    and        r0,r1
    mov        pc,lr


_nt Battle_GetBattleFlagMulti
    LoadMain battle, r7, r7
    ldr        r1,[r7,#0x68]
    ldr        r2,[r7,#0x6c]
    orr        r1,r2
    and        r0,r1
    mov        pc,lr


_nt Battle_GetBattleFlag
    mov        r1,#0x1
    lsl        r1,r0
    LoadMain battle, r7, r7
    ldr        r0,[r7,#0x6c]
    and        r0,r1
    mov        pc,lr


@@ Creates a strike effect on a panel based on the panel resident's armor.
@@ In:
@@ r0: QuickEffect effectId - The ID of the effect to do.
@@ r3: int z - The Z position of the effect.
@@ Out:
@@ r7: Effect* effect - A pointer to the created effect.
_nt Field_CreateStrikeEffect
    push       {r5,lr}
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r3}
    bl         Field_GetPanelFlags
    pop        {r3}
    ldr        r1,DAT_080016d0
    tst        r0,r1
    pop        {r0}
    bne        LAB_080016b0
    add        r4,r0,#0x0
    ldrb       r0,[r5,#0x1a]
    tst        r0,r0
    beq        LAB_080016b2
    mov        r4,#0x19
    add        r4,r4,r0
    b          LAB_080016b2
LAB_080016b0:
    mov        r4,#0x2
LAB_080016b2:
    mov        r7,#0x0
    tst        r4,r4
    beq        LAB_080016cc
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    mov        r0,#0xf
    push       {r4,r7}
    bl         Field_GetRandomXZPosOnTarget
    pop        {r4,r7}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
LAB_080016cc:
    pop        {r5,pc}

    .align 2, 0

DAT_080016d0:
    .word 0x40000


@@ Creates a buster effect on a panel based on the panel resident's armor.
@@ In:
@@ r0: QuickEffect effectId - The ID of the effect to do.
@@ r3: int z - The Z position of the effect.
@@ Out:
@@ r7: Effect* effect - A pointer to the created effect.
_nt Field_CreateBusterEffect
    push       {r5,lr}
    push       {r0}
    ldrb       r0,[r5,#0x18]
    ldrb       r1,[r5,#0x19]
    push       {r3}
    bl         Field_GetPanelFlags
    pop        {r3}
    ldr        r1,DAT_08001710
    tst        r0,r1
    pop        {r0}
    bne        LAB_080016f6
    mov        r7,#0x0
    tst        r0,r0
    beq        LAB_0800170c
    add        r4,r0,#0x0
    b          LAB_080016f8
LAB_080016f6:
    mov        r4,#0x2
LAB_080016f8:
    ldr        r1,[r5,#0x28]
    ldr        r2,[r5,#0x2c]
    mov        r0,#0xf
    push       {r4,r7}
    bl         Field_GetRandomXZPosOnTarget
    pop        {r4,r7}
    bl         Effect_QuickEffect_Create
    add        r7,r5,#0x0
LAB_0800170c:
    pop        {r5,pc}

    .align 2, 0

DAT_08001710:
    .word 0x40000


@@ Checks if an entity is being pushed.
@@ In:
@@ r0: PanelFlag attackerFlags - The flags of the attacker.
@@ r5: void* entity - The entity being pushed.
@@ Out:
@@ r0: int x - The column index of the panel being pushed to. Returns 0 if no
@@ push happens.
@@ r1: int y - The row index of the panel being pushed to.
_nt Field_CheckPush
    push       {r2,r7,lr}
    ldr        r7,PTR_INT_08001758
    mov        r1,#0x10
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_08001722
    add        r7,#0x4
LAB_08001722:
    mov        r1,#0x20
    lsl        r1,r1,#0x8
    tst        r0,r1
    beq        LAB_0800172c
    add        r7,#0x8
LAB_0800172c:
    ldr        r1,[r7,#0x0]
    LoadMain battle, r2, r2
    ldrb       r2,[r2,#0x1a]
    tst        r2,r2
    beq        LAB_0800173a
    neg        r1,r1
LAB_0800173a:
    push       {r1}
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r1
    sub        r0,#0x1
    cmp        r0,#0x6
    bcs        LAB_08001750
    pop        {r1}
    mov        r0,#0x4
    mul        r0,r1
    lsl        r0,r0,#0x10
    pop        {r2,r7,pc}
LAB_08001750:
    pop        {r0}
    mov        r0,#0x0
    mov        r1,#0x0
    pop        {r2,r7,pc}
PTR_INT_08001758:
    .word INT_0800175c
INT_0800175c:
    .word 0
    .word 1
    .word -1
    .word 0


@@ Repairs a panel.
@@ In:
@@ r0: int x - The column index of the panel being repaired.
@@ r1: int y - The row index of the panel being repaired.
_nt Field_RepairPanel
    push       {lr}
    push       {r0,r1}
    bl         Field_GetPanelProperty
    pop        {r0,r1}
    mov        r3,#0x1
    orr        r2,r3
    mov        r3,#0x4
    mvn        r3,r3
    and        r2,r3
    bl         Field_SetPanelProperty
    pop        {pc}


@@ Frees an entity's associated attack.
@@ In:
@@ r0: void* entity - The calling entity.
_nt Field_AttackFree
    push       {lr}
    ldr        r0,[r5,#0x5c]
    tst        r0,r0
    beq        LAB_0800179c
    push       {r5}
    add        r5,r0,#0x0
    bl         Attack_Free
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x5c]
LAB_0800179c:
    pop        {pc}


@@ Checks if the Interrupt chip has been used.
@@ In:
@@ r0: The owner ID to check.
@@ Out:
@@ Z flag: Set if Interrupt has been used on the given owner.
@@ r0: int flag - The battle flag.
_nt Field_CheckInterrupt
    add        r0,#0x1c
    mov        r1,#0x1
    lsl        r1,r0
    LoadMain battle, r7, r7
    ldr        r0,[r7,#0x68]
    tst        r0,r1
    mov        pc,lr


@@ Fetches an actor using the owner ID.
@@ In:
@@ r0: int ownerId - The ID of the actor to fetch.
@@ Out:
@@ r7: Actor* actor - The actor.
_nt Field_GetActorById
    lsl        r0,r0,#0x2
    add        r0,#0x40
    LoadMain battle, r7, r7
    ldr        r7,[r7,r0]
    mov        pc,lr


@@ Searches forward for the first panel with an opponent.
@@ In:
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: int x - The column index of the opponent panel. Returns 0 if no panel
@@ was found.
@@ r1: int y - The row index of the opponent panel.
_nt Field_GetFirstOpponentPanel
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_080017f8
    ldr        r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
LAB_080017ce:
    mov        r1,#0x3
    push       {r0,r1,r2,r3}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3}
    beq        LAB_080017f2
LAB_080017dc:
    push       {r0,r1,r2,r3}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r6,r3
    bne        LAB_080017f6
    sub        r1,#0x1
    bpl        LAB_080017dc
    add        r0,r0,r2
    b          LAB_080017ce
LAB_080017f2:
    mov        r0,#0x0
    ldrb       r1,[r5,#0x19]
LAB_080017f6:
    pop        {pc}
PTR_PanelFlag_ARRAY_080017f8:
    .word PanelFlag_ARRAY_080017fc
PanelFlag_ARRAY_080017fc:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


@@ Searches for the first panel in an entity's column that has an opponent.
@@ In:
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: int x - The column index of the opponent panel. Returns 0 if no panel
@@ was found.
@@ r1: int y - The row index of the opponent panel.
_nt Field_GetFirstOpponentPanelInSameColumn
    push       {lr}
    bl         Field_GetAttackDirectionOffset_MP
    neg        r2,r0
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0800183c
    ldr        r3,[r7,r3]
    ldrb       r0,[r5,#0x18]
    mov        r1,#0x3
    push       {r0,r1,r2,r3}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3}
    beq        LAB_08001836
LAB_08001824:
    push       {r0,r1,r2,r3}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3}
    tst        r6,r3
    bne        LAB_0800183a
    sub        r1,#0x1
    bpl        LAB_08001824
LAB_08001836:
    mov        r0,#0x0
    ldrb       r1,[r5,#0x19]
LAB_0800183a:
    pop        {pc}
PTR_PanelFlag_ARRAY_0800183c:
    .word PanelFlag_ARRAY_080017fc


@@ Searches forward for panels that have opponents.
@@ In:
@@ r0: byte* panelList - A list that holds found panels by index.
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r1: int found - The amount of panels found.
_nt Field_SearchOpponentPanels
    push       {lr}
    push       {r0}
    bl         Field_GetAttackDirectionOffset_MP
    add        r2,r0,#0x0
    pop        {r0}
    ldrb       r3,[r5,#0x16]
    lsl        r3,r3,#0x2
    ldr        r7,PTR_PanelFlag_ARRAY_0800188c
    ldr        r3,[r7,r3]
    add        r7,r0,#0x0
    mov        r4,#0x0
    ldrb       r0,[r5,#0x18]
    add        r0,r0,r2
LAB_0800185c:
    mov        r1,#0x3
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_IsCellPositionValid
    tst        r0,r0
    pop        {r0,r1,r2,r3,r4,r7}
    beq        LAB_08001888
LAB_0800186a:
    push       {r0,r1,r2,r3,r4,r7}
    bl         Field_GetPanelFlags
    add        r6,r0,#0x0
    pop        {r0,r1,r2,r3,r4,r7}
    tst        r6,r3
    beq        LAB_08001880
    lsl        r6,r1,#0x3
    add        r6,r6,r0
    strb       r6,[r7,r4]
    add        r4,#0x4
LAB_08001880:
    sub        r1,#0x1
    bpl        LAB_0800186a
    add        r0,r0,r2
    b          LAB_0800185c
LAB_08001888:
    add        r0,r4,#0x0
    pop        {pc}
PTR_PanelFlag_ARRAY_0800188c:
    .word PanelFlag_ARRAY_08001890
PanelFlag_ARRAY_08001890:
    .word PF_ActorEnemy
    .word PF_ActorPlayer


@@ Checks if an entity is visible onscreen.
@@ In:
@@ r0: int width - The width of the entity.
@@ r5: void* entity - The calling entity.
@@ Out:
@@ r0: bool isOnscreen - True if the entity is onscreen, false otherwise.
_nt Field_IsOnscreenX
    mov        r2,#0x2a
    ldrsh      r1,[r5,r2]
    add        r2,r1,r0
    add        r2,#0x78
    sub        r3,r1,r0
    add        r3,#0x78
    mov        r0,#0x1
    cmp        r2,#0xef
    bls        LAB_080018b0
    cmp        r3,#0xef
    bls        LAB_080018b0
    mov        r0,#0x0
LAB_080018b0:
    mov        pc,lr

    .align 2, 0

    .end
