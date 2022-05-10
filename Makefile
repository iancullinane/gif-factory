# include local.mk
# include VERSION.mk

#
# root Makefile
#
TARGET  := $(shell basename `pwd`)
PROJECT_NAME?=application

# Create the target lists
SOURCES := $(wildcard /tmp/*.mov)
TARGET_DIR := ${DIR}/output/

export # make above variables available in subshells

all:
	@echo ""
	@echo "////"
	@echo "Process .mov files into gifs"
	@echo ${SOURCES}
	@echo "////"
	@echo ""

# patsubst to make targets for the output, based on the input names
destfiles := $(patsubst /tmp/%.mov,output/%.gif,$(SOURCES))
destination: $(destfiles)

gifs: $(destfiles)

output/%.gif: %.mov
	@[ -d output ] || mkdir output
	@ffmpeg -i $^ -vf "scale=min(iw\,1000):-1" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=7 --colors 128 > $@


.PHONY: destination gifs
