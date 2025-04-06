#!/bin/bash

set -e

echo "Starting dotfiles installation..."

for DIR in $(find ${PWD} -mindepth 1 -maxdepth 1 type d); do
	SETUP_FILE="${DIR}/setup.sh"
 	if [[ -f "$SETUP_FILE" ]]; then
  		bash "$SETUP_FILE"
    	fi
done
echo "Finished all installs"
