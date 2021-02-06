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

# Load bashrc scripts from repo. This directory should be a symlink
if test -d ~/.bashrc.d/; then
    for bashrc in ~/.bashrc.d/*.sh; do
        test -r "$bashrc" && . "$bashrc"
    done
    unset bashrc
fi

# If the dlpnetworks releases repo is cloned, also load additional global bashrcs from there
if test -f ~/dlpnetworks-releases/global-bashrc.d/; then
    for bashrc in ~/dlpnetworks-releases/global-bashrc.d/*.sh; do
        test -r "$bashrc" && . "$bashrc"
    done
    unset bashrc
fi

unset _islinux
unset _isroot
