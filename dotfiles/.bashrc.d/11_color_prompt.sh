#
# Force Color Prompt Implementation
#

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

# Custom Prompt
export PS1='\[\033[1;31m\](\[\033[0;37m\]\u\[\033[1;31m\]@\h\[\033[1;31m\]:\[\033[1;36m\]\w\[\033[1;31m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
export PS2='-->'

# Override for root
if $_isroot; then
    export PS1='\[\033[1;32m\](\[\033[1;32m\]\u\[\033[1;31m\]@\h\[\033[1;31m\]:\[\033[1;36m\]\w\[\033[1;32m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
    export PS2='#->'
fi

# Colorize 'ls'
export LS_OPTIONS='--color=auto'
eval "`dircolors`"