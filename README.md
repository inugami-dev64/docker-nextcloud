# Nextcloud nginx docker build

This repository provides a custom Dockerfile to build a Nextcloud container with nginx web server. Unlike using the default [Apache AIO container](https://hub.docker.com/_/nextcloud), this nginx based container is a bit more lightweight and by default allows network requests up to 10GB in size.

## Getting started

First you should build and tag the container. By default, the included [Containerfile](./Containerfile) pulls the latest Nextcloud tarball, verifies it and extracts it to appropriate location.
```sh
$ docker build -t registry.example.com/nextcloud:latest . -f Containerfile
```

After the container building has finished, you can spin up the container using following commands:
```sh
$ docker run -p 127.0.0.1:8080:80 -v ./logs/nginx:/var/log/nginx -v ./logs/php84:/var/log/php84 -v ./app:/var/www/nextcloud registry.example.com/nextcloud:latest
```

The specified volumes are following:
- `/var/www/nextcloud` contains the PHP sources for the Nextcloud application alongside with data
- `/var/log/nginx` contains nginx logs for the application
- `/var/log/php84` contains PHP logs for the application