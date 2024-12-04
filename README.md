# quantum-caddy

A Caddy distribution which includes the Caddy reverse proxy `certmagic-s3` (for TLS/SSL certificate storage) and `caddy-docker-proxy` (for service discovery via labels on Docker Swarm/Compose).

Modules/plugins:

* [certmagic-s3](https://github.com/ss098/certmagic-s3)
* [caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy/)

## Images

Images are available on Github or on our registry, and free to use for anyone. To download and use an image:

```sh
$ docker pull r.planetary-quantum.com/quantum-public/caddy@TAG
```

> Note: The docker tags match release tags in this repository. The follow the format of `vCADDY+pq.X`.