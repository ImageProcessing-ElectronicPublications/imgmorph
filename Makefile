# =======================================================================
# Makefile - Makefile for compiling warp and morph.
# Copyright (C) 1993 by George Wolberg
#
# Written by: George Wolberg, 1993
# ======================================================================
# http://davis.wpi.edu/~matt/courses/morph/2d.htm

# These are all the files to be compiled.
MWARP = warp
MORPH = morph
SRCS = src
MWARPOBJ = $(SRCS)/warp.o  $(SRCS)/meshwarp.o $(SRCS)/util.o $(SRCS)/catmullrom.o
MORPHOBJ = $(SRCS)/morph.o $(SRCS)/meshwarp.o $(SRCS)/util.o $(SRCS)/catmullrom.o

# These are the cc flags.
FLAGS = -c -O

all: $(MWARP) $(MORPH)

$(MWARP): $(MWARPOBJ)
	cc $(MWARPOBJ) $(LDLIBS) -o $@

$(MORPH): $(MORPHOBJ)
	cc $(MORPHOBJ) $(LDLIBS) -o $@

.c.o:
	cc $(FLAGS) -o $@ $<

clean:
	rm -f $(MWARP) $(MORPH) $(MWARPOBJ) $(MORPHOBJ)