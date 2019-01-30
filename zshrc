export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Path setup
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/Documents/go/bin:$PATH"
export PATH="$HOME/.ellipsis/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

ZSH_THEME=""
plugins=(git sublime npm git-flow zsh-syntax-highlighting zsh-autosuggestions)

# ZSH Completions
fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# rbenv
eval "$(rbenv init -)"

# travis
[ -f /Users/adam/.travis/travis.sh ] && source /Users/adam/.travis/travis.sh

# golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/Documents/go"

# Ellipsis setup (http://ellipsis.sh/)
export ELLIPSIS_USER=adambrgmn

# Setup of https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Load other important files
for file in ~/.{aliases,colors,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# General messages on startup
echo -e "🚀 ${CL_GREEN}node:${CL_NONE} ${$(node -v)/v/}"
echo -e "📦 ${CL_GREEN}npm:${CL_NONE}  $(npm -v)"
echo -e "📦 ${CL_GREEN}yarn:${CL_NONE} $(yarn -v)"
echo -e "\n⚡️ Remember to run ${CL_BLUE}'ellipsis pull && ellipsis link dotfiles'${CL_NONE} every now and then"
