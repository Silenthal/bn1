OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(Start)

MEMORY {
	bios	: ORIGIN = 0x00000000, LENGTH = 16K
	ewram	: ORIGIN = 0x02000000, LENGTH = 256K
	iwram	: ORIGIN = 0x03000000, LENGTH = 32K
	io		: ORIGIN = 0x04000000, LENGTH = 1K
	palette	: ORIGIN = 0x05000000, LENGTH = 1K
	vram	: ORIGIN = 0x06000000, LENGTH = 96K
	oam		: ORIGIN = 0x07000000, LENGTH = 1K
	rom		: ORIGIN = 0x08000000, LENGTH = 8M
	sram	: ORIGIN = 0x0E000000, LENGTH = 64K
}
__ewram_start	= ORIGIN(ewram);
__ewram_end		= ORIGIN(ewram) + LENGTH(ewram);
__iwram_start	= ORIGIN(iwram);
__iwram_end		= ORIGIN(iwram) + LENGTH(iwram);
__text_start	= ORIGIN(rom);
__vram_start    = ORIGIN(vram);
__pal_start     = ORIGIN(palette);

SECTIONS {
	. = __ewram_start;
	ewram (NOLOAD) : 
	{
		eBgPalette0 = 0x6CD0;
		eBgPalette1 = 0x6CF0;
		eBgPalette2 = 0x6D10;
		eBgPalette3 = 0x6D30;
		eBgPalette4 = 0x6D50;
		eBgPalette5 = 0x6D70;
		eBgPalette6 = 0x6D90;
		eBgPalette7 = 0x6DB0;
		eBgPalette8 = 0x6DD0;
		eBgPalette9 = 0x6DF0;
		eBgPaletteA = 0x6E10;
		eBgPaletteB = 0x6E30;
		eBgPaletteC = 0x6E50;
		eBgPaletteD = 0x6E70;
		eBgPaletteE = 0x6E90;
		eBgPaletteF = 0x6EB0;
		gFillValue = 0x48C0;
		eMainState0x00 = 0x6cb8;
		eInputState = 0x65f0;
		eMainState0x08 = 0x210;
		eMainState0x0C = 0x3710;
		eMainState0x10 = 0x7510;
		eMainState0x14 = 0x4950;
		eMainState0x18 = 0x6cb0;
		eMainState0x1C = 0x48d0;
		eMainState0x20 = 0x75f0;
		eMainState0x24 = 0x4940;
		eMainState0x28 = 0x70A0;
		eMainState0x2C = 0x4bb0;
		eMainState0x30 = 0x48b8;
		eMainState0x34 = 0x7590;
		eMainState0x38 = 0xc1b0;
		eMainState0x3C = 0x4900;
		eMainState0x40 = 0x74d8;
		eMainState0x44 = 0x9a50;
		eMainState0x48 = 0x6350;
		eMainState0x4C = 0x4bd0;
		eMainState0x50 = 0x64a0;
		eMainState0x54 = 0x7de0;
		eMainState0x58 = 0x4710;
		eMainState0x60 = 0x74c8;
		eMainState0x64 = 0x9a80;
		eMainState0x68 = 0x65d0;
		eMainState0x6C = 0xacf0;
		eMainState0x70 = 0x6610;
		eMainState0x74 = 0x62e0;
		eMainState0x78 = 0x3d0;
		eMainState0x7C = 0x6ed0;
		eFrameWaitValueX = 0x4930;
		eFrameWaitValue = 0x4934;
		eFrameCounter = 0x7080;
		eDmaParamListSize = 0x74d4;
		eDmaParamList = 0x8010;
		eRngState = 0x6cc0;
		musicPlayerInfo_13 = 0xc520;
		musicPlayerInfo_17 = 0xc560;
		musicPlayerInfo_0D = 0xc5a0;
		musicPlayerInfo_05 = 0xc5e0;
		musicPlayerInfo_1E = 0xc620;
		musicPlayerInfo_10 = 0xc660;
		musicPlayerInfo_09 = 0xc6a0;
		musicPlayerInfo_06 = 0xc6e0;
		musicPlayerInfo_00 = 0xc720;
		musicPlayerInfo_1A = 0xc760;
		musicPlayerInfo_14 = 0xc7a0;
		musicPlayerInfo_18 = 0xc7e0;
		musicPlayerInfo_15 = 0xc820;
		musicPlayerInfo_12 = 0xc860;
		musicPlayerInfo_0E = 0xc8a0;
		musicPlayerInfo_1C = 0xc8e0;
		musicPlayerInfo_1F = 0xc920;
		musicPlayerInfo_07 = 0xc960;
		musicPlayerInfo_01 = 0xc9a0;
		musicPlayerInfo_02 = 0xc9e0;
		musicPlayerInfo_0A = 0xca20;
		musicPlayerInfo_19 = 0xca60;
		musicPlayerInfo_1D = 0xcaa0;
		musicPlayerInfo_16 = 0xcae0;
		musicPlayerInfo_0F = 0xcb20;
		musicPlayerInfo_0C = 0xcb60;
		musicPlayerInfo_11 = 0xcba0;
		musicPlayerInfo_04 = 0xcbe0;
		gMPlayMemAccArea = 0xcc20;
		musicPlayerInfo_1B = 0xcc30;
		musicPlayerInfo_08 = 0xcc70;
		musicPlayerInfo_03 = 0xccb0;
		musicPlayerInfo_0B = 0xccf0;
	} > ewram

	. = __iwram_start;
	iwram (NOLOAD) :
	{
		eMainState0x5C = 0x0;
		interruptVector = 0x2000;
		interruptHandlerStart = 0x6800;
		interruptHandlerEnd = 0x7640;
	} > iwram

	. = __text_start;
	.text :  {
		INCLUDE include.ld
	} > rom

	. = __pal_start;
	pal (NOLOAD) :
	{
		PAL_BG = 0;
		PAL_OBJ = 0x200;
	} > palette

	. = __vram_start;
	vram (NOLOAD) :
	{
		BG_VRAM_BASE0 = 0;
		BG_VRAM_BASE1 = 0x4000;
		BG_VRAM_BASE2 = 0x8000;
		BG_VRAM_BASE3 = 0xC000;
		BG_VRAM_SCREEN0 = 0xE000;
	} > vram

	/DISCARD/ : {
		*(.glue_7*);
		*(.vfp11_veneer);
		*(.v4_bx);
		*(.iplt);
		*(.igot.plt);
		*(.rel*);
		*(.comment);
		*(.ARM*);
	}
}
