#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020


_ts MapSetup_School_Library_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Library_F10_08025d64
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08025b9e
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_08025b9e:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Library_F10_08025ba4:
    .word MapSetup_School_Library_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Library_F13
    .word MapSetup_School_Library_F14
    .word MapSetup_School_Library_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Library_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F10_08025d68
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F10_08025bd0:
    .word EventHandler_School_Library_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Library_F13
    .word EventHandler_School_Library_F14
    .word EventHandler_School_Library_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Library_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025d6c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025d70
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts EventHandler_School_Library_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F10_0_08025d74
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F10_0_08025c28:
    .word EventHandler_School_Library_F10_0


_ts EventHandler_School_Library_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F13
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025d78
    bl         Entity_AllocList
    push       {r5}
    ldr        r7,PTR_DAT_08025d7c
    bl         Map_LoadNPCList
    pop        {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    mov        r0,#0xa7
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08025c66
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_08025c66:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Library_F13
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F13_0_08025d80
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F13_0_08025c7c:
    .word EventHandler_School_Library_F13_0
    .word EventHandler_School_Library_F13_1


_ts EventHandler_School_Library_F13_0
    push       {lr}
    push       {r5}
    mov        r0,#0xa7
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08025ca4
    push       {r5}
    mov        r1,#0x3
    ldr        r0,DAT_08025d84
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}
LAB_08025ca4:
    pop        {pc}


_nt EventHandler_School_Library_F13_1
    push       {lr}
    pop        {pc}


_nt MapSetup_School_Library_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025d88
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08025d8c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xb4
    bl         Flag_GetBase
    pop        {r5}
    bne        LAB_08025cde
    mov        r0,#0x0
    b          LAB_08025ce0
LAB_08025cde:
    mov        r0,#0x4
LAB_08025ce0:
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Library_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F14_0_08025d90
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F14_0_08025cf4:
    .word EventHandler_School_Library_F14_0
    .word EventHandler_School_Library_F14_1


_ts EventHandler_School_Library_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_08025d1a
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08025d94
    bl         Scene_Prepare
    pop        {r5}
    mov        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08025d1a:
    pop        {pc}


_ts EventHandler_School_Library_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025d98
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_DAT_08025d9c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Library_F15
    push       {lr}
    ldr        r0,PTR_EventHandler_School_Library_F15_0_08025da0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

EventHandler_School_Library_F15_0:
    .word FUN_08025d60


_ts FUN_08025d60
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Library_F10_08025d64:
    .word PTR_MapSetup_School_Library_F10_08025ba4
PTR_PTR_EventHandler_School_Library_F10_08025d68:
    .word PTR_EventHandler_School_Library_F10_08025bd0
PTR_EntityAllocParams_ARRAY_08025d6c:
    .word EntityAllocParams_08029BD0
PTR_PTR_DAT_08025d70:
    .word NPCList_08029418
PTR_PTR_EventHandler_School_Library_F10_0_08025d74:
    .word PTR_EventHandler_School_Library_F10_0_08025c28
PTR_EntityAllocParams_ARRAY_08025d78:
    .word EntityAllocParams_08029BD0
PTR_DAT_08025d7c:
    .word NPCList_08029420
PTR_PTR_EventHandler_School_Library_F13_0_08025d80:
    .word PTR_EventHandler_School_Library_F13_0_08025c7c
DAT_08025d84:
    .word 0x8087E35
PTR_EntityAllocParams_ARRAY_08025d88:
    .word EntityAllocParams_08029BD0
PTR_DAT_08025d8c:
    .word NPCList_08029420
PTR_PTR_EventHandler_School_Library_F14_0_08025d90:
    .word PTR_EventHandler_School_Library_F14_0_08025cf4
DAT_08025d94:
    .word 0x8087E35
PTR_EntityAllocParams_ARRAY_08025d98:
    .word EntityAllocParams_08029BD0
PTR_DAT_08025d9c:
    .word NPCList_08029420
PTR_EventHandler_School_Library_F15_0_08025da0:
    .word EventHandler_School_Library_F15_0


_ts MapSetup_School_Library_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Library_F20_08025f60
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08025dc2
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08025dda
LAB_08025dc2:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08025dd6
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_08025dda
LAB_08025dd6:
    bl         Sound_AreaSongChange
LAB_08025dda:
    pop        {pc}
PTR_MapSetup_School_Library_F20_08025ddc:
    .word MapSetup_School_Library_F20
    .word MapSetup_School_Library_F21
    .word MapSetup_School_Library_F22
    .word MapSetup_School_Library_F23
    .word MapSetup_School_Library_F24
    .word MapSetup_Default
    .word MapSetup_School_Library_F24
    .word MapSetup_School_Library_F24


_ts EventHandler_School_Library_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F20_08025f64
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F20_08025e08:
    .word EventHandler_School_Library_F20
    .word EventHandler_School_Library_F21
    .word EventHandler_School_Library_F22
    .word EventHandler_School_Library_F23
    .word EventHandler_School_Library_F24
    .word EventHandler_Default
    .word EventHandler_School_Library_F24
    .word EventHandler_School_Library_F24


_ts MapSetup_School_Library_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025f68
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025f6c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Library_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F20_0_08025f70
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Library_F20_0_08025e60:
    .word EventHandler_School_Library_F20_0


_ts EventHandler_School_Library_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F21
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025f74
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025f78
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Library_F21
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F21_0_08025f7c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Library_F21_0_08025ea0:
    .word EventHandler_School_Library_F21_0


_ts EventHandler_School_Library_F21_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F22
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025f80
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025f84
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Library_F22
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F22_0_08025f88
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Library_F22_0_08025ee0:
    .word EventHandler_School_Library_F22_0


_ts EventHandler_School_Library_F22_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F23
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025f8c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_08025f90
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Library_F23
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F23_0_08025f94
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Library_F23_0_08025f20:
    .word EventHandler_School_Library_F23_0


_ts EventHandler_School_Library_F23_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Library_F24
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08025f98
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Library_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F24_0_08025f9c
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F24_0_08025f58:
    .word EventHandler_School_Library_F24_0


_ts EventHandler_School_Library_F24_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Library_F20_08025f60:
    .word PTR_MapSetup_School_Library_F20_08025ddc
PTR_PTR_EventHandler_School_Library_F20_08025f64:
    .word PTR_EventHandler_School_Library_F20_08025e08
PTR_EntityAllocParams_ARRAY_08025f68:
    .word EntityAllocParams_08029BD0
PTR_PTR_DAT_08025f6c:
    .word NPCList_08029460
PTR_PTR_EventHandler_School_Library_F20_0_08025f70:
    .word PTR_EventHandler_School_Library_F20_0_08025e60
PTR_EntityAllocParams_ARRAY_08025f74:
    .word EntityAllocParams_08029BD0
PTR_PTR_DAT_08025f78:
    .word NPCList_08029460
PTR_PTR_EventHandler_School_Library_F21_0_08025f7c:
    .word PTR_EventHandler_School_Library_F21_0_08025ea0
PTR_EntityAllocParams_ARRAY_08025f80:
    .word EntityAllocParams_08029BD0
PTR_PTR_DAT_08025f84:
    .word NPCList_08029460
PTR_PTR_EventHandler_School_Library_F22_0_08025f88:
    .word PTR_EventHandler_School_Library_F22_0_08025ee0
PTR_EntityAllocParams_ARRAY_08025f8c:
    .word EntityAllocParams_08029BD0
PTR_PTR_DAT_08025f90:
    .word NPCList_080294C8
PTR_PTR_EventHandler_School_Library_F23_0_08025f94:
    .word PTR_EventHandler_School_Library_F23_0_08025f20
PTR_EntityAllocParams_ARRAY_08025f98:
    .word EntityAllocParams_08029BD0
PTR_PTR_EventHandler_School_Library_F24_0_08025f9c:
    .word PTR_EventHandler_School_Library_F24_0_08025f58


_ts MapSetup_School_Library_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Library_F30_08026034
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Library_F30_08025fb0:
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30
    .word MapSetup_School_Library_F30


_ts EventHandler_School_Library_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F30_08026038
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F30_08025fdc:
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30
    .word EventHandler_School_Library_F30


_ts MapSetup_School_Library_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_0802603c
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Library_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Library_F30_0_08026040
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Library_F30_0_0802602c:
    .word EventHandler_School_Library_F30_0


_ts EventHandler_School_Library_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Library_F30_08026034:
    .word PTR_MapSetup_School_Library_F30_08025fb0
PTR_PTR_EventHandler_School_Library_F30_08026038:
    .word PTR_EventHandler_School_Library_F30_08025fdc
PTR_EntityAllocParams_ARRAY_0802603c:
    .word EntityAllocParams_08029BD0
PTR_PTR_EventHandler_School_Library_F30_0_08026040:
    .word PTR_EventHandler_School_Library_F30_0_0802602c
