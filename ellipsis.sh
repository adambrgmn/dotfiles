# !/usr/bin/env bash
# adambrgmn/dotfiles - ellipsis package
ELLIPSIS_VERSION_DEP='1.9.4'

pkg.install() {
  if [ $(npm ls -g --depth=0 | grep 'pure-prompt') ]; then
    log.fail "'pure-prompt' must be installed ('npm i -g pure-prompt')"
    return 1
  fi
}

pkg.push() {
  git.push
}

pkg.pull() {
  # Use improved update strategy
  git remote update 2>&1 > /dev/null
  if git.is_behind; then
    pkg.unlink
    git.pull
    pkg.link
  fi
}

pkg.status() {
  git.diffstat
}
