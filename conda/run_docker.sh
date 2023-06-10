#!/usr/bin/env bash

image=ubuntu:23.10

script=$1

docker run --rm -v $(pwd):$(pwd) -w $(pwd) ${image} $(pwd)/${script}
