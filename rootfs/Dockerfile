FROM caddy:2.8.4-builder as builder

ARG CDP_VERSION=v2.9.1

RUN xcaddy build \
    --with github.com/ss098/certmagic-s3 \
    --with github.com/lucaslorentz/caddy-docker-proxy@${CDP_VERSION}

FROM caddy:2.8.4

LABEL org.opencontainers.image.description "A Caddy reverse proxy with s3 storage for certmagic, service discovery via labels"
LABEL org.opencontainers.image.source="https://github.com/hostwithquantum/quantum-caddy"

ENV S3_BUCKET ""
ENV S3_ACCESS_ID ""
ENV S3_SECRET_KEY ""

# optional
ENV S3_HOST "s3.storage.planetary-networks.de"
ENV S3_PREFIX ""
ENV S3_INSECURE "false"

WORKDIR /
ADD . .

WORKDIR /srv

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT [ "/usr/bin/caddy" ]
CMD ["docker-proxy", "--caddyfile-path=/etc/quantum-caddy/Caddyfile", "--ingress-networks=public"]
