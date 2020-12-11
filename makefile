# Makefile for shadylib

lib.name = tracker

# add your .c source files, one object per file, to the SOURCES
# variable, help files will be included automatically, and for GUI
# objects, the matching .tcl file too
class.sources =  tracker.c

# list all pd objects (i.e. myobject.pd) files here, and their helpfiles will
# be included automatically
datafiles = \
	README \
	COPYING \
	CHANGELOG \
	$(wildcard *.pd) \
	$(empty)

# include Makefile.pdlibbuilder from submodule directory 'pd-lib-builder'
PDLIBBUILDER_DIR=pd-lib-builder/
include $(PDLIBBUILDER_DIR)/Makefile.pdlibbuilder

all: tracker.tk2c

clean: clean-script

tracker.tk2c:
	sh tk2c.bash < tracker.tk > tracker.tk2c

clean-script:
	rm -f *.tk2c