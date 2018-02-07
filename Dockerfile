FROM mhart/alpine-node:9.5

RUN apk add --no-cache \
    git \
    python3 \
    wget \
    py-pip \
    mongodb \
    libsodium && git clone https://github.com/tozti/tozti && apk del git
WORKDIR tozti/
RUN npm install && npm run build && rm -r node_modules && pip3 install -r requirements.txt
VOLUME /data/db
EXPOSE 8080 27017 

ENTRYPOINT mongod & python3 -m tozti dev
