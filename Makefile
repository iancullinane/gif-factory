# include local.mk
# include VERSION.mk
PROJECT_NAME?=application

# Create the target lists
MAIN_DIR=/tmp
SOURCES := $(wildcard ${MAIN_DIR}/*.mov)

all:
	@echo "Process .mov files into gifs"
	@echo ${SOURCES}
	@echo "////"

destfiles := $(patsubst %.mov,%.gif,$(SOURCES))
gifs: $(destfiles)

/tmp/%.gif: /tmp/%.mov
	@ls -la
	@[ -d /tmp/output ] || mkdir output
	@ffmpeg -i $^ -vf "scale=min(iw\,1000):-1" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=7 --colors 128 > $@

.PHONY: gifs
