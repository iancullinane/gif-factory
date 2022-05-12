# ARG AWS_CDK_VERSION=2.22.0
# ARG NPM_VERSION=7.15.1
# ARG NODE_VERSION=16.13.2-r1
FROM alpine:3.13

RUN apk -v --no-cache --update add \
  bash \
  ffmpeg \
  gifsicle \
  make

WORKDIR /work

COPY Makefile .

CMD ["make", "gifs"]
