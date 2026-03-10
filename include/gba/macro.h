#ifndef GUARD_GBA_MACRO_H
#define GUARD_GBA_MACRO_H

#define CPU_FILL_UNCHECKED(value, dest, size, bit)                                          \
{                                                                                 \
    vu##bit tmp = (vu##bit)(value);                                               \
    CpuSet((void *)&tmp,                                                          \
           dest,                                                                  \
           CPU_SET_##bit##BIT | CPU_SET_SRC_FIXED | ((size)/(bit/8) & 0x1FFFFF)); \
}

#define CPU_FILL(value, dest, size, bit) CPU_FILL_UNCHECKED(value, dest, size, bit)

#define CpuFill32(value, dest, size) CPU_FILL(value, dest, size, 32)

#define CPU_COPY_UNCHECKED(src, dest, size, bit) CpuSet(src, dest, CPU_SET_##bit##BIT | ((size)/(bit/8) & 0x1FFFFF))

#define CPU_COPY(src, dest, size, bit) CPU_COPY_UNCHECKED(src, dest, size, bit)

#define CpuCopy16(src, dest, size) CPU_COPY(src, dest, size, 16)
#define CpuCopy32(src, dest, size) CPU_COPY(src, dest, size, 32)

#endif // GUARD_GBA_MACRO_H