#!/bin/bash

set -e
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init --recursive
ln --symbolic "$SCRIPT_DIRECTORY/vimrc" "$HOME/.vimrc"
