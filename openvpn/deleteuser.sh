#!/bin/bash
read -p "Delete username: " DNAME
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa revoke $DNAME
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn easyrsa gen-crl
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn rm -f /etc/openvpn/pki/reqs/"$DNAME".req
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn rm -f /etc/openvpn/pki/private/"$DNAME".key
docker run -v /mnt/docker-data/openvpn:/etc/openvpn --rm -it kylemanna/openvpn rm -f /etc/openvpn/pki/issued/"$DNAME".crt
# docker restart openvpn
