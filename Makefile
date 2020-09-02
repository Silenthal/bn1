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
export BUILD_SCRIPT		:= python3 $(CURDIR)/$(TOOLS)/build_script.py

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

check: $(BUILD)
	@$(SHA512SUM) $(BASEDIR)/$(BASE).gba | sed -e 's/$(BASEDIR)\/$(BASE)/$(TARGET)/' >| $(BUILD)/$(TARGET).checksum
	@$(SHA512SUM) -c $(BUILD)/$(TARGET).checksum

no-check: $(BUILD)

$(BUILD):
	@[ -d $@ ] || mkdir -p $@
	@$(MAKE) --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

depend:
	@[ -d $(BUILD) ] || mkdir -p $(BUILD)
	@$(MAKE) depend --no-print-directory -C $(BUILD) -f $(CURDIR)/Makefile

clean:
	@echo cleaning up build files and assets ...
	@find . \( -iname '*.4bpp' -o -iname '*.8bpp' -o -iname '*.gbapal' -o -iname '*.script' \) -exec rm {} +
	@$(RM) -r $(BUILD) $(TARGET).gba $(TARGET).elf

tidy:
	@echo cleaning up non-asset build files ...
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

images/ui/charset.4bpp: %.4bpp: %.png
	$(MAKE_TILES) -mh 2 $@ $<

images/battlechip/art/001.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000000000000001 $@ $<

images/battlechip/art/002.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0101011011010001 $@ $<

images/battlechip/art/003.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0101011011010001 $@ $<

images/battlechip/art/013.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0111111101101111 $@ $<

images/battlechip/art/058.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/059.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/060.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/061.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/062.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/063.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/064.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/065.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000100 $@ $<

images/battlechip/art/066.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0000010100000000 $@ $<

images/battlechip/art/070.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 0001000000000010 $@ $<

images/battlechip/art/127.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 1111111000000000 $@ $<

images/battlechip/art/149.gbapal: %.gbapal: %.png
	$(MAKE_TILES) -fill 1000000000001111 $@ $<

%.4bpp: %.png
	$(MAKE_TILES) $@ $<

%.8bpp: %.png
	$(MAKE_TILES) $@ $<

%.gbapal: %.gbapal.bin
	cp $< $(ASSETS)/$@

%.gbapal: %.pal
	$(MAKE_TILES) $@ $<

%.gbapal: %.png
	$(MAKE_TILES) $@ $<

%.script: %.txt
	$(BUILD_SCRIPT) $@ $<

endif
