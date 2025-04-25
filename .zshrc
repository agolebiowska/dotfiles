# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
git
macos
docker
colored-man-pages
zsh-autosuggestions
zsh-syntax-highlighting
virtualenv
)

source $ZSH/oh-my-zsh.sh

bindkey '^I' autosuggest-accept
bindkey '^I' menu-complete
bindkey '^[[Z' reverse-menu-complete

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias v="vim -c 'NERDTree'"
alias jup="jupyter lab --no-browser"
alias nbc="python3 -m nbconvert --to python"
alias gauth="gcloud auth login --no-launch-browser"
alias gauthad="gcloud auth application-default login --no-launch-browser"
alias ls="ls -G"
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias t="tmux"
alias ta="tmux attach -t"

export TERM="xterm-256color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Load Angular CLI autocompletion.
source <(ng completion script)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Created by `pipx` on 2025-04-24 21:15:52
export PATH="$PATH:/usr/local/google/home/gagata/.local/bin"
