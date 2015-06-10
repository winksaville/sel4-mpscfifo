#
# Copyright 2015,  Wink Saville
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.

$(warning "SOURCE_DIR=$(SOURCE_DIR)")
# Targets
TARGETS := $(notdir $(SOURCE_DIR)).bin
$(warning "TARGETS=$(TARGETS)")

# Set custom entry point as we are a rootserver and will not be
# started in a standard way
ENTRY_POINT := _sel4_start

# Source files required to build the target
CFILES := src/main_sel4.c src/mpscfifo.c src/mpscfifo_dbg.c
CFILES += test/test_mpscfifo.c
#CFILES := src/main.c

# CPIO archive
OFILES := archive.o

# Header files/directories
HDRFILES := $(wildcard $(SOURCE_DIR)/include/*)

# Libraries required to build the target
LIBS = c sel4 cpio elf sel4muslcsys sel4vka sel4allocman \
       platsupport sel4platsupport sel4vspace \
       sel4utils sel4simple utils
ifdef CONFIG_KERNEL_STABLE
LIBS += sel4simple-stable
else
LIBS += sel4simple-default
endif

# Make -Werror to make warnings errors and -g for debug output
CFLAGS += -Werror -g
ifdef CONFIG_X86_64
CFLAGS += -mno-sse
endif

# The common make file
include $(SEL4_COMMON)/common.mk

# targets to generate CPIO archive of elf files
${COMPONENTS}:
	false

archive.o: ${COMPONENTS}
	$(Q)mkdir -p $(dir $@)
	${COMMON_PATH}/files_to_obj.sh $@ _cpio_archive $^

