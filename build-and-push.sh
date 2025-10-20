#!/bin/bash
set -e

# This script builds and pushes the Docker images for the example voting app.

# Services to build and push
SERVICES=("vote" "result" "worker")

# Your Docker Hub username or organization
DOCKER_HUB_PREFIX="alterway"

# ---

for SERVICE in "${SERVICES[@]}"
do
  echo "--- Building and pushing ${SERVICE} ---"
  docker buildx build --push --builder=kube --platform=linux/amd64 -t "${DOCKER_HUB_PREFIX}/examplevotingapp_${SERVICE}" "./${SERVICE}"
  echo "--- Finished ${SERVICE} ---"
done

echo "--- All images built and pushed successfully! ---"
