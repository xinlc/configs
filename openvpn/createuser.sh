#!/bin/bash
read -p "please your username: " NAME
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $NAME nopass
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $NAME > "$NAME".ovpn
# docker restart openvpn
