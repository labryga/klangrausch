FROM node:10.16.3-alpine as base


FROM base as container_user

ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id

RUN mkdir /klangrausch_modules /klangrausch /staticfiles

WORKDIR /klangrausch

RUN apk update && apk add --virtual --no-cache \
  shadow && \
  npm install -g gulp gulp-cli && \
  adduser -D -H -g "" -h "$(pwd)" -u "$user_id" "$user_name" && \
  chown -R "$user_id":"$user_id" \
  "$(pwd)" /klangrausch_modules /staticfiles && \
  apk del shadow

ENV NODE_PATH=/klangrausch_modules/node_modules


FROM base as builder

RUN mkdir /klangrausch
WORKDIR /klangrausch
COPY klangrausch/ .

RUN apk update && apk add --virtual --no-cache \
  shadow && \
  npm install && \
  npm audit fix && \
  npm cache clean --force


FROM container_user

COPY --from=builder \
  /klangrausch/node_modules /klangrausch_modules/node_modules

ENTRYPOINT ["gulp"]
