#ifndef GUARD_GBA_DEFINES_H
#define GUARD_GBA_DEFINES_H

#if __STDC_VERSION__ >= 201112L
#include <stdalign.h>
#define ALIGNED(n) alignas(n)
#else
#define ALIGNED(n) __attribute__((aligned(n)))
#endif

#endif // GUARD_GBA_DEFINES_H