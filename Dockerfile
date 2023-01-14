FROM ubuntu:20.04

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get update && apt-get upgrade -y
RUN apt-get install tzdata locales -y
RUN locale-gen en_US.UTF-8
RUN apt-get install xvfb x11-utils x11vnc qemu wget curl nano -y

RUN echo "curl -o windows11lite.qcow2 https://app.vagrantup.com/thuonghai2711/boxes/WindowsQCOW2/versions/1.0.0/providers/qemu22000.box "  >>/QEMU.sh

COPY entrypoint.sh /

RUN chmod 755 QEMU.sh
RUN chmod 755 entrypoint.sh

CMD ./QEMU.sh
ENTRYPOINT ["/entrypoint.sh"]
