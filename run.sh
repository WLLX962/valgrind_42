#!/bin/sh

docker run --rm -it -v `pwd`:/valgrind/ --name $USER-valgrind $(whoami)/valgrind bash
#docker exec -it $USER-valgrind bash
#docker container stop $(whoami)-valgrind