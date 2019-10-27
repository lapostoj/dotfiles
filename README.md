# dotfiles

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/lapostoj/dotfiles/master/LICENSE)

Author: lapostoj

Contact: jerome.lapostolet@gmail.com

## Description

dotfiles defining system configuration and setup. It is meant for a usage on MacOSX, with zsh, iterm2 and VSCode mainly.
This repository is based on the dotfiles from [@holman](https://github.com/holman/dotfiles) and [@igalarzab](https://github.com/igalarzab/dotfiles)

## Install

- `git clone git@github.com:lapostoj/dotfiles.git ~/.dotfiles`
- `~/.dotfiles/bootstrap.sh`
- `cat ~/.dotfiles/packages/homebrew.txt | xargs brew install` (to repeat for the different package managers present in the folder)

Based on the user's input, this will symlink the appropriate files in `.dotfiles` to your home directory as well as install and or update the listed dependencies and applications.

## Components

Everything's built around topic areas. If you're adding a new area to your forked dotfiles — say, "Java" — you can
simply add a `java` directory and put files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get symlinked without extension into `$HOME`
when you run the `bootstrap` script.

The files follow these patterns:

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made available everywhere.
- **topic/\*.zsh**: Any file ending in `.zsh` get loaded into your environment.
- **topic/\*.symlink**: Any file ending in `*.symlink` get symlinked into your `$HOME`. This is so you can keep all of those versioned in your dotfiles but still keep those autoloaded files in your home directory.
- **topic/install.sh**: Any file called `install.sh` is expected to be called in `bootstrap.sh` after confirmation from the user.
- **packages/package-manager.txt**: These files are lists of applications to install with the corresponding package-managers in order to be fully ready to operate.
