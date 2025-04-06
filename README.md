# Build my docker images

## Images
1. adguardhome
2. vlmcsd

## Dependencies

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf remove podman buildah
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker opc
```

## Setup

```bash
sudo mkdir -p /opt/nginx/data
sudo chgrp docker /opt/nginx/data
```
