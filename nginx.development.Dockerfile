FROM nginx:1.15-alpine

RUN apk add shadow
RUN groupadd -g 5432 topos
RUN mkdir /staticfiles
RUN chown -R :topos /staticfiles
