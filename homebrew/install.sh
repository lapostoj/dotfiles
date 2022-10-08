#!/bin/sh

if test ! $(which brew)
then
  echo "🍺 Installing Homebrew for you."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else 
  echo "🍻 Homebrew already installed."
fi

exit 0
