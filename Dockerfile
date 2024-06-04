FROM debian:12
LABEL org.opencontainers.image.source https://github.com/phsm/zoneminder

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zoneminder

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ffmpeg iproute2 procps supervisor

COPY zoneminder.conf /etc/apache2/conf-enabled/zoneminder.conf

RUN chmod 644 /etc/zm/zm.conf && \
    chown root:www-data /etc/zm/zm.conf && \
    chown -R www-data:www-data /var/cache/zoneminder/ && \
    chmod 755 /var/cache/zoneminder/ && \
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod expires && \
    a2enmod cgi

COPY start_zm.sh /start_zm.sh
COPY start_apache2.sh /start_apache2.sh
COPY services.conf /etc/supervisor/conf.d/services.conf

RUN chmod +x /start_zm.sh && \
    chmod +x /start_apache2.sh

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
