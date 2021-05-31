#  Makefile for using flex with bison
#
#  The executable receives the name of the bison file
#      if the bison file doesn't exist gets the flex file name
#      Do not use spaces in the name of the folder
#
#  The .lex (or .flex) and .y files used are the first ones found by ls
#
#  If there is a .txt file, it will be used as the input of the executable
#
#  This Makefile works on Linux and on OSX

BISON_VERSION:=$(shell bison -V| head -1)
FLEX_VERSION:=$(shell flex -V)

$(shell echo ">>>>  Info  <<<<" 1>&2)
ifeq ($(BISON_VERSION),)
$(shell echo "  Bison is missing!!!" 1>&2)
else
$(shell echo "  Bison version is: $(BISON_VERSION)" 1>&2)
endif
ifeq ($(FLEX_VERSION),)
$(shell echo "  Flex is missing!!!" 1>&2)
else
$(shell echo "  Flex version is: $(FLEX_VERSION)" 1>&2)
endif

BISON_FILENAME=$(firstword $(wildcard *.y))
FLEX_FILENAME=$(firstword $(wildcard *.lex *.flex))

ifeq ($(BISON_FILENAME),)
NAME=$(basename $(FLEX_FILENAME))
$(shell echo "  Bison file is missing!" 1>&2)
else
NAME=$(basename $(BISON_FILENAME))
.DEFAULT_GOAL := $(NAME)

BISON_C_FILENAME=$(basename $(BISON_FILENAME)).tab.c

BISON_H_FILENAME=$(basename $(BISON_FILENAME)).tab.h

REPORT_FILENAME=$(basename $(BISON_FILENAME)).output

GRAPH_FILENAME=$(basename $(BISON_FILENAME)).gv
$(shell echo "  Bison file is present: $(BISON_FILENAME)"  1>&2)
#       Make bison .tab.c and .tab.h
$(BISON_C_FILENAME) $(BISON_H_FILENAME):$(BISON_FILENAME)
ifeq ($(BISON_VERSION),)
	@echo "##Bison is missing!!!"
	@false
endif
	@echo "## Creating parser...."
	bison -d $(BISON_FILENAME)
#       Make a detailed bison report: .output
report:  $(BISON_FILENAME)
ifeq ($(BISON_VERSION),)
	@echo "##Bison is missing!!!"
	@false
endif
	@echo "## Creating parser report...."
	bison -d $(BISON_FILENAME) --report=all

#       Make a detailed bison graph
graph:  $(BISON_FILENAME)
ifeq ($(BISON_VERSION),)
	@echo "##Bison is missing!!!"
	@false
endif
	@echo "## Creating parser GraphViz file...."
	bison -d --graph=$(GRAPH_FILENAME) $(BISON_FILENAME)
endif

ifeq ($(FLEX_FILENAME),)
	$(shell echo "  Flex file is missing!" 1>&2)
else
FLEX_C_FILENAME=$(basename $(wildcard *.lex *.flex)).c

FLEX_H_FILENAME=$(basename $(wildcard *.lex *.flex)).h

TEXT_FILENAME=$(firstword $(wildcard *.txt))
$(shell echo "  Flex file is present: $(FLEX_FILENAME)" 1>&2)
endif

ifeq ($(strip $(TEXT_FILENAME)),)
RUN_OPTS=
$(shell echo "  Text file is missing!" 1>&2)
else
RUN_OPTS=<$(TEXT_FILENAME)
$(shell echo "  Text file is present: $(TEXT_FILENAME)" 1>&2)
endif


 
ifeq ($(shell uname),Darwin)
LINK_FLAGS=-ll -lm
else
LINK_FLAGS=-lfl -lm
endif

$(shell echo ">>>> Making <<<<" 1>&2)

$(NAME):$(FLEX_C_FILENAME) $(FLEX_H_FILENAME) $(BISON_C_FILENAME)  $(BISON_H_FILENAME)
	@echo "## compiling...."
	gcc -Wall $(FLEX_C_FILENAME) $(BISON_C_FILENAME) $(LINK_FLAGS) -o $(NAME)

$(FLEX_C_FILENAME) $(FLEX_H_FILENAME): $(FLEX_FILENAME)
ifeq ($(FLEX_VERSION),)
	@echo "##Flex is missing!!!"
	@false
else
	@echo "## Creating lexer...."
	flex -o $(FLEX_C_FILENAME) --header-file=$(FLEX_H_FILENAME) $(FLEX_FILENAME)
endif

run: $(NAME)
	./$(NAME) $(RUN_OPTS)

clean:
	rm -f $(FLEX_C_FILENAME) $(FLEX_H_FILENAME) $(NAME) $(BISON_H_FILENAME)  $(BISON_C_FILENAME) $(REPORT_FILENAME) $(GRAPH_FILENAME)
