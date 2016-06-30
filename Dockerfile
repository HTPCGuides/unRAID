FROM phusion/baseimage:0.9.18
MAINTAINER Desgyz (Audi Bailey) for HTPCGuides

ENV DEBIAN_FRONTEND="noninteractive"

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# chfn workaround - Known issue within Dockers
RUN ln -s -f /bin/true /usr/bin/chfn

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache
RUN echo "deb http://shell.ninthgate.se/packages/debian wheezy main" > /etc/apt/sources.list.d/plexmediaserver.list
RUN curl http://shell.ninthgate.se/packages/shell.ninthgate.se.gpg.key | apt-key add -
RUN apt-get -q update
RUN apt-get -qy dist-upgrade
RUN apt-get -q update
RUN apt-get install -qy plexmediaserver
RUN apt-get -y autoremove
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*

VOLUME ["/config","/data"]

EXPOSE 32400

ADD ./start.sh /start.sh
RUN chmod +x /start.sh
RUN chmod 755 /start.sh

CMD ["/start.sh"]
