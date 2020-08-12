bindkey -e

unsetopt beep

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt BANG_HIST
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

DIRSTACKSIZE=20
setopt autopushd 
setopt pushdignoredups

autoload -U compinit
compinit
zstyle ':completion:*' menu select
setopt completealiases

source /usr/share/zsh/share/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-completions
antigen bundle paulirish/git-open
antigen apply

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_FUZZY="y"

autoload  -U colors && colors
autoload -U promptinit
promptinit
PROMPT="%{$fg[cyan]%}%n %{$reset_color%}%{$fg[magenta]%}%1d%{$reset_color%}> "