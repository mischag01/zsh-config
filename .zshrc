# Automatic updates
zstyle ':omz:update' mode auto

# Update check frequency in days
zstyle ':omz:update' frequency 1

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_THEME="robbyrussell"

# Auto update oh-my-zsh
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# ZSH plugins
plugins=(git)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load ZSH syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load Kubernetes shortcuts file
if [ -f "$HOME/.config/scripts/aliases.sh" ]; then
  source "$HOME/.config/scripts/aliases.sh"
else
  echo "Could not load Kubernetes aliases: file not found at $HOME/.config/aliases.sh"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mischagideonse/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mischagideonse/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mischagideonse/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mischagideonse/google-cloud-sdk/completion.zsh.inc'; fi

# Method to remove local branches that have been merged on the remote
function clean-git-branches() {
  ~/.config/scripts/clean-branches.sh
}

# Method to switch between OpenJDK versions
function openjdk() {
  if [ -z "$1" ]; then
    echo "Usage: openjdk <version>"
    return 1
  fi

  if [ -d "/opt/homebrew/opt/openjdk@$1" ]; then
    export JAVA_HOME="/opt/homebrew/opt/openjdk@$1"
    export PATH="$JAVA_HOME/bin:$PATH"
    echo "Switched to OpenJDK $1"
  else
    echo "OpenJDK $1 is not installed. Available versions:"
    ls -1 /opt/homebrew/opt | grep openjdk@
  fi
}
