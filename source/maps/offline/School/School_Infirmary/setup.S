#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

    .set PlayerLocation_Create, 0x8056020


_ts MapSetup_School_Infirmary_S1
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Infirmary_F10_08027438
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    push       {r5}
    mov        r0,#0x9a
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080272f6
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {pc}
LAB_080272f6:
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Infirmary_F10_080272fc:
    .word MapSetup_School_Infirmary_F10
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_Default
    .word MapSetup_School_Infirmary_F14
    .word MapSetup_School_Infirmary_F15
    .word MapSetup_Default
    .word MapSetup_Default


_ts EventHandler_School_Infirmary_S1
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F10_0802743c
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Infirmary_F10_08027328:
    .word EventHandler_School_Infirmary_F10
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_Default
    .word EventHandler_School_Infirmary_F14
    .word EventHandler_School_Infirmary_F15
    .word EventHandler_Default
    .word EventHandler_Default


_ts MapSetup_School_Infirmary_F10
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08027440
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


_ts EventHandler_School_Infirmary_F10
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F10_0_08027444
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Infirmary_F10_0_08027378:
    .word EventHandler_School_Infirmary_F10_0


_ts EventHandler_School_Infirmary_F10_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Infirmary_F14
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08027448
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802744c
    bl         Map_LoadNPCList
    pop        {r5}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080273b6
    mov        r0,#0x4
    str        r0,[r5,#0x0]
    pop        {pc}
LAB_080273b6:
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_ts EventHandler_School_Infirmary_F14
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F14_0_08027450
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Infirmary_F14_0_080273cc:
    .word EventHandler_School_Infirmary_F14_0
    .word EventHandler_School_Infirmary_F14_1


_ts EventHandler_School_Infirmary_F14_0
    push       {lr}
    push       {r5}
    mov        r0,#0xad
    bl         Flag_GetBase
    pop        {r5}
    beq        LAB_080273ee
    push       {r5}
    mov        r1,#0x7
    ldr        r0,DAT_08027454
    bl         Scene_Prepare
    pop        {r5}
LAB_080273ee:
    pop        {pc}


_ts EventHandler_School_Infirmary_F14_1
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Infirmary_F15
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08027458
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_PTR_DAT_0802745c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Infirmary_F15
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F15_0_08027460
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Infirmary_F15_0_08027430:
    .word EventHandler_School_Infirmary_F15_0


_ts EventHandler_School_Infirmary_F15_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Infirmary_F10_08027438:
    .word PTR_MapSetup_School_Infirmary_F10_080272fc
PTR_PTR_EventHandler_School_Infirmary_F10_0802743c:
    .word PTR_EventHandler_School_Infirmary_F10_08027328
PTR_EntityAllocParams_ARRAY_08027440:
    .word EntityAllocParams_08029CC8
PTR_PTR_EventHandler_School_Infirmary_F10_0_08027444:
    .word PTR_EventHandler_School_Infirmary_F10_0_08027378
PTR_EntityAllocParams_ARRAY_08027448:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_0802744c:
    .word NPCList_80297E4
PTR_PTR_EventHandler_School_Infirmary_F14_0_08027450:
    .word PTR_EventHandler_School_Infirmary_F14_0_080273cc
DAT_08027454:
    .word 0x8087E35
PTR_EntityAllocParams_ARRAY_08027458:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_0802745c:
    .word NPCList_80297E4
PTR_PTR_EventHandler_School_Infirmary_F15_0_08027460:
    .word PTR_EventHandler_School_Infirmary_F15_0_08027430


_ts MapSetup_School_Infirmary_S2
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Infirmary_F20_080275a8
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    mov        r0,#0xab
    bl         Flag_GetBase
    beq        LAB_08027482
    push       {r5}
    mov        r0,#0x4
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802749a
LAB_08027482:
    mov        r0,#0xdf
    bl         Flag_GetBase
    beq        LAB_08027496
    push       {r5}
    mov        r0,#0x3
    bl         Sound_ChangeSong
    pop        {r5}
    b          LAB_0802749a
LAB_08027496:
    bl         Sound_AreaSongChange
LAB_0802749a:
    pop        {pc}
PTR_MapSetup_School_Infirmary_F20_0802749c:
    .word MapSetup_School_Infirmary_F20
    .word MapSetup_School_Infirmary_F20
    .word MapSetup_School_Infirmary_F20
    .word MapSetup_Default
    .word MapSetup_School_Infirmary_F24
    .word MapSetup_School_Infirmary_F25
    .word MapSetup_School_Infirmary_F25
    .word MapSetup_School_Infirmary_F25


_ts EventHandler_School_Infirmary_S2
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F20_080275ac
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Infirmary_F20_080274c8:
    .word EventHandler_School_Infirmary_F20
    .word EventHandler_School_Infirmary_F20
    .word EventHandler_School_Infirmary_F20
    .word EventHandler_Default
    .word EventHandler_School_Infirmary_F24
    .word EventHandler_School_Infirmary_F25
    .word EventHandler_School_Infirmary_F25
    .word EventHandler_School_Infirmary_F25


_ts MapSetup_School_Infirmary_F20
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080275b0
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_080275b4
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Infirmary_F20
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F20_0_080275b8
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Infirmary_F20_0_08027520:
    .word EventHandler_School_Infirmary_F20_0


_ts EventHandler_School_Infirmary_F20_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Infirmary_F24
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080275bc
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_080275c0
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Infirmary_F24
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F24_0_080275c4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Infirmary_F24_0_08027560:
    .word EventHandler_School_Infirmary_F24_0


_ts EventHandler_School_Infirmary_F24_0
    push       {lr}
    pop        {pc}


_ts MapSetup_School_Infirmary_F25
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_080275c8
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_080275cc
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Infirmary_F25
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F25_0_080275d0
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Infirmary_F25_0_080275a0:
    .word EventHandler_School_Infirmary_F25_0


_ts EventHandler_School_Infirmary_F25_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Infirmary_F20_080275a8:
    .word PTR_MapSetup_School_Infirmary_F20_0802749c
PTR_PTR_EventHandler_School_Infirmary_F20_080275ac:
    .word PTR_EventHandler_School_Infirmary_F20_080274c8
PTR_EntityAllocParams_ARRAY_080275b0:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_080275b4:
    .word NPCList_8029828
PTR_PTR_EventHandler_School_Infirmary_F20_0_080275b8:
    .word PTR_EventHandler_School_Infirmary_F20_0_08027520
PTR_EntityAllocParams_ARRAY_080275bc:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_080275c0:
    .word NPCList_8029804
PTR_PTR_EventHandler_School_Infirmary_F24_0_080275c4:
    .word PTR_EventHandler_School_Infirmary_F24_0_08027560
PTR_EntityAllocParams_ARRAY_080275c8:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_080275cc:
    .word NPCList_8029804
PTR_PTR_EventHandler_School_Infirmary_F25_0_080275d0:
    .word PTR_EventHandler_School_Infirmary_F25_0_080275a0


_ts MapSetup_School_Infirmary_S3
    push       {lr}
    ldr        r0,PTR_PTR_MapSetup_School_Infirmary_F30_08027670
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    bl         Sound_AreaSongChange
    pop        {pc}
PTR_MapSetup_School_Infirmary_F30_080275e4:
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30
    .word MapSetup_School_Infirmary_F30


_ts EventHandler_School_Infirmary_S3
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F30_08027674
    ldr        r0,[r0,r1]
    mov        lr,pc
    bx         r0
    pop        {pc}
PTR_EventHandler_School_Infirmary_F30_08027610:
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30
    .word EventHandler_School_Infirmary_F30


_ts MapSetup_School_Infirmary_F30
    push       {lr}
    push       {r5}
    ldr        r0,PTR_EntityAllocParams_ARRAY_08027678
    bl         Entity_AllocList
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    ldr        r7,PTR_PTR_DAT_0802767c
    bl         Map_LoadNPCList
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt EventHandler_School_Infirmary_F30
    push       {lr}
    ldr        r0,PTR_PTR_EventHandler_School_Infirmary_F30_0_08027680
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    .byte 0x00, 0x68 @ ldr r0, [r0, #0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_EventHandler_School_Infirmary_F30_0_08027668:
    .word EventHandler_School_Infirmary_F30_0


_ts EventHandler_School_Infirmary_F30_0
    push       {lr}
    pop        {pc}
PTR_PTR_MapSetup_School_Infirmary_F30_08027670:
    .word PTR_MapSetup_School_Infirmary_F30_080275e4
PTR_PTR_EventHandler_School_Infirmary_F30_08027674:
    .word PTR_EventHandler_School_Infirmary_F30_08027610
PTR_EntityAllocParams_ARRAY_08027678:
    .word EntityAllocParams_08029CC8
PTR_PTR_DAT_0802767c:
    .word NPCList_8029828
PTR_PTR_EventHandler_School_Infirmary_F30_0_08027680:
    .word PTR_EventHandler_School_Infirmary_F30_0_08027668
