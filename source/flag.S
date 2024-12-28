#include "offsets.h"
    .include "constants.inc"
    .include "macros.inc"

@@ Base: Most flags are here.
@@ Library: Set when a chip is received for the first time.
@@ EmailReceived: Set when email is recieved.
@@ EmailUnread: Also set when email is received. Cleared when email is read.
@@ Item: Set when a fixed item is picked up or received.
@@ Ignore: Set when collision for an ingame barrier should be ignored.
@@ System: Set for specific game conditions, like no saving or no input.
@@ Gate: Set to block map exits or paths.
@@ Event: can be used to indicate small events, like trade aknowledgements.

_ts Flag_InitAll
    push       { lr }
    ldr        r0,PTR_DAT_080103f8
    mov        r1,#0x8c
    bl         memset0_32
    pop        { pc }


_ts FUN_080102e8
    push       { lr }
    ldr        r0,PTR_DAT_080102f4
    ldr        r1,DAT_080102f8
    bl         memset0_16
    pop        { pc }
PTR_DAT_080102f4:   .word 0x2000012
DAT_080102f8:       .word 0xE


_ts Flag_InitGate
    push       { lr }
    ldr        r0,PTR_DAT_08010308
    ldr        r1,DAT_0801030c
    bl         memset0_16
    pop        { pc }
PTR_DAT_08010308:       .word 0x2000082
DAT_0801030c:           .word 2


_ts Flag_InitIgnore
    push       { lr }
    ldr        r0,PTR_DAT_0801031c
    ldr        r1,DAT_08010320
    bl         memset0_16
    pop        { pc }
PTR_DAT_0801031c:   .word 0x2000070
DAT_08010320:       .word 0x10


global_label Flag_SetEvent
    add        r0,#0x10
global_label Flag_SetGate
    add        r0,#0x10
global_label Flag_SetSystem
    add        r0,#0x80
global_label Flag_SetIgnore
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_SetItem
    add        r0,#0x40
global_label Flag_SetEmailUnread
    add        r0,#0x40
global_label Flag_SetEmailReceived
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_SetLibrary
    add        r0,#0x80
    add        r0,#0x80

global_label Flag_SetBase
    ldr        r7,PTR_DAT_080103fc
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    orr        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0

global_label Flag_ClearEvent
    add        r0,#0x10
global_label Flag_ClearGate
    add        r0,#0x10
global_label Flag_ClearSystem
    add        r0,#0x80
global_label Flag_ClearIgnore
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_ClearItem
    add        r0,#0x40
    add        r0,#0x40
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80

global_label Flag_ClearBase
    ldr        r7,PTR_DAT_08010400
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    mvn        r1,r1
    ldrb       r0,[r7,#0x0]
    and        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

    .align 2, 0

global_label Flag_GetEvent
    add        r0,#0x10
global_label Flag_GetGate
    add        r0,#0x10
global_label Flag_GetSystem
    add        r0,#0x80
global_label Flag_GetIgnore
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_GetItem
    add        r0,#0x40
global_label Flag_GetEmailUnread
    add        r0,#0x40
global_label Flag_GetEmailReceived
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_GetLibrary
    add        r0,#0x80
    add        r0,#0x80

global_label Flag_GetBase
    ldr        r7,PTR_DAT_08010404
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    and        r0,r1
    mov        pc,lr

    .align 2, 0

global_label Flag_ToggleEvent
    add        r0,#0x10
    add        r0,#0x10
    add        r0,#0x80

global_label Flag_ToggleIgnore
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x40
    add        r0,#0x40
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
    add        r0,#0x80
global_label Flag_ToggleBase
    ldr        r7,PTR_DAT_08010408
    lsr        r1,r0,#0x3
    add        r7,r7,r1
    lsl        r0,r0,#0x1d
    lsr        r0,r0,#0x1d
    mov        r1,#0x80
    lsr        r1,r0
    ldrb       r0,[r7,#0x0]
    eor        r0,r1
    strb       r0,[r7,#0x0]
    mov        pc,lr

global_label Flag_SetEmail
    push       { lr }
    push       { r0 }
    bl         Flag_SetEmailUnread
    pop        { r0 }
    push       { r0 }
    bl         Flag_SetEmailReceived
    pop        { r0 }
    ldr        r7,PTR_gEmailIndexes_0801040c
    ldr        r6,PTR_gEmailCount_08010410
    ldr        r1,[r6,#0x0]
    strb       r0,[r7,r1]
    add        r1,#0x1
    str        r1,[r6,#0x0]
    pop        { pc }

PTR_DAT_080103f8:           .word gFlagBase
PTR_DAT_080103fc:           .word gFlagBase
PTR_DAT_08010400:           .word gFlagBase
PTR_DAT_08010404:           .word gFlagBase
PTR_DAT_08010408:           .word gFlagBase
PTR_gEmailIndexes_0801040c: .word gEmailIndexes
PTR_gEmailCount_08010410:   .word gEmailCount
