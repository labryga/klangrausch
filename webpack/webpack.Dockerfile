# FROM node:18.14.2-alpine3.17 as base
FROM node:18.14.2-alpine3.17

# FROM base as container_user
ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id

RUN mkdir /klangrausch_modules /klangrausch /staticfiles

WORKDIR /klangrausch

RUN apk update && apk add --virtual --no-cache \
  shadow && \
  usermod -u 2000 node && groupmod -g 2000 node && \
  adduser -D -H -g "" -h "$(pwd)" -u "$user_id" "$user_name" && \
  chown -R "$user_id":"$user_id" \
  "$(pwd)" /klangrausch_modules /staticfiles && \
  # npm install -g gulp gulp-cli && \
  apk del shadow
ENV NODE_PATH=/klangrausch_modules/node_modules
USER "$user_name"


# FROM container_user as builder
# WORKDIR /klangrausch
# COPY klangrausch/ .
#
# RUN apk update && apk add --virtual --no-cache \
#   shadow && \
#   npm install && \
#   npm audit fix && \
#   npm cache clean --force
#
#
# FROM container_user
#
# COPY --from=builder \
#   /klangrausch/node_modules /klangrausch_modules/node_modules
#
# ENTRYPOINT ["gulp"]
#
# FROM node:10.16.3-alpine as image_basE

# FROM node:lts-alpine3.17
# RUN apk update && apk add --virtual --no-cache \
#   shadow && adduser -D -g "" -u 5432 topos
#   # chown -R topos:topos /home/topos/
#
# USER topos
# WORKDIR /home/topos
# RUN npm install --save-dev webpack webpack-cli
#

