# 2020-09-23_0730 notes started

## Analysis of four poastgres server containers on Github

  NOTE: sizes do not include the size of the database, only the size of the container.  The container does not house the database file.

  NOTE: prototyping building containers on lubuntu 20.04

  NOTE: standardizing on postgres version 12, as all repos are capable, and keeping the version of postgres static helps in comparison.

  NOTE: if using a local docker registry, one can use the command:

  docker image list

  and one can see “created time”, and the latest created is the last built, or stuck into the registry.

### Repo 1 https://github.com/docker-library/postgres

Containers are either debian or alpine based - many postgres versions supported. 

Building the container:

Check out the repository, don't go into the directory. Run the following to build the default docker container configured in the repo:

```
docker build -t dockerlib-postgres 12
docker run -e POSTGRES_PASSWORD=mysecretpassword -d dockerlib-postgres
```

-t will tag the container in the local registry with the docker-mariadb name.


  #### Data on pulled/built protype container

  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | Container size in registry: | 314Mb | |
  | postgres version: | 12.??  | supports multiple mariadb versions - server only, no actual data in the database |
  | OS version, container is based on: | Alpine | |


# Repo 2 https://github.com/sclorg/postgresql-container


# Repo 2 https://github.com/CentOS/CentOS-Dockerfiles.git

Download the git repostitory, and cd into the postgres/centos7 directory.

Dockerfile to build PostgreSQL on CentOS 7

## Setup
-----

To build the image

    # docker build --rm -t <yourname>/postgresql .


## Launching PostgreSQL
--------------------

#### Quick Start (not recommended for production use)

    docker run --name=postgresql -d -p 5432:5432 <yourname>/postgresql


To connect to the container as the administrative `postgres` user:

    docker run -it --rm --volumes-from=postgresql <yourname>/postgres sudo -u
    postgres -H psql


## Creating a database at launch
-----------------------------

You can create a postgresql superuser at launch by specifying `POSTGRESQL_USER` and
`POSTGRESQL_PASSWORD` variables. You may also create a database by using `POSTGRESQL_DATABASE`.

    docker run --name postgresql -d \
    -e 'POSTGRESQL_USER=username' \
    -e 'POSTGRESQL_PASSWORD=ridiculously-complex_password1' \
    -e 'POSTGRESQL_DATABASE=my_database' \
    <yourname>/postgresql

To connect to your database with your newly created user:

    psql -U username -h $(docker inspect --format {{.NetworkSettings.IPAddress}} postgresql)

  #### Data on pulled/built protype container

  | What | Data | note/comment/explanation |
  | ---- | ---- | ------------------------ |
  | Container size in registry: | 333Mb | |
  | postgres version: | 9.2.7  | Only the server, no actual data in the database.|
  | OS version, container is based on: | CentOS 7 | |



References:

https://www.optimadata.nl/blogs/1/2qg3p5-how-to-run-postgres-on-docker-part-2

https://www.javacodegeeks.com/2020/03/docker-compose-for-spring-boot-application-with-postgresql.html

https://github.com/testcontainers/testcontainers-java
