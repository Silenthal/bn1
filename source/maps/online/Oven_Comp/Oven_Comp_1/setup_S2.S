#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Oven_Comp_1_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_0804392c
    mov        lr,pc
    bx         r0 @ FUN_08043890
    pop        {pc}


_nt EventHandler_Oven_Comp_1_S2
    push       {lr}
    ldr        r0,DAT_08043930
    mov        lr,pc
    bx         r0 @ FUN_0804390c
    pop        {pc}


_ts FUN_08043890
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    push       {r5}
    ldr        r7,PTR_NPCList_8043C0C_08043934
    bl         Map_LoadNPCList
    pop        {r5}
    LoadMain world, r0, r0
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080438c2
    ldrb       r1,[r0,#World_currentArea]
    ldrb       r2,[r0,#World_lastArea]
    cmp        r1,r2
    beq        LAB_080438ce
LAB_080438c2:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08043938
    ldr        r1,PTR_DAT_0804393c
    bl         Scene_Prepare
    pop        {r5}
LAB_080438ce:
    mov        r2,#0x0
LAB_080438d0:
    mov        r0,#0x0
    add        r0,r0,r2
    bl         Flag_SetIgnore
    add        r2,#0x1
    cmp        r2,#0x20
    blt        LAB_080438d0
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    push       {r5}
    ldr        r0,PTR_BgTask_80423F8_08043940
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042418_08043944
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042448_08043948
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042498_0804394c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80424D8_08043950
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042528_08043954
    bl         BgTask_AddNew
    pop        {r5}
    pop        {pc}


_ts FUN_0804390c
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08043920_08043958
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_FUN_08043920_0804391c:
    .word FUN_08043920


_ts FUN_08043920
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_0804392c:
    .word FUN_08043890

DAT_08043930:
    .word FUN_0804390c

PTR_NPCList_8043C0C_08043934:
    .word NPCList_8043C0C

PTR_Scene_MegaManJackIn_08043938:
    .word Scene_MegaManJackIn

PTR_DAT_0804393c:
    .word 0x2000

PTR_BgTask_80423F8_08043940:
    .word BgTask_80423F8

PTR_BgTask_8042418_08043944:
    .word BgTask_8042418

PTR_BgTask_8042448_08043948:
    .word BgTask_8042448

PTR_BgTask_8042498_0804394c:
    .word BgTask_8042498

PTR_BgTask_80424D8_08043950:
    .word BgTask_80424D8

PTR_BgTask_8042528_08043954:
    .word BgTask_8042528

PTR_PTR_FUN_08043920_08043958:
    .word PTR_FUN_08043920_0804391c
