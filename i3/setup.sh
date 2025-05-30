#!/bin/bash
set -e 

# -----------------------
# Dotfiles Setup Template
# -----------------------

# Default args
APP_NAME="$(basename "${BASH_SOURCE[0]%/*}")"
DRY_RUN=false
SETUP_DIR="${PWD}/${APP_NAME}"
TARGET_DIR="${HOME}/.config/i3"

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

echo "Setting up ${APP_NAME}..."

shopt -s dotglob
for file in "${SETUP_DIR}"/*; do
  filename=$(basename "${file}")
 
  [[ "${filename}" == "setup.sh" ]] && continue 

  src="${file}"
  dest="${TARGET_DIR}/${filename}"

  # Compare files
  if [[ -e "${dest}" ]]; then
    if diff -qr "$src" "$dest"; then
      continue 
    fi
  fi 

  if [[ "$DRY_RUN" == true ]]; then
    # Dry run
    echo "-> [dry-run] Would copy ${filename} to ${dest}"
  else
    # Run copy
    echo "-> Copying ${filename} to ${dest}"
    mkdir -p "$(dirname "${dest}")"
		if [[ -d "${src}" ]]; then
			cp -r "${src}" "${dest}"
		else
			cp "${src}" "${dest}"
		fi
  fi
done

shopt -u dotglob
echo "Finished setting up ${APP_NAME}" 
