FROM ubuntu:20.04

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get update && apt-get upgrade -y
RUN apt-get install tzdata locales -y
RUN locale-gen en_US.UTF-8
RUN apt-get install xvfb x11-utils x11vnc qemu wget curl nano -y
RUN curl -skLo gdown https://raw.githubusercontent.com/kmille36/GoogleDriveCurl/main/gdown && chmod +x gdown && bash gdown Porteus-CINNAMON.qcow2 1-Easy8BrLr5tQ2r4pe9HcetCJ12QUOsy
RUN wget https://raw.githubusercontent.com/314257smcag2/windows-images/master/image/entrypoint.sh

COPY Porteus-CINNAMON.qcow2 /
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
