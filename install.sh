#!/bin/bash
# set -eEuxo pipefail

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="$SCRIPT_DIRECTORY"

: ${XDG_CONFIG_HOME=$HOME/.config}

function installf {
    SRC="$1"
    DST="$2"

    mkdir -vp "$(dirname "$DST")"
    ln -vfs "$SRC" "$DST"

    # install -vDT "$SRC" "$DST"
}


installf "$SRC/nvimrc" "$XDG_CONFIG_HOME/nvim/init.vim"

# git submodule update --init --recursive

installf "$SRC/vimrc" "$HOME/.vimrc"
installf "$SRC/ctags" "$HOME/.ctags"
installf "$SRC/ycm_extra_conf.py" "$HOME/ycm_extra_conf.py"
