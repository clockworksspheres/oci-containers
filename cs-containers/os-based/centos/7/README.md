# Structure of builds

## Intro

Docker containers use layered filesystems and each container layer is stored only once in a docker registry.  Shared libraries only get stored once.  Careful planning of layer construction and re-use can lead to having a nicely compact registry.  Accessing and building app and product stacks almost makes this project like a set of recipies that can be accessed to build a registry similar to how a package manager works.

The reason for using docker to build a reference registry, is that other container structures may or may not use filesystem layers, leading to unnecessarily bloated bloated registries, due to every container having only one filesystem, instead of filesystem layers.

Once the docker registry is created and populated, that can be used as a reference to build app stack containers, then each of the built containers can then be converted to other container formats that may or may not have layered filesystems.

## Scope

* Currenly only building Docker containers
* All branches here are CentOS 7 based
* Directory tree broken down into logical layers, which can be shared between app stacks, somewhat like dependancies managed by package managers.

## Purpose

The purpose of building a package-manager like project for creating a registry, lends itself well for the [IoTHarborAnywhere]() project, where one might want to build a self contained registry for a reference, to be placed on an embedded platform to be deployed in a location where no external either no network is available, network might be flakey, or a location where using only self contained dependancies is required.

## Process Description, Flow, Documentation

### Description

While the process of creating containers, layers and app stacks is currently manual, the project is thinking about ways to create a flexible package management like framework.  One potential way to do this is create a dependancy management system, that uses a makefile like engine.

I am aware that there are algorithms and possibly frameworks that people have built for generic dependancy management, as I find them, I'll create a bulleted list, possibly with a one sentance description and link to more info.

* .
* ..
* ...

### Flow

For now, the first step will be to create a makefile that will manually build the tree in an order that will hopefully start with the smallest contaner (base) and start logically building more layers based on app stack depencancy trees, untill all the app stacks are built.  A makefile to build the whole tree here.

### Documentation


## Notes

## Gotchas

## Frequently Asked Questions (FAQ)

## References, inside and out

### References to other relevant sections of the project

### Outside References

# Collaborative comments, w/author & date

