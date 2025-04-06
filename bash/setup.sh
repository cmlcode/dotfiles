#!/bin/bash
set -e 
echo "Setting up bash..."

# Default args
DRY_RUN = FALSE

# Parse args
for arg in "$@"; do
	case $arg in
 		--dry-run)
   			DRY_RUN=true
      			;;
	 	*)
   			echo "Unknown  option: $arg"
      			exit 1
	 		;;
    	esac
done

DIR="${PWD}/bash"
COPYDIR="${HOME}"

shopt -s dotglob
for file in "$DIR"/*; do
	filename=$(basename "${file}")
 
	[[ "${filename}" == "setup.sh" ]] && continue 

   	src="${file}"
	dest="${COPYDIR}/${filename}"

 	if [[ -f "${dest}" ]]; then
  		if cmp -s "$src" "$dest"; then
    			continue # No changes, skip file
       		fi
	 fi
  
 	if [[ "$DRY_RUN" == true ]]; then
  		echo "-> [dry-run] Would copy ${filename} to ${target}"
    	else
     		echo "-> Copying ${filename} to ${target}"
		cp ${src} ${dest}
	fi
done
shopt -u dotglob
