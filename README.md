# docker-image

The docker image for running the tozti project.

## What is that?

The main file here is the Dockerfile, it constains commands to build an image (such as a linux image) which will be used to run tozti and install all the stuff you wouldn't want to install on your own computer (and seriously, you don't want it).
The image is in fact a sort of little linus server with only what is necessary to run tozti.

## Requirements to build & run the image

You will need `docker` and `docker-compose`.

## Build the image

Just go to the repos' directory and run 

```
docker build -t tozti --no-cache .
```

The `no-cache` option is here to force the image to be build from scratch.

## Run the image

To run tozti we are using `docker-compose`. To launch tozti, execute:

```
docker-compose up
```

To stop a running instance, type:

```
docker-compose down
```

This line launch the tozti server, and maps the port 8080 of the server to the port 8080 of your computer. The server can be accessed at the adress http://localhost:8080

## Installing extensions

If you want to install any extensions, just copy them in the folder `extensions/`. Don't forget to execute `npm install` or `npm run build` if the extensions needs it.
