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

# Install GNU `tar`
brew install gnu-tar

# Install bash and completions completions
brew install bash bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap
brew install xz

# Install other useful binaries.
brew install bash-git-prompt
brew install bat
brew install dnsmasq
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion
brew install duti
brew install git
brew install git-lfs
brew install guetzli
brew install lftp
brew install lynx
brew install php
brew install pigz
brew install pv
brew install tree
brew install unrar
brew install wp-cli
brew install wp-cli-completion
brew install yarn --without-node
brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup
