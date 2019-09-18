FROM alpine:3.10.2

WORKDIR /klangrausch

COPY klangrausch/ .

RUN apk update && \
    apk --no-cache add nodejs nodejs-npm && \
    npm install -g gulp gulp-cli && \
    npm install && \
    npm audit fix && \
    npm cache clean --force

ENTRYPOINT ["/bin/sh"]
