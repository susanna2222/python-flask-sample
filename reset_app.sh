#!/bin/bash

############################
# Reset the hellow_python-flask-sampleworld app on a server
#
# Use:  ssh -o StrictHostKeyChecking=no root@hello.dpunks.org "./reset_app.sh"  replace with our server hostname
#
#############################

echo "Removing python-flask-sample to Docker Container"
docker stop python-flask-sample
echo "Stoping python-flask-sample in Docker Container"
docker ps -a