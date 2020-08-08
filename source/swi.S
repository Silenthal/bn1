    .include "constants.inc"
    .include "macros.inc"

    .text

    .thumb

@@ Copies data.
@@ Input:
@@ r0: src
@@ r1: dst
@@ r2:
@@ - [20:0] Block count
@@ - [24] 0 = Copy, 1 = Fill with r0
@@ - [26] 0 = 16bit, 1 = 32bit
thumb_func_start SWI_CpuSet
SWI_CpuSet:
    svc        0xb
    bx         lr
thumb_func_end SWI_CpuSet

@@ Divides r0 by r1.
@@ Output:
@@ r0: n/d
@@ r1: n%d
@@ r3: abs(n/d)
thumb_func_start SWI_Div
SWI_Div:
    svc        0x6
    bx         lr
thumb_func_end SWI_Div

@@ Divides r0 by r1.
@@ Output:
@@ r0: n/d + n%d
@@ r1: n%d
@@ r3: abs(n/d)
thumb_func_start SWI_DivMod
SWI_DivMod:
    svc        0x6
    add        r0,r1,#0x0
    bx         lr
thumb_func_end SWI_DivMod

@@ Decompresses data to WRAM using LZ77.
@@ Input:
@@ r0: src address
@@ r1: dst address
thumb_func_start SWI_LZ77UnCompWram
SWI_LZ77UnCompWram:
    svc        0x11
    bx         lr
thumb_func_end SWI_LZ77UnCompWram

@@ Returns the square root of r0.
@@ Output:
@@ r0: sqrt(r0)
thumb_func_start SWI_Sqrt
SWI_Sqrt:
    svc        0x8
    bx         lr
thumb_func_end SWI_Sqrt

    .end
