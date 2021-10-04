FROM ubuntu:latest

RUN apt-get -y update
RUN apt-get install python3 -y

MAINTAINER "kvmuralikrishna1993"
WORKDIR /app

#install git and clone repo

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/kvmuralikrishna1993/whitehorse.git

#copy files to working directory

RUN cp ./whitehorse/final_version/requirements.txt ./
RUN cp ./whitehorse/final_version/whitehorse.py ./
RUN rm -r whitehorse

#install dependencies
RUN apt-get -y install python3-pip
RUN pip3 install -r /app/requirements.txt

#run app
CMD python whitehorse.py