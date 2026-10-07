# quantum-caddy

A Caddy distribution which includes the Caddy reverse proxy `certmagic-s3` (for TLS/SSL certificate storage) and `caddy-docker-proxy` (for service discovery via labels on Docker Swarm/Compose).

Modules/plugins:

* [certmagic-s3](https://github.com/ss098/certmagic-s3)
* [caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy/)
* (optional) [caddyscope](https://github.com/Luzilla/caddyscope)

## Flavors

We offer two flavors of our Caddy distribution, one has Caddyscope enabled (`-caddyscope`).

> [!NOTE]
> Release tags in this repository follow the format `vCADDY+pq.X`. Docker tags cannot contain `+`, so the image tag is `vCADDY-pq.X` (e.g. `v2.11.4+pq.1` becomes `v2.11.4-pq.1`).

### Images

Images are available on Github or on our registry, and free to use for anyone. To download and use an image:

```sh
$ docker pull r.planetary-quantum.com/quantum-public/caddy:TAG
$ docker pull ghcr.io/hostwithquantum/quantum-caddy:TAG
```

With Caddyscope:

```sh
$ docker pull r.planetary-quantum.com/quantum-public/caddy:TAG-caddyscope
$ docker pull ghcr.io/hostwithquantum/quantum-caddy:TAG-caddyscope
```
