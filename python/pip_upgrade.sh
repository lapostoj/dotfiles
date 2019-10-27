#!/bin/sh

append_to_changelog () {
  echo "$1" >> $PIP_CHANGELOG_FILE
}

header () {
  append_to_changelog "----- $1"
}

echo "🐍 Starting upgrade of all installed applications."

header "$(date -u) -----"
header "INSTALLED"
append_to_changelog "$(pip list --format=freeze)"

echo "👴 Outdated apps"
pip list --outdated --format=freeze

echo "❓ Continue?"
read continuing

if [ "$continuing" != "yes" ]
then exit 1
fi

header "OUTDATED"
append_to_changelog "$(pip list --outdated --format=freeze)"

echo "🆙 Upgrading apps."
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

header "END"

echo "🐍 Brew upgrade done."