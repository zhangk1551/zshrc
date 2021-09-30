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
antigen bundle skywind3000/z.lua
antigen apply

eval "$(lua /home/host/.antigen/bundles/skywind3000/z.lua/z.lua --init zsh)"

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_FUZZY="y"

autoload  -U colors && colors
autoload -U promptinit
promptinit
PROMPT="%{$fg[cyan]%}%n %{$reset_color%}%{$fg[magenta]%}%1d%{$reset_color%}> "

stty -ixon

alias c="chromium  > /dev/null 2>&1 &"

alias hh="history -n > /dev/null"

alias hp="--help"

alias g=git
alias gb="git branch"
alias gca="git commit --amend"
alias gd="git diff"
alias gp="git push origin -u master"
alias gs="git status"
gc () {command git add *; git commit -m ""$@""}

mc () {mkdir -p "$@"; cd "$@"}
alias mp="mousepad"

alias s=systemctl
alias sls="systemctl list-units --type service"

alias p="sudo pacman -S"
alias pls="sudo pacman -Qqe"
alias pu="sudo pacman -Syu"

alias y="yay -S"

alias duls="du -h --max-depth=1 | sort -h"

alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i 'state\|percentage'"

alias xx="xmodmap /etc/X11/xinit/.Xmodmap"
alias sz="source ~/.zshrc"

alias ap="ALL_PROXY=socks://127.0.0.1:1080"

export PATH=$PATH:/home/host/bin

autoload bashcompinit
bashcompinit
