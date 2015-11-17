#!/bin/sh

brewApps=(
  coreutils
  bash
  cmake
  caskroom/cask/brew-cask
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
  tmux
  the_silver_searcher
  zsh
  vim --override-system-vi --HEAD
  reattach-to-user-namespace
)

casksApps=(
  bettertouchtool
  betterzipql
  caffeine
  caskroom/versions/firefoxdeveloperedition
  caskroom/versions/google-chrome-canary
  firefox
  font-hack
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

brew tap homebrew/versions
brew install caskroom/cask/brew-cask
brew tap caskroom/fonts
brew tap homebrew/dupes

# Update homebrew recipes
echo "Updating Formulas..."
brew update

echo "Taping homebrew/dupes..."
brew tap homebrew/dupes

echo "Installing Stuff..."

echo "Installing brew packages..."
# brew install ${brewApps[@]}
brew install coreutils
brew install bash
brew install caskroom/cask/brew-cask
brew install diffutils
brew install ed --default-names
brew install file-formula
brew install findutils --with-default-names
brew install gawk
brew install git
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install gnutls
brew install grep --with-default-names
brew install gzip
brew install less
brew install python
brew install python3
brew install ngrok
brew install node
brew install rsync
brew install ruby
brew install screen
brew install unzip
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install tmux
brew install the_silver_searcher
brew install zsh
brew install vim --override-system-vi --HEAD

echo "Installing Casks..."
# brew cask install ${casksApps[@]}

echo "Installing QuickLookPlugins..."
#brew cask install ${quickLookPlugins[@]}

echo "Cleaning brew..."
brew cleanup


echo "Installing some node packages..."
npm -g install ${nodePackages[@]}

echo "Installing some Ruby Packages..."
gem install ${gemPackages[@]}
