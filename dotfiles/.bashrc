#
# Copyright (C) 2004-2017 David Jia Wei Li
#

#
# Configuration Detection
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Skip if not using bash
[[ -n "${BASH_VERSION}" ]] || return

# Detect platform
export _islinux=false
[[ "$(uname -s)" =~ Linux|GNU|GNU/* ]] && _islinux=true

# Detect root user
export _isroot=false
[[ $UID -eq 0 ]] && _isroot=true

if test -d ~/.bashrc.d/; then
    for bashrc in ~/.bashrc.d/*.sh; do
        test -r "$bashrc" && . "$bashrc"
    done
    unset bashrc
fi

unset _islinux
unset _isroot
