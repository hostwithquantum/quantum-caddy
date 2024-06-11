FROM caddy:2.8.4-builder as builder

RUN xcaddy build \
    --with github.com/ss098/certmagic-s3 \
    --with github.com/lucaslorentz/caddy-docker-proxy@v2.9.1

FROM caddy:2.8.4

LABEL org.opencontainers.image.description "A Caddy reverse proxy with s3 storage for certmagic, service discovery via labels"

ENV AWS_ENDPOINT=https://s3.storage.planetary-networks.de

ENV AWS_BUCKET=""
ENV AWS_ACCESS_KEY_ID=""
ENV AWS_SECRET_ACCESS_KEY=""

WORKDIR /
ADD . .

WORKDIR /srv

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT [ "/usr/bin/caddy" ]
CMD ["docker-proxy", "--caddyfile-path=/etc/quantum-caddy/Caddyfile", "--ingress-networks=public"]
