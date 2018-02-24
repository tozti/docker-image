# first start from a container with node
FROM mhart/alpine-node:9.5

# clone and build the js part of tozti
RUN apk add --no-cache \
    git && \
    git clone https://github.com/tozti/tozti && apk del git
WORKDIR tozti/
RUN npm install && npm run build && rm -r node_modules


# change of distro to a simple alpine linux
# this avoid us to decrease the size of the container
# (it removes node and other stuffs not needed anymore)
#FROM alpine:3.6
FROM jfloff/alpine-python:recent-slim
WORKDIR /tozti
COPY --from=0 /tozti .
# install python3, pip and install the requirements. Then remove pip as 
# it's not needed anymore
#RUN apk add --no-cache python3 py-pip libsodium \
#    && pip3 install -r requirements.txt \
#    && apk del py-pip 
RUN apk add --no-cache libsodium-dev \
    && apk add --no-cache --virtual .pynacl_deps build-base python3-dev libffi-dev \
    && SODIUM_INSTALL=system pip install pynacl \
    && pip3 install -r requirements.txt \
    && apk del .pynacl_deps
COPY config-docker.toml config.toml
# we could also remove ncurses-terminfo-base, ncurses-terminfo, ncurses-libs 
# or sqlite-libs to reduce the size by 10mo. But these packages (although    
# useless for us), are dependencies of python3. So removing them is quite
# annoying and quite hacky.


EXPOSE 8080

# start mongodb in the background
ENTRYPOINT python3 -m tozti dev
