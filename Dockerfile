FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

#Make sure ubuntu is up-to-date and install necessary packages
RUN sed -i "s/\# deb-src/deb-src/g" /etc/apt/sources.list && apt-get update && apt-get -y upgrade && apt-get -y install build-essential supervisor logrotate locales ucspi-tcp wget groff-base daemontools git-core libmysqlclient-dev nginx fcgiwrap libbg-dev ssl-cert automake

COPY assets/setup/ /app/setup/
COPY assets/config/ /app/setup/config/
#RUN chmod 755 /app/setup/install.sh
#RUN /app/setup/install.sh

COPY assets/init /app/init
RUN chmod 755 /app/init

EXPOSE 25
EXPOSE 80
EXPOSE 110
EXPOSE 995
EXPOSE 143
EXPOSE 993

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
