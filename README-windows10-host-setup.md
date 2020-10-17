# Setting up Windows 10 with WSL 2 and Docker for local development of IaC processes

## Please update Windows 10 to update version 2004 FIRST!

https://www.bleepingcomputer.com/news/microsoft/windows-10-2004-update-not-offered-heres-how-to-get-it-now/

## Need WSL 2

https://www.bleepingcomputer.com/news/microsoft/microsoft-fixes-wsl-2-breaking-bug-in-new-windows-10-update/

## Make sure these settings are set in Windows before you start

Turn on windows features in “Windows Settings” -> “Apps” -> “Apps & Features” -> “Optional Features” -> “More Windows Features” and make sure both “Containers”, "Hyper-V", “Windows Hypervisor Platform” and “Windows Subsystem for Linux” checkboxes are selected.  This will likely required you to reboot the system for the features to become available.

## Install Chocolatey

https://chocolatey.org/install


## Install WSL 2 via Chocolatey

* Installing WSL2 the Chocolatey way (for Windows):
https://chocolatey.org/packages/wsl2

## Install the docker-desktop Chocolatey package

* Installing Docker the Chocolatey way (for Windows - must do the docker-desktop install):
https://stefanscherer.github.io/how-to-install-docker-the-chocolatey-way/

## Install a local docker registry

```
docker pull registry
docker images
docker run --name registry -p 5000:5000 -d registry
docker container list
docker ps
```

## For any software installed by chocolaty, allow it through the windows anti-virus:

### Examples:

  ```
  Add-MpPreference -ExclusionPath C:\HashiCorp -Verbose   # where Vagrant is installed
  Add-MpPreference -ExclusionPath %ProgramData%\chocolatey   # where a bunch of chocolatey stuff is installed
  Add-MpPreference -ExclusionPath C:\tools\vim' -Verbose   # where vim is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files\Git' -Verbose # where git is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files\Docker'   # where Docker is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files\KeePassXC'  # where keepass is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files\7-Zip'  # where keepass is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files\CherryTree'  # where keepass is installed
  Add-MpPreference -ExclisionPath 'C:\Program Files (x86)\Geany'   # where geany is installed
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

## Make sure these settings are set in Windows before you start

Turn on windows features in “Windows Settings” -> “Apps” -> “Apps & Features” -> “Optional Features” -> “More Windows Features” and make sure both “Containers”, "Hyper-V", “Windows Hypervisor Platform” and “Windows Subsystem for Linux” checkboxes are selected.  This will likely required you to reboot the system for the features to become available.

## Potentially Useful References:

Take note of the date of publish on the documents, as well as take what they say with a large grain of salt.. these links helped in solving past problems, not getting the current environment working.

https://github.com/microsoft/WSL/issues/4120
https://answers.microsoft.com/en-us/windows/forum/all/resolving-wslregisterdistribution-error-0x80370102/412cf42b-1424-444c-bb95-4aa2b5fe5eaf
https://github.com/microsoft/WSL/issues/4084
https://www.reddit.com/r/bashonubuntuonwindows/comments/bg2kgo/issues_trying_to_run_ubuntu/
https://gitmemory.com/issue/microsoft/WSL/4084/499579174
https://github.com/microsoft/WSL/issues/4709
https://www.assistanz.com/steps-to-configure-private-registry-for-docker-windows-server-2016/

