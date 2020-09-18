# 2020-09-16_7:30am notes

## Analysis of four mariadb server containers on Github

  NOTE: sizes do not include the size of the database, only the size of the container.  The container does not house the database file.

  NOTE: prototyping building containers on lubuntu 20.04

  NOTE: standardizing on mariadb version 10.3, as all repos are capable, and keeping the version of mariadb static helps in comparison.

  NOTE: if using a local docker registry, one can use the command:

```
  docker image list
```

  and one can see “created time”, and the latest created is the last built, or stuck into the registry.

### Repo 1 https://github.com/linuxserver/docker-mariadb

Containers are ubuntu based - if used as reference, need to pull out amazon references.  HOWEVER - they include a Jenkinsfile in their repo.  Also a list of installed packages.  Seems much simpler than the other repos.

Building the container:

Check out the repository, don't go into the directory. Run the following to build the default docker container configured in the repo:

```
docker build -t docker-mariadb docker-mariadb
```

-t will tag the container in the local registry with the docker-mariadb name.

  #### Data on pulled/built protype container

  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | Container size in registry: | 351Mb | |
  | mariadb version: | 10.3  | supports multiple mariadb versions |
  | OS version, container is based on: | Ubuntu 18.04 | |


# Repo 2 https://github.com/sclorg/mariadb-container

Containers are RedHat family based (only goes up to mariadb 10.3)

Need to add go-md2man command to host lubuntu OS for build to work

```
sudo apt-get install -y go-md2man
```
Building the container:

Check out the repository, into the mariadb-container directory. Run the following to replicate the build with the below data table:

```
git clone --recursive https://github.com/sclorg/mariadb-container.git
cd mariadb-container
git submodule update --init
make build TARGET=centos7 VERSIONS=10.3
```

  #### Data on pulled/built protype container
  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | Container size in registry | 459Mb |  stright from repo (not converted to oci-containers format) |
  | mariadb version: | 10.3 | supports multiple mariadb versions |
  | OS version, container is based on: | Centos 7 | |

  NOTE: Needs to be stripped to minimal content - this repo is set up to maximum hybrid cloud functionality.

# Repo 3 https://github.com/docker-library/mariadb

Container is the dockerhub official supported version of the container.  Builds are ubuntu based - can do a variety of versions of ubuntu.

Building the container:

Check out the repository, don't go into the directory. Run the following to build the default docker container configured in the repo:

```
docker build -t docker-library-mariadb 10.3
```

-t will tag the container in the local registry with the docker-library-mariadb name.

  #### Data on pulled/built protype container
  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | container size in registry: | 387Mb | |
  | mariadb version:  | 10.3 |  supports multiple mariadb versions |
  | OS version, container is based on: | Ubuntu 20.04 | # supports multiple Ubuntu versions |

# Repo 4 https://github.com/mariadb-corporation/mariadb-server-docker

Containers are ubuntu based - various versions.

Building the container:

Check out the repository, don't go into the directory. Run the following to build the default docker container configured in the repo:

```
docker build -t mariadb-server-docker 10.3
```

-t will tag the container in the local registry with the mariadb-server-docker name.

  Data on pulled/built protype container
  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | Container size in registry | 345Mb |  stright from repo (not converted to oci-containers format) |
  | mariadb version: | 10.3 | supports multiple mariadb versions |
  | OS version, container is based on: | Ubuntu 18.04 | |

#####

## CONSIDERATIONS:

To really comopare sizes of containers (if it even matters) one needs to validate a tool set to check/use across OS's the container is based on.  Possibly starting with the tool set defined in the linuxserver repo.

## To write in the wiki :

Architecture of the clockworksspheres/oci-containers github registry, and why

General instruction on coversion of Dockerfiles to oci-container packer recipies

Appendix for installation of docker, one appendix for each os as needed

Discussion on container blobs in registry ie, what considerations in:
   Building  (cross arch)
   running same arch as clients
   serving multiple architectures to various types of client hardware
   running different arch as clients

Appendix for installation of docker, one appendix for each os as needed

## Appendix A: Lubuntu 20.04 docker setup notes:
https://github.com/clockworksspheres/oci-containers/blob/dev/README-lubuntu-host-setup-20.04.md

## appendix B:  macOS Catalina docker setup notes
https://github.com/clockworksspheres/oci-containers/blob/dev/README-macos-host-setup-catalina.md

## Appendix C: Sketchy Docker on Windows notes:

NOTE:  Need WSL 2 - for newest docker desktop for Windows, WSL 2 makes Docker on Windows much faster and easier to use!

Please update Windows 10 to update version 2004 FIRST!

https://docs.microsoft.com/en-us/windows/wsl/install-win10

Check if you are using WSL 1 instead of WSL 2...  Please run the following in a powershell window:

```
PS C:\Users\RKevi> wsl -l -v
  NAME                   STATE           VERSION
* Ubuntu                 Stopped         1
  docker-desktop-data    Running         2
```

If you see something like the above - with your linux in the VERSION column saying it's version 1, please make sure there is no linux instance running (close them all out if they are) and run the following:

```
wsl.exe --set-version Ubuntu 2
```

This should fix the problem.

Must come after WSL 2 setup

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04


