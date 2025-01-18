#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"


Cam_Set_08082880:
    cam_set 8, -4, 0
    cam_move -512, 512, 0, 6
    cam_move -256, 256, 0, 3
    cam_move -128, 128, 0, 2
    cam_wait 30
    cam_end


_ts Scene_Story_00_LanWakesUp
    push       {lr}
    ldr        r0,PTR_PTR_S_Story_00_0_08082aa4
    ldrb       r1,[r5,#0x0]
    add        r0,r0,r1
    ldr        r0,[r0,#0x0]
    mov        lr,pc
    bx         r0
    pop        {pc}

PTR_S_Story_00_0_080828bc:
    .word S_Story_00_0
    .word S_Story_00_1
    .word S_Story_00_2
    .word S_Story_00_3
    .word S_Story_00_4
    .word S_Story_00_5
    .word S_Story_00_3
    .word S_Story_00_4
    .word S_Story_00_8
    .word S_Story_00_9
    .word S_Story_00_10

BYTE_ARRAY_080828e8:
    .byte 0x00
    .byte 0x07

    .align 2, 0



_ts S_Story_00_0
    push       {lr}
    push       {r5}
    bl         Flag_SetPlayerInactive
    pop        {r5}
    bl         S_Story_00_LoadLanBed
    ldr        r0,PTR_Cam_Set_08082aa8
    bl         SceneCamera_Init
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082906:
    pop        {pc}


_ts S_Story_00_1
    push       {lr}
    bl         SceneCamera_Main
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08082906
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_00_2
    push       {lr}
    bl         SceneCamera_Main
    cmp        r0,#0x1
    beq        LAB_08082946
    mov        r0,#0x0
    strb       r0,[r5,#0x4]
    mov        r0,#0x0
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_08082946
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
LAB_08082946:
    pop        {pc}


_ts S_Story_00_3
    push       {lr}
    ldrh       r0,[r5,#0x8]
    cmp        r0,#0x0
    ble        LAB_08082956
    sub        r0,#0x1
    strh       r0,[r5,#0x8]
    b          LAB_0808297a
LAB_08082956:
    ldrb       r0,[r5,#0x4]
    add        r1,r0,#0x1
    strb       r1,[r5,#0x4]
    ldr        r1,PTR_BYTE_ARRAY_08082aac
    ldrb       r1,[r1,r0]
    ldr        r0,PTR_ScenarioData_00_08082ab0
    push       {r5}
    bl         Text_LoadDialogue
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_0808297a
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
LAB_0808297a:
    pop        {pc}


_ts S_Story_00_4
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_08082990
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082990:
    bl         Scene_IsStartPressed
    beq        LAB_0808299a
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
LAB_0808299a:
    pop        {pc}


_ts S_Story_00_5
    push       {lr}
    push       {r5}
    mov        r0,#0x80
    bl         Text_CheckOption
    pop        {r5}
    bne        LAB_080829c8
    push       {r5}
    Flag_SetBase 0xD9
    pop        {r5}
    mov        r0,#0x60
    strh       r0,[r5,#0x8]
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    bl         Scene_IsStartPressed
    beq        LAB_080829c8
    mov        r0,#0x20
    strb       r0,[r5,#0x0]
LAB_080829c8:
    pop        {pc}

    .align 2, 0



_ts S_Story_00_8
    push       {lr}
    push       {r5}
    mov        r0,#0x4
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
    pop        {pc}

    .align 2, 0



_ts S_Story_00_9
    push       {lr}
    push       {r5}
    mov        r0,#0x40
    bl         Text_EnableOption
    pop        {r5}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08082a42
    push       {r5}
    bl         Text_DisableDialogue
    mov        r0,#0x3
    mov        r1,#0x8
    bl         Fade_Request
    pop        {r5}
    push       {r5}
    bl         S_Story_00_FreeLanBed
    ldr        r0,PTR_EntityAllocParams_8030F60_08082ab4
    bl         Entity_AllocList
    LoadMain world, r6, r6
    ldr        r1,DAT_08082ab8
    str        r1,[r6,#0x38]
    ldr        r1,DAT_08082abc
    str        r1,[r6,#0x3c]
    mov        r1,#0x0
    str        r1,[r6,#0x40]
    mov        r1,#0x4
    str        r1,[r6,#0x44]
    bl         PlayerLocation_Create
    mov        r0,#0x1
    add        r1,r5,#0x0
    add        r1,#0x24
    bl         Camera_SetEnabled
    pop        {r5}
    ldrb       r0,[r5,#0x0]
    add        r0,#0x4
    strb       r0,[r5,#0x0]
LAB_08082a42:
    pop        {pc}


_ts S_Story_00_10
    push       {lr}
    LoadMain fade, r0, r0
    ldrb       r0,[r0,#0x3]
    mov        r1,#0x1
    cmp        r0,r1
    beq        LAB_08082a74
    push       {r5}
    bl         Flag_SetPlayerActive
    Flag_SetBase 0x90
    mov        r0,#0x40
    bl         Text_DisableOption
    bl         Text_DisableDialogue
    mov        r0,#T_In_The_Room
    bl         Sound_PlayBGM
    pop        {r5}
    bl         Scene_UnloadAndResetStepCounter
LAB_08082a74:
    pop        {pc}

    .align 2, 0



_ts S_Story_00_LoadLanBed
    push       {lr}
    push       {r5}
    mov        r0,#0x7
    ldr        r1,DAT_08082ac0
    ldr        r2,DAT_08082ac4
    mov        r3,#0x0
    mov        r4,#0x0
    bl         Actor_Alloc
    add        r0,r5,#0x0
    pop        {r5}
    str        r0,[r5,#0x10]
    pop        {pc}

    .align 2, 0



_ts S_Story_00_FreeLanBed
    push       {lr}
    push       {r5}
    ldr        r5,[r5,#0x10]
    bl         Actor_Free
    pop        {r5}
    pop        {pc}

    .align 2, 0


PTR_PTR_S_Story_00_0_08082aa4:
    .word PTR_S_Story_00_0_080828bc

PTR_Cam_Set_08082aa8:
    .word Cam_Set_08082880

PTR_BYTE_ARRAY_08082aac:
    .word BYTE_ARRAY_080828e8

PTR_ScenarioData_00_08082ab0:
    .word ScenarioData_00

PTR_EntityAllocParams_8030F60_08082ab4:
    .word EntityAllocParams_8030F60

DAT_08082ab8:
    .word 0x20000

DAT_08082abc:
    .word 0x60000

DAT_08082ac0:
    .word 0xFFC80000

DAT_08082ac4:
    .word 0xFFF30000
