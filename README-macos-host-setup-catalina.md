# Setting up a macOS for using Docker containers, plus some other useful tools


xcode-select --install

#####
# install homebrew
# https://brew.sh/

brew cask install xquartz

brew install socat

brew install docker

#####
# dbus required for some Qt based apps that might be used in docker containers
brew install dbus

mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/dbus/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
#####

#####
# host bash environment should include the following:
# Following fixes title bar problem between docker and X11
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
/opt/X11/bin/xhost +${IP}
# NOTE: it appears to work with the IP set to 127.0.0.1 as well, needs further testing..
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

https://gist.github.com/vfdev-5/b7685371071036cb739f23b3794b5b83


#####
# useful for managing docker docks:
https://github.com/whalebrew/whalebrew

