#
# Force Color Prompt Implementation
#
# Respects BASHRC_MODE from ~/.bashrc: user_interactive, agent_interactive,
# agent_headless (non-interactive PS1 left alone).

if [[ "${BASHRC_MODE:-}" == agent_headless ]]; then
    unset GREP_OPTIONS
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    export LS_OPTIONS='--color=auto'
    command -v dircolors >/dev/null 2>&1 && eval "$(SHELL=/bin/sh dircolors)"
    return
fi

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	export color_prompt=yes
    else
	export color_prompt=
    fi
fi

#
# More Colors
#

export TERM=xterm-color
unset GREP_OPTIONS # Grep now breaks with this on
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# use color where possible
export force_color_prompt=yes

if [[ "${BASHRC_MODE:-}" == user_interactive || "${BASHRC_MODE:-}" == agent_interactive ]]; then
    if $_isroot; then
        export PS1='\[\033[1;32m\](\[\033[1;32m\]\u\[\033[1;31m\]@\h\[\033[1;31m\]:\[\033[1;36m\]\w\[\033[1;32m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export PS2='#->'
    elif [[ "${BASHRC_MODE:-}" == agent_interactive ]]; then
        export PS1='\[\033[1;34m\](\[\033[0;37m\]\u\[\033[1;34m\]@\h\[\033[1;34m\]:\[\033[1;36m\]\w\[\033[1;34m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export PS2='-->'
    else
        export PS1='\[\033[1;31m\](\[\033[0;37m\]\u\[\033[1;31m\]@\h\[\033[1;31m\]:\[\033[1;36m\]\w\[\033[1;31m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export PS2='-->'
    fi
fi

# Colorize 'ls'
export LS_OPTIONS='--color=auto'
if command -v dircolors >/dev/null 2>&1; then
    eval "$(SHELL=/bin/sh dircolors)"
fi