#!/bin/sh

brewApps=(
  binutils
  bash
  caskroom/cask/brew-cask
  coreutils
  diffutils
  ed --default-names
  file-formula
  findutils --with-default-names
  gawk
  git
  gnu-indent --with-default-names
  gnu-sed --with-default-names
  gnu-tar --with-default-names
  gnu-which --with-default-names
  gnutls
  grep --with-default-names
  gzip
  less
  python
  python3
  ngrok
  node
  rsync
  ruby
  screen
  unzip
  watch
  wdiff --with-gettext
  wget
  the_silver_searcher
  zsh
  macvim --with-lua --with-custom-icons --with-luajit --with-override-system-vim --HEAD
)

casksApps=(
  bettertouchtool
  betterzipql
  caffeine
  caskroom/versions/firefoxdeveloperedition
  caskroom/versions/google-chrome-canary
  firefox
  google-chrome
  imageoptim
  iterm2
  java
  keka
  skype
  transmission
  upm
  viber
  virtualbox
  vlc
  vox
)

# QuickLook Plugins
quickLookPlugins=(
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-csv
  quicklook-json
  webpquicklook
)

nodePackages=(
  csslint
  eslint
  grunt-cli
  node-inspector
)

gemPackages=(
  scss_lint
)

# Check for Homebrew,
# Install if we don't have it

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Brew already Installed..."
fi

# Update homebrew recipes
echo "Updating Formulas..."
brew update

echo "Taping homebrew/dupes..."
brew tap homebrew/dupes

echo "Installing Stuff..."

echo "Installing brew packages..."
brew install ${brewApps[@]}

echo "Installing Casks..."
brew cask install ${casksApps[@]}

echo "Installing QuickLookPlugins..."
brew cask install ${quickLookPlugins[@]}

echo "Cleaning brew..."
brew cleanup


echo "Installing some node packages..."
npm -g install ${nodePackages[@]}

echo "Installing some Ruby Packages..."
gem install ${gemPackages[@]}
