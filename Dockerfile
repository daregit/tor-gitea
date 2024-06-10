FROM alpine:latest

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add tor sudo

RUN echo "HiddenServiceDir /var/lib/tor/gitea_service" >>/etc/tor/torrc
RUN echo "HiddenServicePort 22 gitea:22" >>/etc/tor/torrc
RUN echo "HiddenServicePort 80 caddy:80" >>/etc/tor/torrc
RUN echo "HiddenServicePort 443 caddy:443" >>/etc/tor/torrc

ENTRYPOINT ["sh", "-c", "chown -R tor:nogroup /var/lib/tor && sudo -u tor tor"]
