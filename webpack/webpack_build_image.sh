#!/bin/bash

docker image build -t node_user:18.14.2-alpine3.17 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./node_user.Dockerfile .

docker rmi -f $(docker images -f dangling=true -q)
