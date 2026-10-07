.PHONY: build clean e2e publish run-dev

image := r.planetary-quantum.com/quantum-public/caddy:dev

# builds both flavors, see docker-bake.hcl
# single flavor: make build target=caddy-caddyscope
target ?= default

build:
	docker buildx bake --load $(target)

clean:
	docker stack rm caddy-local-dev

publish: build
	docker push $(image)
	docker push $(image)-caddyscope

run-dev: build
	docker network create \
		--attachable \
		--scope swarm \
		public || true
	docker stack deploy \
		--compose-file docker-compose.yml \
		caddy-local-dev

e2e: build publish
	cd e2e \
		&& quantum-cli stack update --create \
			--stack caddy-dev \
		&& quantum-cli stack update --create \
			--environment test \
			--stack caddy-whoami

test: build
	docker run --rm -it \
		--name caddy-dev-local \
		-p 80:80 \
		-p 2019:2019 \
		-e ADMIN_UI_URL=http://admin-api.quantum.127.0.0.1.nip.io \
		-v /var/run/docker.sock:/var/run/docker.sock:ro \
		-v $(CURDIR)/rootfs/etc/quantum-caddy:/etc/quantum-caddy \
		$(image)
