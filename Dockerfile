FROM    ubuntu
MAINTAINER Antonio Terreno "antonio.terreno@gmail.com"

RUN rm /etc/apt/sources.list
RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list

RUN apt-get update
RUN apt-get install openjdk-7-jre-headless -y 
RUN apt-get install supervisor -y

RUN mkdir -p /var/log/supervisor  

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD cloj.jar /opt/cloj.jar

ADD start.sh /opt/start.sh
RUN chmod +x /opt/start.sh

CMD ["/usr/bin/supervisord"]