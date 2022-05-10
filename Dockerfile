FROM alpine:3.13

RUN apk -v --no-cache --update add \
  bash \
  ffmpeg \
  gifsicle \
  make
  
ADD Makefile .

WORKDIR /work

