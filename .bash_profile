[[ -f ~/.bashrc ]] && . ~/.bashrc

# geeks
[[ -n $SSH_CONNECTION ]] && export EDITOR="vim" || export EDITOR="helix"

export HISTSIZE=1000000 # max number of command history in memory
export HISTFILESIZE=1000000 # max number of command history in history file

export TERMINAL="ghostty"
export MANPAGER="nvim +Man!"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/scripts"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
export PATH="$PATH:/path/to/java/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
