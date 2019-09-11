FROM alpine:3.10.2

WORKDIR /klangrausch

RUN apk update && \
    apk --no-cache add nodejs nodejs-npm && \
    npm install gulp-cli -g && \
    npm install gulp -D

