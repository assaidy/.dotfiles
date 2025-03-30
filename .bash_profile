[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR="vim"
else
  export EDITOR="helix"
fi

export TERMINAL="ghostty"
# export MANPAGER="nvim +Man!"

export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/scripts"
export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
export PATH="$PATH:/path/to/java/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.cargo/bin"
