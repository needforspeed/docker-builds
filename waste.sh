#!/bin/bash

echo "Build vlmcsd"
docker rmi vlmcsd
cd /home/opc/docker-builds && docker build -f Dockerfile.vlmcsd . -t vlmcsd && cd -
docker save -o /opt/nginx/data/vlmcsd.tar vlmcsd
chmod 644 /opt/nginx/data/vlmcsd.tar

ADGUARDHOME_VERSION=$(curl -s "https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
echo "Build Adguardhome ${ADGUARDHOME_VERSION}"
docker rmi adguardhome
cd docker-builds
curl -L -o AdGuardHome_linux_amd64.tar.gz "https://github.com/AdguardTeam/AdGuardHome/releases/download/${ADGUARDHOME_VERSION}/AdGuardHome_linux_amd64.tar.gz"
tar -zxf AdGuardHome_linux_amd64.tar.gz
docker build -f Dockerfile.adguardhome . -t adguardhome
cd -
docker save -o /opt/nginx/data/adguardhome.tar adguardhome
chmod 644 /opt/nginx/data/adguardhome.tar
