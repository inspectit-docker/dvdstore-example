[![](https://badge.imagelayers.io/inspectit/dvdstore:latest.svg)](https://imagelayers.io/?images=inspectit/dvdstore:latest 'Get your own badge on imagelayers.io')

# inspectIT-dvdstore-example
DVDStore example with inspectIT based on docker

This docker image is based on the official JBoss docker image including the inspectIT agent of the open source APM solution [www.inspectit.rocks](http://www.inspectit.rocks). As an example, the pre configured DVDStore Application is deployed.

## Quickstart
If you have [Docker Compose](https://docs.docker.com/compose/) installed on your linux system, just use our [docker-compose.yml](https://raw.githubusercontent.com/inspectIT/docker-inspectIT-dvdstore-example/master/docker-compose.yml) to start the whole stack. Otherwise follow these steps:

First you need a running inspectIT CMR. You can use our [docker image](https://github.com/inspectIT/docker-CMR):

```bash
$ docker run -d --name inspectIT-CMR -p 8182:8182 -p 9070:9070 inspectit/cmr:1.6.9.83
```

Now you can start a container with the following command:

```bash
$ docker run -d --name inspectIT-dvdstore -h dvdstore -p 8080:8080 --link inspectIT-CMR:cmr inspectit/dvdstore
```

After this, check if you can connect to the application via a browser (http://127.0.0.1:8080/dvdstore)

## Connect with inspectIT UI (Client)
Download the inspectIT Client from [www.inspectit.rocks](http://www.inspectit.rocks)
The client will start with a pre defined "Local CMR" - IP: 127.0.0.1:8182
Now you should the see a registered Local CMR and a connected agent. The name of the agent is equal to the container-id in docker.

![inspectIT Client](https://github.com/inspectIT/inspectIT-dvdstore-example/blob/master/inspectIT.png)
