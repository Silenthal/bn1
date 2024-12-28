#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


_ts MapSetup_Oven_Comp_2_S2
    push       {lr}
    push       {r1,r5}
    bl         Sound_AreaSongChange
    pop        {r1,r5}
    ldr        r0,DAT_08043a0c
    mov        lr,pc
    bx         r0 @ FUN_08043978
    pop        {pc}


_nt EventHandler_Oven_Comp_2_S2
    push       {lr}
    ldr        r0,DAT_08043a10
    mov        lr,pc
    bx         r0 @ FUN_080439ea
    pop        {pc}


_ts FUN_08043978
    push       {lr}
    push       {r5}
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    mov        r0,r10
    ldr        r0,[r0,#0x8]
    ldrb       r1,[r0,#0x5]
    ldrb       r2,[r0,#0xd]
    cmp        r1,r2
    bne        LAB_080439a0
    ldrb       r1,[r0,#0x4]
    ldrb       r2,[r0,#0xc]
    cmp        r1,r2
    beq        LAB_080439ac
LAB_080439a0:
    push       {r5}
    ldr        r0,PTR_Scene_MegaManJackIn_08043a14
    ldr        r1,PTR_DAT_08043a18
    bl         Scene_Prepare
    pop        {r5}
LAB_080439ac:
    mov        r2,#0x0
LAB_080439ae:
    mov        r0,#0x0
    add        r0,r0,r2
    bl         Flag_SetIgnore
    add        r2,#0x1
    cmp        r2,#0x20
    blt        LAB_080439ae
    push       {r5}
    ldr        r0,PTR_BgTask_80423F8_08043a1c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042418_08043a20
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042448_08043a24
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042498_08043a28
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_80424D8_08043a2c
    bl         BgTask_AddNew
    ldr        r0,PTR_BgTask_8042528_08043a30
    bl         BgTask_AddNew
    pop        {r5}
    mov        r0,#0x0
    str        r0,[r5,#0x0]
    pop        {pc}


_nt FUN_080439ea
    push       {lr}
    ldr        r0,PTR_PTR_FUN_08043a00_08043a34
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

    .align 2, 0

PTR_FUN_08043a00_080439fc:
    .word FUN_08043a00


_ts FUN_08043a00
    push       {lr}
    mov        r0,#0x1
    bl         CheckForJackOut
    pop        {pc}

    .align 2, 0

DAT_08043a0c:
    .word FUN_08043978

DAT_08043a10:
    .word FUN_080439ea

PTR_Scene_MegaManJackIn_08043a14:
    .word Scene_MegaManJackIn

PTR_DAT_08043a18:
    .word 0x2000

PTR_BgTask_80423F8_08043a1c:
    .word BgTask_80423F8

PTR_BgTask_8042418_08043a20:
    .word BgTask_8042418

PTR_BgTask_8042448_08043a24:
    .word BgTask_8042448

PTR_BgTask_8042498_08043a28:
    .word BgTask_8042498

PTR_BgTask_80424D8_08043a2c:
    .word BgTask_80424D8

PTR_BgTask_8042528_08043a30:
    .word BgTask_8042528

PTR_PTR_FUN_08043a00_08043a34:
    .word PTR_FUN_08043a00_080439fc
