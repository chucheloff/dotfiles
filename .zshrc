
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Users/chuch/scripts"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"


# If not in tmux, start tmux.
if [[ -z ${TMUX+X}${ZSH_SCRIPT+X}${ZSH_EXECUTION_STRING+X} ]]; then
  exec tmux
fi

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

# Activate Powerlevel10k Instant Prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13

[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
export PATH="$PATH:/usr/local/opt/python@3.12/libexec/bin"


# GO SETUP
export GOPATH=$HOME/go  
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

alias now="yt-dlp -f 'ba' -x --audio-format mp3"

