FROM alpine:3.18

RUN wget -c https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz -O - | tar -xz

ENTRYPOINT ["./portainer/portainer"]
