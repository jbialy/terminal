# Add path to GPG-Agent
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=${PATH}:/usr/local/opt/gettext/bin

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path to your oh-my-zsh installation.
export ZSH=/Users/cqd/.oh-my-zsh

# Set GOPATH
export GOPATH=${HOME}/go
export PATH="$PATH:$GOPATH/bin"

# Add GPG key to shell 
export GPG_TTY=$(tty)

# Add support for "jump around"
. ~/z/z.sh

# add shellcheck excludes
export SHELLCHECK_EXCLUDES="SC2154,SC2086,SC2155,SC2015,SC2207,SC1090"

# python 2.7 user bin
export PATH="$PATH:/Users/cqd/Library/Python/2.7/bin"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="mybira"

#ZSH_THEME="powerlevel9k/powerlevel9k"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  aws
  fzf
  brew
  docker
  golang
  helm
  thefuck
  zsh-autosuggestions
  kubectl
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

alias docker_stop_all='docker stop $(docker ps -a -q)'
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias docker_rm_dangling='docker rmi $(docker images -f \"dangling=true\" -q)'
alias kc='kubectx'
alias weather='curl "wttr.in/Ottawa?0"'
alias lg='lazygit'
alias cat='bat -n'

# zsh completion handled outside of oh-my-zsh plugins
source <(awless completion zsh)
source <(kubectl completion zsh)
source <(minikube completion zsh)
