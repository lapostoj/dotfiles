#!/bin/sh

if test ! $(which brew)
then
  echo "🍺 Installing Homebrew for you."

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else 
  echo "🍻 Homebrew already installed."
fi

exit 0
