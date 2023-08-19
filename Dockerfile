FROM debian:12

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends zoneminder

CMD ["/usr/bin/zmpkg.pl", "start"]
