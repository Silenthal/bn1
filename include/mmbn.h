#ifndef MMBN_H
#define MMBN_H

typedef unsigned char    bool;
typedef unsigned char    byte;
typedef unsigned int    dword;
typedef unsigned long long    qword;
typedef char    sbyte;
typedef unsigned int    uint;
typedef unsigned long    ulong;
typedef unsigned short    ushort;
typedef unsigned short    word;
#define __WORDSIZE 32

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

typedef struct Struct_200A9E0 Struct_200A9E0, *PStruct_200A9E0;

typedef enum Flag_A9E0 {
    F9_1=1,
    F9_4=2,
    F9_2=4
} Flag_A9E0;

typedef struct Position Position, *PPosition;

struct Position {
    byte m_X;
    byte m_Y;
};

union _ix9 {
    struct Struct_200A9E0 * m_ix9_a9E0;
    byte m_data[4];
};

struct Struct_200A9E0 {
    enum Flag_A9E0 m_b0;
    byte m_idNum;
    struct Position m_cellPosCurr;
    struct Position m_cellPosLast;
    byte m_b4;
    byte m_routineType;
    short m_s1_maybeDamage;
    short pad;
    int m_i0_panelRelated;
    int m_idFlag;
    int m_i2;
};

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
    PF_4=4
} PanelFlag;

struct AreaProperties {
    enum PanelFlag data[40];
};

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

typedef struct AttackCell AttackCell, *PAttackCell;

typedef struct Entity Entity, *PEntity;

typedef struct Sprite Sprite, *PSprite;

typedef struct Struct_Unk20 Struct_Unk20, *PStruct_Unk20;

typedef struct Entity_AppearState Entity_AppearState, *PEntity_AppearState;

typedef enum SpriteFlag {
    SF_NoMiniAnimation=1,
    SF_TilesetLoaded=2,
    SF_4=4,
    SF_8=8,
    SF_10=16,
    SF_20=32
} SpriteFlag;

typedef struct ObjectTileAttributes ObjectTileAttributes, *PObjectTileAttributes;

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

struct Entity_AppearState {
    byte m_state0;
    byte _pad0;
    short m_timer0;
    short s1;
    short s2;
};

struct ObjectTileAttributes {
    ushort index:10;
    ushort priority:2;
    ushort paletteBank:4;
};

struct Sprite {
    byte m_indexFrame;
    byte m_indexSubFrame;
    byte m_frameDelay;
    byte m_frameFlags;
    enum SpriteFlag m_spriteFlags;
    byte m_srcPalIndex;
    byte m_palIndexSubFrame;
    byte m_indexOamList;
    short m_dstTileOffset;
    short m_u0;
    short m_posX;
    byte m_b7_lineOffRelated[2];
    short m_u2;
    byte m_u3_affineRelated_Lo;
    byte m_u3_affineRelated_Hi;
    struct ObjectTileAttributes m_tileAttributes;
    short _pad;
    byte * m_spriteStart;
    byte * m_curFrame;
    byte * m_curSubFrame;
    void * m_curTilesetHeader;
    int m_i0;
    uint m_b11;
};

struct Entity {
    byte m_b0;
    byte m_routineType;
    byte m_ub1;
    byte m_ub2;
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
    byte m_b7;
    byte m_b8;
    byte m_b9_possiblePlayerId;
    byte m_b10;
    struct Position m_cellPosCurr;
    byte m_b13;
    byte m_delayCounter1;
    ushort m_delayCounter2;
    short m_routineCounter;
    short m_hpCurrent;
    short m_hpMax;
    short m_is4_possibleDamage;
    short is5;
    int m_possibleSpriteX;
    int m_possibleSpriteY;
    int m_ix2;
    short m_i8;
    short m_possibleSpriteX_2;
    short m_i9;
    short m_possibleSpriteY_2;
    int m_i10;
    int i11;
    int m_i12;
    int m_i13;
    int m_i14;
    int m_i15;
    int m_i16;
    int m_i17;
    struct AttackCell * m_i18;
    struct Struct_200A9E0 * m_ix19_A9E0;
    byte bx0;
    byte bx1;
    byte m_usedBattleChipType;
    byte m_battleChipState;
    short m_i21_1;
    short m_i21_2;
    struct AttackCell * m_i22_possibleAttack;
    enum AttackButtonState m_busterButtonState;
    short i23_2;
    struct Struct_Unk20 * m_i24;
    int m_i25;
    int i26;
    struct Entity_AppearState m_appearState;
    int i29;
    int i30;
    struct Sprite m_sprite;
};

struct AttackCell {
    byte m_b0;
    byte m_routineType;
    byte b2;
    byte m_listIndex;
    byte m_b00;
    byte b01;
    byte b02;
    byte b06;
    byte m_b01_state0;
    byte m_stateX;
    byte b03;
    byte b04;
    int data0;
    int i0;
    byte m_attackSpriteFrame;
    byte i03;
    byte m_owner;
    byte i05;
    byte m_cellX;
    byte m_cellY;
    byte m_element;
    byte b10;
    short m_s1;
    short m_s2;
    int i4;
    ushort m_damage;
    ushort us2;
    int m_spriteX;
    int m_spriteY;
    int m_i3;
    byte data1[16];
    int m_nextAttackOffset;
    byte data2[4];
    int m_unkInt;
    byte data3[16];
    struct Entity * m_parentEntity;
    struct Struct_200A9E0 * m_i20;
    int i21;
    int i22;
    int i23;
    int i24;
    int i25;
    int i26;
    struct Sprite m_sprite;
};

struct Struct_Unk20 {
    byte m_invulnerableTime;
    byte m_chipsUsedCount;
    byte m_moveCount;
    byte m_hitsTaken;
    byte m_b1;
    byte m_b2;
    byte m_lastChipElement;
    byte m_ux1;
    byte m_b3;
    byte m_statAttack;
    byte m_statSpeed;
    byte m_statCharge;
    byte m_b7;
    byte m_b8;
    byte m_b9;
    byte m_b10_armor;
    short m_busterChargeLevel;
    short m_busterChargeDamage;
    short m_busterChargeDelay;
    short m_pb3;
    short m_lastChipDamage;
    short m_pb5;
    short m_pb6;
    enum KeyInput m_curKeyState;
    enum KeyInput m_toggleKeyState;
    short m_s4;
    enum KeyInput m_lastKeyState;
    ushort m_u2_hp0;
    ushort m_u3_hp1;
    short m_damageTaken;
    short m_pb7;
    short m_pb8;
    short m_pb9;
    int ixx0;
    int ixx10;
    int ixx11;
    int ixx20;
    struct Struct_200A9E0 * m_ptrA9E0_1;
    struct Struct_200A9E0 * m_ptrA9E0_2;
    byte padx1[8];
    int ixx12;
    int ixx13;
    int m_ixx0;
    int ixx1;
    int ixx2;
    short ixx3;
    byte m_battleHandIndexList[6];
    byte pad0[26];
    short s4_opt2;
    short s5;
    short m_s6;
    short m_s7;
    short m_s8;
    short s9;
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
    ED_Floshell1=22,
    ED_Floshell2=23,
    ED_Floshell3=24,
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
    byte m_b4;
    byte m_curEnemyCount;
    byte m_b6;
    byte m_b7;
    byte m_b8;
    byte m_bitField2;
    byte m_b10;
    byte m_maxEnemyCount;
    byte m_b12;
    byte m_randomCellSeed;
    byte m_b14;
    enum BackgroundId m_b15_backgroundId;
    byte m_customScreenChipCount;
    byte m_customScreenSelectedChipCount;
    byte m_customGaugeSpeed;
    byte m_b19;
    byte m_b20;
    byte b21;
    byte b22;
    byte m_multipleDeletionCount;
    byte m_b24;
    byte m_srcBattleHandCount;
    byte m_sioOtherMpId;
    byte m_sioMultiplayerId;
    byte r0;
    byte r1;
    byte r2;
    bool m_r3;
    ushort m_possibleBattleTime;
    ushort i0;
    int i1;
    int i2;
    ushort u1;
    ushort m_u2;
    int i5;
    int i6;
    int i7;
    ushort uu0;
    ushort m_customGaugeMeter;
    struct Entity * m_entityPlayer1;
    struct Entity * m_entityPlayer2;
    int q1;
    byte m_q2_enemyIdRelated[8];
    struct Entity * m_enemyEntityList[4];
    byte m_enemyIdList[4];
    uint u0;
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

typedef struct Tile Tile, *PTile;

typedef struct Color Color, *PColor;

struct BattleChipData {
    byte m_chipCodes[5];
    byte m_chipElementIndex;
    byte m_possibleChipFamily;
    byte m_possibleChipSubfamily;
    byte m_possibleChipRarity;
    byte m_possibleChipLibraryIndex;
    byte m_b22;
    byte b33;
    ushort m_chipDamage;
    byte b2;
    byte b3;
    struct Tile * m_chipIcon;
    struct Tile * m_chipTileset;
    struct Color * m_chipPalette;
};

struct Color {
    byte R:5;
    byte G:5;
    byte B:5;
    byte fill:1;
};

struct Tile {
    byte data[32];
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

struct CgbChannel {
    byte sf;
    byte ty;
    byte rightVolume;
    byte leftVolume;
    byte at;
    byte de;
    byte su;
    byte re;
    byte ky;
    byte ev;
    byte eg;
    byte ec;
    byte echoVolume;
    byte echoLength;
    byte d1;
    byte d2;
    byte gt;
    byte mk;
    byte ve;
    byte pr;
    byte rp;
    byte d3[3];
    byte d5;
    byte sg;
    byte n4;
    byte pan;
    byte panMask;
    byte mo;
    byte le;
    byte sw;
    dword fr;
    dword * wp;
    dword cp;
    dword tp;
    dword pp;
    dword np;
    byte d4[4];
    dword field37_0x3c;
};

typedef struct CharTile CharTile, *PCharTile;

struct CharTile {
    byte data[64];
};

typedef struct ChipBagSlot ChipBagSlot, *PChipBagSlot;

struct ChipBagSlot {
    int i0;
    int i1;
    int i2;
    int i3;
    int i4;
    int i5;
    int i6;
    int i7;
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
    byte m_b0;
    byte m_b1;
    byte b2;
    byte b3;
    short m_s0_counter;
    byte b6;
    byte b7;
    byte b8;
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
    byte b3;
    byte m_routineType;
    byte m_lzSpriteIndex;
    short _pad;
    int m_virusFamily;
    struct Struct_8009DFD4_Sub m_dropTable[5];
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

typedef enum Flag_1C {
    F1C_01=1,
    F1C_02=2,
    F1C_04=4,
    F1C_08=8,
    F1C_10=16,
    F1C_20_DrawActiveChip=32,
    F1C_40=64,
    F1C_80=128
} Flag_1C;

typedef enum Flag_400 {
    F400_Unescapable=8,
    F400_SaveOk=9
} Flag_400;

typedef struct FrameCounter FrameCounter, *PFrameCounter;

struct FrameCounter {
    ushort m_counter;
    ushort _pad;
};

typedef struct GameOver GameOver, *PGameOver;

struct GameOver {
    enum FuncState m_state;
    byte _pad0[3];
    ushort m_gameOverTimer;
    byte m_unused;
    byte _pad1;
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

typedef struct Struct_Unk1C_Battle_Sized Struct_Unk1C_Battle_Sized, *PStruct_Unk1C_Battle_Sized;

typedef struct Struct_Unk24 Struct_Unk24, *PStruct_Unk24;

typedef struct Scene Scene, *PScene;

typedef struct Struct_Unk2C Struct_Unk2C, *PStruct_Unk2C;

typedef struct Transition Transition, *PTransition;

typedef struct MainMenu MainMenu, *PMainMenu;

typedef struct WindowSettings WindowSettings, *PWindowSettings;

typedef struct Struct_Unk44_2009A50 Struct_Unk44_2009A50, *PStruct_Unk44_2009A50;

typedef struct Text Text, *PText;

typedef struct Struct_Unk4C Struct_Unk4C, *PStruct_Unk4C;

typedef struct Struct_Unk54 Struct_Unk54, *PStruct_Unk54;

typedef struct Struct_Unk58 Struct_Unk58, *PStruct_Unk58;

typedef struct ScreenLayoutContainer ScreenLayoutContainer, *PScreenLayoutContainer;

typedef struct Struct_Unk60 Struct_Unk60, *PStruct_Unk60;

typedef struct Struct_Unk64_Sized Struct_Unk64_Sized, *PStruct_Unk64_Sized;

typedef struct Struct_Unk68 Struct_Unk68, *PStruct_Unk68;

typedef struct Struct_Unk6C Struct_Unk6C, *PStruct_Unk6C;

typedef struct Shop Shop, *PShop;

typedef struct Menu Menu, *PMenu;

typedef struct Struct_Unk78 Struct_Unk78, *PStruct_Unk78;

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

typedef struct Struct_63F0 Struct_63F0, *PStruct_63F0;

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

typedef struct MapOffset MapOffset, *PMapOffset;

struct Struct_Unk2C {
    byte m_b0;
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
    byte m_b16;
    byte b17;
    byte m_b18;
    byte b19;
    void * m_b20;
    byte b24;
    byte b25;
    byte b26;
    byte b27;
    byte b28;
    byte b29;
    byte b30;
    byte b31;
};

struct Struct_Unk4C_Sub {
    byte m_state0;
    byte b1;
    byte m_b2;
    byte m_b3;
    byte m_b4;
    enum BattleMessage m_messageIndex;
    byte m_b6;
    byte m_b7;
    byte m_b8;
    byte b9;
    byte bA;
    byte bb;
    short m_bC;
    short m_bE;
};

struct Manager {
    enum Manager_State m_gameState;
    byte b1;
    byte b2;
    byte b3;
    byte m_softResetDelayTimer;
    byte b5;
    byte b6;
    byte b7;
};

struct World {
    enum FuncState m_state0;
    byte b1;
    byte b2;
    byte b3;
    enum AreaId m_currentArea;
    byte m_currentSubArea;
    byte m_storyFlag;
    byte m_b7_fadeType;
    byte b8;
    byte m_Battle_IsTimePaused;
    byte m_b10;
    enum BackgroundId m_b11_backgroundId;
    byte m_lastArea;
    byte m_lastSubArea;
    byte m_b14;
    enum BattleType m_battleType;
    byte m_b16_state;
    bool m_isShuffleFolder;
    byte m_b18_commentaryTextIndex;
    byte m_b19_fadeStep;
    byte m_statAttack;
    byte m_statSpeed;
    byte m_statCharge;
    byte m_armor;
    enum SongId m_Song_CurrentSongId;
    byte m_bustingRank;
    byte m_b26;
    byte m_b27;
    ushort m_u0_hp0;
    ushort m_u1_hp1;
    int ix0;
    int m_ix1;
    struct Struct_63F0 * m_i0;
    struct EnemySpawn * m_enemyList;
    struct BattleChip * m_chipFolder;
    int m_battleInitHideObject;
    int m_ix7_savedPosY;
    int m_ix8_savedPosX;
    int m_ix9_savedPos0;
    int m_ix10_savedDirection;
    int ix11;
    int ix12;
    int ix13;
    int ix14;
    int ix15;
    int ix16;
    int ix17;
    int ix18;
    int ix19;
    int ix20;
    struct Struct_63F0 * ix21;
    int m_zenny;
};

struct Struct_Unk6C {
    byte other[20];
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

struct MapOffset {
    int m_posX;
    int m_posY;
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

struct Struct_Unk68 {
    byte m_textWidth;
    byte m_totalTextLength;
    byte m_charShade;
    byte pad;
    uint m_possibleBcd;
    uint m_ix1;
    uint m_ix2;
    uint x4;
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

struct MapOffsetStruct {
    struct MapOffset m_position;
    int m_pos0;
    struct MapOffset m_lastPosition;
    int m_lastPos0;
};

struct Struct_Unk60 {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
    byte funcOffset;
    byte b5;
    byte b6;
    byte b7;
};

struct Menu {
    byte m_ib0;
    byte m_ib1;
    byte ib2;
    byte ib3;
    byte m_chipid;
    byte b1;
    byte b2;
    byte m_isShowChipDetail;
    struct BattleChipData * m_chipData;
    byte Library_SubListOffset0;
    byte Library_SubListOffset1;
    byte Library_ListOffset0;
    byte Library_ListOffset1;
    byte m_someCount;
    byte bb01;
    ushort m_FolderSubOffset0;
    ushort m_FolderSubOffset1;
    ushort m_FolderOffset0;
    ushort m_FolderOffset1;
    short m_sx3;
    ushort m_sx4;
    short m_sx5;
    ushort m_sx6;
    short m_sx7;
    ushort m_st0;
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

struct ScreenLayoutContainer {
    struct TilemapEntry screen0[1024];
    struct TilemapEntry screen1[1024];
    struct TilemapEntry screen2[1024];
    struct TilemapEntry screen3[1024];
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
    short u0;
    byte m_bgMovementControl;
    byte m_b1;
    short m_playerPosX;
    short m_playerPosY;
    short m_lastPlayerPosX;
    short m_lastPlayerPosY;
    short m_ixs0;
    short ixs1;
    int m_p1;
    int m_xLowerBound;
    int m_xUpperBound;
    int m_i4;
    int m_i5;
    int m_i6;
    int m_i7;
    int m_i8_savedY;
    int m_i9_savedX;
    int m_i10;
    uint m_xRelated0;
    uint m_i3;
    int m_i0;
};

struct Struct_Unk44_2009A50 {
    byte m_mapGridSizeY;
    byte m_mapGridSizeX;
    byte field2_0x2;
    byte field3_0x3;
    short m_playerX;
    short m_playerY;
    uint * m_p0_structpackptr;
    struct BattleChip * m_chipArr;
    void * m_i0;
    int m_i1_start;
    void * m_funcLayoutCopy;
    void * m_func1;
    void * m_func2;
    byte field13_0x24;
    byte field14_0x25;
    byte field15_0x26;
    byte field16_0x27;
    byte field17_0x28;
    byte field18_0x29;
    byte field19_0x2a;
    byte field20_0x2b;
    byte field21_0x2c;
    byte field22_0x2d;
    byte field23_0x2e;
    byte field24_0x2f;
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

struct Struct_Unk1C_Battle_Sized {
    int i0;
    byte m_flag0;
    byte m_chipNameWidth;
    byte b2;
    byte m_possibleChipGaugeFull;
    int i2;
    byte m_buffer[32];
};

struct Scene {
    enum FuncState m_state0;
    byte b1;
    byte m_b2;
    byte b3;
    byte m_dialogueIndex;
    byte m_areaDialogueIndex;
    byte b6;
    byte b7;
    ushort m_delayCounter;
    ushort flag1;
    void * m_scenePointer;
    struct Struct_83BA4 * i0;
    struct Scene * m_i1;
    int i2;
    int i3;
    int i4;
    int i5;
    int i6;
    int i7;
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

struct Struct_63F0 {
    byte b0;
    byte m_b1_state;
    byte m_b2;
    byte m_b3;
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
    byte m_direction; /* 0-7, 0= up, clockwise */
    byte m_b17_direction2;
    enum MoveType m_moveType;
    enum MoveType m_lastMoveType;
    byte m_dirMovementIndex; /* 8-F = walking, 10-17 = runnning */
    byte m_b21_direction4;
    byte b22;
    byte m_b23;
    int i0;
    ushort m_s0;
    ushort s1;
    int i1;
    struct MapOffsetStruct m_mapOffset;
    int i8;
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
    int i24;
    int i25;
    int i26;
    int i27;
    int i28;
    int i29;
    int i30;
    int i31;
    int i32;
    int m_i33_possiblyPcAnimRelated;
    int i34;
    int i35;
};

struct Struct_Unk78 {
    byte bxx0;
    byte m_bxx1;
    byte bxx2;
    byte m_bxx3;
    byte m_b0;
    byte m_b1;
    ushort ux0;
    ushort ux1;
    byte b2;
    byte b3;
    byte b4;
    byte m_b5;
    byte m_rewardChipsCount;
    byte m_battleCount_8;
    short m_s0_possibleTimeRelated;
    ushort m_battleCount_16;
    ushort m_counter0;
    ushort m_s2;
    int m_gameTimer;
    int m_inBattleTimer;
    int m_checkSum;
    int m_currStepCounter;
    int m_lastStepCounter;
    byte m_buildId[14];
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
    struct DisplaySettings * displaySettings;
    struct Struct_Unk14_Sized * unk_14;
    struct FadeSettings * fadeSettings;
    struct Struct_Unk1C_Battle_Sized * unk_1C;
    struct Struct_Unk20 * unk_20;
    struct Struct_Unk24 * unk_24;
    struct Scene * scene;
    struct Struct_Unk2C * unk_2C;
    struct Transition * transition;
    struct MainMenu * mainMenu;
    struct WindowSettings * windowSettings;
    struct BlendSettings * blendSettings;
    struct Demo * demo;
    struct Struct_Unk44_2009A50 * unk_44;
    struct Text * text;
    struct Struct_Unk4C * unk_4C;
    struct FrameCounter * frameCounter;
    struct Struct_Unk54 * unk_54;
    struct Struct_Unk58 * unk_58;
    struct ScreenLayoutContainer * screens;
    struct Struct_Unk60 * unk_60;
    struct Struct_Unk64_Sized * unk_64;
    struct Struct_Unk68 * unk_68;
    struct Struct_Unk6C * unk_6C;
    struct Shop * shop;
    struct Menu * menu;
    struct Struct_Unk78 * unk_78;
    struct Struct_Unk7C * unk_7C;
};

struct Struct_Unk54 {
    int m_state0;
    byte m_b4;
    byte m_b5_possibleAlteredGaugeSpeed;
    byte m_b6;
    byte b7;
    short m_timer;
};

typedef struct MapDataHeader MapDataHeader, *PMapDataHeader;

struct MapDataHeader {
    int m_boundaryDataOffset;
    int m_elevationDataOffset;
    int m_coverDataOffset;
    int m_eventDataOffset;
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

typedef enum MptFlag {
    MPT_FLAG_VOLSET=1,
    MPT_FLAG_VOLCHG=3,
    MPT_FLAG_PITSET=4,
    MPT_FLAG_PITCHG=12,
    MPT_FLAG_START=64,
    MPT_FLAG_EXIST=128
} MptFlag;

typedef struct MusicPlayer MusicPlayer, *PMusicPlayer;

typedef struct MusicPlayerInfo MusicPlayerInfo, *PMusicPlayerInfo;

typedef struct MusicPlayerTrack MusicPlayerTrack, *PMusicPlayerTrack;

typedef struct SongHeader SongHeader, *PSongHeader;

typedef enum MusicPlayerStatus {
    MUSICPLAYER_STATUS_TRACK=65535,
    MUSICPLAYER_STATUS_PAUSE=2147483648
} MusicPlayerStatus;

typedef struct ToneData ToneData, *PToneData;

typedef struct SoundChannel SoundChannel, *PSoundChannel;

struct ToneData {
    enum InstrumentType type;
    byte key;
    byte unused;
    byte panning;
    int pointer;
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

struct SongHeader {
    byte trackCount;
    byte blockCount;
    byte priority;
    byte reverb;
    struct ToneData * tone;
    byte * part[1];
};

struct SoundChannel {
    byte status;
    byte type;
    byte rightVolume;
    byte leftVolume;
    byte attack;
    byte delay;
    byte sustain;
    byte release;
    byte ky;
    byte ev;
    byte er;
    byte el;
    byte echoVolume;
    byte echoLength;
    byte d1;
    byte d2;
    byte gt;
    byte mk;
    byte ve;
    byte pr;
    byte rp;
    byte d3[3];
    uint ct;
    uint fw;
    uint freq;
    void * wav;
    uint cp;
    void * track;
    uint pp;
    uint np;
    uint d4;
    ushort xpi;
    ushort xpc;
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
    uint func;
    uint intp;
    void * CgbSound;
    void * CgbOscOff;
    void * MidiKeyToCgbFreq;
    uint MPlayJumpTable;
    uint playnote;
    uint ExtVolPit;
    byte gap2[16];
    struct SoundChannel chans[12];
    byte pcmBuffer[3168];
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
};

typedef struct SpriteHeader SpriteHeader, *PSpriteHeader;

struct SpriteHeader {
    byte m_unk0;
    byte unk1;
    byte unk2;
    byte m_animationCount;
};

typedef enum SpriteIndex {
    SX_Canodumb=16
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

typedef enum SpriteType {
    D0_Desk=208
} SpriteType;

typedef struct Struct_13A0 Struct_13A0, *PStruct_13A0;

struct Struct_13A0 {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
    int b4;
    int ix0;
    int ix1;
    int ix2;
    int ix3;
    int ix4;
    int ix5;
    int ix6;
    int ix7;
    int ix8;
    int ix9;
    int ix10;
    int ix11;
    byte other[136];
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
    uint m_spriteTilesetPointer;
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
    short m_unknownX;
    short _pad1;
    short m_unknownY;
    short _pad2;
    short m_unknownEntityB3;
};

typedef struct Struct_3490 Struct_3490, *PStruct_3490;

struct Struct_3490 {
    short u0;
    short u1;
    short u2;
    byte b0;
    byte b1;
    uint i2;
    uint i3;
    uint * i4;
};

typedef struct Struct_4CD0 Struct_4CD0, *PStruct_4CD0;

struct Struct_4CD0 {
    byte m_b0;
    byte m_routineType;
    byte m_b2;
    byte m_b3;
    enum BattleResultType m_possibleBattleResultType;
    byte m_floatingNumWidth;
    bool m_isPrintFloatingNum;
    byte b7;
    enum FuncState m_state0;
    enum FuncState m_state1;
    enum FuncState m_state2;
    enum FuncState m_state3;
    byte m_bustingRank;
    byte m_scoreRank;
    byte m_rewardChipId;
    byte m_rewardChipCode;
    int i3;
    int i4;
    byte b8;
    byte b9;
    byte b10;
    byte m_b11;
    ushort m_rewardRevealDelayCounter;
    short i6_2;
    int i7;
    int i8;
    int m_possibleBg3X;
    int m_possibleBg3Y;
    int m_i11;
    int i12;
    int i13;
    int i14;
    int i15;
    int i16;
    int i17;
    int i18;
    int i19;
    int i20;
    int i21;
    int i22;
    int m_floatingNumRealValue;
    int m_floatingNumBcdValue;
    byte m_floatingNumBcdBytes[8];
    int m_unkX;
    int m_unkY;
    struct Entity * m_entityPtr;
    int i30;
    int i31;
    int i32;
    int i33;
    int i34;
    int i35;
    int i36;
    int i37;
    int i38;
    int i39;
    int i40;
    int i41;
    int i42;
};

typedef struct Struct_807091C Struct_807091C, *PStruct_807091C;

struct Struct_807091C {
    byte m_spriteIndex;
    byte m_frameIndex;
    byte valC;
    byte valD;
};

typedef struct Struct_C1F0 Struct_C1F0, *PStruct_C1F0;

struct Struct_C1F0 {
    byte field0_0x0;
    byte m_possibleChipId;
    enum KeyInput m_curKeyState;
    enum KeyInput m_toggleKeyState;
    enum KeyInput m_heldKeyState;
    enum KeyInput m_lastKeyState;
    short field6_0xa;
    int m_unkCounter;
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
    int i3;
    int m_i4;
    int m_i5;
    void (* m_funcPtr1)(void);
    void (* m_funcPtr2)(void);
    void (* m_funcPtr3)(void);
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

typedef struct WaveData WaveData, *PWaveData;

struct WaveData {
    word type;
    word status;
    qword freq;
    qword loopStart;
    qword size;
    byte data[1];
};

#endif // MMBN_H
