#
# Common Aliases
#

alias ls='ls $LS_OPTIONS'           # Standard ls
alias ll='ls $LS_OPTIONS -lhA'      # Detail view, all except . and ..
alias l='ls $LS_OPTIONS -lh'        # Detail view, no hidden entries
alias lx='ls $LS_OPTIONS -lXB'      # Sort by extension.
alias lk='ls $LS_OPTIONS -lSr'      # Sort by size, biggest last.
alias lt='ls $LS_OPTIONS -ltr'      # Sort by date, most recent last.
alias lu='ls $LS_OPTIONS -ltur'     # Sort by/show access time,most recent last.
alias ..='cd ..'

#
# Safety and Mistake Aliases
#

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cd..='cd ..'

# misc. commands
alias less='less --RAW-CONTROL-CHARS'
alias top='htop'

export PAGER="less"
export VISUAL="vim"

# User-local binaries
PATH="~/bin:~/.bin:$PATH"
