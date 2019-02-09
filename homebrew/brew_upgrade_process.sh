#!/bin/sh

append_to_changelog () {
  echo "$1" >> $BREW_CHANGELOG_FILE
}

header () {
  append_to_changelog "----- $1"
}

echo "🍺 Starting upgrade of all installed applications."

header "$(date -u) -----"
header "INSTALLED"
append_to_changelog "$(brew list --versions)"

echo "🍺 Updating brew."
brew update

echo "👴 Outdated apps"
brew outdated

echo "❓ Continue?"
read continuing

if [ "$continuing" != "yes" ]
then exit 1
fi

header "OUTDATED"
append_to_changelog "$(brew outdated)"

echo "🍺 Upgrading apps."
brew upgrade

header "CLEANED UP"
append_to_changelog "$(brew cleanup -n)"

echo "🍺 Cleaning up."
brew cleanup

header "END"

echo "🍻 Brew upgrade done."