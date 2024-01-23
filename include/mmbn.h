#ifndef MMBN_H
#define MMBN_H

typedef unsigned char   undefined;

typedef unsigned char    bool;
typedef unsigned char    byte;
typedef unsigned int    dword;
typedef long long    longlong;
typedef unsigned long long    qword;
typedef char    sbyte;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned long long    ulonglong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined4;
typedef unsigned long long    undefined5;
typedef unsigned long long    undefined8;
typedef unsigned short    ushort;
typedef unsigned short    word;
#define __WORDSIZE 32

typedef short s16;

typedef ushort u16;

typedef ushort uint16_t;

typedef uint uint32_t;

typedef struct _dma_channel _dma_channel, *P_dma_channel;

struct _dma_channel {
    void * start_address;
    void * end_address;
    ushort wordCount;
    ushort control;
};

typedef struct _dma_controller _dma_controller, *P_dma_controller;

struct _dma_controller {
    ushort wordCount;
    ushort control;
};

typedef union _dma_full_control _dma_full_control, *P_dma_full_control;

union _dma_full_control {
    uint value;
    struct _dma_controller control;
};

typedef struct _interruptHandler _interruptHandler, *P_interruptHandler;

struct _interruptHandler {
    void (* vblank)(void);
    void (* hblank)(void);
    void (* vcount)(void);
    void (* timer0)(void);
    void (* timer1)(void);
    void (* timer2)(void);
    void (* timer3)(void);
    void (* serial)(void);
    void (* dma0)(void);
    void (* dma1)(void);
    void (* dma2)(void);
    void (* dma3)(void);
    void (* keypad)(void);
    void (* extirq)(void);
    void (* other)(void);
};

typedef union _ix9 _ix9, *P_ix9;

typedef struct FieldObject FieldObject, *PFieldObject;

typedef enum Flag_A9E0 {
    F9_None=0,
    F9_1=1,
    F9_CanDoDamage=2,
    F9_4=4,
    F9_IsBigSquare=8
} Flag_A9E0;

typedef struct Position Position, *PPosition;

typedef enum PanelFlag_A9E0 {
    PFA_Ground=8,
    PFA_EnemyControl=32,
    PFA_Player=64,
    PFA_Enemy=128,
    PFA_Hit=512,
    PFA_400=1024
} PanelFlag_A9E0;

struct Position {
    byte m_X;
    byte m_Y;
};

struct FieldObject {
    enum Flag_A9E0 m_b0;
    byte m_idNum;
    struct Position m_cellPosCurr;
    struct Position m_cellPosLast;
    byte m_element;
    byte m_routineType; /* Shares routine type with associated entity */
    short m_damage;
    short pad;
    enum PanelFlag_A9E0 m_i0_panelRelated;
    int m_idFlag;
    int m_attackerFlags;
};

union _ix9 {
    struct FieldObject * m_ix9_a9E0;
    byte m_data[4];
};

typedef struct Actor Actor, *PActor;

typedef struct EntityHeader EntityHeader, *PEntityHeader;

typedef struct PositionXYZ PositionXYZ, *PPositionXYZ;

typedef struct Attack Attack, *PAttack;

typedef struct PlayerBattleState PlayerBattleState, *PPlayerBattleState;

typedef struct BattleSpawnAnimation BattleSpawnAnimation, *PBattleSpawnAnimation;

typedef struct Sprite Sprite, *PSprite;

typedef enum GeneralEntityFlag {
    GF_None=0,
    GF_Active=1,
    GF_CanLoadSprite=2,
    GF_08_SpriteNotLoaded=8
} GeneralEntityFlag;

typedef enum EntityTag {
    EF_None=0,
    ET_PlayerLocation=128,
    ET_Attack=130,
    ET_Struct4CD0=131,
    ET_Actor=145,
    ET_NPC=148
} EntityTag;

typedef enum KeyInput {
    KEY_NONE=0,
    KEY_A=1,
    KEY_B=2,
    KEY_SELECT=4,
    KEY_START=8,
    KEY_RIGHT=16,
    KEY_LEFT=32,
    KEY_UP=64,
    KEY_DOWN=128,
    KEY_R=256,
    KEY_L=512
} KeyInput;

typedef enum SpriteFlag {
    SF_NoMiniAnimation=1,
    SF_TilesetLoaded=2,
    SF_ZClip=4,
    SF_NoZClip=8,
    SF_MultipleParts=16,
    SF_TilesNotInVram=32
} SpriteFlag;

typedef enum SpriteAffineFlag {
    SAF_Enabled=3
} SpriteAffineFlag;

typedef struct ObjectTileAttributes ObjectTileAttributes, *PObjectTileAttributes;

typedef struct SpriteFrame SpriteFrame, *PSpriteFrame;

typedef struct SpriteSubFrame SpriteSubFrame, *PSpriteSubFrame;

typedef struct SpriteTilesetHeader SpriteTilesetHeader, *PSpriteTilesetHeader;

typedef struct Tile Tile, *PTile;

struct SpriteFrame {
    int tilesetOffset;
    int palettes;
    int subFrames;
    int objectLists;
    byte delay;
    byte _pad0;
    byte flags;
    byte _pad1;
};

struct PlayerBattleState {
    byte m_invulnerableTime;
    byte m_chipsUsedCount;
    byte m_moveCount;
    byte m_hitsTaken;
    byte m_bx04;
    byte m_bx05;
    byte m_lastChipElement;
    byte m_bx07;
    byte m_bx08;
    byte m_statAttack;
    byte m_statSpeed;
    byte m_statCharge;
    byte m_bx0c;
    byte m_bx0d;
    byte m_bx0e;
    byte armor;
    short m_busterChargeLevel;
    short m_busterChargeDamage;
    short m_busterChargeDelay;
    short m_sx16;
    short m_lastChipDamage;
    short m_sx1a;
    short m_sx1c;
    enum KeyInput m_curKeyState;
    enum KeyInput m_toggleKeyState;
    short m_unk22;
    enum KeyInput m_lastKeyState;
    ushort hpCurrent;
    ushort hpMax;
    short m_damageTaken;
    short m_sx2c;
    short m_sx2e;
    short m_sx30;
    int field33_0x34;
    int field34_0x38;
    int field35_0x3c;
    int field36_0x40;
    struct FieldObject * m_ptrA9E0_1;
    struct FieldObject * m_ptrA9E0_2;
    byte field39_0x4c[8];
    int field40_0x54;
    int field41_0x58;
    int m_ix5c;
    int field43_0x60;
    int field44_0x64;
    short field45_0x68;
    byte m_battleHandIndexList[6];
};

struct SpriteSubFrame {
    byte objectListIndex;
    byte delay;
    byte flag;
};

struct EntityHeader {
    enum GeneralEntityFlag entityFlags;
    byte routineType;
    enum EntityTag tag;
    byte listIndex;
};

struct ObjectTileAttributes {
    ushort index:10;
    ushort priority:2;
    ushort paletteBank:4;
};

struct Sprite {
    byte indexFrame;
    byte indexSubFrame;
    byte frameDelay;
    byte frameFlags;
    enum SpriteFlag spriteFlags;
    byte srcPalIndex;
    byte palIndexSubFrame;
    byte indexOamList;
    short dstTileOffset;
    short spriteNum;
    short screenX;
    byte portraitScreenY;
    byte screenY;
    byte xyattributes_0;
    byte xyattributes_1;
    byte xyattributes_2;
    byte xyAttributes_3;
    byte tileAttributes_0;
    byte tileAttributes_1;
    short _pad;
    byte * spriteStart;
    struct SpriteFrame * curFrame;
    struct SpriteSubFrame * curSubFrame;
    struct SpriteTilesetHeader * curTilesetHeader;
    int objectDrawBitset;
    uint objectExcludeFlags;
};

struct BattleSpawnAnimation {
    byte m_state0;
    byte _pad0;
    short m_timer0;
    short s1;
    short s2;
};

struct PositionXYZ {
    int X;
    int Y;
    int Z;
};

struct Actor {
    struct EntityHeader m_header;
    byte m_virusFamily;
    byte m_bx05;
    byte m_bx06;
    byte m_bx07;
    byte m_routineState0;
    byte m_routineState1;
    byte m_routineState2;
    byte m_bx0b;
    byte m_bx0c_familyRelated;
    byte m_bx0d;
    byte m_bx0e;
    byte field12_0xf;
    byte m_direction;
    byte m_bx11;
    byte m_indexNumber;
    byte m_enemyId;
    byte m_currFrameIndex;
    byte m_lastFrameIndex;
    byte m_owner;
    byte m_bx17;
    struct Position m_cellPosCurr;
    byte m_element;
    byte m_delayCounter1;
    ushort m_delayCounter2;
    short m_routineCounter;
    ushort m_hpCurrent;
    ushort m_hpMax;
    ushort m_damage;
    short field29_0x26;
    struct PositionXYZ posCurr;
    struct PositionXYZ posLast;
    int field32_0x40;
    int m_ix44;
    int m_ix48;
    int m_ix4c;
    struct PositionXYZ m_px50;
    struct Attack * m_ix5c;
    struct FieldObject * m_fieldObj_0;
    struct FieldObject * m_fieldObj_1;
    struct FieldObject * m_fieldObj_2;
    struct FieldObject * m_fieldObj_3;
    struct FieldObject * m_fieldObj_4;
    struct PlayerBattleState * m_ix74;
    int m_ix78;
    int field45_0x7c;
    struct BattleSpawnAnimation m_appearState;
    int field47_0x88;
    int field48_0x8c;
    struct Sprite m_sprite;
};

struct Tile {
    byte data[32];
};

struct Attack {
    struct EntityHeader m_header;
    byte m_bx04;
    byte field2_0x5;
    byte field3_0x6;
    byte field4_0x7;
    byte m_bx08_state0;
    byte m_stateX;
    byte field7_0xa;
    byte field8_0xb;
    int field9_0xc;
    int field10_0x10;
    byte m_currFrameIndex;
    byte m_lastFrameIndex;
    byte m_owner;
    byte m_bx17;
    struct Position m_cellPosCurr;
    byte m_element;
    byte field17_0x1b;
    short m_sx1c;
    short m_sx1e;
    short m_hpCurrent;
    short m_hpMax;
    ushort m_damage;
    ushort field23_0x26;
    int m_spriteX;
    int m_spriteY;
    int m_hpPositionOffset;
    byte field27_0x34[16];
    int m_nextAttackOffset;
    byte field29_0x48[4];
    int field30_0x4c;
    byte field31_0x50[16];
    void * m_parentEntity;
    struct FieldObject * m_i20_possibleFieldObject;
    struct FieldObject * m_i21_attackFieldObject;
    int field35_0x6c;
    int field36_0x70;
    int field37_0x74;
    int field38_0x78;
    int field39_0x7c;
    struct Sprite m_sprite;
};

struct SpriteTilesetHeader {
    int m_tilesetSize;
    struct Tile m_tiles;
};

typedef struct ActorPlayer ActorPlayer, *PActorPlayer;

typedef enum AttackButtonState {
    On_Up=1,
    On_Right=3,
    On_Down=5,
    On_Left=7,
    On_Dpad=32,
    Toggle_A=128,
    Hold_B=512,
    Toggle_B_Charge=576,
    Toggle_B=2048
} AttackButtonState;

struct ActorPlayer {
    struct EntityHeader m_header;
    byte m_virusFamily;
    byte m_p1;
    byte m_p2;
    byte m_p3;
    byte m_routineState0;
    byte m_routineState1;
    byte m_routineState2;
    byte m_bx4;
    byte m_b00_familyRelated;
    byte m_b01;
    byte m_b2;
    byte b3;
    byte m_direction;
    byte m_b5;
    byte m_indexNumber;
    byte m_enemyId;
    byte m_currFrameIndex;
    byte m_lastFrameIndex;
    byte m_owner;
    byte m_b10;
    struct Position m_cellPosCurr;
    byte m_element;
    byte m_delayCounter1;
    ushort m_delayCounter2;
    short m_routineCounter;
    ushort m_hpCurrent;
    ushort m_hpMax;
    ushort m_damage;
    short is5;
    struct PositionXYZ m_posCurr;
    struct PositionXYZ m_posLast;
    int i11;
    int m_i12;
    int m_i13;
    int m_i14;
    int m_i15;
    int m_i16;
    int m_i17;
    struct Attack * m_i18;
    undefined1 field40_0x60;
    byte m_possibleChipSubfamily;
    undefined1 field42_0x62;
    undefined1 field43_0x63;
    undefined1 field44_0x64;
    undefined1 field45_0x65;
    ushort m_possibleChipFamily;
    undefined1 field47_0x68;
    byte bx69;
    undefined1 field49_0x6a;
    undefined1 field50_0x6b;
    ushort m_flag0;
    ushort m_flag1;
    enum AttackButtonState m_busterButtonState;
    short i23_2;
    struct PlayerBattleState * m_i24;
    int m_i25;
    int i26;
    struct BattleSpawnAnimation m_appearState;
    int i29;
    int i30;
    struct Sprite m_sprite;
};

typedef enum AllocParamEntityType {
    APT_63F0=0,
    APT_Actor=1,
    APT_Attack=2,
    APT_4CD0=3,
    APT_13A0=4
} AllocParamEntityType;

typedef enum AreaId {
    Area_ACDC_Elementary=0,
    Area_ACDC_Town=1,
    Area_Government_Complex=2,
    Area_DenTown=3,
    Area_SciLab_Basement=4,
    Area_WWW_Base=5,
    Area_SchoolComp=128,
    Area_OvenComp=129,
    Area_WaterworksComp=130,
    Area_TrafficLightComp=131,
    Area_Power_Plant_Comp=132,
    Area_WWW_Comp=133,
    Area_ACDC_Homepage=136,
    Area_Government_Complex_Homepage=137,
    Area_DenTown_Homepage=138,
    Area_Government_Complex_Homepage_2=139,
    Area_Other_Comp=140,
    Area_Internet=144
} AreaId;

typedef struct AreaIdPack AreaIdPack, *PAreaIdPack;

struct AreaIdPack {
    enum AreaId areaId;
    byte subAreaId;
};

typedef struct AreaProperties AreaProperties, *PAreaProperties;

typedef enum PanelFlag {
    PF_Walkable=1,
    PF_EnemyTerritory=2,
    PF_Cracked=4,
    PF_Ground=8,
    PF_PlayerOccupied=16,
    PF_EnemyOccupied=32,
    PF_Player=64,
    PF_Enemy=128,
    PF_100=256,
    PF_Hit=512,
    PF_Teleporting=1024,
    PF_Solid=2048,
    PF_PlayerPush=4096,
    PF_EnemyPush=8192,
    PF_Break=16384,
    PF_FieldBlock=32768,
    PF_DieBombExplosion=65536,
    PF_Apple=131072,
    PF_Armor=262144,
    PF_ActorPlayer=524288,
    PF_ActorEnemy=1048576,
    PF_Freeze=2097152,
    PF_Chaser=4194304,
    PF_Numb=8388608,
    PF_Drain=16777216,
    PF_Sealed=33554432,
    PF_Trap=67108864
} PanelFlag;

struct AreaProperties {
    enum PanelFlag data[40];
};

typedef struct AttackParams AttackParams, *PAttackParams;

struct AttackParams {
    struct Position m_position;
    byte m_b00;
    byte m_hp;
};

typedef struct BackgroundDataManager BackgroundDataManager, *PBackgroundDataManager;

typedef struct BGArchive BGArchive, *PBGArchive;

typedef struct BGTilemapArchive BGTilemapArchive, *PBGTilemapArchive;

typedef struct BGPaletteArchive BGPaletteArchive, *PBGPaletteArchive;

typedef struct BGTilesetArchive BGTilesetArchive, *PBGTilesetArchive;

typedef struct Color Color, *PColor;

typedef struct BGTilesetHeader BGTilesetHeader, *PBGTilesetHeader;

struct BackgroundDataManager {
    byte m_mapGridSizeX;
    byte m_mapGridSizeY;
    undefined field2_0x2;
    byte field3_0x3;
    short m_playerX;
    short m_playerY;
    struct BGArchive * m_archivePack;
    struct BGTilemapArchive * m_data;
    struct BGPaletteArchive * m_archive1;
    struct BGTilesetArchive * m_archive0;
    void * m_funcSingleCopy;
    void * m_funcFullCopy;
    void * m_funcSpecificCopy;
};

struct BGArchive {
    struct BGTilesetArchive * m_tilesetData;
    struct BGPaletteArchive * m_paletteData;
    struct BGTilemapArchive * m_tilemapData;
};

struct Color {
    byte R:5;
    byte G:5;
    byte B:5;
    byte fill:1;
};

struct BGPaletteArchive {
    int m_size;
    struct Color m_data[1];
};

struct BGTilemapArchive {
    byte m_mapSizeX;
    byte m_mapSizeY;
    int m_offsetBg1;
    int m_offsetBg2;
    int m_offsetBg3;
};

struct BGTilesetHeader {
    int m_tilesetWordCount;
    int m_offsetLzData;
    int m_offsetVram;
};

struct BGTilesetArchive {
    struct BGTilesetHeader m_vramData[3];
};

typedef enum BackgroundId {
    BG_NumberMan=0,
    BG_FireMan=1,
    BG_IceMan=2,
    BG_ColorMan=3,
    BG_ElecMan=4,
    BG_WWW=5,
    BG_Internet=6,
    BG_Generic=7,
    BG_LanHp=8,
    BG_MaylHp=9,
    BG_YaiHp=10,
    BG_DexHp=11,
    BG_HikariHp=12,
    BG_SalHp=13,
    BG_MiyuHp=14,
    BG_MasaHp=15,
    BG_LifeVirus=16,
    BG_Invalid=255
} BackgroundId;

typedef struct Battle Battle, *PBattle;

typedef enum BattleState {
    BS_EnemySpawned=1,
    BS_InBattle=2,
    BS_4=4
} BattleState;

typedef struct EnemySpawn EnemySpawn, *PEnemySpawn;

typedef enum EnemyId {
    ED_Megaman=0,
    ED_Mettaur1=1,
    ED_Mettaur2=2,
    ED_Mettaur3=3,
    ED_Canodumb1=4,
    ED_Canodumb2=5,
    ED_Canodumb3=6,
    ED_Vulgear=7,
    ED_Vatgear=8,
    ED_Vulgear_X=9,
    ED_Spooky1=10,
    ED_Spooky2=11,
    ED_Spooky3=12,
    ED_Beetank1=13,
    ED_Beetank2=14,
    ED_Beetank3=15,
    ED_Handy1=16,
    ED_Handy2=17,
    ED_Handy3=18,
    ED_Flappy1=19,
    ED_Flappy2=20,
    ED_Flappy3=21,
    ED_Froshell1=22,
    ED_Froshell2=23,
    ED_Froshell3=24,
    ED_HardHead1=25,
    ED_HardHead2=26,
    ED_HardHead3=27,
    ED_Swordy1=28,
    ED_Swordy2=29,
    ED_Swordy3=30,
    ED_Fishy1=31,
    ED_Fishy2=32,
    ED_Fishy3=33,
    ED_Piranha1=34,
    ED_Piranha2=35,
    ED_Piranha3=36,
    ED_AquaPuffy=37,
    ED_HeatPuffy=38,
    ED_27=39,
    ED_ColdBear1=40,
    ED_ColdBear2=41,
    ED_ColdBear3=42,
    ED_Cloudy1=43,
    ED_Cloudy2=44,
    ED_Cloudy3=45,
    ED_Ratty1=46,
    ED_Ratty2=47,
    ED_Ratty3=48,
    ED_Miney1=49,
    ED_Miney2=50,
    ED_Miney3=51,
    ED_Ammonicule1=52,
    ED_Ammonicule2=53,
    ED_Ammonicule3=54,
    ED_Jelly=55,
    ED_HeatJelly=56,
    ED_EarthJelly=57,
    ED_Gaia1=58,
    ED_Gaia2=59,
    ED_Gaia3=60,
    ED_Popper1=61,
    ED_Popper2=62,
    ED_Popper3=63,
    ED_Satella1=64,
    ED_Satella2=65,
    ED_Satella3=66,
    ED_Fanner1=67,
    ED_Fanner2=68,
    ED_Fanner3=69,
    ED_Remobit1=70,
    ED_Remobit2=71,
    ED_Remobit3=72,
    ED_Billy=73,
    ED_Silly=74,
    ED_Killy=75,
    ED_Prog1=76,
    ED_Prog2=77,
    ED_Prog3=78,
    ED_MegalianA=79,
    ED_MegalianH=80,
    ED_MegalianW=81,
    ED_CanDevil1=82,
    ED_CanDevil2=83,
    ED_CanDevil3=84,
    ED_BigSnake1=85,
    ED_BigSnake2=86,
    ED_BigSnake3=87,
    ED_Mosqurito1=88,
    ED_Mosqurito2=89,
    ED_Mosqurito3=90,
    ED_Poitton1=91,
    ED_Poitton2=92,
    ED_Poitton3=93,
    ED_Mole=94,
    ED_5F=95,
    ED_GutsManV1=96,
    ED_GutsManV2=97,
    ED_GutsManV3=98,
    ED_ProtoManV1=99,
    ED_ProtoManV2=100,
    ED_ProtoManV3=101,
    ED_WoodManV1=102,
    ED_WoodManV2=103,
    ED_WoodManV3=104,
    ED_FireManV1=105,
    ED_FireManV2=106,
    ED_FireManV3=107,
    ED_NumberManV1=108,
    ED_NumberManV2=109,
    ED_NumberManV3=110,
    ED_StoneManV1=111,
    ED_StoneManV2=112,
    ED_StoneManV3=113,
    ED_IceManV1=114,
    ED_IceManV2=115,
    ED_IceManV3=116,
    ED_SkullManV1=117,
    ED_SkullManV2=118,
    ED_SkullManV3=119,
    ED_ColorManV1=120,
    ED_ColorManV2=121,
    ED_ColorManV3=122,
    ED_BombManV1=123,
    ED_BombManV2=124,
    ED_BombManV3=125,
    ED_SharkManV1=126,
    ED_SharkManV2=127,
    ED_SharkManV3=128,
    ED_ElecManV1=129,
    ED_ElecManV2=130,
    ED_ElecManV3=131,
    ED_PharaohManV1=132,
    ED_PharaohManV2=133,
    ED_PharaohManV3=134,
    ED_ShadowManV1=135,
    ED_ShadowManV2=136,
    ED_ShadowManV3=137,
    ED_8A=138,
    ED_8B=139,
    ED_8C=140,
    ED_MagicManV1=141,
    ED_MagicManV2=142,
    ED_MagicManV3=143,
    ED_Bass=144,
    ED_91=145,
    ED_92=146,
    ED_LifeVirus=147,
    ED_BlueDummyV1=148,
    ED_RedDummyV1=149,
    ED_BlueDummyV2=150,
    ED_RedDummyV2=151,
    ED_BlueDummyV3=152,
    ED_RedDummyV3=153,
    ED_InvElecMan=154,
    ED_SharkManFinV1=155,
    ED_SharkManFinV2=156,
    ED_SharkManFinV3_0=157,
    ED_SharkManFinV3_1=158,
    ED_SharkManFinV3_2=159,
    ED_SharkManFinV3_3=160,
    ED_Invalid=255
} EnemyId;

struct EnemySpawn {
    enum EnemyId m_id;
    byte m_x;
    byte m_y;
};

struct Battle {
    byte m_state0;
    byte m_state1;
    byte m_state2;
    byte m_state3;
    byte m_bx04;
    byte m_curEnemyCount;
    byte m_playerSpritesSpawned;
    byte m_enemySpritesSpawned;
    byte m_bx08;
    enum BattleState m_battleState;
    byte m_bx0a;
    byte m_maxEnemyCount;
    byte m_bx0c;
    byte m_randomCellSeed;
    byte m_bx0e;
    enum BackgroundId m_backgroundId;
    byte m_customScreenChipCount;
    byte m_customScreenSelectedChipCount;
    byte m_customGaugeSpeed;
    bool m_isInputLocked;
    byte m_bx14;
    byte field21_0x15;
    byte field22_0x16;
    byte m_multipleDeletionCount;
    byte m_bx18;
    byte m_srcBattleHandCount;
    byte m_sioOtherMpId;
    byte m_sioMultiplayerId;
    byte bx1c;
    byte bx1d;
    byte bx1e;
    bool bx1f;
    ushort m_possibleBattleTime;
    ushort m_ux22_counter;
    short m_possibleLastEnemyCount;
    int field35_0x28;
    ushort field36_0x2c;
    ushort m_u2;
    short sx30_counter;
    short field39_0x32;
    int field40_0x34;
    int field41_0x38;
    ushort field42_0x3c;
    ushort m_customGaugeMeter;
    struct Actor * m_entityPlayer[2];
    int field45_0x48;
    byte m_enemyIdSpawnList[8];
    struct Actor * m_enemyEntityList[4];
    byte m_enemyIdList[4];
    uint field49_0x68;
    uint m_bitField00;
    uint m_bitField0;
    struct EnemySpawn * m_enemyList;
    byte m_srcBattleHandIndexList[6];
    byte m_srcBattleHandCodeList[6];
};

typedef struct BattleChip BattleChip, *PBattleChip;

typedef enum ChipId {
    CD_Buster=0,
    CD_Cannon=1,
    CD_HiCannon=2,
    CD_M_Cannon=3,
    CD_Sword=4,
    CD_WideSwrd=5,
    CD_LongSwrd=6,
    CD_LilBomb=7,
    CD_CrosBomb=8,
    CD_BigBomb=9,
    CD_Spreader=10,
    CD_Bubbler=11,
    CD_Heater=12,
    CD_MiniBomb=13,
    CD_Shotgun=14,
    CD_CrossGun=15,
    CD_ShokWave=16,
    CD_SoniWave=17,
    CD_DynaWave=18,
    CD_FireTowr=19,
    CD_AquaTowr=20,
    CD_WoodTowr=21,
    CD_Quake1=22,
    CD_Quake2=23,
    CD_Quake3=24,
    CD_FireSwrd=25,
    CD_ElecSwrd=26,
    CD_AquaSwrd=27,
    CD_GutsPnch=28,
    CD_IcePunch=29,
    CD_FtrSword=30,
    CD_Dash=31,
    CD_KngtSwrd=32,
    CD_HeroSwrd=33,
    CD_MetGuard=34,
    CD_TriArrow=37,
    CD_TriSpear=38,
    CD_TriLance=39,
    CD_Typhoon=40,
    CD_Huricane=41,
    CD_Cyclone=42,
    CD_Howitzer=43,
    CD_Thunder1=44,
    CD_Thunder2=45,
    CD_Thunder3=46,
    CD_Snakegg1=49,
    CD_Snakegg2=50,
    CD_Snakegg3=51,
    CD_Hammer=52,
    CD_BodyBurn=55,
    CD_Ratton1=58,
    CD_Ratton2=59,
    CD_Ratton3=60,
    CD_Lockon1=61,
    CD_Lockon2=62,
    CD_Lockon3=63,
    CD_X_Panel1=64,
    CD_X_Panel3=65,
    CD_Recov10=67,
    CD_Recov30=68,
    CD_Recov50=69,
    CD_Recov80=70,
    CD_Recov120=71,
    CD_Recov150=72,
    CD_Recov200=73,
    CD_Recov300=74,
    CD_Steal=76,
    CD_Geddon1=79,
    CD_Geddon2=80,
    CD_Escape=82,
    CD_Interrupt=83,
    CD_LifeAura=84,
    CD_AquaAura=85,
    CD_FireAura=86,
    CD_WoodAura=87,
    CD_Repair=88,
    CD_Cloud=91,
    CD_Cloudier=92,
    CD_Cloudest=93,
    CD_IceCube=94,
    CD_RockCube=95,
    CD_TimeBom1=97,
    CD_TimeBom2=98,
    CD_TimeBom3=99,
    CD_Invis1=100,
    CD_Invis2=101,
    CD_Invis3=102,
    CD_IronBody=103,
    CD_Remobit1=105,
    CD_Remobit2=106,
    CD_Remobit3=107,
    CD_BstrGard=108,
    CD_BstrBomb=109,
    CD_BstrSwrd=110,
    CD_BstrPnch=111,
    CD_RingZap1=112,
    CD_RingZap2=113,
    CD_RingZap3=114,
    CD_Candle1=115,
    CD_Candle2=116,
    CD_Candle3=117,
    CD_SloGauge=118,
    CD_FstGauge=119,
    CD_Drain1=121,
    CD_Drain2=122,
    CD_Drain3=123,
    CD_Mine1=124,
    CD_Mine2=125,
    CD_Mine3=126,
    CD_Gaia1=127,
    CD_Gaia2=128,
    CD_Gaia3=129,
    CD_BblWrap1=130,
    CD_BblWrap2=131,
    CD_BblWrap3=132,
    CD_Wave=133,
    CD_RedWave=134,
    CD_BigWave=135,
    CD_Muramasa=136,
    CD_Dropdown=137,
    CD_Popup=138,
    CD_Dynamyt1=139,
    CD_Dynamyt2=140,
    CD_Dynamyt3=141,
    CD_Anubis=142,
    CD_IronShld=145,
    CD_LeafShld=146,
    CD_Barrier=147,
    CD_PharoMan=148,
    CD_PharoMn2=149,
    CD_PharoMn3=150,
    CD_ShadoMan=151,
    CD_ShadoMn2=152,
    CD_ShadoMn3=153,
    CD_MagicMan=157,
    CD_MagicMn2=158,
    CD_MagicMn3=159,
    CD_Roll=160,
    CD_Roll2=161,
    CD_Roll3=162,
    CD_GutsMan=163,
    CD_GutsMan2=164,
    CD_GutsMan3=165,
    CD_ProtoMan=166,
    CD_ProtoMn2=167,
    CD_ProtoMn3=168,
    CD_WoodMan=169,
    CD_WoodMan2=170,
    CD_WoodMan3=171,
    CD_FireMan=172,
    CD_FireMan2=173,
    CD_FireMan3=174,
    CD_NumbrMan=175,
    CD_NumbrMn2=176,
    CD_NumbrMn3=177,
    CD_StoneMan=178,
    CD_StoneMn2=179,
    CD_StoneMn3=180,
    CD_IceMan=181,
    CD_IceMan2=182,
    CD_IceMan3=183,
    CD_SkullMan=184,
    CD_SkullMn2=185,
    CD_SkullMn3=186,
    CD_ColorMan=187,
    CD_ColorMn2=188,
    CD_ColorMn3=189,
    CD_BombMan=190,
    CD_BombMan2=191,
    CD_BombMan3=192,
    CD_SharkMan=193,
    CD_SharkMn2=194,
    CD_SharkMn3=195,
    CD_ElecMan=196,
    CD_ElecMan2=197,
    CD_ElecMan3=198,
    CD_Bass=199
} ChipId;

typedef enum ChipCode {
    CC_A=0,
    CC_B=1,
    CC_C=2,
    CC_D=3,
    CC_E=4,
    CC_F=5,
    CC_G=6,
    CC_H=7,
    CC_I=8,
    CC_J=9,
    CC_K=10,
    CC_L=11,
    CC_M=12,
    CC_N=13,
    CC_O=14,
    CC_P=15,
    CC_Q=16,
    CC_R=17,
    CC_S=18,
    CC_T=19,
    CC_U=20,
    CC_V=21,
    CC_W=22,
    CC_X=23,
    CC_Y=24,
    CC_Z=25
} ChipCode;

struct BattleChip {
    enum ChipId chipId;
    enum ChipCode chipCode;
};

typedef struct BattleChipData BattleChipData, *PBattleChipData;

struct BattleChipData {
    byte m_chipCodes[5];
    byte m_elementIndex;
    byte m_possibleChipFamily;
    byte m_possibleChipSubfamily;
    byte m_rarity;
    byte m_libraryIndex;
    byte m_b22;
    byte b33;
    ushort m_damage;
    byte b2;
    byte b3;
    struct Tile * m_icon;
    struct Tile * m_tileset;
    struct Color * m_palette;
};

typedef struct BattleChipInventorySlot BattleChipInventorySlot, *PBattleChipInventorySlot;

struct BattleChipInventorySlot {
    byte m_chipCodeCount[6];
    short m_chipCodeChecksum[5];
};

typedef enum BattleMessage {
    BMsg_BattleStart=0,
    BMsg_EnemyDeleted=1,
    BMsg_MegaManDeleted=2,
    BMsg_ProgramAdvance=3,
    BMsg_04=4,
    BMsg_05=5,
    BMsg_06=6,
    BMsg_07=7,
    BMsg_08=8,
    BMsg_09=9,
    BMsg_0A=10,
    BMsg_0B=11,
    BMsg_MaxMode=12,
    BMsg_Busy=13,
    BMsg_OK=14
} BattleMessage;

typedef enum BattleResultType {
    BRT_Regular=0,
    BRT_MP_Winner=1,
    BRT_MP_Loser=2
} BattleResultType;

typedef enum BattleType {
    BattleType_0_Regular=0,
    BattleType_1_Tutorial1=1,
    BattleType_2_Tutorial2=2,
    BattleType_3_RegularNoResult=3,
    BattleType_4_Tutorial3=4,
    BattleType_5_InvElecMan=5,
    BattleType_6_FinalBoss=6,
    BattleType_7_Boss=7,
    BattleType_8_Save=8,
    BattleType_9=9
} BattleType;

typedef struct BattleUI BattleUI, *PBattleUI;

struct BattleUI {
    byte _unused[3];
    byte m_b3;
    byte m_uiFlag;
    byte m_chipNameWidth;
    byte m_fullChipGaugeAnimationTimer;
    bool m_isCustomGaugeRising;
    ushort m_hpDisplay;
    ushort m_hpActual;
    byte m_buffer[32];
};

typedef enum BattleUiState {
    BUS_01=1,
    BUS_02=2,
    BUS_04=4,
    BUS_08=8,
    BUS_10=16,
    BUS_20_DrawActiveChip=32,
    BUS_40_BustingActive=64,
    BUS_80_BattleActive=128
} BattleUiState;

typedef struct BgControl BgControl, *PBgControl;

struct BgControl {
    ushort bgPriority:2;
    ushort charBaseBlock:2;
    bool isMosaic:1;
    bool is256Color:1;
    ushort screenBaseBlock:5;
    bool isWraparound:1;
    ushort screenSize:2;
};

typedef enum BgControlType {
    BGC_Standard=0,
    BGC_OnlyBg0=1,
    BGC_OnlyBg01=2,
    BGC_All_4bpp=3,
    BGC_OnlyBg012=4,
    BGC_All_8bpp=5,
    BGC_All_Bg3_8bpp=6
} BgControlType;

typedef enum BGMoveControlType {
    BMT_Offline=0,
    BMT_Online=1,
    BMT_Other=2
} BGMoveControlType;

typedef struct BlendSettings BlendSettings, *PBlendSettings;

struct BlendSettings {
    byte m_bldCnt_Target1;
    byte _bldCnt_Target2;
    byte m_bldAlpha_EVA;
    byte _bldAlpha_EVB;
    byte _bldY_EVA;
    byte _pad0;
    ushort m_blendControl;
};

typedef struct CellStatus CellStatus, *PCellStatus;

struct CellStatus {
    int m_panelFlags;
    int i1;
    int i2;
    int i3;
};

typedef struct CgbChannel CgbChannel, *PCgbChannel;

typedef struct MusicPlayerTrack MusicPlayerTrack, *PMusicPlayerTrack;

typedef enum MptFlag {
    MPT_FLAG_VOLSET=1,
    MPT_FLAG_VOLCHG=3,
    MPT_FLAG_PITSET=4,
    MPT_FLAG_PITCHG=12,
    MPT_FLAG_START=64,
    MPT_FLAG_EXIST=128
} MptFlag;

typedef struct SoundChannel SoundChannel, *PSoundChannel;

typedef struct ToneData ToneData, *PToneData;

typedef struct WaveData WaveData, *PWaveData;

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

struct SoundChannel {
    byte status;
    byte type;
    byte rightVolume;
    byte leftVolume;
    byte attack;
    byte delay;
    byte sustain;
    byte release;
    byte key;
    byte envelopeVolume;
    byte envelopeVolumeRight;
    byte envelopeVolumeLeft;
    byte pseudoEchoVolume;
    byte pseudoEchoLength;
    byte dummy1;
    byte dummy2;
    byte gateTime;
    byte midiKey;
    byte velocity;
    byte prpriority;
    byte rhythmPan;
    byte dummy3[3];
    uint count;
    uint fw;
    uint frequency;
    struct WaveData * wav;
    byte * currentPointer;
    struct MusicPlayerTrack * track;
    struct SoundChannel * prevChannelPointer;
    struct SoundChannel * nextChannelPointer;
    uint dummy4;
    ushort xpi;
    ushort xpc;
};

struct ToneData {
    enum InstrumentType type;
    byte key;
    byte length;
    byte pan_sweep;
    struct WaveData * wav;
    byte attack;
    byte decay;
    byte sustain;
    byte release;
};

struct MusicPlayerTrack {
    enum MptFlag flags;
    byte wait;
    byte patternLevel;
    byte repN;
    byte gateTime;
    byte key;
    byte velocity;
    byte runningStatus;
    byte keyM;
    byte pitM;
    byte keyShift;
    byte keyShiftX;
    byte tune;
    byte pitX;
    byte bend;
    byte bendRange;
    byte volMR;
    byte volML;
    byte vol;
    byte volX;
    byte pan;
    byte panX;
    byte modM;
    byte mod;
    byte modT;
    byte lfoSpeed;
    byte lfoSpeecC;
    byte lfoDelay;
    byte lfoDelayC;
    byte priority;
    byte echoVolume;
    byte echoLength;
    struct SoundChannel * chan;
    struct ToneData tone;
    byte gap[10];
    word unk_3A;
    dword unk_3C;
    byte * cmdPtr;
    byte * patternStack[3];
};

struct CgbChannel {
    byte statusFlags;
    byte type;
    byte rightVolume;
    byte leftVolume;
    byte attack;
    byte decay;
    byte sustain;
    byte release;
    byte key;
    byte envelopeVolume;
    byte envelopeGoal;
    byte envelopeCounter;
    byte pseudoEchoVolume;
    byte pseudoEchoLength;
    byte dummy1;
    byte dummy2;
    byte gateTime;
    byte midiKey;
    byte velocity;
    byte priority;
    byte rhythmPan;
    byte dummy3[3];
    byte dummy5;
    byte sustainGoal;
    byte n4;
    byte pan;
    byte panMask;
    byte modify;
    byte length;
    byte sweep;
    int frequency;
    int * wavePointer;
    int * ccurrentPointer;
    struct MusicPlayerTrack * track;
    void * prevChannelPointer;
    void * nextChannelPointer;
    byte dummy4[4];
    int unkPad;
};

struct WaveData {
    word type;
    word status;
    qword freq;
    qword loopStart;
    qword size;
    byte data[1];
};

typedef struct CharTile CharTile, *PCharTile;

struct CharTile {
    byte data[64];
};

typedef struct ChipBagSlot ChipBagSlot, *PChipBagSlot;

struct ChipBagSlot {
    int m_checksum0; /* chipLibraryIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int m_checksum3; /* (libraryIndex, then b22) << 10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int m_checksum1; /* chipCodeIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int m_checksum4; /* damage << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int m_checksum5; /* elementIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int m_checksum2; /* chipQty << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    short m_chipId;
    short m_chipCode;
    int _pad;
};

typedef struct ChipTrader ChipTrader, *PChipTrader;

struct ChipTrader {
    byte m_state0;
    byte m_b1;
    byte b2;
    byte b3;
    byte b4;
    byte b5;
    ushort m_b6;
    ushort m_b8;
    ushort m_b10;
    ushort m_b12;
    ushort m_b14;
    ushort m_b16;
    ushort m_b18;
    ushort m_b20;
    ushort m_b22;
    ushort m_b23;
    byte b24;
    byte b25;
    byte b26;
    byte b27;
    byte b28;
    byte b29;
    byte b30;
    byte b33;
    byte b34;
    byte b35;
    byte b36;
    byte b37;
    byte b38;
    byte b39;
    byte b40;
    byte b41;
    byte b42;
    byte b43;
    byte b44;
    byte b45;
    byte b46;
    byte b47;
    byte b48;
    byte b49;
    byte b50;
    byte b51;
    byte b52;
    byte b53;
    byte b54;
    byte b55;
    ushort m_b56;
    byte b58;
    byte b59;
    byte b60;
    byte b61;
    byte b62;
    byte b63;
};

typedef struct CpuSetControl CpuSetControl, *PCpuSetControl;

struct CpuSetControl {
    int wordCount:21;
    int _pad0:3;
    bool isSrcFixed:1;
    bool _pad1:1;
    bool is32Bit:1;
};

typedef struct Credits Credits, *PCredits;

struct Credits {
    byte m_mainState;
    byte m_b1;
    byte m_b2_column;
    byte b3;
    short m_s0_counter;
    byte b6;
    byte b7;
    byte m_b8_dictIndex;
    byte m_hourCounter;
    byte m_minuteCounter;
    byte bB;
    byte m_currentChipCount;
    byte m_maxChipCount;
    byte m_currentLevel;
    byte bF;
};

typedef struct CursorAttributes CursorAttributes, *PCursorAttributes;

struct CursorAttributes {
    sbyte offX;
    sbyte offY;
    short attribute;
};

typedef struct CustomScreen CustomScreen, *PCustomScreen;

typedef enum FuncState {
    FS_0=0,
    FS_1=4,
    FS_2=8,
    FS_3=12,
    FS_4=16
} FuncState;

typedef struct TilemapEntry TilemapEntry, *PTilemapEntry;

struct TilemapEntry {
    short tileIndex:10;
    short flipFlags:2;
    short paletteBank:4;
};

struct CustomScreen {
    enum FuncState m_state0;
    enum FuncState m_state1;
    enum FuncState m_state2;
    enum FuncState m_state3;
    byte m_chipX;
    byte m_chipY;
    byte m_selectedChipIndices[5];
    byte m_selectedChipCount;
    bool m_isDeckEmpty;
    byte m_b9;
    byte b10;
    bool m_isAddSelected;
    byte m_cursorAnimationCounter;
    byte b13;
    byte m_b14;
    byte m_b15;
    byte m_priorState1_2;
    byte m_selectedChipConditions[5];
    bool m_updateInput;
    byte m_isLogoAnimating;
    byte m_logoAnimationCounter;
    byte b25;
    byte b26;
    byte b27;
    word m_chipSelectSlideCounter;
    byte b30;
    byte b31;
    short m_chipSelectWindowHofs;
    byte b32;
    byte b33;
    byte other[16];
    enum KeyInput toggleKeyState;
    enum KeyInput heldKeyState;
    short m_unused;
    short m_s3;
    byte m_chipSelectionOrder[15];
    struct TilemapEntry m_layoutBuffer[300];
};

typedef struct DebugString DebugString, *PDebugString;

struct DebugString {
    byte X;
    byte Y;
    char str[1];
};

typedef struct Demo Demo, *PDemo;

typedef enum Demo_State_0 {
    D_State_0_State0=0,
    D_State_0_State1=4,
    D_State_0_State2_InitializeGame=8
} Demo_State_0;

typedef enum Demo_State_1 {
    D_State_1_State0=0,
    D_State_1_State1=4,
    D_State_1_State2=8,
    D_State_1_State3=12,
    D_State_1_State4=16,
    D_State_1_State5=20
} Demo_State_1;

struct Demo {
    enum Demo_State_0 m_state0;
    enum Demo_State_1 m_state1;
    byte m_b2;
    byte _pad0;
    short m_demoMessageTimer;
    byte m_b6;
    byte _pad1;
};

typedef enum DispCnt {
    DISPCNT_MODE0=0,
    DISPCNT_MODE1=1,
    DISPCNT_MODE2=2,
    DISPCNT_MODE3=3,
    DISPCNT_MODE4=4,
    DISPCNT_MODE5=5,
    DISPCNT_FRMSEL=16,
    DISPCNT_HFREE=32,
    DISPCNT_OMAP1D=64,
    DISPCNT_FORCEBLANK=128,
    DISPCNT_BG0=256,
    DISPCNT_BG1=512,
    DISPCNT_BG2=1024,
    DISPCNT_BG3=2048,
    DISPCNT_BGALL=3840,
    DISPCNT_OBJ=4096,
    DISPCNT_WIN0=8192,
    DISPCNT_WIN1=16384,
    DISPCNT_OBJWIN=32768
} DispCnt;

typedef struct DisplaySettings DisplaySettings, *PDisplaySettings;

struct DisplaySettings {
    enum DispCnt dispcnt;
    ushort pad;
    struct BgControl bg0Cnt;
    struct BgControl bg1Cnt;
    struct BgControl bg2Cnt;
    struct BgControl bg3Cnt;
    ushort bg0Hofs;
    ushort bg0Vofs;
    ushort bg1Hofs;
    ushort bg1Vofs;
    ushort bg2Hofs;
    ushort bg2Vofs;
    ushort bg3Hofs;
    ushort bg3Vofs;
};

typedef struct DmaChannel DmaChannel, *PDmaChannel;

typedef enum DmaCntFlag {
    DMA_DEST_DEC=2097152,
    DMA_DEST_FIXED=4194304,
    DMA_SRC_DEC=8388608,
    DMA_SRC_FIXED=16777216,
    DMA_REPEAT=33554432,
    DMA_32BIT=67108864,
    DMA_DREQ_ON=134217728,
    DMA_START_VBLANK=268435456,
    DMA_START_HBLANK=536870912,
    DMA_INTR_ENABLE=1073741824,
    DMA_ENABLE=2147483648
} DmaCntFlag;

struct DmaChannel {
    void * srcAddress;
    void * dstAddress;
    enum DmaCntFlag control;
};

typedef struct DmaChannelList DmaChannelList, *PDmaChannelList;

struct DmaChannelList {
    struct DmaChannel * dma0;
    struct DmaChannel * dma1;
    struct DmaChannel * dma2;
    struct DmaChannel * dma3;
};

typedef struct DmaTransferDetail DmaTransferDetail, *PDmaTransferDetail;

struct DmaTransferDetail {
    void * startAddress;
    void * endAddress;
    uint wordCount;
};

typedef struct DmaTransferParams DmaTransferParams, *PDmaTransferParams;

struct DmaTransferParams {
    void * start_address;
    void * end_address;
    uint word_count;
    enum DmaCntFlag control;
};

typedef enum Elementid {
    EL_None=0,
    EL_Elec=1,
    EL_Fire=2,
    EL_Water=3,
    EL_Wood=4
} Elementid;

typedef struct EncounterInfo EncounterInfo, *PEncounterInfo;

struct EncounterInfo {
    byte m_threshold;
    bool m_isBoss;
    struct EnemySpawn * m_enemyList;
};

typedef struct EnemyDetail EnemyDetail, *PEnemyDetail;

typedef struct Struct_8009DFD4_Sub Struct_8009DFD4_Sub, *PStruct_8009DFD4_Sub;

struct Struct_8009DFD4_Sub {
    short r0;
    short r1;
};

struct EnemyDetail {
    ushort m_hp;
    enum Elementid m_element;
    byte m_hpPosition;
    byte m_routineType;
    byte m_lzSpriteIndex;
    short _pad;
    int m_virusFamily;
    struct Struct_8009DFD4_Sub m_dropTable[5];
};

typedef struct EntityAllocParams EntityAllocParams, *PEntityAllocParams;

struct EntityAllocParams {
    enum AllocParamEntityType m_entityFuncIndex;
    byte m_param0;
    byte field2_0x2;
    byte field3_0x3;
    int m_param1;
    int m_param2;
    int m_param3;
    int m_param4;
};

typedef union EntityBehavior EntityBehavior, *PEntityBehavior;

typedef struct PlayerChipState PlayerChipState, *PPlayerChipState;

struct PlayerChipState {
    byte b0;
    byte b1;
    byte m_usedBattleChipType;
    byte m_battleChipState;
};

union EntityBehavior {
    struct PlayerChipState playerChipState;
    struct FieldObject * fieldEntity;
};

typedef struct EntityBounds EntityBounds, *PEntityBounds;

struct EntityBounds {
    short X;
    short Y;
    short Z;
    byte m_deltaDist;
    byte m_deltaZ;
    uint _ux8;
    uint m_idMask;
    uint * m_paramPtr;
};

typedef enum EntityFlag {
    EF_1=1,
    EF_2=2
} EntityFlag;

typedef enum EntityFuncFlag {
    GFF_None=0,
    GFF_63F0=1,
    GFF_Actor=2,
    GFF_Attack=4,
    GFF_4CD0=8,
    GFF_NPC=16,
    GFF_All=31
} EntityFuncFlag;

typedef union EntityUnion0 EntityUnion0, *PEntityUnion0;

typedef struct PlayerSpec2 PlayerSpec2, *PPlayerSpec2;

struct PlayerSpec2 {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
};

union EntityUnion0 {
    struct Attack * possibleAttack;
    struct PlayerSpec2 possiblePlayerSpec;
};

typedef struct FadeSettings FadeSettings, *PFadeSettings;

typedef enum FadeType {
    FT_None=0,
    FT_FadeInFromWhite=1,
    FT_FadeOutToWhite=2,
    FT_FadeInFromBlack=3,
    FT_FadeOutToBlack=4,
    FT_FadeInFromBlackExceptSpritesBG0=5,
    FT_DarkenExceptSpritesBG0=6,
    FT_FadeInFromBlackExceptBG0=7,
    FT_FadeOutToBlackExceptBG0=8,
    FT_FadeInFromWhiteExceptBG0=9,
    FT_FadeOutToWhiteExceptBG0=10,
    FT_FadeInFromBlackExceptBG3=11,
    FT_DarkenExceptBG3=12,
    FT_FadeInAlphaBlendBG0=13,
    FT_FadeOutAlphaBlendBG0=14
} FadeType;

struct FadeSettings {
    bool m_isApplyFadeFunc;
    enum FadeType m_fadeType;
    byte m_fadeStep;
    bool m_isFadeActive;
    bool m_isFadeStarted;
    byte _pad[3];
};

typedef struct FixedBattleSettings FixedBattleSettings, *PFixedBattleSettings;

struct FixedBattleSettings {
    struct EnemySpawn * m_enemyDetail;
    struct BattleChip * m_presetFolder;
    enum BackgroundId m_backgroundId;
    enum BattleType m_battleType;
    bool m_isFolderShuffle;
    byte pos3;
    int pos0;
    int pos1;
    int pos2;
    bool m_isEscapable;
    byte _pad19[3];
};

typedef enum Flag_400 {
    F400_Unescapable=8,
    F400_SaveOk=9
} Flag_400;

typedef struct FrameCounter FrameCounter, *PFrameCounter;

struct FrameCounter {
    ushort m_counter;
    ushort _pad;
};

typedef enum FrameFlag {
    FF_None=0,
    FF_04=4,
    FF_08=8,
    FF_10=16,
    FF_Loop=64,
    FF_End=128
} FrameFlag;

typedef struct GameOver GameOver, *PGameOver;

struct GameOver {
    enum FuncState m_state;
    byte _pad0[3];
    ushort m_gameOverTimer;
    byte m_unused;
    byte _pad1;
};

typedef struct GameStats GameStats, *PGameStats;

struct GameStats {
    byte field0_0x0;
    byte m_bxx1;
    byte field2_0x2;
    byte m_bxx3;
    byte m_b0;
    byte m_b1;
    ushort field6_0x6;
    ushort field7_0x8;
    byte field8_0xa;
    byte field9_0xb;
    byte field10_0xc;
    byte m_b5;
    byte totalAwardedChips;
    byte totalBattles8;
    short totalStepCounter;
    ushort totalBattles16;
    ushort multiBattleTotal;
    ushort multiBattleWins;
    int gameTimer;
    int inBattleTimer;
    int checkSum;
    int currStepCounter;
    int lastStepCounter;
    byte buildId[14];
};

typedef struct header header, *Pheader;

struct header {
    byte logo[156];
    char title[12];
    char game_code[4];
    char maker_code[2];
    byte fixed;
    byte main_unit_code;
    byte device_type;
    byte reserved[7];
    byte version;
    byte comp_check;
    byte reserved_2[2];
};

typedef struct Input Input, *PInput;

struct Input {
    enum KeyInput curKeyState;
    enum KeyInput toggleKeyState;
    enum KeyInput heldKeyState;
    enum KeyInput lastKeyState;
    byte framesHeldA;
    byte framesHeldB;
    byte framesHeldSelect;
    byte framesHeldStart;
    byte framesHeldRight;
    byte framesHeldLeft;
    byte framesHeldUp;
    byte framesHeldDown;
    byte framesHeldR;
    byte framesHeldL;
    byte unused;
    byte frameCounter;
};

typedef enum ItemId {
    Item_PET=0,
    Item_IceBlock=1,
    Item_WaterGun=2,
    Item_SchoolID=3,
    Item_SciLabID=4,
    Item_Handle=5,
    Item_Message=6,
    Item_Response=7,
    Item_WWWPin=8,
    Item_BatteryA=9,
    Item_BatteryB=10,
    Item_BatteryC=11,
    Item_BatteryD=12,
    Item_BatteryE=13,
    Item_Charger=14,
    Item_WWWPass=15,
    Item_Dentures=17,
    Item_KeyMayl=33,
    Item_KeyYai=34,
    Item_KeyDex=35,
    Item_KeyDad=37,
    Item_KeySal=38,
    Item_KeyMiyu=40,
    Item_KeyMasa=43,
    Item_KeyWWW=45,
    Item_SlashDex=48,
    Item_SlashSal=49,
    Item_SlashMiyu=50,
    Item_HigMemo=52,
    Item_LabMemo=53,
    Item_YuriMemo=54,
    Item_PaMemo=55,
    Item_AcdcPass=60,
    Item_GovtPass=61,
    Item_TownPass=62,
    Item_HpMemory=64,
    Item_PowerUp=65,
    Item_Armor=66,
    Item_HeatArmr=68,
    Item_AquaArmr=69,
    Item_WoodArmr=70
} ItemId;

typedef struct Main Main, *PMain;

typedef struct Manager Manager, *PManager;

typedef struct World World, *PWorld;

typedef struct Struct_Unk14_Sized Struct_Unk14_Sized, *PStruct_Unk14_Sized;

typedef struct Struct_Unk24 Struct_Unk24, *PStruct_Unk24;

typedef struct Scene Scene, *PScene;

typedef struct Struct_Unk2C Struct_Unk2C, *PStruct_Unk2C;

typedef struct Transition Transition, *PTransition;

typedef struct MainMenu MainMenu, *PMainMenu;

typedef struct WindowSettings WindowSettings, *PWindowSettings;

typedef struct Text Text, *PText;

typedef struct Struct_Unk4C Struct_Unk4C, *PStruct_Unk4C;

typedef struct Struct_Unk54 Struct_Unk54, *PStruct_Unk54;

typedef struct Struct_Unk58 Struct_Unk58, *PStruct_Unk58;

typedef struct ScreenTilemapContainer ScreenTilemapContainer, *PScreenTilemapContainer;

typedef struct PetStatusControl PetStatusControl, *PPetStatusControl;

typedef struct Struct_Unk64_Sized Struct_Unk64_Sized, *PStruct_Unk64_Sized;

typedef struct TextUI TextUI, *PTextUI;

typedef struct Struct_Unk6C Struct_Unk6C, *PStruct_Unk6C;

typedef struct Shop Shop, *PShop;

typedef struct Menu Menu, *PMenu;

typedef struct Struct_Unk7C Struct_Unk7C, *PStruct_Unk7C;

typedef enum Manager_State {
    MS_MainMenu=0,
    MS_World=4,
    MS_Battle=8,
    MS_Transition=12,
    MS_Demo=16,
    MS_Splash=20,
    MS_Menu=24,
    MS_Shop=28,
    MS_GameOver=32,
    MS_ChipTrader=36,
    MS_Credits=40
} Manager_State;

typedef enum StoryFlag {
    FLAG_STORY_NEW_GAME=0,
    FLAG_STORY_TUTORIAL_START=1,
    FLAG_STORY_TUTORIAL_END=2,
    FLAG_STORY_OVEN_FIRE=3,
    FLAG_STORY_OVEN_EXPLODE=4,
    FLAG_STORY_WATER_GUN=5,
    FLAG_STORY_DELETE_FIREMAN=6,
    FLAG_STORY_FIREMAN_BED=16,
    FLAG_STORY_CLASS_TALK=17,
    FLAG_STORY_DEX_TALK=18,
    FLAG_STORY_DOOR_1_UNLOCK=19,
    FLAG_STORY_DOOR_3_UNLOCK=20,
    FLAG_STORY_MEGAMAN_CAPTURE=21,
    FLAG_STORY_DELETE_NUMBERMAN=32,
    FLAG_STORY_CONDUCTOR_TALK=33,
    FLAG_STORY_DELETE_STONEMAN=34,
    FLAG_STORY_DAD_POWERUP=35,
    FLAG_STORY_SCHOOL_CANCEL=36,
    FLAG_STORY_SCILAB_NIGHT=37,
    FLAG_STORY_POLAR_BEAR=38,
    FLAG_STORY_TRUNK_FIND=39,
    FLAG_STORY_DELETE_ICEMAN=48,
    FLAG_STORY_TRAFFIC_LIGHTS=49,
    FLAG_STORY_LIGHT_1_FIX=50,
    FLAG_STORY_EXPOSE_WWW=51,
    FLAG_STORY_LIGHT_2_FIX=52,
    FLAG_STORY_LIGHT_3_FIX=53,
    FLAG_STORY_LIGHT_4_FIX=54,
    FLAG_STORY_LIGHT_5_FIX=55,
    FLAG_STORY_DELETE_COLORMAN=64,
    FLAG_STORY_COUNT_ZAP=65,
    FLAG_STORY_CONTROL_ROOM=66,
    FLAG_STORY_BATTERIES_DONE=67,
    FLAG_STORY_DELETE_PROTOMAN=80,
    FLAG_STORY_DELETE_DOOR_VIRUS=81,
    FLAG_STORY_DELETE_BOMBMAN=82,
    FLAG_STORY_BOMBMAN_BED=83,
    FLAG_STORY_FINAL=84
} StoryFlag;

typedef enum SongId {
    T_Theme_Of_Mega_Man_Battle_Network=0,
    T_Home_Town=1,
    T_In_The_Room=2,
    T_Suspicious_Mood=3,
    T_Incident_Occurrence=4,
    T_Transmission=5,
    T_Fire_Field=6,
    T_Running_Through_the_Cyber_World=7,
    T_Boundless_Network=8,
    T_Hour_of_Fate=9,
    T_Cold_and_Silent=10,
    T_Red_or_Blue=11,
    T_Electrical_Crisis=12,
    T_Void=13,
    T_Operation=14,
    T_Net_Battle=15,
    T_Vs_Life_Virus=16,
    T_Winner=17,
    T_Game_Over=18,
    T_End_Roll=19,
    T_School=20,
    T_Loser=21,
    SE_Driving=22,
    SE_17=23,
    SE_18=24,
    SE_19=25,
    SE_1A=26,
    SE_1B=27,
    SE_1C=28,
    SE_1D=29,
    SE_1E=30,
    SE_1F=31,
    SE_20=32,
    SE_21=33,
    SE_22=34,
    SE_23=35,
    SE_24=36,
    SE_25=37,
    SE_26=38,
    SE_27=39,
    SE_28=40,
    SE_29=41,
    SE_2A=42,
    SE_2B=43,
    SE_2C=44,
    SE_2D=45,
    SE_2E=46,
    SE_2F=47,
    SE_30=48,
    SE_31=49,
    SE_32=50,
    SE_33=51,
    SE_34=52,
    SE_35=53,
    SE_36=54,
    SE_37=55,
    SE_38=56,
    SE_39=57,
    SE_3A=58,
    SE_3B=59,
    SE_3C=60,
    SE_3D=61,
    SE_3E=62,
    SE_3F=63,
    SE_40=64,
    SE_41=65,
    SE_42=66,
    SE_43=67,
    SE_44=68,
    SE_45=69,
    SE_46=70,
    SE_47=71,
    SE_48=72,
    SE_49=73,
    SE_4A=74,
    SE_4B=75,
    SE_4C=76,
    SE_4D=77,
    SE_4E=78,
    SE_4F=79,
    SE_50=80,
    SE_51=81,
    SE_52=82,
    SE_53=83,
    SE_54=84,
    SE_55=85,
    SE_56=86,
    SE_57=87,
    SE_58=88,
    SE_59=89,
    SE_5A=90,
    SE_5B=91,
    SE_5C=92,
    SE_5D=93,
    SE_5E=94,
    SE_5F=95,
    SE_60=96,
    SE_61=97,
    SE_62=98,
    SE_63=99,
    SE_Confirmation=100,
    SE_Text_Character=101,
    SE_Option_Select=102,
    SE_Option_Confirm=103,
    SE_Option_Cancel=104,
    SE_Battle_ChipSelectMoveCursor=105,
    SE_Battle_ChipSelectAccept=106,
    SE_Battle_ChipSelectCancel=107,
    SE_Battle_ChipSelectNotAllowed=108,
    SE_Battle_ChipSelectOK=109,
    SE_Battle_BusterShoot=110,
    SE_Battle_BusterHitConfirm=111,
    SE_SmallExplosion=112,
    SE_Battle_DamageTaken=113,
    SE_72=114,
    SE_Battle_MegamanDeletion=115,
    SE_74=116,
    SE_75=117,
    SE_76=118,
    SE_77=119,
    SE_Teleport_Out=120,
    SE_Teleport_in=121,
    SE_7A=122,
    SE_7B=123,
    SE_7C=124,
    SE_7D=125,
    SE_7E=126,
    SE_7F=127,
    SE_80=128,
    SE_81=129,
    SE_82=130,
    SE_83=131,
    SE_84=132,
    SE_MysteryDataItemGet=133,
    SE_PET_Notification=134,
    SE_87=135,
    SE_88=136,
    SE_89=137,
    SE_8A=138,
    SE_8B=139,
    SE_8C=140,
    SE_8D=141,
    SE_8E=142,
    SE_8F=143,
    SE_90=144,
    SE_91=145,
    SE_Battle_EnemyAppearance=146,
    SE_93=147,
    SE_94=148,
    SE_95=149,
    SE_96=150,
    SE_97=151,
    SE_98=152,
    SE_99=153,
    SE_9A=154,
    SE_9B=155,
    SE_9C=156,
    SE_9D=157,
    SE_School_Bell=158,
    SE_9F=159,
    SE_A0=160,
    SE_A1=161,
    SE_DoorOpen=162,
    SE_Walking=163,
    SE_Dog_Howl=164,
    SE_Typing=165,
    SE_CarSlowDown=166,
    SE_CarSpeedUp=167,
    SE_A8=168,
    SE_A9=169,
    SE_AA=170,
    SE_AB=171,
    SE_AC=172,
    SE_AD=173,
    SE_Bubbling=174,
    SE_AF=175,
    SE_B0=176,
    SE_SmallPip=177,
    SE_B2=178,
    SE_B3=179,
    SE_B4=180,
    SE_Battle_BusterCharging=181,
    SE_B6=182,
    SE_Battle_Tossing=183,
    SE_CarTires=184,
    SE_CarCrash=185,
    SE_EncounterStart2=186,
    SE_BB=187,
    SE_BC=188,
    SE_BD=189,
    SE_Battle_ChipSelectOpen=190,
    SE_TrainMoving=191,
    SE_C0=192,
    SE_TrainDeparture=193,
    SE_C2=194,
    SE_C3=195,
    SE_C4=196,
    SE_C5=197,
    SE_C6=198,
    SE_Battle_EncounterStart=199,
    SE_Battle_CustomGaugeFull=200,
    SE_WindWhoosh=201,
    SE_RewardSquareReveal=202,
    SE_RewardZenny=203,
    SE_RewardBattleChip=204,
    SE_CD=205,
    SE_CE=206,
    SE_CF=207,
    SE_D0=208,
    SE_D1=209,
    SE_D2=210,
    SE_D3=211,
    SE_D4=212,
    SE_D5=213,
    SE_D6=214,
    SE_D7=215,
    SE_D8=216,
    SE_D9=217,
    SE_DA=218,
    SE_DB=219,
    SE_DC=220,
    SE_DD=221,
    SE_DE=222,
    SE_DF=223,
    SE_E0=224,
    SE_E1=225,
    SE_E2=226,
    SE_E3=227,
    SE_E4=228,
    SE_Dialogue_Pip=229,
    SE_E6=230,
    SE_E7=231,
    SE_E8=232,
    SE_E9=233,
    SE_EA=234,
    SE_EB=235,
    SE_EC=236,
    SE_ED=237,
    T_NoSong=255
} SongId;

typedef struct PlayerLocation PlayerLocation, *PPlayerLocation;

typedef struct Struct_83BA4 Struct_83BA4, *PStruct_83BA4;

typedef enum TextStateDelayType {
    TSDT_NoDelay=0,
    TSDT_DelayCounter=1,
    TSDT_WaitForButtonPress=2
} TextStateDelayType;

typedef struct Struct_Unk4C_Sub Struct_Unk4C_Sub, *PStruct_Unk4C_Sub;

typedef enum MoveType {
    MT_Standing=0,
    MT_Walking=1,
    MT_Running=2
} MoveType;

typedef struct MapOffsetStruct MapOffsetStruct, *PMapOffsetStruct;

struct Struct_Unk2C {
    byte m_b0;
    byte field1_0x1;
    byte field2_0x2;
    byte m_bx03_direction;
    struct PositionXYZ m_bx04_pos;
    int m_bx10;
    void * m_bx14;
    byte field7_0x18;
    byte field8_0x19;
    byte field9_0x1a;
    byte field10_0x1b;
    byte field11_0x1c;
    byte field12_0x1d;
    byte field13_0x1e;
    byte field14_0x1f;
};

struct Struct_Unk4C_Sub {
    byte m_state0;
    byte b1;
    byte m_battleChipIndex;
    byte m_b3;
    bool m_isActive;
    enum BattleMessage m_messageIndex;
    byte m_scaleIndex;
    byte m_delay;
    byte m_affineIndex;
    byte b9;
    byte bA;
    byte bb;
    short m_bC;
    short m_bE;
};

struct ScreenTilemapContainer {
    struct TilemapEntry screen0[1024];
    struct TilemapEntry screen1[1024];
    struct TilemapEntry screen2[1024];
    struct TilemapEntry screen3[1024];
};

struct Manager {
    enum Manager_State m_gameState;
    byte field1_0x1;
    byte field2_0x2;
    byte field3_0x3;
    byte m_softResetDelayTimer;
    byte field5_0x5;
    byte field6_0x6;
    byte field7_0x7;
};

struct World {
    byte m_state0;
    byte field1_0x1;
    byte field2_0x2;
    byte field3_0x3;
    enum AreaId m_currentArea;
    byte m_currentSubArea;
    enum StoryFlag m_storyFlag;
    byte m_bx07_fadeType;
    byte field8_0x8;
    byte m_Battle_IsTimePaused;
    byte m_bx0a;
    enum BackgroundId m_bx0b_backgroundId;
    byte m_lastArea;
    byte m_lastSubArea;
    byte m_bx0e;
    enum BattleType m_battleType;
    byte m_bx10_state;
    bool m_isShuffleFolder;
    byte m_bx12_commentaryTextIndex;
    byte m_bx13_fadeStep;
    byte m_statAttack;
    byte m_statSpeed;
    byte m_statCharge;
    byte m_armor;
    enum SongId m_Song_CurrentSongId;
    byte m_bustingRank;
    byte m_bx1a;
    byte m_bx1b;
    ushort hpCurrent;
    ushort hpMax;
    int field30_0x20;
    int m_ix24;
    struct PlayerLocation * playerLocation;
    struct EnemySpawn * m_enemyList;
    struct BattleChip * m_chipFolder;
    void * m_npcCommandList;
    struct PositionXYZ savedPos;
    int savedDirection;
    struct PositionXYZ field38_0x48;
    int field39_0x54;
    int field40_0x58;
    struct PositionXYZ field41_0x5c;
    int field42_0x68;
    int field43_0x6c;
    void * m_updatingEntity;
    int m_zenny;
};

struct Struct_Unk6C {
    byte other[20];
};

struct MapOffsetStruct {
    struct PositionXYZ posCurr;
    struct PositionXYZ posLast;
};

struct PlayerLocation {
    struct EntityHeader m_header;
    byte b4;
    byte b5;
    byte b6;
    byte m_b7;
    byte m_b8_state;
    byte m_stateMoveType;
    byte m_stateMoveUpdate;
    byte m_b11;
    byte m_b12;
    byte m_b13;
    byte m_b14;
    byte m_b15;
    byte direction; /* 0-7, 0= up, clockwise */
    byte m_b17_direction2;
    enum MoveType moveType;
    enum MoveType lastMoveType;
    byte currDirMoveIndex; /* 8-F = walking, 10-17 = runnning */
    byte lastDirMoveIndex;
    byte b22;
    byte m_b23;
    int i0;
    ushort m_s0;
    ushort s1;
    int i1;
    struct MapOffsetStruct mapOffset;
    int m_isMovementBlocked;
    int m_deltaX;
    int m_deltaY;
    int m_i11;
    int i12;
    int i13;
    int i14;
    int m_stepCounter;
    int i16;
    ushort m_s4_moveKeyFlags;
    ushort m_s5;
    int i17;
    int i18;
    int i19;
    int i20;
    int i21;
    int i22;
    int i23;
    struct Sprite m_sprite;
};

struct MainMenu {
    enum FuncState m_state0;
    byte m_state1;
    byte unk2;
    byte unk3;
    ushort m_timerCapcomLogo;
    byte unk6;
    byte unk7;
    byte m_unk8_isSavePresent;
    byte unk9;
    byte unk10;
    byte m_unk11_isSavePresent;
    byte unk12;
    byte unk13;
    byte unk14;
    byte unk15;
};

struct Struct_Unk4C {
    struct Struct_Unk4C_Sub m_data[16];
};

struct Struct_Unk24 {
    enum FuncState b0;
    byte b1;
    byte b2;
    byte b3;
    byte b4;
    byte b5;
    byte b6;
    byte b7;
    int i2;
    int i3;
};

struct Struct_83BA4 {
    byte field0_0x0;
    byte field1_0x1;
    byte field2_0x2;
    byte field3_0x3;
    byte field4_0x4;
    byte field5_0x5;
    byte field6_0x6;
    byte field7_0x7;
    byte field8_0x8;
    byte field9_0x9;
    byte field10_0xa;
    byte field11_0xb;
    byte field12_0xc;
    byte field13_0xd;
    byte field14_0xe;
    byte field15_0xf;
    byte m_textBlockIndex;
    byte m_flagVal0;
    byte field18_0x12;
    byte field19_0x13;
};

struct Menu {
    byte m_state0;
    byte m_state1;
    byte ib2;
    byte ib3;
    byte m_chipid;
    byte m_chipCode;
    byte b2;
    byte m_isShowChipDetail;
    struct BattleChipData * m_chipData;
    byte m_libraryStandardChipCount;
    byte Library_SubListOffset1;
    byte Library_ListOffset0;
    byte Library_ListOffset1;
    ushort totalChipCount;
    ushort m_FolderSubOffset0;
    ushort m_FolderSubOffset1;
    ushort m_FolderOffset0;
    ushort m_FolderOffset1;
    short m_sx3;
    ushort m_sx4;
    short m_sx5;
    ushort m_sx6;
    short m_sx7;
    ushort m_totalChipCount2;
    ushort m_st1;
    ushort m_ixx0;
    ushort m_ix1;
    int ix2;
    int ix3;
    int ix4;
    int ix5;
    short m_ixs0;
    short ixs1;
    int ix7;
    short m_sxx0;
    short sxx1;
    int ix9; /* ` */
    int m_chipDetailX;
    int m_chipDetailY;
};

struct WindowSettings {
    uint winH01;
    uint winV01;
    uint winInOut;
};

struct PetStatusControl {
    byte field0_0x0;
    byte field1_0x1;
    byte field2_0x2;
    byte field3_0x3;
    byte funcOffset;
    byte petAnimCounter;
    byte alertAnimCounter;
    byte alertAudioCounter;
};

struct Struct_Unk64_Sized {
    void * p0;
    byte m_b0;
    byte m_b1;
    byte m_b2;
    byte m_b3;
    byte m_ux0;
    byte m_ux1;
    ushort u1;
    byte x4;
    byte x5;
    byte x6;
    byte x7;
    byte m_b4;
    byte m_b5;
    byte m_b6;
    byte b7;
    byte m_b8;
    byte m_b9;
    byte m_b10;
    byte m_b11;
    byte b12;
    byte b13;
    byte b14;
    byte b15;
};

struct Struct_Unk14_Sized {
    short field0_0x0;
    enum BGMoveControlType m_bgMovementControl;
    byte m_bx03;
    short m_playerPosX;
    short m_playerPosY;
    short m_lastPlayerPosX;
    short m_lastPlayerPosY;
    short m_ixs0;
    short ixs1;
    struct PositionXYZ * m_px10;
    int m_xLowerBound;
    int m_xUpperBound;
    int m_yUpperBound;
    int m_yLowerBound;
    int m_i6;
    int m_i7;
    struct PositionXYZ m_posMapSaved;
    struct PositionXYZ m_posMap;
};

struct Text {
    bool m_isWriteText;
    byte m_textBlockIndex;
    byte m_textBufferOffset;
    byte m_scriptOptions;
    enum TextStateDelayType m_dialogDelayType;
    byte m_isScriptJump;
    byte m_counter1;
    byte m_portraitPalIndex;
    byte m_nextDelay;
    byte m_commandParseDelay;
    byte m_nextAnimationIndex;
    byte m_currAnimationIndex;
    ushort m_dialogDelayCounter;
    byte m_textCol;
    byte m_textRow;
    byte m_layoutLineOffset;
    byte m_scriptParseDelay;
    byte m_dialogSkipDelay;
    byte m_charShade;
    byte m_b14;
    byte m_b15_optionFlag;
    byte m_b16;
    byte m_b17;
    enum KeyInput m_curKeyState;
    enum KeyInput m_heldKeyState;
    enum KeyInput m_toggleKeyState;
    byte m_dialogArrowAnimCycle;
    byte m_arrowAnimFrame;
    byte * m_commandTextPointer;
    ushort * m_textBlockPointer;
    byte * m_layoutTextPointer;
    struct TilemapEntry * m_dialogLayout;
    uint m_itemIdList[4];
    void * m_textPointerAfterKeyPrint;
    void * m_otherTextPointerAfterKeyPrint;
    byte m_possibleBcdBuffer[12];
    byte m_tempPlayerDirection;
    byte b19;
    byte b20;
    byte b21;
    ushort m_textBufIndex;
    ushort m_otherTempTextBufIndex;
    struct Sprite m_portrait;
};

struct Scene {
    enum FuncState m_state0;
    byte field1_0x1;
    byte m_bx02;
    byte field3_0x3;
    byte m_dialogueIndex;
    byte m_areaDialogueIndex;
    byte field6_0x6;
    byte field7_0x7;
    ushort m_delayCounter;
    ushort flag1;
    void * m_scenePointer;
    struct Struct_83BA4 * m_px10;
    struct Scene * m_px14;
    void * m_px18;
    struct Actor * m_px1c_actor;
    int field15_0x20;
    int field16_0x24;
    int field17_0x28;
    int field18_0x2c;
};

struct Struct_Unk7C {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
    byte b4;
    byte b5;
    byte b6;
    byte b7;
    byte b8;
    byte b9;
    byte b10;
    byte b11;
    byte b12;
    byte b13;
    byte b14;
    byte b15;
    byte b16;
    byte b17;
    byte b18;
    byte b19;
    byte b20;
    byte b21;
    byte b22;
    byte b23;
    byte b24;
    byte b25;
    byte b26;
    byte b27;
    byte b28;
    byte b29;
    byte b30;
    byte b31;
    byte b32;
    byte b33;
    byte b34;
    byte b35;
    byte b36;
    byte b37;
    byte b38;
    byte b39;
};

struct Shop {
    byte m_off0;
    byte b0;
    byte b1;
    byte b2;
    byte b3;
    byte m_b4;
    byte m_shopMenuArrowPosV;
    byte m_b6;
    byte m_b7;
    byte m_b8;
    byte m_shopClerkType;
    byte b10;
    ushort m_menuPosSlideOut;
    ushort s1;
    int m_zenny;
    int i6;
    int i7;
};

struct Struct_Unk58 {
    byte m_b0;
    byte m_b1;
    ushort m_b2;
    int * m_b4;
    int * m_b8;
    void * m_endAddr;
    int m_count;
    byte m_b20;
    byte u0;
    byte u1;
    byte u2;
};

struct Transition {
    byte m_state0;
    byte m_state1;
    byte m_animationFrames;
    byte b1;
    struct Struct_83BA4 * b2;
};

struct Main {
    struct Manager * manager;
    struct Input * input;
    struct World * world;
    struct Battle * battle;
    struct DisplaySettings * display;
    struct Struct_Unk14_Sized * unk_14;
    struct FadeSettings * fade;
    struct BattleUI * battleUi;
    struct PlayerBattleState * playerBattleState;
    struct Struct_Unk24 * unk_24;
    struct Scene * scene;
    struct Struct_Unk2C * unk_2C;
    struct Transition * transition;
    struct MainMenu * mainMenu;
    struct WindowSettings * window;
    struct BlendSettings * blend;
    struct Demo * demo;
    struct BackgroundDataManager * bgMapLoader;
    struct Text * text;
    struct Struct_Unk4C * unk_4C;
    struct FrameCounter * frameCounter;
    struct Struct_Unk54 * unk_54;
    struct Struct_Unk58 * unk_58;
    struct ScreenTilemapContainer * screens;
    struct PetStatusControl * petStatusControl;
    struct Struct_Unk64_Sized * unk_64;
    struct TextUI * unk_68;
    struct Struct_Unk6C * unk_6C;
    struct Shop * shop;
    struct Menu * menu;
    struct GameStats * gameStats;
    struct Struct_Unk7C * unk_7C;
};

struct Struct_Unk54 {
    int m_state0;
    byte m_b4_possibleId;
    byte m_b5_possibleAlteredGaugeSpeed;
    byte m_b6;
    byte m_isDim;
    short m_timer;
};

struct TextUI {
    byte m_textWidth;
    byte m_totalTextLength;
    byte m_charShade;
    byte pad;
    uint m_numberBuffer[4];
};

typedef struct MapDataHeader MapDataHeader, *PMapDataHeader;

struct MapDataHeader {
    int m_boundaryDataOffset;
    int m_elevationDataOffset;
    int m_coverDataOffset;
    int m_eventDataOffset;
};

typedef struct MapOffset MapOffset, *PMapOffset;

struct MapOffset {
    int m_posX;
    int m_posY;
};

typedef struct MapParameters MapParameters, *PMapParameters;

typedef struct WallSegment WallSegment, *PWallSegment;

typedef struct WallParameters WallParameters, *PWallParameters;

struct WallSegment {
    short m_gridIndex;
    short m_wallParamPtr;
};

struct WallParameters {
    byte m_zCoord;
    byte m_attributes;
    byte m_zRange;
    byte m_shape;
};

struct MapParameters {
    struct WallSegment * m_wallSegmentStart;
    short m_wallSegmentCount;
    short m_gridIndex;
    byte m_gridSize_X;
    byte m_gridSize_Y;
    byte m_unknownIndex;
    byte m_b1;
    int m_posXWhole;
    int m_posYWhole;
    struct WallParameters * m_wallParam;
};

typedef struct MapWallSectionHeader MapWallSectionHeader, *PMapWallSectionHeader;

struct MapWallSectionHeader {
    int m_segmentCount;
    struct WallSegment m_wallSegments[1];
};

typedef struct MapWallSegment MapWallSegment, *PMapWallSegment;

struct MapWallSegment {
    struct WallSegment m_wallSegment;
    struct MapOffset m_position;
    int _pad;
};

typedef struct MovementOffset MovementOffset, *PMovementOffset;

struct MovementOffset {
    byte m_directionMovementIndex;
    byte b0;
    short s0;
    int m_offsetX;
    int m_offsetY;
};

typedef struct MusicPlayer MusicPlayer, *PMusicPlayer;

typedef struct MusicPlayerInfo MusicPlayerInfo, *PMusicPlayerInfo;

typedef struct SongHeader SongHeader, *PSongHeader;

typedef enum MusicPlayerStatus {
    MUSICPLAYER_STATUS_TRACK=65535,
    MUSICPLAYER_STATUS_PAUSE=2147483648
} MusicPlayerStatus;

struct SongHeader {
    byte trackCount;
    byte blockCount;
    byte priority;
    byte reverb;
    struct ToneData * tone;
    byte * part[1];
};

struct MusicPlayer {
    struct MusicPlayerInfo * info;
    struct MusicPlayerTrack * track;
    byte trackCount;
    word unk_A;
};

struct MusicPlayerInfo {
    struct SongHeader * songHeader;
    enum MusicPlayerStatus status;
    byte trackCount;
    byte priority;
    byte cmd;
    byte unk_B;
    dword clock;
    byte gap[8];
    byte * memAccArea;
    word tempoD;
    word tempoU;
    word tempoI;
    word tempoC;
    word fadeOI;
    word fadeOC;
    word fadeOV;
    struct MusicPlayerTrack * tracks;
    struct ToneData * tone;
    uint ident;
    uint func;
    uint intp;
};

typedef struct NPC NPC, *PNPC;

typedef struct PositionByteXYZ PositionByteXYZ, *PPositionByteXYZ;

struct PositionByteXYZ {
    byte m_X;
    byte m_Y;
    byte m_Z;
};

struct NPC {
    struct EntityHeader m_header;
    byte m_posIncrementCount;
    byte m_stepsToTake;
    undefined1 field3_0x6;
    byte m_bx07_state;
    byte m_bx08;
    byte m_bx09_moveState;
    byte m_bx0a_moveCalcState;
    byte m_bx0b;
    byte m_bx0c;
    byte m_bx0d;
    byte currDirection;
    byte lastDirection;
    byte m_npcIndex;
    struct PositionByteXYZ posSub;
    byte currFrameIndex;
    byte lastFrameIndex;
    byte paletteIndex;
    byte m_bx17;
    byte m_bx18_commandControl_1;
    byte m_scriptStatus;
    undefined1 field21_0x1a;
    undefined1 field22_0x1b;
    byte m_bx1b_areaDialogIndex;
    byte m_bx1d;
    byte m_bx1e;
    byte m_bx1f;
    short m_moveDeltaCount;
    short field28_0x22;
    struct PositionXYZ posCurr;
    struct PositionXYZ posNext;
    short currSpriteIndex;
    short lastSpriteIndex;
    struct PositionXYZ m_posDelta;
    int m_npcIdFlag;
    int m_currentCommand;
    int m_ix54;
    int m_movementFlags;
    void * m_commandListStart;
    int m_ix60_priority;
    int currObjExcludeFlags;
    int lastObjExcludeFlags;
    int m_nextX;
    int m_nextY;
    byte data1[28];
    struct Sprite sprite;
};

typedef struct OamAddObjectArgs OamAddObjectArgs, *POamAddObjectArgs;

typedef struct ObjectXYAttributes ObjectXYAttributes, *PObjectXYAttributes;

struct ObjectXYAttributes {
    byte yCoord;
    bool isRotScale:1;
    int specialFlag:1;
    int objMode:2;
    bool isMosaic:1;
    int colorType:1;
    int objShape:2;
    int xCoord2:9;
    int flipType2:5;
    int objSize2:2;
};

struct OamAddObjectArgs {
    struct ObjectXYAttributes m_xyAttrs;
    struct ObjectTileAttributes m_tileAttrs;
    int m_listIndex;
    int m_listOffset;
};

typedef struct OamAttributeListNode OamAttributeListNode, *POamAttributeListNode;

struct OamAttributeListNode {
    struct ObjectXYAttributes m_xyDetails;
    struct ObjectTileAttributes m_tileDetail;
    byte m_unused;
    byte m_nextIndex;
};

typedef struct ObjectAffineAttributes ObjectAffineAttributes, *PObjectAffineAttributes;

struct ObjectAffineAttributes {
    short m_pa;
    short m_pb;
    short m_pc;
    short m_pd;
    byte m_angle;
    byte m_scaleX;
    byte m_scaleY;
};

typedef struct ObjectControl ObjectControl, *PObjectControl;

struct ObjectControl {
    struct ObjectXYAttributes m_xyDetails;
    struct ObjectTileAttributes m_tileDetails;
    short m_affineDetails;
};

typedef struct ObjectEntryFlag0 ObjectEntryFlag0, *PObjectEntryFlag0;

struct ObjectEntryFlag0 {
    byte m_objSize:2;
    bool m_isHFlip:1;
    bool m_isVFlip:1;
};

typedef struct PlayerMpState PlayerMpState, *PPlayerMpState;

struct PlayerMpState {
    byte bx00;
    byte m_possibleChipId;
    enum KeyInput curKeys;
    enum KeyInput toggledKeys;
    enum KeyInput heldKeys;
    enum KeyInput lastKeys;
    short field6_0xa;
    int packetCounter;
};

typedef struct PositionLong PositionLong, *PPositionLong;

struct PositionLong {
    int m_X;
    int m_Y;
};

typedef struct PositionShort PositionShort, *PPositionShort;

struct PositionShort {
    short m_x;
    short m_y;
};

typedef enum RelationFlag {
    RF_NoRelation=0,
    RF_SameID=1,
    RF_SameCode=2,
    RF_Free=3
} RelationFlag;

typedef enum ScriptOption {
    TS_BreakLoop=1,
    TS_ShowPortrait=2,
    TS_Unskippable_Script=4,
    TS_08=8,
    TS_DrawArrow=16,
    TS_PasscodeEntry=32,
    TS_40=64,
    TS_Skip_Text_Sound=128
} ScriptOption;

typedef struct SioControl SioControl, *PSioControl;

struct SioControl {
    byte SioCnt_Lo;
    byte SioCnt_Hi;
    ushort siomlt_send;
};

typedef struct Song Song, *PSong;

struct Song {
    struct SongHeader * header;
    word ms;
    word me;
};

typedef struct SoundInfo SoundInfo, *PSoundInfo;

struct SoundInfo {
    uint ident;
    byte pcmDmaCounter;
    byte reverb;
    byte maxChans;
    byte masterVolume;
    byte freq;
    byte mode;
    byte c15;
    byte pcmDmaPeriod;
    byte maxLines;
    byte gap[3];
    int pcmSamplesPerVBlank;
    int pcmFreq;
    int divFreq;
    struct CgbChannel * cgbChans;
    void (* MPlayMainHead)(struct MusicPlayerInfo *);
    struct MusicPlayerInfo * musicPlayerHead;
    void (* CgbSound)(void);
    void (* CgbOscOff)(byte);
    int (* MidiKeyToCgbFreq)(byte, byte, byte);
    void (* MPlayJumpTable)(void);
    void (* plynote)(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
    void (* ExtVolPit)(void);
    byte gap2[16];
    struct SoundChannel chans[12];
    byte pcmBuffer[3168];
};

typedef struct SpriteAnimParam SpriteAnimParam, *PSpriteAnimParam;

struct SpriteAnimParam {
    short m_spriteIndex;
    short m_spriteFrame;
};

typedef struct SpriteArchive_AnimDataHeader SpriteArchive_AnimDataHeader, *PSpriteArchive_AnimDataHeader;

struct SpriteArchive_AnimDataHeader {
    int m_ptrGraphicSz;
    int m_ptrPalSz;
    int m_ptrJunk;
    int m_ptrOam;
};

typedef struct SpriteArchive_AnimFrameData SpriteArchive_AnimFrameData, *PSpriteArchive_AnimFrameData;

struct SpriteArchive_AnimFrameData {
    byte m_delay;
    byte unk0;
    byte m_frameType;
    byte unk1;
};

typedef struct SpriteArchive_Header SpriteArchive_Header, *PSpriteArchive_Header;

struct SpriteArchive_Header {
    byte unk0;
    byte magic0;
    byte magic1;
    byte m_numSprites;
    byte data[1];
};

typedef struct SpriteHeader SpriteHeader, *PSpriteHeader;

struct SpriteHeader {
    byte m_unk0;
    byte unk1;
    byte unk2;
    byte m_animationCount;
};

typedef enum SpriteIndex {
    SP_Battle_MegaMan=0,
    SP_Battle_Mettaur=1,
    SP_Battle_WoodMan=2,
    SP_Overworld_Lan=3,
    SP_Overworld_MegaMan=8,
    SP_Overworld_BrownCar=13,
    SP_Overworld_Mayl=15,
    SP_Battle_Canodumb=16,
    SP_Battle_FireMan=17,
    SP_Overworld_LanBed=18,
    SP_Battle_Vulgear=20,
    SP_Battle_Beetank=31,
    SP_Battle_Spooky=32,
    SP_Battle_Flappy=33,
    SP_Battle_GutsMan=34,
    SP_Battle_NumberMan=36,
    SP_Battle_HardHead=37,
    SP_Battle_Fishy=38,
    SP_Battle_IceMan=42,
    SP_Battle_StoneMan=58,
    SP_Battle_Piranha=59,
    SP_Battle_Froshell=63,
    SP_Battle_SkullMan=70,
    SP_Battle_Popper=76,
    SP_Battle_MagicMan=81,
    SP_Battle_Megalian=83,
    SP_Battle_SharkMan=89,
    SP_Battle_ShadowMan=98,
    SP_Battle_Mole=101,
    SP_Battle_LifeVirus=104,
    SP_Attack_Sword=108,
    SP_Attack_Cannon=109,
    SP_BattleObject_MiniBomb=110,
    SP_BattleEffect_MetGuard=111,
    SP_BattleObject_Barrier=112,
    SP_BattleEffect_LifeVirusCharging=114,
    SP_BattleEffect_XPanel=116,
    SP_BattleObject_BurnerBomb=117,
    SP_BattleObject_FireTower=118,
    SP_BattleEffect_FireArm=119,
    SP_BattleEffect_SwordSlash=121,
    SP_BattleObject_AquaTower=123,
    SP_BattleObject_WoodTower=125,
    SP_BattleEffect_PanelGrab=126,
    SP_BattleObject_Seed=135,
    SP_BattleObject_IceBlock_Emerging=137,
    SP_BattleObject_StoneBlock=139,
    SP_Attack_FireSwrd=146,
    SP_Attack_ElecSwrd=147,
    SP_Attack_AquaSwrd=148,
    SP_Attack_GutsPnch=149,
    SP_BattleObject_IceBlock=150,
    SP_BattleEffect_Freeze=157,
    SP_BattleObject_Aura=182,
    SP_BattleObject_BubbleShield=185,
    SP_BattleObject_LeafShield=186,
    SP_BattleObject_Scuttlest=197,
    SP_Effect_LifeVirusAura=200,
    SP_Effect_ShortExplosion=206,
    SP_Overworld_StudentDesk1=208,
    SP_Effect_ArmorHit=212,
    SP_BattleEffect_MiniBombExplosion=215,
    SP_BattleEffect_ShotgunBurst=216,
    SP_BattleEffect_BusterHit=217,
    SP_Effect_TallExplosion=218,
    SP_Effect_CanodumbTarget=220,
    SP_Overworld_HouseControlPanel=223,
    SP_BattleEffect_Recover=230,
    SP_Effect_TeleportMove=231,
    SP_BattleEffect_PanelBreak=245,
    SP_Effect_SwordStrike=248,
    SP_Effect_FireHit=249,
    SP_Effect_ElecHit=250,
    SP_Effect_AquaHit=251,
    SP_Effect_WoodHit=252
} SpriteIndex;

typedef struct SpriteList SpriteList, *PSpriteList;

struct SpriteList {
    byte * header;
    int length;
};

typedef struct SpriteLzDetails SpriteLzDetails, *PSpriteLzDetails;

struct SpriteLzDetails {
    byte m_spriteCount;
    byte _pad[3];
    short m_indexList[8];
    struct SpriteArchive_Header * m_spritePtrList[8];
    void * m_next;
};

typedef struct SpriteObjectEntry SpriteObjectEntry, *PSpriteObjectEntry;

struct SpriteObjectEntry {
    byte tileNumber;
    sbyte x;
    sbyte y;
    byte flag1;
    byte flag2;
};

typedef enum SpriteType {
    D0_Desk=208
} SpriteType;

typedef struct SRFREturn SRFREturn, *PSRFREturn;

struct SRFREturn {
    int newY;
    int newX;
};

typedef struct Struct_2000000 Struct_2000000, *PStruct_2000000;

struct Struct_2000000 {
    int i0;
    int i1;
    int i2;
    short is2;
    short is0;
    short is3;
    void * is1;
    short is4;
    int x0;
    int i7;
    int i8;
    int i9;
    byte other1[72];
    byte ba0[16];
    short s0;
    short s1;
    byte other2[8];
};

typedef struct Struct_2002070 Struct_2002070, *PStruct_2002070;

struct Struct_2002070 {
    int ix0;
    byte i1[8];
    byte pad0[148];
};

typedef struct Struct_20062d0_Sized Struct_20062d0_Sized, *PStruct_20062d0_Sized;

struct Struct_20062d0_Sized {
    byte m_b0;
    byte m_b1;
    byte m_b2;
    byte m_b3_state;
    ushort m_u0_counter;
    ushort m_u1;
    byte b4;
    byte b5;
    byte m_b6;
    byte b7;
    byte b8;
    byte b9;
    byte b10;
    byte b11;
};

typedef struct Struct_2007200 Struct_2007200, *PStruct_2007200;

struct Struct_2007200 {
    struct SpriteTilesetHeader * m_spriteTilesetPointer;
    uint u1;
};

typedef struct Struct_200C240 Struct_200C240, *PStruct_200C240;

struct Struct_200C240 {
    struct MapOffsetStruct m_mapOffset;
    int i7;
    int m_i4_yCoordRelated;
    int m_i5;
    short s0;
    short s1;
    int i8;
    int i9;
    int i10;
};

typedef struct Struct_2A3C_In Struct_2A3C_In, *PStruct_2A3C_In;

struct Struct_2A3C_In {
    short _pad0;
    short m_posX;
    short _pad1;
    short m_posY;
    short _pad2;
    short m_offsetY;
};

typedef struct Struct_4CD0 Struct_4CD0, *PStruct_4CD0;

struct Struct_4CD0 {
    struct EntityHeader m_header;
    enum BattleResultType m_possibleBattleResultType;
    byte m_floatingNumWidth;
    bool m_isPrintFloatingNum;
    byte field4_0x7;
    enum FuncState m_state0;
    enum FuncState m_state1;
    enum FuncState m_state2;
    enum FuncState m_state3;
    byte m_bustingRank;
    byte m_scoreRank;
    byte m_rewardChipId;
    byte m_rewardChipCode;
    int field13_0x10;
    byte m_currFrameIndex;
    byte m_lastFrameIndex;
    byte m_owner;
    byte bx17;
    byte field18_0x18;
    byte field19_0x19;
    byte field20_0x1a;
    byte bx1b;
    ushort m_rewardRevealDelayCounter;
    short field23_0x1e;
    int field24_0x20;
    int field25_0x24;
    int m_possibleBg3X;
    int m_possibleBg3Y;
    int ix30;
    int field29_0x34;
    int field30_0x38;
    int field31_0x3c;
    int field32_0x40;
    int field33_0x44;
    int field34_0x48;
    int field35_0x4c;
    int field36_0x50;
    int field37_0x54;
    int field38_0x58;
    int field39_0x5c;
    int m_floatingNumRealValue;
    int m_floatingNumBcdValue;
    byte m_floatingNumBcdBytes[8];
    int m_unkX;
    int m_unkY;
    struct Actor * m_entityPtr;
    int field46_0x7c;
    struct Sprite m_sprite;
};

typedef struct Struct_807091C Struct_807091C, *PStruct_807091C;

struct Struct_807091C {
    byte m_spriteIndex;
    byte m_frameIndex;
    short valC;
};

typedef struct Struct_C1C0 Struct_C1C0, *PStruct_C1C0;

struct Struct_C1C0 {
    byte bx00;
    byte bx01;
    byte m_attack;
    byte gPossibleBustingRank;
    byte gPossibleDropChipId;
    byte gPossibleDropChipCode;
    undefined2 field6_0x6;
    undefined field7_0x8;
    bool isAddSelect;
    byte m_randomCellSeed;
    byte m_armor;
    int _pad;
};

typedef struct Struct_C1F0_Packet Struct_C1F0_Packet, *PStruct_C1F0_Packet;

struct Struct_C1F0_Packet {
    short id;
    short checksum;
    struct PlayerMpState playerInputInfo;
    int field3_0x14;
};

typedef struct Struct_Enemy Struct_Enemy, *PStruct_Enemy;

struct Struct_Enemy {
    byte data[176];
};

typedef struct Struct_MysteryDictR7 Struct_MysteryDictR7, *PStruct_MysteryDictR7;

struct Struct_MysteryDictR7 {
    enum AreaId m_areaId;
    byte m_subAreaId;
    byte b2;
    byte b3;
    int i2;
    void * npcCommandListList;
    short * * spriteAreaList;
    struct EntityAllocParams * m_entityAllocList;
    void (* m_funcPreLoop)(void);
    void (* m_funcHblank)(void);
    void (* m_funcPostLoop)(void);
};

typedef struct Struct_Ret_23AC Struct_Ret_23AC, *PStruct_Ret_23AC;

struct Struct_Ret_23AC {
    int m_ret0;
    int m_ret1;
    int m_ret2;
};

typedef struct Struct_UnknownBGHeader Struct_UnknownBGHeader, *PStruct_UnknownBGHeader;

struct Struct_UnknownBGHeader {
    void * m_dataSrc;
    int m_wordCount;
    byte b0;
    byte m_b1;
    byte b2;
    byte b3;
    int i0;
    int m_i1;
};

typedef struct Struct_UnkSio Struct_UnkSio, *PStruct_UnkSio;

typedef struct Struct_UnkSio_48 Struct_UnkSio_48, *PStruct_UnkSio_48;

struct Struct_UnkSio_48 {
    byte field0_0x0[72];
};

struct Struct_UnkSio {
    byte activeFlag;
    byte bx01;
    byte bx02;
    byte bx03_bitset;
    int ix04;
    undefined field5_0x8;
    bool isMpError;
    byte bx0a;
    byte bx0b;
    undefined field9_0xc;
    undefined field10_0xd;
    undefined field11_0xe;
    undefined field12_0xf;
    undefined field13_0x10;
    undefined field14_0x11;
    undefined field15_0x12;
    undefined field16_0x13;
    int ix14_counter;
    int ix18[4];
    struct Struct_C1F0_Packet * px28_buffer0;
    struct Struct_C1F0_Packet * px2c_buffer1;
    struct Struct_UnkSio_48 * ilx30[4];
    struct Struct_UnkSio_48 * ilx40[4];
    struct PlayerMpState * vlx50[4];
    struct Struct_C1F0_Packet playerInput_A;
    struct Struct_C1F0_Packet playerInput_B;
    struct Struct_UnkSio_48 listx90[4];
};

typedef struct SubMenuChipBagSlot SubMenuChipBagSlot, *PSubMenuChipBagSlot;

struct SubMenuChipBagSlot {
    ushort m_chipId;
    ushort m_indexChipCode;
    ushort m_chipCodeChecksum;
    ushort m_chipCodeCount;
};

typedef struct Swi_Div_Result Swi_Div_Result, *PSwi_Div_Result;

struct Swi_Div_Result {
    int quotient;
    int modulus;
    int positiveQuotient;
};

typedef struct TextDst TextDst, *PTextDst;

struct TextDst {
    byte * dstAddressTextBuf;
    byte * dstAddressVram;
};

typedef enum TextOption {
    TF_AllOptions=15,
    TF_Unused=16,
    TF_Flag_20=32,
    TF_DisableInput=64,
    TF_ClearDialogBox=128
} TextOption;

typedef struct Tile8 Tile8, *PTile8;

struct Tile8 {
    byte data[64];
};

typedef struct TilemapReturn TilemapReturn, *PTilemapReturn;

struct TilemapReturn {
    int m_t0;
    int m_t1;
    int m_t2;
};

typedef enum TimerControl {
    TIMER_1CLK=0,
    TIMER_64CLK=1,
    TIMER_256CLK=2,
    TIMER_1024CLK=3,
    TIMER_INTR_ENABLE=64,
    TIMER_ENABLE=128
} TimerControl;

typedef struct TransferDetail_1799C TransferDetail_1799C, *PTransferDetail_1799C;

struct TransferDetail_1799C {
    void * srcAddress;
    int length;
    struct Color * paletteSrc;
    void * dstAddress;
};

typedef struct TransferDetail_1F700 TransferDetail_1F700, *PTransferDetail_1F700;

struct TransferDetail_1F700 {
    void * srcAddress;
    void * dstAddress;
};

typedef struct TransferStruct TransferStruct, *PTransferStruct;

struct TransferStruct {
    void * srcAddress;
    void * endAddress;
    int len;
};

typedef struct TryChipSelectResult TryChipSelectResult, *PTryChipSelectResult;

struct TryChipSelectResult {
    byte canBeSelected;
    enum RelationFlag relationToPriorChip;
};

typedef unsigned short    wchar16;
typedef enum WaitDmaFlag {
    Dma0=1,
    Dma1=2,
    Dma2=4,
    Dma3=8
} WaitDmaFlag;

#endif
