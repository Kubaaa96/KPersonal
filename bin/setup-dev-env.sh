#!/bin/bash

set -e

# In CLion `> File > Build, Execution, Deployment > Toolchains`
# add new Remote Host toolchain with the following credentials:
#   ip: 172.200.1.2
#   port: 22
#   user: root
#   password: password

#CHANGE THESE
PROJECT_NAME="template-cpp"
DOCKER_NETWORK="172.200.1.0/24"
CONTAINER_IP="172.200.1.2"

check_if_project_root_directory() {
  BIN_DIR_REGEX=".*bin$"
  if [[ $(pwd) =~ $BIN_DIR_REGEX ]]; then
    echo "Run this script from project root directory: sudo bash bin/$0"
    exit 1
  fi
}

start_docker_env() {
  docker build -t $PROJECT_NAME-env -f docker/Dev.Dockerfile .
  docker rm -f $PROJECT_NAME-env || true 2> /dev/null
  docker network rm $PROJECT_NAME-net || true
  docker network create $PROJECT_NAME-net --subnet "$DOCKER_NETWORK" || true
  nvidia-docker run --gpus all -d --restart always \
    -v `pwd`/docs/html:/workspace/inference/html \
    --net $PROJECT_NAME-net --ip "$CONTAINER_IP" \
    --name $PROJECT_NAME-env $PROJECT_NAME-env
}

check_if_project_root_directory
start_docker_env

echo "Setup done"