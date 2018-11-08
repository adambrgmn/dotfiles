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

# Colors
CL_BLACK='\033[0;30m'
CL_DARK_GRAY='\033[1;30m'
CL_RED='\033[0;31m'
CL_LIGHT_RED='\033[1;31m'
CL_GREEN='\033[0;32m'
CL_LIGHT_GREEN='\033[1;32m'
CL_BROWN_ORANGE='\033[0;33m'
CL_YELLOW='\033[1;33m'
CL_BLUE='\033[0;34m'
CL_LIGHT_BLUE='\033[1;34m'
CL_PURPLE='\033[0;35m'
CL_LIGHT_PURPLE='\033[1;35m'
CL_CYAN='\033[0;36m'
CL_LIGHT_CYAN='\033[1;36m'
CL_LIGHT_GRAY='\033[0;37m'
CL_WHITE='\033[1;37m'
CL_NONE='\033[0m'

# Alias
alias did="vim +'normal Go' +'r!date' ~/did.txt" # Short to jot down someting about what I have done

# General messages on startup
echo -e "🚀 ${CL_GREEN}node:${CL_NONE} ${$(node -v)/v/""}"
echo -e "📦 ${CL_GREEN}npm:${CL_NONE}  $(npm -v)"
echo -e "📦 ${CL_GREEN}yarn:${CL_NONE} $(yarn -v)"
echo -e "⚡️ Remember to run ${CL_BLUE}'ellipsis pull'${CL_NONE} every now and then"
