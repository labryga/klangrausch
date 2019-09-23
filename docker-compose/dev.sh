export host_user_name=$USER
export host_user_id=$(id -u)

cd ../django/
docker image build -t django_alpine:2.2.5 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./django.development.Dockerfile .

cd ../gulp/
docker image build -t gulp_node_alpine:10.16.3 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./gulp.development.Dockerfile .

cd ../docker-compose/
docker-compose -f ./docker-compose-development.yml \
  up --build
