FROM bash:alpine3.19

RUN apk update && apk add parallel aria2 git
COPY . /docker
RUN chmod +x /docker/download.sh
ENTRYPOINT ["/docker/download.sh"]
