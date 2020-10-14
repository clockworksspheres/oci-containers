# CI/CD plans for clockworksspheres

Need to set up CI/CD for clockworksspheres CI/CD for building layered system of containers - for getting ‘OS updates' at regular intervals

## Basic run of CI/CD to perform 'OS updates'

Iterate over data structure/list/dictionary that contains dependancy trees of containers and build in correct dependent order.

Need to be able to easily configure for containers specific to a project, or the entire IaC structure

### List, simpler to more complex, better data, better testing, etc...

• cron to run list of jobs in serial order, with fs sync's in between jobs to ensure containers are fully written to disk, and available through the registry service before building the next container that depends on the current one.

• Jenkins mirror of the above

• gocd mirror of the above

• jenkins tree traversal, on branching, spawn a new job for n+1 branches while continuing down the n'th branch.

• gocd mirror of the above.


## suggested CI/CD type testing one might consider:

* successful container builds

* successfull container run (smoke test)

* once running, test links between containers (network)

* once running, test basic fs connections

* once running, test interaction between containers/container stack/sub-containers (container stack)

* once running, test security envelope of container stack


