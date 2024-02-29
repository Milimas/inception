FROM alpine:3.18

RUN apk add --no-cache --update redis

ENTRYPOINT ["redis-server"]
CMD ["--protected-mode", "no"]

