#!/bin/bash

set -e
SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

git submodule update --init --recursive
ln --symbolic "$SCRIPT_DIRECTORY/vimrc" "$HOME/.vimrc"
ln --symbolic "$SCRIPT_DIRECTORY/ctags" "$HOME/.ctags"
ln --symbolic "$SCRIPT_DIRECTORY/ycm_extra_conf.py" "$HOME/ycm_extra_conf.py"
