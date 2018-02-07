# docker-image

The docker image for running the tozti project. For now it also installs mongodb 
(for an image size of 213 mo), but in the near future we can imagine removing it
in order to use a docker image of a mongodb, thus reducing the size to 70mo.

## What is that?

The main file here is the Dockerfile, it constains commands to build an image (such as a linux image) which will be used to run tozti and install all the stuff you wouldn't want to install on your own computer (and seriously, you don't want it).
The image is in fact a sort of little linus server with only what is necessary to run tozti.

## Requirements to build & run the image

Docker, instruction to install (on ubuntu, but there are also versions for windows or macOS) on the website: https://store.docker.com/editions/community/docker-ce-server-ubuntu.
Make sure you download the community edition.

## Build the image

Just go to the repos' directory and run 

> sudo docker build -t <the name you want to give>

## Run the image

Once you have the docker image on your device (by downloading it or by building it), it has a name, let's say *tozti_image*
Then run:

> sudo docker run -p 4000:8080 tozti_image

This line launch the tozti server, and maps the port 8080 of the server to the port 4000 of your computer. The server can be accessed at the adress http://localhost:4000

## Installing extensions

To install extensions, you can use Docker's volumes
