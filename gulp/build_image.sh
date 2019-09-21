#!/bin/bash

docker image build -t gulp_node_alpine:10.16.3 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./gulp.development.Dockerfile .

docker rmi $(docker images -f dangling=true -q)
clear
docker image ls
