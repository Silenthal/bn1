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
SOURCES				:= source
TOOLS				:= tools
INCLUDES			:= include assets build
BASEDIR				:= base
BASE_DEFINE			:= BASE
GEN_LD_SCRIPT		:= include.ld

ARCH				:= -mthumb -mthumb-interwork -march=armv4t

CFLAGS				:= -mthumb -O1 -fno-toplevel-reorder -Wno-pointer-to-int-cast
ASFLAGS				:= $(ARCH) -mcpu=arm7tdmi
LDFLAGS				:= -nostdlib -T $(MAIN_LD_SCRIPT) -Wl,-Map=$(TARGET).map

ifneq ($(BUILD),$(notdir $(CURDIR)))

# Programs
export GEN_PAD			:= python3 $(CURDIR)/$(TOOLS)/generate_padding.py
export MAKE_DEPEND  	:= python3 $(CURDIR)/$(TOOLS)/make_depend.py
export MAKE_TILES		:= python3 $(CURDIR)/$(TOOLS)/make_tiles.py

export ASM_OFFSET_C		:= $(CURDIR)/source/asm-offsets.c
export OUTPUT			:= $(CURDIR)/$(TARGET)
export ASSETS			:= $(CURDIR)/assets
export VPATH			:= $(foreach dir,$(SOURCES),$(CURDIR)/$(dir)) $(ASSETS) $(BUILD)
export DEPSDIR			:= $(CURDIR)/$(BUILD)
export LAYOUT_FILE		:= $(CURDIR)/object_offset.txt
export MAIN_LD_SCRIPT	:= $(CURDIR)/ld_script.ld


CFILES				:= $(filter-out asm-offsets.c, $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.c))))
SFILES				:= $(foreach dir,$(SOURCES),$(notdir $(wildcard $(dir)/*.S)))

export C_OBJECTS	:= $(CFILES:.c=.o)
export S_OBJECTS	:= $(SFILES:.S=.o)
export OFILES		:= $(C_OBJECTS) $(S_OBJECTS)
export C_DEPEND		:= $(CFILES:.c=.c.d)
export S_DEPEND		:= $(SFILES:.S=.S.d)
export DFILES		:= $(C_DEPEND) $(S_DEPEND)
export INCLUDE		:= $(foreach dir,$(INCLUDES),-iquote $(CURDIR)/$(dir))
export ASINCLUDE	:= -I $(CURDIR)/$(BASEDIR) $(foreach dir,$(INCLUDES),-I $(CURDIR)/$(dir))
export LDINCLUDE	:= -L $(CURDIR) $(foreach dir,$(INCLUDES),-L $(CURDIR)/$(dir))

export LD			:= $(CC)

.PHONY: $(BUILD) depend clean

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile
	@$(SHA512SUM) $(BASEDIR)/$(BASE).gba | sed -e 's/$(BASEDIR)\/$(BASE)/$(TARGET)/' >| $(BUILD)/$(TARGET).checksum
	@$(SHA512SUM) -c $(BUILD)/$(TARGET).checksum

depend:
	@[ -d $(BUILD) ] || mkdir -p $(BUILD)
	@$(MAKE) depend --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

clean:
	@echo clean ...
	@find . \( -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' \) -exec rm {} +
	@$(RM) -r $(BUILD) $(TARGET).gba $(TARGET).elf

else

$(OUTPUT).gba: $(OUTPUT).elf

$(OUTPUT).elf: $(OFILES)

depend: $(DFILES) offsets.h

offsets.h: $(ASM_OFFSET_C)
	@echo $(notdir $@)
	@$(CC) $(INCLUDE) $(CFLAGS) -S -o /dev/stdout $< | \
	grep '__AS_DEFINE__' | \
	sed 's/#//g' | sed 's/\t/ /g' | sed 's/__AS_DEFINE__/#define/g' > $@

%.gba: %.elf
	@$(OBJCOPY) -O binary $< $@
	@echo built ... $(notdir $@)
	@gbafix -p -t"$(TITLE)" -c$(CODE) -m$(MAKER) -r$(VERSION) $@

%.elf:
	@echo linking cartridge
	@cp -f $(LAYOUT_FILE) .
	@cp -f $(MAIN_LD_SCRIPT) .
	@$(GEN_PAD) "$(shell which $(AS)) $(ASINCLUDE) $(ASFLAGS)" $(LAYOUT_FILE) $(BASE).gba $(GEN_LD_SCRIPT)
	@$(LD) $(LDINCLUDE) $(LDFLAGS) $(OFILES) -o $@

%.S.d: %.S
	@echo $(notdir $@)
	@$(MAKE_DEPEND) $(BUILD) $<

%.c.d: %.c
	@echo $(notdir $@)
	@$(MAKE_DEPEND) $(BUILD) $<

-include ./*.d

$(C_OBJECTS): %.o: %.c
	@echo $(notdir $<)
	$(CC) -MP -MMD -MF $(DEPSDIR)/$*.d $(INCLUDE) $(CFLAGS) -c -o $@ $<

$(S_OBJECTS): %.o: %.S
	@echo $(notdir $<)
	$(CC) $(INCLUDE) -D $(BASE_DEFINE)=\"$(BASE).gba\" -E $< | $(AS) $(ASINCLUDE) $(ASFLAGS) -o $@

%.8bpp: %.png
	$(MAKE_TILES) $@ $<

%.gbapal: %.png
	$(MAKE_TILES) $@ $<

%.gbapal: %.pal
	$(MAKE_TILES) $@ $<

endif
