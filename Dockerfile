FROM alpine:edge

ARG AUUID="cdfa2b90-b00d-4c66-89b3-c9339e6df51b"
ARG CADDYIndexPage="https://github.com/kkkewd/Html/raw/main/S-html.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
