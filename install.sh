#!/bin/bash
# set -eEuxo pipefail

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SRC="$SCRIPT_DIRECTORY"

: ${XDG_CONFIG_HOME=$HOME/.config}

function installf {
    local SRC="$1"
    local DST="$2"

    mkdir -vp "$(dirname "$DST")"
    ln -vfs "$SRC" "$DST"

    # install -vDT "$SRC" "$DST"
}

installf "$SRC" "$XDG_CONFIG_HOME/nvim"

# git submodule update --init --recursive

installf "$SRC/ctags" "$HOME/.ctags"

if [ -f "$HOME/.local/share/deluminator/deluminator.vim" ]; then
    ln -vsr "$HOME/.local/share/deluminator/deluminator.vim" "./autoload/deluminator.vim"
fi

( cd "./fonts" ; "./install.sh" )
