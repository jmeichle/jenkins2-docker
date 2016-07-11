FROM jenkinsci/jenkins:2.0-beta-1
MAINTAINER shashikant.jagtap@aol.co.uk

USER root

# prep and install docker
RUN apt-get update
RUN apt-get install -y apt-transport-https ca-certificates sudo libyaml-dev libyaml-0-2 libssl-dev libssl1.0.0 libffi-dev libffi6 build-essential libgmp-dev libgmp10 libmysqlclient-dev libsqlite3-dev 

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN apt-get update
RUN apt-get install docker-engine -y
RUN usermod -aG docker jenkins
RUN gpasswd -a jenkins docker

# Prep Jenkins Directorieos
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

USER jenkins

# Set Defaults
ENV JAVA_OPTS="-Xmx8192m"

