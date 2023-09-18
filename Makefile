#
# SDCC Makefile for STM8S
# Modified for STM8S003F3P6
# ------------------------------------------------------

######################################
# target
######################################
TARGET = stm8_template

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
EXE_DIR = $(BUILD_DIR)/exe

######################################
# source
######################################
# C sources
C_SOURCES =  \
	core/source/stm8s_clk.c \
	core/source/stm8s_gpio.c \
	core/source/stm8s_tim4.c \
	source/main.c \
	source/led_control/led_control.c

# ASM sources
# ASM_SOURCES =  \

C_INCLUDES =  \
	-Icore/include \
	-Isource \
	-Isource/hw/include \
	-Isource/led_control

# ------------------------------------------------------
# Memory Layout
# FLASH_SIZE = --code-size 8192

# ------------------------------------------------------
# Definition
DEFS = \
	-DSTM8S003 \
	-DUSE_STDPERIPH_DRIVER

# ------------------------------------------------------
# Optimize
OPTIMIZE = --opt-code-speed

# ------------------------------------------------------
# SDCC
CC = sdcc

MCU_MODEL = stm8

#LIBS    =
#LIBPATH = -L $(LIBDIR)

# DEBUG = --debug
AFLAGS = -l -s
CFLAGS = $(C_INCLUDES) -m$(MCU_MODEL) --std-sdcc99 $(OPTIMIZE) $(DEBUG) $(DEFS)
LFLAGS = $(LIBPATH) $(LIBS) -m$(MCU_MODEL) $(DEBUG) $(DEFS) -lstm8 --out-fmt-ihx

# ------------------------------------------------------
# Recepies, see GNU MAKE manual

#######################################
# build the application
#######################################
all: $(EXE_DIR)/$(TARGET).elf $(EXE_DIR)/$(TARGET).ihx $(EXE_DIR)/$(TARGET).hex $(EXE_DIR)/$(TARGET).bin

# list of objects
OBJECTS = $(addprefix $(OBJ_DIR)/,$(notdir $(C_SOURCES:.c=.rel)))
vpath %.c $(sort $(dir $(C_SOURCES)))

$(OBJ_DIR)/%.rel: %.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# $(OBJ_DIR)/%.rel: %.s Makefile
# 	$(CC) $(AFLAGS) -o $@ $<
$(EXE_DIR)/$(TARGET).elf: $(OBJECTS) | $(EXE_DIR)
	$(CC) $(wildcard $(OBJ_DIR)/*.rel) $(LFLAGS) --out-fmt-elf --no-peep -o $@

$(EXE_DIR)/$(TARGET).ihx: $(OBJECTS) | $(EXE_DIR)
	$(CC) $(LFLAGS) $(OBJECTS) -o $@

$(EXE_DIR)/%.hex: $(EXE_DIR)/%.ihx
	packihx $< > $@

$(EXE_DIR)/%.bin: $(EXE_DIR)/%.ihx
	makebin -s 65536 -p $< $@

$(OBJ_DIR) $(LST_DIR) $(EXE_DIR) $(BUILD_DIR):
	mkdir -p $@

flash:
	stm8flash -c stlinkv2 -p stm8s003f3 -w $(EXE_DIR)/$(TARGET).ihx

verify:
	stm8flash -c stlinkv2 -p stm8s003f3 -v $(EXE_DIR)/$(TARGET).ihx

clean:
	-rm -rf $(BUILD_DIR)
