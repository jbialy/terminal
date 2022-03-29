# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cqd/.oh-my-zsh"

# Set GOPATH
export GOPATH=${HOME}/go
export PATH="$PATH:$GOPATH/bin"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Add GPG key to shell 
export GPG_TTY=$(tty)

# add shellcheck excludes
export SHELLCHECK_EXCLUDES="SC2154,SC2086,SC2155,SC2015,SC2207,SC1090"

# Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"

# kubectl krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# make helm2 the default
export PATH="/usr/local/opt/helm@2/bin:$PATH"

# curl from brew
export PATH="/usr/local/opt/curl/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    aws
    docker
    fzf
    golang
    z
    kube-ps1
    zsh-autosuggestions
    zsh-syntax-highlighting
)

#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

source $ZSH/oh-my-zsh.sh

# Add kube context to prompt (requires kube-ps1)
PROMPT=$PROMPT'$(kube_ps1) '
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_DIVIDER=""

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

alias docker_stop_all='docker stop $(docker ps -a -q)'
alias docker_rm_all='docker rm $(docker ps -a -q)'
alias docker_rm_dangling='docker rmi $(docker images -f \"dangling=true\" -q)'
alias kc='kubectx'
alias kns='kubens'
alias weather='curl "wttr.in/Ottawa?0"'
alias lg='lazygit'
alias ldock='lazydocker'
alias cat='bat -n'
alias k='kubectl'
alias okta='/Users/cqd/github/aws-okta-wrapper/aws-okta-wrapper.py'

okta-awscli () {
    sed -i'' -e '/role/d' ~/.okta-aws
    sed -i'' -e '/app-link/d' ~/.okta-aws
    command okta-awscli "$@"
}

alias flush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# zsh completion handled outside of oh-my-zsh plugins

source <(awless completion zsh)
source <(kubectl completion zsh)
source <(minikube completion zsh)
source <(helm completion zsh)
source <(helm3 completion zsh)
source <(aws-okta completion zsh)
source <(stern --completion=zsh)

# Source chtf
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
    source "/usr/local/share/chtf/chtf.sh"
fi

set -o ignoreeof
