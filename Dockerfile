FROM ubuntu:20.04
# FROM python:3.7.10-slim-buster

# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt

COPY . .

CMD [ "/bin/sh" ]
