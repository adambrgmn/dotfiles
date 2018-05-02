# !/usr/bin/env bash
# adambrgmn/dotfiles - ellipsis package
ELLIPSIS_VERSION_DEP='1.9.4'

ZSH_PLUGINS="${ZSH}/custom/plugins"
DIRS=(".iTerm2")

ZSH_DEPS=(zsh-autosuggestions zsh-syntax-highlighting)
NPM_DEPS=(pure-prompt commitizen flow-bin npm)

pkg.install() {
  # Install npm dependencies
  for plugin in ${NPM_DEPS[@]}; do
    if npm ls -g --depth=0 | grep $plugin; then
      msg.bold "Skip installing $plugin"
    else
      msg.bold "Installing $plugin"
      npm i -g $plugin --silent
    fi
  done

  # Install zsh plugins
  for plugin in ${ZSH_DEPS[@]}; do
    if [ -d "${ZSH_PLUGINS}/$plugin" ]; then
      msg.bold "Skip installing $plugin"
    else
      msg.bold "Installing $plugin"
      git clone https://github.com/zsh-users/$plugin $ZSH_PLUGINS/$plugin --quiet
    fi
  done
}

pkg.push() {
  git.push
}

pkg.link() {
  for dir in ${DIRS[@]}; do
    fs.link_file "${PKG_PATH}/${dir}" "${ELLIPSIS_HOME}/${dir}"
  done

  hooks.link
}

pkg.unlink() {
  for dir in ${DIRS[@]}; do
    rm "${ELLIPSIS_HOME}/${dir}"
  done

  hooks.unlink
}

pkg.pull() {
  msg.bold "updating dotfiles"

  # Use improved update strategy
  git remote update 2>&1 > /dev/null
  if git.is_behind; then
    pkg.unlink
    git.pull
    pkg.link
  fi

  # Update dependencies
  for plugin in ${NPM_DEPS[@]}; do
    msg.dim $(msg.tabs) "updating $plugin"
    npm i -g $plugin --silent
  done

  for plugin in ${ZSH_DEPS[@]}; do
    cd "$ZSH_PLUGINS/$plugin"

    git remote update 2>&1 > /dev/null
    if git.is_behind; then
      msg.dim "updating dependency $plugin"
      git pull
    else
      msg.dim "skip updating $plugin"
    fi
  done

  cd $PKG_PATH
}

pkg.status() {
  git.diffstat
}
