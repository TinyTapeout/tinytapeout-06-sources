# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

INSTALL_COCOTBEXT_SPI := $(shell \
	if ! pip show cocotbext-spi >/dev/null 2>&1; then \
        echo "Package 'cocotbext-spi' is not installed. Installing..."; \
        pip install cocotbext-spi==0.4.0; \
    fi \
)

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = mem_read.v

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb_spiflash.v 
TOPLEVEL = tb_spiflash

# MODULE is the basename of the Python test file
MODULE = test_spiflash

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

gtk:
	open tb_spiflash.vcd -a gtkwave