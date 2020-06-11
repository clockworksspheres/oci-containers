# Setting up macOS for using Docker containers, plus some other useful tools


xcode-select --install

#####
# install homebrew
# https://brew.sh/


brew cask install xquartz

brew install socat

brew install docker

brew install dbus
# dbus required for some Qt based apps that might be used in docker containers

mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/dbus/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#####

#####
# useful but not necessarily required:

brew install autoconf automake libtool autoconf-archive gettext check pkg-config luajit
brew install libjpeg freetype fribidi fontconfig giflib libtiff glib dbus libsndfile bullet

###
# to make gettext available, add the following to your $PATH
export PATH="$(brew --prefix gettext)/bin:$PATH"

#####
# Install the editor sublime-text - a popular 3rd party editor used by many developers
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew cask install sublime-text

#####
# Install iterm2 - a popular 3rd party terminal used by many developers
brew cask install iterm2

References:

https://phab.enlightenment.org/w/osx/

https://kde.inoki.cc/2019/07/24/DBus/


#####
# useful for managing docker docks:
https://github.com/whalebrew/whalebrew

