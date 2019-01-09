# Dockerfile for Ubuntu 18.04 and Oracle Java 8
FROM ubuntu:18.04
MAINTAINER davigotxi

# Allows to add apt repositories
RUN apt-get update && apt-get -y upgrade && apt-get -y install software-properties-common
# Add java repo
RUN add-apt-repository ppa:webupd8team/java -y && apt-get update

# Install Java 8
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && apt-get install -y oracle-java8-installer oracle-java8-set-default

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH $JAVA_HOME/bin:$PATH
