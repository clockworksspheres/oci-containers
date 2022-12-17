# oci-containers

Collection of other very useful container repos, as well as customized tool containers

The goal for this repo is to include instructions, scripts, containers, etc., to provide build scripts of containers that consist of tools and services in containers, akin to spack, as well as the instructions, scripts, and/or containers required to provide those tools and services.

[OCI](https://dzone.com/articles/containers-landscape-seen-through-oci-and-cncf-standards-lenses) referred to in this repo is as defined by the CNCF, not Oracle's current definition.

Also houses IaC container templates for the IoTHarborAnywhere project.

## Replicating developer environments for creating containers

This section covers replicating the developer's environment for creating the containers in the cs-containers directory.  Note that these guides have useful information and faqs to solve strange issues one might face when creating either the dev environment, or the containers themselves.

 * [Ubuntu 20.04](https://github.com/clockworksspheres/oci-containers/blob/dev/README-lubuntu-host-setup-20.04.md)
 * [macOS Catalina](https://github.com/clockworksspheres/oci-containers/blob/dev/README-macos-host-setup-catalina.md)
 * [Windows 10 (update 2004, with Ubuntu 20.04 installed on WSL2)](https://github.com/clockworksspheres/oci-containers/blob/dev/README-windows10-host-setup.md)

## Container best practices

### Docker best practices:

https://www.datree.io/resources/docker-best-practices

https://dev.to/azure/improve-your-dockerfile-best-practices-5ll

https://pythonspeed.com/articles/official-docker-best-practices/

https://engineering.bitnami.com/articles/best-practices-writing-a-dockerfile.html

https://snyk.io/blog/10-docker-image-security-best-practices/

https://blog.jgriffiths.org/learning-docker-image-layers-and-cache-best-practices/

https://www.docker.com/blog/intro-guide-to-dockerfile-best-practices/

https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

https://medium.com/@BeNitinAgarwal/best-practices-for-working-with-dockerfiles-fb2d22b78186



### Container best practices:

https://cloud.google.com/solutions/best-practices-for-building-containers


### Project for inspecting and cleaning containers:

https://github.com/wagoodman/dive


## Tools that can be used to build, maintain and manage containers on a host system
#podman #skopeo #singularity #apptainer #kubernetes #kubectl #nerdctl #lima 
#qemu #utm #virtualbox #parallels #fusion #packer #vagrant #terraform
#vault #hcp #consul #nomad #openstack #openshift #waypoint #boundary
#hashicorp #oracleCloud #amazonCloud #googleCloud #asureCloud #ansible
#puppet #CFEngine #vmware #vsphere #esxi #docker #pod #ortellius 

# References:

## Definitions

http://web.archive.org/web/20150811192521/https://opencontainers.org/ - which Oracle publically supported - 2015 08 11.
https://dzone.com/articles/containers-landscape-seen-through-oci-and-cncf-standards-lenses


# Testing the setup

This set of tests should be run for each OS/OS Version that is included in the repository.



## Smoke test commands and services

Just run the service or command to make sure it runs without errors.

Often the host OS needs to be configured, or the command/service allowed in the firewall or service stack of an OS, before the command or service is allowed to run with appropriate permissions and access in the host operating system.

### Services

#### Docker

#### Kubernetes

#### Openstack

#### Openshift

#### Singularity

### Apps to run Virtual Machines

* UTM
* VMware Fusion
* Parallels
* Oracle Virtualbox
* QEMU
* lima

### Commands

#### containerd

* nerdctl
* 

#### Redhat

* skopeo
* podman

#### Hashicorp

* packer
* vagrant
* terraform

#### Pulumi

*
*
