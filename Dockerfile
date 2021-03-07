FROM ubuntu:20.04

# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl \
    wget \
    openjdk-8-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

RUN ["apt-get", "install", "-y", "nano"]

COPY . ./home

CMD [ "/bin/sh" ]
