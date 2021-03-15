FROM debian:buster

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install wget
RUN apt-get -y install nginx
