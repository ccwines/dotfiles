#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -FlAh --color=auto --group-directories-first'
alias src='source'
alias gs='git status'
alias ga='git add .'
alias gcm='git commit -m'
alias gc='git commit'
alias gps='git push --set-upstream origin'
alias mv='mv -i'
alias see='sxiv'
alias ss='maim -s ~/Pictures/screenshots/"screenshot_$(date +%Y%m%d_%H%M%S).jpg"'
alias wttr='curl wttr.in'
alias ssh='TERM=xterm-256color ssh'
alias spot='~/.config/scripts/launchspt'

shopt -s autocd

set -o vi

export HISTCONTROL=ignoreboth

. ~/.config/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '
export PATH=$HOME/.local/bin:$PATH

neofetch
