export host_user_name=$USER
export host_user_id=$(id -u)

docker-compose -f ./docker-compose-development.yml \
  up --build
