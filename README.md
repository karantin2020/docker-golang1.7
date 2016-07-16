## golang1.7 Dockerfile


This repository contains **Dockerfile** of [Golang1.7](http://www.golang.org/) for [Docker](https://www.docker.com/)'s [automated build](https://hub.docker.com/r/node3030/golang1.7/) published to the public [Docker Hub](https://hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/node3030/golang1.7) from public [Docker Hub](https://hub.docker.com/): `docker pull node3030/golang1.7`

   (alternatively, you can build an image from Dockerfile: `docker build -t="node3030/golang1.7" github.com/karantin2020/docker-golang1.7`)


### Usage

    `sudo docker run node3030/golang1.7 /bin/bash`

### Build go path

    `sudo docker run --rm -v "$GOPATH/src":/go/src -v "$PWD":/go/build -w /go/build node3030/golang1.7 go build -ldflags="-s -w" -v -o ${PWD##*/}`
