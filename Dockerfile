FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git
RUN apt-get install -y python3
RUN apt-get install -y wget 
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN git clone https://github.com/tozti/core.git

WORKDIR core/


# Make port 8080 available to the world outside this container
EXPOSE 8080

ENTRYPOINT git pull && pip3 install . && run_tozti