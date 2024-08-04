#!/bin/bash

docker image build -t django_4.2.14_alpine3.18:python_3.10.12 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./django.development.Dockerfile .

docker rmi -f $(docker images -f dangling=true -q)
