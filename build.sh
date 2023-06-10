#!/bin/sh

GREEN='\033[0;32m'
NOCOLOR='\033[0m'

docker build -t $(whoami)/valgrind .
echo "${GREEN}Build Finished!${NOCOLOR} =)"

# try to add valgrind alias

RC_FILE="$HOME/.zshrc"

if [ "$(uname)" != "Darwin" ]; then
	RC_FILE="$HOME/.bashrc"
	if [[ -f "$HOME/.zshrc" ]]; then
		RC_FILE="$HOME/.zshrc"
	fi
fi

#echo "try to add alias in file: $RC_FILE"

# set up the alias
if ! grep "valgrind=" "$RC_FILE" &> /dev/null; then
	echo "valgrind alias not present Adding it"
	the_source=$(readlink -f ${BASH_SOURCE[0]})
	the_dirname=$(dirname ${the_source})
	printf "\nalias valgrind=%s/run.sh\n" "$the_dirname" >> "$RC_FILE"
fi
