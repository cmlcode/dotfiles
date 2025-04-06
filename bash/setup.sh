#!/bin/bash
echo "Setting up bash..."
DIR="${PWD}/bash"
COPYDIR=$HOME
shopt -s dotglob
for file in "$DIR"/*;
do
	filename=$(basename "$file")
	if [[ "$filename" == "setup.sh" ]]; then
		continue
	fi
	copypath="${COPYDIR}/${filename}"
	cp ${file} ${copypath}
done
shopt -u dotglob
