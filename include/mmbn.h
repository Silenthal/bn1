#ifndef MMBN_H
#define MMBN_H

#include <stdint.h>

typedef uint8_t   u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
typedef int8_t    s8;
typedef int16_t  s16;
typedef int32_t  s32;
typedef int64_t  s64;

typedef volatile u8   vu8;
typedef volatile u16 vu16;
typedef volatile u32 vu32;
typedef volatile u64 vu64;
typedef volatile s8   vs8;
typedef volatile s16 vs16;
typedef volatile s32 vs32;
typedef volatile s64 vs64;

typedef unsigned char   undefined;
#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
typedef unsigned char    bool;
#endif
typedef unsigned char    byte;
typedef unsigned int    dword;
typedef long long    longlong;
typedef unsigned long long    qword;
typedef char    sbyte;
typedef unsigned char    uchar;
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

typedef struct _dma_channel _dma_channel, *P_dma_channel;

struct _dma_channel {
    void *start_address;
    void *end_address;
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
    void (*vblank)(void);
    void (*hblank)(void);
    void (*vcount)(void);
    void (*timer0)(void);
    void (*timer1)(void);
    void (*timer2)(void);
    void (*timer3)(void);
    void (*serial)(void);
    void (*dma0)(void);
    void (*dma1)(void);
    void (*dma2)(void);
    void (*dma3)(void);
    void (*keypad)(void);
    void (*extirq)(void);
    void (*other)(void);
};

typedef struct Actor Actor, *PActor;

typedef struct EntityHeader EntityHeader, *PEntityHeader;

typedef struct FamilyDetail FamilyDetail, *PFamilyDetail;

typedef struct FunctionState FunctionState, *PFunctionState;

typedef struct CellPosition CellPosition, *PCellPosition;

typedef enum ElementID {
    EL_None=0,
    EL_Elec=1,
    EL_Fire=2,
    EL_Water=3,
    EL_Wood=4
} ElementID;

typedef struct MapOffsetStruct MapOffsetStruct, *PMapOffsetStruct;

typedef struct PositionXYZ PositionXYZ, *PPositionXYZ;

typedef union EntityParam EntityParam, *PEntityParam;

typedef struct BattleSpawnAnimation BattleSpawnAnimation, *PBattleSpawnAnimation;

typedef struct Sprite Sprite, *PSprite;

typedef enum GeneralEntityFlag {
    GF_None=0,
    GF_Active=1,
    GF_CanLoadSprite=2,
    GF_IgnoreTimeStop=4,
    GF_SpriteNotLoaded=8
} GeneralEntityFlag;

typedef enum EntityTag {
    EF_None=0,
    ET_PlayerLocation=128,
    ET_Attack=130,
    ET_Effect=131,
    ET_Actor=145,
    ET_NPC=148
} EntityTag;

typedef enum FuncState {
    FS_0=0,
    FS_1=4,
    FS_2=8,
    FS_3=12,
    FS_4=16,
    FS_5=20,
    FS_6=24,
    FS_7=28,
    FS_8=32,
    FS_9=36,
    FS_10=40,
    FS_11=44,
    FS_12=48,
    FS_13=52,
    FS_14=56,
    FS_15=60,
    FS_16=64,
    FS_17=68,
    FS_18=72,
    FS_19=76,
    FS_20=80,
    FS_21=84,
    FS_22=88,
    FS_23=92,
    FS_24=96,
    FS_25=100,
    FS_26=104,
    FS_27=108
} FuncState;

typedef struct FieldObject FieldObject, *PFieldObject;

typedef struct Attack Attack, *PAttack;

typedef struct Effect Effect, *PEffect;

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
    PF_Deleted=512,
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

typedef struct Struct_7BCDC Struct_7BCDC, *PStruct_7BCDC;

typedef struct EP_Half EP_Half, *PEP_Half;

typedef struct PlayerBattleState PlayerBattleState, *PPlayerBattleState;

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

typedef struct EP_60_A_Aura_ShieldArg EP_60_A_Aura_ShieldArg, *PEP_60_A_Aura_ShieldArg;

typedef struct EP_60_E_SwordSlash EP_60_E_SwordSlash, *PEP_60_E_SwordSlash;

typedef struct EP_60_E_BombExplosionParam EP_60_E_BombExplosionParam, *PEP_60_E_BombExplosionParam;

typedef struct EP_64_E_BattleChipParam EP_64_E_BattleChipParam, *PEP_64_E_BattleChipParam;

typedef struct EP_60_R_Player_Param0 EP_60_R_Player_Param0, *PEP_60_R_Player_Param0;

typedef struct EP_64_R_Player_Param1 EP_64_R_Player_Param1, *PEP_64_R_Player_Param1;

typedef struct EP_68_R_Player_Param2 EP_68_R_Player_Param2, *PEP_68_R_Player_Param2;

typedef struct EP_60_R_FireMan_Param0 EP_60_R_FireMan_Param0, *PEP_60_R_FireMan_Param0;

typedef struct EP_64_A_TowerParam EP_64_A_TowerParam, *PEP_64_A_TowerParam;

typedef struct Struct_Dat7BD24 Struct_Dat7BD24, *PStruct_Dat7BD24;

typedef struct EP_60_R_Car_Param0 EP_60_R_Car_Param0, *PEP_60_R_Car_Param0;

typedef struct EP_68_R_Mayl_Param2 EP_68_R_Mayl_Param2, *PEP_68_R_Mayl_Param2;

typedef struct EntityParam_Int EntityParam_Int, *PEntityParam_Int;

typedef struct EP_60_A_Block_BlockParam EP_60_A_Block_BlockParam, *PEP_60_A_Block_BlockParam;

typedef struct EP_68_A_Candle_Param0 EP_68_A_Candle_Param0, *PEP_68_A_Candle_Param0;

typedef struct EP_68_R_NumberMan_Param EP_68_R_NumberMan_Param, *PEP_68_R_NumberMan_Param;

typedef enum SpriteFlag {
    SF_NoMiniAnimation=1,
    SF_TilesetLoaded=2,
    SF_ZClip=4,
    SF_NoZClip=8,
    SF_MultipleParts=16,
    SF_TilesNotInVram=32
} SpriteFlag;

typedef struct SpriteFrame SpriteFrame, *PSpriteFrame;

typedef struct SpriteSubFrame SpriteSubFrame, *PSpriteSubFrame;

typedef struct SpriteTilesetHeader SpriteTilesetHeader, *PSpriteTilesetHeader;

typedef enum FieldObjectFlag {
    F9_None=0,
    F9_1=1,
    F9_IsLive=2,
    F9_NewObject=4,
    F9_IsSpread=8
} FieldObjectFlag;

typedef enum SpriteIndex {
    SP_Battle_MegaMan=0,
    SP_Battle_Mettaur=1,
    SP_Battle_WoodMan=2,
    SP_Overworld_Lan=3,
    SP_Overworld_Yai=4,
    SP_Overworld_Dex=5,
    SP_Overworld_Mari=6,
    SP_Overworld_Masa=7,
    SP_Overworld_MegaMan=8,
    SP_Overworld_Higsby=9,
    SP_Overworld_Chaud=10,
    SP_Overworld_YoungBoy=11,
    SP_Overworld_PreschoolBoy=12,
    SP_Overworld_BrownCar=13,
    SP_Overworld_WoodMan=14,
    SP_Overworld_Mayl=15,
    SP_Battle_Canodumb=16,
    SP_Battle_FireMan=17,
    SP_Overworld_LanBed=18,
    SP_Overworld_Haruka=19,
    SP_Battle_Vulgear=20,
    SP_Overworld_Match=21,
    SP_Overworld_Prog=22,
    SP_Overworld_FireMan=23,
    SP_Overworld_OldMan=24,
    SP_Overworld_WomanApron=25,
    SP_Overworld_ManTie=26,
    SP_Overworld_WomanSkirt=27,
    SP_Overworld_PreschoolGirl=28,
    SP_Overworld_YoungGirl=29,
    SP_Overworld_ManGreen=30,
    SP_Battle_Beetank=31,
    SP_Battle_Spooky=32,
    SP_Battle_Flappy=33,
    SP_Battle_GutsMan=34,
    SP_Overworld_NumberMan=35,
    SP_Battle_NumberMan=36,
    SP_Battle_HardHead=37,
    SP_Battle_Fishy=38,
    SP_Battle_Puffy=39,
    SP_Battle_Swordy=40,
    SP_Battle_Handy=41,
    SP_Battle_IceMan=42,
    SP_Overworld_Conductor=43,
    SP_Overworld_Sal=44,
    SP_Overworld_ManGovt=45,
    SP_Overworld_Madd=46,
    SP_Overworld_ManJacket=47,
    SP_Overworld_WomanJacket=48,
    SP_Overworld_Scientist=49,
    SP_Overworld_NormalNavi=50,
    SP_Overworld_NormalNavi2=51,
    SP_Overworld_StoneMan=52,
    SP_Overworld_ColdMan=53,
    SP_Overworld_ColorMan=54,
    SP_Overworld_ProtoMan=55,
    SP_Overworld_Glyde=56,
    SP_Overworld_Roll=57,
    SP_Battle_StoneMan=58,
    SP_Battle_Piranha=59,
    SP_Battle_Cloudy=60,
    SP_Battle_ColdBear=61,
    SP_Overworld_Yuichiro=62,
    SP_Battle_Froshell=63,
    SP_Overworld_OldWoman=64,
    SP_Battle_Ratty=65,
    SP_Battle_Jelly=66,
    SP_Battle_Miney=67,
    SP_Battle_Ammonicule=68,
    SP_BattleObject_AmmoniculeBubbleWrap=69,
    SP_Battle_SkullMan=70,
    SP_Battle_ColorMan=71,
    SP_Battle_ProtoMan=72,
    SP_Battle_Billy=73,
    SP_Battle_Prog=74,
    SP_BattleObject_Remobit=75,
    SP_Battle_Popper=76,
    SP_Battle_Gaia=77,
    SP_Overworld_Wily=78,
    SP_Overworld_Yahoot=79,
    SP_Overworld_CountZap=80,
    SP_Battle_MagicMan=81,
    SP_Battle_Satella=82,
    SP_Battle_Megalian=83,
    SP_Overworld_Miyu=84,
    SP_Overworld_WomanPurple=85,
    SP_Overworld_Waitress=86,
    SP_Overworld_ElecMan=87,
    SP_Overworld_BombMan=88,
    SP_Battle_SharkMan=89,
    SP_Battle_ElecMan=90,
    SP_Battle_BombMan=91,
    SP_Overworld_Prog2=92,
    SP_Overworld_GutsMan=93,
    SP_Overworld_MagicMan=94,
    SP_Battle_Fanner=95,
    SP_Battle_CanDevil=96,
    SP_Battle_PharaohMan=97,
    SP_Battle_ShadowMan=98,
    SP_Battle_Roll=99,
    SP_Battle_BigSnakeHead=100,
    SP_Battle_Mole=101,
    SP_Overworld_Prog3=102,
    SP_Battle_Poitton=103,
    SP_Battle_LifeVirus=104,
    SP_Battle_Mosqurito=105,
    SP_Battle_DarkBass=106,
    SP_BattleObject_Thunder=107,
    SP_Attack_Sword=108,
    SP_Attack_Cannon=109,
    SP_BattleObject_MiniBomb=110,
    SP_BattleObject_MetGuard=111,
    SP_BattleObject_Barrier=112,
    SP_BattleObject_WoodTower1=113,
    SP_BattleEffect_Charging=114,
    SP_BattleEffect_ShockWave=115,
    SP_BattleEffect_XPanel=116,
    SP_BattleObject_BurnerBomb=117,
    SP_BattleObject_FireTower=118,
    SP_BattleEffect_FireArm=119,
    SP_BattleEffect_BubblerHit=120,
    SP_BattleEffect_SwordSlash=121,
    SP_BattleObject_AquaTower=123,
    SP_BattleEffect_FireTowerFist=124,
    SP_BattleObject_WoodTower=125,
    SP_BattleEffect_PanelGrab=126,
    SP_BattleEffect_HeaterHit=127,
    SP_BattleEffect_PoweredCannon=128,
    SP_BattleEffect_NumberManChargingHands=130,
    SP_BattleObject_NumberBall=131,
    SP_BattleObject_TimeBomb=132,
    SP_BattleObject_DieBomb=133,
    SP_BattleObject_Seed=135,
    SP_BattleEffect_SwordySlash=136,
    SP_BattleObject_IceBlock_Emerging=137,
    SP_BattleObject_Stone=138,
    SP_BattleObject_StoneBlock=139,
    SP_BattleObject_StoneManLaser=140,
    SP_BattleObject_PuffyBubble=141,
    SP_BattleObject_Arrow=142,
    SP_BattleObject_ArrowTarget=143,
    SP_BattleObject_Cloud=144,
    SP_BattleEffect_CloudyRain=145,
    SP_Attack_FireSwrd=146,
    SP_Attack_ElecSwrd=147,
    SP_Attack_AquaSwrd=148,
    SP_Attack_GutsPnch=149,
    SP_BattleObject_IceBlock=150,
    SP_BattleObject_Hammer=151,
    SP_BattleObject_IronShield=154,
    SP_BattleEffect_FloshellMiniBombSmoke=156,
    SP_BattleObject_FreezeBomb=157,
    SP_BattleObject_Ratton=158,
    SP_BattleObject_Mine=159,
    SP_BattleEffect_MagicFire=160,
    SP_BattleObject_Skull=162,
    SP_BattleObject_Wave=163,
    SP_BattleObject_ColorManBall=164,
    SP_BattleObject_MiniColorMan=165,
    SP_BattleObject_MagicManPanel=166,
    SP_BattleEffect_MagicManArms=167,
    SP_BattleEffect_SharkManSplash=168,
    SP_BattleObject_Electrode=169,
    SP_BattleEffect_SparkStrike=170,
    SP_BattleObject_BombShoot=171,
    SP_BattleEffect_Tornado=172,
    SP_BattleObject_Candle=173,
    SP_BattleEffect_PharaohManCurse=174,
    SP_BattleObject_PharaohTrap=175,
    SP_BattleObject_PharaohManCoffin=176,
    SP_BattleObject_Anubis=177,
    SP_BattleObject_ProtoShield=178,
    SP_BattleObject_Shuriken=179,
    SP_BattleObject_Aura=182,
    SP_BattleObject_BloodSuckSyringe=184,
    SP_BattleObject_BubbleShield=185,
    SP_BattleObject_LeafShield=186,
    SP_ActivateProgAdv=188,
    SP_Battle_BigSnakeBody=189,
    SP_BattleObject_Snake=190,
    SP_BattleObject_Egg=191,
    SP_DynamyteRedDot=194,
    SP_BattleObject_Scuttlest=197,
    SP_BattleEffect_LifeVirusSword=198,
    SP_BattleObject_RollHeart=199,
    SP_Effect_LifeVirusAura=200,
    SP_BattleEffect_BassHand=201,
    SP_BattleEffect_BassAura=202,
    SP_BattleEffect_BassExplosion=203,
    SP_BattleEffect_BombShootExplosion=204,
    SP_BattleObject_LifeVirusMeteor=205,
    SP_Effect_ShortExplosion=206,
    SP_Overworld_StudentDesk1=208,
    SP_Effect_ArmorHit=212,
    SP_BattleEffect_MiniBombExplosion=215,
    SP_BattleEffect_ShotgunBurst=216,
    SP_BattleEffect_BusterHit=217,
    SP_Effect_TallExplosion=218,
    SP_MegaManDeleteGreenCircle=219,
    SP_Effect_CanodumbTarget=220,
    SP_Overworld_HouseControlPanel=223,
    SP_Overworld_PET=224,
    SP_BattleEffect_Glint=226,
    SP_Overworld_MysteryData=227,
    SP_BattleEffect_Meteor_Fire=228,
    SP_BattleObject_Meteor=229,
    SP_BattleEffect_Recover=230,
    SP_Effect_TeleportMove=231,
    SP_Overworld_Breakfast=232,
    SP_BattleEffect_PanelBreak=245,
    SP_Overworld_Portal=247,
    SP_Effect_SwordStrike=248,
    SP_Effect_FireHit=249,
    SP_Effect_ElecHit=250,
    SP_Effect_AquaHit=251,
    SP_Effect_WoodHit=252,
    SP_Effect_JellyCharging=256,
    SP_Overworld_LunchBoxStand=257,
    SP_Overworld_Pipe=258,
    SP_Overworld_TrafficCarParts=259,
    SP_Overworld_Bus=260,
    SP_Overworld_TrafficBarrier=265,
    SP_Overworld_TrafficLight=269,
    SP_Overworld_TrafficSwitch=271,
    SP_Overworld_BarSwitch=273,
    SP_Overworld_LightBulb=278,
    SP_Overworld_GeneratorLightning_Big=281,
    SP_Overworld_GeneratorLightning_Mid=282,
    SP_Overworld_GeneratorLightning_Small=283,
    SP_Object_Battery=284,
    SP_Overword_JackIn=285,
    SP_Overworld_LifeVirusSeed=288,
    SP_Overworld_WWWPass=291,
    New_Name=45568,
    SP_Invalid=65535
} SpriteIndex;

typedef enum InvisStatus {
    IS_None=0,
    IS_Invis=1,
    IS_Dropdown=2,
    IS_Popup=3
} InvisStatus;

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
    SE_Recover=114,
    SE_Battle_MegamanDeletion=115,
    SE_CanodumbFire=116,
    SE_75=117,
    SE_VirusDeleteExplosion=118,
    SE_77=119,
    SE_Teleport_Out=120,
    SE_Teleport_In=121,
    SE_7A=122,
    SE_7B_PanelCrumble=123,
    SE_EscapeFromBattle=124,
    SE_7D=125,
    SE_HeavyLanding=126,
    SE_FistPunch=127,
    SE_FireTower=128,
    SE_BurnerBombLaunch=129,
    SE_FlameArm=130,
    SE_83=131,
    SE_84=132,
    SE_MysteryDataItemGet=133,
    SE_PET_Notification=134,
    SE_87=135,
    SE_88=136,
    SE_SpookyLick=137,
    SE_TimeBombShortBeep=138,
    SE_TimeBombLongBeep=139,
    SE_8C=140,
    SE_8D=141,
    SE_8E=142,
    SE_FistCharge=143,
    SE_90=144,
    SE_91=145,
    SE_Battle_EnemyAppearance=146,
    SE_93=147,
    SE_94=148,
    SE_BlockBreak=149,
    SE_96=150,
    SE_97=151,
    SE_98=152,
    SE_99=153,
    SE_9A=154,
    SE_9B=155,
    SE_WoodTower=156,
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
    SE_Battle_Heater=169,
    SE_AA=170,
    SE_BubbleShield=171,
    SE_AC=172,
    SE_BubblePop=173,
    SE_Battle_Bubbler=174,
    SE_RattonLaunch=175,
    SE_ThrowDownItem=176,
    SE_SmallPip=177,
    SE_AquaTower=178,
    SE_B3=179,
    SE_FistLaunchTower=180,
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
    SE_Barrier=206,
    SE_CF=207,
    SE_D0=208,
    SE_D1=209,
    SE_D2=210,
    SE_D3=211,
    SE_D4=212,
    SE_D5=213,
    SE_D6=214,
    SE_Battle_LowHp=215,
    SE_D8=216,
    SE_D9=217,
    SE_DA=218,
    SE_DB=219,
    SE_DC=220,
    SE_DD=221,
    SE_Battle_TeleportIn=222,
    SE_DF=223,
    SE_E0=224,
    SE_E1=225,
    SE_E2=226,
    SE_E3=227,
    SE_PoweredCannon_Emerge=228,
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

typedef enum ShieldType {
    ST_LifeAura=0,
    ST_AquaAura=1,
    ST_FireAura=2,
    ST_WoodAura=3,
    ST_Barrier=128,
    ST_BubbleWrap=129,
    ST_LeafShield=130,
    ST_None=255
} ShieldType;

typedef enum FireManMoveState {
    FMS_0=0,
    FMS_1=1,
    FMS_2=2,
    FMS_4=4
} FireManMoveState;

typedef enum Struct_Dat7BD24_Flag {
    SDF_Damage=1,
    SDF_Skip=2,
    SDF_80=128
} Struct_Dat7BD24_Flag;

typedef struct MaylParam MaylParam, *PMaylParam;

typedef struct Tile Tile, *PTile;

struct Struct_Dat7BD24 {
    byte frameIndex;
    byte delay;
    enum Struct_Dat7BD24_Flag flag;
    byte b3;
};

struct CellPosition {
    byte x;
    byte y;
};

struct FieldObject {
    enum FieldObjectFlag flags;
    byte id;
    struct CellPosition cPosCurr;
    struct CellPosition cPosLast;
    enum ElementID element;
    byte routineType; /* Shares routine type with associated entity */
    short damage;
    enum PanelFlag panelFlags;
    int idFlag;
    int attackerIdFlags;
};

struct PlayerBattleState {
    byte timerInvulnerable;
    byte chipsUsedCount;
    byte moveCount;
    byte hitsTaken;
    byte _pad1;
    byte zetaOmegaChipId;
    byte lastChipElement;
    byte betaSigmaChipIndex;
    byte busterChip;
    byte statAttack;
    byte statSpeed;
    byte statCharge;
    byte bubbleShieldFamily;
    enum InvisStatus invisStatus;
    byte numbDamage;
    byte armor;
    short busterChargeLevel;
    short busterChargeDamage;
    short busterChargeDelay;
    short s16;
    short lastChipDamage;
    short zetaOmegaActiveTime;
    short timerInvisible;
    enum KeyInput curKeyState;
    enum KeyInput toggleKeyState;
    short s22;
    enum KeyInput lastKeyState;
    ushort hpCurrent;
    ushort hpMax;
    short damageTaken;
    short timerBubbleShield;
    short timerIronBody;
    short numbStatusTimer;
    byte _pad2[12];
    struct Attack *atkAura;
    struct FieldObject *fieldObjSelf;
    struct FieldObject *fieldObjMoving;
    byte _pad3[4];
    struct Attack *atkMinion;
    struct Attack *atkShield;
    struct Attack *atkStatusNumb;
    enum PanelFlag attackerAttributes;
    byte betaSigmaChipList[10];
    byte listBattleHandIndex[6];
};

struct EntityHeader {
    enum GeneralEntityFlag entityFlags;
    byte routineType;
    enum EntityTag tag;
    byte listIndex;
};

struct FamilyDetail {
    byte family;
    byte b1;
    byte b2;
    byte b3;
};

struct EP_64_R_Player_Param1 {
    ushort b0;
    byte chipFamily;
    enum FuncState chipState;
};

struct EP_Half {
    ushort s0;
    ushort s1;
};

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

struct EP_68_A_Candle_Param0 {
    byte hp;
    byte delay;
};

struct EP_60_R_Car_Param0 {
    ushort *vals;
};

struct PositionXYZ {
    int x;
    int y;
    int z;
};

struct MapOffsetStruct {
    struct PositionXYZ curr;
    struct PositionXYZ last;
};

struct BattleSpawnAnimation {
    enum FuncState state;
    byte _pad0;
    short delay;
    ushort spawnTimer;
    short s2;
};

struct Struct_7BCDC {
    undefined field0_0x0;
    undefined field1_0x1;
    enum SpriteIndex spriteIndex;
};

struct EP_68_R_Mayl_Param2 {
    struct MaylParam *argList;
};

struct EntityParam_Int {
    int val;
};

struct EP_64_E_BattleChipParam {
    ushort x;
    ushort y;
};

struct EP_60_E_BombExplosionParam {
    byte routine;
    byte frameIndex;
    enum SpriteIndex spriteIndex;
};

struct EP_68_R_Player_Param2 {
    byte isShieldHeld;
    byte chipActivationDelay;
    byte b2;
    byte b3;
};

struct EP_68_R_NumberMan_Param {
    short s0;
    short s1;
};

struct EP_60_R_FireMan_Param0 {
    enum FireManMoveState flag;
    byte nextX;
    byte nextY;
    byte b3;
};

struct EP_60_R_Player_Param0 {
    byte b0;
    byte chipSubFamily;
    byte b2;
    enum ShieldType shieldId;
};

union EntityParam {
    struct Actor *actor;
    struct FieldObject *fieldObj;
    struct Attack *attack;
    struct Effect *effect;
    struct CellPosition cPos;
    int iVal;
    enum PanelFlag panelFlag;
    struct Struct_7BCDC fireCannonBallParam;
    struct EP_Half eph;
    struct PlayerBattleState *playerBattleState;
    enum AttackButtonState attackButtonState;
    struct EP_60_A_Aura_ShieldArg *shieldArg;
    struct EP_60_E_SwordSlash *slashParam;
    struct EP_60_E_BombExplosionParam bombParam;
    struct EP_64_E_BattleChipParam bcDraw;
    struct EP_60_R_Player_Param0 playerParam0;
    struct EP_64_R_Player_Param1 playerParam1;
    struct EP_68_R_Player_Param2 playerParam2;
    struct EP_60_R_FireMan_Param0 fmParam0;
    struct EP_64_A_TowerParam *towerParam;
    struct Struct_7BCDC *towerEffectParam;
    struct Struct_Dat7BD24 *commandListParam;
    struct EP_60_R_Car_Param0 carParam;
    struct EP_68_R_Mayl_Param2 maylFrames;
    struct EntityParam_Int intParam;
    struct EP_60_A_Block_BlockParam *blockParam;
    struct EP_68_A_Candle_Param0 *candleParam;
    struct EP_68_R_NumberMan_Param ep68_numberMan;
};

struct FunctionState {
    enum FuncState s0;
    enum FuncState s1;
    enum FuncState s2;
    enum FuncState s3;
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
    byte *spriteStart;
    struct SpriteFrame *curFrame;
    struct SpriteSubFrame *curSubFrame;
    struct SpriteTilesetHeader *curTilesetHeader;
    int objectDrawBitset;
    uint objectExcludeFlags;
};

struct Actor {
    struct EntityHeader header;
    struct FamilyDetail family;
    struct FunctionState state;
    byte bc;
    byte bd;
    byte be;
    byte bf;
    byte angleToTarget;
    byte b11;
    byte enemyIndex;
    byte enemyId;
    byte frameIndexCurr;
    byte frameIndexLast;
    byte owner;
    byte canBeDamaged;
    struct CellPosition cPos;
    enum ElementID element;
    byte b1b;
    ushort counterA;
    ushort counterB;
    ushort hpCurrent;
    ushort hpMax;
    ushort damage;
    ushort _pad1;
    struct MapOffsetStruct pos;
    int i40;
    struct PositionXYZ diff;
    struct PositionXYZ initial;
    union EntityParam param_5C;
    union EntityParam param_60;
    union EntityParam param_64;
    union EntityParam param_68;
    union EntityParam param_6C;
    union EntityParam param_70;
    union EntityParam param_74;
    union EntityParam param_78;
    union EntityParam param_7C;
    struct BattleSpawnAnimation appearState;
    byte _pad2[8];
    struct Sprite m_sprite;
};

struct EP_60_A_Aura_ShieldArg {
    enum SpriteIndex spriteIndex;
    enum SongId createSoundId;
    enum SongId destroySoundId;
    byte paletteIndex;
    byte spriteYOffset;
    ushort excludeFlags;
};

struct EP_60_E_SwordSlash {
    byte frameIndex;
    byte paletteIndex;
    enum SpriteIndex spriteIndex;
};

struct MaylParam {
    byte b0;
    byte dx;
    byte dy;
    byte moveCounter;
};

struct SpriteSubFrame {
    byte objectListIndex;
    byte delay;
    byte flag;
};

struct Tile {
    byte data[32];
};

struct Attack {
    struct EntityHeader header;
    struct FamilyDetail family;
    struct FunctionState state;
    byte bc;
    byte bd;
    byte be;
    byte bf;
    byte angleToTarget;
    byte _pad0[3];
    byte frameIndexCurr;
    byte frameIndexLast;
    byte owner;
    bool canBeDamaged;
    struct CellPosition cPos;
    byte element;
    byte b1b;
    ushort counterA;
    ushort counterB;
    ushort hpCurrent;
    ushort hpMax;
    ushort damage;
    ushort _pad1;
    struct MapOffsetStruct pos;
    int i40;
    struct PositionXYZ diff;
    union EntityParam param_50;
    union EntityParam param_54;
    union EntityParam param_58;
    union EntityParam param_5C;
    union EntityParam param_60;
    union EntityParam param_64;
    union EntityParam param_68;
    union EntityParam param_6C;
    union EntityParam param_70;
    union EntityParam param_74;
    union EntityParam param_78;
    union EntityParam param_7C;
    struct Sprite sprite;
};

struct EP_64_A_TowerParam {
    enum SongId soundId;
    byte delay;
    enum SpriteIndex spriteIndex;
};

struct Effect {
    struct EntityHeader header;
    struct FamilyDetail family;
    struct FunctionState state;
    byte bc;
    byte bd;
    byte be;
    byte bf;
    int _pad1;
    byte frameIndexCurr;
    byte frameIndexLast;
    byte owner;
    byte _pad2;
    struct CellPosition cPos;
    enum ElementID element;
    byte b1b;
    ushort counterA;
    ushort counterB;
    int _pad3;
    ushort damage;
    ushort _pad4;
    struct MapOffsetStruct pos;
    int _pad5;
    struct PositionXYZ diff;
    struct PositionXYZ initial;
    union EntityParam obj_5C;
    union EntityParam obj_60;
    union EntityParam obj_64;
    union EntityParam obj_68;
    union EntityParam obj_6C;
    int extraX;
    int extraY;
    struct Actor *parent;
    int i7c;
    struct Sprite sprite;
};

struct EP_60_A_Block_BlockParam {
    byte b0;
    byte frameIndex;
    enum SpriteIndex spriteIndex;
    int counter;
};

struct SpriteTilesetHeader {
    int m_tilesetSize;
    struct Tile m_tiles;
};

typedef union ActorAttribUnion ActorAttribUnion, *PActorAttribUnion;

typedef struct ActorAttributes_Default ActorAttributes_Default, *PActorAttributes_Default;

typedef struct ActorAttributes_ElecMan ActorAttributes_ElecMan, *PActorAttributes_ElecMan;

typedef struct ActorAttributes_ProtoMan ActorAttributes_ProtoMan, *PActorAttributes_ProtoMan;

typedef struct ActorAttributes_LifeVirus ActorAttributes_LifeVirus, *PActorAttributes_LifeVirus;

typedef struct SpecElecMan SpecElecMan, *PSpecElecMan;

typedef struct SpecProtoMan SpecProtoMan, *PSpecProtoMan;

struct ActorAttributes_LifeVirus {
    struct Effect *aura;
    union EntityParam obj_60;
    union EntityParam obj_64;
    struct Effect *scut1;
    struct Effect *scut2;
    struct Effect *scut3;
    union EntityParam obj_74;
    union EntityParam obj_78;
    union EntityParam obj_7C;
};

struct ActorAttributes_ElecMan {
    union EntityParam obj_5C;
    byte nextX;
    byte nextY;
    byte moveCounter;
    byte sparkStrikeCount;
    union EntityParam obj_64;
    union EntityParam obj_68;
    union EntityParam obj_6C;
    struct SpecElecMan *spec;
    union EntityParam obj_74;
    union EntityParam obj_78;
    union EntityParam obj_7C;
};

struct SpecElecMan {
    byte columnCurrentDamage;
    byte sparkStrikeDamage;
    byte sparkStrikeCount;
    byte b3;
};

struct SpecProtoMan {
    byte b0;
    byte b1;
    short b2;
};

struct ActorAttributes_ProtoMan {
    union EntityParam obj_5C;
    union EntityParam obj_60;
    struct SpecProtoMan spec;
    struct FieldObject *obj_68;
    union EntityParam obj_6C;
    struct Attack *charge;
    union EntityParam obj_74;
    union EntityParam obj_78;
    union EntityParam obj_7C;
};

struct ActorAttributes_Default {
    union EntityParam obj_5C;
    union EntityParam obj_60;
    union EntityParam obj_64;
    union EntityParam obj_68;
    union EntityParam obj_6C;
    union EntityParam obj_70;
    struct Actor *obj_74;
    union EntityParam obj_78;
    union EntityParam obj_7C;
};

union ActorAttribUnion {
    struct ActorAttributes_Default def;
    struct ActorAttributes_ElecMan elec;
    struct ActorAttributes_ProtoMan proto;
    struct ActorAttributes_LifeVirus life;
};

typedef enum ActorID {
    ACT_Player=0,
    ACT_Woodman=1,
    ACT_Canodumb=2,
    ACT_FireMan=3,
    ACT_Mettaur=4,
    ACT_Vulgear=5,
    ACT_Mayl=6,
    ACT_LanBed=7,
    ACT_BrownCar=8,
    ACT_Beetank=9,
    ACT_Spooky=10,
    ACT_PoweredCannon=11,
    ACT_GutsMan=12,
    ACT_HardHead=13,
    ACT_Fishy=14,
    ACT_NumberMan=15,
    ACT_Swordy=16,
    ACT_Puffy=17,
    ACT_Flappy=18,
    ACT_Piranha=19,
    ACT_Cloudy=20,
    ACT_StoneMan=21,
    ACT_FireMan_Chip=22,
    ACT_NumberMan_Chip=23,
    ACT_Floshell=24,
    ACT_GutsMan_Chip=25,
    ACT_Handy_Main=26,
    ACT_IceMan=27,
    ACT_ColdBear=28,
    ACT_IceMan_Chip=29,
    ACT_StoneMan_Chip=30,
    ACT_Jelly=31,
    ACT_Ratty=32,
    ACT_Popper=33,
    ACT_SkullMan=34,
    ACT_ColorMan=35,
    ACT_MiniColorMan=36,
    ACT_ElecMan=37,
    ACT_ProtoMan=38,
    ACT_Miney=39,
    ACT_Ammonicule=40,
    ACT_SharkMan=41,
    ACT_Prog=42,
    ACT_Billy=43,
    ACT_Megalian=44,
    ACT_Remobit=45,
    ACT_BombMan=46,
    ACT_SkullMan_Chip=47,
    ACT_Roll_Chip=48,
    ACT_BigStraight=49,
    ACT_GutsShoot_GutsMan=50,
    ACT_GutsShoot_MegaMan=51,
    ACT_Fanner=52,
    ACT_CanDevil=53,
    ACT_DeathStorm=54,
    ACT_Mosqurito=55,
    ACT_Drain=56,
    ACT_LifeVirus=57,
    ACT_ColorMan_Chip=58,
    ACT_MiniColorMan_Chip=59,
    ACT_ProtoMan_Chip=60,
    ACT_SharkMan_Chip=61,
    ACT_ElecMan_Chip=62,
    ACT_MagicMan=63,
    ACT_PharaohMan=64,
    ACT_Poitton=65,
    ACT_ShadowMan=66,
    ACT_BigSnake=67,
    ACT_BigSnakeBody=68,
    ACT_Gaia=69,
    ACT_Bass=70,
    ACT_Satella=71,
    ACT_PharaohMan_Chip=72,
    ACT_ShadowMan_Chip=73,
    ACT_MagicMan_Chip=74,
    ACT_BombMan_Chip=75,
    ACT_Bass_Chip=76,
    ACT_LifeSaver=77,
    ACT_2xHeroMegaMan=78,
    ACT_2xHeroProtoMan=79,
    ACT_HeavyStamp=80,
    ACT_BloodSuck=81,
    ACT_Mole=82
} ActorID;

typedef struct AfterBattleFlagSettings AfterBattleFlagSettings, *PAfterBattleFlagSettings;

typedef enum Flag_Base {
    F_CLEAR_CHAPTER_1=0,
    F_CLEAR_CHAPTER_2=1,
    F_CLEAR_CHAPTER_3=2,
    F_CLEAR_CHAPTER_4=3,
    F_CLEAR_CHAPTER_5=4,
    F_CLEAR_GAME=5,
    F_BOOKMARK_MAYL=6,
    F_BOOKMARK_YAI=7,
    F_BOOKMARK_DEX=8,
    F_BOOKMARK_SLASH_DEX=10,
    F_DEFEATED_PHARAOHMAN=18,
    F_15=21,
    F_GATE_LOCK_INTERNET_2=22,
    F_GATE_CLEAR_INTERNET_2=23,
    F_PIN_UNLOCK_INTERNET_2=24,
    F_GATE_LOCK_INTERNET_1=36,
    F_GATE_CLEAR_INTERNET_1=37,
    F_PIN_UNLOCK_INTERNET_1=38,
    F_27=39,
    F_BATTLE_NUMBERMAN=41,
    F_HAS_TRAIN_TICKET=42,
    F_BATTLE_GUTSMAN=43,
    F_BATTLE_WOODMAN=44,
    F_BATTLE_SKULLMAN=45,
    F_BATTLE_SHARKMAN=47,
    F_JACK_IN=53,
    F_BATTLE_WIN_NUMBERMAN_V2=54,
    F_BATTLE_WIN_NUMBERMAN_V3=55,
    F_BATTLE_ICEMAN=56,
    F_BATTLE_WIN_ICEMAN_V2=57,
    F_BATTLE_WIN_ICEMAN_V3=58,
    F_BATTLE_WIN_SKULLMAN_V1=59,
    F_BATTLE_WIN_SKULLMAN_V2=60,
    F_BATTLE_WIN_SKULLMAN_V3=61,
    F_BATTLE_WIN_WOODMAN_V1=62,
    F_BATTLE_WIN_WOODMAN_V2=63,
    F_BATTLE_WIN_WOODMAN_V3=64,
    F_BATTLE_WIN_SHARKMAN_V1=65,
    F_BATTLE_WIN_SHARKMAN_V2=66,
    F_BATTLE_WIN_SHARKMAN_V3=67,
    F_BATTLE_WIN_GUTSMAN_V1=68,
    F_GET_ITEM_SLASHDEX=69,
    F_BATTLE_WIN_GUTSMAN_V2=70,
    F_BOOKMARK_SAL=72,
    F_BOOKMARK_MASA=73,
    F_BOOKMARK_YUICHIRO=74,
    F_BOOKMARK_MIYU=75,
    F_GATE_LOCK_INTERNET_3=82,
    F_GATE_CLEAR_INTERNET_3=83,
    F_PIN_UNLOCK_INTERNET_3=84,
    F_DEFEATED_STONEMAN_V2=85,
    F_BATTLE_STONEMAN=86,
    F_GATE_LOCK_INTERNET_4=87,
    F_GATE_CLEAR_INTERNET_4=88,
    F_HIG_MEMO_USED_INTERNET_4=90,
    F_DEFEATED_FIREMAN_V2=92,
    F_DEFEATED_COLORMAN_V2=93,
    F_DEFEATED_ELECMAN_V2=94,
    F_DEFEATED_BOMBMAN_V2=95,
    F_DEFEATED_MAGICMAN_V2=96,
    F_BATTLE_PROTOMAN=99,
    F_BATTLE_WIN_PROTOMAN_V2=100,
    F_LAB_MEMO_USED_UNDERNET_1=101,
    F_GATE_LOCK_UNDERNET_1=103,
    F_GATE_CLEAR_UNDERNET_1=104,
    F_YURI_MEMO_USED_UNDERNET_2=106,
    F_6C=108,
    F_PAS_MEMO_USED_UNDERNET_3=109,
    F_6F=111,
    F_BATTLE_WIN_PROTOMAN_V3=112,
    F_GATE_LOCK_UNDERNET_6_1=119,
    F_SKILL_CHECK_PASS_UNDERNET_6_TO_7=120,
    F_GATE_CLEAR_UNDERNET_6_1=121,
    F_GATE_LOCK_UNDERNET_6_2=122,
    F_SKILL_CHECK_PASS_UNDERNET_6_TO_9=123,
    F_GATE_CLEAR_UNDERNET_6_2=124,
    F_GATE_LOCK_UNDERNET_7=125,
    F_SKILL_CHECK_PASS_UNDERNET_7=126,
    F_GATE_CLEAR_UNDERNET_7=127,
    F_GATE_LOCK_UNDERNET_9=128,
    F_SKILL_CHECK_PASS_UNDERNET_9=129,
    F_GATE_CLEAR_UNDERNET_9=130,
    F_GATE_LOCK_UNDERNET_10=131,
    F_SKILL_CHECK_PASS_UNDERNET_10=132,
    F_GATE_CLEAR_UNDERNET_10=133,
    F_GATE_LOCK_UNDERNET_11=134,
    F_SKILL_CHECK_PASS_UNDERNET_11=135,
    F_GATE_CLEAR_UNDERNET_11=136,
    F_GATE_LOCK_UNDERNET_6_3=137,
    F_GATE_CLEAR_UNDERNET_6_3=138,
    F_GATE_LOCK_UNDERNET_10_PIN=140,
    F_GATE_CLEAR_UNDERNET_10_PIN=141,
    F_PIN_UNLOCK_UNDERNET_10=142,
    F_DEFEATED_SHADOWMAN=143,
    F_STORY_00=144,
    F_STORY_01=146,
    F_93=147,
    F_STORY_02=148,
    F_STORY_03=149,
    F_STORY_04=151,
    F_STORY_05=152,
    F_STORY_06=153,
    F_STORY_13=154,
    F_STORY_14=155,
    F_9C=156,
    F_STORY_07=158,
    F_STORY_08=159,
    F_A3=163,
    F_GATE_LOCK_SCHOOL_COMP_1=165,
    F_GATE_CLEAR_SCHOOL_COMP_1=166,
    F_GATE_CLEAR_SCHOOL_COMP_2_1=168,
    F_GATE_LOCK_SCHOOL_COMP_2_1=169,
    F_GATE_LOCK_SCHOOL_COMP_2_2=171,
    F_GATE_CLEAR_SCHOOL_COMP_2_2=172,
    F_GATE_LOCK_SCHOOL_COMP_3_1=174,
    F_GATE_CLEAR_SCHOOL_COMP_3_1=175,
    F_GATE_LOCK_SCHOOL_COMP_3_2=177,
    F_GATE_CLEAR_SCHOOL_COMP_3_2=178,
    F_B7=183,
    F_GATE_LOCK_WWW_COMP_2_1=184,
    F_GATE_LOCK_SCHOOL_COMP_4=185,
    F_GATE_LOCK_WWW_COMP_2_3=186,
    F_GATE_LOCK_WWW_COMP_2_4=187,
    F_GATE_LOCK_SCHOOL_COMP_5=188,
    F_GATE_LOCK_WWW_COMP_2_6=189,
    F_GATE_LOCK_WWW_COMP_2_7=190,
    F_GATE_LOCK_WWW_COMP_2_8=191,
    F_GATE_LOCK_WWW_COMP_2_9=192,
    F_STORY_09_0=193,
    F_STORY_09_1=196,
    F_EXTRA_C6=198,
    F_STORY_0B=199,
    F_C8=200,
    F_STORY_0C=201,
    F_STORY_0D=202,
    F_CC=204,
    F_D3=211,
    F_GATE_CLEAR_WWW_COMP_2_1=212,
    F_GATE_CLEAR_SCHOOL_COMP_4=213,
    F_GATE_CLEAR_WWW_COMP_2_3=214,
    F_GATE_CLEAR_WWW_COMP_2_4=215,
    F_GATE_CLEAR_SCHOOL_COMP_5=216,
    F_GATE_CLEAR_WWW_COMP_2_6=217,
    F_GATE_CLEAR_WWW_COMP_2_7=218,
    F_GATE_CLEAR_WWW_COMP_2_8=219,
    F_GATE_CLEAR_WWW_COMP_2_9=220,
    F_DF=223,
    F_SLIDE_E0=224,
    F_SLIDE_E1=225,
    F_SLIDE_E2=226,
    F_SLIDE_E3=227,
    F_STORY_77=228,
    F_STORY_78=229,
    F_STORY_79=230,
    F_STORY_7A=231,
    F_STORY_7B=232,
    F_STORY_7C=233,
    F_STORY_7D=234,
    F_STORY_7E=235,
    F_STORY_7F=236,
    F_ED=237,
    F_EE=238,
    F_EF=239,
    F_F1=241,
    F_F6=246
} Flag_Base;

struct AfterBattleFlagSettings {
    byte dialogueIfWin;
    byte dialogueIfLose;
    enum Flag_Base flagSet;
    enum Flag_Base flagClear;
    enum Flag_Base flagSetIfWin;
    enum Flag_Base flagClearIfWin;
    enum Flag_Base flagSetIfLose;
    enum Flag_Base flagClearIfLose;
};

typedef enum AllocParamEntityType {
    APT_PlayerLocation=0,
    APT_Actor=1,
    APT_Attack=2,
    APT_Effect=3,
    APT_NPC=4
} AllocParamEntityType;

typedef enum AreaId {
    Area_School=0,
    Area_ACDC=1,
    Area_Govt=2,
    Area_DenTown=3,
    Area_SciLab=4,
    Area_WWW=5,
    Area_SchoolComp=128,
    Area_OvenComp=129,
    Area_WaterworksComp=130,
    Area_TrafficLightComp=131,
    Area_Power_Plant_Comp=132,
    Area_WWW_Comp=133,
    Area_ACDC_HP=136,
    Area_GovtHP=137,
    Area_DenTown_HP=138,
    Area_SciLab_HP=139,
    Area_Other_Comp=140,
    Area_Internet=144,
    Area_Battle=240
} AreaId;

typedef struct AreaIdPack AreaIdPack, *PAreaIdPack;

struct AreaIdPack {
    enum AreaId areaId;
    byte subAreaId;
};

typedef struct AreaProperties AreaProperties, *PAreaProperties;

typedef enum PanelProperty {
    PP_Walkable=1,
    PP_OpponentTerritory=2,
    PP_Cracked=4
} PanelProperty;

struct AreaProperties {
    enum PanelProperty data[40];
};

typedef struct AreaStruct AreaStruct, *PAreaStruct;

struct AreaStruct {
    enum AreaId area;
    byte subArea;
};

typedef union AreaUnion AreaUnion, *PAreaUnion;

typedef enum MapId {
    Map_School_Class_5A=0,
    Map_ACDC_Town=1,
    Map_Govt_Complex_Front=2,
    Map_DenTown_Center=3,
    Map_SciLab_Restaurant_Hallway=4,
    Map_WWW_Base=5,
    Map_School_Comp_1=128,
    Map_Oven_Comp_1=129,
    Map_Waterworks_Comp_1=130,
    Map_Traffic_Light_Comp_1=131,
    Map_Power_Plant_Comp_1=132,
    Map_WWW_Comp_1=133,
    Map_ACDC_Lan_PC=136,
    Map_Govt_Yuichiro_PC=137,
    Map_DenTown_Antique_Comp=138,
    Map_SciLab_Fish_Stand_Comp=139,
    Map_Other_Doghouse_Comp=140,
    Map_Internet_1=144,
    Map_School_Class_5B=256,
    Map_ACDC_School_Gate=257,
    Map_Govt_Complex_Station=258,
    Map_DenTown_Station=259,
    Map_SciLab_Restaurant=260,
    Map_WWW_Wily_Lab=261,
    Map_School_Comp_2=384,
    Map_Oven_Comp_2=385,
    Map_Waterworks_Comp_2=386,
    Map_Traffic_Light_Comp_2=387,
    Map_Power_Plant_Comp_2=388,
    Map_WWW_Comp_2=389,
    Map_ACDC_Mayl_PC=392,
    Map_Govt_Lunch_Cart_Comp=393,
    Map_Other_Servbot_Comp=396,
    Map_Internet_2=400,
    Map_School_Library=512,
    Map_ACDC_Lan_Living_Room=513,
    Map_Govt_Waterworks_Lobby=514,
    Map_DenTown_Block_1=515,
    Map_SciLab_Power_Plant_Hallway=516,
    Map_WWW_Rocket_Hanger=517,
    Map_School_Comp_3=640,
    Map_Waterworks_Comp_3=642,
    Map_Traffic_Light_Comp_3=643,
    Map_Power_Plant_Comp_3=644,
    Map_WWW_Comp_3=645,
    Map_ACDC_Yai_PC=648,
    Map_Other_New_Game_Machine_Comp=652,
    Map_Internet_3=656,
    Map_School_2F_Hallway=768,
    Map_ACDC_Lan_Room=769,
    Map_Govt_SciLab_Lobby=770,
    Map_DenTown_Block_2=771,
    Map_SciLab_Power_Plant=772,
    Map_WWW_Passage_1=773,
    Map_School_Comp_4=896,
    Map_Waterworks_Comp_4=898,
    Map_Traffic_Light_Comp_4=899,
    Map_Power_Plant_Comp_4=900,
    Map_WWW_Comp_4=901,
    Map_ACDC_Dex_PC=904,
    Map_Other_Telephone_Comp=908,
    Map_Internet_4=912,
    Map_Govt_Complex_Hallway=1026,
    Map_DenTown_Block_3=1027,
    Map_SciLab_Power_Plant_Control_Room=1028,
    Map_WWW_Passage_2=1029,
    Map_School_Comp_5=1152,
    Map_Waterworks_Comp_5=1154,
    Map_Traffic_Light_Comp_5=1155,
    Map_WWW_Comp_5=1157,
    Map_Other_Car_Comp=1164,
    Map_Undernet_1=1168,
    Map_School_Class_1A=1280,
    Map_ACDC_Mayl_Living_Room=1281,
    Map_Govt_Yuichiro_Lab=1282,
    Map_DenTown_Block_4=1283,
    Map_SciLab_Generator_Room=1284,
    Map_WWW_Passage_3=1285,
    Map_Waterworks_Comp_6=1410,
    Map_Rocket_Comp=1413,
    Map_Other_Waterworks_Vending_Machine=1420,
    Map_Undernet_2=1424,
    Map_School_Class_1B=1536,
    Map_ACDC_Mayl_Room=1537,
    Map_Govt_Waterworks_Office=1538,
    Map_DenTown_Miyu_Antiques=1539,
    Map_Other_Lobby_TV_Comp=1676,
    Map_Undernet_3=1680,
    Map_School_AV_Room=1792,
    Map_ACDC_Dex_Room=1793,
    Map_Govt_Waterworks_Control_Room=1794,
    Map_DenTown_Summer_School=1795,
    Map_Other_Large_Monitor_Comp=1932,
    Map_Undernet_4=1936,
    Map_School_Infirmary=2048,
    Map_Other_Control_Equipment_Comp=2188,
    Map_Undernet_5=2192,
    Map_School_1F_Hallway=2304,
    Map_ACDC_Yai_Room=2305,
    Map_Govt_Waterworks_Pump_Room=2306,
    Map_Other_SciLab_Vending_Machine=2444,
    Map_Undernet_6=2448,
    Map_Other_Recycled_PET_Comp=2700,
    Map_Undernet_7=2704,
    Map_School_Cross_Hallway=2816,
    Map_ACDC_Higsby=2817,
    Map_Govt_Waterworks_Purification_Room=2818,
    Map_Other_Big_Vase_Comp=2956,
    Map_Undernet_8=2960,
    Map_School_Storage=3072,
    Map_ACDC_Station=3073,
    Map_Other_Blackboard_Comp=3212,
    Map_Undernet_9=3216,
    Map_School_Staff_Lounge=3328,
    Map_ACDC_Secret_Station=3329,
    Map_Undernet_10=3472,
    Map_School_Staff_Lounge_Hallway=3584,
    Map_Undernet_11=3728,
    Map_Undernet_12=3984,
    Map_None=65535
} MapId;

union AreaUnion {
    enum MapId mapId;
    struct AreaStruct areaId;
};

typedef struct AT_68_Pack AT_68_Pack, *PAT_68_Pack;

struct AT_68_Pack {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
};

typedef enum AttackIndex {
    ACI_AnimationOnly=0,
    ACI_IceManBeetankBomb=1,
    ACI_WoodTower=2,
    ACI_Sword=3,
    ACI_Cannon=4,
    ACI_Unk05=5,
    ACI_Unk06=6,
    ACI_MetGuard=7,
    ACI_Aura=8,
    ACI_Bomb=10,
    ACI_Charging=11,
    ACI_ShotGun=12,
    ACI_BurnerBomb=13,
    ACI_Shockwave=14,
    ACI_Tower=16,
    ACI_FireArm=17,
    ACI_Buster=18,
    ACI_ShotgunBurst=19,
    ACI_Meteor=20,
    ACI_MeteorFire=21,
    ACI_PoweredCannon=22,
    ACI_Steal=23,
    ACI_QuickAttack=24,
    ACI_SharpStrike=25,
    ACI_CanodumbTarget=26,
    ACI_Howitzer=27,
    ACI_Seed=28,
    ACI_NumberBall=29,
    ACI_TimeBomb=30,
    ACI_SwordySlash=31,
    ACI_DieBomb=32,
    ACI_Arrow=34,
    ACI_Quake=35,
    ACI_Cube=37,
    ACI_Stone=38,
    ACI_StoneManLaser=39,
    ACI_FloshellShield=41,
    ACI_FloshellMiniBomb=42,
    ACI_Wave=44,
    ACI_Ratton=45,
    ACI_Onibi=46,
    ACI_BoneCrush=47,
    ACI_Skull=48,
    ACI_SparkStrike=50,
    ACI_ColumnCurrentH=51,
    ACI_ColumnCurrentV=52,
    ACI_Mine=53,
    ACI_AmmoniculeBubbleWrap=54,
    ACI_Thunder=56,
    ACI_Remobit=57,
    ACI_MegalianHead=58,
    ACI_Anubis=59,
    ACI_Candle=60,
    ACI_IronShield=61,
    ACI_Remobit_Chip=62,
    ACI_BodyBurn=63,
    ACI_Battery=64,
    ACI_BigStraight=65,
    ACI_Tornado=66,
    ACI_BombManBomb=68,
    ACI_Scuttlest=71,
    ACI_PharaohTrap=73,
    ACI_Dynamyte=74,
    ACI_Bakufu=75,
    ACI_Shuriken=76,
    ACI_Bunshin=77,
    ACI_AirBurst=79,
    ACI_GaiaExplosion=80,
    ACI_BassExplosionYellow=81,
    ACI_BassExplosionBlue=82,
    ACI_LockonTarget=83,
    ACI_PharaohManCoffin=84,
    ACI_ShurikenChip=85,
    ACI_MagicFire=86,
    ACI_BombShoot=87,
    ACI_BassExplosionChip=88,
    ACI_LockOn=89
} AttackIndex;

typedef struct AttackParams AttackParams, *PAttackParams;

struct AttackParams {
    struct CellPosition m_position;
    byte family;
    byte m_hp;
};

typedef struct BackgroundDataManager BackgroundDataManager, *PBackgroundDataManager;

typedef struct TilemapEntry TilemapEntry, *PTilemapEntry;

typedef struct BGArchive BGArchive, *PBGArchive;

typedef struct BGTilemapArchive BGTilemapArchive, *PBGTilemapArchive;

typedef struct BGPaletteArchive BGPaletteArchive, *PBGPaletteArchive;

typedef struct BGTilesetArchive BGTilesetArchive, *PBGTilesetArchive;

typedef struct Color Color, *PColor;

typedef struct BGTilesetHeader BGTilesetHeader, *PBGTilesetHeader;

struct BGArchive {
    struct BGTilesetArchive *tilesetData;
    struct BGPaletteArchive *paletteData;
    struct BGTilemapArchive *tilemapData;
};

struct TilemapEntry {
    short tileIndex:10;
    short flipFlags:2;
    short paletteBank:4;
};

struct BGTilesetHeader {
    int m_tilesetWordCount;
    int m_offsetLzData;
    int m_offsetVram;
};

struct BGTilesetArchive {
    struct BGTilesetHeader vramData[3];
};

struct BGTilemapArchive {
    byte mapSizeX;
    byte mapSizeY;
    int offsetBg1;
    int offsetBg2;
    int offsetBg3;
    struct TilemapEntry tilemapData[1];
};

struct Color {
    byte R:5;
    byte G:5;
    byte B:5;
    byte fill:1;
};

struct BackgroundDataManager {
    byte mapGridSizeX;
    byte mapGridSizeY;
    byte _pad[2];
    short playerX;
    short playerY;
    struct BGArchive *archivePack;
    struct BGTilemapArchive *tilemapArchive;
    struct BGPaletteArchive *paletteArchive;
    struct BGTilesetArchive *tilesetArchive;
    void (*funcSingleCopy)(struct TilemapEntry, struct TilemapEntry, struct TilemapEntry, int, int);
    void *funcFullCopy;
    void (*funcSpecificCopy)(uint, uint);
};

struct BGPaletteArchive {
    int size;
    struct Color data[1];
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

typedef enum BattleEntryState {
    BES_Battle=0,
    BES_NonBattle=1,
    BES_Spawn=8
} BattleEntryState;

typedef enum BattleState {
    BS_EnemySpawned=1,
    BS_InBattle=2,
    BS_BattleStarted=4
} BattleState;

typedef enum SioTransmitStatus {
    STS_IDLE=0,
    STS_PLAYER_1=1,
    STS_PLAYER_2=2,
    STS_PLAYER_3=4,
    STS_PLAYER_4=8,
    STS_PLAYER=15,
    STS_ERROR=128
} SioTransmitStatus;

typedef enum BattleMpState {
    MPS_0=0,
    MPS_Stats=1,
    MPS_Hand=2,
    MPS_Input=3,
    MPS_Result=4,
    MPS_Idle=255
} BattleMpState;

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
    enum EnemyId id;
    byte x;
    byte y;
};

struct Battle {
    struct FunctionState state;
    byte initialActorCount[2];
    byte initialActorsSpawned[2];
    enum BattleEntryState battleEntryState;
    enum BattleState battleState;
    byte ba;
    byte maxEnemyCount;
    byte customScreenOpenCount;
    byte randomCellSeed;
    bool isGaugeFull;
    enum BackgroundId backgroundId;
    byte customScreenChipCount;
    byte customScreenSelectedChipCount;
    byte customGaugeSpeed;
    bool isInputLocked;
    byte startPressState; /* 0 = None, 1 = P1, 2 = P2 */
    byte multiDeleteBufferTimer;
    byte multiDeleteTempCounter;
    byte multiDeleteCount;
    bool isScreenDimChipActive;
    byte srcBattleHandCount;
    byte sioOwnerId;
    byte sioClientId;
    byte isMpReady;
    enum SioTransmitStatus flagTransmitStatus;
    enum BattleMpState mpState;
    bool isBattleActive;
    ushort battleTime;
    ushort curPlayerCount;
    ushort curEnemyCount;
    byte _pad1[8];
    ushort generalCounter;
    short mpComWaitTimer;
    byte _pad2[10];
    ushort customGaugeMeter;
    struct Actor *actorListPlayer[2];
    byte _pad3[4];
    byte enemyPriorityQueue[8];
    struct Actor *actorListEnemy[4];
    byte enemyIdList[4];
    uint battleFlag_buffer;
    uint battleFlag;
    uint _pad4;
    struct EnemySpawn *enemyList;
    byte srcBattleHandIndexList[6];
    byte srcBattleHandCodeList[6];
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
    CD_Bass=199,
    CD_PA_ZetaCannon1=202,
    CD_PA_ZetaCannon2=203,
    CD_PA_ZetaCannon3=204,
    CD_PA_ZetaSpread=205,
    CD_PA_ZetaRatton1=206,
    CD_PA_ZetaRatton2=207,
    CD_PA_ZetaRatton3=208,
    CD_PA_ZetaArrow=209,
    CD_PA_ZetaSpear=210,
    CD_PA_ZetaLance=211,
    CD_PA_OmegaCannon1=212,
    CD_PA_OmegaCannon2=213,
    CD_PA_OmegaCannon3=214,
    CD_PA_OmegaSpread=215,
    CD_PA_OmegaRatton1=216,
    CD_PA_OmegaRatton2=217,
    CD_PA_OmegaRatton3=218,
    CD_PA_OmegaArrow=219,
    CD_PA_OmegaSpear=220,
    CD_PA_OmegaLance=221,
    CD_PA_BetaBomb=222,
    CD_PA_BetaSword=223,
    CD_PA_BetaWave=224,
    CD_PA_BetaQuake=225,
    CD_PA_SigmaBomb=226,
    CD_PA_SigmaSword=227,
    CD_PA_SigmaWave=228,
    CD_PA_SigmaQuake=229,
    CD_PA_PoweredCannon=230,
    CD_PA_HeavyStamp=231,
    CD_PA_BigStraight=232,
    CD_PA_BloodSuck=233,
    CD_PA_DeathStorm=234,
    CD_PA_GutsShoot=235,
    CD_PA_LifeSaver=236,
    CD_PA_DoubleHero=237,
    CD_PharaohTrap=242
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
    byte chipCodes[5];
    byte elementIndex;
    byte family;
    byte subFamily;
    byte rarity;
    byte libraryIndex;
    byte alphabetIndex;
    byte b33;
    ushort damage;
    byte b2;
    byte b3;
    struct Tile *icon;
    struct Tile *tileset;
    struct Color *palette;
};

typedef struct BattleChipInventorySlot BattleChipInventorySlot, *PBattleChipInventorySlot;

struct BattleChipInventorySlot {
    byte m_chipCodeCount[6];
    short m_chipCodeChecksum[5];
};

typedef enum BattleFlag {
    BF_0=0,
    BF_ObjectInPlayerField=3,
    BF_05=5,
    BF_Cloudy_1=10,
    BF_Cloudy_2=11,
    BF_Cloudy_3=12,
    BF_Cloudy_4=13,
    BF_Cloudy_5=14,
    BF_Interrupt_0=28,
    BF_Interrupt_1=29,
    BF_Anubis_Player=30,
    BF_Anubis_Enemy=31
} BattleFlag;

typedef struct BattleMessage BattleMessage, *PBattleMessage;

typedef enum BattleMessageIndex {
    BMsg_BattleStart=0,
    BMsg_EnemyDeleted=1,
    BMsg_MegaManDeleted=2,
    BMsg_ProgramAdvance=3,
    BMsg_ScreenDimChipLeft=4,
    BMsg_ScreenDimChipRight=5,
    BMsg_DieBomb_L=6,
    BMsg_DieBomb_R=7,
    BMsg_08_ZetaOmegaPA_L=8,
    BMsg_09_ZetaOmegaPA_R=9,
    BMsg_0A_BetaSigmaPA_L=10,
    BMsg_0B_BetaSigmaPA_R=11,
    BMsg_MaxMode=12,
    BMsg_Busy=13,
    BMsg_OK=14
} BattleMessageIndex;

struct BattleMessage {
    enum FuncState state;
    byte _pad1;
    byte battleChipIndex;
    byte dieBombMultiplier;
    bool isActive;
    enum BattleMessageIndex messageIndex;
    byte scaleIndex;
    byte delay;
    byte affineIndex;
    byte _pad2;
    bool isScale;
    byte _pad3;
    short paChipTimer;
    short betaSigmaChipCount;
};

typedef struct BattleMessageList BattleMessageList, *PBattleMessageList;

struct BattleMessageList {
    struct BattleMessage list[16];
};

typedef enum BattleResultState {
    BRS_Winner=0,
    BRS_Loser=1,
    BRS_2=2,
    BRS_MPError=3
} BattleResultState;

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
    BattleType_5_Boss=5,
    BattleType_6_FinalBoss=6,
    BattleType_7=7,
    BattleType_8_NetworkReal=8,
    BattleType_9_NetworkTest=9
} BattleType;

typedef struct BattleUI BattleUI, *PBattleUI;

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

struct BattleUI {
    byte _pad0[3];
    byte lowHpTimer;
    enum BattleUiState uiFlag;
    byte chipNameWidth;
    byte fullChipGaugeAnimationTimer;
    bool isCustomGaugeRising;
    ushort hpDisplay;
    ushort hpActual;
    byte buffer[32];
};

typedef struct BgAnimationTask BgAnimationTask, *PBgAnimationTask;

typedef struct BgAnimParam BgAnimParam, *PBgAnimParam;

struct BgAnimParam {
    void *address;
    int type;
};

struct BgAnimationTask {
    byte enabled;
    byte _bgIndex;
    ushort updateTimer;
    struct BgAnimParam *dataArgStart;
    struct BgAnimParam *dataArgCurr;
    void *param2_endAddr;
    void *param3_vramDest;
    byte funcIndex;
    byte bgIndex;
    byte tileCount;
    byte tileBufferIndex;
};

typedef enum BgAnimType {
    BGT_Direct=0,
    BGT_Tileset=4,
    BGT_Tilemap=8
} BgAnimType;

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
    BGC_Initial=0,
    BGC_OnlyBg0=1,
    BGC_OnlyBg01=2,
    BGC_General=3,
    BGC_JackIn=4,
    BGC_MainMenu=5,
    BGC_GameOver=6
} BgControlType;

typedef struct BgDataArg BgDataArg, *PBgDataArg;

struct BgDataArg {
    int data;
    int waitFrames;
};

typedef enum BGMoveControlType {
    BMT_Offline=0,
    BMT_Online=1,
    BMT_Battle=2
} BGMoveControlType;

typedef struct BgParamTransferSimple BgParamTransferSimple, *PBgParamTransferSimple;

struct BgParamTransferSimple {
    void *addr;
    int param;
};

typedef struct BgParamTransferTilemap BgParamTransferTilemap, *PBgParamTransferTilemap;

struct BgParamTransferTilemap {
    int offset;
    int tilemap;
};

typedef struct BgParamTransferTransform BgParamTransferTransform, *PBgParamTransferTransform;

struct BgParamTransferTransform {
    void *addr;
    int param;
};

typedef struct BgTask BgTask, *PBgTask;

struct BgTask {
    void *dataSrc;
    void *vramDest;
    enum BgAnimType dataTransferType;
    byte bgIndex;
    byte tileCount;
    byte tileBufferIndex;
    struct BgAnimParam argList[1];
};

typedef struct BlendSettings BlendSettings, *PBlendSettings;

struct BlendSettings {
    byte bldCnt_Target1;
    byte bldCnt_Target2;
    byte bldAlpha_EVA;
    byte bldAlpha_EVB;
    byte bldY_EVA;
    byte _pad;
    ushort blendControl;
};

typedef struct Cam_End Cam_End, *PCam_End;

struct Cam_End {
    short inst;
};

typedef struct Cam_Move Cam_Move, *PCam_Move;

struct Cam_Move {
    short inst;
    short x;
    short y;
    short z;
    short time;
};

typedef struct Cam_Set Cam_Set, *PCam_Set;

struct Cam_Set {
    short inst;
    short x;
    short y;
    short z;
};

typedef struct Cam_Shake Cam_Shake, *PCam_Shake;

struct Cam_Shake {
    short inst;
    short strength;
    short time;
};

typedef struct Cam_Wait Cam_Wait, *PCam_Wait;

struct Cam_Wait {
    short inst;
    short time;
};

typedef struct Camera Camera, *PCamera;

struct Camera {
    byte _pad0[2];
    enum BGMoveControlType bgMovementControl;
    byte isActive;
    short cameraX; /* +right, center is middle of map */
    short cameraY; /* +down, center is middle of map */
    short lastCameraX;
    short lastCameraY;
    short shakeCounter;
    short shakeStrength;
    struct PositionXYZ *playerRealPos;
    int xLowerBound;
    int xUpperBound;
    int yUpperBound;
    int yLowerBound;
    int zUpperBound;
    int zLowerBound;
    struct PositionXYZ posMapNext;
    struct PositionXYZ posMap; /* x +up-right, y +down-right */
};

typedef struct CBS_C_Parts CBS_C_Parts, *PCBS_C_Parts;

struct CBS_C_Parts {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
};

typedef union CBS_Checksum CBS_Checksum, *PCBS_Checksum;

union CBS_Checksum {
    int checksum;
    struct CBS_C_Parts parts;
};

typedef struct CCIResult CCIResult, *PCCIResult;

struct CCIResult {
    int chipsUsed;
    int curChipIndex;
};

typedef struct CellPosition4 CellPosition4, *PCellPosition4;

struct CellPosition4 {
    int x;
    int y;
};

typedef struct CellStatus CellStatus, *PCellStatus;

struct CellStatus {
    enum PanelFlag panelFlags;
    enum PanelFlag panelFlagsNext;
    ushort walkableTimer;
    short s1;
    bool isVisible;
    bool isFlashing;
    byte b2;
    byte b3;
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

struct ToneData {
    enum InstrumentType type;
    byte key;
    byte length;
    byte pan_sweep;
    struct WaveData *wav;
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
    byte lfoSpeedCounter;
    byte lfoDelay;
    byte lfoDelayCounter;
    byte priority;
    byte pseudoEchoVolume;
    byte pseudoEchoLength;
    struct SoundChannel *chan;
    struct ToneData tone;
    byte gap[10];
    word unk_3A;
    dword unk_3C;
    byte *cmdPtr;
    byte *patternStack[3];
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
    struct WaveData *wav;
    byte *currentPointer;
    struct MusicPlayerTrack *track;
    struct SoundChannel *prevChannelPointer;
    struct SoundChannel *nextChannelPointer;
    uint dummy4;
    ushort xpi;
    ushort xpc;
};

struct WaveData {
    u16 type;
    u16 status;
    uint freq;
    uint loopStart;
    uint size;
    byte data[1];
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
    int *wavePointer;
    int *currentPointer;
    struct MusicPlayerTrack *track;
    void *prevChannelPointer;
    void *nextChannelPointer;
    byte dummy4[4];
    int unkPad;
};

typedef struct CharTile CharTile, *PCharTile;

struct CharTile {
    byte data[64];
};

typedef struct ChipBagSlot ChipBagSlot, *PChipBagSlot;

struct ChipBagSlot {
    union CBS_Checksum checksum0; /* chipLibraryIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int checksum3; /* (libraryIndex, then b22) << 10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int checksum1; /* chipCodeIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int checksum4; /* damage << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int checksum5; /* elementIndex << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    int checksum2; /* chipQty << 0x10 | (chipLibraryIndex << 0x8) | chipCodeIndex */
    short chipId;
    short chipCode;
    int _pad;
};

typedef struct ChipTrader ChipTrader, *PChipTrader;

struct ChipTrader {
    enum FuncState state;
    enum FuncState lastState;
    byte b2;
    byte arrowAnimationTimer;
    short exchangeAmount;
    ushort lastPageOffsetInsert;
    ushort curPageOffsetInsert;
    ushort curPageIndexInsert;
    ushort lastPageIndexInsert;
    ushort chipsSelected;
    ushort curPageOffsetSack;
    ushort lastPageOffsetSack;
    ushort curPageIndexSack;
    ushort lastPageIndexSack;
    ushort sackCount;
    byte b24;
    byte b25;
    byte b26;
    byte b27;
    byte b28;
    byte b29;
    struct TilemapEntry chipsInsertedBuffer[8];
    ushort curPageOffsetSort;
    ushort lastPageOffsetSort;
    ushort curPageIndexSort;
    ushort lastPageIndexSort;
    ushort m_b56;
    ushort drawnChipId;
    ushort drawnChipCode;
    byte b62;
    byte b63;
};

typedef struct CollisionResult CollisionResult, *PCollisionResult;

struct CollisionResult {
    int flag;
    int attribute;
};

typedef struct CopyParam CopyParam, *PCopyParam;

struct CopyParam {
    int blockIndex:10;
    int copyType:2;
    int extra:4;
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
    enum FuncState s0;
    enum FuncState s1;
    byte m_b2_column;
    byte b3;
    short sceneTimer;
    ushort finalCharacterDelay;
    byte sceneIndex;
    byte hourCounter;
    byte minuteCounter;
    byte bB;
    byte currentChipCount;
    byte maxChipCount;
    byte currentLevel;
    byte finalCharCounter;
};

typedef struct CreditsSceneData CreditsSceneData, *PCreditsSceneData;

typedef struct EntityAllocParams EntityAllocParams, *PEntityAllocParams;

struct EntityAllocParams {
    enum AllocParamEntityType entityType;
    byte m_param0;
    byte field2_0x2;
    byte field3_0x3;
    int m_param1;
    int m_param2;
    int m_param3;
    int m_param4;
};

struct CreditsSceneData {
    enum MapId mapId;
    byte creditsOffsetX;
    byte creditDisplayTimeSeconds;
    ushort *cameraCommands;
    void *npcCommandListList;
    short **spriteAreaList;
    struct EntityAllocParams *m_entityAllocList;
    void (*m_funcPreLoop)(void);
    void (*m_funcHblank)(void);
    void (*m_funcPostLoop)(void);
    struct BgTask *data[1];
};

typedef struct CursorAttributes CursorAttributes, *PCursorAttributes;

struct CursorAttributes {
    sbyte offX;
    sbyte offY;
    short attribute;
};

typedef struct CustomScreen CustomScreen, *PCustomScreen;

struct CustomScreen {
    struct FunctionState state;
    byte m_chipX;
    byte m_chipY;
    byte m_selectedChipIndices[5];
    byte m_selectedChipCount;
    bool m_isDeckEmpty;
    byte m_b9;
    byte b10;
    bool isAddSelected;
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

typedef struct CustomScreenReturn CustomScreenReturn, *PCustomScreenReturn;

struct CustomScreenReturn {
    int isActive;
    int r1val;
};

typedef struct DamageResult DamageResult, *PDamageResult;

struct DamageResult {
    enum PanelFlag attackPanelFlags;
    int attackerFlags;
    int dmgNone;
    int dmgElec;
    int dmgFire;
    int dmgWater;
    int dmgWood;
};

typedef struct DebugString DebugString, *PDebugString;

struct DebugString {
    byte X;
    byte Y;
    char str[1];
};

typedef struct Demo Demo, *PDemo;

struct Demo {
    struct FunctionState state;
    short demoMessageTimer;
    byte b6;
    byte _pad;
};

typedef union DispActor DispActor, *PDispActor;

union DispActor {
    int displayValue;
    struct Actor *actor;
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
    ushort mosaic;
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

typedef struct DivRes DivRes, *PDivRes;

struct DivRes {
    int quotient;
    int mod;
    int absmod;
};

typedef struct DivRes2 DivRes2, *PDivRes2;

struct DivRes2 {
    int quotient;
    int mod;
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
    void *srcAddress;
    void *dstAddress;
    enum DmaCntFlag control;
};

typedef struct DmaChannelList DmaChannelList, *PDmaChannelList;

struct DmaChannelList {
    struct DmaChannel *dma0;
    struct DmaChannel *dma1;
    struct DmaChannel *dma2;
    struct DmaChannel *dma3;
};

typedef struct DmaTransferDetail DmaTransferDetail, *PDmaTransferDetail;

struct DmaTransferDetail {
    void *startAddress;
    void *endAddress;
    uint wordCount;
};

typedef struct DmaTransferParams DmaTransferParams, *PDmaTransferParams;

struct DmaTransferParams {
    void *startAddress;
    void *endAddress;
    uint wordCount;
    enum DmaCntFlag control;
};

typedef union DO_DVP DO_DVP, *PDO_DVP;

typedef struct Position2 Position2, *PPosition2;

struct Position2 {
    short x;
    short y;
};

union DO_DVP {
    int displayValueBcd;
    struct Position2 pos;
};

typedef enum EffectID {
    EFI_QuickEffect=0,
    EFI_MapObject=1,
    EFI_BattleHP=2,
    EFI_Unk03=3,
    EFI_BombExplosion=4,
    EFI_Tower=5,
    EFI_Unk06=6,
    EFI_SwordSlash=7,
    EFI_FireColumn=8,
    EFI_BattleChip=9,
    EFI_TallExplosion=10,
    EFI_WaterSpray=11,
    EFI_ProgramAdvance=12,
    EFI_MegaManDelete=13,
    EFI_VirusDelete=14,
    EFI_BattleResult=15,
    EFI_WWWDoor=16,
    EFI_DieBombExplosion=17,
    EFI_CloudyRain=18,
    EFI_StonePiece=19,
    EFI_Laser=20,
    EFI_Boulders=21,
    EFI_TeleportPortal=22,
    EFI_CubeBreak=23,
    EFI_JellyCharging=24,
    EFI_AirBlowing=25,
    EFI_TrafficLight=26,
    EFI_TrafficBarrier=27,
    EFI_Car=28,
    EFI_TrafficBarrier2=29,
    EFI_TrafficLight2=30,
    EFI_Traffic=31,
    EFI_TrafficExplosion=32,
    EFI_TrafficCarParts=33,
    EFI_TrafficLightToggle=34,
    EFI_Pipe=35,
    EFI_Pipe2=36,
    EFI_Pipe3=37,
    EFI_NonstopBus=38,
    EFI_ElectricField=39,
    EFI_FloorBreak=40,
    EFI_ColorMan=41,
    EFI_Remobit=42,
    EFI_Chaud=43,
    EFI_PoisonCloud=44,
    EFI_TrafficSwitch=45,
    EFI_CountZap=46,
    EFI_ElecMan=47,
    EFI_BarSwitch=48,
    EFI_LightBulb=49,
    EFI_RollHeart=50,
    EFI_SmallElectrified=51,
    EFI_BombManBombExplosion=52,
    EFI_LifeVirusSeed=53,
    EFI_BombMan=54,
    EFI_LifeVirusAura=55,
    EFI_WWWPass=56,
    EFI_Scuttlest=57,
    EFI_LifeVirusMeteor=58,
    EFI_MagicMan=59,
    EFI_LockProgram=60,
    EFI_WWWIceWall=61,
    EFI_WWWBoulder=62,
    EFI_GutsMan=63,
    EFI_DynamyteRedDot=64,
    EFI_PharaohManCurse=65,
    EFI_DynamyteExplosion=66,
    EFI_MegaMan=67,
    EFI_JackIn=68,
    EFI_Sparks=69,
    EFI_Bass=70,
    EFI_GaiaBase=71,
    EFI_GeneratorLightning=72,
    EFI_PharaohManLaser=73,
    EFI_BombShootExplosion=74,
    EFI_NaviDelete=75
} EffectID;

typedef struct ElevationWallParams ElevationWallParams, *PElevationWallParams;

struct ElevationWallParams {
    int z;
    int range;
    int attribute;
};

typedef struct EncounterInfo EncounterInfo, *PEncounterInfo;

struct EncounterInfo {
    byte m_threshold;
    bool m_isBoss;
    struct EnemySpawn *m_enemyList;
};

typedef struct EnemyDetail EnemyDetail, *PEnemyDetail;

typedef struct Struct_8009DFD4_Sub Struct_8009DFD4_Sub, *PStruct_8009DFD4_Sub;

struct Struct_8009DFD4_Sub {
    short r0;
    short r1;
};

struct EnemyDetail {
    ushort hp;
    enum ElementID element;
    byte hpPosition;
    byte routineType;
    byte lzSpriteIndex;
    undefined1 field5_0x6;
    undefined1 field6_0x7;
    struct FamilyDetail family;
    struct Struct_8009DFD4_Sub dropTable[5];
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
    struct FieldObject *fieldEntity;
};

typedef struct EntityBounds EntityBounds, *PEntityBounds;

struct EntityBounds {
    short X;
    short Y;
    short Z;
    byte radius;
    byte height;
    uint id;
    uint idMask;
    uint *collisionRef;
};

typedef struct EntityBoundsParams EntityBoundsParams, *PEntityBoundsParams;

struct EntityBoundsParams {
    int x;
    int y;
    int z;
    int bounds;
    int id;
    int mask;
};

typedef enum EntityFlag {
    EF_1=1,
    EF_2=2
} EntityFlag;

typedef enum EntityFuncFlag {
    GFF_None=0,
    GFF_PlayerLocation=1,
    GFF_Actor=2,
    GFF_Attack=4,
    GFF_Effect=8,
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
    struct Attack *possibleAttackCell;
    struct PlayerSpec2 possiblePlayerSpec;
};

typedef struct EP_60_E_BattleHP_Param0 EP_60_E_BattleHP_Param0, *PEP_60_E_BattleHP_Param0;

struct EP_60_E_BattleHP_Param0 {
    ushort hp;
    ushort _pad;
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
    bool isApplyFadeFunc;
    enum FadeType fadeType;
    byte fadeStep;
    bool isFadeActive;
    bool isFadeStarted;
    byte _pad[3];
};

typedef union FamilyDetail_U FamilyDetail_U, *PFamilyDetail_U;

union FamilyDetail_U {
    struct FamilyDetail familyDetail;
};

typedef struct FieldObstacleManager FieldObstacleManager, *PFieldObstacleManager;

struct FieldObstacleManager {
    byte breakPriority[4];
    struct Attack *listObstacle[4];
    byte _pad[20];
};

typedef struct FixedBattleSettings FixedBattleSettings, *PFixedBattleSettings;

struct FixedBattleSettings {
    struct EnemySpawn *enemyDetail;
    struct BattleChip *presetFolder;
    enum BackgroundId backgroundId;
    enum BattleType battleType;
    bool m_isFolderShuffle;
    byte savedDir;
    int savedX;
    int savedY;
    int savedZ;
    bool m_isEscapable;
    byte _pad19[3];
};

typedef enum Flag_Event {
    F_EVENT_ACDC_TOWN_TRADE_FIRETOWR_F=0,
    F_EVENT_SCHOOL_AV_ROOM_TRADE_BSTRGARD_A=1,
    F_EVENT_SCHOOL_INFIRMARY_TRADE_SHOTGUN_K=2,
    F_EVENT_ACDC_TOWN_TRADE_KNGTSWRD_G=3,
    F_EVENT_GOVT_WATERWORKS_LOBBY_TRADE_BSTRPNCH_C=4,
    F_EVENT_DENTOWN_BLOCK_3_TRADE_RECOV300_C=5,
    F_EVENT_SCILAB_RESTAURANT_TRADE_WOODAURA_C=6,
    F_EVENT_GOVT_WATERWORKS_PURIFICATION_ROOM_TRADE_HEROSWRD_B=7,
    F_EVENT_SCHOOL_CLASS_1B_TRADE_REPAIR_H=8,
    F_EVENT_GOVT_WATERWORKS_OFFICE_TRADE_HAMMER_M=9,
    F_EVENT_ACDC_STATION_TRADE_XPANEL3_S=10,
    F_EVENT_SCHOOL_STORAGE_TRADE_BSTRBOMB_D=11,
    F_EVENT_ACDC_TOWN_TRADE_RECOV80_G=12,
    F_EVENT_GOVT_WATERWORKS_LOBBY_TRADE_REPAIR_G=13,
    F_EVENT_ACDC_TOWN_TRADE_10000Z=14,
    F_EVENT_DENTOWN_SUMMER_SCHOOL_TRADE_RATTON1_E=15,
    F_EVENT_SCILAB_POWER_PLANT_TRADE_RATTON3_M=16,
    F_EVENT_SCHOOL_CLASS_1B_TRADE_REPAIR_H_GATE=17,
    F_EVENT_SCHOOL_AV_ROOM_TRADE_BSTRGARD_A_GATE_1=18,
    F_EVENT_SCHOOL_AV_ROOM_TRADE_BSTRGARD_A_GATE_2=19,
    F_EVENT_SCHOOL_AV_ROOM_TRADE_BSTRGARD_A_GATE_3=20,
    F_EVENT_ACDC_TOWN_TRADE_RECOV80_G_GATE=21,
    F_EVENT_GOVT_WATERWORKS_LOBBY_TRADE_BSTRPNCH_C_GATE=22,
    F_EVENT_GOVT_WATERWORKS_LOBBY_TRADE_REPAIR_G_GATE_1=23,
    F_EVENT_GOVT_WATERWORKS_LOBBY_TRADE_REPAIR_G_GATE_2=24,
    F_EVENT_GOVT_WATERWORKS_OFFICE_TRADE_HAMMER_M_GATE=25,
    F_EVENT_ACDC_TOWN_TRADE_10000Z_GATE_1=26,
    F_EVENT_ACDC_TOWN_TRADE_10000Z_GATE_2=27,
    F_EVENT_ACDC_STATION_TRADE_XPANEL3_S_GATE=28,
    F_EVENT_SCHOOL_STORAGE_TRADE_BSTRBOMB_D_GATE=29,
    F_EVENT_GOVT_YUICHIRO_PC_VIRUS_MACHINE=30,
    F_EVENT_WWW_COMP_1_ICEBLOCK=31,
    F_EVENT_UNDERNET_SKILL_CHECK_RESET=32,
    F_EVENT_UNDERNET_6_SKILL_CHECK_FAIL=33,
    F_EVENT_UNDERNET_7_SKILL_CHECK_FAIL=34,
    F_EVENT_UNDERNET_9_SKILL_CHECK_FAIL=35,
    F_EVENT_UNDERNET_10_SKILL_CHECK_FAIL=36,
    F_EVENT_UNDERNET_11_SKILL_CHECK_FAIL=37,
    F_EVENT_WWW_COMP_5_SAVE_DISABLED=38,
    F_EVENT_GOVT_WATERWORKS_LOBBY_ELEVATOR=39,
    F_2F=47
} Flag_Event;

typedef enum Flag_Gate {
    F_GATE_00=0,
    F_GATE_01=1,
    F_GATE_02=2,
    F_GATE_03=3,
    F_GATE_04=4,
    F_GATE_05=5,
    F_GATE_06=6,
    F_GATE_07=7,
    F_GATE_08=8,
    F_GATE_09=9,
    F_GATE_0A=10,
    F_GATE_0B=11,
    F_GATE_0C=12,
    F_GATE_0D=13,
    F_GATE_0E=14,
    F_GATE_0F=15
} Flag_Gate;

typedef enum Flag_Ignore {
    F_IGNORE_WALL_00=0,
    F_IGNORE_WALL_01=1,
    F_IGNORE_WALL_02=2,
    F_IGNORE_WALL_03=3,
    F_IGNORE_WALL_04=4,
    F_IGNORE_WALL_05=5,
    F_IGNORE_WALL_06=6,
    F_IGNORE_WALL_07=7,
    F_IGNORE_WALL_08=8,
    F_IGNORE_WALL_09=9,
    F_IGNORE_WALL_0A=10,
    F_IGNORE_WALL_0B=11,
    F_IGNORE_WALL_0C=12,
    F_IGNORE_WALL_0D=13,
    F_IGNORE_WALL_0E=14,
    F_IGNORE_WALL_0F=15,
    F_IGNORE_WALL_10=16,
    F_IGNORE_WALL_11=17,
    F_IGNORE_WALL_12=18,
    F_IGNORE_WALL_13=19,
    F_IGNORE_WALL_14=20,
    F_IGNORE_WALL_15=21,
    F_IGNORE_WALL_16=22,
    F_IGNORE_WALL_17=23,
    F_IGNORE_WALL_18=24,
    F_IGNORE_WALL_19=25,
    F_IGNORE_WALL_1A=26,
    F_IGNORE_WALL_1B=27,
    F_IGNORE_WALL_1C=28,
    F_IGNORE_WALL_1D=29,
    F_IGNORE_WALL_1E=30,
    F_IGNORE_WALL_1F=31,
    F_IGNORE_MAP_DIALOGUE_00=64,
    F_IGNORE_MAP_DIALOGUE_01=65,
    F_IGNORE_MAP_DIALOGUE_02=66,
    F_IGNORE_MAP_DIALOGUE_03=67,
    F_IGNORE_MAP_DIALOGUE_04=68,
    F_IGNORE_MAP_DIALOGUE_05=69,
    F_IGNORE_MAP_DIALOGUE_06=70,
    F_IGNORE_MAP_DIALOGUE_07=71,
    F_IGNORE_MAP_DIALOGUE_08=72,
    F_IGNORE_MAP_DIALOGUE_09=73,
    F_IGNORE_MAP_DIALOGUE_0A=74,
    F_IGNORE_MAP_DIALOGUE_0B=75,
    F_IGNORE_MAP_DIALOGUE_0C=76,
    F_IGNORE_MAP_DIALOGUE_0D=77,
    F_IGNORE_MAP_DIALOGUE_0E=78,
    F_IGNORE_MAP_DIALOGUE_0F=79
} Flag_Ignore;

typedef enum Flag_Item {
    F_ITEM_ACDC_LAN_ROOM_PET=0,
    F_ITEM_ACDC_LAN_ROOM_WATERGUN=1,
    F_ITEM_OVEN_COMP_2_SHOTGUN_Q=2,
    F_ITEM_OVEN_COMP_2_500Z=3,
    F_ITEM_OVEN_COMP_2_LILBOMB_T=4,
    F_ITEM_OVEN_COMP_1_200Z=5,
    F_ITEM_ACDC_LAN_LIVING_ROOM_RECOV10_A=6,
    F_ITEM_OVEN_COMP_1_SHOTGUN_Q=7,
    F_ITEM_OVEN_COMP_1_400Z=8,
    F_ITEM_OVEN_COMP_1_STEAL_A=9,
    F_ITEM_OVEN_COMP_1_SWORD_B=10,
    F_ITEM_ACDC_MAYL_PC_KEYMAYL=11,
    F_ITEM_ACDC_MAYL_PC_RECOV50_L=12,
    F_ITEM_ACDC_YAI_PC_KEYYAI=13,
    F_ITEM_ACDC_YAI_PC_RECOV30_L=14,
    F_ITEM_ACDC_DEX_PC_KEYDEX=15,
    F_ITEM_ACDC_DEX_PC_XPANEL3_B=16,
    F_ITEM_INTERNET_1_MD_1=17,
    F_ITEM_INTERNET_1_MD_2=18,
    F_ITEM_INTERNET_1_MD_3=19,
    F_ITEM_INTERNET_1_MD_4=20,
    F_ITEM_INTERNET_1_MD_5=21,
    F_ITEM_INTERNET_1_MD_6=22,
    F_ITEM_INTERNET_1_MD_7=23,
    F_ITEM_INTERNET_1_MD_8=24,
    F_ITEM_INTERNET_2_MD_1=25,
    F_ITEM_INTERNET_2_MD_2=26,
    F_ITEM_INTERNET_2_MD_3=27,
    F_ITEM_INTERNET_2_MD_4=28,
    F_ITEM_INTERNET_2_MD_5=29,
    F_ITEM_INTERNET_2_MD_6=30,
    F_ITEM_INTERNET_2_MD_7=31,
    F_ITEM_INTERNET_2_MD_8=32,
    F_ITEM_INTERNET_2_MD_9=33,
    F_ITEM_INTERNET_2_MD_10=34,
    F_ITEM_INTERNET_2_MD_11=35,
    F_ITEM_INTERNET_2_MD_12=36,
    F_ITEM_INTERNET_2_MD_13=37,
    F_ITEM_INTERNET_2_MD_14=38,
    F_ITEM_INTERNET_2_MD_15=39,
    F_ITEM_INTERNET_2_MD_16=40,
    F_ITEM_SCHOOL_COMP_1_SHOKWAVE_L=41,
    F_ITEM_SCHOOL_COMP_2_800Z=42,
    F_ITEM_SCHOOL_COMP_2_HICANNON_I=43,
    F_ITEM_SCHOOL_COMP_3_HPMEMORY=44,
    F_ITEM_SCHOOL_COMP_3_SPREADER_H=45,
    F_ITEM_SCHOOL_COMP_4_400Z=46,
    F_ITEM_SCHOOL_COMP_4_QUAKE_A=47,
    F_ITEM_SCHOOL_COMP_5_CANNON_C=48,
    F_ITEM_SCHOOL_INFIRMARY_RECOV50_G=49,
    F_ITEM_GOVT_YUICHIRO_PC_KEYDAD=50,
    F_ITEM_GOVT_LUNCH_CART_COMP_KEYSAL=51,
    F_ITEM_GOVT_LUNCH_CART_COMP_RECOV120_A=52,
    F_SCHOOL_LIBRARY_ESCAPE_H=53,
    F_SCHOOL_AV_ROOM_REPAIR_A=54,
    F_SCHOOL_WATERWORKS_COMP_1_SONIWAVE_J=55,
    F_SCHOOL_WATERWORKS_COMP_2_HPMEMORY=56,
    F_SCHOOL_WATERWORKS_COMP_3_WIDESWRD_C=57,
    F_SCHOOL_WATERWORKS_COMP_4_MCANNON_L=58,
    F_SCHOOL_WATERWORKS_COMP_2_RECOV80_C=59,
    F_SCHOOL_WATERWORKS_COMP_3_TRIARROW_A=60,
    F_SCHOOL_WATERWORKS_COMP_5_POWERUP=61,
    F_SCHOOL_WATERWORKS_COMP_6_1000Z=62,
    F_SCHOOL_WATERWORKS_COMP_3_ICEPUNCH_B=63,
    F_ITEM_POWER_PLANT_COMP_1_BATTERYA=64,
    F_ITEM_POWER_PLANT_COMP_1_RATTON1_D=65,
    F_ITEM_POWER_PLANT_COMP_1_RECOV120_C=66,
    F_ITEM_POWER_PLANT_COMP_1_5000Z=67,
    F_ITEM_POWER_PLANT_COMP_1_XPANEL3_G=68,
    F_ITEM_POWER_PLANT_COMP_2_1000Z=69,
    F_ITEM_POWER_PLANT_COMP_2_800Z=70,
    F_ITEM_POWER_PLANT_COMP_2_1200Z=71,
    F_ITEM_POWER_PLANT_COMP_2_BATTERYAB=72,
    F_ITEM_POWER_PLANT_COMP_2_BATTERYCDE=73,
    F_ITEM_POWER_PLANT_COMP_3_1000Z=74,
    F_ITEM_POWER_PLANT_COMP_3_BATTERYABC=75,
    F_ITEM_POWER_PLANT_COMP_3_500Z=76,
    F_ITEM_POWER_PLANT_COMP_4_1800Z=77,
    F_ITEM_POWER_PLANT_COMP_4_2000Z=78,
    F_ITEM_POWER_PLANT_COMP_4_TYPHOON_D=79,
    F_ITEM_TRAFFIC_LIGHT_COMP_1_800Z=80,
    F_ITEM_TRAFFIC_LIGHT_COMP_1_BUBBLER_K=81,
    F_ITEM_TRAFFIC_LIGHT_COMP_2_800Z=82,
    F_ITEM_TRAFFIC_LIGHT_COMP_2_ESCAPE_N=83,
    F_ITEM_TRAFFIC_LIGHT_COMP_3_HEATER_O=84,
    F_ITEM_TRAFFIC_LIGHT_COMP_3_500Z=85,
    F_ITEM_TRAFFIC_LIGHT_COMP_3_FIRETOWR_T=86,
    F_ITEM_TRAFFIC_LIGHT_COMP_4_1000Z=87,
    F_ITEM_TRAFFIC_LIGHT_COMP_4_HPMEMORY=88,
    F_ITEM_INTERNET_1_TRILANCE_M=89,
    F_ITEM_INTERNET_2_POWERUP_1=90,
    F_ITEM_INTERNET_2_POWERUP_2=91,
    F_ITEM_2DC=92,
    F_ITEM_TRAFFIC_LIGHT_COMP_5_AQUATOWR_C=93,
    F_ITEM_TRAFFIC_LIGHT_COMP_5_2400Z=94,
    F_ITEM_TRAFFIC_LIGHT_COMP_5_RECOV80_G=95,
    F_ITEM_POWER_PLANT_COMP_4_BATTERYABC=96,
    F_ITEM_2E1=97,
    F_ITEM_SCHOOL_CLASS_5B_SPREADER_J=98,
    F_ITEM_SCHOOL_2F_HALLWAY_XPANEL1_B=99,
    F_ITEM_SCHOOL_STORAGE_HPMEMORY=100,
    F_ITEM_GOVT_WATERWORKS_CONTROL_ROOM_HPMEMORY=101,
    F_ITEM_DENTOWN_SUMMER_SCHOOL_BARRIER_R=102,
    F_ITEM_INTERNET_3_MD_1=103,
    F_ITEM_INTERNET_3_MD_2=104,
    F_ITEM_INTERNET_3_MD_3=105,
    F_ITEM_INTERNET_3_MD_4=106,
    F_ITEM_INTERNET_3_ROCKCUBE_O=107,
    F_ITEM_INTERNET_3_FTRSWORD_B=108,
    F_ITEM_DENTOWN_ANTIQUE_COMP_KEYMIYU=109,
    F_ITEM_DENTOWN_ANTIQUE_COMP_BARRIER_S=110,
    F_ITEM_SCILAB_FISH_STAND_COMP_KEYMASA=111,
    F_ITEM_SCILAB_FISH_STAND_COMP_TRISPEAR_J=112,
    F_ITEM_INTERNET_4_MD_1=113,
    F_ITEM_INTERNET_4_MD_2=114,
    F_ITEM_INTERNET_4_MD_3=115,
    F_ITEM_INTERNET_4_MD_4=116,
    F_ITEM_INTERNET_4_AQUASWRD_A=117,
    F_ITEM_INTERNET_4_HPMEMORY=118,
    F_ITEM_UNDERNET_1_MD_1=119,
    F_ITEM_UNDERNET_1_MD_2=120,
    F_ITEM_UNDERNET_1_MD_3=121,
    F_ITEM_UNDERNET_1_MD_4=122,
    F_ITEM_UNDERNET_1_THUNDER1_H=123,
    F_ITEM_UNDERNET_1_HPMEMORY=124,
    F_ITEM_UNDERNET_2_MD_1=125,
    F_ITEM_UNDERNET_2_MD_2=126,
    F_ITEM_UNDERNET_2_MD_3=127,
    F_ITEM_UNDERNET_2_MD_4=128,
    F_ITEM_UNDERNET_2_6000Z=129,
    F_ITEM_302=130,
    F_ITEM_UNDERNET_3_MD_1=131,
    F_ITEM_UNDERNET_3_MD_2=132,
    F_ITEM_UNDERNET_3_MD_3=133,
    F_ITEM_UNDERNET_3_MD_4=134,
    F_ITEM_UNDERNET_3_REMOBIT1_N=135,
    F_ITEM_308=136,
    F_ITEM_UNDERNET_4_MD_1=137,
    F_ITEM_UNDERNET_4_MD_2=138,
    F_ITEM_UNDERNET_4_MD_3=139,
    F_ITEM_UNDERNET_4_MD_4=140,
    F_ITEM_UNDERNET_4_10000Z=141,
    F_ITEM_30E=142,
    F_ITEM_UNDERNET_5_MD_1=143,
    F_ITEM_UNDERNET_5_MD_2=144,
    F_ITEM_UNDERNET_5_MD_3=145,
    F_ITEM_UNDERNET_5_MD_4=146,
    F_ITEM_UNDERNET_5_RINGZAP1_H=147,
    F_ITEM_314=148,
    F_ITEM_UNDERNET_6_MD_1=149,
    F_ITEM_UNDERNET_6_MD_2=150,
    F_ITEM_UNDERNET_6_MD_3=151,
    F_ITEM_UNDERNET_6_MD_4=152,
    F_ITEM_UNDERNET_6_WIDESWRD_S=153,
    F_ITEM_UNDERNET_6_HPMEMORY=154,
    F_ITEM_UNDERNET_7_MD_1=155,
    F_ITEM_UNDERNET_7_MD_2=156,
    F_ITEM_UNDERNET_7_MD_3=157,
    F_ITEM_UNDERNET_7_MD_4=158,
    F_ITEM_UNDERNET_7_10000Z=159,
    F_ITEM_320=160,
    F_ITEM_UNDERNET_8_MD_1=161,
    F_ITEM_UNDERNET_8_MD_2=162,
    F_ITEM_UNDERNET_8_MD_3=163,
    F_ITEM_UNDERNET_8_MD_4=164,
    F_ITEM_UNDERNET_8_KNGTSWRD_B=165,
    F_ITEM_326=166,
    F_ITEM_UNDERNET_9_MD_1=167,
    F_ITEM_UNDERNET_9_MD_2=168,
    F_ITEM_UNDERNET_9_MD_3=169,
    F_ITEM_UNDERNET_9_MD_4=170,
    F_ITEM_UNDERNET_9_8000Z=171,
    F_ITEM_UNDERNET_9_RECOV150_A=172,
    F_ITEM_UNDERNET_10_MD_1=173,
    F_ITEM_UNDERNET_10_MD_2=174,
    F_ITEM_UNDERNET_10_MD_3=175,
    F_ITEM_UNDERNET_10_MD_4=176,
    F_ITEM_UNDERNET_10_5000Z=177,
    F_ITEM_UNDERNET_10_POWERUP=178,
    F_ITEM_UNDERNET_11_MD_1=179,
    F_ITEM_UNDERNET_11_MD_2=180,
    F_ITEM_UNDERNET_11_MD_3=181,
    F_ITEM_UNDERNET_11_MD_4=182,
    F_ITEM_UNDERNET_11_REDWAVE_J=183,
    F_ITEM_338=184,
    F_ITEM_UNDERNET_12_MD_1=185,
    F_ITEM_UNDERNET_12_MD_2=186,
    F_ITEM_UNDERNET_12_MD_3=187,
    F_ITEM_UNDERNET_12_MD_4=188,
    F_ITEM_UNDERNET_12_MD_5=189,
    F_ITEM_UNDERNET_12_MD_6=190,
    F_ITEM_UNDERNET_12_MD_7=191,
    F_ITEM_UNDERNET_12_MD_8=192,
    F_ITEM_UNDERNET_12_HEROSWRD_I=193,
    F_ITEM_UNDERNET_12_20000Z=194,
    F_ITEM_343=195,
    F_ITEM_344=196,
    F_ITEM_WWW_COMP_1_RECOV200_C=197,
    F_ITEM_WWW_COMP_1_5000Z=198,
    F_ITEM_WWW_COMP_1_3000Z=199,
    F_ITEM_WWW_COMP_1_FIRESWRD_P=200,
    F_ITEM_WWW_COMP_2_HURICANE_L=201,
    F_ITEM_WWW_COMP_2_8000Z=202,
    F_ITEM_WWW_COMP_2_FTRSWRD_P=203,
    F_ITEM_WWW_COMP_3_4000Z=204,
    F_ITEM_WWW_COMP_3_RECOV300_L=205,
    F_ITEM_WWW_COMP_4_TIMEBOM3_P=206,
    F_ITEM_WWW_COMP_4_HPMEMORY=207,
    F_ITEM_WWW_COMP_5_2000Z=208,
    F_ITEM_WWW_COMP_5_BIGWAVE_K=209,
    F_ITEM_OTHER_DOGHOUSE_COMP_SHOTGUN_K=210,
    F_ITEM_OTHER_SERVBOT_COMP_HPMEMORY=211,
    F_ITEM_OTHER_NEW_GAME_MACHINE_COMP_CROSSGUN_K=212,
    F_ITEM_OTHER_TELEPHONE_COMP_ESCAPE_J=213,
    F_ITEM_OTHER_TELEPHONE_COMP_1000Z=214,
    F_ITEM_OTHER_CAR_COMP_HPMEMORY=215,
    F_ITEM_OTHER_WATERWORKS_VENDING_MACHINE_SPREADER_J=216,
    F_ITEM_OTHER_LOBBY_TV_COMP_ESCAPE_L=217,
    F_ITEM_OTHER_LARGE_MONITOR_COMP_HICANNON_J=218,
    F_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_RECOV200_L=219,
    F_ITEM_OTHER_CONTROL_EQUIPMENT_COMP_3000Z=220,
    F_ITEM_OTHER_SCILAB_VENDING_MACHINE_5000Z=221,
    F_ITEM_OTHER_RECYCLED_PET_COMP_HPMEMORY=222,
    F_ITEM_OTHER_BIG_VASE_COMP_QUAKE3_C=223,
    F_ITEM_OTHER_BLACKBOARD_COMP_POWERUP=224
} Flag_Item;

typedef enum Flag_System {
    F_SYSTEM_PLAYER_ACTIVE=0,
    F_SYSTEM_JACK_IN=1,
    F_SYSTEM_NO_RANDOM_BATTLES=2,
    F_SYSTEM_START_MENU_OPEN=4,
    F_SYSTEM_INPUT_DELAY_ON=5,
    F_SYSTEM_DIALOGUE_COMPLETE=6,
    F_SYSTEM_NO_START_MENU=7,
    F_SYSTEM_NO_ESCAPE=8,
    F_SYSTEM_SAVE_OK=9
} Flag_System;

typedef struct FlappyParam FlappyParam, *PFlappyParam;

struct FlappyParam {
    byte jitter[5];
    byte delay;
    byte damage;
    byte b7;
};

typedef enum FlipType {
    FT_NoFlip=0,
    FT_FlipH=1,
    FT_FlipV=2,
    FT_FlipHV=3
} FlipType;

typedef struct FrameCounter FrameCounter, *PFrameCounter;

struct FrameCounter {
    ushort counter;
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
    byte sortOrderFolder;
    byte sortDirectionFolder;
    byte sortOrderSack;
    byte sortDirectionSack;
    byte b4;
    byte batteryCharge;
    ushort u6;
    byte _pad[5];
    bool hasUsedEscape;
    byte totalAwardedChips;
    byte totalBattles8;
    short totalStepCounter;
    ushort totalBattles16;
    ushort multiBattleTotal;
    ushort multiBattleWins;
    int gameTimer;
    int inBattleTimer;
    int checksum;
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

typedef struct InvisArg InvisArg, *PInvisArg;

struct InvisArg {
    ushort invisTime;
    byte b1;
};

typedef struct IPWResult IPWResult, *PIPWResult;

struct IPWResult {
    int isWalkable;
    enum PanelFlag panelFlag;
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
    Item_WoodArmr=70,
    Item_BattA_Ct=80,
    Item_BattB_Ct=81,
    Item_BattC_Ct=82,
    Item_BattD_Ct=83,
    Item_BattE_Ct=84
} ItemId;

typedef struct Main Main, *PMain;

typedef struct Manager Manager, *PManager;

typedef struct World World, *PWorld;

typedef struct MatchBattleState MatchBattleState, *PMatchBattleState;

typedef struct MapEventState MapEventState, *PMapEventState;

typedef struct Scene Scene, *PScene;

typedef struct MapChange MapChange, *PMapChange;

typedef struct Transition Transition, *PTransition;

typedef struct MainMenu MainMenu, *PMainMenu;

typedef struct WindowSettings WindowSettings, *PWindowSettings;

typedef struct Text Text, *PText;

typedef struct ScreenDim ScreenDim, *PScreenDim;

typedef struct ScreenTilemapContainer ScreenTilemapContainer, *PScreenTilemapContainer;

typedef struct PetStatusControl PetStatusControl, *PPetStatusControl;

typedef struct PasscodeEntry PasscodeEntry, *PPasscodeEntry;

typedef struct TextUI TextUI, *PTextUI;

typedef struct StartMenu StartMenu, *PStartMenu;

typedef struct Shop Shop, *PShop;

typedef struct Menu Menu, *PMenu;

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

typedef struct PlayerLocation PlayerLocation, *PPlayerLocation;

typedef struct WorldPosition WorldPosition, *PWorldPosition;

typedef union SceneArg SceneArg, *PSceneArg;

typedef struct PlayerAnimation PlayerAnimation, *PPlayerAnimation;

typedef struct MapEntrance MapEntrance, *PMapEntrance;

typedef enum TextStateDelayType {
    TSDT_NoDelay=0,
    TSDT_DelayCounter=1,
    TSDT_WaitForButtonPress=2
} TextStateDelayType;

typedef enum PasscodeResult {
    PCR_None=0,
    PCR_1=1,
    PCR_2=2
} PasscodeResult;

typedef struct ShopItem ShopItem, *PShopItem;

typedef enum MoveType {
    MT_Standing=0,
    MT_Walking=1,
    MT_Running=2
} MoveType;

typedef enum PlayerLocationKeyFlag {
    PK_Walk=16,
    PK_Run=32,
    PK_Commentary=256,
    PK_JackIn=512
} PlayerLocationKeyFlag;

typedef struct SceneArg_Actor SceneArg_Actor, *PSceneArg_Actor;

typedef struct SceneArg_Animate SceneArg_Animate, *PSceneArg_Animate;

typedef struct MapEntranceOptions MapEntranceOptions, *PMapEntranceOptions;

typedef struct PlayerAnimateArgs PlayerAnimateArgs, *PPlayerAnimateArgs;

typedef enum PlayerAnimArgState {
    PlayerAnimArgState_Inactive=0,
    PlayerAnimArgState_Active=1,
    PlayerAnimArgState_Complete=2
} PlayerAnimArgState;

struct MapEntrance {
    enum MapId area;
    byte _pad;
    byte direction;
    struct PositionXYZ pos;
};

struct StartMenu {
    struct FunctionState state;
    byte menuPos;
    byte openState;
    byte selectedIndex;
    byte cursorTimer;
    struct TilemapEntry tilemapZenny[12];
};

struct SceneArg_Animate {
    int waitTimer;
    int filterAnimId;
    struct PlayerAnimateArgs *curArgPtr;
    enum PlayerAnimArgState state;
};

struct PlayerAnimation {
    byte animState; /* 0 = motion | 1 = locked | 2 = animating */
    byte isTalking;
    byte curMoveIndex;
    undefined field3_0x3;
    undefined2 field4_0x4;
    undefined field5_0x6;
    undefined field6_0x7;
    struct PositionXYZ position;
};

struct ScreenTilemapContainer {
    struct TilemapEntry screen0[1024];
    struct TilemapEntry screen1[1024];
    struct TilemapEntry screen2[1024];
    struct TilemapEntry screen3[1024];
};

struct ShopItem {
    byte itemType;
    byte itemIndex;
    byte chipCode;
    byte stock;
    int price;
};

struct Manager {
    enum Manager_State gameState;
    byte field1_0x1;
    byte field2_0x2;
    byte field3_0x3;
    byte m_softResetDelayTimer;
    byte field5_0x5;
    byte field6_0x6;
    byte field7_0x7;
};

struct WorldPosition {
    struct PositionXYZ pos;
    int direction;
    int fullArea;
};

struct World {
    struct FunctionState state;
    union AreaUnion currentArea;
    enum StoryFlag storyFlag;
    enum FadeType fadeType;
    byte _pad1;
    byte IsBattleTimePaused;
    byte ba;
    enum BackgroundId battleBackgroundId;
    union AreaUnion lastArea;
    byte curEventFlag;
    enum BattleType battleType;
    enum BattleResultState lastBattleResult;
    bool isShuffleFolder;
    byte commentaryTextIndex;
    byte fadeStep;
    byte statAttack;
    byte statSpeed;
    byte statCharge;
    byte armor;
    enum SongId currentSongId;
    byte bustingRank;
    bool isTalkingToNPC;
    byte pressedA;
    ushort hpCurrent;
    ushort hpMax;
    int _pad2;
    int mapChangeCount;
    struct PlayerLocation *playerLocation;
    struct EnemySpawn *enemyList;
    struct BattleChip *chipFolder;
    void *npcCommandList;
    struct PositionXYZ savedPos;
    int savedDirection;
    struct WorldPosition lastMapPosOffline;
    struct WorldPosition lastMapPosOnline;
    void *updatingEntity;
    int zenny;
};

struct PlayerLocation {
    struct EntityHeader header;
    struct FamilyDetail family;
    struct FunctionState state;
    byte isCheckBoundary;
    byte eventFlagQueue[3];
    byte direction; /* 0-7, 0= up, clockwise */
    byte lastDirection;
    enum MoveType moveType;
    enum MoveType lastMoveType;
    byte currDirMoveIndex; /* 8-F = walking, 10-17 = runnning */
    byte lastDirMoveIndex;
    byte owner;
    byte isCheckElevation;
    byte _pad1[4];
    ushort stuckTimer;
    byte _pad2[6];
    struct MapOffsetStruct pos;
    int collisionStanding;
    struct PositionXYZ diff;
    byte _pad3[12];
    int stepCounter;
    int collisionInteract;
    enum PlayerLocationKeyFlag moveKeyFlags;
    ushort u62;
    int collisionMoving;
    ushort _pad4;
    byte subPos_lo;
    byte subPos_hi;
    byte _pad5[20];
    struct Sprite m_sprite;
};

struct MainMenu {
    struct FunctionState state;
    ushort timerCapcomLogo;
    byte arrowAnimationTimer;
    byte starAnimationTimer;
    byte selectedOption;
    byte b9;
    byte ba;
    byte isSavePresent;
    byte _pad[4];
};

struct PlayerAnimateArgs {
    byte animationId;
    byte dx;
    byte dy;
    byte time;
};

struct MapChange {
    struct MapEntrance destination;
    byte type;
    byte _pad1;
    byte destinationIndex;
    byte _pad2;
    void *destinationList;
};

struct MapEntranceOptions {
    struct MapEntrance entrance;
    int options;
};

struct Menu {
    struct FunctionState state;
    byte chipid;
    byte chipCode;
    byte _pad1;
    byte isShowChipDetail;
    struct BattleChipData *chipData;
    byte curFolderVisualOffset;
    byte lastFolderVisualOffset;
    byte inputDelay;
    byte folderAnimationCounter;
    byte folderCount;
    byte folderSelectionFlag;
    ushort pageIndexFolder;
    ushort lastPageIndexFolder;
    ushort pageOffsetFolder;
    ushort lastPageOffsetFolder;
    short curFolderCount;
    ushort pageIndexSack;
    short lastPageIndexSack;
    ushort pageOffsetSack;
    short lastPageOffsetSack;
    ushort curSackCount;
    ushort u26;
    ushort selectedChipPageOffset;
    ushort selectedChipListOffset;
    struct TilemapEntry numberDisplay[8];
    short curSortMenuArrowPos;
    short lastSortMenuArrowPos;
    ushort u40;
    ushort u42;
    ushort u44;
    byte _pad2[6];
    int chipDetailX;
    int chipDetailY;
};

struct WindowSettings {
    uint winH01;
    uint winV01;
    uint winInOut;
};

struct PetStatusControl {
    byte _pad[4];
    enum FuncState state;
    byte petAnimCounter;
    byte alertAnimCounter;
    byte alertAudioCounter;
};

struct MapEventState {
    struct FunctionState state;
    byte fixedBattleIndex;
    byte _pad1;
    byte counterSecretStation;
    byte _pad2;
    byte b8;
    byte b9;
    byte ba;
    byte bb;
    byte _pad3[4];
};

struct PasscodeEntry {
    byte _pad0[4];
    byte isRandom;
    byte guessValue;
    byte b6;
    byte selectedDigit;
    byte guess[2];
    byte display[2];
    byte digitChangeDelay[2];
    byte digitSetDelay[2];
    byte solutionValue;
    enum PasscodeResult passcodeResult;
    byte guessCheckResult;
    byte digitSelectorTimer;
    byte solution[2];
    byte isInputDisabled;
    byte currSelectedDigit;
    byte guessCount;
    byte _pad1[7];
};

struct Text {
    bool isWriteText;
    byte textBlockIndex;
    byte textBufferOffset;
    byte scriptOptions;
    enum TextStateDelayType dialogDelayType;
    byte isScriptJump;
    byte counter1;
    byte portraitPalIndex;
    byte nextDelay;
    byte commandParseDelay;
    byte nextAnimationIndex;
    byte currAnimationIndex;
    ushort dialogDelayCounter;
    byte textCol;
    byte textRow;
    byte layoutLineOffset;
    byte scriptParseDelay;
    byte dialogSkipDelay;
    byte charShade;
    byte b14;
    byte b15_optionFlag;
    byte b16;
    byte passcodeChoice;
    enum KeyInput curKeyState;
    enum KeyInput heldKeyState;
    enum KeyInput toggleKeyState;
    byte dialogArrowAnimCycle;
    byte arrowAnimFrame;
    byte *commandTextPointer;
    ushort *textBlockPointer;
    byte *layoutTextPointer;
    struct TilemapEntry *dialogLayout;
    uint itemIdList[4];
    void *textPointerAfterKeyPrint;
    void *otherTextPointerAfterKeyPrint;
    byte possibleBcdBuffer[12];
    byte tempPlayerDirection;
    byte _pad[3];
    ushort textBufIndex;
    ushort otherTempTextBufIndex;
    struct Sprite portrait;
};

struct SceneArg_Actor {
    struct MapEntranceOptions *entranceOptions;
    struct Scene *m_px14;
    void *m_px18;
    struct Actor *m_px1c_actor;
};

union SceneArg {
    struct SceneArg_Actor actorArg;
    struct SceneArg_Animate animArg;
};

struct Scene {
    struct FunctionState state;
    byte dialogueIndex;
    byte areaDialogueIndex;
    byte b6;
    byte b7;
    ushort sceneTimer;
    ushort counter;
    void *scenePointer;
    union SceneArg sceneArg;
    int isAnimating;
    struct PlayerAnimation *pAnim;
    int slidePos;
    int _pad;
};

struct Shop {
    struct FunctionState state;
    byte inventoryCount;
    byte itemIndex;
    byte arrowPos;
    byte arrowVisualPos;
    byte arrowAnimationCounter;
    byte pageIndex;
    byte shopClerkType;
    byte _pad1;
    ushort menuPosSlideOut;
    ushort _pad2;
    int zenny;
    struct ShopItem inventoryList[1];
};

struct Transition {
    byte state;
    byte animState;
    byte animFrames;
    byte destinationType;
    struct MapEntrance *transitionLocation;
};

struct ScreenDim {
    struct FunctionState state;
    byte family;
    byte subFamily;
    byte owner;
    byte isDim;
    ushort timer;
    short _pad1;
    ushort damage;
    short _pad2;
    int parent;
    union EntityParam param_14;
    byte targetX;
    byte targetY;
    byte _pad3[6];
};

struct MatchBattleState {
    struct PlayerBattleState p1;
    struct PlayerBattleState p2;
};

struct Main {
    struct Manager *manager;
    struct Input *input;
    struct World *world;
    struct Battle *battle;
    struct DisplaySettings *display;
    struct Camera *camera;
    struct FadeSettings *fade;
    struct BattleUI *battleUi;
    struct MatchBattleState *matchBattleState;
    struct MapEventState *mapEventState;
    struct Scene *scene;
    struct MapChange *mapChange;
    struct Transition *transition;
    struct MainMenu *mainMenu;
    struct WindowSettings *window;
    struct BlendSettings *blend;
    struct Demo *demo;
    struct BackgroundDataManager *bgDataManager;
    struct Text *textHandler;
    struct BattleMessage *battleMessageList;
    struct FrameCounter *frameCounter;
    struct ScreenDim *screenDim;
    struct BgAnimationTask *bgAnimationTaskList;
    struct ScreenTilemapContainer *screens;
    struct PetStatusControl *petStatusControl;
    struct PasscodeEntry *passcodeEntry;
    struct TextUI *textUI;
    struct StartMenu *startMenuState;
    struct Shop *shop;
    struct Menu *menu;
    struct GameStats *gameStats;
    struct FieldObstacleManager *fieldObstacleManager;
};

struct TextUI {
    byte textWidth;
    byte totalTextLength;
    byte charShade;
    byte _pad;
    uint numberBuffer[4];
};

typedef struct MapDataHeader MapDataHeader, *PMapDataHeader;

struct MapDataHeader {
    int boundaryDataOffset;
    int elevationDataOffset;
    int coverDataOffset;
    int eventDataOffset;
};

typedef struct MapOffset MapOffset, *PMapOffset;

struct MapOffset {
    int x;
    int y;
};

typedef struct MapParameters MapParameters, *PMapParameters;

typedef struct WallSegment WallSegment, *PWallSegment;

typedef struct WallParameters WallParameters, *PWallParameters;

struct WallSegment {
    ushort gridIndex;
    ushort wallParamPtr;
};

struct WallParameters {
    byte zCoord;
    byte attributes;
    byte zRange;
    byte shape;
};

struct MapParameters {
    struct WallSegment *wallSegmentStart;
    short wallSegmentCount;
    byte gridSizeX;
    byte gridSizeY;
    ushort curGridIndex;
    byte m_unknownIndex;
    byte m_b1;
    int mapTileX; /* +up-right */
    int mapTileY; /* +down-right */
    struct WallParameters *curWallParam;
};

typedef struct MapParameters_Boundary MapParameters_Boundary, *PMapParameters_Boundary;

typedef struct MapWallSegment MapWallSegment, *PMapWallSegment;

struct MapParameters_Boundary {
    struct WallSegment *wallSegmentStart;
    short wallSegmentCount;
    ushort curGridIndex;
    byte gridSizeX;
    byte gridSizeY;
    byte countMapSegmentHistory;
    byte m_b1;
    byte curWallAttribute;
    byte field8_0xd;
    byte field9_0xe;
    byte field10_0xf;
    struct MapWallSegment *currMapSegment;
    struct MapWallSegment *mapSegmentEnd;
};

struct MapWallSegment {
    struct WallSegment wallSegment;
    struct MapOffset position;
    int _pad;
};

typedef struct MapSegmentSubPosDetail MapSegmentSubPosDetail, *PMapSegmentSubPosDetail;

struct MapSegmentSubPosDetail {
    struct PositionXYZ curr;
    struct PositionXYZ last;
    struct PositionXYZ plus;
};

typedef struct MapWallSectionHeader MapWallSectionHeader, *PMapWallSectionHeader;

struct MapWallSectionHeader {
    int m_segmentCount;
    struct WallSegment m_wallSegments[1];
};

typedef struct MatchMpState MatchMpState, *PMatchMpState;

typedef struct PlayerMpState PlayerMpState, *PPlayerMpState;

typedef enum PMS_PacketType {
    PT_0=0,
    PT_Stats=1,
    PT_Hand=2,
    PT_3=3,
    PT_BattleResult=4,
    PT_NetworkBattleReal=32,
    PT_NetworkBattleTest=64,
    PT_Movement=128,
    PT_NetworkTradeAccept=130,
    PT_None=255
} PMS_PacketType;

typedef union PlayerMpState_PacketContents PlayerMpState_PacketContents, *PPlayerMpState_PacketContents;

typedef struct PlayerMpState_KeyInput PlayerMpState_KeyInput, *PPlayerMpState_KeyInput;

typedef struct PlayerMpState_Stats PlayerMpState_Stats, *PPlayerMpState_Stats;

typedef struct PlayerMpState_Hand PlayerMpState_Hand, *PPlayerMpState_Hand;

typedef struct PlayerMpState_Result PlayerMpState_Result, *PPlayerMpState_Result;

typedef struct PlayerMpState_Trade PlayerMpState_Trade, *PPlayerMpState_Trade;

struct PlayerMpState_Stats {
    byte header;
    byte attack;
    byte speed;
    byte charge;
    byte field4_0x4;
    short hpCurrent;
    short hpMax;
    byte randomSeed;
    byte armor;
};

struct PlayerMpState_Hand {
    byte header;
    byte chipsUsed;
    byte listBattleHandIndex[6];
    byte isAddSelected;
    byte field4_0x9;
    byte field5_0xa;
};

struct PlayerMpState_Result {
    byte header;
    byte field1_0x1;
    byte rank;
    byte chipId;
    byte chipCode;
    byte field5_0x5;
    byte field6_0x6;
    byte field7_0x7;
    byte field8_0x8;
    byte field9_0x9;
    byte field10_0xa;
};

struct PlayerMpState_Trade {
    byte chipId;
    byte chipCode;
    byte field2_0x2;
    byte field3_0x3;
    byte field4_0x4;
    short field5_0x5;
    short field6_0x7;
    byte field7_0x9;
    byte field8_0xa;
};

struct PlayerMpState_KeyInput {
    byte header;
    enum KeyInput curKeys;
    enum KeyInput toggledKeys;
    enum KeyInput heldKeys;
    enum KeyInput lastKeys;
    short field5_0x9;
};

union PlayerMpState_PacketContents {
    struct PlayerMpState_KeyInput keyInput;
    struct PlayerMpState_Stats stats;
    struct PlayerMpState_Hand hand;
    struct PlayerMpState_Result result;
    struct PlayerMpState_Trade trade;
};

struct PlayerMpState {
    enum PMS_PacketType packetType;
    union PlayerMpState_PacketContents contents;
    int seqNum;
};

struct MatchMpState {
    struct PlayerMpState *p1;
    struct PlayerMpState *p2;
};

typedef struct Menu_Email Menu_Email, *PMenu_Email;

struct Menu_Email {
    struct FunctionState state;
    byte m_chipid;
    byte m_chipCode;
    byte b2;
    byte isShowChipDetail;
    struct BattleChipData *m_chipData;
    byte pageOffsetEmail;
    byte arrowPos;
    byte pageIndexEmail;
    byte folderAnimationCounter;
    byte emailCount;
    byte animationCounter; /* 0 = none, 1 = deck, 2 = bag */
    byte mailFlagCount;
    byte inputDelay;
    ushort lastPageIndexFolder;
    ushort pageOffsetFolder;
    ushort lastPageOffsetFolder;
    short curFolderCount;
    ushort pageIndexSack;
    short lastPageIndexSack;
    ushort pageOffsetSack;
    short lastPageOffsetSack;
    ushort curSackCount;
    ushort m_st1;
    ushort selectedChipPageOffset;
    ushort selectedChipListOffset;
    struct TilemapEntry numberDisplay[8];
    short curSortMenuArrowPos;
    short lastSortMenuArrowPos;
    short s40;
    short s42;
    short m_sxx0;
    short sxx1;
    int ix9;
    int chipDetailX;
    int chipDetailY;
};

typedef struct Menu_MegaMan Menu_MegaMan, *PMenu_MegaMan;

struct Menu_MegaMan {
    struct FunctionState state;
    byte m_chipid;
    byte m_chipCode;
    byte b2;
    byte isShowChipDetail;
    struct BattleChipData *m_chipData;
    byte curCursorPos;
    byte lastCursorPos;
    byte pageIndexLibrary;
    byte folderAnimationCounter;
    byte sideArrowAnimationCounter;
    byte isPowerupPresent;
    byte armorCount;
    byte menuDelay;
    byte isStatChanging;
    byte field15_0x15;
    byte field16_0x16;
    byte armorList[4];
    byte field18_0x1b;
    ushort pageIndexSack;
    short lastPageIndexSack;
    ushort pageOffsetSack;
    short lastPageOffsetSack;
    ushort curSackCount;
    ushort m_st1;
    ushort selectedChipPageOffset;
    ushort selectedChipListOffset;
    struct TilemapEntry numberDisplay[8];
    short curSortMenuArrowPos;
    short lastSortMenuArrowPos;
    short s40;
    short s42;
    short m_sxx0;
    short sxx1;
    int ix9;
    int chipDetailX;
    int chipDetailY;
};

typedef struct Menu_Network Menu_Network, *PMenu_Network;

struct Menu_Network {
    struct FunctionState state;
    byte m_chipid;
    byte m_chipCode;
    byte b2;
    byte isShowChipDetail;
    struct BattleChipData *m_chipData;
    byte arrowPos;
    byte lastArrowPos;
    byte animationTimer;
    byte inputDelay;
    ushort otherPlayerWaitCounter;
    ushort waitCounter;
    byte b14;
    byte lastPageIndexFolder;
    ushort pageOffsetFolder;
    int curChipCount;
    byte arrowPosSort;
    byte lastArrowPosSort;
    byte field18_0x1e;
    byte lastPageIndexSack;
    ushort pageOffsetTrade;
    short lastPageOffsetSack;
    ushort pageIndexTrade;
    ushort lastPageIndexTrade;
    ushort selectedChipPageOffset;
    ushort selectedChipListOffset;
    struct TilemapEntry numberDisplay[2];
    int tradeRevealCounter;
    int tradedChipId;
    int tradedChipCode;
    short curSortMenuArrowPos;
    short lastSortMenuArrowPos;
    short s40;
    short s42;
    short m_sxx0;
    short sxx1;
    int ix9;
    int chipDetailX;
    int chipDetailY;
};

typedef struct MonitorTask MonitorTask, *PMonitorTask;

typedef enum MonitorTaskStatus {
    MTS_Stopped=0,
    MTS_Active=2,
    MTS_Running=4,
    MTS_Sleeping=8
} MonitorTaskStatus;

struct MonitorTask {
    enum MonitorTaskStatus status;
    byte sleepTimer;
    short _pad2;
    int _pad4;
    int *curStackTop;
    int *stackTop;
};

typedef struct MosquritoParam MosquritoParam, *PMosquritoParam;

struct MosquritoParam {
    ushort val0;
    byte damage;
    int diffX;
};

typedef struct MovementOffset MovementOffset, *PMovementOffset;

struct MovementOffset {
    byte directionMovementIndex;
    byte b0;
    short s0;
    int offsetX;
    int offsetY;
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
    struct ToneData *tone;
    byte *part[1];
};

struct MusicPlayer {
    struct MusicPlayerInfo *info;
    struct MusicPlayerTrack *track;
    byte trackCount;
    word unk_A;
};

struct MusicPlayerInfo {
    struct SongHeader *songHeader;
    enum MusicPlayerStatus status;
    byte trackCount;
    byte priority;
    byte cmd;
    byte unk_B;
    uint clock;
    byte gap[8];
    byte *memAccArea;
    word tempoD;
    word tempoU;
    word tempoI;
    word tempoC;
    word fadeOI;
    word fadeOC;
    word fadeOV;
    struct MusicPlayerTrack *tracks;
    struct ToneData *tone;
    uint ident;
    void (*MPlayMainNext)(struct MusicPlayerInfo *);
    struct MusicPlayerInfo *musicPlayerNext;
};

typedef struct NetworkOptionSelectResult NetworkOptionSelectResult, *PNetworkOptionSelectResult;

typedef enum NOSR_Type {
    NOSR_Trade=128,
    NOSR_TradeAccept=130,
    NOSR_Blank=240
} NOSR_Type;

struct NetworkOptionSelectResult {
    int result;
    enum NOSR_Type option;
    struct PlayerMpState *otherMpState;
};

typedef struct NPC NPC, *PNPC;

typedef struct PositionByteXYZ PositionByteXYZ, *PPositionByteXYZ;

struct PositionByteXYZ {
    byte m_X;
    byte m_Y;
    byte m_Z;
};

struct NPC {
    struct EntityHeader header;
    struct FamilyDetail family; /* 4 = inc count, 5 = steps, 7 = state */
    struct FunctionState state;
    byte radius;
    byte height;
    byte currDirection;
    byte lastDirection;
    byte npcIndex;
    struct PositionByteXYZ posSub;
    byte currFrameIndex;
    byte lastFrameIndex;
    byte paletteIndex;
    byte isMovingZ;
    byte isTalking;
    byte scriptStatus;
    byte _pad1[2];
    byte areaDialogueIndex;
    enum FuncState savedState1;
    enum FuncState savedState2;
    enum FuncState savedState3;
    short moveDeltaCount;
    short _pad2;
    struct PositionXYZ curr;
    struct PositionXYZ subNext;
    short currSpriteIndex;
    short lastSpriteIndex;
    struct PositionXYZ diff;
    int npcIdFlag;
    int m_currentCommand;
    int collisionInfo;
    int movementFlags;
    void *commandListStart;
    int spritePriority;
    int currObjExcludeFlags;
    int lastObjExcludeFlags;
    struct PositionXYZ next;
    byte _pad3[24];
    struct Sprite sprite;
};

typedef struct NPCParam NPCParam, *PNPCParam;

struct NPCParam {
    struct PositionXYZ position;
    uint family;
};

typedef enum NpcTalkState {
    NTS_None=0,
    NTS_TalkReadyNpc=1,
    NTS_TalkReadyPlayer=2,
    NTS_Talking=3
} NpcTalkState;

typedef struct OamAddObjectArgs OamAddObjectArgs, *POamAddObjectArgs;

typedef struct ObjectXYAttributes ObjectXYAttributes, *PObjectXYAttributes;

typedef struct ObjectTileAttributes ObjectTileAttributes, *PObjectTileAttributes;

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

struct ObjectTileAttributes {
    ushort index:10;
    ushort priority:2;
    ushort paletteBank:4;
};

struct OamAddObjectArgs {
    struct ObjectXYAttributes m_xyAttrs;
    struct ObjectTileAttributes m_tileAttrs;
    int m_listIndex;
    int m_listOffset;
};

typedef struct OamAttributeListNode OamAttributeListNode, *POamAttributeListNode;

struct OamAttributeListNode {
    struct ObjectXYAttributes xyDetails;
    struct ObjectTileAttributes tileDetail;
    byte unused;
    byte nextIndex;
};

typedef struct ObjectAffineAttributes ObjectAffineAttributes, *PObjectAffineAttributes;

struct ObjectAffineAttributes {
    short pa;
    short pb;
    short pc;
    short pd;
    byte angle;
    byte scaleX;
    byte scaleY;
};

typedef struct ObjectControl ObjectControl, *PObjectControl;

struct ObjectControl {
    struct ObjectXYAttributes xyDetails;
    struct ObjectTileAttributes tileDetails;
    short affineDetails;
};

typedef struct ObjectEntryFlag0 ObjectEntryFlag0, *PObjectEntryFlag0;

struct ObjectEntryFlag0 {
    byte m_objSize:2;
    bool m_isHFlip:1;
    bool m_isVFlip:1;
};

typedef struct ObjectPos ObjectPos, *PObjectPos;

struct ObjectPos {
    int objectX;
    int objectY;
    int isDraw;
};

typedef struct Palette Palette, *PPalette;

struct Palette {
    struct Color colors[16];
};

typedef enum PanelFlagIndex {
    PFI_Self_Default=1,
    PFI_Target_Solid=2,
    PFI_Self_Grounded=3,
    PFI_Self_Tower=4,
    PFI_0x5=5,
    PFI_0x6=6,
    PFI_0x7=7,
    PFI_0x8=8,
    PFI_Self_Actor=9,
    PFI_Target_Object=10,
    PFI_0xB=11,
    PFI_Self_Actor_Armored=12,
    PFI_Self_Object=13,
    PFI_Self_Actor_Drain=14,
    PFI_Moving=15,
    PFI_FieldBlock=16,
    PFI_BlockDestroyer=17,
    PFI_0x12=18,
    PFI_0x13=19,
    PFI_0x14=20,
    PFI_Self_Explosion=21,
    PFI_Self_Freezing=22,
    PFI_0x17=23,
    PFI_Self_Breaking=24,
    PFI_Self_Extension=25,
    PFI_Self_Extension_Grounded=26,
    PFI_RattonMegalian=27,
    PFI_Self_Extension_Moving=28,
    PFI_Self_Extension_Armored=29,
    PFI_0x1E=30,
    PFI_Self_Block=31,
    PFI_0x20=32,
    PFI_0x21=33,
    PFI_0x22=34,
    PFI_Self_Push=35,
    PFI_Self_Grounded_Push=36,
    PFI_Self_BreakingChaser=37,
    PFI_Target_Extension=38,
    PFI_Grounded=39,
    PFI_0x28=40,
    PFI_0x29=41,
    PFI_0x2A=42,
    PFI_Trap=43,
    PFI_0x2C=44,
    PFI_Self_GroundedNumb=45,
    PFI_0x2E=46,
    PFI_0x2F=47,
    PFI_Self_Numbing=48,
    PFI_0x31=49,
    PFI_Sealed=50,
    PFI_Target_BreakingBlock=51,
    PFI_Target_NoStealing=52
} PanelFlagIndex;

typedef struct PETBattery PETBattery, *PPETBattery;

struct PETBattery {
    byte isChargePressed;
    byte isRechargeDisabled;
    byte rechargeTarget;
    byte batteryState;
    ushort rechargeTime;
    ushort rechargeCounter;
    byte field6_0x8;
    byte field7_0x9;
    byte isActive;
    byte b7;
    byte b8;
    byte b9;
    byte b10;
    byte b11;
};

typedef struct PlayerAnimateArgsSet PlayerAnimateArgsSet, *PPlayerAnimateArgsSet;

struct PlayerAnimateArgsSet {
    struct PositionXYZ position;
    int state;
};

typedef enum PlayerFlag_6E {
    PF_CanMove=1,
    PF_2=2,
    PF_4=4,
    PF_InBattle=8,
    PF_Standby=15
} PlayerFlag_6E;

typedef struct PlayerLocationIsMovingResult PlayerLocationIsMovingResult, *PPlayerLocationIsMovingResult;

struct PlayerLocationIsMovingResult {
    int isMoving;
    int changedDir;
};

typedef enum PlayerStatus {
    PS_Invulnerable=1,
    PS_Numb=2,
    PS_Deleted=4,
    PS_BusterActivated=8,
    PS_ChipActivated=16,
    PS_Freeze=32,
    PS_IronBody=64,
    PS_Drain=128
} PlayerStatus;

typedef struct Position4 Position4, *PPosition4;

struct Position4 {
    int x;
    int y;
};

typedef struct PositionShort PositionShort, *PPositionShort;

struct PositionShort {
    short x;
    short y;
};

typedef struct PowerPlant PowerPlant, *PPowerPlant;

struct PowerPlant {
    int _unused0;
    byte solutionSelector[8];
    int switchFlags;
    byte _unused1[16];
    byte slots[8][16];
};

typedef enum QuickEffect {
    QE_ShortExplosion=0,
    QE_SimpleHit=1,
    QE_ArmorHit=2,
    QE_ShotgunBurst=6,
    QE_ShotgunHit=7,
    QE_MiniBombExplosion=11,
    QE_BubblerHit=12,
    QE_HeaterHit=13,
    QE_Recover=14,
    QE_TeleMove_Big_Start=15,
    QE_TeleMove_Big_End=16,
    QE_TeleMove_Mid_Start=17,
    QE_TeleMove_Mid_End=18,
    QE_TeleMove_Small_Start=19,
    QE_TeleMove_Small_End=20,
    QE_Glint=21,
    QE_MegaManTeleportOut=22,
    QE_MegaManTeleportIn=23,
    QE_PanelBreakSmall=24,
    QE_SwordStrike=25,
    QE_FireHit=26,
    QE_ElecHit=27,
    QE_AquaHit=28,
    QE_WoodHit=29,
    QE_FloshellMiniBombSmoke=32,
    QE_TimeBombSpawn=34,
    QE_SparkStrike=35,
    QE_SharkManSplash=38,
    QE_BubbleShieldPop=39,
    QE_PanelBreakLarge=43,
    QE_ActivateProgAdv=44,
    QE_None=255
} QuickEffect;

typedef struct RankResult RankResult, *PRankResult;

struct RankResult {
    int totalRank;
    int timeBcd;
    int timeRank;
};

typedef struct RattonParam RattonParam, *PRattonParam;

struct RattonParam {
    byte hp;
    byte damage;
    byte paletteIndex;
    int speed;
};

typedef struct Rectangle Rectangle, *PRectangle;

struct Rectangle {
    byte x;
    byte y;
    byte w;
    byte h;
};

typedef enum RelationFlag {
    RF_NoRelation=0,
    RF_SameID=1,
    RF_SameCode=2,
    RF_Free=3
} RelationFlag;

typedef struct SceneCamera SceneCamera, *PSceneCamera;

struct SceneCamera {
    ushort *commandList;
    ushort movementTimer;
    byte isTimerEnabled;
    byte field3_0x7;
};

typedef struct ScreenDimArg ScreenDimArg, *PScreenDimArg;

typedef enum ScreenDimIndex {
    SD_Recover=0,
    SD_WoodMan=1,
    SD_Steal=2,
    SD_PoweredCannon=3,
    SD_ActivateProgAdv=4,
    SD_FireMan=5,
    SD_NumberMan=6,
    SD_GutsMan=7,
    SD_Escape=8,
    SD_Repair=9,
    SD_Cube=10,
    SD_TimeBomb=12,
    SD_Invisible=15,
    SD_IceMan=16,
    SD_StoneMan=17,
    SD_Geddon=18,
    SD_Cloudy=19,
    SD_ElecManEscape=20,
    SD_Mine=21,
    SD_Anubis=22,
    SD_Barrier=23,
    SD_IronBody=24,
    SD_Candle=25,
    SD_Gauge=26,
    SD_Remobit=27,
    SD_Interrupt=28,
    SD_SkullMan=29,
    SD_Roll=30,
    SD_BigStraight=31,
    SD_GutsShoot=32,
    SD_DeathStorm=33,
    SD_Drain=34,
    SD_ColorMan=35,
    SD_ProtoMan=36,
    SD_SharkMan=37,
    SD_ElecMan=38,
    SD_PharaohTrap=39,
    SD_SnakeEgg=40,
    SD_Dynamyte=41,
    SD_PharaohMan=42,
    SD_ShadowMan=43,
    SD_MagicMan=44,
    SD_BombMan=45,
    SD_Bass=46,
    SD_LockOn=47,
    SD_LifeSaver=48,
    SD_DoubleHero=49,
    SD_HeavyStamp=50,
    SD_BloodSuck=51
} ScreenDimIndex;

struct ScreenDimArg {
    enum ScreenDimIndex family;
    byte subFamily;
};

typedef enum ScriptOption {
    TS_BreakLoop=1,
    TS_ShowPortrait=2,
    TS_Unskippable_Script=4,
    TS_08=8,
    TS_DrawArrow=16,
    TS_PasscodeEntry=32,
    TS_DisablePasscodeInput=64,
    TS_Skip_Text_Sound=128
} ScriptOption;

typedef struct SeqNumRecv SeqNumRecv, *PSeqNumRecv;

struct SeqNumRecv {
    byte curr;
    byte last;
};

typedef enum ShopBuyResult {
    BR_Success=0,
    BR_NotEnough=1,
    BR_SoldOut=2
} ShopBuyResult;

typedef struct SioClient SioClient, *PSioClient;

typedef struct SioPacket SioPacket, *PSioPacket;

struct SioPacket {
    byte seqNum;
    byte flagIdleClients;
    short checksum;
    struct PlayerMpState data;
    int _pad;
};

struct SioClient {
    byte activeFlag;
    byte isSetupDone;
    byte flagSessionPackets;
    enum SioTransmitStatus flagRecentPackets;
    bool isRecvReady[4];
    byte field5_0x8;
    bool isMpError;
    byte sendDelay;
    byte seqNumSend;
    struct SeqNumRecv seqNumRecv[4];
    int sendDataCount;
    int recvDataCount[4];
    struct SioPacket *sendPacketA;
    struct SioPacket *sendPacketB;
    struct SioPacket *recvPacketBuffer[4];
    struct SioPacket *recvPacketA[4];
    struct SioPacket *recvPacketB[4];
    struct SioPacket packetData[14];
};

typedef struct SioControl SioControl, *PSioControl;

struct SioControl {
    byte SioCnt_Lo;
    byte SioCnt_Hi;
    ushort siomlt_send;
};

typedef struct Song Song, *PSong;

struct Song {
    struct SongHeader *header;
    word musicPlayer;
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
    struct CgbChannel *cgbChans;
    void (*MPlayMainHead)(struct MusicPlayerInfo *);
    struct MusicPlayerInfo *musicPlayerHead;
    void (*CgbSound)(void);
    void (*CgbOscOff)(byte);
    int (*MidiKeyToCgbFreq)(byte, byte, byte);
    void (*MPlayJumpTable)(void);
    void (*plynote)(struct MusicPlayerInfo *, struct MusicPlayerTrack *);
    void (*ExtVolPit)(void);
    byte gap2[16];
    struct SoundChannel chans[12];
    byte pcmBuffer[3168];
};

typedef enum SpriteAffineFlag {
    SAF_None=0,
    SAF_Enabled=3,
    SAF_Blend=4
} SpriteAffineFlag;

typedef struct SpriteAnimParam SpriteAnimParam, *PSpriteAnimParam;

struct SpriteAnimParam {
    enum SpriteIndex spriteIndex;
    short spriteFrame;
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

typedef struct SpriteFlipArg SpriteFlipArg, *PSpriteFlipArg;

struct SpriteFlipArg {
    byte _pad0:4;
    bool isHFlip:1;
    bool isVFlip:1;
    byte _pad1:2;
};

typedef struct SpriteHeader SpriteHeader, *PSpriteHeader;

struct SpriteHeader {
    byte m_unk0;
    byte unk1;
    byte unk2;
    byte m_animationCount;
};

typedef struct SpriteList SpriteList, *PSpriteList;

struct SpriteList {
    byte *header;
    int length;
};

typedef struct SpriteLzDetails SpriteLzDetails, *PSpriteLzDetails;

struct SpriteLzDetails {
    byte spriteCount;
    byte _pad[3];
    enum SpriteIndex indexList[8];
    struct SpriteArchive_Header *spritePtrList[8];
    void *next;
};

typedef struct SpriteObjectEntry SpriteObjectEntry, *PSpriteObjectEntry;

struct SpriteObjectEntry {
    byte tileNumber;
    sbyte x;
    sbyte y;
    byte flag1;
    byte flag2;
};

typedef struct SpriteParam SpriteParam, *PSpriteParam;

struct SpriteParam {
    enum SpriteIndex index;
    int palette;
};

typedef struct SpritePosResult SpritePosResult, *PSpritePosResult;

struct SpritePosResult {
    int success;
    int screenX;
    int screenY;
};

typedef struct SpriteTilesetDetail SpriteTilesetDetail, *PSpriteTilesetDetail;

struct SpriteTilesetDetail {
    struct SpriteTilesetHeader *spriteTilesetPointer;
    uint dstTileOffset;
};

typedef enum SpriteType {
    D0_Desk=208
} SpriteType;

typedef struct SRFParam SRFParam, *PSRFParam;

struct SRFParam {
    byte b0;
    byte b1;
    byte b2;
    byte b3;
};

typedef struct SRFReturn SRFReturn, *PSRFReturn;

struct SRFReturn {
    int newY;
    int newX;
};

typedef enum StartMenuState {
    SMS_Suspended=32,
    SMS_SubMenuOpen=64,
    SMS_StartMenuOpen=128
} StartMenuState;

typedef struct Struct_1804_Return Struct_1804_Return, *PStruct_1804_Return;

struct Struct_1804_Return {
    int x0;
    int x1;
};

typedef struct Struct_1A40 Struct_1A40, *PStruct_1A40;

struct Struct_1A40 {
    byte damage;
    byte b2;
};

typedef struct Struct_56D1C_Out Struct_56D1C_Out, *PStruct_56D1C_Out;

struct Struct_56D1C_Out {
    int family;
    int damageFactor;
};

typedef struct Struct_7B5F8 Struct_7B5F8, *PStruct_7B5F8;

struct Struct_7B5F8 {
    enum SpriteIndex spriteIndex;
    byte frameIndex;
    byte priority;
    int objectExcludeFlags;
    int paletteIndex;
};

typedef struct Struct_807091C Struct_807091C, *PStruct_807091C;

struct Struct_807091C {
    byte m_spriteIndex;
    byte m_frameIndex;
    short valC;
};

typedef struct Struct_98E50 Struct_98E50, *PStruct_98E50;

struct Struct_98E50 {
    enum ElementID element;
    byte family;
    byte hp;
    byte spriteIndex;
};

typedef struct Struct_C1C0 Struct_C1C0, *PStruct_C1C0;

struct Struct_C1C0 {
    byte bx00_updateType;
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

typedef struct Struct_Enemy Struct_Enemy, *PStruct_Enemy;

struct Struct_Enemy {
    byte data[176];
};

typedef struct Struct_Ret_23AC Struct_Ret_23AC, *PStruct_Ret_23AC;

struct Struct_Ret_23AC {
    int m_ret0;
    int m_ret1;
    int m_ret2;
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

typedef struct SwordySpec SwordySpec, *PSwordySpec;

struct SwordySpec {
    byte x;
    enum ElementID element;
};

typedef struct TargetDistanceResult TargetDistanceResult, *PTargetDistanceResult;

struct TargetDistanceResult {
    int isGood;
    int distance;
};

typedef struct TargetPosXZ TargetPosXZ, *PTargetPosXZ;

struct TargetPosXZ {
    int x;
    int z;
};

typedef struct TextDst TextDst, *PTextDst;

struct TextDst {
    byte *dstAddressTextBuf;
    byte *dstAddressVram;
};

typedef enum TextOption {
    TF_PickOptionMask=15,
    TF_Unused=16,
    TF_PickActive=32,
    TF_DisableInput=64,
    TF_DialogueActive=128
} TextOption;

typedef struct Tile8 Tile8, *PTile8;

struct Tile8 {
    byte data[64];
};

typedef struct TilemapReturn TilemapReturn, *PTilemapReturn;

struct TilemapReturn {
    int tilemapEntryBG1;
    int tilemapEntryBG2;
    int tilemapEntryBG3;
};

typedef struct TileTransferDetail TileTransferDetail, *PTileTransferDetail;

struct TileTransferDetail {
    short offset:10;
    short flipType:2;
};

typedef enum TimerControl {
    TIMER_1CLK=0,
    TIMER_64CLK=1,
    TIMER_256CLK=2,
    TIMER_1024CLK=3,
    TIMER_INTR_ENABLE=64,
    TIMER_ENABLE=128
} TimerControl;

typedef struct Traffic Traffic, *PTraffic;

struct Traffic {
    ushort carTimer;
    ushort lightTimer;
    enum FuncState state;
    byte nextLightIndex;
    bool isNeutral;
    byte carReadyState;
    byte activeCarList[4];
    undefined field7_0xc;
    undefined field8_0xd;
    undefined field9_0xe;
    undefined field10_0xf;
};

typedef struct TrajectoryXYResult TrajectoryXYResult, *PTrajectoryXYResult;

struct TrajectoryXYResult {
    int delay;
    int dx;
    int dy;
};

typedef struct TrajectoryZResult TrajectoryZResult, *PTrajectoryZResult;

struct TrajectoryZResult {
    int dz;
    int time;
};

typedef struct TransferDetail_1799C TransferDetail_1799C, *PTransferDetail_1799C;

struct TransferDetail_1799C {
    void *srcAddress;
    int length;
    struct Color *paletteSrc;
    void *dstAddress;
};

typedef struct TransferDetail_1F700 TransferDetail_1F700, *PTransferDetail_1F700;

struct TransferDetail_1F700 {
    void *srcAddress;
    void *dstAddress;
};

typedef struct TransferStruct TransferStruct, *PTransferStruct;

struct TransferStruct {
    void *srcAddress;
    void *endAddress;
    int len;
};

typedef struct TryChipSelectResult TryChipSelectResult, *PTryChipSelectResult;

struct TryChipSelectResult {
    byte canBeSelected;
    enum RelationFlag relationToPriorChip;
};

typedef struct TutorialBattleOptions TutorialBattleOptions, *PTutorialBattleOptions;

struct TutorialBattleOptions {
    struct EnemySpawn *spawnList;
    int battleType;
    struct BattleChip *folder;
    bool isShuffled;
};

typedef unsigned short    wchar16;
typedef enum WaitDmaFlag {
    Dma0=1,
    Dma1=2,
    Dma2=4,
    Dma3=8
} WaitDmaFlag;

typedef struct WallSegmentElevation WallSegmentElevation, *PWallSegmentElevation;

struct WallSegmentElevation {
    ushort gridIndex;
    ushort wallParamPtr;
    ushort u04;
};

typedef enum WorldBattleState {
    WB_BattleWon=0,
    WB_BattleLost=1
} WorldBattleState;

typedef enum WWWGateID {
    WG_School_Comp_1=0,
    WG_School_Comp_2_1=1,
    WG_School_Comp_2_2=2,
    WG_School_Comp_3_1=3,
    WG_School_Comp_3_2=4,
    WG_School_Comp_4=5,
    WG_School_Comp_5=6,
    WG_WWW_Comp_2_1=13,
    WG_WWW_Comp_2_2=14,
    WG_WWW_Comp_2_3=15,
    WG_WWW_Comp_2_4=16,
    WG_WWW_Comp_2_5=17,
    WG_WWW_Comp_2_6=18,
    WG_WWW_Comp_2_7=19,
    WG_WWW_Comp_2_8=20,
    WG_WWW_Comp_2_9=21,
    WG_WWW_Comp_2_10=22,
    WG_Undernet_6_1=87,
    WG_Undernet_6_2=88,
    WG_Undernet_7=89,
    WG_Undernet_9=90,
    WG_Undernet_10_1=91,
    WG_Undernet_11=92,
    WG_Internet_1=135,
    WG_Internet_2=137,
    WG_Internet_3=138,
    WG_Internet_4=139,
    WG_Undernet_1=140,
    WG_Undernet_6_3=157,
    WG_Undernet_10_2=158
} WWWGateID;

typedef struct ZetaOmegaType ZetaOmegaType, *PZetaOmegaType;

struct ZetaOmegaType {
    enum ChipId chipId;
    ushort time;
};

#endif
