bindkey -e

unsetopt beep

autoload -U select-word-style
select-word-style bash

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt BANG_HIST
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS 

DIRSTACKSIZE=20
setopt autopushd 
setopt pushdignoredups

autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases

function expand-alias() {
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias
bindkey -M main ' ' expand-alias

source /usr/share/zsh/share/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle paulirish/git-open
antigen bundle zhangk1551/vim-from-git-repo
antigen apply

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_FUZZY="y"

autoload  -U colors && colors
autoload -U promptinit
promptinit
PROMPT="%{$fg[cyan]%}%n %{$reset_color%}%{$fg[magenta]%}%1d%{$reset_color%}> "

stty -ixon

alias c=chromium

alias g=git
alias gca="git commit --amend"
alias gd="git diff"
alias gp="git push origin -u master"
alias gs="git status"
gc () {command git add *; git commit -m ""$@""}

mc () {mkdir -p "$@"; cd "$@"}

alias s=systemctl
alias sls="systemctl list-units --type service"

alias p="sudo pacman -S"
alias pls="sudo pacman -Qqe"
alias pu="sudo pacman -Sy"

alias ap="ALL_PROXY=socks://127.0.0.1:1080"

alias duls="du -h --max-depth=1 | sort -h"

alias px=proxychains

alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i 'state\|percentage'"
