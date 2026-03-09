#ifndef GUARD_GBA_M4A_INTERNAL_H
#define GUARD_GBA_M4A_INTERNAL_H

#include "mmbn.h"
#include "gba/defines.h"

// ASCII encoding of 'Smsh' in reverse
// This is presumably short for SMASH, the developer of MKS4AGB.
#define ID_NUMBER 0x68736D53

#define C_V 0x40 // center value for PAN, BEND, and TUNE

#define SOUND_MODE_REVERB_VAL   0x0000007F
#define SOUND_MODE_REVERB_SET   0x00000080
#define SOUND_MODE_MAXCHN       0x00000F00
#define SOUND_MODE_MAXCHN_SHIFT 8
#define SOUND_MODE_MASVOL       0x0000F000
#define SOUND_MODE_MASVOL_SHIFT 12
#define SOUND_MODE_FREQ_05734   0x00010000
#define SOUND_MODE_FREQ_07884   0x00020000
#define SOUND_MODE_FREQ_10512   0x00030000
#define SOUND_MODE_FREQ_13379   0x00040000
#define SOUND_MODE_FREQ_15768   0x00050000
#define SOUND_MODE_FREQ_18157   0x00060000
#define SOUND_MODE_FREQ_21024   0x00070000
#define SOUND_MODE_FREQ_26758   0x00080000
#define SOUND_MODE_FREQ_31536   0x00090000
#define SOUND_MODE_FREQ_36314   0x000A0000
#define SOUND_MODE_FREQ_40137   0x000B0000
#define SOUND_MODE_FREQ_42048   0x000C0000
#define SOUND_MODE_FREQ         0x000F0000
#define SOUND_MODE_FREQ_SHIFT   16
#define SOUND_MODE_DA_BIT_9     0x00800000
#define SOUND_MODE_DA_BIT_8     0x00900000
#define SOUND_MODE_DA_BIT_7     0x00A00000
#define SOUND_MODE_DA_BIT_6     0x00B00000
#define SOUND_MODE_DA_BIT       0x00B00000
#define SOUND_MODE_DA_BIT_SHIFT 20

typedef struct WaveData
{
    u16 type;
    u16 status;
    u32 freq;
    u32 loopStart;
    u32 size; // number of samples
    s8 data[1]; // samples
} WaveData;

#define TONEDATA_TYPE_CGB    0x07
#define TONEDATA_TYPE_FIX    0x08
#define TONEDATA_TYPE_SPL    0x40 // key split
#define TONEDATA_TYPE_RHY    0x80 // rhythm

#define TONEDATA_P_S_PAN    0xc0
#define TONEDATA_P_S_PAM    TONEDATA_P_S_PAN

typedef enum InstrumentType {
    Sample=0,
    PsgSquare1=1,
    PsgSquare2=2,
    PsgWave=3,
    PsgNoise=4,
    SampleNonResampled=8,
    KeySplit=64,
    KeySplit2=128
} InstrumentType;

typedef struct ToneData {
    u8 type; // InstrumentType
    u8 key;
    u8 length;
    u8 pan_sweep;
    WaveData *wav;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
} ToneData;

#define SOUND_CHANNEL_SF_START       0x80
#define SOUND_CHANNEL_SF_STOP        0x40
#define SOUND_CHANNEL_SF_LOOP        0x10
#define SOUND_CHANNEL_SF_IEC         0x04
#define SOUND_CHANNEL_SF_ENV         0x03
#define SOUND_CHANNEL_SF_ENV_ATTACK  0x03
#define SOUND_CHANNEL_SF_ENV_DECAY   0x02
#define SOUND_CHANNEL_SF_ENV_SUSTAIN 0x01
#define SOUND_CHANNEL_SF_ENV_RELEASE 0x00
#define SOUND_CHANNEL_SF_ON (SOUND_CHANNEL_SF_START | SOUND_CHANNEL_SF_STOP | SOUND_CHANNEL_SF_IEC | SOUND_CHANNEL_SF_ENV)

#define CGB_CHANNEL_MO_PIT  0x02
#define CGB_CHANNEL_MO_VOL  0x01

#define CGB_NRx2_ENV_DIR_DEC 0x00
#define CGB_NRx2_ENV_DIR_INC 0x08

typedef struct CgbChannel {
    u8 statusFlags;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 key;
    u8 envelopeVolume;
    u8 envelopeGoal;
    u8 envelopeCounter;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    u8 dummy1;
    u8 dummy2;
    u8 gateTime;
    u8 midiKey;
    u8 velocity;
    u8 priority;
    u8 rhythmPan;
    u8 dummy3[3];
    u8 dummy5;
    u8 sustainGoal;
    u8 n4;                  // NR[1-4]4 register (initial, length bit)
    u8 pan;
    u8 panMask;
    u8 modify;
    u8 length;
    u8 sweep;
    u32 frequency;
    u32 *wavePointer;       // instructs CgbMain to load targeted wave
    u32 *currentPointer;    // stores the currently loaded wave
    struct MusicPlayerTrack *track;
    void *prevChannelPointer;
    void *nextChannelPointer;
    u8 dummy4[8];
} CgbChannel;

struct MusicPlayerTrack;

typedef struct SoundChannel {
    u8 statusFlags;
    u8 type;
    u8 rightVolume;
    u8 leftVolume;
    u8 attack;
    u8 decay;
    u8 sustain;
    u8 release;
    u8 key;             // midi key as it was translated into final pitch
    u8 envelopeVolume;
    u8 envelopeVolumeRight;
    u8 envelopeVolumeLeft;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    u8 dummy1;
    u8 dummy2;
    u8 gateTime;
    u8 midiKey;         // midi key as it was used in the track data
    u8 velocity;
    u8 priority;
    u8 rhythmPan;
    u8 dummy3[3];
    u32 count;
    u32 fw;
    u32 frequency;
    WaveData *wav;
    s8 *currentPointer;
    struct MusicPlayerTrack *track;
    void *prevChannelPointer;
    void *nextChannelPointer;
    u32 dummy4;
    u16 xpi;
    u16 xpc;
} SoundChannel;

#define MAX_DIRECTSOUND_CHANNELS 12

#define PCM_DMA_BUF_SIZE 1584 // size of Direct Sound buffer

struct MusicPlayerInfo;

#if __STDC_VERSION__ < 202311L
typedef void (*MPlayFunc)();
#else
typedef void (*MPlayFunc)(...);
#endif
typedef void (*PlyNoteFunc)(u32, struct MusicPlayerInfo *, struct MusicPlayerTrack *);
typedef void (*CgbSoundFunc)(void);
typedef void (*CgbOscOffFunc)(u8);
typedef u32 (*MidiKeyToCgbFreqFunc)(u8, u8, u8);
typedef void (*ExtVolPitFunc)(void);
typedef void (*MPlayMainFunc)(struct MusicPlayerInfo *);

typedef struct SoundInfo SoundInfo, *PSoundInfo;

typedef struct SoundInfo {
    // This field is normally equal to ID_NUMBER but it is set to other
    // values during sensitive operations for locking purposes.
    // This field should be volatile but isn't. This could potentially cause
    // race conditions.
    u32 ident;

    vu8 pcmDmaCounter;

    // Direct Sound
    u8 reverb;
    u8 maxChans;
    u8 masterVolume;
    u8 freq;
    
    u8 mode;
    u8 c15;          // periodically counts from 14 down to 0 (15 states)
    u8 pcmDmaPeriod; // number of V-blanks per PCM DMA
    u8 maxLines;
    u8 gap[3];
    s32 pcmSamplesPerVBlank;
    s32 pcmFreq;
    s32 divFreq;
    CgbChannel *cgbChans;
    MPlayMainFunc MPlayMainHead;
    struct MusicPlayerInfo *musicPlayerHead;
    CgbSoundFunc CgbSound;
    CgbOscOffFunc CgbOscOff;
    MidiKeyToCgbFreqFunc MidiKeyToCgbFreq;
    MPlayFunc *MPlayJumpTable;
    PlyNoteFunc plynote;
    ExtVolPitFunc ExtVolPit;
    u8 gap2[16];
    SoundChannel chans[MAX_DIRECTSOUND_CHANNELS];
    s8 ALIGNED(4) pcmBuffer[PCM_DMA_BUF_SIZE * 2];
} SoundInfo;

typedef struct SongHeader {
    u8 trackCount;
    u8 blockCount;
    u8 priority;
    u8 reverb;
    ToneData *tone;
    u8 *part[1];
} SongHeader;

typedef enum MptFlag {
    MPT_FLAG_VOLSET=1,
    MPT_FLAG_VOLCHG=3,
    MPT_FLAG_PITSET=4,
    MPT_FLAG_PITCHG=12,
    MPT_FLAG_START=64,
    MPT_FLAG_EXIST=128
} MptFlag;

typedef struct MusicPlayerTrack {
    u8 flags; // MptFlag
    u8 wait;
    u8 patternLevel;
    u8 repN;
    u8 gateTime;
    u8 key;
    u8 velocity;
    u8 runningStatus;
    u8 keyM;
    u8 pitM;
    s8 keyShift;
    s8 keyShiftX;
    s8 tune;
    u8 pitX;
    s8 bend;
    u8 bendRange;
    u8 volMR;
    u8 volML;
    u8 vol;
    u8 volX;
    s8 pan;
    s8 panX;
    s8 modM;
    u8 mod;
    u8 modT;
    u8 lfoSpeed;
    u8 lfoSpeedC;
    u8 lfoDelay;
    u8 lfoDelayC;
    u8 priority;
    u8 pseudoEchoVolume;
    u8 pseudoEchoLength;
    SoundChannel *chan;
    ToneData tone;
    u8 gap[10];
    u16 timer;
    u32 unk_3C;
    u8 *cmdPtr;
    u8 *patternStack[3];
} MusicPlayerTrack;

typedef enum MusicPlayerStatus {
    MUSICPLAYER_STATUS_TRACK=65535,
    MUSICPLAYER_STATUS_PAUSE=2147483648
} MusicPlayerStatus;

typedef struct MusicPlayerInfo {
    SongHeader *songHeader;
    u32 status; // MusicPlayerStatus
    u8 trackCount;
    u8 priority;
    u8 cmd;
    u8 unk_B;
    u32 clock;
    u8 gap[8];
    u8 *memAccArea;
    u16 tempoD;
    u16 tempoU;
    u16 tempoI;
    u16 tempoC;
    u16 fadeOI;
    u16 fadeOC;
    u16 fadeOV;
    MusicPlayerTrack *tracks;
    ToneData *tone;
    u32 ident;
    MPlayMainFunc MPlayMainNext;
    struct MusicPlayerInfo *musicPlayerNext;
} MusicPlayerInfo;

typedef struct MusicPlayer {
    MusicPlayerInfo *info;
    MusicPlayerTrack *track;
    byte trackCount;
    word unk_A;
} MusicPlayer;

typedef struct Song {
    SongHeader *header;
    word musicPlayer;
    word me;
} Song;

extern const MusicPlayer gMPlayTable[];
extern const Song gSongTable[];



extern u8 gMPlayMemAccArea[];

extern char SoundMainRAM[];

extern MPlayFunc gMPlayJumpTable[];

typedef void (*XcmdFunc)(MusicPlayerInfo *, MusicPlayerTrack *);
extern const XcmdFunc gXcmdTable[];

extern CgbChannel gCgbChans[];

extern const u8 gScaleTable[];
extern const u32 gFreqTable[];
extern const u16 gPcmSamplesPerVBlankTable[];

extern const u8 gCgbScaleTable[];
extern const s16 gCgbFreqTable[];
extern const u8 gNoiseTable[];

extern char gNumMusicPlayers[];
extern char gMaxLines[];

#define NUM_MUSIC_PLAYERS ((u16)gNumMusicPlayers)
#define MAX_LINES ((u32)gMaxLines)


// sound command handler functions
void ply_fine(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_goto(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_patt(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_pend(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_rept(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_memacc(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_prio(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_tempo(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_keysh(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_voice(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_vol(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_pan(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_bend(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_bendr(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_lfos(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_lfodl(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_mod(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_modt(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_tune(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_port(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xcmd(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_endtie(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_note(u32 note_cmd, MusicPlayerInfo *, MusicPlayerTrack *);

void SampleFreqSet(u32 freq);
void TrackStop(MusicPlayerInfo *mplayInfo, MusicPlayerTrack *track);
void FadeOutBody(MusicPlayerInfo *mplayInfo);
void TrkVolPitSet(MusicPlayerInfo *mplayInfo, MusicPlayerTrack *track);
void RealClearChain(void *x);
void SoundMainBTM(void);

// extended sound command handler functions
void ply_xxx(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xwave(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xtype(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xatta(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xdeca(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xsust(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xrele(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xiecv(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xiecl(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xleng(MusicPlayerInfo *, MusicPlayerTrack *);
void ply_xswee(MusicPlayerInfo *, MusicPlayerTrack *);

#endif // GUARD_GBA_M4A_INTERNAL_H