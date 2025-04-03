# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/scripts
export HYPRSHOT_DIR=$HOME/Pictures/Screenshots
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH=$PATH:/path/to/java/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
# export MANPAGER='helix +Man!'

ZSH_THEME="af-magic"
# PROMPT="%F{cyan}%~ >%f "
# PROMPT="[%F{10}%n%f%F{11}@%f%F{red}%m%f][%F{cyan}%~%f]$ "

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='helix'
fi

export TERMINAL=ghostty

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### Aliases
alias cls='clear'
alias e='exit'
alias zshconf='hx ~/.zshrc'

# arch->pacman 
alias pI='sudo pacman -S' 
alias pS='sudo pacman -Ss'
alias pR='sudo pacman -Rn'
alias pQ='pacman -Q'
alias pU='sudo pacman -S archlinux-keyring; sudo pacman -Syu'

# yay
alias yI='yay -S' 
alias yS='yay -Ss'
alias yR='yay -Rn'
alias yQ='yay -Qm'
alias yU='yay -Syu --aur'

# exa 
alias ls='exa -a --icons --group-directories-first'
alias ll='exa -al --icons --group-directories-first'
alias lt='exa -aT --icons --group-directories-first'
alias l.='exa -a --icons | grep "^\."'

# ls
# alias ls='ls -a --color --group-directories-first'
# alias ll='ls -alh --group-directories-first'
# alias l.='ls -a | grep "^\."'

# kitty 
alias kittyicat='kitty +kitten icat'
alias kittythemes='kitty +kitten themes'

# making/editing files and direcotries
alias v='nvim'
alias vf='fd --no-ignore --hidden --exclude=.git -t f | fzf --preview="bat --color always {}" | xargs -r nvim'
alias hx='helix'
alias code='code --profile main'
alias rm='trash'
alias cp='cp -i'
alias lg='lazygit'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# vim mode
set -o vi

# setup fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"


# pywal
# (cat ~/.cache/wal/sequences &)
# source ~/.cache/wal/colors-tty.sh

# oh-my-posh
# eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/1_shell.omp.json)"

# starship prompt
# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init zsh)"

function yz() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
