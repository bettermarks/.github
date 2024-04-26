#!/usr/bin/env sh
# source https://github.com/bettermarks/.github#git-hooks
# why https://typicode.github.io/husky/how-to.html#solution
# to use it place a copy like this:
#   mkdir -p ~/.config/husky && cp git-hooks/init.sh ~/.config/husky

# "enable" direnv
if [ -s .envrc ]; then
  echo "enabling direnv"

  eval $(direnv export bash)
fi

# enable nvm (tweak it when
if [ -s .nvmrc ]; then
  echo "enabling nvm"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  node --version
  # make pnpm/yarn available
  corepack enable
fi
