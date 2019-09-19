FROM node:10.16.3-alpine

RUN mkdir /klangrausch_modules

ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id

WORKDIR /klangrausch

COPY klangrausch/ .

RUN apk update && \
    npm install -g gulp gulp-cli && \
    npm install && \
    npm audit fix && \
    npm cache clean --force && \
    cp -Rv node_modules/ /klangrausch_modules/ && \
    rm -R node_modules/


ENV NODE_PATH=/klangrausch_modules/node_modules

ENTRYPOINT ["gulp"]
