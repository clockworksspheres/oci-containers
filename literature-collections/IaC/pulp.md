# Pulp is the engine behind the RedHat Satellite Server management

## Background

Package and repo streams can be set up to provide different environments like dev - test - prod, and control promotions and rollbacks between configured environments.

Pulp 3 provides crutial newer features that won't be released into the new Satellite server until at least spring 2022.

A couple of those features and updates include:
* updated and new plugins
* generic 'File' repo management

## What's the target?

State mangement - Every service, tool stack, app and compute need can be treated as a Phoenix.  

### Pets vs. Cattle

### The Phoenix

### Managing Phoenix flocks

 [Starling Murmuration](https://phys.org/news/2019-02-starling-murmurations-science-nature-greatest.html), 


## Pulp source code repos critical to the State Management project

| Date of last mod | repo | description |
|-----|-----|-----|
| Feb 24 2020 | https://github.com/pulp/pulp-oci-images | Containerfiles and other assets for building Pulp 3 OCI images
 |
| July 18, 2018 | https://github.com/tchellomello/pulp3-docker/tree/master/pulp-base | Extremely valuable for historical reference: Pulp3 Docker |
| April 2, 2021 | https://github.com/pulp/pulp_file | A Pulp plugin that manages File content, e.g. repositories of file content.
 |
| March 23, 2021 | https://github.com/pulp/pulp-ci | This repository is the home of Pulp's CI files. – all automated through github apps. |
| March 20, 2021 | https://github.com/pulp/squeezer | This collection provides a set of ansible modules to control a https://pulpproject.org server (version 3) in a descriptive way. This is neither to be confused with https://github.com/pulp/pulp_installer to install pulp, nor https://github.com/pulp/pulp_ansible to manage ansible content in pulp.  A lot of inspiration has been drawn from https://github.com/theforeman/foreman-ansible-modules.  |
| Jan 22, 2021 | https://github.com/pulp/pulp-smash | A GPL-licensed Python library that facilitates integration testing of Pulp.
 | Feb 8, 2021 | https://github.com/pulp/pulp-openapi-generator | This repository provides a script that helps generate Python and Ruby bindings for pulpcore or any of it's plugins.  The first time the script is run, a docker container with openapi-generator-cli is downloaded. All subsequent runs will re-use the container that was downloaded on the initial run |
| Feb 23, 2021 | https://github.com/pulp/pulp-packaging | ???? Needs decent description |

## Phoenix IaC State management Architecture

## Appendix A:  References

### Academic

### Source repos

### industry literature

### Blogs
