# Setting up a macOS Ventura for using Docker containers, plus some other useful tools


## Setting up package management
#packagemanagement

### Make sure the xcode command line development tools are available
#xcode #xcode-select

```
xcode-select --install
```

### Install homebrew
#homebrew

Instructions can be found at https://brew.sh/

## Installing required software
#xquartz #socat #docker #dbus

Software needed to be able to use obsidian, drawio, vym, cherrytree,  etc...

First, install useful "tap's":

```
brew tap homebrew/brew-cask
brew tap homebrew/cask-versions
```

Before one can work with containers in this repo (includes getting X installed and working):
```
brew cask install xquartz
brew install socat
brew install docker
#####
# dbus required for some Qt based apps that might be used in docker containers
brew install dbus
```

### Setting up dbus
#settingupdbus

```
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/dbus/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/org.freedesktop.dbus-session.plist
```

### Host bash environment should include the following:
#bash #xhost #bash

 1. Following fixes title bar problem between docker and X11
#localahost #127.0.0.1

```
export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
/opt/X11/bin/xhost +${IP}

## host bash environment should include the following:
## Following fixes title bar problem between docker and X11
    export IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
    export DISPLAY=$(${IP}:0)
    /opt/X11/bin/xhost +${IP}
## NOTE: it appears to work with the IP set to 127.0.0.1 as well, needs further testing..

```

2. Useful tools, required amid the churn of trying to make things work... Some may no longer be requried, or may be installed as a dependency of other packages.

```
brew install autoconf automake libtool autoconf-archive gettext check pkg-config luajit
brew install libjpeg freetype fribidi fontconfig giflib libtiff glib dbus libsndfile bullet
```

Editor sublime-text & vscode - popular editors used by many developers, if not already installed:

```
brew cask install sublime-text visual-studio-code

```

iTerm2 - popular 3rd party terminal used by many developers

```
brew cask install iterm2
```

3.  To make gettext available, add the following to your $PATH

```
export PATH="$(brew --prefix gettext)/bin:$PATH"
```


## Tools to build and manage containers
#podman #skopeo #singularity #apptainer #kubernetes #kubectl #nerdctl #lima #qemu #utm #virtualbox #parallels #fusion #packer #vagrant #terraform #vault #hcp #consul  #nomad #openstack #openshift #waypoint #boundary #hashicorp #oracleCloud #amazonCloud #googleCloud #asureCloud #ansible #puppet #CFEngine #vmware #vsphere #esxi #docker #pod #ortellius 

install podman and skopeo (rhedhat oci mangement tools)

```
brew install podman
brew install skopeo
```

### To copy an image from docker to local docker repo (once it's set up)

```
skopeo copy --dest-tls-verify=false docker-daemon:docker.io/centos:7 docker://localhost:5000/centos:7
```

# References:

https://phab.enlightenment.org/w/osx/

https://kde.inoki.cc/2019/07/24/DBus/

https://gist.github.com/vfdev-5/b7685371071036cb739f23b3794b5b83

## useful for managing docker docks:

https://github.com/whalebrew/whalebrew

