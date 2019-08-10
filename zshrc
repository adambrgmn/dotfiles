export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Path setup
export PATH="$HOME/.rbenv/bin:$PATH" # Ruby
export PATH="$HOME/Documents/go/bin:$PATH" # Go
export PATH="$HOME/.ellipsis/bin:$PATH" # Ellipsis dotfiles
export PATH="$HOME/.composer/vendor/bin:$PATH" # Composer PHP
export PATH="$HOME/.cargo/bin:$PATH"

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

# iTerm2 Shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load other important files
for file in ~/.{aliases,autocomplete,colors,functions,iterm-scripts,settings}; do
  [ -r "$file" ] && source "$file"
done
unset file

echo -e "\n⚡️ Remember to run ${CL_BLUE}'ellipsis pull && ellipsis link dotfiles'${CL_NONE} every now and then"
