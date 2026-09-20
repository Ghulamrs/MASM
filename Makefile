# masm: built like asm6x and the compilers it serves - C++14, -Wall -Wextra
# -Werror -pedantic, objects outside the checkout, the program where BINDIR
# says. RIDE's workspace.mk calls this with BINDIR=bin and OBJDIR=bin/obj/masm
# so that masm.exe lands beside the editor, where settings.json names it as
# the assembler for x86_64-windows in place of ml64.
ifeq ($(origin CXX),default)
  ifneq ($(shell command -v clang++ 2>/dev/null),)
    CXX := clang++
  else
    CXX := g++
  endif
endif
CXXFLAGS = -std=c++14 -O2 -g -Wall -Wextra -Werror -pedantic -pthread
SRCS     = $(filter src/%.cpp,$(wildcard src/*.cpp))
OBJDIR  ?= ../build/MASM/obj
OBJS     = $(patsubst src/%.cpp,$(OBJDIR)/%.o,$(SRCS))
BINDIR  ?= build
TARGET   = $(BINDIR)/masm.exe

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS)

$(OBJDIR)/%.o: src/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -MMD -MP -c $< -o $@

-include $(OBJS:.o=.d)

test: $(TARGET)
	ASM=$(TARGET) sh tests/run.sh

clean:
	rm -rf $(OBJDIR) $(TARGET)

.PHONY: all test clean
