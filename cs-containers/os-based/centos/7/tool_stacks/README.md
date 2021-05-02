# Container usage

## Running the container - dropping to a shell to mod the conatiner prior to re-saving it in a registry, or saving a tarfile

```
docker run -t -i localhost:5000/fredgears:centos7-ramdisk-tool-stack
```

Running docker, mounting the current directory as a working directory in /home/project

```
docker run -it -v `pwd`:/home/project localhost:5000/fredgears:centos7-ramdisk-tool-stack
```

### Reference for bringing up a shell ( using -i for interactive )

Docker forum: [Run container but exited immediately](https://forums.docker.com/t/run-container-but-exited-immediately/18811)

### todo:

* document an equivalent podman command
* document bringing up the container & getting the shell with vagrant



