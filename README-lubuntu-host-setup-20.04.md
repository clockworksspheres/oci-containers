2020-09-09_1205
#####
#Setting up Docker
# https://docs.docker.com/engine/install/ubuntu/
#
# 
Install Docker Engine on Ubuntu
Estimated reading time: 11 minutes

To get started with Docker Engine on Ubuntu, make sure you meet the prerequisites, then install Docker.
Prerequisites
OS requirements

To install Docker Engine, you need the 64-bit version of one of these Ubuntu versions:

    Ubuntu Focal 20.04 (LTS)
    Ubuntu Bionic 18.04 (LTS)
    Ubuntu Xenial 16.04 (LTS)

Docker Engine is supported on x86_64 (or amd64), armhf, and arm64 architectures.
Uninstall old versions

Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them:

$ sudo apt-get remove docker docker-engine docker.io containerd runc

It’s OK if apt-get reports that none of these packages are installed.

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker Engine package is now called docker-ce.
Supported storage drivers

Docker Engine on Ubuntu supports overlay2, aufs and btrfs storage drivers.

Docker Engine uses the overlay2 storage driver by default. If you need to use aufs instead, you need to configure it manually. See use the AUFS storage driver
Installation methods

You can install Docker Engine in different ways, depending on your needs:

    Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

    Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

    In testing and development environments, some users choose to use automated convenience scripts to install Docker.

Install using the repository

Before you install Docker Engine for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.
Set up the repository

    Update the apt package index and install packages to allow apt to use a repository over HTTPS:

    $ sudo apt-get update

    $ sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    Add Docker’s official GPG key:

    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

    $ sudo apt-key fingerprint 0EBFCD88

    pub   rsa4096 2017-02-22 [SCEA]
          9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
    uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
    sub   rsa4096 2017-02-22 [S]

    Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

        Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Tessa, you could use bionic. Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.

        x86_64 / amd64
        armhf
        arm64

    $ sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

Install Docker Engine

    Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version:

     $ sudo apt-get update
     $ sudo apt-get install docker-ce docker-ce-cli containerd.io

        Got multiple Docker repositories?

        If you have multiple Docker repositories enabled, installing or updating without specifying a version in the apt-get install or apt-get update command always installs the highest possible version, which may not be appropriate for your stability needs.

    To install a specific version of Docker Engine, list the available versions in the repo, then select and install:

    a. List the versions available in your repo:

    $ apt-cache madison docker-ce

      docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
      docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
      docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
      docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
      ...

    b. Install a specific version using the version string from the second column, for example, 5:18.09.1~3-0~ubuntu-xenial.

    $ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io

    Verify that Docker Engine is installed correctly by running the hello-world image.

    $ sudo docker run hello-world

    This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker Engine is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Linux postinstall to allow non-privileged users to run Docker commands and for other optional configuration steps.
Upgrade Docker Engine

To upgrade Docker Engine, first run sudo apt-get update, then follow the installation instructions, choosing the new version you want to install.
Install from a package

If you cannot use Docker’s repository to install Docker Engine, you can download the .deb file for your release and install it manually. You need to download a new file each time you want to upgrade Docker.

    Go to https://download.docker.com/linux/ubuntu/dists/, choose your Ubuntu version, then browse to pool/stable/, choose amd64, armhf, or arm64, and download the .deb file for the Docker Engine version you want to install.

        Note: To install a nightly or test (pre-release) package, change the word stable in the above URL to nightly or test. Learn about nightly and test channels.

    Install Docker Engine, changing the path below to the path where you downloaded the Docker package.

    $ sudo dpkg -i /path/to/package.deb

    The Docker daemon starts automatically.

    Verify that Docker Engine is installed correctly by running the hello-world image.

    $ sudo docker run hello-world

    This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker Engine is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Post-installation steps for Linux to allow non-privileged users to run Docker commands and for other optional configuration steps.
Upgrade Docker Engine

To upgrade Docker Engine, download the newer package file and repeat the installation procedure, pointing to the new file.
Install using the convenience script

Docker provides convenience scripts at get.docker.com and test.docker.com for installing edge and testing versions of Docker Engine - Community into development environments quickly and non-interactively. The source code for the scripts is in the docker-install repository. Using these scripts is not recommended for production environments, and you should understand the potential risks before you use them:

    The scripts require root or sudo privileges to run. Therefore, you should carefully examine and audit the scripts before running them.
    The scripts attempt to detect your Linux distribution and version and configure your package management system for you. In addition, the scripts do not allow you to customize any installation parameters. This may lead to an unsupported configuration, either from Docker’s point of view or from your own organization’s guidelines and standards.
    The scripts install all dependencies and recommendations of the package manager without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
    The script does not provide options to specify which version of Docker to install, and installs the latest version that is released in the “edge” channel.
    Do not use the convenience script if Docker has already been installed on the host machine using another mechanism.

This example uses the script at get.docker.com to install the latest release of Docker Engine - Community on Linux. To install the latest testing version, use test.docker.com instead. In each of the commands below, replace each occurrence of get with test.

    Warning:

    Always examine scripts downloaded from the internet before running them locally.

$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

<output truncated>

If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:

  sudo usermod -aG docker your-user

Remember to log out and back in for this to take effect!

    Warning:

    Adding a user to the “docker” group grants them the ability to run containers which can be used to obtain root privileges on the Docker host. Refer to Docker Daemon Attack Surface for more information.

Docker Engine - Community is installed. It starts automatically on DEB-based distributions. On RPM-based distributions, you need to start it manually using the appropriate systemctl or service command. As the message indicates, non-root users can’t run Docker commands by default.

    Note:

    To install Docker without root privileges, see Run the Docker daemon as a non-root user (Rootless mode).

    Rootless mode is currently available as an experimental feature.

Upgrade Docker after using the convenience script

If you installed Docker using the convenience script, you should upgrade Docker using your package manager directly. There is no advantage to re-running the convenience script, and it can cause issues if it attempts to re-add repositories which have already been added to the host machine.
Uninstall Docker Engine

    Uninstall the Docker Engine, CLI, and Containerd packages:

    $ sudo apt-get purge docker-ce docker-ce-cli containerd.io

    Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

    $ sudo rm -rf /var/lib/docker

You must delete any edited configuration files manually.
Next steps

    Continue to Post-installation steps for Linux.
    Review the topics in Develop with Docker to learn how to build new applications using Docker.

requirements, apt, installation, ubuntu, install, uninstall, upgrade, update


#####

#####
# Install the Docker Registry
#
# https://docs.docker.com/registry/

Docker Registry
Estimated reading time: 1 minute

    This page contains information about hosting your own registry using the open source Docker Registry. For information about Docker Hub, which offers a hosted registry with additional features such as teams, organizations, web hooks, automated builds, etc, see Docker Hub.

What it is

The Registry is a stateless, highly scalable server side application that stores and lets you distribute Docker images. The Registry is open-source, under the permissive Apache license.
Why use it

You should use the Registry if you want to:

    tightly control where your images are being stored
    fully own your images distribution pipeline
    integrate image storage and distribution tightly into your in-house development workflow

Alternatives

Users looking for a zero maintenance, ready-to-go solution are encouraged to head-over to the Docker Hub, which provides a free-to-use, hosted Registry, plus additional features (organization accounts, automated builds, and more).
Requirements

The Registry is compatible with Docker engine version 1.6.0 or higher.
Basic commands

Start your registry

docker run -d -p 5000:5000 --name registry registry:2

Pull (or build) some image from the hub

docker pull ubuntu

Tag the image so that it points to your registry

docker image tag ubuntu localhost:5000/myfirstimage

Push it

docker push localhost:5000/myfirstimage

Pull it back

docker pull localhost:5000/myfirstimage

Now stop your registry and remove all data

docker container stop registry && docker container rm -v registry

Next

You should now read the detailed introduction about the registry, or jump directly to deployment instructions.
registry, on-prem, images, tags, repository, distribution

#####

#####
# Install Skopeo, Podman and Buildah
#
# DO NOT use instructions on the internet to install the projectatomic PPA.
#
# https://www.answertopia.com/ubuntu/working-with-containers-on-ubuntu/
#

Working with Containers on Ubuntu 20.04

Now that the basics of Linux Containers have been covered in the previous chapter, this chapter will demonstrate how to create and manage containers using the Podman, Skopeo and Buildah tools on Ubuntu. It is intended that by the end of this chapter you will have a clearer understanding of how to create and manage containers on Ubuntu and will have gained a knowledge foundation on which to continue exploring the power of Linux Containers.
1.1   Installing the Container Tools

Before starting with containers, the first step is to install all of the container tools outlined in the previous chapter using the following commands:

# apt install curl

# . /etc/os-release

# sh -c "echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"

# curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -

# apt update

# apt install podman skopeo buildah

1.2  Pulling a Container Image

For this example, the most recent Ubuntu release will be pulled from the registry. Before pulling an image, however, information about the image repository can be obtained using the skopeo tool, for example:

$ skopeo inspect docker://docker.io/ubuntu

{

    "Name": "docker.io/library/ubuntu",

    "Digest": "sha256:bec5a2727be7fff3d308193cfde3491f8fba1a2ba392b7546b43a051853a341d",

    "RepoTags": [

        "10.04",

        "12.04.5",

        "12.04",

        "12.10",

        "13.04",

        "13.10",

        "14.04.1",

        "14.04.2",

        "14.04.3",

        "14.04.4",

        "14.04.5",

        "14.04",

        "14.10",

        "15.04",

.

.

    ],

    "Created": "2020-03-20T19:20:22.835345724Z",

    "DockerVersion": "18.09.7",

    "Labels": null,

    "Architecture": "amd64",

    "Os": "linux",

    "Layers": [

        "sha256:5bed26d33875e6da1d9ff9a1054c5fef3bbeb22ee979e2acf72528de007b",

        "sha256:f11b29a9c7306674a9479158c1b4259938af11b979ac02030cc1095e9ed1",

        "sha256:930bda195c84cf132344bf38edcad255317380503fef234a9ce3bff0f4dd",

        "sha256:78bf9a5ad49e4ae42a83f4995ade4efc08fd38299cf05bc041e8cdda2a36"

    ],

    "Env": 

        "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

    ]

}

For example, to pull the latest Ubuntu image:

$ podman pull docker://docker.io/ubuntu:latest

Trying to pull docker://docker.io/ubuntu:latest...

Getting image source signatures

Copying blob 5bed26d33875 done

Copying blob f11b29a9c730 done

Copying blob 78bf9a5ad49e done

Copying blob 930bda195c84 done

Copying config 4e5021d210 done

Writing manifest to image destination

Storing signatures

4e5021d210f65ebe915670c7089120120bc0a303b90208592851708c1b8c04bd

Verify that the image has been stored by asking podman to list all local images:

$ podman images

REPOSITORY                 TAG      IMAGE ID       CREATED       SIZE

docker.io/library/ubuntu   latest   4e5021d210f6   3 weeks ago   66.6 MB

Details about a local image may be obtained by running the podman inspect command:

$ podman inspect ubuntu:latest

This command should output the same information as the skopeo command performed on the remote image earlier in this chapter.
1.3  Running the Image in a Container

The image pulled from the registry is a fully operational image that is ready to run in a container without modification. To run the image, use the podman run command. In this case the –rm option will be specified to indicate that we want to run the image in a container, execute one command and then have the container exit. In this case, the cat tool will be used to output the content of the /etc/passwd file located on the container root filesystem:

$ podman run --rm ubuntu:latest cat /etc/passwd

root:x:0:0:root:/root:/bin/bash

daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin

bin:x:2:2:bin:/bin:/usr/sbin/nologin

sys:x:3:3:sys:/dev:/usr/sbin/nologin

sync:x:4:65534:sync:/bin:/bin/sync

games:x:5:60:games:/usr/games:/usr/sbin/nologin

man:x:6:12:man:/var/cache/man:/usr/sbin/nologin

lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin

mail:x:8:8:mail:/var/mail:/usr/sbin/nologin

news:x:9:9:news:/var/spool/news:/usr/sbin/nologin

uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin

proxy:x:13:13:proxy:/bin:/usr/sbin/nologin

www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin

backup:x:34:34:backup:/var/backups:/usr/sbin/nologin

list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin

irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin

gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin

nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin

_apt:x:100:65534::/nonexistent:/usr/sbin/nologin

Compare the content of the /etc/passwd file within the container with the /etc/passwd file on the host system and note that it lacks all of the additional users that are present on the host confirming that the cat command was executed within the container environment. Also note that the container started, ran the command and exited all within a matter of seconds. Compare this to the amount of time it takes to start a full operating system, perform a task and shutdown a virtual machine and you begin to appreciate the speed and efficiency of containers.

To launch a container, keep it running and access the shell, the following command can be used:

$ podman run --name=mycontainer -it ubuntu:latest /bin/bash

root@4b49ddeb2987:/#

In this case, an additional command-line option has been used to assign the name “mycontainer” to the container. Though optional, this makes the container easier to recognize and reference as an alternative to using the automatically generated container ID.

While the container is running, run podman in a different terminal window to see the status of all containers on the system:

$ podman ps -a

CONTAINER ID  IMAGE                            COMMAND    CREATED             STATUS                 PORTS  NAMES

4b49ddeb2987  docker.io/library/ubuntu:latest  /bin/bash  About a minute ago  Up About a minute ago         mycontainer

To execute a command in a running container from the host, simply use the podman exec command, referencing the name of the running container and the command to be executed. The following command, for example, starts up a second bash session in the container named mycontainer:

$ podman exec -it mycontainer /bin/bash

root@4b49ddeb2987:/#

Note that though the above example referenced the container name the same result can be achieved using the container ID as listed by the podman ps -a command:

$ podman exec -it 4b49ddeb2987 /bin/bash

root@4b49ddeb2987:/#

Alternatively, the podman attach command will also attach to a running container and access the shell prompt:

$ podman attach mycontainer

root@4b49ddeb2987:/#

Once the container is up and running, any additional configuration changes can be made and packages installed just like any other Ubuntu system.
1.4  Managing a Container

Once launched, a container will continue to run until it is stopped via podman, or the command that was launched when the container was run exits. Running the following command on the host, for example, will cause the container to exit:

$ podman stop mycontainer

Alternatively, pressing the Ctrl-D keyboard sequence within the last remaining bash shell of the container would cause both the shell and container to exit. Once it has exited, the status of the container will change accordingly:

$ podman ps -a

CONTAINER ID  IMAGE                            COMMAND    CREATED        STATUS                           PORTS  NAMES

4b49ddeb2987  docker.io/library/ubuntu:latest  /bin/bash  6 minutes ago  Exited (127) About a minute ago         mycontainer

Although the container is no longer running, it still exists and contains all of the changes that were made to the configuration and file system. If you installed packages, made configuration changes or added files, these changes will persist within “mycontainer”. To verify this, simply restart the container as follows:

$ podman start mycontainer

After starting the container, use the podman exec command once again to execute commands within the container as outlined previously. For example, to once again gain access to a shell prompt:

$ podman exec -it mycontainer /bin/bash

A running container may also be paused and resumed using the podman pause and unpause commands as follows:

$ podman pause mycontainer

$ podman unpause mycontainer

1.5  Saving a Container to an Image

Once the container guest system is configured to your requirements there is a good chance that you will want to create and run more than one container of this particular type. To do this, the container needs to be saved as an image to local storage so that it can be used as the basis for additional container instances. This is achieved using the podman commit command combined with the name or ID of the container and the name by which the image will be stored, for example:

$ podman commit mycontainer > myubuntu_image

Once the image has been saved, check that it now appears in the list of images in the local repository:

$ podman images

REPOSITORY                 TAG      IMAGE ID       CREATED              SIZE

localhost/myubuntu_image   latest   8ad685d49482   47 seconds ago       66.6 MB

docker.io/library/ubuntu   latest   4e5021d210f6   3 weeks ago          66.6 MB

The saved image can now be used to create additional containers identical to the original:

$ podman run --name=mycontainer2 -it localhost/myubuntu_image /bin/bash

1.6  Removing an Image from Local Storage

To remove an image from local storage once it is no longer needed, simply run the podman rmi command, referencing either the image name or ID as output by the podman images command. For example, to remove the image named myubuntu_image created in the previous section, run podman as follows:

$ podman rmi localhost/myubuntu_image

Note before an image can be removed, any containers based on that image must first be removed.
1.7  Removing Containers

Even when a container has exited or been stopped, it still exists and can be restarted at any time. If a container is no longer needed, it can be deleted using the podman rm command as follows after the container has been stopped:

# podman rm mycontainer2

1.8  Building a Container with Buildah

Buildah allows new containers to be built either from existing containers, an image or entirely from scratch. Buildah also includes the ability to mount the file system of a container so that it can be accessed and modified from the host.

The following buildah command, for example, will build a container from the Ubuntu Base image (if the image has not already been pulled from the registry, buildah will download it before creating the container):

$ buildah from docker://docker.io/library/ubuntu:latest

The result of running this command will be a container named ubuntu-working-container that is ready to run:

$ buildah run ubuntu-working-container cat /etc/passwd

1.9  Summary

This chapter has worked through the creation and management of Linux Containers on Ubuntu using the podman, skopeo and buildah tools.

#####

#####
#
# https://stackoverflow.com/questions/52698748/connection-refused-on-pushing-a-docker-image
#
# 

#####
#
# Running the cs-containers

docker run -it -e XDG_RUNTIME_DIR=/tmp  -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/machine-id:/etc/machine-id:ro -e DISPLAY=${DISPLAY}  localhost:5000/fredgears:vym-xfce

# NOTE:
#
### setting the container's environment
#
# -e DISPLAY=${DISPLAY}
# set the dock environment to the host's display
#
# -e XDG_RUNTIME_DIR=/tmp
#
# -e QT_X11_NO_MITSHM=1
#
### sharing volumes/files between host and container
# 
# -v /etc/machine-id:/etc/machine-id:ro
# share the host's dbus machine-id as the container's dbus machine-id - needed for Qt
#

###
# Docker commands:
docker load -i <tarball>  # to load an container image

<registry issues>
docker container list
docker container stop <container-id>
<start the registry again...>

#####

#####
# troubleshooting
#
# Q. Getting message: :Could not connect to an X display."
###
# A. check out these commands:
#
# Set the display variable
export DISPLAY=:0
#
# Be wary of the security remifications - but it may be useful to:
xhost +SI:localuser:root
#
# Rename the existing .Xauthority file by running the following command
mv .Xauthority old.Xauthority 
#
# xauth with complain unless ~/.Xauthority exists
touch ~/.Xauthority

# only this one key is needed for X11 over SSH 
xauth generate :0 . trusted 

# generate our own key, xauth requires 128 bit hex encoding
xauth add ${HOST}:0 . $(xxd -l 16 -p /dev/urandom)

# To view a listing of the .Xauthority file, enter the following 
xauth list 
###
#
# Q.
#
# A.
#
#####
