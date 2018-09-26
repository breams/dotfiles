#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we're using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install bash completions
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install xz

# Install other useful binaries.
brew install duti
brew install git
brew install git-lfs
brew install guetzli
brew install lynx
brew install pigz
brew install pv
brew install tree
brew install unrar
brew install yarn --without-node
brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup
