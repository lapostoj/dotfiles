#!/bin/sh
#
# bootstrap installs things.

cd "$(dirname "$0")/.."
DOTFILES_ROOT=~/.dotfiles

set -e

echo ''

info () {
  printf "ℹ️  $1\n"
}

user () {
  printf "👨‍💻 $1\n"
}

success () {
  printf "✅ $1\n"
}

ok () {
  printf "👌 $1\n"
}

fail () {
  printf "🛑 $1\n"
  echo ''
  exit
}

run_script_if_user_confirms () {
  user "Do you want to run $1? (y/n)"
  read -n 1 action
  echo ''
  if [ "$action" == 'y' ] 
  then $1
  else ok "Skipping $1"
  fi
  echo ''
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then
        skip=true;
      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action
        echo ''

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      ok "Removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      ok "Moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      ok "Skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    ok "Linked $1 to $2"
  fi
}

install_dotfiles () {
  info 'Installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done

  link_file "$DOTFILES_ROOT/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

  success 'Installing dotfiles'
}

install_homebrew () {
  info 'Installing homebrew'
  "$DOTFILES_ROOT"/homebrew/install.sh
  success 'Installing homebrew'
}

update_macos () {
  info 'Updating macOS'
  "$DOTFILES_ROOT"/macos/install.sh
  success 'Updating macOS'
}

set_defaults_macos () {
  info 'Setting macOS defaults'
  "$DOTFILES_ROOT"/macos/set_defaults.sh
  success 'Setting macOS defaults'
}

run_script_if_user_confirms 'install_dotfiles'
run_script_if_user_confirms 'install_homebrew'
run_script_if_user_confirms 'update_macos'
run_script_if_user_confirms 'set_defaults_macos'

success 'All installed!'
