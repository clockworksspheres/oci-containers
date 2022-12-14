# Scratch Notes

- kernel space based containers
	- software needs to be pre-installed into kernel space for things to work
- user space based containers
	- May not need software pre-installed to run containers/container environments
		- podman?
		- singularity?
		- can these containers be used to mount host file systems to install software on or set up configurations on host system?
		- What installs/configurations could or would not work in this manner?
			- Ansible
				- 
			- Container Tools/Framework
				- Redhat based tools
					- podmain, skopeo
				- Hashicorp
					- packer
					- vagrant
					- consul
					- vault
					- terreform
					* etc
				- Kubernetes
					- kubectl
					- k8s
				- Ortellius
				- Pulumi
				- Containerd
					- nerdctl
					- hashicorp (packer, vagrant, consul, terrraform, vault, etc..)
					- pulumi (libraries mostly, cmdline tools too??)
					- containerd like/reliant - nerdctl
			- What is the absolute minimum required for using different frameworks - 
				- private cloud
					- docker
					- podman
					- singularity
				- public cloud
					- Amazon
					- Google
					- Microsoft
					- Oracle
					- Small Guys
						- Digital Ocean


provisioning contaienrs??
* binary has to be readable and executable by the OS
* container filesystem has to be shared/understood by the host OS
* Installers
	* have package management tools on container
	* have package managent tools already on host
	* 