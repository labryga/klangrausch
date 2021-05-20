#!/bin/bash

docker image build -t django_alpine:3.2.3 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./django.development.Dockerfile .

docker rmi -f $(docker images -f dangling=true -q)
