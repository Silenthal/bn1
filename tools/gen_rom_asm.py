#!/usr/bin/env python3
"""
Generate assembly for the SDK code regions of the base ROM that this repository's C sources
cannot reproduce (they were built with agbcc from older SDK revisions, plus an old libgcc):

  source/m4a_rom.S  the m4a sound driver           (replaces source/m4a.c functions)
  source/sdk_rom.S  AGB SRAM routines + old libgcc  (replaces source/agb_sram.c functions,
                    _call_via_rX and __divsi3 -- named rom_* so modern libgcc can coexist)

Code halfwords are emitted as .2byte; every word that points into ROM (literal pools,
switch tables) and every `bl` leaving the region is emitted symbolically, so the code keeps
working when it moves (shift test / FUNCTIONAL builds).

usage: gen_rom_asm.py BASE.gba LOCAL.elf OUTDIR
  LOCAL.elf: any build of this repo (used only to name addresses outside the region).
"""
import struct, subprocess, sys

ROM = 0x08000000
START, END = 0x0809CAEC, 0x0809DF50          # m4a.o .text in the base ROM
NAMES = {                                      # function entry points (base ROM), verified by
    0x0809CAEC: "MidiKeyToFreq",               # call sites, the ply jump table and agbcc output
    0x0809CB50: "UnusedDummyFunc",
    0x0809CB54: "MPlayContinue",
    0x0809CB70: "MPlayFadeOut",
    0x0809CB90: "m4aSoundInit",
    0x0809CC1C: "m4aSoundMain",
    0x0809CC2C: "m4aSongNumStart",
    0x0809CCF8: "m4aSongNumStop",
    0x0809CD60: "m4aMPlayAllStop",
    0x0809CD8C: "m4aMPlayAllContinue",
    0x0809CDB8: "m4aMPlayImmInit",
    0x0809CF2C: "MusicPlayerJumpTableCopy",
    0x0809CF30: "ClearSoundChannelTracks",
    0x0809CF44: "Clear64byte",
    0x0809D018: "SampleFreqSet",
    0x0809D0BC: "m4aSoundMode",
    0x0809D154: "SoundClear",
    0x0809D1A8: "m4aSoundVSyncOff",
    0x0809D1F4: "m4aSoundVSyncOn",
    0x0809D230: "MPlayOpen",
    0x0809D35C: "m4aMPlayStop",
    0x0809D39C: "FadeOutBody",
    0x0809D41C: "TrkVolPitSet",
    0x0809D4E4: "MidiKeyToCgbFreq",
    0x0809DA88: "m4aMPlayVolumeControl",
    0x0809DAF0: "m4aMPlayPitchControl",
    0x0809DB64: "m4aMPlayPanpotControl",
    0x0809DE2C: "ply_xcmd",
    0x0809DE4C: "ply_xxx",
    0x0809DE60: "ply_xwave",
    0x0809DEA8: "ply_xtype",
    0x0809DEBC: "ply_xatta",
    0x0809DED0: "ply_xdeca",
    0x0809DEE4: "ply_xsust",
    0x0809DEF8: "ply_xrele",
    0x0809DF0C: "ply_xiecv",
    0x0809DF18: "ply_xiecl",
    0x0809DF24: "ply_xleng",
    0x0809DF38: "ply_xswee",
}

SDK_START, SDK_END = 0x0809DF68, 0x0809E1D0  # agb_sram.o + libgcc in the base ROM
_VIA = ["r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "sl", "fp", "ip", "sp", "lr"]
SDK_NAMES = {
    0x0809DF68: "ReadSram_Core",
    0x0809DF8C: "ReadSram",
    0x0809DFF0: "WriteSram",
    0x0809E030: "VerifySram_Core",
    0x0809E060: "VerifySram",
    0x0809E0C4: "WriteSramEx",
    0x0809E138: "rom_divsi3",          # old thumb __divsi3
}
SDK_NAMES.update({0x0809E0FC + 4 * i: f"rom_call_via_{r}" for i, r in enumerate(_VIA)})
REGIONS = [
    dict(start=START, end=END, names=NAMES, label="m4a_rom_start", out="m4a_rom.S", macro="M4A_C",
         what="the SDK sound driver (m4a)", csrc="source/m4a.c"),
    dict(start=SDK_START, end=SDK_END, names=SDK_NAMES, label="sdk_rom_start", out="sdk_rom.S",
         macro="SDK_C", what="the AGB SRAM routines and the old libgcc (_call_via_rX, __divsi3)",
         csrc="source/agb_sram.c and libgcc"),
]
ALL_NAMES = {**NAMES, **SDK_NAMES}

base_rom = open(sys.argv[1], "rb").read()
elf, outdir = sys.argv[2], sys.argv[3]

def word(a): return struct.unpack_from("<I", base_rom, a - ROM)[0]
def half(a): return struct.unpack_from("<H", base_rom, a - ROM)[0]

# --- names for addresses outside the region -------------------------------------------------
nm = subprocess.run(["arm-none-eabi-nm", "-n", elf], capture_output=True, text=True, check=True).stdout
local = []
for line in nm.splitlines():
    p = line.split()
    if len(p) == 3 and p[1] in "TtDdRr" and ROM <= int(p[0], 16) < 0x08180000 and not p[2].startswith("$"):
        local.append((int(p[0], 16) & ~1, p[2]))
local_bytes = open(elf.replace(".elf", ".gba"), "rb").read()
DATA_GUESS = 0x0809E1D0   # base address of gMPlayJumpTableTemplate (from m4aSoundInit's pool)
_lsym = {n: la for la, n in local}

def _is_rom_ptr(w):
    # Only pointers past the sound driver can differ between the local build and the base ROM:
    # everything before it, and the driver itself, sit at the same addresses.
    return END <= (w & ~1) < 0x08800000

def _anchor(la, size, expected=None):
    """Base-ROM address of local symbol at `la` found by content (ROM pointers masked)."""
    loc = local_bytes[la - ROM:la - ROM + size]
    words = [int.from_bytes(loc[i:i + 4], "little") for i in range(0, len(loc) - 3, 4)]
    mask = [_is_rom_ptr(w) for w in words]
    if all(mask) or len(loc) < 8:
        return None
    hits = []
    pos = base_rom.find(loc[:4] if not mask[0] else b"", END - ROM)
    lo, hi = END - ROM, 0x00180000
    for start in range(lo, hi - size, 2):
        ok = True
        for k, w in enumerate(words):
            if mask[k]:
                continue
            if base_rom[start + 4 * k:start + 4 * k + 4] != loc[4 * k:4 * k + 4]:
                ok = False
                break
        if ok:
            hits.append(ROM + start)
            if len(hits) > 64:
                break
    if not hits:
        return None
    if len(hits) == 1:
        return hits[0]
    if expected is None:
        return None
    best = min(hits, key=lambda h: abs(h - expected))
    return best if abs(best - expected) <= 0x100 else None

# base addresses of the data symbols after the SDK library code (sound tables, song data)
_data_syms = [(la, n) for la, n in local if la >= _lsym["gMPlayJumpTableTemplate"] and la < 0x08180000]
_sizes = {}
for (la, n), (lb, _) in zip(_data_syms, _data_syms[1:] + [(0x08180000, None)]):
    _sizes[n] = lb - la
BASE_DATA = {DATA_GUESS: "gMPlayJumpTableTemplate"}   # base address -> symbol (all-pointer table: known)

def base_of(name):
    for ba, n in BASE_DATA.items():
        if n == name:
            return ba
    la = _lsym[name]
    expected = DATA_GUESS + (la - _lsym["gMPlayJumpTableTemplate"])
    ba = _anchor(la, min(_sizes.get(name, 32), 48), expected)
    if ba is not None:
        BASE_DATA[ba] = name
    return ba

def nearest(la):
    best = None
    for sa, n in local:
        if sa <= la and (best is None or sa >= best[0]):
            best = (sa, n)
    if best is None:
        return None
    return best[1] if best[0] == la else f"{best[1]} + {la - best[0]:#x}"


def outside_name(a):
    """Expression naming base-ROM address `a` outside the region.
    Before the region the local build has the same layout. After it, the SDK library code
    (libagbsyscall, sram, libgcc) is matched by content (no pointers there); the sound data
    that follows sits at a constant offset (DATA_DELTA) between the base ROM and the local
    build, measured on gScaleTable (no pointers inside)."""
    if a in ALL_NAMES:
        return ALL_NAMES[a]
    for r in REGIONS:
        if r["start"] <= a < r["end"]:
            return f"{r['label']} + {a - r['start']:#x}"
    if a < START:
        return nearest(a)
    if a >= _lsym["gMPlayJumpTableTemplate"] - 0x100:
        # sound tables / song data: name by the symbol whose content sits exactly at `a`
        cands = sorted(_data_syms, key=lambda x: abs((x[0] - _lsym["gMPlayJumpTableTemplate"]) -
                                                       (a - DATA_GUESS)))
        for la, n in cands[:12]:
            if base_of(n) == a:
                return n
        return None
    probe = base_rom[a - ROM:a - ROM + 16]
    hits = [n for la, n in local if la >= START and local_bytes[la - ROM:la - ROM + 16] == probe]
    return hits[0] if len(hits) == 1 else None

def generate(rg):
    R0, R1, names, label = rg["start"], rg["end"], rg["names"], rg["label"]

    def sym(value, what):
        thumb = value & 1
        a = value & ~1
        if R0 <= a < R1:
            return f"{label} + {a - R0:#x}" + (" + 1" if thumb else "")
        n = outside_name(a)
        if n is None:
            sys.exit(f"no symbol for {what} {value:#010x}")
        return n + (" + 1" if thumb else "")

    # classify: linear sweep, literal pools are only referenced forward
    data = set()
    a = R0
    while a < R1:
        if a in data:
            a += 4
            continue
        h = half(a)
        if (h & 0xF800) == 0x4800:                       # ldr rX, [pc, #imm]
            lit = ((a + 4) & ~3) + (h & 0xFF) * 4
            data.add(lit)
            v = word(lit)
            if R0 <= (v & ~1) < R1 and (v & 1) == 0 and (v & ~1) not in names:
                t = v                                    # in-region switch table: data too
                while t < R1 and R0 <= word(t) < R1 and t not in data:
                    data.add(t)
                    t += 4
        if (h & 0xF800) == 0xF000 and a + 2 < R1 and (half(a + 2) & 0xF800) == 0xF800:
            a += 4
            continue
        a += 2

    lines = [
        f"@ Generated by tools/gen_rom_asm.py from the base ROM: {rg['what']}, exactly as",
        f"@ shipped. The original was built with agbcc from an older SDK revision (and an old libgcc),",
        f"@ so compiling {rg['csrc']} cannot reproduce it. Do not edit by hand.",
        f"#if !{rg['macro']}  /* the C sources provide this code instead when built with -D{rg['macro']}=1 */",
        "    .syntax unified",
        "    .thumb",
        "    .text",
        "    .align 2, 0",
        f"    .global {label}",
        f"{label}:",
    ]
    a = R0
    while a < R1:
        if a in names:
            n = names[a]
            lines += ["", f"    .global {n}", "    .thumb_func", f"{n}:"]
        if a in data:
            v = word(a)
            if ROM <= (v & ~1) < 0x08800000:
                lines.append(f"    .4byte {sym(v, f'pointer at {a:#x}')}")
            else:
                lines.append(f"    .4byte {v:#010x}")
            a += 4
            continue
        h = half(a)
        if (h & 0xF800) == 0xF000 and a + 2 < R1 and (half(a + 2) & 0xF800) == 0xF800:
            h2 = half(a + 2)
            off = ((h & 0x7FF) << 12) | ((h2 & 0x7FF) << 1)
            if off & 0x400000:
                off -= 0x800000
            tgt = a + 4 + off
            if R0 <= tgt < R1:
                lines.append(f"    .2byte {h:#06x}, {h2:#06x}  @ bl {names.get(tgt, hex(tgt))}")
            else:
                lines.append(f"    bl {sym(tgt, f'bl target at {a:#x}')}")
            a += 4
            continue
        lines.append(f"    .2byte {h:#06x}")
        a += 2
    lines += ["#endif", ""]
    path = f"{outdir}/{rg['out']}"
    open(path, "w").write("\n".join(lines))
    print(f"wrote {path}: {len(data)} data words, {sum(1 for l in lines if l.startswith('    bl '))} external calls")


for rg in REGIONS:
    generate(rg)
