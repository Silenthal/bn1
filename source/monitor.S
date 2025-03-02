    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

Monitor_Main:
    push       {lr}
    ldr        r0,PTR_DAT_080005d0
LAB_08000514:
    ldr        r1,PTR_DAT_080005d4
    str        r0,[r1,#0x0]
    ldrb       r1,[r0,#0x0]
    cmp        r1,#0x2
    bne        LAB_08000520
    b          LAB_0800052e
LAB_08000520:
    cmp        r1,#0x8
    bne        LAB_08000532
    ldrb       r2,[r0,#0x1]
    sub        r2,#0x1
    strb       r2,[r0,#0x1]
    beq        LAB_0800052e
    b          LAB_08000532
LAB_0800052e:
    bl         ChangeTask
LAB_08000532:
    ldr        r7,PTR_DAT_080005d8
    ldr        r0,[r7,#0x0]
    add        r0,#0x10
    str        r0,[r7,#0x0]
    ldr        r1,PTR_DAT_080005dc
    cmp        r0,r1
    bne        LAB_08000514
    pop        {pc}

ChangeTask:
    push       {lr}
    ldr        r1,PTR_DAT_080005e0
    str        r0,[r1,#0x0]
    ldr        r1,PTR_DAT_080005e4
    mov        r2,sp
    str        r2,[r1,#0x0]
    mov        r1,#0x4
    strb       r1,[r0,#0x0]
    ldr        r2,[r0,#0x8]
    mov        sp,r2
    pop        {pc}

Monitor_Exec:
    push       {lr}
    ldr        r2,PTR_DAT_080005e8
    lsl        r0,r0,#0x4
    add        r0,r2,r0
    mov        r2,#0x2
    strb       r2,[r0,#0x0]
    ldr        r2,[r0,#0xc]
    sub        r2,#0x4
    str        r1,[r2,#0x0]
    str        r2,[r0,#0x8]
    pop        {pc}

Monitor_TaskSleep:
    push       {lr}
    ldr        r1,PTR_DAT_080005ec
    ldr        r1,[r1,#0x0]
    mov        r2,#0x8
    strb       r2,[r1,#0x0]
    strb       r0,[r1,#0x1]
    ldr        r0,PTR_DAT_080005f0
    ldr        r0,[r0,#0x0]
    mov        r1,sp
    str        r1,[r0,#0x8]
    ldr        r0,PTR_DAT_080005f4
    ldr        r0,[r0,#0x0]
    mov        sp,r0
    pop        {pc}

Monitor_TaskStop:
    ldr        r0,PTR_DAT_080005f8
    ldr        r0,[r0,#0x0]
    mov        r1,#0x0
    strb       r1,[r0,#0x0]
    ldr        r0,PTR_DAT_080005fc
    ldr        r0,[r0,#0x0]
    mov        sp,r0
    pop        {pc}

Monitor_TaskNext:
    ldr        r3,PTR_DAT_08000600
    ldr        r3,[r3,#0x0]
    mov        r1,#0x2
    strb       r1,[r3,#0x0]
    ldr        r2,[r3,#0xc]
    sub        r2,#0x4
    str        r0,[r2,#0x0]
    str        r2,[r3,#0x8]
    ldr        r0,PTR_DAT_08000604
    ldr        r0,[r0,#0x0]
    mov        sp,r0
    pop        {pc}

Monitor_Init:
    push       {lr}
    ldr        r4,PTR_DAT_08000608
    mov        r0,#0x4
    ldr        r1,PTR_DAT_0800060c
LAB_080005ba:
    mov        r2,#0x0
    strb       r2,[r4,#0x0]
    str        r1,[r4,#0xc]
    mov        r2,#0x1
    lsl        r2,r2,#0x8
    sub        r1,r1,r2
    add        r4,#0x10
    sub        r0,#0x1
    bne        LAB_080005ba
    pop        {pc}

    .align 2, 0

PTR_DAT_080005d0:   .word gMonitorTaskList
PTR_DAT_080005d4:   .word gMonitorCurrentTask
PTR_DAT_080005d8:   .word gMonitorCurrentTask
PTR_DAT_080005dc:   .word gMonitorLastStackPtr
PTR_DAT_080005e0:   .word gMonitorCurrentTask
PTR_DAT_080005e4:   .word gMonitorLastStackPtr
PTR_DAT_080005e8:   .word gMonitorTaskList
PTR_DAT_080005ec:   .word gMonitorCurrentTask
PTR_DAT_080005f0:   .word gMonitorCurrentTask
PTR_DAT_080005f4:   .word gMonitorLastStackPtr
PTR_DAT_080005f8:   .word gMonitorCurrentTask
PTR_DAT_080005fc:   .word gMonitorLastStackPtr
PTR_DAT_08000600:   .word gMonitorCurrentTask
PTR_DAT_08000604:   .word gMonitorLastStackPtr
PTR_DAT_08000608:   .word gMonitorTaskList
PTR_DAT_0800060c:   .word iwMonitorStackTop
