FROM    ubuntu:12.04
MAINTAINER Antonio Terreno "antonio.terreno@gmail.com"

RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install openjdk-7-jre-headless -y 
RUN apt-get install supervisor openssh-server -y

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor  

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN echo 'root:cloj' | chpasswd

ADD cloj.jar /opt/cloj.jar

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

EXPOSE 3030 22
CMD ["/usr/bin/supervisord"]