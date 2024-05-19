#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_DenTown_Summer_School_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Summer_School_F30_08038bdc
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B508_08038be0
    bl         Entity_AllocList
    pop        {r5}
    mov        r0,#0xbd
    bl         Flag_GetBase
    bne        LAB_08038b44
    mov        r0,#0xa6
    bl         Flag_GetBase
    beq        LAB_08038b24
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08038b48
LAB_08038b24:
    mov        r0,#0x9b
    bl         Flag_GetBase
    beq        LAB_08038b34
    mov        r0,#0x3
    bl         Sound_ChangeSong
    b          LAB_08038b48
LAB_08038b34:
    mov        r0,#0x98
    bl         Flag_GetBase
    beq        LAB_08038b44
    mov        r0,#0x4
    bl         Sound_ChangeSong
    b          LAB_08038b48
LAB_08038b44:
    bl         Sound_AreaSongChange
LAB_08038b48:
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Summer_School_F30_08038b4c:
    .word MapSetup_DenTown_Summer_School_F30
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_DenTown_Summer_School_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F30_08038be4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x28
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F30_08038b80:
    .word EventHandler_DenTown_Summer_School_F30
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_DenTown_Summer_School_F30
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80395F8_08038be8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Summer_School_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F30_0_08038bec
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F30_0_08038bd4:
    .word EventHandler_DenTown_Summer_School_F30_0


_ts EventHandler_DenTown_Summer_School_F30_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Summer_School_F30_08038bdc:
    .word PTR_MapSetup_DenTown_Summer_School_F30_08038b4c

PTR_EntityAllocParams_803B508_08038be0:
    .word EntityAllocParams_803B508

PTR_PTR_EventHandler_DenTown_Summer_School_F30_08038be4:
    .word PTR_EventHandler_DenTown_Summer_School_F30_08038b80

PTR_NPCList_80395F8_08038be8:
    .word NPCList_80395F8

PTR_PTR_EventHandler_DenTown_Summer_School_F30_0_08038bec:
    .word PTR_EventHandler_DenTown_Summer_School_F30_0_08038bd4


_ts MapSetup_DenTown_Summer_School_S4
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Summer_School_F40_08038c9c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B508_08038ca0
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Summer_School_F40_08038c0c:
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40
    .word MapSetup_DenTown_Summer_School_F40


_ts EventHandler_DenTown_Summer_School_S4
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F40_08038ca4
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x28
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F40_08038c40:
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40
    .word EventHandler_DenTown_Summer_School_F40


_ts MapSetup_DenTown_Summer_School_F40
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_80395F8_08038ca8
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Summer_School_F40
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F40_0_08038cac
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F40_0_08038c94:
    .word EventHandler_DenTown_Summer_School_F40_0


_ts EventHandler_DenTown_Summer_School_F40_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Summer_School_F40_08038c9c:
    .word PTR_MapSetup_DenTown_Summer_School_F40_08038c0c

PTR_EntityAllocParams_803B508_08038ca0:
    .word EntityAllocParams_803B508

PTR_PTR_EventHandler_DenTown_Summer_School_F40_08038ca4:
    .word PTR_EventHandler_DenTown_Summer_School_F40_08038c40

PTR_NPCList_80395F8_08038ca8:
    .word NPCList_80395F8

PTR_PTR_EventHandler_DenTown_Summer_School_F40_0_08038cac:
    .word PTR_EventHandler_DenTown_Summer_School_F40_0_08038c94


_ts MapSetup_DenTown_Summer_School_S5
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_DenTown_Summer_School_F50_08038d90
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_803B508_08038d94
    bl         Entity_AllocList
    pop        {r5}
    bl         Sound_AreaSongChange
    pop        {pc}

    .align 2, 0

PTR_MapSetup_DenTown_Summer_School_F50_08038ccc:
    .word MapSetup_DenTown_Summer_School_F50
    .word MapSetup_DenTown_Summer_School_F50
    .word MapSetup_DenTown_Summer_School_F50
    .word MapSetup_DenTown_Summer_School_F53
    .word MapSetup_DenTown_Summer_School_F53
    .word MapSetup_DenTown_Summer_School_F50
    .word MapSetup_DenTown_Summer_School_F50
    .word MapSetup_DenTown_Summer_School_F50


_ts EventHandler_DenTown_Summer_School_S5
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F50_08038d98
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0x40
    mov        r1,#0x28
    bl         CheckForJackIn
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F50_08038d00:
    .word EventHandler_DenTown_Summer_School_F50
    .word EventHandler_DenTown_Summer_School_F50
    .word EventHandler_DenTown_Summer_School_F50
    .word EventHandler_DenTown_Summer_School_F53
    .word EventHandler_DenTown_Summer_School_F53
    .word EventHandler_DenTown_Summer_School_F50
    .word EventHandler_DenTown_Summer_School_F50
    .word EventHandler_DenTown_Summer_School_F50


_ts MapSetup_DenTown_Summer_School_F50
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_8039608_08038d9c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Summer_School_F50
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F50_0_08038da0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F50_0_08038d50:
    .word EventHandler_DenTown_Summer_School_F50_0


_ts EventHandler_DenTown_Summer_School_F50_0
    push       {lr}
    pop        {pc}


_ts MapSetup_DenTown_Summer_School_F53
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_NPCList_803961C_08038da4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_DenTown_Summer_School_F53
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_DenTown_Summer_School_F53_0_08038da8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_EventHandler_DenTown_Summer_School_F53_0_08038d88:
    .word EventHandler_DenTown_Summer_School_F53_0


_ts EventHandler_DenTown_Summer_School_F53_0
    push       {lr}
    pop        {pc}

PTR_PTR_MapSetup_DenTown_Summer_School_F50_08038d90:
    .word PTR_MapSetup_DenTown_Summer_School_F50_08038ccc

PTR_EntityAllocParams_803B508_08038d94:
    .word EntityAllocParams_803B508

PTR_PTR_EventHandler_DenTown_Summer_School_F50_08038d98:
    .word PTR_EventHandler_DenTown_Summer_School_F50_08038d00

PTR_NPCList_8039608_08038d9c:
    .word NPCList_8039608

PTR_PTR_EventHandler_DenTown_Summer_School_F50_0_08038da0:
    .word PTR_EventHandler_DenTown_Summer_School_F50_0_08038d50

PTR_NPCList_803961C_08038da4:
    .word NPCList_803961C

PTR_PTR_EventHandler_DenTown_Summer_School_F53_0_08038da8:
    .word PTR_EventHandler_DenTown_Summer_School_F53_0_08038d88
