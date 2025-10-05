# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History settings
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Install missing modules and update ${ZIM_HOME}/init.zsh
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source /opt/homebrew/opt/zimfw/share/zimfw.zsh init
fi

# Initialize modules
source ${ZIM_HOME}/init.zsh

# Define a function to set up zsh-history-substring-search bindings after zsh-vi-mode
zvm_after_init() {
  # Bind up/down arrows for history-substring-search in both viins and vicmd modes
  zvm_bindkey viins '\e[A' history-substring-search-up
  zvm_bindkey viins '\e[B' history-substring-search-down
  zvm_bindkey vicmd '\e[A' history-substring-search-up
  zvm_bindkey vicmd '\e[B' history-substring-search-down
}

# Rest of your .zshrc
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/python@3.13/bin:/Users/alberto/.local/bin:$PATH"

alias ...='cd ../../..'
alias ....='cd ../../../..'
alias c=clear
alias l='eza -lh --group-directories-first -A'
alias python=python3.13
alias pip=pip3
alias tree='tree --gitignore'
alias vim=nvim

eval "$(zoxide init zsh)"
p10k finalize
