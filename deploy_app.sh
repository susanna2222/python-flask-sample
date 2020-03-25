#!/bin/bash
########################################
# Put this on a Server
# run chmod +x deploy_app.sh to make the script executable
# 
# $TAG = 0.0.1
# Execute this script:  ./deploy_app.sh ariv3ra/python-circleci-docker:$TAG
# Replace the $TAG with the actual Build Tag you want to deploy
#
########################################

set -e

DOCKER_IMAGE=$1
CONAINER_NAME="python-flask-sample"

# Check for arguments
if [[ $# -lt 1 ]] ; then
    echo '[ERROR] You must supply a Docker Image to pull'
    exit 1
fi

echo "Deploying Hello World to Docker Container"

#Check for running container & stop it before starting a new one
if [ $(docker inspect -f '{{.State.Running}}' $CONAINER_NAME) = "true" ]; then
    docker stop python-flask-sample
fi

echo "Starting Hello World using Docker Image name: $DOCKER_IMAGE"

docker run -d --rm=true -p 80:5000  --name python-flask-sample $DOCKER_IMAGE

docker ps -a