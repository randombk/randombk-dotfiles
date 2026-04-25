#
# Force Color Prompt Implementation
#
if [ -n "$force_color_prompt" ]; then
    if [ "$IS_AGENT" = true ]; then
        # Use dark blue for agent
        export PS1='\[\033[1;34m\](\[\033[0;37m\]\u\[\033[1;34m\]@\h\[\033[1;34m\]:\[\033[1;36m\]\w\[\033[1;34m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export color_prompt=yes
    elif [ "$_isroot" = true ]; then
        # Use green for root
        export PS1='\[\033[1;32m\](\[\033[1;32m\]\u\[\033[1;32m\]@\h\[\033[1;32m\]:\[\033[1;36m\]\w\[\033[1;32m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export PS2='#->'
        export color_prompt=yes
    else
        # Default: red for user
        export PS1='\[\033[1;31m\](\[\033[0;37m\]\u\[\033[1;31m\]@\h\[\033[1;31m\]:\[\033[1;36m\]\w\[\033[1;31m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
        export color_prompt=yes
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
    export PS1='\[\033[1;32m\](\[\033[1;32m\]\u\[\033[1;32m\]@\h\[\033[1;32m\]:\[\033[1;36m\]\w\[\033[1;32m\])\[\033[1;36m\]\$ \[\033[0;37m\]'
    export PS2='#->'
fi

# Colorize 'ls'
export LS_OPTIONS='--color=auto'
eval "`dircolors`"
