#!/bin/bash

docker image build -t node_alpine:10.16.3 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./gulp.development.Dockerfile .
