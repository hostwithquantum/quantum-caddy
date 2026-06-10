ARG CADDY_VERSION=2.11.4

FROM caddy:${CADDY_VERSION}-builder AS builder

ARG CDP_VERSION=v2.12.1

RUN xcaddy build \
    --with github.com/ss098/certmagic-s3 \
    --with github.com/lucaslorentz/caddy-docker-proxy@${CDP_VERSION}

FROM caddy:${CADDY_VERSION}

ARG CADDY_VERSION
ARG CDP_VERSION

LABEL org.opencontainers.image.description="A Caddy reverse proxy with caddy-docker-proxy for service discovery via labels and s3 storage for certmagic."
LABEL org.opencontainers.image.source="https://github.com/hostwithquantum/quantum-caddy"
LABEL org.opencontainers.image.version="${CADDY_VERSION}"
LABEL com.quantum.caddy.version="${CADDY_VERSION}"
LABEL com.quantum.caddy-docker-proxy.version="${CDP_VERSION}"

#ENV S3_BUCKET ""
#ENV S3_ACCESS_ID ""
#ENV S3_SECRET_KEY ""

# optional
#ENV S3_HOST "s3.storage.planetary-networks.de"
#ENV S3_PREFIX ""
#ENV S3_INSECURE "false"

WORKDIR /
ADD . .

WORKDIR /srv

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

ENTRYPOINT [ "/usr/bin/caddy" ]
CMD ["docker-proxy", "--caddyfile-path=/etc/quantum-caddy/Caddyfile", "--ingress-networks=public"]
