#!/bin/bash

docker image build -t django_alpine3.16:3.2.18 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./django.development.Dockerfile .

docker rmi -f $(docker images -f dangling=true -q)
