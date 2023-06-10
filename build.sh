#!/bin/sh

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

docker build -t $(whoami)/valgrind .
echo "${GREEN}Build Finished!${NOCOLOR} =)"