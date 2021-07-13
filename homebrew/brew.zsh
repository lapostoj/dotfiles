export BREW_CHANGELOG_FILE=$DOTFILES/homebrew/brew_changelog
export HOMEBREW_NO_AUTO_UPDATE=1

# Customized commands
alias brew-upgrade-process='$DOTFILES/homebrew/brew_upgrade_process.sh'

alias cask-outdated='brew outdated --cask --greedy'