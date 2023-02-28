export host_user_name=$USER
export host_user_id=$(id -u)

docker image build -t gulp_node_alpine:18.14.2 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./gulp.development.Dockerfile .
