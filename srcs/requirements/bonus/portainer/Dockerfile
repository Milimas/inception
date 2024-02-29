FROM alpine:3.18

ADD https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz /portainer.tar.gz
RUN tar -xzf /portainer.tar.gz

ENTRYPOINT ["./portainer/portainer"]
