#!/bin/bash

docker image build -t django_alpine:2.2.5 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./django.development.Dockerfile .
