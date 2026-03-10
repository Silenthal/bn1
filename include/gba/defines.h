#ifndef GUARD_GBA_DEFINES_H
#define GUARD_GBA_DEFINES_H

#include <stddef.h>

#if __STDC_VERSION__ >= 201112L
#include <stdalign.h>
#define ALIGNED(n) alignas(n)
#else
#define ALIGNED(n) __attribute__((aligned(n)))
#endif

#define SOUND_INFO_PTR (*(struct SoundInfo **)0x3007FF0)

#endif // GUARD_GBA_DEFINES_H