# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1="[\u@\h \w]\$ "
update_prompt() {
  GREEN="\[$(tput setaf 2)\]"
  BLUE="\[$(tput setaf 4)\]"
  RED="\[$(tput setaf 1)\]"
  YELLOW="\[$(tput setaf 3)\]"
  RESET="\[$(tput sgr0)\]"
  BOLD="\[$(tput bold)\]"
  git_status=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  [[ -n $git_status ]] && {
    changes=$(git status --porcelain 2>/dev/null | wc -l)
    [[ $changes != 0 ]] && git_status=" ($git_status $changes)" || git_status=" ($git_status)"
  }
  PS1="$GREEN[$RESET\u$GREEN@$BLUE\h $RED\w$GREEN]$RESET$BOLD$YELLOW$git_status$RESET$BLUE\$$RESET "
}
PROMPT_COMMAND=update_prompt

alias grep="grep --color=always"
alias cls="clear"
alias e="exit"
alias vf="fd --no-ignore --hidden --exclude=.git -t f | fzf --preview='bat --color always {}' | xargs -r nvim"
alias v="nvim"
alias hx="helix"
alias code="code --profile main"
alias rm="trash"
alias cp="cp -i"
alias lg="lazygit"

alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

alias pI="sudo pacman -S" 
alias pS="pacman -Ss"
alias pR="sudo pacman -Rn"
alias pQ="pacman -Q"
alias pU="sudo pacman -S archlinux-keyring; sudo pacman -Syu"

alias yI="yay -S" 
alias yS="yay -Ss"
alias yR="yay -Rn"
alias yQ="yay -Qm"
alias yU="yay -Syu --aur"

alias ls="exa -a --icons --group-directories-first"
alias ll="exa -al --icons --group-directories-first"
alias lt="exa -aT --icons --group-directories-first"
alias l.="exa -a --icons | grep '^\.'"

# function to chang directory to yazi directory
function yz() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# functio to extract files
# usage: ex <file>
function ex () {
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

# function to convert a github repository file link to its raw content link
function gr() {
  github_raw_link=$(echo "$1" | sed 's/github.com/raw.githubusercontent.com/; s/\/blob\//\//')
	echo "$github_raw_link"
}

bind "set completion-ignore-case on"

set -o vi
bind -m vi-insert "Control-l: clear-screen"

# setup fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
