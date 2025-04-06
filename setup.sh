#!/bin/bash
for DIR in $(find ${PWD} -maxdepth 1); do
	if [[ "$DIR" == "$PWD" ]]; then
		continue
	fi
	DIR+="/setup.sh"
	test -f $DIR && bash $DIR
done
echo "Finished install"
