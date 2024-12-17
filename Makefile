.SUFFIXES:

ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/base_tools
SHA512SUM			:= sha512sum

TARGET				:= mmbn
BASE				:= base

TITLE				:= MEGAMAN_BN
CODE				:= AREE
MAKER				:= 08
VERSION				:= 0

BUILD				:= build
SOURCE				:= source
SOURCES				:= $(sort $(dir $(wildcard $(SOURCE)/ $(SOURCE)/*/ $(SOURCE)/*/*/ $(SOURCE)/*/*/*/ $(SOURCE)/*/*/*/*/)))
TOOLS				:= tools
ASSETS				:= $(CURDIR)/assets
SOUND				:= $(CURDIR)/sound
INCLUDES			:= include assets build sound
BASEDIR				:= base
BASE_DEFINE			:= BASE
GEN_LD_SCRIPT		:= include.ld
MAIN_LD_SCRIPT		:= ld_script.ld

ARCH				:= -mthumb -mthumb-interwork -march=armv4t

CFLAGS				:= -mthumb -O1 -fno-toplevel-reorder -Wno-pointer-to-int-cast
ASFLAGS				:= $(ARCH) -mcpu=arm7tdmi
LDFLAGS				:= -nostdlib -T $(MAIN_LD_SCRIPT) -Wl,-Map=$(BUILD)/$(TARGET).map
VPATH				:= $(foreach dir,$(SOURCES),$(CURDIR)/$(dir)) $(ASSETS) $(SOUND) $(BUILD)

# Programs
GEN_PAD			:= python3 $(CURDIR)/$(TOOLS)/generate_padding.py
GEN_OFFSETS		:= python3 $(CURDIR)/$(TOOLS)/generate_offsets.py
PROGRESS		:= python3 $(CURDIR)/$(TOOLS)/progress.py
PARSE_FIXED		:= python3 $(CURDIR)/$(TOOLS)/parse_fixed.py
QUICK_COMP		:= python3 $(CURDIR)/$(TOOLS)/quick_comp.py

MMBN_H			:= $(CURDIR)/include/mmbn.h
OUTPUT			:= $(CURDIR)/$(BUILD)/$(TARGET)

DEPSDIR			:= $(CURDIR)/$(BUILD)
LAYOUT_FILE		:= $(CURDIR)/object_offset.txt
MAIN_LD_SCRIPT	:= $(CURDIR)/ld_script.ld

CFILES			:= $(foreach dir,$(SOURCES),$(wildcard $(dir)*.c))
SFILES			:= $(foreach dir,$(SOURCES),$(wildcard $(dir)*.S))

C_OBJECTS		:= $(patsubst $(SOURCE)/%.c,$(BUILD)/%.o,$(CFILES))
S_OBJECTS		:= $(patsubst $(SOURCE)/%.S,$(BUILD)/%.o,$(SFILES))
OFILES			:= $(C_OBJECTS) $(S_OBJECTS)
C_DEPEND		:= $(patsubst $(SOURCE)/%.c,$(BUILD)/%.c.d,$(CFILES))
S_DEPEND		:= $(patsubst $(SOURCE)/%.S,$(BUILD)/%.S.d,$(SFILES))
DFILES			:= $(C_DEPEND) $(S_DEPEND)
INCLUDE			:= $(foreach dir,$(INCLUDES),-iquote $(CURDIR)/$(dir))
ASINCLUDE		:= -I $(CURDIR)/$(BASEDIR) $(foreach dir,$(INCLUDES),-I $(CURDIR)/$(dir))
LDINCLUDE		:= -L $(CURDIR) $(foreach dir,$(INCLUDES),-L $(CURDIR)/$(dir))

LD				:= $(CC)

.PHONY: $(BUILD) pre tidy offsets depend clean check no-check

no-check: $(BUILD)

check: $(BUILD)
	@$(SHA512SUM) $(BASEDIR)/$(BASE).gba | sed -e 's/$(BASEDIR)\/$(BASE)/$(BUILD)\/$(TARGET)/' >| $(BUILD)/$(TARGET).checksum
	@$(SHA512SUM) -c $(BUILD)/$(TARGET).checksum || $(QUICK_COMP) $(BASEDIR)/$(BASE).gba $(OUTPUT).gba
	@$(PROGRESS) $(DEPSDIR)/$(TARGET).map

depend: $(DFILES) $(BUILD)/offsets.h
	@[ -d $(BUILD) ] || mkdir -p $(BUILD)

clean:
	@echo cleaning up build files and assets ...
	@find . \( -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.script' -o -iname '*.sprite.lz' -o -iname '*.4bpp.lz' -o -iname '*.scb' -o -iname '*.scbin' \) -exec rm {} +
	@find . \( -iname '*.palettez' -o -iname '*.tilesetz' -o -iname '*.tilemapz' -o -iname '*.talk' -o -iname '*.dialogue' \) -exec rm {} +
	@$(RM) -r $(BUILD)/*

tidy:
	@echo cleaning up non-asset build files ...
	@$(RM) -r $(BUILD)/*

offsets: $(BUILD)/offsets.h

$(BUILD)/offsets.h: $(BUILD)/offsets.c
	@$(CC) $(INCLUDE) $(CFLAGS) -S -o /dev/stdout $< | \
	grep '__AS_DEFINE__' | \
	sed 's/#//g' | sed 's/\t/ /g' | sed 's/__AS_DEFINE__/#define/g' > $@
	@echo Offset file built

$(BUILD)/offsets.c: $(MMBN_H)
	@$(GEN_OFFSETS) -o $@ $<

$(BUILD): $(OUTPUT).gba

$(OUTPUT).gba: $(OUTPUT).elf

$(OUTPUT).elf: $(OFILES)

%.gba: %.elf
	@$(OBJCOPY) -O binary --gap-fill 0xFF $< $@
	@echo built ... $(notdir $@)
	@gbafix -p -t"$(TITLE)" -c$(CODE) -m$(MAKER) -r$(VERSION) $@

%.elf:
	@echo Linking cartridge
	@cp -f $(MAIN_LD_SCRIPT) $(BUILD)/.
	@$(LD) $(LDINCLUDE) $(LDFLAGS) $(OFILES) -o $@

-include $(BUILD)/*.d

$(C_OBJECTS): $(BUILD)/%.o: $(SOURCE)/%.c
	@echo $(notdir $<)
	$(CC) -MP -MMD -MF $(DEPSDIR)/$*.d $(INCLUDE) $(CFLAGS) -c -o $@ $<

$(S_OBJECTS): $(BUILD)/%.o: $(SOURCE)/%.S
	@echo $(notdir $<)
	$(CC) $(INCLUDE) -D $(BASE_DEFINE)=\"$(BASE).gba\" -E $< | $(PARSE_FIXED) | $(AS) $(ASINCLUDE) $(ASFLAGS) -o $@
