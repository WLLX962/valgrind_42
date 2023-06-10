#!/bin/sh

docker build -t $(whoami)/valgrind .
docker run -d -it -v `pwd`:/valgrind/ --name $USER-valgrind $(whoami)/valgrind
docker exec -it $USER-valgrind bash