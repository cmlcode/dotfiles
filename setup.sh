#!/bin/bash

set -e

# Capture ARGS
ARGS="$@"

for DIR in $(find ${PWD} -mindepth 1 -maxdepth 1 -type d); do
	SETUP_FILE="${DIR}/setup.sh"
	if [[ -f "${SETUP_FILE}" ]]; then
		bash "${SETUP_FILE}" ${ARGS}
  	else
   		echo "SKIPPING ${DIR}. Error: Setup file ${SETUP_FILE} not found"
	fi
done
echo "Finished install process"
