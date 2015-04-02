# inspectIT-dvdstore-example
DVDStore example with inspectIT based on docker

This docker image is based on the official JBoss docker image including the inspectIT agent of the open source APM solution [www.inspectit.eu](http://www.inspectit.eu). As an example the DVDStore Application is deployed.

## Quickstart
First you need a running inspectIT CMR. You can use our [docker image](https://github.com/inspectIT/docker-CMR):

```bash
$ docker run -d --name inspectIT-CMR -p 8182:8182 -p 9070:9070 inspectit/cmr
```

Now you can start a container with the following command:

```bash
$ sudo docker run -d -p 8080:8080 --link inspectIT-CMR:cmr -v $(pwd)/config:/opt/agent/active-config inspectit/dvdstore
```

After this, check if you can connect to the application via a browser (http://127.0.0.1:8080/dvdstore)

## Connect with inspectIT UI (Client)
Download the inspectIT Client from [www.inspectit.eu](http://www.inspectit.eu)
The client will start with a pre defined "Local CMR" - IP: 127.0.0.1:8182
Now you should the see a registered Loacl CMR and a connected agent. The name of the agent is equals with the container-id in docker.

![inspectIT Client](https://github.com/inspectIT/inspectIT-dvdstore-example/blob/master/inspectIT.png)
