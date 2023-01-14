FROM ubuntu:20.04

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get update && apt-get upgrade -y
RUN apt-get install tzdata locales -y
RUN locale-gen en_US.UTF-8
RUN apt-get install xvfb x11-utils x11vnc qemu wget curl nano -y
RUN chmod 755 entrypoint.sh
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
