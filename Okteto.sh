#!/bin/bash

apt-get update -y && apt-get upgrade -y && apt-get install wget curl nano -y
apt-get install tor -y
sed -i 's\#SocksPort 9050\SocksPort 9050\ ' /etc/tor/torrc
sed -i 's\#ControlPort 9051\ControlPort 9051\ ' /etc/tor/torrc
sed -i 's\#HashedControlPassword\HashedControlPassword\ ' /etc/tor/torrc
sed -i 's\#CookieAuthentication 1\CookieAuthentication 1\ ' /etc/tor/torrc
sed -i 's\#HiddenServiceDir /var/lib/tor/hidden_service/\HiddenServiceDir /var/lib/tor/hidden_service/\ ' /etc/tor/torrc
sed -i '72s\#HiddenServicePort 80 127.0.0.1:80\HiddenServicePort 12345 127.0.0.1:12345\ ' /etc/tor/torrc
sed -i '73s\#HiddenServicePort 22 127.0.0.1:22\HiddenServicePort 22 127.0.0.1:22\ ' /etc/tor/torrc
sed -i '74 i HiddenServicePort 8080 127.0.0.1:8080' /etc/tor/torrc
sed -i '75 i HiddenServicePort 4000 127.0.0.1:4000' /etc/tor/torrc
sed -i '76 i HiddenServicePort 8000 127.0.0.1:8000' /etc/tor/torrc
tor > tor.log &
wget https://github.com/coder/code-server/releases/download/v4.9.1/code-server_4.9.1_amd64.deb
dpkg -i code-server_4.9.1_amd64.deb
code-server --bind-addr 127.0.0.1:12345 >> vscode.log &
rm -rf code-server_4.9.1_amd64.deb
apt-get update && apt-get upgrade -y 
cat /var/lib/tor/hidden_service/hostname && sed -n '3'p ~/.config/code-server/config.yaml

apt install firefox mate-system-monitor  git lxde tightvncserver wget   -y
wget https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz
tar -xvf v1.2.0.tar.gz
mkdir  /root/.vnc
echo 'uncleluo' | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
cp /noVNC-1.2.0/vnc.html /noVNC-1.2.0/index.html
echo 'cd /root' >>/luo.sh
echo "su root -l -c 'vncserver :2000 ' "  >>/luo.sh
echo 'cd /noVNC-1.2.0' >>/luo.sh
echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/luo.sh
echo root:laoluoshushu|chpasswd
chmod 755 /luo.sh
./luo.sh
