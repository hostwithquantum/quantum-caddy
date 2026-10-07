variable "IMAGE" {
  default = "r.planetary-quantum.com/quantum-public/caddy"
}

variable "TAG" {
  default = "dev"
}

group "default" {
  targets = ["caddy", "caddy-caddyscope"]
}

target "caddy" {
  context   = "rootfs"
  target    = "caddy"
  platforms = ["linux/amd64"]
  tags      = ["${IMAGE}:${TAG}"]
}

target "caddy-caddyscope" {
  inherits = ["caddy"]
  target   = "caddy-caddyscope"
  tags     = ["${IMAGE}:${TAG}-caddyscope"]
}
