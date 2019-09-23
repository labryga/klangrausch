export host_user_name=$USER
export host_user_id=$(id -u)

docker image build -t gulp_node_alpine:10.16.3 \
  --build-arg host_user_name=$USER \
  --build-arg host_user_id=$(id -u) \
  -f ./gulp.development.Dockerfile .
