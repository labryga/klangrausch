FROM node:18.14.2-alpine3.17

ARG host_user_name
ARG host_user_id

ENV user_name=$host_user_name
ENV user_id=$host_user_id

RUN mkdir /klangrausch_webpack_5 /staticfiles

WORKDIR /klangrausch_webpack_5

RUN apk update && apk add --virtual --no-cache \
  shadow && \
  usermod -u 2000 node && groupmod -g 2000 node && \
  adduser -D -g "" -h "$(pwd)" -u "$user_id" "$user_name" && \
  chown -R "$user_id":"$user_id" \
  "$(pwd)" /klangrausch_webpack_5 /staticfiles
USER "$user_name"
