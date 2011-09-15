# completion
autoload -U compinit
compinit

# automatically enter directories without cd
setopt auto_cd

# use vim as an editor
export EDITOR=vim

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# expand functions in the prompt
setopt prompt_subst

# prompt
export PS1='[${SSH_CONNECTION+"%n@%m:"}%~] '

# ignore duplicate history entries
setopt histignoredups

# keep TONS of history
export HISTSIZE=4096

# look for ey config in project dirs
export EYRC=./.eyrc

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# Enable extended globbing
setopt EXTENDED_GLOB


webroot=/var/www/html/damian.thrillist.com/Thrillist
themeroot=$webroot/sites/all/themes/thrillist3/

alias cc='compass compile $themeroot'
alias t3='cd $themeroot'
alias tl='cd $webroot'
alias modules='cd $webroot/sites/all/modules'

alias tmux='tmux -2'

# name of the branch we are on
#
git_prompt_info() {
  ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}
autoload -U colors
colors
setopt prompt_subst
PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%} %% %{$reset_color%}'

alias gs='git status -sb'
