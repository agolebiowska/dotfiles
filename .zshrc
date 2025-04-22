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
)

source $ZSH/oh-my-zsh.sh

bindkey '^I' autosuggest-accept
bindkey '^I' menu-complete
bindkey '^[[Z' reverse-menu-complete

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

alias v="vim -c 'NERDTree'"
alias pip="pip3"
alias jup="jupyter lab --no-browser"
alias gauth="gcloud auth login"
alias gauthad="gcloud auth application-default login"
alias ls="ls -G"
alias ll="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias t="tmux"
alias ta="tmux attach -t"
alias mdc="mdproxy_tools --connect && mdproxy_tools --verify"
alias uplink="uplink-helper login"

export TERM="xterm-256color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Created by `pipx` on 2025-04-19 18:54:06
export PATH="$PATH:/Users/gagata/.local/bin"
[[ -e "/Users/gagata/mdproxy/data/mdproxy_zshrc" ]] && source "/Users/gagata/mdproxy/data/mdproxy_zshrc" # MDPROXY-ZSHRC

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gagata/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/gagata/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gagata/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/gagata/google-cloud-sdk/completion.zsh.inc'; fi
