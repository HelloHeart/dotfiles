# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Avoid duplicate history entries or include spaces
HISTCONTROL=ignoreboth:erasedups
# Append thhe history instead of overwriting it
shopt -s histappend

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Default parameter to send to the "less" command
# -R: show ANSI colors correctly; -i: case insensitive search
LESS="-R -i"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Add sbin directories to PATH.  This is useful on systems that have sudo

[ -z "${PATH##*/sbin*}" ] || PATH=$PATH:/sbin:/usr/sbin

[ -z "${PATH##*/home/amol/.local/bin*}" ] || PATH=$PATH:"/home/amol/.local/bin"

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PAGER=less
export VISUAL=emacsclient
export EDITOR=emacsclient
export LC_ALL=en_US.UTF-8
export PYTHONBINDING=UTF-8
