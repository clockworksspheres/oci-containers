# Setting up Windows 10 with WSL 2 and Docker for local development of IaC processes

## Please update Windows 10 to update version 2004 FIRST!

https://www.bleepingcomputer.com/news/microsoft/windows-10-2004-update-not-offered-heres-how-to-get-it-now/


## Make sure these settings are set in Windows before you start

Turn on windows features in “Windows Settings” -> “Apps” -> “Apps & Features” -> “Optional Features” -> “More Windows Features” and make sure both “Containers”, "Hyper-V", “Windows Hypervisor Platform” and “Windows Subsystem for Linux” checkboxes are selected.  This will likely required you to reboot the system for the features to become available.


## Install Chocolatey

https://chocolatey.org/install

Note: may be useful: https://www.bleepingcomputer.com/news/microsoft/microsoft-fixes-wsl-2-breaking-bug-in-new-windows-10-update/


## Install Terminal from the Windows App Store

```
choco install microsoft-windows-terminal
```

## Install and configure vcxsrv via chocolaty

### Installing vcxsrv

In an administrator powershell window run:

```
choco install vcxsrv
```

### Configuring vcxsrv

https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2


## Install WSL 2 via Chocolatey

* Installing WSL2 the Chocolatey way (for Windows):
https://chocolatey.org/packages/wsl2


## Install the docker-desktop Chocolatey package

* Installing Docker the Chocolatey way (for Windows - must do the docker-desktop install):
https://stefanscherer.github.io/how-to-install-docker-the-chocolatey-way/


## Install your choice of Linux from the Windows App Store - this document will reference Ubuntu 20.04


## Configure Docker to allow WSL2 OS's access to the docker service

(Docker Desktop v3 setup)

1. Open Docker Desktop

2. Select the gear (Settings) button in the title bar of the window

3. On the General tab:
    a. Make sure that the "Start Docker Desktop when you log in" and "Use the WSL 2 based engine" are turned on
    b. The other options are turned off.

4. Select the "Resources" section on the left
    a. Select the PROXIES subtab, and set your proxies if needed
    b. Select the NETWORK subtab, note the docker subnet if you have containers that need to have their network hard-coded.
    c. Select the WSL INTEGRATION subtab, select the "Enable integration with my default WSL distro, and take note that when new installs of WSL2 based OS's are done, to come back to this sub-tab - they will need to manually be enabled via the switch on this panel.

5. Select the Docker Engine tab on the left:
    a. The reported version for Docker Engine shour be at least v20.10.0
    b. Make sure the following JSON is in the window:

```
{
  "registry-mirrors": [],
  "insecure-registries": [],
  "debug": false,
  "experimental": false,
  "features": {
    "buildkit": true
  }
}
```

6. Select the Experimental Features tab on the left
    a. Make sure the "Enable CLI experimental features" is turned off
    b. Make sure the "Enable cloud experience"  is turned on.

7. Select the Kubernetes tab on the left, select the features that are needed for your project, at this time, they are all set to disabled


## Install a local docker registry

```
docker pull registry
docker images
docker run --name registry -p 5000:5000 -d registry
docker container list
docker ps
```


## Chocolatey installed apps

## Chocolatey installed apps to support general dev work

```
choco install pyenv-win
choco install grep
choco install geany
choco install pycharm-ce
# Alternative choco install pycharm
choco install packer
choco install vagrant
choco install git
choco install KeePassXC
choco install 7zip
choco install CherryTree
choco install linux-reader
```

https://chocolatey.org/packages/linux-reader


## For any software installed by chocolaty, allow it through the windows anti-virus using commands in a Administrator level Powershell:

### Examples:

```
  Add-MpPreference -ExclusionPath 'C:\HashiCorp' -Verbose   # where Vagrant is installed
  Add-MpPreference -ExclusionPath %ProgramData%\chocolatey   # where a bunch of chocolatey stuff is installed
  Add-MpPreference -ExclusionPath 'C:\tools\vim' -Verbose   # where vim is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\Git' -Verbose # where git is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\Docker'   # where Docker is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\KeePassXC'  # where keepass is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\7-Zip'  # where keepass is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\CherryTree'  # where keepass is installed
  Add-MpPreference -ExclusionPath 'C:\Program Files\draw.io'
  Add-MpPreference -ExclusionPath 'C:\Program Files\VcXsrv'
  Add-MpPreference -ExclusionPath 'C:\Program Files\umbrello'
  Add-MpPreference -ExclusionPath 'C:\Program Files\JetBrains\IntelliJ IDEA Community Edition 2021.3.2'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\BraveSoftware'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\BruteSharkDesktop'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\Geany'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\PyCharm Community Edition 2021.3.2'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\Tomboy'
  Add-MpPreference -ExclusionPath 'C:\Program Files (x86)\WinPcap'
  Add-MpPreference -ExclusionPath 'C:\Users\%USER%\.pyenv'
```

## pyenv configuration

[pyenv](https://github.com/pyenv-win/pyenv-win) is for managing python versions

### Configuration

Check out the above pyenv-win github page - the configuration instructions there are the most current.

NOTE: execution policy can get in the way of configuration and management of any script, for more about
"ExecutionPolicy", please see [this Microsoft document](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2).

At the moment, before running scripts on Windows, I'm going to run:

```
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

And when done running scripts, running:

```
Set-ExecutionPolicy -ExecutionPolicy Default -Scope CurrentUser
```

Will need to check out the registry, to see if the commands leave trash in registry each time they are run.

Once the "Bypass" setting is set, pyenv should be usable as normal.


## Ubuntu installation and configuration

### Download ubuntu terminal image

Open the Windows Store and search for Linux or Ubuntu. 
In this example we used Ubuntu 20.04 LTS. 
Select "Get" to download. Once download is complete, select "Launch". 
You now have a ubuntu terminal image running!

### Ubuntu packages to install

```
sudo apt-get clean; apt-get autoremove; sudo apt-get update && sudo apt-get upgrade
sudo apt-get install dbus-x11 xvfb x11-apps git geany vagrant packer snap htop atop net-tools wireshark tcpdump geany meld xvfb vim acl vym packer vagrant
```

### Optional: Configuring the WSL2 installed Ubuntu 20.04 to be able to use snap

```
git clone https://github.com/DamionGans/ubuntu-wsl2-systemd-script.git
cd ubuntu-wsl2-systemd-script/
bash ubuntu-wsl2-systemd-script.sh
# Enter your password and wait until the script has finished
```

Restart your ubuntu shell, and you should now be able to use snap to install software.

Reference: https://github.com/damionGans/ubuntu-wsl2-systemd-script


### Possible snap packages to install

```
snap install --classic pycharm-community
snap install --classic vscode
snap install --classic intellij-idea-community
snap install cherrytree
```


### Commands go run to set up the linux environment to interface with the docker desktop windows app

```
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
sudo systemd-machine-id-setup  # one time setup command
dbus-uuidgen --ensure=/etc/machine-id
```

### Managing the linux services to interface with the docker desktop windows app

```
sudo service dbus status # yes, this is appropriate for Ubuntu 20.04....
sudo service dbus start # yes, this is appropriate for Ubuntu 20.04....
sudo service dbus enable # yes, this is appropriate for Ubuntu 20.04....
sudo service dbus status # yes, this is appropriate for Ubuntu 20.04....
```
```
# Not sure about this command, I think it is for a specific 
#
# sudo dbus-launch --autolaunch $(cat /etc/machine-id) --binary-syntax --close-stderr
#
```

### Add the following to the ~/.bash_profile setup file (on the linux WSL2 installed OS)

```
#####
# Manage DISPLAY - for docker
# Make sure the DISPLAY is set up correctly for interface with docker desktop...
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# Docker related required environment variable
export LIBGL_ALWAYS_INDIRECT=1
#
# Adding support for the snap package manager
PATH=$PATH:/bin/snap
#
#####
```

#### optional method of maintaining bash histories - putting in the ~/.profile user section:

```
#####
# Managing bash history
[[ ! -d ~/.bash_histories ]] && mkdir --mode=0700 ~/.bash_histories
[[ -d ~/.bash_histories ]] && chmod 0700 ~/.bash_histories

# Convert /dev/nnn/X or /dev/nnnX to "nnnX"
HISTSUFFIX=`tty | sed 's/\///g;s/^dev//g'`
DATESTRING=`date +"%C%y-%m-%d"`

sync;
sync;
sync;

HISTORY_FILE="bash_history_${DATESTRING}_$HISTSUFFIX"

# if the $HISTFILE doesn't exist, touch it...
[[ ! -e ~/.bash_histories/$HISTORY_FILE ]] || touch ~/.bash_histories/$HISTORY_FILE

# History file is now .bash_history_pts0
HISTFILE="$HOME/.bash_histories/$HISTORY_FILE"
HISTTIMEFORMAT="%C%y-%m-%d_%H-%M-%S ]--> "
HISTCONTROL=ignoredups
shopt -s histappend

# then set HISTFILESIZE to a large value
HISTFILESIZE=40000
HISTSIZE=80000

PROMPT_COMMAND="history -a; history -r; $PROMPT_COMMAND"

#####
```

### Testing the docker installation with xeyes

In your linux shell, make sure to source the ~/.profile that you added the above content to:

```
. ~/.profile
```

In a scratch source directory create an xeyesDockerfile directory and add the following content into a "Dockerfile" in that directory:

```
FROM debian:latest
 
RUN apt-get update && apt-get install -y x11-apps
RUN rm -rf /tmp/* /usr/share/doc/* /usr/share/info/* /var/tmp/*
RUN useradd -ms /bin/bash user
ENV DISPLAY :0
 
USER user
ENTRYPOINT ["/bin/sh", "-c", "$0 \"$@\"", "xeyes"]
```

Then in the xeyesDockerfile directory, run the command:

(for when running the command inside the xeyesDockerfile directory)
```
docker build . -t xeyes
```

(for when running the command in the parent directory of the xeyesDockerfile directory)
```
docker build xeyesDockerfile -t xeyes
```


## FAQ

### Q. I'm having trouble with dbus and WSL-Ubuntu inside a mobaxterm window...

### A. https://www.reddit.com/r/bashonubuntuonwindows/comments/9lpc0o/ubuntu_1804_dbus_fix_instructions_with/

-----

### Q. Can I run docker inside an Ubuntu 20.04 WSL2 instance?

### A. Yes, please see this link: 

https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2

If you are having trouble getting to the link, consider looking it up in the "wayback" machine: http://web.archive.org/

-----

### Q. I borked my ubuntu install - I tried removing it and reinstalling it, but keep getting error Code: 0x80073D05... how to I get ubuntu reinstalled?

### A. Here are some links to check out:

* https://minitool.com/news/fix-windows-store-0x80073d05
* https://www.reddit.com/r/bashonubuntuonwindows/comments/ff7d75/cant_install_ubuntu_error_code_0x80073d05/
* https://github.com/microsoft/WSL/issues/4940

Turn off the "Windows Subsystem for Linux" feature in “Windows Settings” -> “Apps” -> “Apps & Features” -> “Optional Features” -> “More Windows Features”  “Windows Subsystem for Linux” checkbox.  Reboot.

Run the following commands as an admin user once the system has been rebooted:

```
wsreset
Get-AppxPackage -AllUsers -Name *Ubuntu*

Remove-AppxPackage CannonicalGroupLimited.Ubuntu20.04onWindows_(get the rest of the string from the listing provided by the previous command)

wsreset
```

Turn on the "Windows Subsystem for Linux" feature in “Windows Settings” -> “Apps” -> “Apps & Features” -> “Optional Features” -> “More Windows Features”  “Windows Subsystem for Linux” checkbox.  Reboot.


After the reboot, run the following commands in an admin powershell window:

```
wsreset
DSIM /Online /Cleanup-Image /RestoreHealth
```

-----

### Q. How do I check if I'm on WSL 1 or WSL 2?

### A. Check if you are using WSL 1 instead of WSL 2...  

Please run the following in a powershell window:

```
PS C:\Users\RKevi> wsl -l -v
  NAME                   STATE           VERSION
* Ubuntu                 Stopped         1
  docker-desktop-data    Running         2
```

If you see something like the above - with your linux in the VERSION column saying it's version 1, please make sure there is no linux instance running (close them all out if they are) and run the following:

wsl.exe --set-version Ubuntu 2

This should fix the problem.

-----

### Q. I need to access my WSL installed ubuntu home directory to fix some things.  How do I do that? 

### A. Note, unless the user shell is really messed up, please only access the linux files from linux.

How to access the WSL installed linux home directory, and why it's a bad idea (https://github.com/microsoft/WSL/issues/4328)

That's the long version - the short version - 

```
 1. Run the distribution
 2. Press Win+R 
 3. Type \\wsl$ which opens File Explorer
 4. Double click on the distribution folder.
```

---

### Q. I can't remember where in my home directory I put a dockerfile, specific to a particular container.  I ran the docker build command on that Dockerfile, or directory that contained the dockerfile.  I am using the optional bash history setup described above.

### A. Here is a find command one can use to search through all the history files, find the right history file to look in, with a line number in that file, in case you need to look at some of the commands prior to running the docker build command, or after running it.

~~~
find ${HOME} -iname "*bash_hist*" -print -exec grep -n "build" {} \;
```

-----


## Potentially Useful References:

Take note of the date of publish on the documents, as well as take what they say with a large grain of salt.. these links helped in solving past problems, not getting the current environment working.

https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2
https://github.com/microsoft/WSL/issues/4106
https://github.com/microsoft/WSL/issues/4120
https://blog.nimamoh.net/wsl2-and-vcxsrv/
https://techcommunity.microsoft.com/t5/windows-dev-appconsult/running-wsl-gui-apps-on-windows-10/ba-p/1493242
https://answers.microsoft.com/en-us/windows/forum/all/resolving-wslregisterdistribution-error-0x80370102/412cf42b-1424-444c-bb95-4aa2b5fe5eaf
https://github.com/microsoft/WSL/issues/4084
https://www.reddit.com/r/bashonubuntuonwindows/comments/bg2kgo/issues_trying_to_run_ubuntu/
https://gitmemory.com/issue/microsoft/WSL/4084/499579174
https://github.com/microsoft/WSL/issues/4709
https://www.assistanz.com/steps-to-configure-private-registry-for-docker-windows-server-2016/
https://www.techielass.com/install-windows-terminal-with-chocolatey
https://github.com/microsoft/windows-dev-box-setup-scripts/issues/30
https://techutils.in/blog/tag/windows-subsystem-for-linux/

## Interesting further reading/study:

https://www.youtube.com/watch?v=idW-an99TAM
https://livebook.manning.com/book/docker-in-practice/chapter-6/200
https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2
