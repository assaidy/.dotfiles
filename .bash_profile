[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -n $SSH_CONNECTION ]] && export EDITOR="vim" || export EDITOR="nvim"

export HISTSIZE=1000000 # max number of command history in memory
export HISTFILESIZE=1000000 # max number of command history in history file

# export TERMINAL="footClient"
# export MANPAGER="nvim +Man!"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/fzf_scripts"
export PATH="$PATH:$DOTNET_ROOT/tools"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
