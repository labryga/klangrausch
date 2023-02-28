FROM node:18.14.2-alpine3.17

ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id

RUN mkdir /klangrausch_modules /klangrausch /staticfiles

WORKDIR /klangrausch

# ENV NODE_PATH=/klangrausch_modules/node_modules
RUN apk update && apk add --virtual --no-cache shadow && \
  usermod -u 2000 node && groupmod -g 2000 node && \
  adduser -D -H -g "" -h "$(pwd)" -u "$user_id" "$user_name" && \
  chown -R "$user_id":"$user_id" \
  "$(pwd)" /klangrausch_modules /staticfiles && \
  npm install --global gulp-cli && \
  # npm install --save-dev gulp@4.0.2 --force && \
  # mv node_modules /klangrausch_modules && \
  apk del shadow
