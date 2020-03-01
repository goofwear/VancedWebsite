#!/bin/bash
echo "***********[ Removing IP from logs ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "echo Hidden" > /dev/null 2>&1
echo "***********[ Running the update Docker for DEV site ]***********"
ssh $SERVER_USERNAME@$SERVER_NAME "docker run --rm -v $WEB_PATH:/git-project $UPDATE_DOCKER_NAME"
echo "***********[ Cleanup (Not really necessary for these deployments but no harm done so left them here) ]***********"
CLEANUP="docker system prune -f"
IMAGE_CLEANUP="docker image prune --all -f"
ssh $SERVER_USERNAME@$SERVER_NAME $CLEANUP
ssh $SERVER_USERNAME@$SERVER_NAME $IMAGE_CLEANUP